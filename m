Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24FF1A9F87
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 10:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788084266; cv=none; b=JbNVhY5hEm/Lkze8zZJhJaAOJ19VCaQcQpBn+759Ix+kr8IcXbvkiwszksjvYWhG7Dz72qCrcSxaknlcs4HZsgJFda0Si4xdOf2XteNyg+T5AXGstNoZrvVyh7gauvnsB6neKBIkq3R8o6Bxb2Hxat7aOlFBlsWGGk3NXEjtwbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788084266; c=relaxed/simple;
	bh=HtfTVsgMqLrXbeg4pJHcHK23Im6LkxqrsOpLiBNk2aM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oNiP4YYfuu03zFP8PHb3x5NBPLahHDbtsycpYSqsgXE5oKlZMWdaFbZxcSJ3hXuUpxtQjwKG3RsFx8rhXS5u28m6KImU4tDbgrU+/37lexeMY3Nj499q4RNtanSri4y85ElNo78YcEy/ZuuEF3xtxRExEWu9QhBS/D4VTyUcRYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=akl/T9fD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="akl/T9fD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788084264; x=1819620264;
  h=date:from:to:cc:subject:message-id;
  bh=HtfTVsgMqLrXbeg4pJHcHK23Im6LkxqrsOpLiBNk2aM=;
  b=akl/T9fDSwmi1iLF8Vswy2TPoCdJtvXnr8qAlorKHwclXzehgU2qstwa
   eMJteGPFYW7BQ9G2Lu3uHLLcRpEZeP9vWzrYj0L+twDaO8oYldTvsXII4
   5rGospkUXPNTHlRbQpJjnqdYrLm9u2zCFgBLOhwJMtyAG26/EnMuQ5ZNT
   gSvyxG+Yp7yd+1jU2ttE+Zw9cTsjIEUMxin58dWv1VG23Y1hPcbTwQCsy
   TB1oE1FwKxwhIAJJYiVnwQBUGr1uMbMmUMQqd+FWBT/hlF1ATimDQbsMO
   IEkoA72gf9v3LI/A5jZmuZws8JzOwJrVrMImKyFm7LGFF0LuT4AAN/74F
   g==;
X-CSE-ConnectionGUID: 4hLVFJcbR8+95MZE3i2s9A==
X-CSE-MsgGUID: E0fM+V1CQ76w5oc5RP1wxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="88569717"
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="88569717"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 03:04:23 -0700
X-CSE-ConnectionGUID: 9wFABmpESJig8sbcTcJslw==
X-CSE-MsgGUID: UpLeqDtcS622KPVNQKVk1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="298468808"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Aug 2026 03:04:22 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0cOi-00000000Dls-0Zsy;
	Sun, 30 Aug 2026 10:04:20 +0000
Date: Sun, 30 Aug 2026 18:03:22 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/vramstuff 9/29]
 drivers/gpu/drm/ttm/ttm_bo_util.c:52:35: sparse: sparse: symbol
 'ttm_transfer_object_funcs' was not declared. Should it be static?
Message-ID: <202608301731.UpNNN4bY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/vramstuff
head:   13a8e2000329a36f994acf2fd31d307d27fa9189
commit: 57394df648c83d7fb95565867626ecdda07f4af7 [9/29] drm/ttm: replace TTMs refcount with the DRM refcount v4
config: um-randconfig-r134-20260829 (https://download.01.org/0day-ci/archive/20260830/202608301731.UpNNN4bY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608301731.UpNNN4bY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608301731.UpNNN4bY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/ttm/ttm_bo_util.c:52:35: sparse: sparse: symbol 'ttm_transfer_object_funcs' was not declared. Should it be static?
   drivers/gpu/drm/ttm/ttm_bo_util.c:342:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *virtual @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/ttm/ttm_bo_util.c:342:38: sparse:     expected void *virtual
   drivers/gpu/drm/ttm/ttm_bo_util.c:342:38: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/ttm/ttm_bo_util.c:348:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *virtual @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/ttm/ttm_bo_util.c:348:38: sparse:     expected void *virtual
   drivers/gpu/drm/ttm/ttm_bo_util.c:348:38: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/ttm/ttm_bo_util.c:478:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *virtual @@
   drivers/gpu/drm/ttm/ttm_bo_util.c:478:28: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/ttm/ttm_bo_util.c:478:28: sparse:     got void *virtual

vim +/ttm_transfer_object_funcs +52 drivers/gpu/drm/ttm/ttm_bo_util.c

    51	
  > 52	const struct drm_gem_object_funcs ttm_transfer_object_funcs = {
    53		.free = ttm_transfer_object_free,
    54	};
    55	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
