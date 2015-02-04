/**
 * Window main class file
 *
 * This file is part of x9-notification client.
 *
 * Copyright (C) 2014 Diego Rubin <contato@diegorubin.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

using Gtk;

namespace com.diegorubin.x9_notification.views {

  public class WindowMain : Window {

    // settings
    private X9Settings settings;

    // control
    private bool winVisible;
    private QueueConsumer consumer;

    // widgets
    private Gtk.Grid mainGrid;
    private Gtk.Entry entAddress;

    // others components
    private StatusIcon trayicon;
    private Gtk.AttachOptions defaultFlags;

    public WindowMain() {

      settings = new X9Settings();
      consumer = new QueueConsumer();
      consumer.bind(settings.getRabbitmqAddress());

      // controls
      winVisible = true;
      defaultFlags = Gtk.AttachOptions.EXPAND | Gtk.AttachOptions.FILL;

      // set status icon
      this.setStatusIcon();

      // window configuration
      this.title = "x9 Notification";
      this.destroy.connect(Gtk.main_quit);

      // widgets
		  mainGrid = new Gtk.Grid();

      // widgets - address
      Gtk.Box box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);

      box.pack_start(new Gtk.Label("RabbiMQ Server"), false, false, 10);

      entAddress = new Gtk.Entry();
      entAddress.set_text(settings.getRabbitmqAddress());
      entAddress.changed.connect(saveAddress);
      box.pack_start(entAddress, false, false, 10);

      mainGrid.attach(box, 0, 0, 1, 1);
		  this.add(mainGrid);
    }

    public void toggleWindow() {
      this.visible = !this.visible;
      if (this.visible) {
        show_all();
      } else {
        hide();
      }
    }

    private void saveAddress() {
      settings.setRabbitmqAddress(entAddress.get_text());
    }

    private void setStatusIcon() {

      trayicon = new StatusIcon.from_stock(Stock.HOME);
      trayicon.set_tooltip_text("X9 Notification");
      trayicon.set_visible(true);

      trayicon.activate.connect(toggleWindow);

    }

  }

}

