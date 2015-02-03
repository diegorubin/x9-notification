/**
 *  Class for x9 settings 
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

namespace com.diegorubin.x9_notification {

  public class X9Settings {

    private Settings settings;

    public X9Settings() { 
      settings = new Settings("com.diegorubin.x9-notification");
    }

    public void setRabbitmqAddress(string address) {
      settings.set_string("rabbitmq", address);
    }

    public string getRabbitmqAddress() {
      return settings.get_string("rabbitmq");
    }

  }
}

