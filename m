Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083EF9454
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 22:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683065087; x=1714601087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fjLl4+IdJt3iMDGankatkTEIHaBPYla9mafe3A+07pU=;
  b=Ucde5EDhR/UgzhSlXX2pHDDWZjDK68SADV2hvIzaOKQtoAW70fmrP7ae
   vwYyRqbTOjZ7nc0YmeMXhznM7Tv3OOIyporpKXD7JytWFA/aPVpb/RlJ6
   7jnO7CfmLcF1FofWrMruFdBktGMPUOr+MdlJfMDArAw0GcTPHBb4LWMfF
   ogpPjsPO5q4/XQ7jlJc+8en22t0Y7Lbq00MSwQjT3WFXXr/5co34ToRAc
   OmxIOsyXSQPrH91+34VhrVKxwfGo7bRV2ubmkWE9LtObXvC49a8dtRgvA
   0toD7SLnSSzovIwCfuLAlj7neMosy1sE0yxU+sIsuVV6ruO9WG4a9t81Q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="411659607"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="411659607"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 15:04:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="808011551"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="808011551"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 May 2023 15:04:40 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pty6x-0001J2-2e;
	Tue, 02 May 2023 22:04:39 +0000
Date: Wed, 3 May 2023 06:04:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 10232/25674]
 include/trace/trace_events.h:26:23: warning:
 'str__minidump__trace_system_name' defined but not used
Message-ID: <202305030559.mSHCtogJ-lkp@intel.com>
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
head:   edbf3d0e067c6c4acf19d8ede1aa69ef4b552fdc
commit: 802f3427132ac1d3ebbde92d6712f35960cc8354 [10232/25674] ANDROID: vendor_hooks: Add hooks for debugging exception context
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230503/202305030559.mSHCtogJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android11-5.4
        git checkout 802f3427132ac1d3ebbde92d6712f35960cc8354
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/android/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305030559.mSHCtogJ-lkp@intel.com/

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
https://github.com/intel/lkp-tests
