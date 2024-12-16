Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56EE1C9B9B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 08:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734336285; cv=none; b=nDOHjX1J8apJ7QJu6FHRlNY0tDsI8ZEYcHm5O09W7LKU1bHH0OYtkviZCZCTlVIaqxEGYmUEtMi4BaR13Ysa1nQEr4EGGvDs7UCO8tkHurVh4FQYzhO2zIGIXdHxWf0ejp84bFSCTrM+NBMbf3p3sop5RAc2BTUTJ9IRS9nhDkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734336285; c=relaxed/simple;
	bh=U74HnRlU2zvT5f6dVGXg6NjVZC9CYUdVguWAIu+m+Ec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WplHP/nQ6EFTvZoG8cHnQYn7G1aLneAMKfgPL0/EP0FTWvEXSWO8ax8ODoJ5p+8m7b0FKBC+SDS/Q7MEQP5Zi7vuIn+64ucqC+ZGNdDF1TyYKNGfidi48wbEnRA2VMyJc4erXj6Ptd7PYdwCcnHU33/FJ0FTd+Ojs3VHMQt2UvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1xmBz/c; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1xmBz/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734336284; x=1765872284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U74HnRlU2zvT5f6dVGXg6NjVZC9CYUdVguWAIu+m+Ec=;
  b=V1xmBz/cD0BkNAxdOUkSpu6EkKrUc9S5dZ9lbxKYGq0G6uW+FjI/etAx
   nqDsGLd2piRHPrTvBHHhobtkaOUn3ca16gI7Zpbns5hqYnNqf2TjvxRRf
   jFZt4JB78xVNlKC/MIEh+gdXVCqlGhBq7MysVMrHGU81CVY9F0DuHGzhI
   Fd0Zk3ZNtzpzoVNHpyrHJVRT6/lmL+GuWT66RjcSEk1HmY3+49VviXCp3
   2VCMsAuTxBhq/NBI9iqeq/eWct3+eb8JW/zAlirRgeV+PpqhleuLsAuEe
   R1jfmcg2L72hNUR54WPWnZqivZRSDhcd6Xy9Oxs7gOuFTiudy655fpC2X
   Q==;
X-CSE-ConnectionGUID: PBrrLE/HQOeBbINmURltkg==
X-CSE-MsgGUID: cR576AjTQa+Pw6dhAydvjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34033518"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="34033518"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 00:04:37 -0800
X-CSE-ConnectionGUID: +iahQ3xIRBShGT2AFFI/EA==
X-CSE-MsgGUID: LikanaLrTg6t6751rFny1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101274446"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Dec 2024 00:04:36 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tN65i-000E6C-06;
	Mon, 16 Dec 2024 08:04:34 +0000
Date: Mon, 16 Dec 2024 16:04:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 10/16] kismet: WARNING: unmet
 direct dependencies detected for DRM_PRIVACY_SCREEN when selected by
 GKI_HIDDEN_DRM_CONFIGS
Message-ID: <202412161549.JEgXtGkj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   38fd3e02b4a1c15d7ae2d81574d3ff49cf6317ef
commit: 37d3c7ab72bddb663d31da64d4b888d56ef11440 [10/16] ANDROID: GKI: x86: Enable DRM privacy screen
config: x86_64-kismet-CONFIG_DRM_PRIVACY_SCREEN-CONFIG_GKI_HIDDEN_DRM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20241216/202412161549.JEgXtGkj-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241216/202412161549.JEgXtGkj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412161549.JEgXtGkj-lkp@intel.com/

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
