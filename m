Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEBB168BD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 16:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766335207; cv=none; b=djX8pggpUveOoLI2beTppqn9/DUhHBZMHYA3HCATPD4Zdpgl5bdnkbAey1Zz45ehwjs1ZdjWKmmM3jqApPxeIoPqSWzyuMbG/isH73lchWi/ZniuQO8l5jQppU3O938mm2KunY/1vztggqNFO4edIG6q17q1LtErS6/leJQradE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766335207; c=relaxed/simple;
	bh=2AFjOv564D9MUHaer7VEWmBQiz0U9kln+mb1hKG1L54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UjFxBF0tOBiR9ZCASRaQJuR6WnSn8a62Uc0LOoNZwYS+UXZ7MDVsRL9HOSmciwyfKWZJ2LrFkJ5vJbD+XnrYAfUw9m3DFJq8qfgea7nMeAWeFkWrVGRAgJx4Yp0fsztL9TAbgfYgHUVmskKoUd6d6j+dULTHBqMiH3lXY8qdbpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tjq1Uc+a; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tjq1Uc+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766335206; x=1797871206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2AFjOv564D9MUHaer7VEWmBQiz0U9kln+mb1hKG1L54=;
  b=Tjq1Uc+a2iBU13zQx6sOPjhKDkLeurAvyDmsYI5RiqR1+V2YrTpJvetO
   a2RHYDhCTRcSRnzU4OWlU2EbMiti7xdl1cHxH2hDzO7dTDlpuzm6Syugk
   wFwgdoFYms6sKfHH0ZqhPvjPFVYaPhhb7/ON0cRA38jlrzbIlv+m0MP7a
   /tYDCcq+MoiWKiXLB4cV9bmX1Ye/izuR7G/vFTI7SVXqSlQkXk2Nhrcv7
   dwyGfs5BubO1xBUVHU0G/X4ayXJs+17c72GS/JxXt0UiDbZEU2VbUp7oS
   PKpYq1EEn8PDECZleKefqTTYf+CVv/j7fDmnAvtG+0x6ZLJWr10XQ3agm
   Q==;
X-CSE-ConnectionGUID: 6gKRhuubS2Gpl5kruvUcKg==
X-CSE-MsgGUID: E7NTp+c8QhOQl6ujeu+adg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="71845308"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="71845308"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 08:40:06 -0800
X-CSE-ConnectionGUID: 1sF61PSBQyyhx3i6ZH+nGw==
X-CSE-MsgGUID: swzc1Q1ERAas5RnqG6f40Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="198485152"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 21 Dec 2025 08:40:05 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXMTS-000000005Aa-2SdV;
	Sun, 21 Dec 2025 16:40:02 +0000
Date: Sun, 21 Dec 2025 17:39:14 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH when
 selected by GKI_HIDDEN_DMA_CONFIGS
Message-ID: <202512211737.JxKujdAe-lkp@intel.com>
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
commit: 194fc9ea8a50fa11e9b03bf04449614fc79be59a [12/12] ANDROID: GKI: enable hidden configs for DMA
config: x86_64-kismet-CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH-CONFIG_GKI_HIDDEN_DMA_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512211737.JxKujdAe-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211737.JxKujdAe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211737.JxKujdAe-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH when selected by GKI_HIDDEN_DMA_CONFIGS
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_DMA_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
