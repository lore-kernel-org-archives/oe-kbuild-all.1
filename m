Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A222373C1A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 17:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431382; cv=none; b=N6MsQ0OYiaZ7R/yH8p9LGOqTYlM5+L11pcoXBLaFSFX2reaAlb1eAX8HUsEqoRE/Sg+gGF8uWr1UIwgXQ4Pjybrdz0L5qyprS554KU8Zk09W8Sur0b9imImYiwhIRFSmjQAn5YRA1Cmj3PNiOCQ/XWjdy2iltEdM0W2wSHS8JEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431382; c=relaxed/simple;
	bh=7LpjUlwXcFvJVlN2f4Qxjmc5FnLFB8iUWislTBQc8Vc=;
	h=Date:From:Cc:Subject:Message-ID; b=EeBLP/fLlevrfTJdBw3ePxs9VDXe5bb8MevgnIUUE4075+E9/xQCt78CUuKyIb4L8AXgSt2tHAgodOTe1+C5O5r6U3s8MRWl0ycCOzgtXpZ4FX/n2z97RzhFkGX8prNdDBifPS+Kj+nZYQFCOcxaEmtuBMTGyLw5UVoxqNhl1zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNf1azgZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNf1azgZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785431381; x=1816967381;
  h=date:from:cc:subject:message-id;
  bh=7LpjUlwXcFvJVlN2f4Qxjmc5FnLFB8iUWislTBQc8Vc=;
  b=ZNf1azgZXbGlm5Z4Hd9aRUr5eMYL2IVwK+5DdXDRW6EGEGWxi8kKeg4X
   i0HW1+37Y+1RrsDAmsKK/O6Ll4np/XTku/rRJjem9e0VZbLUJa+u2er0u
   l2bGF9fsP+hrNByYbeU8pvaaG9XtItRPvLSkQSIm1JwE2BaNrvmLr5+LW
   H7L8wO7tWkSpzZKSSge8tft64ouVcLodAKZZWI0W2GGze3oEI/yc90Gjy
   vysYn3S1tU87x4suEJky3OM5bPFZBs7Z6FdRlEFk4Z5kqLB+eEPHh+xIG
   sBy0EFyn3ZLsK1T57LhNTR9fF0WyzkYXDjBeq7wxyLLjmJ8edso68RMck
   A==;
X-CSE-ConnectionGUID: X/r4hrXJQuOwrVH9/SNDEQ==
X-CSE-MsgGUID: VWL0MdrhSWq9b2MaGtSOlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="111603992"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="111603992"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 10:09:40 -0700
X-CSE-ConnectionGUID: 6lWK7l03RC2J6Q4o+rjkDg==
X-CSE-MsgGUID: ZeJX133MSNqNnzycBdZEyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="263831830"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 30 Jul 2026 10:09:39 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpUGG-000000002Pu-2SEF;
	Thu, 30 Jul 2026 17:09:36 +0000
Date: Thu, 30 Jul 2026 19:08:57 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/android_t 1/1] kismet: WARNING: unmet direct
 dependencies detected for DMADEVICES when selected by
 GKI_HIDDEN_SND_SOC_CONFIGS
Message-ID: <202607301852.pGYO9XO3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_t
head:   cae1f18703f8b6ecf8a9d232c494bdd5130e6992
commit: 5432cbf467920ea6fa510ef9bf61f04b1476803a [1/1] ANDROID: GKI: select DMADEVICES if GKI_HIDDEN_SND_SOC_CONFIGS is set
config: sh-kismet-CONFIG_DMADEVICES-CONFIG_GKI_HIDDEN_SND_SOC_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260730/202607301852.pGYO9XO3-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260730/202607301852.pGYO9XO3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301852.pGYO9XO3-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DMADEVICES when selected by GKI_HIDDEN_SND_SOC_CONFIGS
   WARNING: unmet direct dependencies detected for DMADEVICES
     Depends on [n]: HAS_DMA [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for FRAME_POINTER
     Depends on [n]: DEBUG_KERNEL [=n] && (M68K || UML || SUPERH [=y]) || ARCH_WANT_FRAME_POINTERS [=n]
     Selected by [y]:
     - DWARF_UNWINDER [=y]
   
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
