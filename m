Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1883A7F45
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 12:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857706; cv=none; b=J+01FjCV7o7/qlHFdFEtnYIyVSl8S65fAMnVJwm0PDqhkdzmZSHIJx2wwPy+QBh3AXUeQmLeOtVbMK7tJbnHFtOPUz6O2FmHzLsLXDirZFNOeqv7Z6YTGdI8fgcmdJUKHUTOjmxOudXiK4XBa/VpRGF0dMu4+BYQ+XnW2eaS+3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857706; c=relaxed/simple;
	bh=zU0YIGvkK7UCKMYp5dzxcFyceQvVI4s98FfkMn2WXJs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YwJ8SA3G0b6vHcNVVf4jwpOaXX13x4xv42ZK6z7Ehf6P43LWH/GvyJ0JK4M+Ty3SEoI6GGG/6nW49kfQRVa61oNyXnV2RZAabFBScTLCbA+GIBj8INul1HPpIVdjn0uM7tIw0UOSruQlC0JDjLMCHB6Ytx+y9f7vRrQ6pBbOEwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJi/QtUW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJi/QtUW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783857702; x=1815393702;
  h=date:from:to:cc:subject:message-id;
  bh=zU0YIGvkK7UCKMYp5dzxcFyceQvVI4s98FfkMn2WXJs=;
  b=DJi/QtUWeqm4B7k2Fz6urHVFkhKlz9yO8cdLVkAjQYqnng0OuyrvgboW
   +YcoAZzhzlryyuxmtiw48mBNvLGENkM3SBQ2zWWBkr0c1YsnTvzxQg8Uk
   M7A5cSVuzXvbu7IU6IQYgRX26zJ9SqxgueAuVRPHWONOfJ0bsPsxwBg+Y
   v61eM9hFf7lvV32+qUD0ftRdRSuk+vxZ51Ow9DUGg1x7XgsrVywh/iym3
   60UGPMlVef+y/goyaMoY9P1UTPtRN0M1JFkyCPWZl+6mpS67seKdAds36
   UNCNtqSu0kmXq7Aoq07uxakcWNNlvd9qAaIaYZpfOtZ4r/uF5Y8vIU+az
   A==;
X-CSE-ConnectionGUID: hOkVQEJAQdmA27734EiBgw==
X-CSE-MsgGUID: Eoo2lm6bRI2Y8ETwmHJPjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88173325"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88173325"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 05:01:41 -0700
X-CSE-ConnectionGUID: 4Gio5UCATAazBtcXu50bwQ==
X-CSE-MsgGUID: O75wIqEGT72Mjb1efFETWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250892308"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jul 2026 05:01:39 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wissL-000000003X3-19yL;
	Sun, 12 Jul 2026 12:01:37 +0000
Date: Sun, 12 Jul 2026 14:01:06 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 59/59]
 arch/s390/kernel/early.c:230:9: error: implicit declaration of function
 'time_early_init'; did you mean 'kasan_early_init'?
Message-ID: <202607121308.vNT5DHZy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: 0ad363c8e014568032d53fe2c7ab288de68373f4 [59/59] treewide: Remove asm/timex.h includes from generic code
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260712/202607121308.vNT5DHZy-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607121308.vNT5DHZy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607121308.vNT5DHZy-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/s390/kernel/early.c: In function 'startup_init':
>> arch/s390/kernel/early.c:230:9: error: implicit declaration of function 'time_early_init'; did you mean 'kasan_early_init'? [-Wimplicit-function-declaration]
     230 |         time_early_init();
         |         ^~~~~~~~~~~~~~~
         |         kasan_early_init
--
   arch/s390/kernel/debug.c: In function 'debug_finish_entry':
>> arch/s390/kernel/debug.c:1187:9: error: implicit declaration of function 'store_tod_clock_ext' [-Wimplicit-function-declaration]
    1187 |         store_tod_clock_ext(&clk);
         |         ^~~~~~~~~~~~~~~~~~~
