Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A7F3191DB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 08:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758614621; cv=none; b=NiIof/fGnhU75w1dPU6BtfVz9w/q6+pbABGImUkbIu3UABr6/5CgIBfpCfrqKMZcxSveiCwP5oG2Rmfc7WY9tONs+OojKN/dYH0piSf/7xKY9KhcGrhALYGuKL7fxpSVs9Kkm1jlAd8HbyKLB0+5CB47lkxJLlsP/pp41hJpVws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758614621; c=relaxed/simple;
	bh=LG5C7ajx37f09hisG2HvgSRJFIU+cbW1X66jvEe1Lho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A0hKwBEXgyoMKQe6tKhQYd3kMVtUryyk8mEyAsldNjbNxbPh3NW4Voe5ZdO2gynBh4iUmBf2D+bVH+f4Mv5k7bb6v8Zuhv+hTB1G1F8IJyNyyIgV3poRsKljzaRqdlck6Sbe1fjzPu5UPf4h2KJu5onOMp//nzdYmpztiqMhgCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EZTRdwCd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EZTRdwCd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758614620; x=1790150620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LG5C7ajx37f09hisG2HvgSRJFIU+cbW1X66jvEe1Lho=;
  b=EZTRdwCdOlnn03xChFyqVN0JzDHVdXt6UgoB3Vq5XxtGn0KWVzUnmcRi
   T8gVo2mEOoxwNULR8klLWMRLdLunqTVAwqQjP4xG7CsEK69Pk2BRmajxu
   7eekQ54WWZHuRpuKLAPdQ5SOAoxakmiVGjHm7qNInI1HJXOBJDo12K24C
   VZrDHFVhjTzYK9H5YhHLylG/o/7F2x1zMvU5l0Ytpx6XW9eyiRP3g/lo3
   /9/fYoBwYoECwj98DcUOjJRW/v1I5jEO86cjrT4yHD0vcE3S2WUeW/+or
   Wt6zGNrd4O7Z3df8qSQ+d5R5j69AqOOXixKe+ZzVbS11p48FYqwWUrljA
   g==;
X-CSE-ConnectionGUID: Ny/lhBcdQISuymR/gQwczQ==
X-CSE-MsgGUID: KB5Kbwf1R56pfd6v352xEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60827982"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60827982"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 01:03:39 -0700
X-CSE-ConnectionGUID: lN2OBqzuTwuQxPt7hjX0wg==
X-CSE-MsgGUID: uH+Qyn5DRSmhsmmdLnF/zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="176283680"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Sep 2025 01:03:39 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0xzW-0002sv-0e;
	Tue, 23 Sep 2025 08:03:29 +0000
Date: Tue, 23 Sep 2025 16:02:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/1]
 include/trace/trace_events.h:26:23: warning:
 'str__minidump__trace_system_name' defined but not used
Message-ID: <202509231503.IYam04NN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi yong,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   c92395c2d69365e987de03603133963279b28a32
commit: 802f3427132ac1d3ebbde92d6712f35960cc8354 [1/1] ANDROID: vendor_hooks: Add hooks for debugging exception context
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250923/202509231503.IYam04NN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231503.IYam04NN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231503.IYam04NN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/minidump.h:23,
                    from drivers/android/vendor_hooks.c:20:
>> include/trace/trace_events.h:26:23: warning: 'str__minidump__trace_system_name' defined but not used [-Wunused-const-variable=]
      26 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:21: note: in expansion of macro '__app__'
      27 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:29:29: note: in expansion of macro '__app'
      29 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:32:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      32 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:35:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      35 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/debug.h:29,
                    from drivers/android/vendor_hooks.c:19:
   include/trace/trace_events.h:26:23: warning: 'str__debug__trace_system_name' defined but not used [-Wunused-const-variable=]
      26 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:21: note: in expansion of macro '__app__'
      27 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:29:29: note: in expansion of macro '__app'
      29 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:32:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      32 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:35:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      35 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/topology.h:27,
                    from drivers/android/vendor_hooks.c:18:
   include/trace/trace_events.h:26:23: warning: 'str__topology__trace_system_name' defined but not used [-Wunused-const-variable=]
      26 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:21: note: in expansion of macro '__app__'
      27 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:29:29: note: in expansion of macro '__app'
      29 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:32:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      32 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:35:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      35 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/fpsimd.h:26,
                    from drivers/android/vendor_hooks.c:17:
   include/trace/trace_events.h:26:23: warning: 'str__fpsimd__trace_system_name' defined but not used [-Wunused-const-variable=]
      26 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:21: note: in expansion of macro '__app__'
      27 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:29:29: note: in expansion of macro '__app'
      29 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:32:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      32 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:35:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      35 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/futex.h:26,
                    from drivers/android/vendor_hooks.c:16:
   include/trace/trace_events.h:26:23: warning: 'str__futex__trace_system_name' defined but not used [-Wunused-const-variable=]
      26 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:21: note: in expansion of macro '__app__'
      27 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:29:29: note: in expansion of macro '__app'
      29 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:32:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      32 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:35:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      35 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/rwsem.h:38,
                    from drivers/android/vendor_hooks.c:15:
   include/trace/trace_events.h:26:23: warning: 'str__rwsem__trace_system_name' defined but not used [-Wunused-const-variable=]
      26 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:21: note: in expansion of macro '__app__'
      27 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:29:29: note: in expansion of macro '__app'
      29 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:32:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      32 |         static const char TRACE_SYSTEM_STRING[] =       \

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GENERIC_GETTIMEOFDAY
   Depends on [n]: HAVE_GENERIC_VDSO [=n]
   Selected by [y]:
   - HAVE_ARM_ARCH_TIMER [=y] && CPU_V7 [=y]


vim +/str__minidump__trace_system_name +26 include/trace/trace_events.h

acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  25) 
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31 @26) #define __app__(x, y) str__##x##y
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  27) #define __app(x, y) __app__(x, y)
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  28) 

:::::: The code at line 26 was first introduced by commit
:::::: acd388fd3af350ab24c6ab6f19b83fc4a4f3aa60 tracing: Give system name a pointer

:::::: TO: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
