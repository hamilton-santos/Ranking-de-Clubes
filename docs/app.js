angular.module('app', [])
 
.controller('Controller',  ['$scope', '$http', function ($scope, $http) {
	$scope.ready = false;
	$http({
		method: 'JSONP',
		url: 'data.jsonp'
	}).then(function(response) {
		$scope.data = response.data;
		$scope.selectedCountry = response.data.countries[0].id;
		$scope.selectedYear = response.data.seasons[0].year;
		$scope.selectedRankType = response.data.rankTypes[response.data.rankTypes.length-1].name;
	}).finally(function() {
		$scope.ready = true;
	});
}]);