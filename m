Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46843262BD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 07:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766303219; cv=none; b=OM44AgXdolsCV51+EatCrDsiUT/Mo+7F/NzIrv+rigrwX4Q43JKIHJzWt5g48uBWhpYNxjcNIWQhce4iQRZTxdl76zt8IskXlLw/bWV7pB4pGAc9mCTjxEIMIPSyDgPQw1eGavtxnGU8P7d9TC8hauopDRVZr1WNgbMm8SNquaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766303219; c=relaxed/simple;
	bh=tnukDlQTwE5Xj4IM7gYSEAcmyOYib9eiXSANslN0/cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cMANYkEdIHMgZmIxah1Q6eFbbarSWypFZ4OoQyoNhdRT/1CNve7NpX7YbP8iEb+hWatBKEDcvmPJRz02kcw4jwJHWUyap60Vrryzyu2Y9jp915ofNxCIJP1U1TLeZdMjf27ZQfWh9K7HWfbCdwIKTE6F3UI+LJM+eRg3MSvRRO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CXeODeh9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXeODeh9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766303217; x=1797839217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tnukDlQTwE5Xj4IM7gYSEAcmyOYib9eiXSANslN0/cQ=;
  b=CXeODeh9lv728BusdxvDu/Q0Rg2h0uyfWHjq8IvziULw6p/xqTImcJXg
   pRw8eu9ylWlWGI/h75Kgbi5xAEHO7kFe2bAptKjue1zDrlkWf2n/16rpO
   b/ORp8jaMJDqzBgb0nXHbsyEAyXaw2zKbIgBlC9yQj2dufEcpFDFfLJfo
   hV9aunGly2wGy4sendPRST0vszVPkY+lJFnqG3BhstTmvOJzG63q/GAWi
   RJwOHffmeKAN0VbUJ6Tw+Vk1YfsLvzGxg1slg5wkkWXLYN7CzsudfoHm6
   WkecMiA1PdWs5h4JNwwb/X8f7LDFlpCzPtYcaYBkrj/F4pt3dSs89wfw4
   g==;
X-CSE-ConnectionGUID: TK1By81LToSFx5RJ8tiE/A==
X-CSE-MsgGUID: 4ugte2WiQK6rk2HT522kvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72045041"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72045041"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 23:46:56 -0800
X-CSE-ConnectionGUID: loACAG5uRsCKG/fHjfLEpA==
X-CSE-MsgGUID: z803+5AGTMO8s6xNaxdXrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198881495"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 20 Dec 2025 23:46:55 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXE9V-000000004yC-3tKx;
	Sun, 21 Dec 2025 07:46:53 +0000
Date: Sun, 21 Dec 2025 08:46:11 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for DRM_MIPI_DSI when selected by
 GKI_HIDDEN_DRM_CONFIGS
Message-ID: <202512210835.45lS6wmc-lkp@intel.com>
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
commit: f7fba40921f00bc7b43021aee0efa8c7cef35601 [12/12] ANDROID: init: GKI: enable hidden configs for DRM
config: x86_64-kismet-CONFIG_DRM_MIPI_DSI-CONFIG_GKI_HIDDEN_DRM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512210835.45lS6wmc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512210835.45lS6wmc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210835.45lS6wmc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_MIPI_DSI when selected by GKI_HIDDEN_DRM_CONFIGS
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
