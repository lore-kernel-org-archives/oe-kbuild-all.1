Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F5A36997D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Feb 2026 18:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771872419; cv=none; b=neWTz30iG14qsMTF/jxQ5lNVp2i7aQpEzi/wolRfzIFYfdzY55Ibj5TVeMGARJmU3jv3tXcwF+mFRzaUD+OnwC8hfzh4UxwJKVcotKBSVI/hpU5G4xqT8yCR8LMzq4phObNnspQZrwZFihB4YN9tP5PpkA6epad0I9ZUOyX1sXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771872419; c=relaxed/simple;
	bh=FRb4v9tKrcY1Jxu/3w7AkWFvczgL7pwge7WK3gTajm0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Uv+4JU4IORVtIy2E4l090hw29Mb+BMB/wa3EUl0BB2l7E/RuR7lXNjNKJKLm5Ji6k4FmmnI//5tNjiLspQ2XALnL0jADI8kZxsEjOLHS2wMxPR566olVs1glvn/AeJLAEQdXaGAL2BeyFMci3rIZo2m0Y9pCNu2qaTfDGQJfrqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W30fVJGK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W30fVJGK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771872417; x=1803408417;
  h=date:from:to:cc:subject:message-id;
  bh=FRb4v9tKrcY1Jxu/3w7AkWFvczgL7pwge7WK3gTajm0=;
  b=W30fVJGKHor5FihLJfDvuisUdjEB08JvOzyZGNOPKKIt9azN1qKrDCz8
   lzF0q2OMVYfrYJrAR5BfBPwPzL8AW8Y6a3947ABPoLmQzzF2Z1yTfZViJ
   Mp2T7JOWXHvkIFbSx9s6DDNZx9c+2bN02640oUqZPhNMG2LOZCgfGN0e5
   ZSYKx+C+BL3MJAuGLNBVWywmdEpgDzW6tzMM8GGq7GwrvOaR3EiGJALts
   qiBGk6gQTbsr56Y3as5PaFcXIP+IDfuXn0P8yDZIh914R0dBxsvIP+FPJ
   vZLkqFLVO3OAszOvcJJJbeGZWErSrCy5+yaYMMrt/ANEfObRhKiBJInR8
   Q==;
X-CSE-ConnectionGUID: 7U9MUOXJRdeV6nKDwTTfaQ==
X-CSE-MsgGUID: /QxgdhxGTOSiSKryMpgbzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="75483364"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="75483364"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 10:46:56 -0800
X-CSE-ConnectionGUID: RQlg/huYR5aVk5rDEHL0Xw==
X-CSE-MsgGUID: Bwzol5V8RI6eoRHCAuLpjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="220649699"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 23 Feb 2026 10:46:47 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuawx-000000000er-34ii;
	Mon, 23 Feb 2026 18:46:38 +0000
Date: Tue, 24 Feb 2026 02:46:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 kernel/trace/power-traces.c:20:1: error: use of undeclared identifier
 '__tracepoint_device_pm_callback_start'
Message-ID: <202602240231.wIjRhlXT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Carlos,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   b312fac299a12da0b163fec0c501e08dafebee3a
commit: 380603d5f29a2265cb058a9ce5f2171f096ccca1 [1/1] Merge 2be6a7503d32 ("Merge tag 'trace-unused-v6.17' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace") into android-mainline
config: i386-randconfig-012-20260223 (https://download.01.org/0day-ci/archive/20260224/202602240231.wIjRhlXT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602240231.wIjRhlXT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602240231.wIjRhlXT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/power-traces.c:20:1: error: use of undeclared identifier '__tracepoint_device_pm_callback_start'
      20 | EXPORT_TRACEPOINT_SYMBOL_GPL(device_pm_callback_start);
         | ^
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:39:1: note: expanded from here
      39 | __tracepoint_device_pm_callback_start
         | ^
>> kernel/trace/power-traces.c:20:1: error: use of undeclared identifier '__traceiter_device_pm_callback_start'
   include/linux/tracepoint.h:375:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^
   <scratch space>:46:1: note: expanded from here
      46 | __traceiter_device_pm_callback_start
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
   <scratch space>:54:1: note: expanded from here
      54 | __SCK__tp_func_device_pm_callback_start
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
   <scratch space>:61:1: note: expanded from here
      61 | __SCT__tp_func_device_pm_callback_start
         | ^
>> kernel/trace/power-traces.c:21:1: error: use of undeclared identifier '__tracepoint_device_pm_callback_end'
      21 | EXPORT_TRACEPOINT_SYMBOL_GPL(device_pm_callback_end);
         | ^
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:3:1: note: expanded from here
       3 | __tracepoint_device_pm_callback_end
         | ^
>> kernel/trace/power-traces.c:21:1: error: use of undeclared identifier '__traceiter_device_pm_callback_end'
   include/linux/tracepoint.h:375:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^
   <scratch space>:10:1: note: expanded from here
      10 | __traceiter_device_pm_callback_end
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
   <scratch space>:18:1: note: expanded from here
      18 | __SCK__tp_func_device_pm_callback_end
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
   <scratch space>:25:1: note: expanded from here
      25 | __SCT__tp_func_device_pm_callback_end
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
