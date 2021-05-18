function moveToDetail(iboard) {
	console.log('iboard : ' + iboard);
	location.href='/iboard/detail?iboard=' + iboard;
}
function moveToBack() {
	history.back();
}

