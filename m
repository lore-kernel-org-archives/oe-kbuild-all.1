Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3707B38F927
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 01:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791853527; cv=none; b=j4qmm1IoEWxNwgBR65YJKAO01H3EUt5bCZ+zTAauwcogsNgNMmhXaBvlnFjf3QhAnMNzAXt1WENzzaraXauMCUcv1ZIt5jM3I3YjI/qlV4ybShx2fpZztSsa9uM42ntipmK6ec28C2O8+uwsQoxlDurVjtyUjSV2FSwot8/1aSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791853527; c=relaxed/simple;
	bh=UaYUsF2jQSLDKtY/wzS9gj5SEN1Pd6aEu0uYLWT1Bxc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Am/XIEX/i92FgUnzm1aayE6RZ/ZBReiQyNBW4cOq2Trps8ESbSCJL8a148Lrj3AGxf0h/3/L9/lkOrDd21jkLkdje180At3Xcx7s8QLnkoQlrgYE6sNdMK/B+qJMGCGxiZ6UwXEnXvsyVBricXk49BAPJ852di3XYH6cVmCnX6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWIoWStD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWIoWStD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791853526; x=1823389526;
  h=date:from:to:cc:subject:message-id;
  bh=UaYUsF2jQSLDKtY/wzS9gj5SEN1Pd6aEu0uYLWT1Bxc=;
  b=gWIoWStDJws6JRoFghWzbfUACWdWlIwxUnyM2xlEn09bubN+Xxxwkg9O
   YfuumRYYGeat2cjYiRiQ+Mwumc6w6MS2nYUMivs0SDOtvMIUdhoIWGGMh
   il0SO/YuJ20JViSPcjAIw96Bexo6Y61nlDIwYTR6VreufrgusUTEb1+LT
   vKN0ZsihcAyqpILG7AN5Ocxxhw/kp4S+FuSs2UPa7yJq4yKpGToqW9gfu
   l9596LHC8yQlTZuLGRoMxXvsCpE7IV938yvIBcokx134t+LgHQoh68TTC
   Sgzg6n8AiC6fklb8qUmfc0uIZpb9/zGj7Yx93fS4zztSDNMO8lRZUmeS5
   Q==;
X-CSE-ConnectionGUID: 75awOTOHSta4CTLKFoTXoQ==
X-CSE-MsgGUID: V+kKi1KsTCuy4swDNd86Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="465872"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="465872"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 18:05:25 -0700
X-CSE-ConnectionGUID: svgihKfBQU+MBkNU73U7ow==
X-CSE-MsgGUID: 29g7VdA6RMm7PCN97Ts8qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1503365"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 12 Oct 2026 18:05:24 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGQxE-00000000AK3-3pUJ;
	Tue, 13 Oct 2026 01:05:20 +0000
Date: Tue, 13 Oct 2026 03:04:44 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 288/288]
 ./include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of
 type 'long unsigned int', but argument 5 has type 'void *'
Message-ID: <202610130259.uHPGF6ri-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Idan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   a00189220f1bc09e180c783559651d077b994b37
commit: e4f1f4c9a6f6bdc4ed2f2d6d05fe5cd78af07bdf [288/288] ANDROID: Add kiwi_fault_logging kernel parameter
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261013/202610130259.uHPGF6ri-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130259.uHPGF6ri-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130259.uHPGF6ri-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ./include/linux/printk.h:7,
                    from ./include/linux/kernel.h:17,
                    from ./arch/x86/include/asm/percpu.h:27,
                    from ./arch/x86/include/asm/current.h:6,
                    from ./include/linux/sched.h:12,
                    from ./include/linux/context_tracking.h:5,
                    from arch/x86/kernel/traps.c:15:
   arch/x86/kernel/traps.c: In function 'do_error_trap':
>> ./include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'void *' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   ./include/linux/kern_levels.h:9:25: note: in expansion of macro 'KERN_SOH'
       9 | #define KERN_ALERT      KERN_SOH "1"    /* action must be taken immediately */
         |                         ^~~~~~~~
   arch/x86/kernel/traps.c:175:20: note: in expansion of macro 'KERN_ALERT'
     175 |             printk(KERN_ALERT "%s[%d]: do_error_trap for %s at %lx trapnr %lx signr %lx sicode %lx ip %px sp %px error %lx",
         |                    ^~~~~~~~~~
   arch/x86/kernel/traps.c:175:66: note: format string is defined here
     175 |             printk(KERN_ALERT "%s[%d]: do_error_trap for %s at %lx trapnr %lx signr %lx sicode %lx ip %px sp %px error %lx",
         |                                                                ~~^
         |                                                                  |
         |                                                                  long unsigned int
         |                                                                %p
>> ./include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 7 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   ./include/linux/kern_levels.h:9:25: note: in expansion of macro 'KERN_SOH'
       9 | #define KERN_ALERT      KERN_SOH "1"    /* action must be taken immediately */
         |                         ^~~~~~~~
   arch/x86/kernel/traps.c:175:20: note: in expansion of macro 'KERN_ALERT'
     175 |             printk(KERN_ALERT "%s[%d]: do_error_trap for %s at %lx trapnr %lx signr %lx sicode %lx ip %px sp %px error %lx",
         |                    ^~~~~~~~~~
   arch/x86/kernel/traps.c:175:87: note: format string is defined here
     175 |             printk(KERN_ALERT "%s[%d]: do_error_trap for %s at %lx trapnr %lx signr %lx sicode %lx ip %px sp %px error %lx",
         |                                                                                     ~~^
         |                                                                                       |
         |                                                                                       long unsigned int
         |                                                                                     %x
   ./include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 8 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   ./include/linux/kern_levels.h:9:25: note: in expansion of macro 'KERN_SOH'
       9 | #define KERN_ALERT      KERN_SOH "1"    /* action must be taken immediately */
         |                         ^~~~~~~~
   arch/x86/kernel/traps.c:175:20: note: in expansion of macro 'KERN_ALERT'
     175 |             printk(KERN_ALERT "%s[%d]: do_error_trap for %s at %lx trapnr %lx signr %lx sicode %lx ip %px sp %px error %lx",
         |                    ^~~~~~~~~~
   arch/x86/kernel/traps.c:175:98: note: format string is defined here
     175 |             printk(KERN_ALERT "%s[%d]: do_error_trap for %s at %lx trapnr %lx signr %lx sicode %lx ip %px sp %px error %lx",
         |                                                                                                ~~^
         |                                                                                                  |
         |                                                                                                  long unsigned int
         |                                                                                                %x


vim +5 ./include/linux/kern_levels.h

314ba3520e513a7 Joe Perches 2012-07-30  4  
04d2c8c83d0e3ac Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3ac Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3ac Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
