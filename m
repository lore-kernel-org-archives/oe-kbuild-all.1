Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1764613AA31
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Mar 2025 03:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742959297; cv=none; b=VeLiOEoX8ksUPJ/r6HM6xkXoCiziFOzJ7FAEPLHLumr9A/P7C0tiWxo4GB1luP3vfxyz3Zkh3H4lMzeAxhaRdYEEF0VgwVkmxMGE+6y3hH660GIA+y02V/y+Oo5iVaPeEyF0jLjk9RDAn9MnFwuVqvQmhtCz/T+pdEQ6H4aQ/4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742959297; c=relaxed/simple;
	bh=eGPOgHE2jGNm3BkCXoMlyvZAsn9iAvj3P3dYH9XtmiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FSIs1T2AgUeaTlNUqhFACL8WvR0V+GHat0k14JAPhKEEJOpVS42uX3jaxfiQrXPAopqht56/jXqUTJwVPA9H7vNJR6rYJIM4gVa1u9SG2/Ml+Vy2IQFvkq5TBdiG/iZ3LLd+XbQcx4T0Rx2daFG/LpgXEf5tc9GLytNYW//0IxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Osp7YzEb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Osp7YzEb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742959295; x=1774495295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eGPOgHE2jGNm3BkCXoMlyvZAsn9iAvj3P3dYH9XtmiU=;
  b=Osp7YzEbyaCJt1J/KK7Ir1LcLh6TX347xLxg4kXuqNCI7lvfDut0GdDF
   a6ZCZqlz7iqkAowPySb8+qD0rnxjbnop3Q5QuzGQDBtw16sHgop3dpHge
   MQJGbXHSs3jGzOYjE6/RpFce8ZSPe153bfCBcgj19w9q38SgneAym92+x
   DyuHkb2eapfyocrUErNmNtD9m87SvGuA3X70dFUydemEZNEfjCVDfMkY6
   2WtGUZ2W+jQ7kDanSf3dqBDo1q31Q+QBxr5yDhVzciT45FrBW2jLCcMuk
   EImBxE18eUCAsDL1THd3Rshbj+r6nM5SiLr4wxcZZadgFyGOOHUdlYdp0
   g==;
X-CSE-ConnectionGUID: aOndy7CITDeaH7l2KF6sjA==
X-CSE-MsgGUID: v7XCAjERReO35c2ernTJgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="55611312"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="55611312"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 20:21:35 -0700
X-CSE-ConnectionGUID: IbwhNSpiT0azULDICrREiA==
X-CSE-MsgGUID: fb0F74rYQwWAZLBG1ZRaMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="147768859"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Mar 2025 20:21:33 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txHKd-0005Ql-0W;
	Wed, 26 Mar 2025 03:21:31 +0000
Date: Wed, 26 Mar 2025 11:20:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] compress_offload.c:undefined
 reference to `__get_user_bad'
Message-ID: <202503261129.irGgZJXB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   1e7bd53194d9370bcd55165f6f9f7b936823af9e
commit: dd99bb34c52de463398910adc71917769dde6f54 [2/2] Revert "ANDROID: suppress GKI configs for 32-bit builds"
config: arm-randconfig-001-20250326 (https://download.01.org/0day-ci/archive/20250326/202503261129.irGgZJXB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503261129.irGgZJXB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503261129.irGgZJXB-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: sound/core/jack.o: in function `snd_jack_new':
   jack.c:(.text+0xe6): undefined reference to `input_allocate_device'
   arm-linux-gnueabi-ld: jack.c:(.text+0x120): undefined reference to `input_set_capability'
   arm-linux-gnueabi-ld: jack.c:(.text+0x178): undefined reference to `input_free_device'
   arm-linux-gnueabi-ld: sound/core/jack.o: in function `snd_jack_dev_disconnect':
   jack.c:(.text+0x1c2): undefined reference to `input_unregister_device'
   arm-linux-gnueabi-ld: jack.c:(.text+0x1c8): undefined reference to `input_free_device'
   arm-linux-gnueabi-ld: sound/core/jack.o: in function `snd_jack_dev_register':
   jack.c:(.text+0x280): undefined reference to `input_set_capability'
   arm-linux-gnueabi-ld: jack.c:(.text+0x292): undefined reference to `input_register_device'
   arm-linux-gnueabi-ld: sound/core/jack.o: in function `snd_jack_report':
   jack.c:(.text+0x43e): undefined reference to `input_event'
   arm-linux-gnueabi-ld: jack.c:(.text+0x47e): undefined reference to `input_event'
   arm-linux-gnueabi-ld: jack.c:(.text+0x494): undefined reference to `input_event'
   arm-linux-gnueabi-ld: sound/core/compress_offload.o: in function `snd_compr_task_seq.constprop.0':
>> compress_offload.c:(.text+0xaf4): undefined reference to `__get_user_bad'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
