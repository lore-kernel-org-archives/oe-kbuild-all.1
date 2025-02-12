Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934271B21AD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 07:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739346141; cv=none; b=Wpq/Jd/w0CkobUZSNKIyZ+Hv0/yeis9maW4xwFctt/IPLyUsV9Wn9yqC1N38H1/vdOGmFWlp2lgMngxbZw0sxD5c1AZjTC0NpfRHLAKkSRnh7k6Tk0nStB/axXAOTby4Qj/pnJKt82GkwNDroduAIh2YBm3lMNBP/rtSQEAIMfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739346141; c=relaxed/simple;
	bh=D6M7ven3MNvSeg4NOaujyzJRq9WTKblu/ZTnaEBA18g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aPC5ex4aUq7JejEPfHWoo2T0W56XQWOqDhkIfE+hXvF/ZhXiL/NcHmM9106iw0cVWVaqJwDtdSqx/AxsSovQMfXclkL5nkMRj0T/uIL9e56zpdjGsjZVbhFMwEjb9hnSSmHljCT11siD16+eqUn1np7AoMvLhwiorNXd88wQKuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HGGlW5iD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGGlW5iD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739346140; x=1770882140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D6M7ven3MNvSeg4NOaujyzJRq9WTKblu/ZTnaEBA18g=;
  b=HGGlW5iDaUTsoNohwPsEa8/wp4xu9Q3XfTqKS+cpUo4N/B2KYi7ZPqSx
   vXh6yw4fjMohLa0OW+t/vxvI/FoNO2L8tYrxXCo1dc+oA5rZiFeWfffIS
   vshKH7N/aXfApoNwdtiECO9Qn+qcFkxGVXW/OgXZ9fOcyOvrBaiotBkMq
   So8GnEiZXS1zz0t50DLNANPcsqt3j7xYEflkwTryIfkk6F6Q2g8dhbRsA
   ZkFIHqyTBWTThgzvU8o8LzOaNyx/dORV61ThEYqfBLfVxDNxrzXyIKuiO
   UIjId80y+a6Fi987FeMN7hBjM3wXXnoTCaq8YTl06wWWKJe/z19vhIAsW
   w==;
X-CSE-ConnectionGUID: vPVBNCq1SeCuntNFaZSQNg==
X-CSE-MsgGUID: 3UII9TFJQiaHzz93KkcsUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="51382152"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="51382152"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 23:42:19 -0800
X-CSE-ConnectionGUID: ca578VDYRmKWf/B3dxrGgg==
X-CSE-MsgGUID: wkCtWLZtSUyroPhzaeAZjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136012937"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Feb 2025 23:42:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti7Nv-0015J9-37;
	Wed, 12 Feb 2025 07:42:15 +0000
Date: Wed, 12 Feb 2025 15:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 1/1]
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:803:23: warning:
 'cmdqv_debugfs_dir' defined but not used
Message-ID: <202502121515.yRQYEFZe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   dfeefc6749ea734dab1cc361c0daf8df524f1383
commit: 3d9b1d58c95c36a77e4a8c80f59afe796352fb1b [1/1] iommu/tegra241-cmdqv: Staticize cmdqv_debugfs_dir
config: arm64-randconfig-004-20250212 (https://download.01.org/0day-ci/archive/20250212/202502121515.yRQYEFZe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502121515.yRQYEFZe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502121515.yRQYEFZe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:803:23: warning: 'cmdqv_debugfs_dir' defined but not used [-Wunused-variable]
     803 | static struct dentry *cmdqv_debugfs_dir;
         |                       ^~~~~~~~~~~~~~~~~


vim +/cmdqv_debugfs_dir +803 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c

   802	
 > 803	static struct dentry *cmdqv_debugfs_dir;
   804	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
