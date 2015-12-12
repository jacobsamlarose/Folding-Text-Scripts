tell application "FoldingText"
	tell front document
		evaluate script "function(editor, options) {
		      var Node = require('ft/core/node').Node,
        tree = editor.tree();

      tree.beginUpdates();
      tree.ensureClassified();

      Node.commonAncestorsForNodes(tree.evaluateNodePath('//@tomorrow except //@line:text = Archive://@tomorrow')).forEachNodeInSet(function(node) {
		node.removeTag('tomorrow');
		node.addTag('today');

		})

	Node.commonAncestorsForNodes(tree.evaluateNodePath('//@due')).forEachNodeInSet(function(node) {
		var now = moment().format('YYYY-MM-DD');
		var dueCheck = new Date(node.tag('due'));
		if (moment(dueCheck).isSame(now)) {	
		node.addTag('today');
		}
		if (moment(dueCheck).isBefore(now)) {
		node.addTag('overdue');
		}
		})	  

	Node.commonAncestorsForNodes(tree.evaluateNodePath('//@lastdone')).forEachNodeInSet(function(node) {
		var lassitude = moment().subtract(2, 'days');
		var now = moment(lassitude).format('YYYY-MM-DD');
		var dLastDone = moment(node.tag('lastdone')).format('YYYY-MM-DD');
		if (moment(dLastDone).isBefore(now)) {
		node.addTag('overdue');
		}
		})	  
      tree.endUpdates();

    }" with options {}
	end tell
end tell
