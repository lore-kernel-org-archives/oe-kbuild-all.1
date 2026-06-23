Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861A738C421
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 01:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782178268; cv=none; b=P4RDhaPOiZGbfjSQe0HB4/7E/L5yzYFNgxBMdoqmmD7FIQMuh9v8aKQDoXUa4iFhdCP5XJvulWi1ACoWCn2l3AzYuYRbL8FF0z6qf7nlMOJk1uFSZ0lIbwcGogZcLsX5hpUfmaSN3Z+s7XgQUxza91oS2JJ0VTguNP3xWdy6aGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782178268; c=relaxed/simple;
	bh=UIGOEQ6q2tKhme0diRo6Ac3UgkxwW/NkjLoTjIXwQSo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j6RTvBjMiq9H7O0QSjVv06rjJK5NVWVfrVY0tXBWVoYaRDWy+8FcnxKfdQ4doHzr3MokKuV+RYx3kGDllVTDev7BQzXUojHnGFuV9ZH2o+f/U2VrhAuC+XtZTCeUfZVUYi4ITVWtD9i9WaiIOZhM3JQj8I3/EWdzpu6UiiqRAzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nx9eEjXr; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nx9eEjXr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782178266; x=1813714266;
  h=date:from:to:cc:subject:message-id;
  bh=UIGOEQ6q2tKhme0diRo6Ac3UgkxwW/NkjLoTjIXwQSo=;
  b=Nx9eEjXr1Nh9CWtf/NRPcILn2oEVLoAM8i5IqyXXA49DibaKfDsko32W
   Wc7FTDqgA4IctznYIX5JfnVOPGfqWTdeRlDNUGXqCptiwpa1QyFR6isrd
   GVdiIJz0Y8v0slT5JAElkWdNgTXVTYVRSy5JeBT9LB8MtcIGbYZfpMkl6
   H88qeSTcRkvbw0A23PK+JVT/m/V3rquY8lymQ+HawBOplOMdTJ2YqRJ45
   4N/rBkfVmeaY7Pf7lPgKwVIsX/G0APPO3GsRY1k+irnJzigM/5A8LNnC+
   eNxlA13DsB/fTs+x20md4W2PLZMB7GSzIUzTjSYL6qPbkQ9jWMz/J+Lwx
   w==;
X-CSE-ConnectionGUID: NCiHrDx+SUaqQfoikYv4hA==
X-CSE-MsgGUID: sUcquiKWRZSCDYFeMXm27w==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93505457"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="93505457"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 18:31:02 -0700
X-CSE-ConnectionGUID: IONWw4EQRA+o6zLCht6H9A==
X-CSE-MsgGUID: cEmmRhQdRR2PReoAXLLFVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="245242069"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jun 2026 18:31:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbpyc-0000000028j-0vwD;
	Tue, 23 Jun 2026 01:30:58 +0000
Date: Tue, 23 Jun 2026 09:30:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 243/243]
 include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of
 type 'long unsigned int', but argument 5 has type 'void *'
Message-ID: <202606230916.GKEE897y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Idan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   eb5d658c1d70b40496a055ae77344de5bbcb233a
commit: e4f1f4c9a6f6bdc4ed2f2d6d05fe5cd78af07bdf [243/243] ANDROID: Add kiwi_fault_logging kernel parameter
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260623/202606230916.GKEE897y-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230916.GKEE897y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230916.GKEE897y-lkp@intel.com/

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
