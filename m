Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2590F3812F1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 03:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779333347; cv=none; b=amElkSvZnXBZMNDM2XWXjkDJDH37u3xLDLuZCeSgVW1O6YcwWFFzXiuwpQjfoT4gjIJfW0KXb35YJP+j3FuUKiuPlLBr846+Tlk1qck85EObC5puOI+0yoWeVpprca+xHWrNGC9UI3Y6AkO4PT+pvgI8KkNujasSRhN6FOmY5gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779333347; c=relaxed/simple;
	bh=uqSmCx6BhQbAi8QIbBQe8QNN/s3pYciYfn/1x3tQdaQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LeX0M7qGerY7FhT/jQPy7XEaAgYLDPx6SFJJfOaDRwXQjrIFxW5eC9LJFVnsIisaoOJ6PFHfgKEYg9LDDEUCORbWBXZK3wAVWO5Po1QkZ4A0eXwwbCxTWgIT5pIeVCRah/9YpJo89Houir0rJmjyV+B/aJtWxdk+33ke+iqbtu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHapCt5G; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHapCt5G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779333342; x=1810869342;
  h=date:from:to:cc:subject:message-id;
  bh=uqSmCx6BhQbAi8QIbBQe8QNN/s3pYciYfn/1x3tQdaQ=;
  b=OHapCt5GKI6l8X283270/xK5Aa6V6byWp+jQnNgmmwmSsSYj+ZW4kuSM
   L+wWLEg1SLLHhsD/Yebtx7q751rykwbdzF2Pcl36CskQ/9cBGL+ttXMQ6
   29dp+aEzEu8tZAK/8+DwLMdRWM+ku6OXk7cIKFtuRdBC5B5NdJbyMEFKz
   BI195QiDnxM70Wb6RqQojoLTD8OjHSJL00RuDM/YGvh/BmmqnUmvR3PER
   M2GMRWPLKcJ+7FB76NkatrD1fT/a7cGkNhekBMwFCTkzKMDaewKFxUU8R
   aE2XsmaAemVInP9OzJIY3Mh1XWVpQ8OBB2dV9XP9VAaT2kMbllLz0Uz/E
   g==;
X-CSE-ConnectionGUID: s6wVwIa0QSmYkUor0KH7dQ==
X-CSE-MsgGUID: GvpzV6uPQYGdy/QK+ibiAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="84131153"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="84131153"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 20:15:28 -0700
X-CSE-ConnectionGUID: 10qVw7aoRm2j5HvaZwu47w==
X-CSE-MsgGUID: jHTxYfhET+eQHJbcZRiOrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="244392715"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 20 May 2026 20:15:27 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPtrW-000000004Hf-46nT;
	Thu, 21 May 2026 03:14:35 +0000
Date: Thu, 21 May 2026 11:12:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/2]
 kernel/trace/power-traces.c:20:1: error: use of undeclared identifier
 '__tracepoint_device_pm_callback_start'
Message-ID: <202605211105.qyg7e5lS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Carlos,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   f26b61355a1b5a3b8286d5bddc7a3fa5a5191317
commit: 380603d5f29a2265cb058a9ce5f2171f096ccca1 [0/2] Merge 2be6a7503d32 ("Merge tag 'trace-unused-v6.17' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace") into android-mainline
config: x86_64-randconfig-075-20260521 (https://download.01.org/0day-ci/archive/20260521/202605211105.qyg7e5lS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211105.qyg7e5lS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211105.qyg7e5lS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/power-traces.c:20:1: error: use of undeclared identifier '__tracepoint_device_pm_callback_start'
      20 | EXPORT_TRACEPOINT_SYMBOL_GPL(device_pm_callback_start);
         | ^
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:56:1: note: expanded from here
      56 | __tracepoint_device_pm_callback_start
         | ^
>> kernel/trace/power-traces.c:20:1: error: use of undeclared identifier '__traceiter_device_pm_callback_start'
   include/linux/tracepoint.h:375:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^
   <scratch space>:63:1: note: expanded from here
      63 | __traceiter_device_pm_callback_start
         | ^
>> kernel/trace/power-traces.c:20:1: error: use of undeclared identifier '__SCK__tp_func_device_pm_callback_start'
   include/linux/tracepoint.h:376:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     376 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^
   include/linux/static_call.h:217:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     217 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
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
   <scratch space>:4:1: note: expanded from here
       4 | __SCK__tp_func_device_pm_callback_start
         | ^
>> kernel/trace/power-traces.c:20:1: error: use of undeclared identifier '__SCT__tp_func_device_pm_callback_start'
   include/linux/tracepoint.h:376:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     376 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^
   include/linux/static_call.h:218:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     218 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
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
   <scratch space>:11:1: note: expanded from here
      11 | __SCT__tp_func_device_pm_callback_start
         | ^
>> kernel/trace/power-traces.c:21:1: error: use of undeclared identifier '__tracepoint_device_pm_callback_end'
      21 | EXPORT_TRACEPOINT_SYMBOL_GPL(device_pm_callback_end);
         | ^
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:18:1: note: expanded from here
      18 | __tracepoint_device_pm_callback_end
         | ^
>> kernel/trace/power-traces.c:21:1: error: use of undeclared identifier '__traceiter_device_pm_callback_end'
   include/linux/tracepoint.h:375:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^
   <scratch space>:25:1: note: expanded from here
      25 | __traceiter_device_pm_callback_end
         | ^
>> kernel/trace/power-traces.c:21:1: error: use of undeclared identifier '__SCK__tp_func_device_pm_callback_end'
   include/linux/tracepoint.h:376:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     376 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^
   include/linux/static_call.h:217:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     217 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
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
   <scratch space>:33:1: note: expanded from here
      33 | __SCK__tp_func_device_pm_callback_end
         | ^
>> kernel/trace/power-traces.c:21:1: error: use of undeclared identifier '__SCT__tp_func_device_pm_callback_end'
   include/linux/tracepoint.h:376:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     376 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^
   include/linux/static_call.h:218:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     218 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
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
   <scratch space>:40:1: note: expanded from here
      40 | __SCT__tp_func_device_pm_callback_end
         | ^
   8 errors generated.


vim +/__tracepoint_device_pm_callback_start +20 kernel/trace/power-traces.c

6161352142d5fed4 Arjan van de Ven  2009-09-17  16  
c9257f78b4f785d2 Todd E Brandt     2014-12-12  17  EXPORT_TRACEPOINT_SYMBOL_GPL(suspend_resume);
25e41933b58777f2 Thomas Renninger  2011-01-03  18  EXPORT_TRACEPOINT_SYMBOL_GPL(cpu_idle);
9bdcb44e391da5c4 Rafael J. Wysocki 2016-04-02  19  EXPORT_TRACEPOINT_SYMBOL_GPL(cpu_frequency);
c1e2c674005c7588 Changki Kim       2020-07-02 @20  EXPORT_TRACEPOINT_SYMBOL_GPL(device_pm_callback_start);
c1e2c674005c7588 Changki Kim       2020-07-02 @21  EXPORT_TRACEPOINT_SYMBOL_GPL(device_pm_callback_end);

:::::: The code at line 20 was first introduced by commit
:::::: c1e2c674005c758817710ba1714d35185f6fa8b6 ANDROID: PM: sleep: export device_pm_callback_start/end trace event

:::::: TO: Changki Kim <changki.kim@samsung.com>
:::::: CC: Jonglin Lee <jonglin@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
