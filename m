Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888F8339A8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 00:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761092418; cv=none; b=ixESdb7tNPHKgn/lxon3CEU4sWYHrJT742Pq7AWB3oCisYm7jxJD92yuCgHTOMOxNrERJ1WFXNBW01oCvqvaee+CIzr8ffulSZa7xUB9lY3nbs8ZrxUpf29xFyj89QGtdCi/arIosisBKRpXoWzHHfqualBp5B2vZLUbsMSkhik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761092418; c=relaxed/simple;
	bh=hWG4VoVSURCG30nhXA9Fep8EMz5slFuPFCc15s2oek0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i7PLSk3QksbZsqIV+u8uj1s0AvnxjcuL9/iEGUll+Vq1tBgHYJ3pWZyYgg/WfJRVj4/Ckxl/V97FRGKJc9tYqht/VsxF+X0koztXL9a/hAXBLPX77DJtCz4095iPjFfak2bgfVCpNVkaON2f+wXiHqIJPXvziPSr8tzQ8CqVeMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tfx8IhUq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tfx8IhUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761092417; x=1792628417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hWG4VoVSURCG30nhXA9Fep8EMz5slFuPFCc15s2oek0=;
  b=Tfx8IhUqMGoleGo3pfD1ks6TqcDSLE2gLPn2UqhUXpTC6Xrxc4nWOC1j
   qgtqYMCdCdjGv857ECj3hV24KAQwGgUEsEx7/xWzItzz9XzQ33qBNuZvO
   g4ylzhfKt8RIzRW36THgY9sqVPmUZ5GSWDE/El2PMO4y7SNKDEwdmI7ql
   Xy+en2YbBsBsmmGix0i8jnE56PfHo0T7CW9fMGpFg7ViTzXtYymvHfsXi
   8gvo47E13CSGX3O1Fgg9BsW9+i2DHVAXUlML0hAs8vEqAGKniPIYkfWyr
   xagUIXwybM+HhUpJ17+klywxbcRmBcJE4LQjAiDJFaE27On72fRA67bZ9
   Q==;
X-CSE-ConnectionGUID: pQfswqI6QNm97AhpQEVuaw==
X-CSE-MsgGUID: As6Y0T10RRSpCoCRh86Neg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63141856"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="63141856"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 17:20:16 -0700
X-CSE-ConnectionGUID: 6yTCvdahRVGpTnZCYTaeaA==
X-CSE-MsgGUID: PYC3eP7YShqTTap1C7gaiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="183757089"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 21 Oct 2025 17:20:14 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBMaK-000Bqv-26;
	Wed, 22 Oct 2025 00:20:12 +0000
Date: Wed, 22 Oct 2025 08:19:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 0/1]
 kernel/trace/power-traces.c:20:1: error: use of undeclared identifier
 '__tracepoint_device_pm_callback_start'
Message-ID: <202510220834.3M1DesiJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   044da389e0b3139356c27b90ccb8107a79c836a2
commit: 380603d5f29a2265cb058a9ce5f2171f096ccca1 [0/1] Merge 2be6a7503d32 ("Merge tag 'trace-unused-v6.17' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace") into android-mainline
config: i386-buildonly-randconfig-001-20251022 (https://download.01.org/0day-ci/archive/20251022/202510220834.3M1DesiJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220834.3M1DesiJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220834.3M1DesiJ-lkp@intel.com/

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

6161352142d5fed Arjan van de Ven  2009-09-17  16  
c9257f78b4f785d Todd E Brandt     2014-12-12  17  EXPORT_TRACEPOINT_SYMBOL_GPL(suspend_resume);
25e41933b58777f Thomas Renninger  2011-01-03  18  EXPORT_TRACEPOINT_SYMBOL_GPL(cpu_idle);
9bdcb44e391da5c Rafael J. Wysocki 2016-04-02  19  EXPORT_TRACEPOINT_SYMBOL_GPL(cpu_frequency);
c1e2c674005c758 Changki Kim       2020-07-02 @20  EXPORT_TRACEPOINT_SYMBOL_GPL(device_pm_callback_start);
c1e2c674005c758 Changki Kim       2020-07-02 @21  EXPORT_TRACEPOINT_SYMBOL_GPL(device_pm_callback_end);

:::::: The code at line 20 was first introduced by commit
:::::: c1e2c674005c758817710ba1714d35185f6fa8b6 ANDROID: PM: sleep: export device_pm_callback_start/end trace event

:::::: TO: Changki Kim <changki.kim@samsung.com>
:::::: CC: Jonglin Lee <jonglin@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
