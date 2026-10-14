Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40659B640
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 00:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791938099; cv=none; b=FbaNaMLB3sKJD6+F1Y6nMe18liDshADqIBD8PTFHjIsuF+v20QaEHnPOAsgrSjsQwvG1vXcPUYsNa4bjsvWeB0quxpr/EYUZVBo0rccAs3Hli5aR7nWZ3smHazC4L5sdZKIpiAYkulDlmO1MD8iM5/rh5QXWeoZTO227Ae6033I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791938099; c=relaxed/simple;
	bh=2ItxNFQw0gc1uQG66JI6NNXz5tByz2ChXGDTa/ZMxDk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T3t0RisYxcSWvU5rtqzviyr5yCAWA3nz3N3B1JQoTRO35Vh9b9pi6VS+0QpvzD1C+bPpZGnXEYAy87m0mz1WIlo2nmTIzCYihOaUibTey6M3dk1AQ29Z02DZNlFhpSQivh2cyMeYGkEiEDveI4gBkalMqzxG0FznWTFwQkaDfns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oq7A2RGs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oq7A2RGs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791938098; x=1823474098;
  h=date:from:to:cc:subject:message-id;
  bh=2ItxNFQw0gc1uQG66JI6NNXz5tByz2ChXGDTa/ZMxDk=;
  b=Oq7A2RGsO8vP0tN+BYnHmF2QWh06LteJTYWlSLSwaIDZyvYa4uxa63JV
   1thGlEPXuG4Bu/cGgBui/qAHZHu1OE9VnGKXmkYzMW589HUC6+yxq4FSM
   60VgXFjXrAbJgE8Yf2OEqEkxLRB8Lf4qvmqHu8Ew/3mD8E9ISbgi+rkL4
   OBpi1nne4t3WP47I5T1YVT3Z+XTypB8Jii0FlEDQpa0rfj1sey1dHwbEh
   EV4k54Yi/DoEJb95XDQcS0wpW+6Da7Sikfoas5TUiF2SaxrgGV/pTfMgN
   a+BJFQ6lqvZDYI1+CWQKHxpIxT2Br0CseaYoecJn0I+smYMcfpeey+KSC
   Q==;
X-CSE-ConnectionGUID: NUVYiMiLT4i+JPwzgkZFUg==
X-CSE-MsgGUID: Tt2HSMcPTbCto+rjw+cDtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="578201"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="578201"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 17:34:57 -0700
X-CSE-ConnectionGUID: JGfPlzCpRYmnLiEkjd4q0A==
X-CSE-MsgGUID: hihTTeuUSAO6Lz+I1DBmIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1729633"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 13 Oct 2026 17:34:56 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGmxK-00000000Amd-0vrC;
	Wed, 14 Oct 2026 00:34:54 +0000
Date: Wed, 14 Oct 2026 02:34:30 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-06 6/6] Warning:
 drivers/virt/gunyah/rsc_mgr.c:158 struct member 'adev' not described in
 'gunyah_rm'
Message-ID: <202610140239.p7Uz9PCr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Elliot,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-06
head:   0f36171b3c2e6f6fa135e5caaafcbe8dd87bf997
commit: 96f4587757641b28c77ef6a22d7303cabd726864 [6/6] ANDROID: virt: gunyah: Add RM info struct as alternative to devicetree
config: arm64-randconfig-r2105-20261013 (https://download.01.org/0day-ci/archive/20261014/202610140239.p7Uz9PCr-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 285b36e5f279398c8a8f6081bee88a5e105ee07f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610140239.p7Uz9PCr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610140239.p7Uz9PCr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/virt/gunyah/rsc_mgr.c:158 struct member 'adev' not described in 'gunyah_rm'

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
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
