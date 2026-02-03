Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4262F872
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 04:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770092205; cv=none; b=piLB4GAanlupx+Vd3iou4nbfy3V3kjhPF8mLSkmWjEiu2vCi8P3HqrLd1cpEfjPC/UYePupVS88CSN8QH42AIMiRgPM9FatGKGZnycGlKigCYOP7pEsb2309pg17DGK9LeiejScLmIpLUCCWM9aWtMWY/mLYy43hUa6XIC9EmFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770092205; c=relaxed/simple;
	bh=WUTc9fXobazENJzhuYWwyw1ug3qmq36ckDjDqpXgQYE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mbs1RTS4rZAF5wmV6m6XZWhpKUXzyDlbHO1FcLLvWkzfkkorJVkf661dBwO29U2OPiC5NJNgRobBLymNkwiqchAcqsBu5FJhUJRSTanC85x/cNQx3ae2fiioQP2hU5PYimjoz0mqyKN5sX7lReuJv5QprI3b+GRQkiYFEjzaIKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D5O2jKYj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5O2jKYj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770092204; x=1801628204;
  h=date:from:to:cc:subject:message-id;
  bh=WUTc9fXobazENJzhuYWwyw1ug3qmq36ckDjDqpXgQYE=;
  b=D5O2jKYjI0/jWA5ONIh/a/9n/KOJ1RfDe7U0l1ZshOnCGQbqtK9tKsMk
   5/z0XKOnbJnLQ5BJREH/SvVGw10NDgAU+EVfFZxLXakxRjDGVgSi/L4Rd
   uuEUdhwaPMRn0R5DsK/uYMAHzr9Yzkk1ruxKX7JBDL/xpjFMyWWePSk+t
   PWt1tSrkfC3bz/+d2OJ5BVw9GkRY7yv6750YmBGjezjcEucgo2bgiyemI
   1svQ+ilQoYs6R3AwOt5nJ09shQpKMf/9CngHnw6zanM/aMc08oPE3q6mF
   Q3HmA/mvQyGk+v053rguRhQFeYwlU5th09Ypi1J2mTl5IoPvZLnAFz460
   Q==;
X-CSE-ConnectionGUID: ZZexWv26R1uKRh8nSUkreQ==
X-CSE-MsgGUID: MGvPdg9jQRy3mRRQNhua4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="96713024"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="96713024"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 20:16:43 -0800
X-CSE-ConnectionGUID: fxVoAzitQTWYRzgIFPUPIA==
X-CSE-MsgGUID: O+v6llfZR3qQuuQPpD+Qyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209842986"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Feb 2026 20:16:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vn7qC-00000000gEV-0bsL;
	Tue, 03 Feb 2026 04:16:40 +0000
Date: Tue, 03 Feb 2026 12:16:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/6]
 kernel/trace/power-traces.c:20:1: error: use of undeclared identifier
 '__tracepoint_device_pm_callback_start'
