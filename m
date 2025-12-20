Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16F61BD9D0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 19:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766260071; cv=none; b=Hq9DVaDbFZkxCC1+TV3wHfs69WTLun/EYkByn+DZls3jyW4lQU11rD3ir2wirVQkVPbWvvvY1A6OQ2ET+pwx+Dyo3dz7ad2uKwsg89+apU8wgjOTkoZEjowwnKO38Xrb6gDQxIkeE9wFiHR2oMEjM5+wQlNhd2Dx5p8ihNOoFnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766260071; c=relaxed/simple;
	bh=+KwoJD4uscC5DvM86U/fYk833OS83yqd+s3WcfOZX0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MAR2+x6sGj19kAakXqfNMCkC56mxwMX1Z1vMLJdFfJiXYBU/69PvZ9hEPoMBJSRULsSCObF3oqvtHIQr71rjQdxtBVYJ2OSEjsT1YT7BpnLvQMFZ/9ORaSMQ3MXoMWeChpwO1kUwGPORBBWSRvL/5d/xGDyz96znrj0iHVcrvco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhsNCS20; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhsNCS20"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766260070; x=1797796070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+KwoJD4uscC5DvM86U/fYk833OS83yqd+s3WcfOZX0U=;
  b=XhsNCS20a04S0neLaDV7/zD62HKxeUJQd8JvAILCxAiqf3AzHyQvvqEn
   8iQxLZjpyqDBeOkQwbjzS4mfIeWKHLmPoIXrp+VC2XOK1pkgFr3SyXPOI
   hyGYsDrW1dOmXuiEH/QJZtwEDzr4U1GolEalsmcKkSEM68Ui1vTKyxd34
   cV0Mdkn/qXZ4JWFyo2B01S4yrEtC91n0sIVdEgeJWkyZLTR71qMKqiT1A
   NuHkF/GqZevNFh9/xSBLSpoNFwyCi98iyxLt8Q7jP7JIdBJgdAjWU+il5
   03hbQQa6KrEDzgGDQgTfSZU+qkFSM9+oVkP3bt4vS7GGotZCtjNOMEUfD
   A==;
X-CSE-ConnectionGUID: iSfC8c+SRH2U91esuXyaug==
X-CSE-MsgGUID: igDp+CCOTqe/H+7gzCoKMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79302546"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79302546"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 11:47:48 -0800
X-CSE-ConnectionGUID: fztxYvzOSFmxg5Z0Cisnpw==
X-CSE-MsgGUID: sV3O0D0qSJSYKEwFqnMz5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199403865"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2025 11:47:46 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX2vY-000000004lQ-1c46;
	Sat, 20 Dec 2025 19:47:44 +0000
Date: Sat, 20 Dec 2025 20:47:23 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 4/4] kismet: WARNING: unmet direct
 dependencies detected for HMM_MIRROR when selected by GKI_HIDDEN_DRM_CONFIGS
Message-ID: <202512202052.pi6XNrC4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   8a0f08a5606260a0680a6074ee5392a57cd3133d
commit: ad36ecd6081db9827f1ebaa41671b0b336fd83bf [4/4] ANDROID: GKI: Enable HMM_MIRROR config for all arch
config: arm-kismet-CONFIG_HMM_MIRROR-CONFIG_GKI_HIDDEN_DRM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251220/202512202052.pi6XNrC4-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512202052.pi6XNrC4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202052.pi6XNrC4-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HMM_MIRROR when selected by GKI_HIDDEN_DRM_CONFIGS
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=y]
   
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
     Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
     Selected by [y]:
     - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   
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
