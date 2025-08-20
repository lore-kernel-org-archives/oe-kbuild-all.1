Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20382D375A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 07:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755674329; cv=none; b=cC4HOsFevYV4fY/U7oeQH6BrW0q9f2RsW6EDtoiyEN6/BGhPybiqhUhguw0dXfg6H9HMVgWprHocBlXE/b3pNlQhD4XCEmub1GcUk1EwIOUHY6uj3IdGqGcDp6Qrio/c8Ymh/FLK108n8Z1rtn8UW7V9358LnULQa9e0vMjB4ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755674329; c=relaxed/simple;
	bh=vz15eO/Mj+sRWTjBSFGXXFSxZfvCeS7Vdhmfglinjkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B0XNWiciGS5ENXwCAj/khlPTj/mmBv9/j6X3KhBM/n7sNNI2r3hiJduYMgHHRa229cpf3ZQgCjx7d+g2q34Z8jOxOlL+jhsIZU5ae3qF9yogm3rJk4hVRoUhLDZ3wkrlADsWjY/JxEiwoKYay047lKOfLXEhkZVN3Wd8KxmYZUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RcEEOMec; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RcEEOMec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755674327; x=1787210327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vz15eO/Mj+sRWTjBSFGXXFSxZfvCeS7Vdhmfglinjkg=;
  b=RcEEOMecwNoF6Wm0EVit4b/u8Yv4DfhK/3UA6yPio+wriJ17OlzXKbSf
   NVlAPt36vEhAIrrGcet4XGr8SMwLgEZsHA81E3FLMGWVHalGMx057I7Kv
   1v4G6UvBGkOtwbUpRPoEe9wHh7WyQFiApf48uCbSYTkKo3siDgKgQECRr
   mDvQTllq/VH7NwERdpRQLKo1Zlqqds0NlSfH8oImMcy9SyHpG84Hylsli
   qd2vIMQP4imbU1PKcwJmXUA5aPxU4eUYwMhh41tGmZfrXUTZnQNvMY+aP
   MvLPxtVMR2BQa7BzjLtG0fDqZqH8nS2v59E3UT3t8s1L4i9mTJBT8ujZK
   g==;
X-CSE-ConnectionGUID: F2nAeMoXSAmxg+QmAGQ2Nw==
X-CSE-MsgGUID: XW2hKl76RsibvC2q3c/Jzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68203260"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="68203260"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 00:18:47 -0700
X-CSE-ConnectionGUID: kUvVSc6RRTqWmU+4zIRwbQ==
X-CSE-MsgGUID: sKOBX6yqQya9mC02pcP9FA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 20 Aug 2025 00:18:46 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uod5o-0001U7-1K;
	Wed, 20 Aug 2025 07:18:44 +0000
Date: Wed, 20 Aug 2025 09:18:32 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 161/161]
 include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of
 type 'long unsigned int', but argument 5 has type 'void *'
Message-ID: <202508200909.Bgk8mMWF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   3c3ae94211aaa3dfb36df96e7e79dcd57eb78036
commit: e4f1f4c9a6f6bdc4ed2f2d6d05fe5cd78af07bdf [161/161] ANDROID: Add kiwi_fault_logging kernel parameter
config: i386-buildonly-randconfig-2002-20250820 (https://download.01.org/0day-ci/archive/20250820/202508200909.Bgk8mMWF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250820/202508200909.Bgk8mMWF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508200909.Bgk8mMWF-lkp@intel.com/

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
