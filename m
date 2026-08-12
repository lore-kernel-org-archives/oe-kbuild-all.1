Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE8545C6F6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 23:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786576121; cv=none; b=papjYdXg6jmcm1gMYnouozEy+NcYscnJ0W2ZjS81v8yIO6wnF7MScTtqgmCOW2HH8n1kyhFyvOEegnbtFBWqqrCWmQmz5YHgdWL0vXqqrJPPDUqJji/JTKPs9qEB0DritvpkOCdxdsKMW8PSfdAWvEWlNuIQUpCyBI8yxZP876I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786576121; c=relaxed/simple;
	bh=GoQFI1zIs2onpmJF9wW0PpfzBlFg2aoD6KDjdJu+6Xs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Isvmlj0rKvbt+NJaIvRAkJ1TSbqvuvDNYBrwUtueWYKz/1Xp5ombaiceWdYd0P2DZq/1eUPD77D40DEsa9Jk5TZJ0GtRw60uul8WoragArq1LjGfxKsD1Q9ooQYcYV6hR6HGw8HtcBV9okFJTCmvGlEot9CQGyXzgzvkzYS53gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHKQT+8f; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHKQT+8f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786576120; x=1818112120;
  h=date:from:to:cc:subject:message-id;
  bh=GoQFI1zIs2onpmJF9wW0PpfzBlFg2aoD6KDjdJu+6Xs=;
  b=AHKQT+8fxHTL7q65RXVv46j7jDRs9dtZQrI8N/KUYw4wcuPXboNprXxH
   kWSlMuWKUWK9shy6yj3W2XoBMYdNifuEgeajwJH4Z70JPjtdgszlEJXxT
   hbWc5eFsWJIuuXVwsZe0iQpQT5dRdn5Qu10Sz+y+mFLrhB60LRVkMiF6s
   5wNVdFUpa3xTs2lMET//BrvwEaPonVXagQIydFgGHnYEs41rXhQLlZrES
   Qq3AylxNaUo+SYsILxXd9N9Kn3MTzEHlIoF5kqTg82rgNTewAD237QhFQ
   8ePEL91KmAagw8plGL51+obPkstL/GTIo/2EHoAjjQmATETB/exWIP8MQ
   w==;
X-CSE-ConnectionGUID: h/d4n7OLQnq9e7ntsNWfDA==
X-CSE-MsgGUID: ELIvf+ltQ9W6E/ZTnY8o5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="109933865"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="109933865"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 16:08:38 -0700
X-CSE-ConnectionGUID: JmYoFDTMQeyHbxBfj7sv2w==
X-CSE-MsgGUID: 2vbhGAcVTUOCnd0brTFR8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="287228074"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Aug 2026 16:07:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuI2M-00000000S1O-36mB;
	Wed, 12 Aug 2026 23:07:06 +0000
Date: Thu, 13 Aug 2026 07:06:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 272/272]
 mm/swapfile.c:102:26: warning: no previous prototype for function
 'swap_type_to_swap_info'
Message-ID: <202608130648.IyLIIOZF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bing,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   9c40f45d2c22f05e45bc48b1d7be869adf7e473a
commit: 4506bcbba5ec78d8d694fbb43e964cfefe900887 [272/272] ANDROID: mm: export swap_type_to_swap_info
config: x86_64-randconfig-r072-20260813 (https://download.01.org/0day-ci/archive/20260813/202608130648.IyLIIOZF-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6ea395e4fe4db26920d57779ddae98eac6ba945d)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130648.IyLIIOZF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130648.IyLIIOZF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:69:
   include/linux/compiler-clang.h:34:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      34 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:357:9: note: previous definition is here
     357 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> mm/swapfile.c:102:26: warning: no previous prototype for function 'swap_type_to_swap_info' [-Wmissing-prototypes]
     102 | struct swap_info_struct *swap_type_to_swap_info(int type)
         |                          ^
   mm/swapfile.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     102 | struct swap_info_struct *swap_type_to_swap_info(int type)
         | ^
         | static 
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


vim +/swap_type_to_swap_info +102 mm/swapfile.c

   101	
 > 102	struct swap_info_struct *swap_type_to_swap_info(int type)
   103	{
   104		if (type >= READ_ONCE(nr_swapfiles))
   105			return NULL;
   106	
   107		smp_rmb();	/* Pairs with smp_wmb in alloc_swap_info. */
   108		return READ_ONCE(swap_info[type]);
   109	}
   110	EXPORT_SYMBOL_GPL(swap_type_to_swap_info);
   111	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
