Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2EC199938
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 17:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745517400; cv=none; b=WM9GB/yo2SbO8ySny8MSUsCX+DSoVr49qAhSI5ib99V30R2AqW1C2tdpBhrOZpncMAYWEA12FgTJrSKleN7bO+xa1n4JoLL9xCeZ/Z5TSb2rX5dq0bbvYYpqinvHipEDQBl0iPcz7L/mG8i155bZs2RuvrR4HD2vgizjsR1k+qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745517400; c=relaxed/simple;
	bh=0NNRD8hvECdYliCgPN8qs5fACVVOrOxAcjVlsBH6qlU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VaMRlYBOrsta//voPpQi7qmfVz6r8hTtMNU7eyPfHm3tLU2ZfCoE7GBA/ZdZD9mqV4sVtoXMZGWn1t4E16jPdBcKzL1CdkAivbYvRtYcMVY9ZwAGeQNeV3mIA1PzGUPjmHLG+8wrEQOOZceL36K3r62+kC4sUXLKHVDVEkyFad4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mycMnAg0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mycMnAg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745517399; x=1777053399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0NNRD8hvECdYliCgPN8qs5fACVVOrOxAcjVlsBH6qlU=;
  b=mycMnAg0hjxU66wYuKjQbnKcVnMsfNlVVc7ZSe7L14bCmLFmYTxI45bJ
   5pFs4kVuP639vUj6kmLBC0WAQKqumhy/FJhwNOd8mKX3MiyJVGvejSW6N
   KpCqmq23NQ1x1CnNDaewn+875JLqwAAG2DB1wNNSkxZAuY/segGGY0YqU
   RDN4T0bocTnyTSKsGN3X44F/KYePvoqQmooj0bEBrbYNpCiMj8eM6mLqP
   fC5UiIHSUYNsS/SE4w/ickaeyupb+Hgus7/jG8eESCbxucCBrFAtM65XO
   /c7IlTI4FMktu+OdOsd9rBKmxxQ6DYdFrW9NxzbYHpRHhfHKuC2LTb/e+
   g==;
X-CSE-ConnectionGUID: ICjNeRoTSceOetxd0anxxQ==
X-CSE-MsgGUID: 0G7htLNkRNW88b0zzhWcUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57365215"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="57365215"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 10:56:38 -0700
X-CSE-ConnectionGUID: WBHKU3jRRmeiZ/H8VAawmw==
X-CSE-MsgGUID: Y+VTLDnHQe6hayZMe/N8aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="137679358"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Apr 2025 10:56:36 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u80oM-0004Or-1G;
	Thu, 24 Apr 2025 17:56:34 +0000
Date: Fri, 25 Apr 2025 01:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1] ld.lld: error: undefined symbol:
 led_mc_calc_color_components
Message-ID: <202504250148.qGLwEalg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   9ec06c6289706e350d24ee4b541375c4861835b2
commit: 19cbe316423133e087dbe89b6d3fac2858d683e6 [0/1] UPSTREAM: HID: playstation: expose DualSense lightbar through a multi-color LED.
config: x86_64-randconfig-121-20250424 (https://download.01.org/0day-ci/archive/20250425/202504250148.qGLwEalg-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250148.qGLwEalg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250148.qGLwEalg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_led_classdev_multicolor_register_ext
   >>> referenced by led-class-multicolor.h:105 (include/linux/led-class-multicolor.h:105)
   >>>               hid/hid-playstation.o:(ps_lightbar_register) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: led_mc_calc_color_components
   >>> referenced by hid-playstation.c:848 (drivers/hid/hid-playstation.c:848)
   >>>               hid/hid-playstation.o:(dualsense_lightbar_set_brightness) in archive drivers/built-in.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
