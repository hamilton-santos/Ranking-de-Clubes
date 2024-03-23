angular.module('app', [])
 
.controller('Controller',  ['$scope', '$http', function ($scope, $http) {
	$http({
		method: 'JSONP',
		url: 'data.jsonp'
	}).then(function(response) {
		$scope.data = response.data;
		console.log(response.data);
		$scope.selectedCountry = response.data.countries[0].id;
		$scope.selectedYear = response.data.seasons[0].year;
		$scope.selectedRankType = response.data.rankTypes[0].name;
	});
}]);