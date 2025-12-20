Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3745330C358
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 18:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766257068; cv=none; b=qgsNUCoZwp++BGUF4QLzpPaRiDiGJTRBm3VKtC0gXr6uIQjqPBkY21nFDkrFnUR4vCmy0b73m+/gF5Jlob92jCTnMA+W5Y3aBBfRC/3C0prqO/4aFX+j8YpAhlfxCWHzJtJyCZ/QMlRq99+Lwak/44eLrwd2x0EqHPlqpn2vs9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766257068; c=relaxed/simple;
	bh=cUyJ/orMh+D99cEwnSDfjVrAoIT/6o+a9WaJQ37E2vs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nN76YMy7AGoD99QzQpBy1r0moO7BjoGk7B/OGn3cTLg5P+A5w5Uy5Fc6vMUDWo6TC7Cz0JHzPR0KqnMmwmmuaO7LbBfLq+8AB8XIipb7iZ++CiKwOQGwUv2agYJubDe/jYXHT70MTAo5ZefZJWJsu29vkli58rxzXTChZ/Csv+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zr008Yr2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zr008Yr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766257068; x=1797793068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cUyJ/orMh+D99cEwnSDfjVrAoIT/6o+a9WaJQ37E2vs=;
  b=Zr008Yr2rejAs8W8Wviyqm/hRicFURkLTZrcbCjtNeoGNkQZywTbHwEF
   6WNH/rW1h56IKgWiOnKas5Cbz4l0Kt2DuonNkDvw1hULJy194ECPKcS8b
   P+RbWN9kdBvooCAnLL8eekLzV/Kk1ir9FsGKuJSPcUAt9vzfIvh/HSYCM
   ozM1yaVj5REtn2G9uI7W1ygWRixE8gIlOkNEeiAHqrqlbBTi77f06oL+C
   AHo9oBRfGbVGhsJ8j68sY1Bi+Jai4x+fXL15Oaq+wgSG4oQUz0MzHyqnZ
   ymnpYRV2jOHePhdyJ9LFYDvIJzzJ7/5UEzA437u7/rVSK8GymFte/K4ye
   w==;
X-CSE-ConnectionGUID: ExfnOM4gR6igaQ/rYELXEQ==
X-CSE-MsgGUID: zu2umFu6TyGwkSXe8nugig==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78501095"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78501095"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 10:57:47 -0800
X-CSE-ConnectionGUID: i4Zily8cR8GYTDkhKR1itA==
X-CSE-MsgGUID: G2scqlukQ5uqihaaPRtJ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203595444"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 20 Dec 2025 10:57:46 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX299-000000004kO-2VTL;
	Sat, 20 Dec 2025 18:57:43 +0000
Date: Sat, 20 Dec 2025 19:57:09 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 4/4] kismet: WARNING: unmet direct
 dependencies detected for IOMMU_IO_PGTABLE_LPAE when selected by
 GKI_HIDDEN_QCOM_CONFIGS
Message-ID: <202512201932.Jq7RFFmf-lkp@intel.com>
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
commit: 0c8ec66904ac0a02c5ca7d0498308d90356f81c7 [4/4] ANDROID: Switch CONFIG_QCOM_PDC CONFIG_QCOM_SCM and CONFIG_ARM_SMMU to be loaded as modules
config: arm64-kismet-CONFIG_IOMMU_IO_PGTABLE_LPAE-CONFIG_GKI_HIDDEN_QCOM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251220/202512201932.Jq7RFFmf-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512201932.Jq7RFFmf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512201932.Jq7RFFmf-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE when selected by GKI_HIDDEN_QCOM_CONFIGS
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
     Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=n])
     Selected by [y]:
     - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
