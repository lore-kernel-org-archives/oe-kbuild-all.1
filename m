Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7853576046
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 10:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726309142; cv=none; b=oKkkiqixj7lvccN4dOtwisxHla6JG1qZdSvuvYBXzyBPVhcrkie210CTfiArZkBeTdNZ8LuRW/O0qip9Yhcs4aFcNj2NbvPG3ORtS2fBFKtTyrKWSwXZK4wGZOKbpcrnYtlHp7Ukvd1WZ4wjs7mo4qoK1vpisw10c7JOVEvAZDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726309142; c=relaxed/simple;
	bh=y7/Y94rbPyCtN5tdM798SrcYkgwX0uEZqv3jidWpe3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCn5A3RGjmBplUcAh2nRVDcySteueKqeTYu659N0JGq9u4pGflnv0iCI/ldqpz31q+umiGM/U0CwipF6WjIGjJu7Ztf3yJS48uYqa/X/0iFd2S99qwgZ8XYCknbdIQ3K9AqTVWxGFH1xwmju4xGNHqHJGcs+vzMvi/uKvRPcR2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+TYz6B6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+TYz6B6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726309141; x=1757845141;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y7/Y94rbPyCtN5tdM798SrcYkgwX0uEZqv3jidWpe3M=;
  b=k+TYz6B67rub20o9u2mXaQqUxS7005yvu/R/zxXwPcbR5AMTrK4qDPZU
   wlIhhRftjUQsLxwspMgJP6ngjQPM8URCCrpXBaRWqlBkpC6Hm1Qjrtkvt
   eT51BX3YZXzchQfoOn0+JIqh5brhXuATFnT9OyOsbJVP7Kfw4loO2Mf11
   +328D/HfU1slxrtbMo5MR0rTLzQ5ZVfJozqlJbAuYBqJ5wUgRaVLOM9Kj
   B4+OgKdGaVU/HOhzUKo3qsNbC3o6wSHhEE4zC6EjkgOZAvbn7HC/Q2ppp
   h6uqRdUVu7reP4VyH569B90VU56HhppLMAx7XN+uQ/69uvzJao5tdIXyj
   w==;
X-CSE-ConnectionGUID: m2aLVNM/QQurTwTC1dkGAw==
X-CSE-MsgGUID: AqtX5KUoThePINDCKoCfEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="42686518"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="42686518"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 03:19:01 -0700
X-CSE-ConnectionGUID: ma0ME4eVQOWKAuY/NinueQ==
X-CSE-MsgGUID: HpSeGok9RNevnNu+ScCisQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="99038812"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Sep 2024 03:18:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spPrg-0007d3-16;
	Sat, 14 Sep 2024 10:18:52 +0000
Date: Sat, 14 Sep 2024 18:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Esben Haabendal <esben@geanix.com>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>, Arnd Bergmann <arnd@arndb.de>,
	Tony Lindgren <tony@atomide.com>, Udit Kumar <u-kumar1@ti.com>,
	Ronald Wahl <ronald.wahl@raritan.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Rengarajan S <rengarajan.s@microchip.com>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH next v2 2/4] serial: 8250: Split out IER from
 rs485_stop_tx()
Message-ID: <202409141849.iyZNNZgc-lkp@intel.com>
References: <20240913140538.221708-3-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913140538.221708-3-john.ogness@linutronix.de>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on b794563ea12fb46d9499da9e30c33d9607e33697]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Ogness/serial-8250-Split-out-IER-from-rs485_start_tx/20240913-220810
base:   b794563ea12fb46d9499da9e30c33d9607e33697
patch link:    https://lore.kernel.org/r/20240913140538.221708-3-john.ogness%40linutronix.de
patch subject: [PATCH next v2 2/4] serial: 8250: Split out IER from rs485_stop_tx()
config: parisc-randconfig-r064-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141849.iyZNNZgc-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141849.iyZNNZgc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141849.iyZNNZgc-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
>> ERROR: modpost: "serial8250_rs485_stop_tx" [drivers/tty/serial/8250/8250_omap.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
