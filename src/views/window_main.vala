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

    private StatusIcon trayicon;
    private Gtk.Menu menuSystem;

    public WindowMain() {
      // set status icon
      this.setStatusIcon();

      // window configuration
      this.title = "x9-notification Client";
      this.destroy.connect ( Gtk.main_quit );
    }

    private void setStatusIcon() {

      trayicon = new StatusIcon.from_stock(Stock.HOME);
      trayicon.set_tooltip_text ("X9 Notification");
      trayicon.set_visible(true);

      // trayicon.activate.connect(about_clicked);

      //create_menuSystem();
      //trayicon.popup_menu.connect(menuSystem_popup);
    }

  }

}

