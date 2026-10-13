Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A0248AE16
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 22:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791929515; cv=none; b=iiBwDEra/4iLclA/bj88VSJtJrMP4eSlQAaZSSW2LLqrP8P29692PKnC2GNLZD+aQjtUhqajQ/05zc+3Q/9reXhbfHQo4+GzD4nr43lt6Uxt69sFBSPPs8IAHHgZz9CHuJUAsgu36xvoVhQ6remaDjQE11caraylyDIBC3mrclw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791929515; c=relaxed/simple;
	bh=L6FMKL6tHaNekdJSnmBcvx/PPUt0vpqU0rAIsMV/hHs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iNNuIrUu4go1Oh1C+okToI3Y95kZA9zhbWsZx+r9nq2rxVCM55FfyoY2qyes03QK6T7BXppLn9vKHpQldPY8NK/BXGiHfXCO8gdZPnXqd4WmSBsUmLl0jUeyIQV19qt4bZ3GHbIFN51Wyk1QbhngzQEPhG0mYOMYuRMnFl9Uf8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KbZrUvbi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KbZrUvbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791929512; x=1823465512;
  h=date:from:to:cc:subject:message-id;
  bh=L6FMKL6tHaNekdJSnmBcvx/PPUt0vpqU0rAIsMV/hHs=;
  b=KbZrUvbiCCjBfSPYFqxhAUcHDNOfJEWFL8xYlzGE0QIrmt7i94lroaII
   gStRKf+RpqkkjZmnqQ4GxpeEYO0hZmyvv5uVod7t7bu/8DdJI1VRCQBWt
   OvdSAIuYhDRhrdxh+8BSQMD4/3yjmzN8qJDCK2SRmUZeODObMoqpSXJwK
   DtxPForAhDBeuJdZSIfuco/9Jxh2CSmy0rd3jFr+wpuMxmqOOG33MdtfQ
   ym/foLQ11r7BRsiKjH4FiDa6Jnadth5a7DVXMmkzdD1YKJPIoOJL2H8Jc
   J713Z4aV/GviUy7Z4sVKqL3azFPa4+Sd6DZtSTSSiuuGm9a6O1EQ9uH6P
   Q==;
X-CSE-ConnectionGUID: Gf6uys1fTuu4GxHV3y1+PQ==
X-CSE-MsgGUID: +ZMIjbc7TY+GGfdT2LInnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="676014"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="676014"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 15:11:51 -0700
X-CSE-ConnectionGUID: PEj76zvJSNaqcx38oADrnw==
X-CSE-MsgGUID: l9ud8o5uRG2jOyI2lXFAVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3120069"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 13 Oct 2026 15:11:49 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGkip-00000000Ai3-1efD;
	Tue, 13 Oct 2026 22:11:47 +0000
Date: Wed, 14 Oct 2026 00:11:07 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1]
 include/trace/trace_events.h:27:23: warning: 'str__sound__trace_system_name'
 defined but not used
Message-ID: <202610140017.VV08XMI7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi JJ,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   9debaec240781879fbb65b9303f7cfc3e1d96c02
commit: 4cbf19a6f8635cd0227ab790ce570d8da7b1564a [1/1] ANDROID: sound: usb: add vendor hook for cpu suspend support
config: arm64-randconfig-2000-20261013 (https://download.01.org/0day-ci/archive/20261014/202610140017.VV08XMI7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610140017.VV08XMI7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610140017.VV08XMI7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/sound.h:18,
                    from drivers/android/vendor_hooks.c:73:
>> include/trace/trace_events.h:27:23: warning: 'str__sound__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^~~~~
   include/trace/trace_events.h:27:23: note: in definition of macro '__app__'
    #define __app__(x, y) str__##x##y
                          ^~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
    #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
                                ^~~~~
   include/trace/trace_events.h:33:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
     static const char TRACE_SYSTEM_STRING[] = \
                       ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
    TRACE_MAKE_SYSTEM_STR();
    ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/typec.h:59,
                    from drivers/android/vendor_hooks.c:72:
   include/trace/trace_events.h:27:23: warning: 'str__typec__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^~~~~
   include/trace/trace_events.h:27:23: note: in definition of macro '__app__'
    #define __app__(x, y) str__##x##y
                          ^~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
    #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
                                ^~~~~
   include/trace/trace_events.h:33:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
     static const char TRACE_SYSTEM_STRING[] = \
                       ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
    TRACE_MAKE_SYSTEM_STR();
    ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/suspend.h:26,
                    from drivers/android/vendor_hooks.c:71:
   include/trace/trace_events.h:27:23: warning: 'str__suspend__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^~~~~
   include/trace/trace_events.h:27:23: note: in definition of macro '__app__'
    #define __app__(x, y) str__##x##y
                          ^~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
    #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
                                ^~~~~
   include/trace/trace_events.h:33:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
     static const char TRACE_SYSTEM_STRING[] = \
                       ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
    TRACE_MAKE_SYSTEM_STR();
    ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/signal.h:20,
                    from drivers/android/vendor_hooks.c:70:
   include/trace/trace_events.h:27:23: warning: 'str__signal__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^~~~~
   include/trace/trace_events.h:27:23: note: in definition of macro '__app__'
    #define __app__(x, y) str__##x##y
                          ^~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
    #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
                                ^~~~~
   include/trace/trace_events.h:33:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
     static const char TRACE_SYSTEM_STRING[] = \
                       ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
    TRACE_MAKE_SYSTEM_STR();
    ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/ipv4.h:33,
                    from drivers/android/vendor_hooks.c:69:
   include/trace/trace_events.h:27:23: warning: 'str__ipv4__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^~~~~
   include/trace/trace_events.h:27:23: note: in definition of macro '__app__'
    #define __app__(x, y) str__##x##y
                          ^~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
    #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
                                ^~~~~
   include/trace/trace_events.h:33:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
     static const char TRACE_SYSTEM_STRING[] = \
                       ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
    TRACE_MAKE_SYSTEM_STR();
    ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/evdev.h:18,
                    from drivers/android/vendor_hooks.c:68:
   include/trace/trace_events.h:27:23: warning: 'str__evdev__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^~~~~
   include/trace/trace_events.h:27:23: note: in definition of macro '__app__'
    #define __app__(x, y) str__##x##y
                          ^~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
    #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
                                ^~~~~
   include/trace/trace_events.h:33:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
     static const char TRACE_SYSTEM_STRING[] = \

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


vim +/str__sound__trace_system_name +27 include/trace/trace_events.h

acd388fd3af350a include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  26) 
acd388fd3af350a include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31 @27) #define __app__(x, y) str__##x##y
acd388fd3af350a include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  28) #define __app(x, y) __app__(x, y)
acd388fd3af350a include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  29) 

:::::: The code at line 27 was first introduced by commit
:::::: acd388fd3af350ab24c6ab6f19b83fc4a4f3aa60 tracing: Give system name a pointer

:::::: TO: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
