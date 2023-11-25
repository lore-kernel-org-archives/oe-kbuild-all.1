Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE421947B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 09:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MAb3CpvZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700903426; x=1732439426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qGs4ZHNEuV4TK0AiDPpyJYYLWMorVSnfctRlSJJQnD0=;
  b=MAb3CpvZTb05vpQymtn1TbcePQoKLeBEfEc8SH4lLLYu+Qf/MEw1GwAt
   wrGSZ1hkKbJskRspdWPFH3+ZdD1StEoD+zh5CaRLj9EMcwRR4+culTXFw
   RGXHAhVotgnoejxZQ60NvBaTkak+Os3lqWuvjcBMe52R4TQ35yQA2PEcN
   M6t/J1WYdVvnTboge0IO+7Jm6JxFKJ6/vRYCYU3Yn+ArJF5bQehmFaktw
   U5aZbUsD1Zd8IkfOW6GzIzpQjFQaTnbf9rJaoYCaqdIYZNm/rUCqlJ8UT
   nr5mmbytXAKrHz7m8nxXKc6a9zuLsMaI8m9o/CFBufTL+Xf4yar4GvEHE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="392268722"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="392268722"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 01:10:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="1099303467"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="1099303467"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2023 01:10:18 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6og4-0003p3-0E;
	Sat, 25 Nov 2023 09:10:16 +0000
Date: Sat, 25 Nov 2023 17:10:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 9/41]
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c:37:37: error: use of
 undeclared identifier 'pdev'
Message-ID: <202311251614.BJ27yEjH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   c87a72108f7683a608ec2eb459ee92b3eeca7406
commit: 29b08ed0f8470017002c6d5b30bf5e4fceac2998 [9/41] iommu/tegra: Use tegra_dev_iommu_get_stream_id() in the remaining places
config: x86_64-randconfig-121-20231125 (https://download.01.org/0day-ci/archive/20231125/202311251614.BJ27yEjH-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251614.BJ27yEjH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251614.BJ27yEjH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c:37:37: error: use of undeclared identifier 'pdev'
           if (tegra_dev_iommu_get_stream_id(&pdev->dev, &stream_id)) {
                                              ^
>> drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c:37:49: error: use of undeclared identifier 'stream_id'
           if (tegra_dev_iommu_get_stream_id(&pdev->dev, &stream_id)) {
                                                          ^
   2 errors generated.


vim +/pdev +37 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c

    26	
    27	static void
    28	gp10b_ltc_init(struct nvkm_ltc *ltc)
    29	{
    30		struct nvkm_device *device = ltc->subdev.device;
    31		u32 sid;
    32	
    33		nvkm_wr32(device, 0x17e27c, ltc->ltc_nr);
    34		nvkm_wr32(device, 0x17e000, ltc->ltc_nr);
    35		nvkm_wr32(device, 0x100800, ltc->ltc_nr);
    36	
  > 37		if (tegra_dev_iommu_get_stream_id(&pdev->dev, &stream_id)) {
    38			/* stream ID */
    39			nvkm_wr32(device, 0x160000, sid << 2);
    40		}
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
