var cmtFrmElem = document.querySelector('#cmtFrm');

function regCmt() {
	var cmtVal = cmtFrmElem.cmt.value;
	console.log(cmtFrmElem.dataset.iboard);
	
	var param = {
		iboard: cmtFrmElem.dataset.iboard, cmt = cmtVal
		}
}
//서버에게 등록
function regAjax(param) {
	const init = {
		method: 'POST',
		body: new URLSearchParams(param)
	};
	
	fetch('cmtInSel', init)
	.then(function(res) {
		return res.json();
	})
	.then(function(myJson) {
		console.log(myJson);
		
		switch(MyJson.result) {
			case 0:
				alert('등록실패');
			case 1:
			cmtFrmElem.cmt.value = ''; /*댓글창을 작성한 뒤에 refresh하는 기능*/
				alert('등록완료');
			break;
		}
	});
}

//서버 댓글 리스트 자료 달라고 요청하는 함수
function getListAjax() {
	var iboard = cmtFrmElem.dateset.iboard;
	
	fetch('cmtInsSel?iboard=' + iboard)
	.then(function(res) {
		return res.json();
	})
	.then(function(MyJson) {
		console.log(myJson);
	});
	
}

getListAjax(); // 이 파일이 임포트되면 함수 1회 호출!




















