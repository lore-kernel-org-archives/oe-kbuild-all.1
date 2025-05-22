Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2E1EC5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 04:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747888021; cv=none; b=oKavG5lHFEfmUCgYAW5y8cgTCKzEpJYUYYqFwwWfq8qa+9UuMZ1niCibgKihqCWAUaNHdx00QI9jozRoaVi/ObmStWahxPVcY/SzxCE0xirtNKCPSBVFPui2rOsLlecm7y4pQvlGFusUWKaOKdLmJLnIkyTPWZrST5RxVikPcUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747888021; c=relaxed/simple;
	bh=BdSnkD/0xPH55/ngF741dSXIXHUULaGGCsu79IrTb6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VqeM47MQKN85HFXKN48W/aoroCTusIoYTy/NXe7KMZJEs8wFsTel4gCwX8Fa/nTwzOoAHD8K5QafH6m6vf422G/Vz79erFrOmIb839C4B1cdDwSEtC4bTF7K6BC1elFYPJxlO61u2Zv6HZ1rEhoXS9t9IGkLoxwhbGJif8J/pfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i2fdF2MU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2fdF2MU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747888019; x=1779424019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BdSnkD/0xPH55/ngF741dSXIXHUULaGGCsu79IrTb6Q=;
  b=i2fdF2MUwBMonOsrry5CyZTcx2H2VXP7onRIXDhbPvjz0ut0gm4ObnAF
   HehLcGzmSs2CGM2beNXECuBp0WphO7RS98zsA+9CbFpA3ggwlS1lBn5K6
   l0Yaqi2g4y8tpE2z8yt1QA5xZLVeW0nB3gkDWIwjF90I50PnkFt8w1zNX
   IscuDJl1opsUkuiiPE7wFliMhk2h2Nn2ZHa0gfojWLo9XjQ+ky1eGRN5B
   +I6E3jjVttI/IWzlqS98hqDruhIM3lC1ZoHTRAaI187zzeNzhMbhGhH+w
   /5NG89qiOLjYlAfnTlPnoZLgFCh+eC908CrHyhg8R3mxCzpC5+GoaELvn
   Q==;
X-CSE-ConnectionGUID: 3B3N+j6dRaasQUqCXExLHw==
X-CSE-MsgGUID: dclLzkuBQBC6UEbG+EDtKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49798030"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="49798030"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 21:26:58 -0700
X-CSE-ConnectionGUID: eX5/XHxIQmOVmEkNFMlPKg==
X-CSE-MsgGUID: P1dwXoogQAmNF2D5Q6nM/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="163662497"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 May 2025 21:26:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHxWA-000OuO-2d;
	Thu, 22 May 2025 04:26:54 +0000
Date: Thu, 22 May 2025 12:25:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2025-03 2/2]
 include/linux/compiler_types.h:140:35: error: invalid use of undefined type
 'struct module'
Message-ID: <202505221252.BCT03VHo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jone,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15-2025-03
head:   4ea0fcb5d1308f2f5a5dec0a3a5c8f1b261e00c7
commit: 180f8b73199bd665c03ff43853170280fc82e02d [2/2] ANDROID: kernel: add module info for debug_kinfo
config: arm-randconfig-r051-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221252.BCT03VHo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221252.BCT03VHo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221252.BCT03VHo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:0:0:
   drivers/staging/android/debug_kinfo.c: In function 'debug_kinfo_probe':
>> include/linux/compiler_types.h:140:35: error: invalid use of undefined type 'struct module'
    #define __compiler_offsetof(a, b) __builtin_offsetof(a, b)
                                      ^
   include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_offsetof'
    #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
                                   ^~~~~~~~~~~~~~~~~~~
   drivers/staging/android/debug_kinfo.c:162:33: note: in expansion of macro 'offsetof'
     info->mod_core_layout_offset = offsetof(struct module, core_layout);
                                    ^~~~~~~~
>> include/linux/compiler_types.h:140:35: error: invalid use of undefined type 'struct module'
    #define __compiler_offsetof(a, b) __builtin_offsetof(a, b)
                                      ^
   include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_offsetof'
    #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
                                   ^~~~~~~~~~~~~~~~~~~
   drivers/staging/android/debug_kinfo.c:163:33: note: in expansion of macro 'offsetof'
     info->mod_init_layout_offset = offsetof(struct module, init_layout);
                                    ^~~~~~~~
>> include/linux/compiler_types.h:140:35: error: invalid use of undefined type 'struct module'
    #define __compiler_offsetof(a, b) __builtin_offsetof(a, b)
                                      ^
   include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_offsetof'
    #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
                                   ^~~~~~~~~~~~~~~~~~~
   drivers/staging/android/debug_kinfo.c:164:30: note: in expansion of macro 'offsetof'
     info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
                                 ^~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


vim +140 include/linux/compiler_types.h

71391bdd2e9aab Xiaozhou Liu 2018-12-14  139  
71391bdd2e9aab Xiaozhou Liu 2018-12-14 @140  #define __compiler_offsetof(a, b)	__builtin_offsetof(a, b)
71391bdd2e9aab Xiaozhou Liu 2018-12-14  141  

:::::: The code at line 140 was first introduced by commit
:::::: 71391bdd2e9aab188f86bf1ecd9b232531ec7eea include/linux/compiler_types.h: don't pollute userspace with macro definitions

:::::: TO: Xiaozhou Liu <liuxiaozhou@bytedance.com>
:::::: CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
