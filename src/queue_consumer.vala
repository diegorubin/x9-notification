/**
 *  Class for read RabbitMQ queue  
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

using AMQP;

namespace com.diegorubin.x9_notification {

  public class QueueConsumer {
    private Connection connection;
    private string defaultExchange = "x9";
    private Thread<void*> bindThread;

    public QueueConsumer() {
      connection = new Connection();
    }

    public int bind() {
      try {
        bindThread = new Thread<void*>.try ("bind", connect);
      } catch(Error e) {
        return 1;
      }

      return 0;
    }

    private void* connect() {
      while(true) {
        Thread.usleep (Random.int_range (0, 200000));
        Posix.system("echo 1 >> /tmp/teste.txt");
      }
    }

  }

}

