Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D717E28C841
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 21:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756157193; cv=none; b=MFIjSwRSywGvDbgfVQIgPcil1mWuzwFBn8aVo3IBK3eyI7Yy+32psjnPLeDNYvxcxmq3GOMy/PUzB6LORpCWJ7eBM5bORADywEMs9ZI23iK3nMPQ7X/FzYLOwXDvAcrNXZ/12cXlRUuzRx5ZH6BxEQgRj8LOBTTOTJK25cr2T8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756157193; c=relaxed/simple;
	bh=BcQldclkhfhZe5udScDXrYXm6vp6qxpH2MyDEwcyuXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r8bTv0EFh44OhwxziDMfRHo/2s+TUeEJGF/uK9nJnUCc1SyGGif/87iYWxeBgIZiHq8yyYGG8HiMSisRNpFFi0cK+O1P62LEbhkasjeN/V4SxjYa4oPfCSeQnk+WJoSSWXEOHhUi96rhzq7GafE6c40MOhB49nXchuOU/a4EEGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SD8YyJxA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SD8YyJxA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756157191; x=1787693191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BcQldclkhfhZe5udScDXrYXm6vp6qxpH2MyDEwcyuXk=;
  b=SD8YyJxAmHzemamZjI9MSP/VKsLMwlWGFqjbig/XLSphzRa5Qi4LRZhI
   gBNJwScPcI9f90Uhi/XbQgRvadvcuu6ByUzT0Mnyo7dV23SxP5K4LBB5u
   +9KOn5id8OVjL3dASl+9cSbLj2YDIFmufSdrPwc7lbNdkc8RunIcZI7rz
   G4pzu+jqv5Nr8YrkYcmM9e8inRlCJOuMhYi6IFh0Gj6fYTI+TvFn52Nmo
   pjOQ43qC9iQKmbH3UbAJz1thLMejl76rNF6K+fbc+vDbeJoHV+XDSvasP
   MTGswbqpnPzYH0hTk7vqyZx7X1D22NetB6jDLKPtSM2y6/Lc1+tNgBy/l
   g==;
X-CSE-ConnectionGUID: rALFLIfcTxGnAkATIoXC8w==
X-CSE-MsgGUID: /7SUMnkrS2q8IAv0vyyOOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69754088"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="69754088"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 14:26:30 -0700
X-CSE-ConnectionGUID: P0hnL5OyQ1mDqdv+3V9NTw==
X-CSE-MsgGUID: vNtyd7olRKO6Al6+9YPZ3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="173573148"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 25 Aug 2025 14:26:29 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqehu-000O1D-2n;
	Mon, 25 Aug 2025 21:26:26 +0000
Date: Tue, 26 Aug 2025 05:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 6/6]
 include/trace/stages/init.h:2:23: warning: 'str__suspend__trace_system_name'
 defined but not used
Message-ID: <202508260523.4GPwfOV6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   c4523fe1e7d3970f898de09e766d30dc74b84277
commit: 258557effaabe1936cf4ad1fbd110b6168b79105 [6/6] ANDROID: power: Add vendor hook for suspend
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20250826/202508260523.4GPwfOV6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250826/202508260523.4GPwfOV6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508260523.4GPwfOV6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:109,
                    from include/trace/hooks/suspend.h:28,
                    from drivers/android/vendor_hooks.c:75:
>> include/trace/stages/init.h:2:23: warning: 'str__suspend__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:109,
                    from include/trace/hooks/ogki_honor.h:31,
                    from drivers/android/vendor_hooks.c:74:
   include/trace/stages/init.h:2:23: warning: 'str__ogki_honor__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:109,
                    from include/trace/hooks/fuse.h:24,
                    from drivers/android/vendor_hooks.c:73:
   include/trace/stages/init.h:2:23: warning: 'str__fuse__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:109,
                    from include/trace/hooks/fsnotify.h:23,
                    from drivers/android/vendor_hooks.c:72:
   include/trace/stages/init.h:2:23: warning: 'str__fsnotify__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:109,
                    from include/trace/hooks/blk.h:47,
                    from drivers/android/vendor_hooks.c:71:
   include/trace/stages/init.h:2:23: warning: 'str__blk__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:109,
                    from include/trace/hooks/madvise.h:26,
                    from drivers/android/vendor_hooks.c:69:
   include/trace/stages/init.h:2:23: warning: 'str__madvise__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~


vim +/str__suspend__trace_system_name +2 include/trace/stages/init.h

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
