Received: from muru.com (muru.com [72.249.23.125])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB9E399
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 07:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id EEE828088;
	Fri, 29 Sep 2023 07:27:01 +0000 (UTC)
Date: Fri, 29 Sep 2023 10:27:00 +0300
From: Tony Lindgren <tony@atomide.com>
To: kernel test robot <lkp@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Dhruva Gole <d-gole@ti.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	Johan Hovold <johan@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH] serial: 8250_omap: Drop pm_runtime_irq_safe()
Message-ID: <20230929072700.GF5285@atomide.com>
References: <20230928080358.2693-1-tony@atomide.com>
 <202309290255.uEGVqQAE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202309290255.uEGVqQAE-lkp@intel.com>

* kernel test robot <lkp@intel.com> [230928 18:13]:
>    drivers/tty/serial/8250/8250_omap.c: In function 'omap8250_irq':
> >> drivers/tty/serial/8250/8250_omap.c:688:1: warning: label 'out_runtime_put' defined but not used [-Wunused-label]
>      688 | out_runtime_put:
>          | ^~~~~~~~~~~~~~~

Looks like this happens if CONFIG_SERIAL_8250_DMA is not set, I'll take
a look.

Regards,

Tony
