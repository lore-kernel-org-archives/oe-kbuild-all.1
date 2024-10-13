Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07F96EB4A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 10:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728814607; cv=none; b=Jg7WEJ2eYafAmklcu7M2u2GNreMpIN/+Sodu/Up9SexpOHscWLC33bFiHkeANNHR9NkxUrZdnlSWaWriJr4Ki6iMqdEcCJR0gPI+quT8M5iZDFtKYVbxhmpQf6WKfQ7guM3kXVLLX/4jpGVb6730NxbaqT1hghMPrysmD72lVIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728814607; c=relaxed/simple;
	bh=yRV/njj6cGTiVtlBaz5MxI19fX78/vJeo83KEADOqBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SgCoeUaHbdGZb5yC6BMtw7e3wDkzdw77wi3EdXo206oyVbs/JbFd84/vPcr6W817mJnWia0UBKFe97TMySI3W3tMb1ueF+Q/WMAztFwF7UlFzWPbZMQfwZy2xnHdeJsv8fYWCZqXw9GcgKwyReW2Mr9ywtB2tB/MtbKpBhpiuBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dl8xKPdj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dl8xKPdj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728814605; x=1760350605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yRV/njj6cGTiVtlBaz5MxI19fX78/vJeo83KEADOqBc=;
  b=dl8xKPdjTYawIE3LgJUtJGqhyxs89rSPYeeFqPU/czR1FCIConOi6UiD
   Ru70de0iRrGuIyceIN2+L9KvAeGd25meGY5H9idjGvQNTdr3+YpVNC+jY
   8F76fE6wqUqhDyk7N4evwCz4wAKUPV6N/W3tgFTNzrHsBv8MSJVlT4hBm
   NxjXOlsEBncEaopkSyHf5ZuvSRHRJPpiy+vg0Po49wsFtivD3n+lgpXN1
   DJ8iaYpciD93DjohiR3asxsXa56EDoPHsxlsWgWi5IrX9h/b47P1wTNr8
   naUA5+FVX40/5OzLkBNSK/8JaKylFbM6qDLYZDKIoxKEEcuOrOggyueD0
   Q==;
X-CSE-ConnectionGUID: RxUZ+EIGTyymL5WKUnhYkA==
X-CSE-MsgGUID: tnq55y7MTbq7lRfOuXX9GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="27975279"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="27975279"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 03:16:45 -0700
X-CSE-ConnectionGUID: 3JZ1A+AETGG9me1PyRr9Qw==
X-CSE-MsgGUID: d/VzHOamRQejfxjh8Y7e5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="108106536"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Oct 2024 03:16:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szveS-000EHr-3B;
	Sun, 13 Oct 2024 10:16:40 +0000
Date: Sun, 13 Oct 2024 18:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st 1862/2707] drivers/watchdog/bcm2835_wdt.c:119:3:
 error: 'struct watchdog_device' has no member named 'max_hw_heartbeat_ms'
Message-ID: <202410131801.d5I7x6fp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stefan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st
head:   b5f5caba9e17aa617f5764a9888662c3d0a90540
commit: 65e5abd22423bcb8597ee3d8213977a182916f52 [1862/2707] watchdog: bcm2835_wdt: Fix WDIOC_SETTIMEOUT handling
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20241013/202410131801.d5I7x6fp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410131801.d5I7x6fp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410131801.d5I7x6fp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/cpumask.h:11:0,
                    from include/linux/rcupdate.h:40,
                    from include/linux/srcu.h:33,
                    from include/linux/notifier.h:15,
                    from include/linux/reboot.h:5,
                    from drivers/watchdog/bcm2835_wdt.c:17:
   include/linux/bitmap.h: In function 'bitmap_empty':
   include/linux/bitmap.h:300:36: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return find_first_bit(src, nbits) == nbits;
                                       ^~
   include/linux/bitmap.h: In function 'bitmap_full':
   include/linux/bitmap.h:308:41: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return find_first_zero_bit(src, nbits) == nbits;
                                            ^~
   In file included from arch/arm/include/asm/bug.h:62:0,
                    from arch/arm/include/asm/div64.h:63,
                    from include/linux/kernel.h:136,
                    from include/linux/delay.h:10,
                    from drivers/watchdog/bcm2835_wdt.c:16:
   include/linux/cpumask.h: In function 'cpumask_check':
   include/linux/cpumask.h:117:19: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     WARN_ON_ONCE(cpu >= nr_cpumask_bits);
                      ^
   include/asm-generic/bug.h:112:27: note: in definition of macro 'WARN_ON_ONCE'
     int __ret_warn_once = !!(condition);   \
                              ^~~~~~~~~
   drivers/watchdog/bcm2835_wdt.c: At top level:
>> drivers/watchdog/bcm2835_wdt.c:119:3: error: 'struct watchdog_device' has no member named 'max_hw_heartbeat_ms'
     .max_hw_heartbeat_ms = WDOG_TICKS_TO_MSECS(PM_WDOG_TIME_SET),
      ^~~~~~~~~~~~~~~~~~~


