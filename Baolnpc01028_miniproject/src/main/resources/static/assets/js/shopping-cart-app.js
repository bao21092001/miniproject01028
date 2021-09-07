const app = angular.module("shopping-cart-app",[]);

app.controller("shopping-cart-ctrl", function($scope, $http){
	$scope.create=function(){
		var item = angular.copy($scope.form);
		$http.post('/rest/accounts',item).then(resp => {
			alert("Thêm mới thành công!");
		}).catch(error => {
			alert("Lỗi Thêm mới !");
			console.log("Error", error);
		})
	}
	$scope.imageChanged=function(files){
		var data =  new FormData();
		data.append('file',files[0]);
		$http.post('/rest/upload/images',data,{
			transformRequest: angular.identity,
			headers:{'Content-Type':undefined}
		}).then(resp => {
			$scope.form.photo = resp.data.name;
		}).catch(error => {
			alert("Lỗi upload hình ảnh");
			console.log("Error",error);
		}) 
	}
	$scope.cart = {
		items:[],
		
		/*Them san pham vao gio hang*/
		add(id){
			var item = this.items.find(item => item.id == id);
			if(item){
				item.qty++;
				this.saveToLocalStorage();
			}
			else{
				$http.get(`/rest/products/${id}`).then(resp =>{
					resp.data.qty = 1;
					this.items.push(resp.data);
					this.saveToLocalStorage();
				})
			}
		},
		
		/*Xoa san pham vao gio hang*/
		remove(id){
			var index = this.items.findIndex(item => item.id == id);
			this.items.splice(index, 1);
			this.saveToLocalStorage();
		},
		
		/*Xoa sach cac mat hang trong gio hang*/
		clear(){
			this.items = []
			this.saveToLocalStorage();
		},
		
		/*Tính thành tiền của 1 sản phẩm*/
		amt_of(item){},
		
		/*Tính tổng số lượng các mặt hàng có trong giỏ*/
		get count(){
			return this.items
			.map(item => item.qty)
			.reduce((total, qty) => total += qty, 0);
		},
		
		/*Tổng thành tiền các mặt hàng trong giỏ*/
		get amount(){
			return this.items
			.map(item => item.qty * item.price)
			.reduce((total, qty) => total += qty, 0);
		},
		
		/*Lưu giỏ hàng vào local storage*/
		saveToLocalStorage(){
			var json = JSON.stringify(angular.copy(this.items));
			localStorage.setItem("cart", json);
		},
		
		/*Đọc giỏ hàng từ local storage*/
		loadFromLocalStorage(){
			var json = localStorage.getItem("cart");
			this.items = json ? JSON.parse(json) : [];
		}		
	}
	$scope.cart.loadFromLocalStorage();
	
	$scope.order = {
		createDate: new Date(),
		address: "",
		account: {username: $("#username").text()},
		get orderDetails(){
			return $scope.cart.items.map(item =>{
				return {
					product:{id: item.id},
					price: item.price,
					quantity: item.qty
				}			
			});
		},
		purchase(){
			var order = angular.copy(this);
			
			$http.post("/rest/orders", order).then(resp => {
				alert("Đặt hàng thành công!");
				$scope.cart.clear();
				location.href = "/order/detail/" + resp.data.id;
			}).catch(error => {
				alert("Đặt hàng lỗi!")
				console.log(error)				
			})
		}
		
	}
	
})