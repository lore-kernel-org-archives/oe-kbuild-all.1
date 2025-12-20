Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE4222154B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 18:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766254250; cv=none; b=rAVkNBHUJbtMXipoM/+QdAg7ABnG8Cc24OHk4DkE0Q/xaSofn9nYO0m/J4lUKmbCxGeA77QWrr8NKMN0s3v3lnZ3FUtz7OPHiBerZFggh7VESorTA5F/U7hdJVmqkoAd6+TzV/22kCNNvgddBPukxvqCPT1ekWB5E2IWC6KgjKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766254250; c=relaxed/simple;
	bh=J3bKISQ29zUaFbQRa9ORpntqiTQZpnC2eZxc8NzD25Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Or8EEAtIngH9iWfbaPFxM/Jhmj712cmFpgvsQuVtgtUkzHQ/CXrDxJYT8l0BgPf/r78gIGGQrQJEifMw0/ah+jtA5+dnY2nmbcY3FayP8XYsGSrJir8q0yV/8SzisNRm8Lh13GXRd6KlF+W3nQwGuSZ5NVfkS6Yg6e5H/oPcnIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cnTQfcCA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cnTQfcCA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766254249; x=1797790249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J3bKISQ29zUaFbQRa9ORpntqiTQZpnC2eZxc8NzD25Y=;
  b=cnTQfcCA2Vo3ZIac0SAZ4yO/PoCxDyXQybhvzDlhEmEn7BpNzAPp7OGU
   uzv1F8QhaT3vitrlbCkNpz3V/qrK4c36NrDte5U1NOk6dsvLb5eDrzxHL
   Z39SGOBo+yfRYxclRdKCW/xzApHwri5ke/0yb6Fd2MWaVWa5/+tW2c1Ae
   OcZz9VdfrgDrzKoOhjv62GN8gr/IrafGSswAPfb3M1oScG0ZEcFhIt1g5
   3QDCgGZWKyNTOhAwc8WBTavgwjxaKMWUfJhxf6E1BmQwoZYZiWEIumHh7
   nRKcZdymjIEc0j5Kjg9XWdiHsA2iV4Thc9ZzxedUjm0MWikbWOnLbTeSw
   w==;
X-CSE-ConnectionGUID: 6jIET17MQbG8q/Zn/XgWMg==
X-CSE-MsgGUID: SXGAhGatR/aDTnMog5opag==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="70752566"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="70752566"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 10:10:46 -0800
X-CSE-ConnectionGUID: qLd3F7sWRPyv+uzx0UvKYg==
X-CSE-MsgGUID: XHnIflL8QwSeFuj6FImi4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198749923"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 20 Dec 2025 10:10:45 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX1Pf-000000004jo-0Yzz;
	Sat, 20 Dec 2025 18:10:43 +0000
Date: Sat, 20 Dec 2025 19:10:09 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 4/4] kismet: WARNING: unmet direct
 dependencies detected for DRM_TTM when selected by GKI_HIDDEN_DRM_CONFIGS
Message-ID: <202512201933.8NDm4bsY-lkp@intel.com>
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
commit: 51c9ed876ce194f1f3c6bd778b7bb46a8deb1dd9 [4/4] ANDROID: GKI: Add DRM_TTM config to GKI
config: arm-kismet-CONFIG_DRM_TTM-CONFIG_GKI_HIDDEN_DRM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251220/202512201933.8NDm4bsY-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512201933.8NDm4bsY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512201933.8NDm4bsY-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_TTM when selected by GKI_HIDDEN_DRM_CONFIGS
   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_TTM
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
