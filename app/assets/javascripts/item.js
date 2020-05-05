$(document).on('turbolinks:load', ()=> {
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${num}][image]"
                    id="item_images_attributes_${num}_image"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  const dele = ()=> {
    const html = `<div class="js-remove" id="aaaa">削除</div>
                  </div>`;
    return html;
  }

  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px" id="test">`;
    console.log(html)
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  
  $('.hidden-destroy').hide();
  
  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    console.log(file)
    const blobUrl = window.URL.createObjectURL(file);
    console.log(blobUrl)
    
    //すでに選んであるファイルを変更した場合
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('image', blobUrl);
      // 新規投稿した際にプレビューidの下に画像を入れ、イメージボックスidの下に新しいファイルフィールドを作る。そのせいで画像の下ではなく真ん中の下にファイルを選択してくださいとでる。やりたいのは画像の下に削除を移動したい
    } else {
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // $('#test').append(dele);
      $('#image-box').append(buildFileField(fileIndex[0]));
      console.log(fileIndex);

      $('label.item-image-title-box-input-1').attr("for", `item_images_attributes_${targetIndex}_image`)
      $('.item-image-title-box-input-1-text').text('')
      // $('.js-remove').remove()
      
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });
  
  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });


  $(function(){
    $('#price_calc').on('input', function(){   //リアルタイムで表示したいのでinputを使う｡入力の度にイベントが発火するようになる｡
      var data = $('#price_calc').val(); // val()でフォームのvalueを取得(数値)
      var profit = Math.round(data * 0.9)  // 手数料計算を行う｡dataにかけているのが0.9なのは単に引きたい手数料が10%のため｡
      var fee = (data - profit) // 入力した数値から計算結果(profit)を引く｡それが手数料となる｡
      $('.right_bar').html(fee) //  手数料の表示｡html()は追加ではなく､上書き｡入力値が変わる度に表示も変わるようにする｡
      $('.right_bar').prepend('¥') // 手数料の前に¥マークを付けたいので
      $('.right_bar_2').html(profit)
      $('.right_bar_2').prepend('¥')
      $('#price').val(profit) // 計算結果を格納用フォームに追加｡もし､入力値を追加したいのなら､今回はdataを引数に持たせる｡
      if(profit == '') {   // もし､計算結果が''なら表示も消す｡
      $('.right_bar_2').html('');
      $('.right_bar').html('');
      }
    })
  })



});




