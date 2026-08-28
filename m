Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A212D12EC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Aug 2026 10:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913369; cv=none; b=DUTjIDI8z3Bpq6pWSVUmge053CJuj32kfOB2nNAGcXQSMP035y/cb3u0QRGGeXkwTnxoAop9M3bJ5/UAbN8MIp24cCH4ha19y+tgxzJTxln0EOjQjv6weTyJ15BfHNtMigANsIJbdolkpK69O4pL/0DrCSkdoFGK4Lcjy6rZd5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913369; c=relaxed/simple;
	bh=YJ923yHdTdQVxsm/Doq/EcfSkvHpczKvNf858rMT/co=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ovtRWkTC47ixuoEzJob/kAtAL1qGIf2HkvAet5T1I6DHwRoJ9DOwz8Q+4XiOV3xHGohlqPNStYIGkqjscl6U6a5DORNU50McRdtaa1loi+2gCgrZkbZ/TEBeR8KcP9TAMXqvwvTc8uTEW2pxUGlxkY9gy78JKgeKxnNjQfWVl9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fj/90R/S; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fj/90R/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787913368; x=1819449368;
  h=date:from:to:cc:subject:message-id;
  bh=YJ923yHdTdQVxsm/Doq/EcfSkvHpczKvNf858rMT/co=;
  b=Fj/90R/Si2kP2fLkvf951vSyXaNXNpyisTQCq6ytfC2jQ8AQLGVDFQo8
   Ov23EaBjj5f4izCNLiOfDZpdwwyO3Pj+AiUUzvli4wxDyNti+YMNulymh
   napvzqSuqcjisha/Ch/8jkN+SAxm3X8v0njNjzHMc15YSAvH/9Hodsyf0
   it2SQ6VAGOsvxrGGSYMHv6RIdi3IoLK5odjB0SULqBWhnmUkfrkn3xOVx
   3kMm3eme+qMGg2i6VCEmg+6vg4TXmQEsTSSQ/DyehpX6pbSo9pdrSUGwz
   unUZKNeePcsoHn7hWcHkKux1/5/D3+jsCYWIZVNGp4tCXvfhvGEMV+SJ0
   A==;
X-CSE-ConnectionGUID: 87uI+QrcSdC5j7zjK8awow==
X-CSE-MsgGUID: P9OLgwhRQouMOvXPmHVa9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88184237"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="88184237"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 03:36:04 -0700
X-CSE-ConnectionGUID: ir5A7q9gQleLUBh6y9OalQ==
X-CSE-MsgGUID: CA8PnGR6SuC2flWd6+AG3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="261978800"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 28 Aug 2026 03:36:03 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wztwH-00000000145-1AWz;
	Fri, 28 Aug 2026 10:36:01 +0000
Date: Fri, 28 Aug 2026 12:35:24 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] kismet: WARNING: unmet
 direct dependencies detected for HMM_MIRROR when selected by
 GKI_HIDDEN_DRM_CONFIGS
Message-ID: <202608281229.AFj55KOM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   92378ced66f1faad5aa0211129792fcbca45a282
commit: ad36ecd6081db9827f1ebaa41671b0b336fd83bf [1/1] ANDROID: GKI: Enable HMM_MIRROR config for all arch
config: arm-kismet-CONFIG_HMM_MIRROR-CONFIG_GKI_HIDDEN_DRM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260828/202608281229.AFj55KOM-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260828/202608281229.AFj55KOM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608281229.AFj55KOM-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HMM_MIRROR when selected by GKI_HIDDEN_DRM_CONFIGS
   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=y]
   
   WARNING: unmet direct dependencies detected for DRM_TTM
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]
   
   WARNING: unmet direct dependencies detected for HMM_MIRROR
     Depends on [n]: MMU [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
