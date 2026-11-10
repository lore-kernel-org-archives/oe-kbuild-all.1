Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335843;
	b=LYRgupF+Onm08edrkM6J0ltONAVS+3LbciBoO6Ok7x+LJXZrD/Paq0WFdVcA4m1Kl7RU
	 b4XGrMqRfU6uKHGC+uEUTq1MfnhRDO+UlWm/58XVeeftRKWi3ROngV9nDW61NxAmfnEXy
	 pJjCubSy0o7tmhTOP8JvVw7JJ+ub3LwtDFowXBt1eXAVqFDx4xUMIb3zsfMV9NDXnHX/A
	 kMBRKD1zIYgnllNr868h1yENTbNs+qyJy/VSfQMuLGBSHUXL/teZn9Tq8k2nzqH9stI76
	 pEVLpHPjkLNgdkUA1OWeYLtPXmJjeleXRMXx+1ZtV1s5ayZNa/OtpbGtGkC0xvWT07A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335843;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=POfNQIeRh7gg5V65ehaIh5ygw4NmlMsbo9O+CouueLU=;
	b=gYk1965fp/Xb84pQvtf9+9GJEw8cXLmT80Aelqg5fcPzg2zKdHjYJPKu2GmzZdmeqbGj
	 7e0h6HgOybYSE/7jk/fpV5y3YK6CIM6t2Ujrho1dqp9dTcB9sUo4zPFIVgezI7+1iv8LY
	 Oiht/YPjKnYfBtrUC1WVi3ycBy0Gqm4B4N4kLaKtLOfueH7QihB34nHY1xQ9btwP68gol
	 /f5Gk6q+Fix5pt8P9W4udQg6QdRIZxTLXHMv7QWIrGy74WGQ6s3LhqJ/Zb+W21/oGBLe+
	 SQGAu+lzIruPmtRQiO7l0who6UIRcii+HooalXQx+09n/WbKnhbm/cWtu9hWo2nFMnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R2jIvla8;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DDC606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Nov 2026 18:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0DDC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R2jIvla8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794335841; x=1825871841;
  h=date:from:to:cc:subject:message-id;
  bh=r7oVdx5NG6aUsN2VrLBL+H2gWtBUI5gdsEvPmAUImNE=;
  b=R2jIvla8kXOf64smcQ0R/tIMseSb92Sf21RzkwyiTf+W7P8+rGdBH9Ed
   oJrX9WtL0nRGwzwRALryM6OPUgndEoQaORjA0v9X1BBrOVs+/cDgOSkUd
   UZNmTcUJnN6kZQcafLuvjgu5BaF26vy9wPmz9yKaP+j06QG4gb5UyLQRA
   n9gLyAIegjPMt1x0+w7mMbaGpdzyodu9u528b6xFidwAve0XlP4jb4rYe
   NB56pGPalxDlFYUCjjYSH7rP1uoq+ETF0PCKeghhDTLlLnWn9zllzH0Ic
   I7vAQFUn+Va8h6XusZ4ifZi8dljcFCMXG3NvyfjfzBW7qhmrjkn2kiT+X
   A==;
X-CSE-ConnectionGUID: mfx2aTvPTs2WvMMISS6hCQ==
X-CSE-MsgGUID: fV/44Rc4Tvi6z55zG1E6qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3114069"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3114069"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 10:37:21 -0800
X-CSE-ConnectionGUID: Em4uUt6ZQryesEL+xtjK5w==
X-CSE-MsgGUID: R9aZvv3YTWKSojktVMlLZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8528699"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 10 Nov 2026 10:37:18 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQqiZ-000000000Kl-2rH5;
	Tue, 10 Nov 2026 18:37:15 +0000
Date: Tue, 10 Nov 2026 19:37:14 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-06 1/1]
 include/trace/stages/init.h:2:23: warning: 'str__ttm_pool__trace_system_name'
 defined but not used
Message-ID: <202611101933.55EiEAWj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Ryan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-06
head:   b81607b966ddcff8bff6e54967323da47a250f45
commit: 44f80f29d2a0dce31ed3b071ba17cd24db1ca13f [1/1] ANDROID: vendor_hooks: add hooks for drm/ttm page allocation
config: arm-randconfig-r2107-20261110 (https://download.01.org/0day-ci/archive/20261110/202611101933.55EiEAWj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611101933.55EiEAWj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611101933.55EiEAWj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/wqlockup.h:30,
                    from drivers/android/vendor_hooks.c:74:
   include/trace/stages/init.h:2:23: warning: 'str__wqlockup__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^~~~~
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
    ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/vmscan.h:125,
                    from drivers/android/vendor_hooks.c:73:
   include/trace/stages/init.h:2:23: warning: 'str__vmscan__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^~~~~
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
    ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/ufshcd.h:91,
                    from drivers/android/vendor_hooks.c:72:
   include/trace/stages/init.h:2:23: warning: 'str__ufshcd__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^~~~~
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
    ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/ttm_pool.h:25,
                    from drivers/android/vendor_hooks.c:71:
>> include/trace/stages/init.h:2:23: warning: 'str__ttm_pool__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^~~~~
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
    ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/traps.h:39,
                    from drivers/android/vendor_hooks.c:70:
   include/trace/stages/init.h:2:23: warning: 'str__traps__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^~~~~
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
    ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/topology.h:25,
                    from drivers/android/vendor_hooks.c:69:
   include/trace/stages/init.h:2:23: warning: 'str__topology__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^~~~~
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
    ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/timer.h:18,
                    from drivers/android/vendor_hooks.c:68:
   include/trace/stages/init.h:2:23: warning: 'str__timer__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^~~~~
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
    ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/thermal.h:18,
                    from drivers/android/vendor_hooks.c:67:
   include/trace/stages/init.h:2:23: warning: 'str__thermal__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^~~~~
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
    ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/sysrqcrash.h:19,
                    from drivers/android/vendor_hooks.c:66:
   include/trace/stages/init.h:2:23: warning: 'str__sysrqcrash__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
    #define __app__(x, y) str__##x##y
                          ^~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]


vim +/str__ttm_pool__trace_system_name +2 include/trace/stages/init.h

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
