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
		var now = String(moment().format('YYYY-MM-DD'));
		var dueCheck = String(node.tag('due'));
		if (dueCheck == now) {	
		node.addTag('today');
		}
		})	  
      tree.endUpdates();

    }" with options {}
	end tell
end tell
