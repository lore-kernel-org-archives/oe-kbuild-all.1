Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AB1224B14
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 08:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766307601; cv=none; b=ndPMyMhgm+M96xAA1Enkb7jVR76TIwdWrp972EBCwHmD39k4SgiNdAExgrj6j4+BvVqFbk3tKfWxtFsCivA8yOcpdX0fe1FwV4fgPeL3/ZbEr/D12w0gvmrU+xfSFGpMGh7Dwp31C/2mVw95Q26glgk8zTqu6ByDCVJ7JV0/A78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766307601; c=relaxed/simple;
	bh=gHos2fzT8yeafsEFzUQQFKMQPKpJGiZ8L2ecH/P/bCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j4MZW8Jp3DiyVbskBb34JICoj3ZgBAec4f1zDCwtMU+Wg+2LoWf5QVWumKyOeVIcQ2sWnxbHkl8mDoPepyNeNWpeXlue6yTb5MH0+IoWLOsxkw8i747Ipf0RkYsnkBWoEgwqglZo2uybKlb+BhHP26VxJQP3he44V9LmfYo0jWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddW4a3P4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddW4a3P4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766307600; x=1797843600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gHos2fzT8yeafsEFzUQQFKMQPKpJGiZ8L2ecH/P/bCg=;
  b=ddW4a3P4OnG82iyWEFVkQeFEPRv9GrLslsf/HWJckm2aPiltzL8UZjnD
   DoPATF63KFfBRZOZjixXbQJgW2t3chmyycTfOEGQRQPC3obK6ykEoPnfg
   qA9WXWc9XB+8gvME0EC1SLZ7ERpzHZQsFLEg1fqS1ukuW9tX6YHFbstYN
   AYjEZGG0qa7XxcR3SDVRsVocqNQZXHMe0tWl/4J/kVr8BNb2Riw7BPRFs
   IrG2k59ECr9kbkWmCHE+1AE5RTtTj5MxlL+Iu3/YnGc5Xrx9dzhrilxxq
   ThufOnh1E9JNW2chM/wF1TL4jK/RherAmbRE2R8cqCliUMTvB2m6LrtwH
   A==;
X-CSE-ConnectionGUID: XcPXoLHFSY+V+U1Sjx9lew==
X-CSE-MsgGUID: yXDSbpkcQ36s+az1lQAKaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72046602"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72046602"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 00:59:58 -0800
X-CSE-ConnectionGUID: pUlMregRTfu6kjB78M27vw==
X-CSE-MsgGUID: H9JXVwoOQ42Mv7ksSy1sSg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2025 00:59:57 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXFIA-000000004zU-3dh9;
	Sun, 21 Dec 2025 08:59:54 +0000
Date: Sun, 21 Dec 2025 09:59:35 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for DRM_PRIVACY_SCREEN when selected by
 GKI_HIDDEN_DRM_CONFIGS
Message-ID: <202512210907.kCn9f5MR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: 37d3c7ab72bddb663d31da64d4b888d56ef11440 [12/12] ANDROID: GKI: x86: Enable DRM privacy screen
config: x86_64-kismet-CONFIG_DRM_PRIVACY_SCREEN-CONFIG_GKI_HIDDEN_DRM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512210907.kCn9f5MR-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512210907.kCn9f5MR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210907.kCn9f5MR-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN when selected by GKI_HIDDEN_DRM_CONFIGS
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y] && X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
