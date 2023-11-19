
dragging = false;
crouch = false;

local mouse = libs.mouse;
local keyboard = libs.keyboard;
local server = libs.server;

function update (r)
	--server.update({id = "touch", text = r });
end

actions.down = function ()
	update("down");
end

actions.up = function ()
	update("up");
end

actions.tap = function ()
	update("tap");
	if (dragging) then
		dragging = false;
		mouse.dragend();
		mouse.up();
	else
		mouse.click("left");
	end
end

actions.double = function ()
	update("double");
	mouse.double("left");
end

actions.hold = function ()
	update("hold");
	mouse.down();
	mouse.dragbegin();
	dragging = true;
end

actions.minedown = function ()
	keyboard.down("`");
	mouse.down("left");
end

actions.mineup = function ()
	keyboard.up("`");
	mouse.up("left");
end

actions.tbup = function ()
	mouse.vscroll(-5);
end

actions.tbdown = function ()
	mouse.vscroll(5);
end

actions.clickstart = function ()
	mouse.down("left");
end

actions.clickend = function ()
	mouse.up("left");
end

actions.rclickstart = function ()
	mouse.down("right");
end

actions.rclickend = function ()
	mouse.up("right");
end

actions.delta = function  (id, x, y)
	update("delta: " .. x .. " " .. y);
	mouse.moveraw(x, y);
end

actions.left = function ()
	mouse.click("left");
end

actions.right = function ()
	mouse.click("right");
end

actions.run = function ()
	keyboard.stroke("w");
end

actions.rundown = function ()
	keyboard.down("w");
end

actions.runup = function ()
	keyboard.up("w");
end

actions.leftdown = function ()
	keyboard.down("a");
end

actions.leftup = function ()
	keyboard.up("a");
end

actions.rightdown = function ()
	keyboard.down("d");
end

actions.rightup = function ()
	keyboard.up("d");
end

actions.reversedown = function ()
	keyboard.down("s");
end

actions.reverseup = function ()
	keyboard.up("s");
end

actions.inventory = function ()
	keyboard.stroke("e");
end

actions.menu = function ()
	keyboard.stroke("escape");
end

actions.quests = function ()
	keyboard.stroke("z");
end

actions.crouchtoggle = function ()
	if (crouch) then
		crouch = false;
		keyboard.up("lshift");
		server.update({id = "crouchbtn", color = "green"});
	else
		crouch = true;
		keyboard.down("lshift");
		server.update({id = "crouchbtn", color = "red"});
	end
end

tid = -1;
actions.twerk_start = function ()
	tid = libs.timer.interval(function ()
		keyboard.down("lshift");
		os.sleep(80);
		keyboard.up("lshift");
	end, 150);
end

actions.twerk_stop = function ()
	libs.timer.cancel(tid);
end
