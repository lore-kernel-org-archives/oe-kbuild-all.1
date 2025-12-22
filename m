Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A1B249EB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 08:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391319; cv=none; b=DUKF+P0r9OiWH+14Sr/PIzZxeeQvcL/0jDNdTggY7+pu4sKtxD2ziy0A+lfgxneLJYJR6cm+pna2aUZrry74/rig1Q88vzf5ON3CV+MyLVVwOMaEgfzrHdcqfQH7QHWh6+aonP7raiol3UptHUmALUAX5jNYAtcX/pzh73OI/qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391319; c=relaxed/simple;
	bh=fvhty8idAgA5722HNf52CluJwVRkoYsIjsdfbSulO2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jZK8kmUrvt/KLJU5eki/yBPtttEI4eMWVDqa3W6IlyDULOSqbC91wWOtXsbUa5xbRrv50Ba6O58Ejc5SRbzpYSbtxVx02ViMBPVKl5bE2e+2cZYUCnBqcN4YtNbaR2p3EKD4vnpfYjF6PSVI5t7xhlsCxdUa0KPfYaUdz7/rB5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P80uuZQx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P80uuZQx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766391318; x=1797927318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fvhty8idAgA5722HNf52CluJwVRkoYsIjsdfbSulO2E=;
  b=P80uuZQxz77tuofJkjhAoGTH0GySKIyHpQWOlDtLf4XR1dHB+amR7YaS
   6Rc5Oy0iCr0DlT98JaIE0TMEBUtQRxTS9dKNjQon0QrHtOCW+PEllGkyY
   xDvlrFkm5ScNem/ee7TyAZMEBRF7gaS35txAH0Zz6YPzxOGpBXujGhuoN
   f/8x/HMJ2QuYApWSFZXCiJ48bacXEfq1hTnlE9tx/2jOa00pQ3o7b4WCZ
   rTubIeZtTxC7uEIqdfqAfaGJ+KlIy9Zdmt9zyjn4LZHNeH7PWG3yGxlaD
   ghyMNqmIBf96c00B6wt2idHJ+mHnNGGEchSG9n1kFP1fbg8AR1AS3Cb60
   A==;
X-CSE-ConnectionGUID: KewW/RRTQqOEhmVY73v2hg==
X-CSE-MsgGUID: 7aiLfMFDQDmc3aCJ6lmnLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="70821097"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="70821097"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 00:15:17 -0800
X-CSE-ConnectionGUID: tYI7yXIDTJG4fHwfkn522g==
X-CSE-MsgGUID: 1UD+BuqWS5aRhdSfm81kXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="230483659"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 22 Dec 2025 00:15:16 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXb4T-000000005PM-2lHM;
	Mon, 22 Dec 2025 08:15:13 +0000
Date: Mon, 22 Dec 2025 09:14:49 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for NET_PTP_CLASSIFY when selected by
 GKI_HIDDEN_NET_CONFIGS
Message-ID: <202512220910.yVuSRU90-lkp@intel.com>
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
commit: 30f31797fe80307598bc2502bfe2eb19b9bf13fe [12/12] ANDROID: GKI: enable networking; add hidden network configs
config: x86_64-kismet-CONFIG_NET_PTP_CLASSIFY-CONFIG_GKI_HIDDEN_NET_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251222/202512220910.yVuSRU90-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512220910.yVuSRU90-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220910.yVuSRU90-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY when selected by GKI_HIDDEN_NET_CONFIGS
   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for PAGE_POOL
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
