Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28F31D2B34
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 23:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730848555; cv=none; b=IH+Ju7Zuypjf4lYlV161Zsh/IF6d/Z7mkbmH+o/lskia9yW3UqQmh583/y7bRW5OEQ9Pz0mw7afzfWGP8bd7dLlWe+FWWlc9SPpWv66Zwk/i1rvCIBBcO36KyBNyHwtd4wNyZ4N5Q4N/g6cV9m1Ok/xSl0oT7i+q6JjkB+PbYKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730848555; c=relaxed/simple;
	bh=kNwNpLB8xgJrRgPI4z3B5r0Usq447pMTD7jBjgbdAcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k1GQ+EIQoRmfNQD07ZXPRPw4AdgSlWOdqPL8GZlYIKxNH2O28wwE+aZe7Xm3xqOVdsTeJ2X/9X2PV+wa4JPdg8L00X08HQ6titpBkNVutNQ3kc3355rB9nWCl6RmJtLSczgFfbE5VKgvrf1S13pYs3yGPNRKpM6WqOYPIJWBwqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OFqOK+A+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OFqOK+A+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730848554; x=1762384554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kNwNpLB8xgJrRgPI4z3B5r0Usq447pMTD7jBjgbdAcI=;
  b=OFqOK+A+6UuS/4slBwf1nqWhXS5owUwpb7JngMhA/a7bk4yPgLFQF+g2
   zZwAPVbNQybV51bDB/+qRwWiRqEDEJ2qeqrNPagLIwjMaYVBXR5PXi0Sl
   iJ6Sk4lHzKBAkSh5PdjShitS3FkXypvVFIKvydybsOw06MLsqlXh+73hr
   It7dOwHn8kP721dgxJ4L12yRlvrkC+D2fGev/sABOiDPAH9KEn9L5HgXp
   i2g+x3wPSC4ViBW/zEzRaxmaSk8FfTEbhsZ47AMEh36cuJOn4pl5vKL/Y
   n5cUrrUG+JnqxT+rNFpmJlbX+RjiuHqD55fHM9Xv9WpicmykhuuOWICoP
   Q==;
X-CSE-ConnectionGUID: pUa4LnQOTFWjZqeZp/PmCQ==
X-CSE-MsgGUID: lRjJXMsVT0W3jdA8gPki5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="34551648"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="34551648"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 15:15:53 -0800
X-CSE-ConnectionGUID: Rg4ZE68tRgaqo1qgpIzgKQ==
X-CSE-MsgGUID: N+B7NrFKRoeIY3gbSbyAhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="88765888"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Nov 2024 15:15:52 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Sm5-000mZd-1o;
	Tue, 05 Nov 2024 23:15:49 +0000
Date: Wed, 6 Nov 2024 07:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: Nate Watterson <nwatterson@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:726:15: sparse:
 sparse: symbol 'cmdqv_debugfs_dir' was not declared. Should it be static?
Message-ID: <202411060737.vZVRE3mT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2e1b3cc9d7f790145a80cb705b168f05dab65df2
commit: 918eb5c856f6ce4cf93b4b38e4b5e156905c5943 iommu/arm-smmu-v3: Add in-kernel support for NVIDIA Tegra241 (Grace) CMDQV
date:   10 weeks ago
config: arm64-randconfig-r133-20241105 (https://download.01.org/0day-ci/archive/20241106/202411060737.vZVRE3mT-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20241106/202411060737.vZVRE3mT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060737.vZVRE3mT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:726:15: sparse: sparse: symbol 'cmdqv_debugfs_dir' was not declared. Should it be static?

vim +/cmdqv_debugfs_dir +726 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c

   725	
 > 726	struct dentry *cmdqv_debugfs_dir;
   727	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
