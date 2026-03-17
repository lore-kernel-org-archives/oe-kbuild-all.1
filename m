Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE392261B70
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 15:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773763102; cv=none; b=JziBwqBCFvEPrgQVNNI57D7ApxsdOOQu52IT5fENzKCYmB+rAJjjnqRitaiOFKFPPOXehot+lefgAaZ+49zGlqduiOvQa40vHJKkrGv4Uy77/zhtKCNrpSFiQTAqMkHpNmV0gNGmL11jlRSikbtPlUFTlJ7F46I1iyMG1VoR7qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773763102; c=relaxed/simple;
	bh=jcUJ+EJvexi3OohA4ufn8Yvgzukha3zXy2BKNPTXrUU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DOCtlkm6rTBjNc5piazkkGuWPVJFaDegdlgpauINvHLHFWb9aAeOQk8AdH2Diea8keQ/thOIU31SvAAYEDAYVOZt8YRx/kUm1xI/cS+iG8fdAa18uaCbM1Hv5aC8lvUfSNvChFgLTNo2kuu4y3m/vDPouqV3TnNAxclUd0jW9zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JjPqqOdw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JjPqqOdw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773763101; x=1805299101;
  h=date:from:to:cc:subject:message-id;
  bh=jcUJ+EJvexi3OohA4ufn8Yvgzukha3zXy2BKNPTXrUU=;
  b=JjPqqOdwRALhQzrXt9H0zUWtykSCJGvhmSp0VSq23DctrPgSYxYP2Li3
   /1R0yEeXVtaIfR5Z8rikJQpFTju3v3zU7YYAW4nOZnwazjP8m5yAWieHj
   J37dBMpzBu3Wkta940w7C1bQErMmME1xPyO2m42oEgvNMbVulWCZ9Klum
   B/hxDls9CnUw65bZznBaNxKiY77gQl8OLdhjPrC7XQbZQ/4t5Eyc3Y/4s
   xBdOCptZILvuaGMSDIcqMR/7Qf8xqrxft0C7aEiu17JmBRHfcF/l/TiPg
   u/FKIz9p1A5oSs54inbC9B3bKapSszG3Ld7b+OulShhuRvKgSbCkz6jvL
   w==;
X-CSE-ConnectionGUID: 3Q+l7OEvTQaFrAZ/ViVbrg==
X-CSE-MsgGUID: J4gvVw43S9uAS6fSM3Q4Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92181843"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="92181843"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 08:58:20 -0700
X-CSE-ConnectionGUID: ChIGCrdaRFezRJL0Ha3Prg==
X-CSE-MsgGUID: +w7cbw0zSZKAAN/54PUDFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="219408090"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Mar 2026 08:58:19 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2WoC-000000000gT-1Vwz;
	Tue, 17 Mar 2026 15:58:16 +0000
Date: Tue, 17 Mar 2026 23:57:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 include/trace/stages/init.h:2:23: warning: 'str__logbuf__trace_system_name'
 defined but not used
Message-ID: <202603172349.rkCaZWgQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mukesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   7363accb86b4356c009ed0feb260a483a31cfbed
commit: e22678715e9f188f443f57496e30d3101ab0874b [1/1] ANDROID: logbuf: vendor hook for logbuf dump on oops
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260317/202603172349.rkCaZWgQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603172349.rkCaZWgQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603172349.rkCaZWgQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1082,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:11,
                    from include/linux/iova.h:15,
                    from drivers/android/vendor_hooks.c:9:
   include/linux/percpu-rwsem.h: In function 'percpu_down_read':
   include/linux/percpu-rwsem.h:70:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      70 |         _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                       ^
   include/linux/percpu-rwsem.h: In function 'percpu_down_read_trylock':
   include/linux/percpu-rwsem.h:97:63: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      97 |                 _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                               ^
   include/linux/percpu-rwsem.h: In function 'percpu_up_read':
   include/linux/percpu-rwsem.h:128:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     128 |         _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, 0);
         |                                                       ^
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/logbuf.h:21,
                    from drivers/android/vendor_hooks.c:61:
   include/trace/stages/init.h: At top level:
>> include/trace/stages/init.h:2:23: warning: 'str__logbuf__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
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
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/signal.h:16,
                    from drivers/android/vendor_hooks.c:60:
   include/trace/stages/init.h:2:23: warning: 'str__signal__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
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
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/gzvm.h:16,
                    from drivers/android/vendor_hooks.c:59:
   include/trace/stages/init.h:2:23: warning: 'str__gzvm__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
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
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/power.h:21,
                    from drivers/android/vendor_hooks.c:58:
   include/trace/stages/init.h:2:23: warning: 'str__power__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
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
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/softlockup.h:17,
                    from drivers/android/vendor_hooks.c:57:
   include/trace/stages/init.h:2:23: warning: 'str__softlockup__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
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
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/bug.h:16,
                    from drivers/android/vendor_hooks.c:56:
   include/trace/stages/init.h:2:23: warning: 'str__bug__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~


vim +/str__logbuf__trace_system_name +2 include/trace/stages/init.h

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