>> arch/s390/kernel/debug.c:1189:22: error: 'TOD_UNIX_EPOCH' undeclared (first use in this function)
    1189 |         timestamp -= TOD_UNIX_EPOCH >> 12;
         |                      ^~~~~~~~~~~~~~
   arch/s390/kernel/debug.c:1189:22: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/s390/cio/css.c: In function 'setup_css':
>> drivers/s390/cio/css.c:971:39: error: implicit declaration of function 'get_tod_clock'; did you mean 'dget_dlock'? [-Wimplicit-function-declaration]
     971 |         css_generate_pgid(css, (u32) (get_tod_clock() >> 32));
         |                                       ^~~~~~~~~~~~~
         |                                       dget_dlock
>> drivers/s390/cio/css.c:971:55: warning: right shift count >= width of type [-Wshift-count-overflow]
     971 |         css_generate_pgid(css, (u32) (get_tod_clock() >> 32));
         |                                                       ^~
--
   In file included from ./include/asm-generic/bug.h:31,
                    from ./arch/s390/include/asm/bug.h:139,
                    from ./include/linux/bug.h:5,
                    from ./include/linux/mmdebug.h:5,
                    from ./arch/s390/include/asm/cmpxchg.h:11,
                    from ./arch/s390/include/asm/atomic.h:16,
                    from ./include/linux/atomic.h:7,
                    from ./include/asm-generic/bitops/atomic.h:5,
                    from ./arch/s390/include/asm/bitops.h:75,
                    from ./include/linux/bitops.h:67,
                    from ./arch/s390/include/asm/machine.h:25,
                    from ./arch/s390/include/asm/lowcore.h:14,
                    from ./arch/s390/include/asm/current.h:13,
                    from ./arch/s390/include/asm/preempt.h:5,
                    from ./include/linux/preempt.h:79,
                    from ./include/linux/spinlock.h:56,
                    from ./include/linux/mmzone.h:8,
                    from ./include/linux/gfp.h:7,
                    from ./include/linux/umh.h:4,
                    from ./include/linux/kmod.h:9,
                    from ./include/linux/module.h:18,
                    from drivers/s390/cio/device_fsm.c:11:
   drivers/s390/cio/device_fsm.c: In function 'ccw_timeout_log':
