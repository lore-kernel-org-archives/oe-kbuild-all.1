Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B393201
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 02:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712024211; cv=none; b=oeQCAHO7rNu0ET2uZuS0V+x/iKMeYf4Y2I00DA4xzwVrKFtlwSdJP5eMCSHV0o7iokPEqgUMC8XZdF7I+meIoafXpaSiI+xBoScP9vnbHHIVD4M3/eM0SMNsZ4bExSlA/fLTqHdv5wfxDBsz1NMJj4VZnZOeLkLZqIFmEM8p8Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712024211; c=relaxed/simple;
	bh=t8tfZniwN2aDHRVRyo9TjXmYsSuX0mgNqKuY3AR5JLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CbVlcIw9tBSvvGE1jWfcdud1X+RBzSI35mpPVxnjKSrFgxsUt65O5bTn8l/Vt0LAf5YILeq8GEooNaHdVOdmNpPWQTTzkEa70PI/xXj6iu0frgcVpaG4DGBSxtuGr2GeGyIMdRa+ibEP5Qp1+RU+FRlWoW3v0KPD8uSs1mSQchg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSuJCIq8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSuJCIq8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712024210; x=1743560210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t8tfZniwN2aDHRVRyo9TjXmYsSuX0mgNqKuY3AR5JLE=;
  b=OSuJCIq8gKhpN5S0OwBN6artz+C0feS79L79vfX/KTgKegzFdYjQaTqt
   vnsNCfeDtUznqFCmd7/oe0zsReM82ukmMRqUk4qojJgpf7Ce8tDAorr77
   kz1gLFf7l4rfKMTYbTL7Yi5ftqr9gw2DzCdP8R3ht1TMJGonJKpPWKF4u
   BpnWDyE7hM1xd5TdhOh+2wHILbZiQ40XYXBTfvUIho3bedQpeEbzNMB59
   cJ4Jp053K5kGCfpDucRLoKzBq/ylTtCd4qUOWEkh1DpZeEAdqagR+Shg/
   BiRF+biKzGdoH4PCYBm96gfUfWIjTIDKZiqUyCPL9UC9GyRJrVDojU1Cy
   g==;
X-CSE-ConnectionGUID: 9TAnnyH2QUaCQi9iqx2h8g==
X-CSE-MsgGUID: hjIE86WmRCK5b+iLOCcMjw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7073313"
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="7073313"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 19:16:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="48903989"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Apr 2024 19:16:47 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrThd-0000mv-24;
	Tue, 02 Apr 2024 02:16:45 +0000
Date: Tue, 2 Apr 2024 10:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 1/1]
 include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of
 type 'long unsigned int', but argument 5 has type 'void *'
Message-ID: <202404021042.okNybfyI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   e4f1f4c9a6f6bdc4ed2f2d6d05fe5cd78af07bdf
commit: e4f1f4c9a6f6bdc4ed2f2d6d05fe5cd78af07bdf [1/1] ANDROID: Add kiwi_fault_logging kernel parameter
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240402/202404021042.okNybfyI-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404021042.okNybfyI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404021042.okNybfyI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:17,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:6,
                    from include/linux/sched.h:12,
                    from include/linux/context_tracking.h:5,
                    from arch/x86/kernel/traps.c:15:
   arch/x86/kernel/traps.c: In function 'do_error_trap':
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'void *' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:9:25: note: in expansion of macro 'KERN_SOH'
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
   include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 7 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:9:25: note: in expansion of macro 'KERN_SOH'
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
   include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 8 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:9:25: note: in expansion of macro 'KERN_SOH'
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


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
