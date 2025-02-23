Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39E417BA1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 03:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740281567; cv=none; b=gb2z08tV7aLoQElqu1JFTvAj+jRYDt0kyno5bsd39lsQ0mb6rgJm1q195rUlAV0msiZZWIH0d2VVNw3xX7xgrhdg9VjrYMJV48tNiaeKyzujz5M2K+W+Q+0FlZGkJi/wxuz4AyIwPoScd4S5MTE5kcuAM+73Gksp9RR8YcPEaW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740281567; c=relaxed/simple;
	bh=IjOCYyfSZvndSIlHeiEtiRwiQDltIeIp8XiAqFTzMOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uEW07zht6s+La/hIw4IFzqXGzsk9B5kwkY8OcFuUd28zgDCdZ1MxOzA7f8rQnfRhiUWaEv/ORNCwHKpy+QHX3c0eyogFVvqgcPQtsxS6bZwwxpHxW88D2C2jMjqCPg0UZKmFYL0MsXjEDXihJGVkdORof6r1G55ou4794/QO6h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddsnQ736; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddsnQ736"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740281566; x=1771817566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IjOCYyfSZvndSIlHeiEtiRwiQDltIeIp8XiAqFTzMOQ=;
  b=ddsnQ736kb+iHF8Bc/ziAjoqJPG6mBPJDGmJyX2XRSMc9xQz2Wt0jgKh
   HHU7TxpwWKYJfhd5Afi82vugYorPBmKNEEjPgvBJ+6NAf0IFI1FLzqSNc
   PAOys8J+L6KZ4EI6ICfNmKSZOVDYHxts63flpljH0gPR8+b94YGUuNR5z
   VLKAktpmXjJOjEHjVYruBgSLh4RrMjBU5HXWvYbF+YVHuYca/z2AJPKEz
   NtISWRIkezzaShmrEqwYHFBygACStaLqBqpDSnRIzGgwMPvVZMavSa2ws
   nTs7piB5o/agWIA16GOdts+/kLEMz8G9VcmD6FnoFhOMVF7BeTmZzErZo
   w==;
X-CSE-ConnectionGUID: XC4QqanfROSLVBf5+GFCvw==
X-CSE-MsgGUID: xXsT5oZ1SjGpQdQHPTUtqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41271348"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41271348"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 19:32:45 -0800
X-CSE-ConnectionGUID: keUDM3JjTn6QSmqXWefZYg==
X-CSE-MsgGUID: GxA3Q9/ASI6aZ0kIgQm32Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="146581357"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Feb 2025 19:32:44 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tm2jR-00076b-2x;
	Sun, 23 Feb 2025 03:32:41 +0000
Date: Sun, 23 Feb 2025 11:32:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 422/422]
 include/trace/trace_events.h:26:23: warning:
 'str__minidump__trace_system_name' defined but not used
Message-ID: <202502231140.MmjdGYAn-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   e7df0e6776f0469d11ef3e42afbf2f5c16ea5530
commit: 802f3427132ac1d3ebbde92d6712f35960cc8354 [422/422] ANDROID: vendor_hooks: Add hooks for debugging exception context
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250223/202502231140.MmjdGYAn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502231140.MmjdGYAn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502231140.MmjdGYAn-lkp@intel.com/

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
