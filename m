Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10074270EDF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 05:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767848829; cv=none; b=oaDHIcXfLtfwWzAEcmTNi5vpt2KweFulBnrb8qhHsSQijqtvKFoagj21Kr/m/scWIirnZ7+4zQvc8AhfhGtabgaFVuNNHx5PEy43XaRctZ286jqDZa07jIRkf9+Dvzyp484k1KnJSBZb9nnSlyb5+vPaBM+Fkg7BTbAd33+5rVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767848829; c=relaxed/simple;
	bh=jLuYaHG/SFSaG/8MUScEx1zQ9mDZmwF0Rg/5RnDiGbM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F5jO/IwoMeO2TU+QZoGq69dIcJJ3OHeX7WbEd36v2GZzd+24KDZFLRnQYpZ+JhJLTKVdIWOHjySituYchOxTpaMcdT/kPijRck2CyL1eX/zfid67VfHDaX90kDy69RAckcylQiTho5ZIASV3ebG+CQg156pit1i3QnjOiabj5w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKt6n2UF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKt6n2UF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767848827; x=1799384827;
  h=date:from:to:cc:subject:message-id;
  bh=jLuYaHG/SFSaG/8MUScEx1zQ9mDZmwF0Rg/5RnDiGbM=;
  b=hKt6n2UFqEgS+pRbgJxOw0Ay4rBy1HJB2g1LkLZZEDTxxh1B5upRWwLQ
   akPmQcELUDzF2Q+rFXJwKYS9t4yLbtcbHlJ14k9KXGWCalwvgp78kirGh
   vnyR2DXz4SMr8vITYf/p9QyZhk+7mHNxdhUJqPRVgD02bL09/GVG8Qk/d
   9vs36wJ7qGmsfXwWZQ2jB4fZdNSZE3SBDwAIYzEovS8Qy17p7nKwyV3Xg
   8Gnr3+1NJFcl8hG3eNGURQr4GVOc9Q3QSAN6gp8lVdtFU/B6sDPU3EYH3
   LFDL2tRbrbVkxohE4mBfo4ZCOpsb3DEPI9F/C7izHHgjXNFDOzICeFwTg
   Q==;
X-CSE-ConnectionGUID: uGkRXzfyTvyB1emhjBJEIg==
X-CSE-MsgGUID: 39JNuEFmRqezfjYJXtuR5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="80586349"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="80586349"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 21:07:06 -0800
X-CSE-ConnectionGUID: M8W48Nx4STCJVqNNZkwH5g==
X-CSE-MsgGUID: g8JgXqM3TkSv/K502jOEYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="203126396"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 07 Jan 2026 21:07:05 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdiEg-000000001gu-2ZSG;
	Thu, 08 Jan 2026 05:07:02 +0000
Date: Thu, 08 Jan 2026 06:06:50 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-07 1/1] kismet: WARNING:
 unmet direct dependencies detected for FB_IOMEM_HELPERS when selected by
 DRM_XE_DISPLAY
Message-ID: <202601080622.TE9Ljysx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-07
head:   dea313686ec2d0755aaa69b826d7e63fc2acad98
commit: dea313686ec2d0755aaa69b826d7e63fc2acad98 [1/1] UPSTREAM: af_unix: Initialise scc_index in unix_add_edge().
config: i386-kismet-CONFIG_FB_IOMEM_HELPERS-CONFIG_DRM_XE_DISPLAY-0-0 (https://download.01.org/0day-ci/archive/20260108/202601080622.TE9Ljysx-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260108/202601080622.TE9Ljysx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601080622.TE9Ljysx-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS when selected by DRM_XE_DISPLAY
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
     Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
     Selected by [m]:
     - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_XE [=m] && DRM_XE [=m]=m [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
