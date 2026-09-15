Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADCA4BEE38
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 02:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439010; cv=none; b=fSekqhGLwJtXilF3Las+Gh7Aq+tUOR5ATwXwW1cVkwMbUTxCyABCZ3+k29k0z2NeW8eUNI1N1WeUMq/xDf+9DlCU7cnDqalxDxu2UDOCM2vfvtXHwHzwWTS64cGkjzpzoD9JoZRFokIBJNvkErgJbk5rByiyAmhTmZgJ/T3plJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439010; c=relaxed/simple;
	bh=r6An0bvFRlK8wcn1ZAGeLwPJ44tqdZ6xNMf9bghfv7E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BGjvwGxG1o1ntdOpL/44iNYj4110ZIC/BR4IJYhEIEsnZw7hYPXQQvwr0Ckhq0WLTAGAbAZcRWABq2rH8tmffUbM81yYhUlW+MqQadbCuWvrSNyQ5YvOWfhOXCVPMA9wNqQw6m1drxUMVkgaaz0QuwoK0DYH0daKkHbyTWWsx3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dRuELz8N; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dRuELz8N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789439009; x=1820975009;
  h=date:from:to:cc:subject:message-id;
  bh=r6An0bvFRlK8wcn1ZAGeLwPJ44tqdZ6xNMf9bghfv7E=;
  b=dRuELz8NK4Eq0YECMa+2YuwD0ubNBFv9ZvPnhTZQvH/mP7tqBBRnO+fh
   8Tfyz8qb0DyS4SYT5bdqD3rg2XFHkypwjOmQ80We+jfppKpJzThsY8DYY
   bOr7f93/u2tzxCIn057fV09Jo7amJY63zBl7oPygjIIHUgurPEE6uI0lM
   ncbAqiyxyLfPxNmXElncwIr1JxEAiMaQVneJm1pG2LM/Xmm7gwfKWID3i
   BwF3vPPiEQOXKDxTyRxWueI335bqZDI0KOp+Ozj6EVIBzKrVieMo8e6ts
   wr3uCWazGhxJ+2DIB3ZaRvumFaNQjTS8THsK2rBOnIlq2sAt34DTT2VsP
   g==;
X-CSE-ConnectionGUID: 5FhtUokKRk+WifzMtR6M2A==
X-CSE-MsgGUID: pakJq1FDRI6/rHJTDBpFDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="305674"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="305674"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 19:23:28 -0700
X-CSE-ConnectionGUID: ICFrZ1OETvGCMcFtUl5CXg==
X-CSE-MsgGUID: 4hTYn7lmSI6iUYqZNflvxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="311080057"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 14 Sep 2026 19:23:26 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6IpP-000000000Sh-0Sg1;
	Tue, 15 Sep 2026 02:23:23 +0000
Date: Tue, 15 Sep 2026 04:22:52 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2026-03 2/2]
 include/linux/compiler_types.h:140:41: error: invalid use of undefined type
 'struct module'
Message-ID: <202609150415.BKtQnAct-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.15-2026-03
head:   23be581a715439bf5b8d609e70b17837b6857162
commit: 180f8b73199bd665c03ff43853170280fc82e02d [2/2] ANDROID: kernel: add module info for debug_kinfo
config: arm64-randconfig-r072-20260915 (https://download.01.org/0day-ci/archive/20260915/202609150415.BKtQnAct-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150415.BKtQnAct-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609150415.BKtQnAct-lkp@intel.com/

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
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


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
