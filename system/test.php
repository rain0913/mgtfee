<!DOCTYPE html>
<html>

  <head>
    <script data-require="jquery@2.0.3" data-semver="2.0.3" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
    <!--<link rel="stylesheet" href="style.css" />-->
  <script>
    // Code goes here

    $(document).ready(function(){

        $(".grid thead td").click(function(){
          showFilterOption(this);
        });

    });

    var arrayMap = {};

    function showFilterOption(tdObject){
      var filterGrid = $(tdObject).find(".filter");

      if (filterGrid.is(":visible")){
        filterGrid.hide();
        return;
      }

      $(".filter").hide();

      var index = 0;
      filterGrid.empty();
      var allSelected = true;
      filterGrid.append('<div><input id="all" type="checkbox" checked>Select All</div>');

      var $rows = $(tdObject).parents("table").find("tbody tr");


      $rows.each(function(ind, ele){
        var currentTd = $(ele).children()[$(tdObject).attr("index")];
        var div = document.createElement("div");
        div.classList.add("grid-item")
        var str = $(ele).is(":visible") ? 'checked' : '';
        if ($(ele).is(":hidden")){
          allSelected = false;
        }
        div.innerHTML = '<input type="checkbox" '+str+' >'+currentTd.innerHTML;
        filterGrid.append(div);
        arrayMap[index] = ele;
        index++;
      });

      if (!allSelected){
        filterGrid.find("#all").removeAttr("checked");
      }

      filterGrid.append('<div><input id="close" type="button" value="Close"/><input id="ok" type="button" value="Ok"/></div>');
      filterGrid.show();

      var $closeBtn = filterGrid.find("#close");
      var $okBtn = filterGrid.find("#ok");
      var $checkElems = filterGrid.find("input[type='checkbox']");
      var $gridItems = filterGrid.find(".grid-item");
      var $all = filterGrid.find("#all");

      $closeBtn.click(function(){
        filterGrid.hide();
        return false;
      });

      $okBtn.click(function(){
        filterGrid.find(".grid-item").each(function(ind,ele){
          if ($(ele).find("input").is(":checked")){
            $(arrayMap[ind]).show();
          }else{
            $(arrayMap[ind]).hide();
          }
        });
        filterGrid.hide();
        return false;
      });

      $checkElems.click(function(event){
        event.stopPropagation();
      });

      $gridItems.click(function(event){
        var chk = $(this).find("input[type='checkbox']");
        $(chk).prop("checked",!$(chk).is(":checked"));
      });

      $all.change(function(){
        var chked = $(this).is(":checked");
        filterGrid.find(".grid-item [type='checkbox']").prop("checked",chked);
      })

      filterGrid.click(function(event){
        event.stopPropagation();
      });

      return filterGrid;
    }
    </script>
  <style>
  /* Styles go here */

table thead tr td{
  background-color : gray;
  min-width : 100px;
  position: relative;
}

.filter{
  position:absolute;
  border: solid 1px;
  top : 20px;
  background-color : white;
  width:100px;
  right:0;
  display:none;
}
</style>
  </head>

  <body>
    <table class="grid">
      <thead>
        <tr>
          <td index=0>Name
            <div class="filter"></div>
          </td>
          <td index=1>Address
            <div class="filter"></div>
            </td>
          <td index=2>City
            <div class="filter"></div>
          </td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>first</td>
          <td>first add</td>
          <td>SDF dfd</td>
        </tr>
        <tr>
          <td>second</td>
          <td>second add</td>
          <td>SDF dfd</td>
        </tr>
        <tr>
          <td>third</td>
          <td>third add</td>
          <td>SDF dfd</td>
        </tr>
      </tbody>
    </table>
  </body>

</html>
