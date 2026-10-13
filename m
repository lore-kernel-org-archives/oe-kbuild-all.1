Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FEB50B428
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 16:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909162; cv=none; b=DFVND6CTS9zfunnvO2pJ8pxU689jUSwT64WHEMMf8LMEVgcv1gi+sgeBXiNbyINZ3xkIMacGl2hjS3GqYNS8jvjQ6cU9AOZU+otvozm3cb+bkaKPSdF8HBbxJiobt6/0we0X/HFyQpy6uLoRsljyDhOZArs5jBMrBgIFLnkNcLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909162; c=relaxed/simple;
	bh=Jgtn94ltjZsM2UtH3QH6uyKh5dLHU8pFw3txkXE+Zag=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tnK4Wgqc1q5oYwLeW+1l63DXd+Jtj0nl5CdrmcTU8L2nlk8Rvp48K60RML5zGfy9kxLZ00ubJwkNIsZ+na6U5I3sGS8kLmYNhuqJR/AMtEnG6Uoqj2r5SvDjmH819Dbonq2uwhbhIK15l/vHacr3B3KaB1bokrjzgsPppWNCoi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9fDoB2g; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9fDoB2g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791909161; x=1823445161;
  h=date:from:to:cc:subject:message-id;
  bh=Jgtn94ltjZsM2UtH3QH6uyKh5dLHU8pFw3txkXE+Zag=;
  b=n9fDoB2gejMUrn0+id5ifW+FsOoqb/Jx4bfWpbqj9/lfwOWoQfp4k8kT
   C9lDGgw10F7WneYPKSTM8olAe0Z7jOiklGnggXtKnXY03b8+u7l7c4pYX
   pVYvkKrVcrfkCnximQnYQnCLXzqEgbY1WT19BVDI3yi0yPXYMhA0qfQSj
   T1wdIQfNC1LauG2sNSYB2iEEf6LssEVGv0fAaluonujD5cPA530gkw6k6
   9mjN2IgMPGyzfvGY59w98LDd07XqFlI/Hpbg+UzHBUPImaA748yf/9pvv
   YuidnXFFqEkBwHGETrymnO7jbuZ/GnH8tOX/kOPOO66cYHBqSgbCQou16
   A==;
X-CSE-ConnectionGUID: +3Iu0W4+Q0GMkmLeyZWclQ==
X-CSE-MsgGUID: OMaRaPRmTvG0Y4WqKJjHfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="536535"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="536535"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 09:32:40 -0700
X-CSE-ConnectionGUID: V5FKK6QsQS+4qzSrq+gZhw==
X-CSE-MsgGUID: YC8ntXfsSJOOMYv1a5hdyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1641767"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 13 Oct 2026 09:32:39 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGfQa-00000000AaN-39cF;
	Tue, 13 Oct 2026 16:32:36 +0000
Date: Tue, 13 Oct 2026 18:32:30 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1]
 include/trace/trace_events.h:27:23: warning: 'str__typec__trace_system_name'
 defined but not used
Message-ID: <202610131844.oe7mnwqP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Badhri,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   9debaec240781879fbb65b9303f7cfc3e1d96c02
commit: 98706062837061bc0dc49e22110a34d9f50aa7e9 [1/1] ANDROID: usb: typec: tcpci: Add vendor hooks for tcpci interface
config: arm64-randconfig-2000-20261013 (https://download.01.org/0day-ci/archive/20261013/202610131844.oe7mnwqP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131844.oe7mnwqP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610131844.oe7mnwqP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/typec.h:21,
                    from drivers/android/vendor_hooks.c:72:
>> include/trace/trace_events.h:27:23: warning: 'str__typec__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                       ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
    TRACE_MAKE_SYSTEM_STR();
    ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/mmc.h:56,
                    from drivers/android/vendor_hooks.c:67:
   include/trace/trace_events.h:27:23: warning: 'str__mmc__trace_system_name' defined but not used [-Wunused-const-variable=]
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


vim +/str__typec__trace_system_name +27 include/trace/trace_events.h

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
