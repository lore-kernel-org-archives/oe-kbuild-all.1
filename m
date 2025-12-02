Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32D02853F1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 20:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764708232; cv=none; b=XRJfoChrrLFp5p/YAWDW06Lpg1Px7wcydLCo6E229K/3GbUZJbpu739zNcf/VLpO9++BcklR4O4zFHjCjGPjQAJNZNEE4fgk/MOwMnrN+q3N7NGWjriXOkIP6ywYh1dz01P9lqLh5qha+WRCkTqxKym5Ox7+Jw1zCx2qm4ESI3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764708232; c=relaxed/simple;
	bh=R46FUeYZUqIk5A74gbgVaENgS5o3LzVBIb6PTus9CVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mwTKIgTzk/wbEuMmLfu8d3bL1+UUF/EVf3pilBFMt+q6m5BbHJVzFFJ0DmOFARMxwYiotrSxv753dEA1eVaLyIyvOUrsEU5XEHHyjlgt9w8TRCP2iNVOcGSFRTV10WU4f5aG95dZMyqO6uMQacCpjQg8nNIPIfW0yImmm01iJjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEuxXo9V; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEuxXo9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764708231; x=1796244231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R46FUeYZUqIk5A74gbgVaENgS5o3LzVBIb6PTus9CVA=;
  b=ZEuxXo9VRwWIybxigZ0+kQMhKag8dWX9nsPhWgZOY4ya1HosGeFmCx8T
   gA1ooHAUja9YjAvuFupadtm2jg6t6DuELWlI9VfTQZ/U/gqr+8/ecn+U7
   X0wPhfYYi8iculLgMrJ+e95vKR2jn5X+W5FvYSLt9hE1n8LdXGaNLwvQR
   Q6BUZKMOd/zt3CNlIgP0mByB2g1H2XhP6vgTqw6jQuKypP8asRCuDxa9O
   5SNkWDoIp7ErqCB8Z2F6acm9rIV/X4dcO/teTG3vhnjclsSMWYautemmc
   StnbFBlm/kKyZlCEdfhe+27Vi8f17vMKlCP7p6wKNcJJ7CxnC1d4d8lsW
   Q==;
X-CSE-ConnectionGUID: ourHdcrPRBKDj+lG9BuBgw==
X-CSE-MsgGUID: rosBP0hiSDm711KWinT5uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="89343830"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="89343830"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 12:43:50 -0800
X-CSE-ConnectionGUID: Pb/7iF80RLuKcLUVyyNGvg==
X-CSE-MsgGUID: wzH2iBm5Tj+l3WLZt5z//A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="194294638"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Dec 2025 12:43:49 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQXDv-00000000ABL-0yje;
	Tue, 02 Dec 2025 20:43:47 +0000
Date: Wed, 3 Dec 2025 04:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 3/3]
 include/trace/stages/init.h:2:23: warning: 'str__bl_hib__trace_system_name'
 defined but not used
Message-ID: <202512030453.A8a8GK5N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shreyas,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   db0c22e7c787ae43e1961147bbefee206bb885ee
commit: 4f8ffa0f055581b1f71a2abb6abd409022f47658 [3/3] ANDROID: vendor hooks: Add hooks to support bootloader based hibernation
config: arm64-randconfig-004-20251203 (https://download.01.org/0day-ci/archive/20251203/202512030453.A8a8GK5N-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030453.A8a8GK5N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030453.A8a8GK5N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27:0,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/bl_hib.h:28,
                    from drivers/android/vendor_hooks.c:47:
>> include/trace/stages/init.h:2:23: warning: 'str__bl_hib__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
    #define __app__(x, y) str__##x##y
                          ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
    #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
                                ^~~~~
   include/trace/stages/init.h:8:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
     static const char TRACE_SYSTEM_STRING[] = \
                       ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
    TRACE_MAKE_SYSTEM_STR();
    ^
   In file included from include/trace/trace_events.h:27:0,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/rwsem.h:36,
                    from drivers/android/vendor_hooks.c:46:
   include/trace/stages/init.h:2:23: warning: 'str__rwsem__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
    #define __app__(x, y) str__##x##y
                          ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
    #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
                                ^~~~~
   include/trace/stages/init.h:8:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
     static const char TRACE_SYSTEM_STRING[] = \
                       ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
    TRACE_MAKE_SYSTEM_STR();
    ^
   In file included from include/trace/trace_events.h:27:0,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/topology.h:25,
                    from drivers/android/vendor_hooks.c:45:
   include/trace/stages/init.h:2:23: warning: 'str__topology__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
    #define __app__(x, y) str__##x##y
                          ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
    #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
                                ^~~~~
   include/trace/stages/init.h:8:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
     static const char TRACE_SYSTEM_STRING[] = \
                       ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
    TRACE_MAKE_SYSTEM_STR();
    ^
   In file included from include/trace/trace_events.h:27:0,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/fault.h:18,
                    from drivers/android/vendor_hooks.c:44:
   include/trace/stages/init.h:2:23: warning: 'str__fault__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
    #define __app__(x, y) str__##x##y
                          ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
    #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
                                ^~~~~
   include/trace/stages/init.h:8:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
     static const char TRACE_SYSTEM_STRING[] = \
                       ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
    TRACE_MAKE_SYSTEM_STR();
    ^
   In file included from include/trace/trace_events.h:27:0,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/traps.h:18,
                    from drivers/android/vendor_hooks.c:43:
   include/trace/stages/init.h:2:23: warning: 'str__traps__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
    #define __app__(x, y) str__##x##y
                          ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
    #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
                                ^~~~~
   include/trace/stages/init.h:8:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
     static const char TRACE_SYSTEM_STRING[] = \
                       ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
    TRACE_MAKE_SYSTEM_STR();
    ^
   In file included from include/trace/trace_events.h:27:0,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/mm.h:61,
                    from drivers/android/vendor_hooks.c:42:
   include/trace/stages/init.h:2:23: warning: 'str__mm__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
    #define __app__(x, y) str__##x##y
                          ^~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]


vim +/str__bl_hib__trace_system_name +2 include/trace/stages/init.h

af6b9668e85ffd Steven Rostedt (Google  2022-03-03 @2) #define __app__(x, y) str__##x##y
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  3) #define __app(x, y) __app__(x, y)
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  4) 

:::::: The code at line 2 was first introduced by commit
:::::: af6b9668e85ffd1502aada8036ccbf4dbd481708 tracing: Move the defines to create TRACE_EVENTS into their own files

:::::: TO: Steven Rostedt (Google) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