>> drivers/s390/cio/device_fsm.c:53:41: error: implicit declaration of function 'get_tod_clock'; did you mean 'dget_dlock'? [-Wimplicit-function-declaration]
      53 |                "device information:\n", get_tod_clock());
         |                                         ^~~~~~~~~~~~~
   ./include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/s390/cio/device_fsm.c:52:9: note: in expansion of macro 'printk'
      52 |         printk(KERN_WARNING "cio: ccw device timeout occurred at %lx, "
         |         ^~~~~~
   ./include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   ./include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   drivers/s390/cio/device_fsm.c:52:9: note: in expansion of macro 'printk'
      52 |         printk(KERN_WARNING "cio: ccw device timeout occurred at %lx, "
         |         ^~~~~~
   ./include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   drivers/s390/cio/device_fsm.c:52:16: note: in expansion of macro 'KERN_WARNING'
      52 |         printk(KERN_WARNING "cio: ccw device timeout occurred at %lx, "
         |                ^~~~~~~~~~~~
--
   drivers/s390/cio/cmf.c: In function 'cmf_copy_block':
>> drivers/s390/cio/cmf.c:290:33: error: implicit declaration of function 'get_tod_clock'; did you mean 'dget_dlock'? [-Wimplicit-function-declaration]
     290 |         cmb_data->last_update = get_tod_clock();
         |                                 ^~~~~~~~~~~~~
         |                                 dget_dlock
   drivers/s390/cio/cmf.c: In function '__cmb_utilization':
>> drivers/s390/cio/cmf.c:589:24: error: implicit declaration of function 'tod_to_ns' [-Wimplicit-function-declaration]
     589 |         elapsed_time = tod_to_ns(elapsed_time);
         |                        ^~~~~~~~~
--
   drivers/s390/block/dasd.c: In function 'dasd_term_IO':
>> drivers/s390/block/dasd.c:1286:40: error: implicit declaration of function 'get_tod_clock'; did you mean 'dget_dlock'? [-Wimplicit-function-declaration]
    1286 |                         cqr->stopclk = get_tod_clock();
         |                                        ^~~~~~~~~~~~~
         |                                        dget_dlock
--
   drivers/s390/block/dasd_erp.c: In function 'dasd_default_erp_action':
>> drivers/s390/block/dasd_erp.c:102:32: error: implicit declaration of function 'get_tod_clock'; did you mean 'dget_dlock'? [-Wimplicit-function-declaration]
     102 |                 cqr->stopclk = get_tod_clock();
         |                                ^~~~~~~~~~~~~
         |                                dget_dlock
--
   drivers/s390/block/dasd_eer.c: In function 'dasd_eer_enable':
>> drivers/s390/block/dasd_eer.c:491:25: error: implicit declaration of function 'get_tod_clock'; did you mean 'dget_dlock'? [-Wimplicit-function-declaration]
     491 |         cqr->buildclk = get_tod_clock();
         |                         ^~~~~~~~~~~~~
         |                         dget_dlock
--
   drivers/s390/block/dasd_diag.c: In function 'dasd_start_diag':
>> drivers/s390/block/dasd_diag.c:189:25: error: implicit declaration of function 'get_tod_clock'; did you mean 'dget_dlock'? [-Wimplicit-function-declaration]
     189 |         cqr->startclk = get_tod_clock();
         |                         ^~~~~~~~~~~~~
         |                         dget_dlock
--
   drivers/s390/block/dasd_eckd.c: In function 'set_timestamp':
>> drivers/s390/block/dasd_eckd.c:252:14: error: implicit declaration of function 'get_phys_clock' [-Wimplicit-function-declaration]
     252 |         rc = get_phys_clock(&data->ep_sys_time);
         |              ^~~~~~~~~~~~~~
   drivers/s390/block/dasd_eckd.c: In function 'dasd_eckd_fill_rcd_cqr':
>> drivers/s390/block/dasd_eckd.c:839:25: error: implicit declaration of function 'get_tod_clock'; did you mean 'dget_dlock'? [-Wimplicit-function-declaration]
     839 |         cqr->buildclk = get_tod_clock();
         |                         ^~~~~~~~~~~~~
         |                         dget_dlock
--
   drivers/s390/block/dasd_3990_erp.c: In function 'dasd_3990_erp_DCTL':
>> drivers/s390/block/dasd_3990_erp.c:229:30: error: implicit declaration of function 'get_tod_clock'; did you mean 'dget_dlock'? [-Wimplicit-function-declaration]
     229 |         dctl_cqr->buildclk = get_tod_clock();
         |                              ^~~~~~~~~~~~~
         |                              dget_dlock
   drivers/s390/block/dasd_3990_erp.c: In function 'dasd_3990_erp_account_error':
>> drivers/s390/block/dasd_3990_erp.c:2224:14: error: implicit declaration of function 'tod_to_ns' [-Wimplicit-function-declaration]
    2224 |         if ((tod_to_ns(clk - device->path[pos].errorclk) / NSEC_PER_SEC)
         |              ^~~~~~~~~
..


vim +230 arch/s390/kernel/early.c

a156f09c9063bc6 Heiko Carstens     2022-02-28  226  
ab14de6c37fae22 Heiko Carstens     2007-02-05  227  void __init startup_init(void)
ab14de6c37fae22 Heiko Carstens     2007-02-05  228  {
557b19709da97bc Vasily Gorbik      2023-02-09  229  	kasan_early_init();
b1c0854d168cc57 Martin Schwidefsky 2016-10-10 @230  	time_early_init();

:::::: The code at line 230 was first introduced by commit
:::::: b1c0854d168cc5741e9568556e7d7cc3873c9cdc s390/time: refactor clock sync

:::::: TO: Martin Schwidefsky <schwidefsky@de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
