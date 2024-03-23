angular.module('app', [])
 
.controller('Controller',  ['$scope', '$http', function ($scope, $http) {
	$http({
		method: 'JSONP',
		url: 'data.jsonp'
	}).then(function(response) {
		$scope.data = response.data;
		$scope.selectedCountry = response.data.countries[0].id;
		$scope.selectedYear = String(response.data.years[0]);
	});
}]);