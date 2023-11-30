Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4412946435
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 12:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lABEiAd6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701348373; x=1732884373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uB2E/hRFGwWCf16l5FCRLko2x85+/JjryaFH9E3IOYI=;
  b=lABEiAd6AmvHZKg2s85PZlte9FraRR9iZSkUSrhKdNBqAPfgnPH2fuTH
   HzsouBBy9fpf/Fn5sCcuR+DKbm58EOStneBAUtikx0Eg5BXrBda2mIk8L
   u5NcvG2AZ6IxtHcoLTa6x8Fko21lo3qteSGHswSkt0KqVm5ghmTVASmKA
   woMzJl/ksBDzCqTC+o0ts9E042ve1K7o225jNMOZFb3aD4qotOMyBOg6O
   pbRa0yVQH8MGeYHlXyKRmIsi7mAJM7VKxjYzKQ1nJpx0LcZMVCpZbtL4E
   Qw9EA77mlaI++sbMaazYncjbdwV0/qZQsBXw7ABnEakGKHlv4RrZpPuQA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="393061527"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="393061527"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 04:46:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="942698898"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942698898"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 04:46:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8gQi-0001wc-28;
	Thu, 30 Nov 2023 12:46:08 +0000
Date: Thu, 30 Nov 2023 20:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 27/42] gp10b.c:undefined reference to
 `tegra_dev_iommu_get_stream_id'
Message-ID: <202311302043.7stRMwMc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   ce7d68fa9f538ed4b9c8097e7f1b822ff7301876
commit: 75c3e6cc86ff7ade0f90c51a622ea6632fc363d9 [27/42] iommu/tegra: Route tegra_dev_iommu_get_stream_id() through an op
config: i386-buildonly-randconfig-006-20231130 (https://download.01.org/0day-ci/archive/20231130/202311302043.7stRMwMc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311302043.7stRMwMc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311302043.7stRMwMc-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.o: in function `gp10b_ltc_init':
>> gp10b.c:(.text+0x62): undefined reference to `tegra_dev_iommu_get_stream_id'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
