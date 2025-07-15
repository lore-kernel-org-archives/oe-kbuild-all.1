Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390F81B043C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 05:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752557657; cv=none; b=sESczxQfndMcNLH2gLvwfuWYwpPAcsBa+/bv190OTamNpv+bh2TxdWD/QSOX3nzFaL9sQ2IqUZd7ulAyW/a2+uQGSeLn+uRXMxqL8EnDjMoKdNJZcQgBPLC+h40M2cReqmgPPg0Hf0taddrGQucB+VctvEjb1u9Djm5H+4VJEXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752557657; c=relaxed/simple;
	bh=pztbjE3Id00oOmo8kzVcv0g34FIWWuh6XUuh+aEHiOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mrrumbu4Rs2WzY0P+V9NIlcIW+BKvJBo9FRZrxl58kL3pgIxNW2cAihiFHDQBV1/UJbE8seFcCqb3DBn4AolMYT+LxsIXzU+aH76w2dVNZNxHoxKMwPbzYc3pt951SptNDbS8u48qw7GKdUPwFqbrEBMgYDrCVeRwq+hROjtq1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSPWPFLq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSPWPFLq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752557656; x=1784093656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pztbjE3Id00oOmo8kzVcv0g34FIWWuh6XUuh+aEHiOw=;
  b=FSPWPFLqavmCJIbLrKh/MNMo7daFWDzZq1MMGTGDFrb28fLZrCxprROQ
   vWpKQOVdYvn0O+Ts8M7F2wJAzQDqTngwX6f4gnav8JeeqzTZii+2nj9Yw
   ys8JE+eBJjynpLTnK6cHLGKyzutv52ugMTNid5DgAxiQDbe1yheG9+v5M
   fsSg5QbD3fDTTs1q8W1w0+woubVeiuIEntlut3wKX3mYsYA47QqGhxvzS
   26Vb2wW+/SBp5A6E4rQr4DKSJn6tOVRjrn3XO7Sr6Xc3Tb1OsDL11hmZ2
   iZ/yhdCSQwikGpGjQUgcMUZMEeYGYNnOyvKwXKRZncQysJTQl6JitCGmP
   A==;
X-CSE-ConnectionGUID: C0PZtzjITWGOTaMGXRke5A==
X-CSE-MsgGUID: uJW0WBsqQuiQxuXsWDqdBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53985014"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="53985014"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 22:34:15 -0700
X-CSE-ConnectionGUID: GE5YhFoXTcGKn4MShsDF1g==
X-CSE-MsgGUID: V36/8kgbR3m2HLsEw8m9Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="157483591"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jul 2025 22:34:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubYIt-0009gd-1W;
	Tue, 15 Jul 2025 05:34:11 +0000
Date: Tue, 15 Jul 2025 13:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 3/3] kismet: WARNING: unmet
 direct dependencies detected for DRM_PRIVACY_SCREEN when selected by
 GKI_HIDDEN_DRM_CONFIGS
Message-ID: <202507151318.C7MWxcZo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2227fd0f90c185fcbd05e70ecb752e9580045c56
commit: feb0be0c1302a55148a66cfd506047ea0c425836 [3/3] Revert "ANDROID: suppress GKI configs for 32-bit builds" am: 8b9a794068
config: i386-kismet-CONFIG_DRM_PRIVACY_SCREEN-CONFIG_GKI_HIDDEN_DRM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250715/202507151318.C7MWxcZo-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250715/202507151318.C7MWxcZo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507151318.C7MWxcZo-lkp@intel.com/

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
