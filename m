Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63259C8F6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 20:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686427826; x=1717963826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F5eg5MtnNrhzoZevAmE0L2TEehyr1HL7LB94ZgFGJ4k=;
  b=hDOP/RmrtPc2XdnfIcr0GmRfj9lYYk4eWQyTvn8Iwk+dNVBSmP4zFxLz
   9l80/TqoSufRXLfS7UHxBdFFujniCm8YMs8kT4iSo4rpk/tNSFfVRNmAF
   t2nXw9lvjA2wbfBjAXLaW1G5U1tNNEjkbw5iE2DUpd6xb34XjDeDQYzoW
   IhAL6QzTv1kE1RQXm1DN0kLKeKu9PSY1Vz1qo+zSazgOK0Ywx9sVzVt8F
   C6CrwGwvTjFKW9gFQFXqhUFT37JgVRAFjunuRYKpvd8ilX8rDsdTBBjNO
   J+KQS2lOPYt+I4FcDWwZ1D2hH8UuGHuVfzbWjiQ0vAGejsYBafI9kWDb1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="357799614"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="357799614"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 13:10:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="834998146"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="834998146"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Jun 2023 13:10:24 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q84ul-000AP2-0p;
	Sat, 10 Jun 2023 20:10:23 +0000
Date: Sun, 11 Jun 2023 04:10:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1822/23309]
 include/trace/trace_events.h:27:23: warning: 'str__epoch__trace_system_name'
 defined but not used
Message-ID: <202306110422.fDYyJG4e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Murali,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   c1d11308117b35f068fbfdb4b8df8b0532f2d7f4
commit: 76b58ff07b29541231a8e0781ef0e3865495a4f6 [1822/23309] ANDROID: sched_clock: Add vendor hook to print epoch values
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230611/202306110422.fDYyJG4e-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-5.15
        git checkout 76b58ff07b29541231a8e0781ef0e3865495a4f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/android/ drivers/md/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306110422.fDYyJG4e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/epoch.h:31,
                    from drivers/android/vendor_hooks.c:26:
>> include/trace/trace_events.h:27:23: warning: 'str__epoch__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/gic_v3.h:29,
                    from drivers/android/vendor_hooks.c:25:
   include/trace/trace_events.h:27:23: warning: 'str__gic_v3__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/printk.h:27,
                    from drivers/android/vendor_hooks.c:24:
   include/trace/trace_events.h:27:23: warning: 'str__printk__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/sysrqcrash.h:24,
                    from drivers/android/vendor_hooks.c:23:
   include/trace/trace_events.h:27:23: warning: 'str__sysrqcrash__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/debug.h:26,
                    from drivers/android/vendor_hooks.c:22:
   include/trace/trace_events.h:27:23: warning: 'str__debug__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/wqlockup.h:24,
                    from drivers/android/vendor_hooks.c:21:
   include/trace/trace_events.h:27:23: warning: 'str__wqlockup__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \


vim +/str__epoch__trace_system_name +27 include/trace/trace_events.h

acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  26) 
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31 @27) #define __app__(x, y) str__##x##y
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  28) #define __app(x, y) __app__(x, y)
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  29) 

:::::: The code at line 27 was first introduced by commit
:::::: acd388fd3af350ab24c6ab6f19b83fc4a4f3aa60 tracing: Give system name a pointer

:::::: TO: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