vim +119 drivers/watchdog/bcm2835_wdt.c

  > 16	#include <linux/delay.h>
    17	#include <linux/reboot.h>
    18	#include <linux/types.h>
    19	#include <linux/module.h>
    20	#include <linux/io.h>
    21	#include <linux/watchdog.h>
    22	#include <linux/platform_device.h>
    23	#include <linux/of_address.h>
    24	#include <linux/of_platform.h>
    25	
    26	#define PM_RSTC				0x1c
    27	#define PM_RSTS				0x20
    28	#define PM_WDOG				0x24
    29	
    30	#define PM_PASSWORD			0x5a000000
    31	
    32	#define PM_WDOG_TIME_SET		0x000fffff
    33	#define PM_RSTC_WRCFG_CLR		0xffffffcf
    34	#define PM_RSTS_HADWRH_SET		0x00000040
    35	#define PM_RSTC_WRCFG_SET		0x00000030
    36	#define PM_RSTC_WRCFG_FULL_RESET	0x00000020
    37	#define PM_RSTC_RESET			0x00000102
    38	
    39	/*
    40	 * The Raspberry Pi firmware uses the RSTS register to know which partiton
    41	 * to boot from. The partiton value is spread into bits 0, 2, 4, 6, 8, 10.
    42	 * Partiton 63 is a special partition used by the firmware to indicate halt.
    43	 */
    44	#define PM_RSTS_RASPBERRYPI_HALT	0x555
    45	
    46	#define SECS_TO_WDOG_TICKS(x) ((x) << 16)
    47	#define WDOG_TICKS_TO_SECS(x) ((x) >> 16)
    48	#define WDOG_TICKS_TO_MSECS(x) ((x) * 1000 >> 16)
    49	
    50	struct bcm2835_wdt {
    51		void __iomem		*base;
    52		spinlock_t		lock;
    53		struct notifier_block	restart_handler;
    54	};
    55	
    56	static unsigned int heartbeat;
    57	static bool nowayout = WATCHDOG_NOWAYOUT;
    58	
    59	static int bcm2835_wdt_start(struct watchdog_device *wdog)
    60	{
    61		struct bcm2835_wdt *wdt = watchdog_get_drvdata(wdog);
    62		uint32_t cur;
    63		unsigned long flags;
    64	
    65		spin_lock_irqsave(&wdt->lock, flags);
    66	
    67		writel_relaxed(PM_PASSWORD | (SECS_TO_WDOG_TICKS(wdog->timeout) &
    68					PM_WDOG_TIME_SET), wdt->base + PM_WDOG);
    69		cur = readl_relaxed(wdt->base + PM_RSTC);
    70		writel_relaxed(PM_PASSWORD | (cur & PM_RSTC_WRCFG_CLR) |
    71			  PM_RSTC_WRCFG_FULL_RESET, wdt->base + PM_RSTC);
    72	
    73		spin_unlock_irqrestore(&wdt->lock, flags);
    74	
    75		return 0;
    76	}
    77	
    78	static int bcm2835_wdt_stop(struct watchdog_device *wdog)
    79	{
    80		struct bcm2835_wdt *wdt = watchdog_get_drvdata(wdog);
    81	
    82		writel_relaxed(PM_PASSWORD | PM_RSTC_RESET, wdt->base + PM_RSTC);
    83		dev_info(wdog->dev, "Watchdog timer stopped");
    84		return 0;
    85	}
    86	
    87	static int bcm2835_wdt_set_timeout(struct watchdog_device *wdog, unsigned int t)
    88	{
    89		wdog->timeout = t;
    90		return 0;
    91	}
    92	
    93	static unsigned int bcm2835_wdt_get_timeleft(struct watchdog_device *wdog)
    94	{
    95		struct bcm2835_wdt *wdt = watchdog_get_drvdata(wdog);
    96	
    97		uint32_t ret = readl_relaxed(wdt->base + PM_WDOG);
    98		return WDOG_TICKS_TO_SECS(ret & PM_WDOG_TIME_SET);
    99	}
   100	
   101	static struct watchdog_ops bcm2835_wdt_ops = {
   102		.owner =	THIS_MODULE,
   103		.start =	bcm2835_wdt_start,
   104		.stop =		bcm2835_wdt_stop,
   105		.set_timeout =	bcm2835_wdt_set_timeout,
   106		.get_timeleft =	bcm2835_wdt_get_timeleft,
   107	};
   108	
   109	static struct watchdog_info bcm2835_wdt_info = {
   110		.options =	WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE |
   111				WDIOF_KEEPALIVEPING,
   112		.identity =	"Broadcom BCM2835 Watchdog timer",
   113	};
   114	
   115	static struct watchdog_device bcm2835_wdt_wdd = {
   116		.info =		&bcm2835_wdt_info,
   117		.ops =		&bcm2835_wdt_ops,
   118		.min_timeout =	1,
 > 119		.max_hw_heartbeat_ms =	WDOG_TICKS_TO_MSECS(PM_WDOG_TIME_SET),
   120		.timeout =	WDOG_TICKS_TO_SECS(PM_WDOG_TIME_SET),
   121	};
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
