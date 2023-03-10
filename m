Received: from muru.com (muru.com [72.249.23.125])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B8CED0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 06:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 7E74680F5;
	Fri, 10 Mar 2023 06:52:39 +0000 (UTC)
Date: Fri, 10 Mar 2023 08:52:38 +0200
From: Tony Lindgren <tony@atomide.com>
To: kernel test robot <lkp@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Johan Hovold <johan@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-omap@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v6 1/1] serial: core: Start managing serial controllers
 to enable runtime PM
Message-ID: <20230310065238.GJ7501@atomide.com>
References: <20230309085713.57700-1-tony@atomide.com>
 <202303100516.22vtkWv4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303100516.22vtkWv4-lkp@intel.com>

* kernel test robot <lkp@intel.com> [230309 21:31]:
> >> drivers/tty/serial/serial_ctrl.c:17:34: warning: 'serial_ctrl_pm' defined but not used [-Wunused-const-variable=]
>       17 | static DEFINE_RUNTIME_DEV_PM_OPS(serial_ctrl_pm, NULL, NULL, NULL);
>          |                                  ^~~~~~~~~~~~~~

Thanks I'll tag it with __maybe_unused.

Regards,

Tony
