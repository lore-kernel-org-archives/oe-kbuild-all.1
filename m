Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F8C21D58B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 20:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764016063; cv=none; b=D/ih7wdVsZ6rb8OA1gw4itpC6IG7qOA+87n53E5hwpyjgy2jxh64qUOINiJnVD//saHWE6DCOI/g8H+EYq0L4Xt5YQRccVIbXlCVoC1cIVON4KWkFtD7bl4kToXQJ0Ukkxx7UC2Ox5kcJylNXIDyGlOflzxpqw2Y5lkhqkt0Ff0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764016063; c=relaxed/simple;
	bh=4VrQq/uSanZySJDb2ms2q//e9Mdadh0mOnZ9Ndfonic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SGWgnGqTw6QZ3n234rLdLExlUYCcmlE/xbO+phEY5+JzfQEzrzQ8g6EJA/5/JLCG0EtZWseflnzncg4DRVJlAPGUjwwdtA3/jrsn4BiRSyWTUUPKL56ThWUsik2qmfD2+d7hMNTEdQqCdbNQB7oz0CxD8lgS0/F4tWbNbaXFj/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0yMuvfO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0yMuvfO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764016063; x=1795552063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4VrQq/uSanZySJDb2ms2q//e9Mdadh0mOnZ9Ndfonic=;
  b=H0yMuvfOFRogNEUSfnOoPauvFwFFxoz58w0G8kvkoGwfhC+PRFrhkNW2
   eXgQVrQ9nV1iHul2T3q7qY5LdbPn1qZzICM/Pgxe0BbsOOxUxSIUy1MzA
   mnJEWdRWCvsR/tbF+oNZCbR+rGXIX/eTjP0Fi8V+FIbJn7+IhpHG7ACDN
   LsM4wDScR1lDkckpGLpik/lJ8cYWK7P8yWHNF9MdQK77Uv0mDwuk+lVle
   GxQtVwROqjRG74jGmnYabnUDxc2CoN3c1RNODMNqUrYGdjh7wlmFEEkP5
   a20O3PEd2RkWCXE88vD+/s12tgs0g04ZOczAMDgFZ3KclEkt7LF1O2pS3
   Q==;
X-CSE-ConnectionGUID: jPDH04ncShil81TDufc0hg==
X-CSE-MsgGUID: B/vWMKYkRFyl3FzIBCFvjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65973248"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="65973248"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 12:27:42 -0800
X-CSE-ConnectionGUID: HcmHhJRCTqqo6tfpiAAghg==
X-CSE-MsgGUID: HzpnM2BIQTSQl11aF+n2HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="196890879"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Nov 2025 12:27:40 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNd9u-0000000016d-0Edq;
	Mon, 24 Nov 2025 20:27:38 +0000
Date: Tue, 25 Nov 2025 04:26:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 189/189]
 include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of
 type 'long unsigned int', but argument 5 has type 'void *'
Message-ID: <202511250406.k7FlCw21-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Idan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   6dfc5d5f147fda6ad0ca4cb880fc8bcb466d1775
commit: e4f1f4c9a6f6bdc4ed2f2d6d05fe5cd78af07bdf [189/189] ANDROID: Add kiwi_fault_logging kernel parameter
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20251125/202511250406.k7FlCw21-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250406.k7FlCw21-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511250406.k7FlCw21-lkp@intel.com/

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
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 7 has type 'int' [-Wformat=]
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