Message-ID: <202602031255.i0FVUUQN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Carlos,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   367aa148ad18ea2d6d56373b83d5895390195cdd
commit: 380603d5f29a2265cb058a9ce5f2171f096ccca1 [0/6] Merge 2be6a7503d32 ("Merge tag 'trace-unused-v6.17' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace") into android-mainline
config: i386-randconfig-012-20260203 (https://download.01.org/0day-ci/archive/20260203/202602031255.i0FVUUQN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602031255.i0FVUUQN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602031255.i0FVUUQN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/power-traces.c:20:1: error: use of undeclared identifier '__tracepoint_device_pm_callback_start'
      20 | EXPORT_TRACEPOINT_SYMBOL_GPL(device_pm_callback_start);
         | ^
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:52:1: note: expanded from here
      52 | __tracepoint_device_pm_callback_start
         | ^
>> kernel/trace/power-traces.c:20:1: error: use of undeclared identifier '__traceiter_device_pm_callback_start'
   include/linux/tracepoint.h:375:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^
   <scratch space>:59:1: note: expanded from here
      59 | __traceiter_device_pm_callback_start
         | ^
>> kernel/trace/power-traces.c:20:1: error: use of undeclared identifier '__SCK__tp_func_device_pm_callback_start'
   include/linux/tracepoint.h:376:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     376 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^
   include/linux/static_call.h:277:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     277 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
         |                           ^
   include/linux/static_call_types.h:12:32: note: expanded from macro 'STATIC_CALL_KEY'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                         ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:67:1: note: expanded from here
      67 | __SCK__tp_func_device_pm_callback_start
         | ^
>> kernel/trace/power-traces.c:20:1: error: use of undeclared identifier '__SCT__tp_func_device_pm_callback_start'
   include/linux/tracepoint.h:376:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     376 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^
   include/linux/static_call.h:278:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     278 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |                           ^
   include/linux/static_call_types.h:18:34: note: expanded from macro 'STATIC_CALL_TRAMP'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:5:1: note: expanded from here
       5 | __SCT__tp_func_device_pm_callback_start
         | ^
>> kernel/trace/power-traces.c:21:1: error: use of undeclared identifier '__tracepoint_device_pm_callback_end'
      21 | EXPORT_TRACEPOINT_SYMBOL_GPL(device_pm_callback_end);
         | ^
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:12:1: note: expanded from here
      12 | __tracepoint_device_pm_callback_end
         | ^
>> kernel/trace/power-traces.c:21:1: error: use of undeclared identifier '__traceiter_device_pm_callback_end'
   include/linux/tracepoint.h:375:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^
   <scratch space>:19:1: note: expanded from here
      19 | __traceiter_device_pm_callback_end
         | ^
>> kernel/trace/power-traces.c:21:1: error: use of undeclared identifier '__SCK__tp_func_device_pm_callback_end'
   include/linux/tracepoint.h:376:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     376 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^
   include/linux/static_call.h:277:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     277 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
         |                           ^
   include/linux/static_call_types.h:12:32: note: expanded from macro 'STATIC_CALL_KEY'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                         ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:27:1: note: expanded from here
      27 | __SCK__tp_func_device_pm_callback_end
         | ^
>> kernel/trace/power-traces.c:21:1: error: use of undeclared identifier '__SCT__tp_func_device_pm_callback_end'
   include/linux/tracepoint.h:376:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     376 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^
   include/linux/static_call.h:278:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     278 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |                           ^
   include/linux/static_call_types.h:18:34: note: expanded from macro 'STATIC_CALL_TRAMP'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:34:1: note: expanded from here
      34 | __SCT__tp_func_device_pm_callback_end
         | ^
   8 errors generated.


vim +/__tracepoint_device_pm_callback_start +20 kernel/trace/power-traces.c

6161352142d5fe Arjan van de Ven  2009-09-17  16  
c9257f78b4f785 Todd E Brandt     2014-12-12  17  EXPORT_TRACEPOINT_SYMBOL_GPL(suspend_resume);
25e41933b58777 Thomas Renninger  2011-01-03  18  EXPORT_TRACEPOINT_SYMBOL_GPL(cpu_idle);
9bdcb44e391da5 Rafael J. Wysocki 2016-04-02  19  EXPORT_TRACEPOINT_SYMBOL_GPL(cpu_frequency);
c1e2c674005c75 Changki Kim       2020-07-02 @20  EXPORT_TRACEPOINT_SYMBOL_GPL(device_pm_callback_start);
c1e2c674005c75 Changki Kim       2020-07-02 @21  EXPORT_TRACEPOINT_SYMBOL_GPL(device_pm_callback_end);

:::::: The code at line 20 was first introduced by commit
:::::: c1e2c674005c758817710ba1714d35185f6fa8b6 ANDROID: PM: sleep: export device_pm_callback_start/end trace event

:::::: TO: Changki Kim <changki.kim@samsung.com>
:::::: CC: Jonglin Lee <jonglin@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
