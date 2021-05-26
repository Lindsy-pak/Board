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
				getListAjax();
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
		makeCmtElemList(myJson);
	});
	
}

// ajax 로 화면 구현하기 위해서 보여주는 거 (서버로 부터 json형태로 객체로 만들어서 보여줄려고)
// 페이스북처럼 리프레쉬 없이 화면 만드는법 
function makeCmtElemList(data) { //list table을 html이 아닌 script로 만드는 방법
	var cmtListElem = document.querySelector('#cmtList');
	cmtListElem.innerHTML = ''; //지워주는 기능??
	//cmtListElem.innerTEXT = ''; -> 이것도 가능
	var tableElem = document.createElement('table');// 태그 다 만들수 있다 (a div ..등등)
	var trElemTitle = document.createElement('tr');
	var thElemCtnt = document.createElement('th');
	var thElemWriter = document.createElement('th');
	var thElemRegdate = document.createElement('th');
	var thElemBigo = document.createElement('th');
	
	thElemCtnt.innerText = '내용';
	thElemWriter.innerText = '작성자';
	thElemRegdate.innerText = '작성일';
	thElemBigo.innerText = '비고';
	
	trElemTitle.append(thElemCtnt);
	trElemTitle.append(thElemWriter);
	trElemTitle.append(thElemRegdate);
	trElemTitle.append(thElemBigo);
	
	tableElem.append(trElemTitle);
	cmtListElem.append(tableElem);
	
	var loginUserPk = cmtFrmElem.dataset.loginUserPk;
	
	//table에서 tr반복하는 부분
	//callback 함수로 부름 (내가 보낸 함수를 부르는 함수)
	data.forEach(function(item) { 
		var trElemItem = document.createElement('tr');
		var tdElem1 = document.createElement('td');
		var tdElem2 = document.createElement('td');
		var tdElem3 = document.createElement('td');
		var tdElem4 = document.createElement('td');
		
		tdElem1.append(item.cmt);
		tdElem2.append(item.writerNm);
		tdElem3.append(item.regdate);
		
		if(parseInt(loginUserPk) == item.iuser) { //내가 쓴 댓글만 수정 삭제 버튼이 뜬다 
			var delBtn = document.createElement('button');
			var modBtn = document.createElement('button');
			//첫번째 인자는 무슨 동작 했을 때 두번째 인자는 무슨 함수가 실행이 되는지 
			//삭제 버튼 클릭시
			delBtn.addEventListener('click', function() {
				delAjax(item.icmt);
			});
			
			delBtn.innerText = '삭제';
			modBtn.innerText = '수정';
			
			tdElem4.append(delBtn);
			tdElem4.append(modBtn);
		} 
		
		trElemCtnt.append(tdElem1);
		trElemCtnt.append(tdElem2);
		trElemCtnt.append(tdElem3);
		trElemCtnt.append(tdElem4);
		
		tableElem.append(trElemCtnt);
		cmtListElem.append(tableElem);
		
		
	});
}
function delAjax(icmt) {
	fetch('cmtdelUpd?icmt=' + icmt)//fetch: 메소드 호출(promise객체)
	.then(function(res) {//then이라는 키워드를 쓰는 이유 : 호출한거에서 (결과값).then 그리고 나서
		return res.json();
	})
	.then(function(data) {
		console.log(data);
		switch(data.result) {
			case 0:
				alert('댓글 삭제를 실패하였습니다.')
				break;
			case 1:
				
				break;
		}
	});
}


getListAjax(); // 이 파일이 임포트되면 함수 1회 호출!




















