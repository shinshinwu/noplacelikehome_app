"use strict";

var appControllers = angular.module("appControllers", []);

noPlaceLikeHome.controller("FormController", ["$scope", "$http", "$timeout", "$state",
  function($scope, $http, $timeout, $state){

    $scope.formData = {}
    $scope.error = "";

    $scope.submitAddressInfo = function(formData){

      $http.post('/api/offer', formData).success(function(response){
        console.log(response);
        $scope.recommendedOffer = response;
        if(response.error){
          $scope.error = "Address not found"
        } else{
          console.log("go");
          $state.go("form.offer");
        }
          
        
      })

    }

  }]);