Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAD217C2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 00:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692144076; x=1723680076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gEB0Kq814sEu6VmFwhUrtObvMF6Kf6L0Lz/KXBEeX3g=;
  b=IDvWHcjpUlBE4HUEJih9mr71nAclZcTet4c1DrWnMyPIuTxM7SoUhCDV
   LA4XlrfLO26S03gCne4iEK2sN79tydDAQwkOf7BvqHUNGjhg3AZaKKHrn
   1sIz9L6Mws0wfd4aP3ntmYlgLwWjjd/VgNzwWun8tRXQxrUXuNWkoXe+G
   vBOwBo8+eBvg5Jl0JXp+ZORi7BcUtzIQ9KllqAlnD2XIjmP7SPuZsQBF7
   vXr898ekVpyyU5iLFdznBWCHCTx2ezH1YUJESHot6g8NiNPyFmtZQ90fd
   CohpH33WtjNLHwTEdYbnXMbtKNR8amAu7FUjbmOnk/oWG1bBHq4BfsC9F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375175268"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="375175268"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 17:01:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="1064618795"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="1064618795"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2023 17:01:14 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW3yL-0001Kl-1M;
	Wed, 16 Aug 2023 00:01:13 +0000
Date: Wed, 16 Aug 2023 08:00:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 10232/27202]
 include/trace/trace_events.h:26:23: warning:
 'str__minidump__trace_system_name' defined but not used
Message-ID: <202308160711.6sxd15Bp-lkp@intel.com>
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
head:   f38754f7336474b5be6745c90563e6c32b921793
commit: 802f3427132ac1d3ebbde92d6712f35960cc8354 [10232/27202] ANDROID: vendor_hooks: Add hooks for debugging exception context
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230816/202308160711.6sxd15Bp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308160711.6sxd15Bp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308160711.6sxd15Bp-lkp@intel.com/

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
