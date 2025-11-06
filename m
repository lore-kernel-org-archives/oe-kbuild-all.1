Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C972F7AC4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 20:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762460799; cv=none; b=Ca9qjfOFPIjY250Xf71JddPfGiILpEN3+qzmD4qa2H3NRx1BNlUYBBDN+QGtQ8813YRYI2kLxhmGpqUBS2ABQXubThfA8UDq2WRk5IM9wzQ6yuDVRdpYWVJe/JttzV5ygS/NN/aiRhIeKayMsYA0a3p6ET0WQDIf9tO42t8UquY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762460799; c=relaxed/simple;
	bh=QJKeiiZKMEWeMYKh/pYSKAMBRO6rzFydnAxtHgkt6yI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iVzS3i7vgzQLzx+LI315eT7tO9ffORngotsejQZoudIzu+5EzU31DjCQrDnNeIeIsf5HmBeNrY6s09m8S20+TiBZok4YLTETZ/tPYENQ66ddn3umfEkbHOaPRsi4QPY0mnJO+DFYXgFUbslQCJ+P9dxf15aMzFRIplgjpgkpnJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gVKS8FDW; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gVKS8FDW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762460797; x=1793996797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QJKeiiZKMEWeMYKh/pYSKAMBRO6rzFydnAxtHgkt6yI=;
  b=gVKS8FDWNeI0ko3F9z2Y4m14NvxVmeqoAJ2Qa7enqQDHYP+EIMWbOAE5
   Mk+qa+7TAD4OSSNMZU/zRmcos9OFcxugU9Id1nENJlc9Lv8HRZ+cFJtXY
   2mfFGpr5A9FSxW2abrGLxCY7tfdYlsB4KVJ1vibW+q1ka8DhIp0ZtkjYN
   ERATcPLxv6S6pB9SHJByWulCN6Cy32C+0qtQGqy4WvFN9JkdvRZ8sp7gY
   h5wpefAipQrkEZm9tc9W9lUZ1j3dQXQgrd6+daJzPJ3akz8PTZndhUa0H
   XLKFVYq6RkTeBMLycrkEITdvy5B66bocGZd8lfdJMeswxleQ5C3af2cFF
   w==;
X-CSE-ConnectionGUID: 6/PgLeZkTyeIuUokbXel1w==
X-CSE-MsgGUID: yHFOOtIdR3CkxHqzHAJCqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="87241175"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="87241175"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 12:26:37 -0800
X-CSE-ConnectionGUID: rHheRttXTVaZ61ZlBM1GiQ==
X-CSE-MsgGUID: gYWieIexQpG+J4jmsUL/bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="187802785"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Nov 2025 12:26:36 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vH6Yz-000UK6-02;
	Thu, 06 Nov 2025 20:26:33 +0000
Date: Fri, 7 Nov 2025 04:25:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 52/52]
 kernel/trace/power-traces.c:20:1: error: use of undeclared identifier
 '__tracepoint_device_pm_callback_start'
Message-ID: <202511070420.MSaeRVud-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Carlos,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   2402e3d241b5b66eca199d65ec8714966aaf70cd
commit: 380603d5f29a2265cb058a9ce5f2171f096ccca1 [52/52] Merge 2be6a7503d32 ("Merge tag 'trace-unused-v6.17' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace") into android-mainline
config: i386-randconfig-141-20251107 (https://download.01.org/0day-ci/archive/20251107/202511070420.MSaeRVud-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511070420.MSaeRVud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511070420.MSaeRVud-lkp@intel.com/

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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


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
