Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4507B14D280
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722676198; cv=none; b=GNVXlTX6xGYiADtm4D8hZKHzWykXhE1Rxcx1ufEx/oaeHuKSHlRG97i894TCwofKOYVb2GV0cgc4HIUCYAVhwl2K+np9zxWDyju9qqwlcNPfBzg5OkmmEKXAoDYL2rqgDUFCAl7Wr8p5/qljHQVKL3y94GBAhiTs3vOwSIC/5GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722676198; c=relaxed/simple;
	bh=+etRo/qJRf+Q4JHjUGj5qK/rj1kCcuCylch5eqfPUGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qDl//fLrn7gXN0MhloTrwn7ieuerbUmvJFcFZEON5qDZf3ZT9LOQ3nSfhlW1DLiZqWBRI3J7g7daVQNSbG56bjwIx4JBhqYCVwbddXP5FeVwqgPbJUTDLTEQglE5EMYvn8KQ42SQT0XSNK+OGGx812pHU464EKUr4Ni1crulBPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/duXcgA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/duXcgA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722676197; x=1754212197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+etRo/qJRf+Q4JHjUGj5qK/rj1kCcuCylch5eqfPUGk=;
  b=l/duXcgA/X1uvrHAfCJWy1lOQQeo8Yhsy7D/PpW6UXTaty8YR05TUZ5S
   7nEHEym+q6sKmrUHASRjW6/ju2k7owUPQqDgrfL6w0N/KcRvu4rGyXGUn
   x40vkEFZj3q+AYwSQqAjmBNGM1VCbK0RJWibLSxfj0n49in/XPqkiSPKS
   UaJCtifPR9p14VTivc6pIbJxfDPkV54U/q7dYLhqtH5V8GbwT+JXZLY/4
   cjnrFinqRFpMi+tMlPFGIbChyq902l/Wjz+21rvElGX3o4W2YCX7yQWpJ
   c5BlFcgniPGJ9+7gxsNGY+CnoCKMCO0hBIyUWPMgpfUjz8jclS1diMUQn
   A==;
X-CSE-ConnectionGUID: UxlRK0d2TUitxNGcQOypXw==
X-CSE-MsgGUID: kIPyASYQQxWt5gh1Eg6Hmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20644792"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="20644792"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 02:09:54 -0700
X-CSE-ConnectionGUID: liLkrTL2SwWsEbhalJp5Nw==
X-CSE-MsgGUID: LTCHKhtcQWOjC/oESsXExQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="86613256"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 03 Aug 2024 02:09:52 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saAlp-0000LK-2w;
	Sat, 03 Aug 2024 09:09:49 +0000
Date: Sat, 3 Aug 2024 17:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot+extras/v6.11-rc1 139/152] kismet: WARNING:
 unmet direct dependencies detected for RESCTRL_IOMMU when selected by
 ARM64_MPAM_DRIVER
Message-ID: <202408031705.64SkaRtu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot+extras/v6.11-rc1
head:   31781dfaf7c1998c9a37ccb074dea9638612653c
commit: 76d94a69911a4baa725a1e68fc0a187ba7ab13e7 [139/152] fs/resctrl: Add support for assigning iommu_groups to resctrl groups
config: arm64-kismet-CONFIG_RESCTRL_IOMMU-CONFIG_ARM64_MPAM_DRIVER-0-0 (https://download.01.org/0day-ci/archive/20240803/202408031705.64SkaRtu-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240803/202408031705.64SkaRtu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031705.64SkaRtu-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_IOMMU when selected by ARM64_MPAM_DRIVER
   WARNING: unmet direct dependencies detected for RESCTRL_IOMMU
     Depends on [n]: MISC_FILESYSTEMS [=n]
     Selected by [y]:
     - ARM64_MPAM_DRIVER [=y] && ARM64_MPAM [=y] && ARM_SMMU_V3 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
