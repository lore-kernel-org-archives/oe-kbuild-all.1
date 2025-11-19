Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A37F2F2916
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 19:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763581296; cv=none; b=JHN6maKZik1Ip6uGlrAefosxslN0sx6Qbh8k7pRIgiEqKGSIxahdTA/tgGnIOrSrxghEt4rrDlFfL20vnzN+FCxyJ/IhUAS3xcVVO8JNkEGWT5hSw/P4DR1WiY+WdEtUW86iDga4qkjKV78ijHhIhhKQv1LMB62CnlbytaJF2Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763581296; c=relaxed/simple;
	bh=rJelyUWpBVbAjEhx1K1CTCpVRaZvA8dKAtl1qc8bfTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PQL4x3j1+KqbtvYHBpkKRW/7JrrXD+0A7j45I9G5eem/orVaqQAoQ13glEi5b1PNW76fU50AFzC6BUMuaSmrEE4fMy0et66n9lQiHILzWnTeiByOq/JGCu11DUYiIVpE7IKBeFCgc4S0EoOU2GfRnBuOQVrGm9taS9JFAs1m/9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egGiiSYS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egGiiSYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763581293; x=1795117293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rJelyUWpBVbAjEhx1K1CTCpVRaZvA8dKAtl1qc8bfTM=;
  b=egGiiSYSDnSWUOvYQtx8WR6bx5I67sOYblkYynAIboJj+BzzIoQxdENc
   aASyzzfeZs11ASzZnU+Z1rGg5eTq6ND97iosm9gOvvp6NDo0UtSR+Y9xS
   OjPjmfVl0/Agepl3SB6u9zfHF3XkGva9+MKbxZkhtcxYNCTTy0XftSegk
   WRtGl+zvGmSfag/27qYgfDpGYBPX0J+TUw1S4AyA4NfJoEThAGji7usNB
   JLthQwiuXph+YgBLQ/pZKBn443SHhrFgYnUSQE6cF9z9LbnA2QMP0Noz4
   zssJk8ag9ihfn1tgvto89hpJYuyhwLtvIP5jdXLY/rMwSjTbn0wEHjwCM
   A==;
X-CSE-ConnectionGUID: IxPnAgtyQNWUQ2bkDnWDeA==
X-CSE-MsgGUID: bKQiwJnZTTaG7soXVRYrEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69489682"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="69489682"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 11:41:32 -0800
X-CSE-ConnectionGUID: iC/GU+jHRWaTfpXPiCvpJQ==
X-CSE-MsgGUID: 5vcklVSCS4mDPIke5WIiOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="191949490"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Nov 2025 11:41:31 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLo3V-0003Ez-1G;
	Wed, 19 Nov 2025 19:41:29 +0000
Date: Thu, 20 Nov 2025 03:41:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-lts 2/2]
 include/linux/compiler_types.h:140:41: error: invalid use of undefined type
 'struct module'
Message-ID: <202511200311.kLolPX8m-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-5.15-lts
head:   9929332cf976b614e7b57fc2147fc857dd06df6c
commit: 180f8b73199bd665c03ff43853170280fc82e02d [2/2] ANDROID: kernel: add module info for debug_kinfo
config: arm-randconfig-001-20251120 (https://download.01.org/0day-ci/archive/20251120/202511200311.kLolPX8m-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200311.kLolPX8m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200311.kLolPX8m-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/staging/android/debug_kinfo.c: In function 'debug_kinfo_probe':
>> include/linux/compiler_types.h:140:41: error: invalid use of undefined type 'struct module'
     140 | #define __compiler_offsetof(a, b)       __builtin_offsetof(a, b)
         |                                         ^~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:17:33: note: in expansion of macro '__compiler_offsetof'
      17 | #define offsetof(TYPE, MEMBER)  __compiler_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~~
   drivers/staging/android/debug_kinfo.c:162:40: note: in expansion of macro 'offsetof'
     162 |         info->mod_core_layout_offset = offsetof(struct module, core_layout);
         |                                        ^~~~~~~~
>> include/linux/compiler_types.h:140:41: error: invalid use of undefined type 'struct module'
     140 | #define __compiler_offsetof(a, b)       __builtin_offsetof(a, b)
         |                                         ^~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:17:33: note: in expansion of macro '__compiler_offsetof'
      17 | #define offsetof(TYPE, MEMBER)  __compiler_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~~
   drivers/staging/android/debug_kinfo.c:163:40: note: in expansion of macro 'offsetof'
     163 |         info->mod_init_layout_offset = offsetof(struct module, init_layout);
         |                                        ^~~~~~~~
>> include/linux/compiler_types.h:140:41: error: invalid use of undefined type 'struct module'
     140 | #define __compiler_offsetof(a, b)       __builtin_offsetof(a, b)
         |                                         ^~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:17:33: note: in expansion of macro '__compiler_offsetof'
      17 | #define offsetof(TYPE, MEMBER)  __compiler_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~~
   drivers/staging/android/debug_kinfo.c:164:37: note: in expansion of macro 'offsetof'
     164 |         info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
         |                                     ^~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


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
