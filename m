Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD299339BE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 21:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKmdBtLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698269859; x=1729805859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KZ5vg66fgOGykguW9GHOWwgaqCYJNhc6cVnQvvoQ0fY=;
  b=SKmdBtLT45hr9bfNVzfhe1NNOBbxs4qVbqEdF9dbqX9NhZweVPKBh+mk
   Bcn4pkmn6aqiRU/CYuyVVIjSmwEBoC6JSni2zvFlAE7J25k9oTGGVPYQm
   fFJquRJyJ3se3t8QSKthN+bmoczqXGect3dMxAugTYz+ROcCjHIQJ4kZ3
   CjtLW4t3K5VIgsznXUsZNMyPYMz+LET5NbxXr7C3fu1gtVfDOIHCqjBH4
   2Vy4BVSeGJJUPPzbCku90zARKFaD7UGwa9dF6kepQSahTOxvWeCc5SITB
   GKiMpA1xuGGdYdLF65CnGHfnolP3X+EN6L2Pqnaq0Lm+7ErbKZArIiCyf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="386283418"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="386283418"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 14:37:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="226024"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Oct 2023 14:37:02 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvlZG-0009DO-0p;
	Wed, 25 Oct 2023 21:37:34 +0000
Date: Thu, 26 Oct 2023 05:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-10242023-yi 5/57]
 drivers/iommu/amd/iommu.c:2604:30: error: initialization of 'struct
 iommu_domain * (*)(struct device *, u32,  struct iommu_domain *, const
 struct iommu_user_data *)' {aka 'struct iommu_domain * (*)(struct device *,
 unsigned int,  struct iommu_domain *, co...
Message-ID: <202310260557.IO9p0kUb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-10242023-yi
head:   cdb8eb16aeb02c0ea5063f58a208fd92f3fbce99
commit: ec7f5060108c3d4e33a1acc190adba73cd3bf564 [5/57] iommu: Pass in parent domain with user_data to domain_alloc_user op
config: x86_64-randconfig-005-20231025 (https://download.01.org/0day-ci/archive/20231026/202310260557.IO9p0kUb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310260557.IO9p0kUb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310260557.IO9p0kUb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/amd/iommu.c:2604:30: error: initialization of 'struct iommu_domain * (*)(struct device *, u32,  struct iommu_domain *, const struct iommu_user_data *)' {aka 'struct iommu_domain * (*)(struct device *, unsigned int,  struct iommu_domain *, const struct iommu_user_data *)'} from incompatible pointer type 'struct iommu_domain * (*)(struct device *, u32)' {aka 'struct iommu_domain * (*)(struct device *, unsigned int)'} [-Werror=incompatible-pointer-types]
    2604 |         .domain_alloc_user = amd_iommu_domain_alloc_user,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/amd/iommu.c:2604:30: note: (near initialization for 'amd_iommu_ops.domain_alloc_user')
   cc1: some warnings being treated as errors


vim +2604 drivers/iommu/amd/iommu.c

2c80c97aab181b drivers/iommu/amd/iommu.c   Joao Martins          2023-10-20  2600  
b0119e870837dc drivers/iommu/amd_iommu.c   Joerg Roedel          2017-02-01  2601  const struct iommu_ops amd_iommu_ops = {
ab636481863a10 drivers/iommu/amd_iommu.c   Joerg Roedel          2014-09-05  2602  	.capable = amd_iommu_capable,
3f4b87b959eab3 drivers/iommu/amd_iommu.c   Joerg Roedel          2015-03-26  2603  	.domain_alloc = amd_iommu_domain_alloc,
3629ec67736fec drivers/iommu/amd/iommu.c   Joao Martins          2023-10-20 @2604  	.domain_alloc_user = amd_iommu_domain_alloc_user,
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel          2020-04-29  2605  	.probe_device = amd_iommu_probe_device,
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel          2020-04-29  2606  	.release_device = amd_iommu_release_device,
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel          2020-04-29  2607  	.probe_finalize = amd_iommu_probe_finalize,
b097d11a0fa3f9 drivers/iommu/amd_iommu.c   Wan Zongshun          2016-04-01  2608  	.device_group = amd_iommu_device_group,
e5b5234a36ca28 drivers/iommu/amd_iommu.c   Eric Auger            2017-01-19  2609  	.get_resv_regions = amd_iommu_get_resv_regions,
df3f7a6e8e855e drivers/iommu/amd_iommu.c   Baoquan He            2017-08-09  2610  	.is_attach_deferred = amd_iommu_is_attach_deferred,
aa3de9c05051ac drivers/iommu/amd_iommu.c   Ohad Ben-Cohen        2011-11-10  2611  	.pgsize_bitmap	= AMD_IOMMU_PGSIZES,
9a630a4b41a263 drivers/iommu/amd/iommu.c   Lu Baolu              2022-02-16  2612  	.def_domain_type = amd_iommu_def_domain_type,
9a630a4b41a263 drivers/iommu/amd/iommu.c   Lu Baolu              2022-02-16  2613  	.default_domain_ops = &(const struct iommu_domain_ops) {
9a630a4b41a263 drivers/iommu/amd/iommu.c   Lu Baolu              2022-02-16  2614  		.attach_dev	= amd_iommu_attach_device,
6b080c4e815ceb drivers/iommu/amd/iommu.c   Vasant Hegde          2022-08-25  2615  		.map_pages	= amd_iommu_map_pages,
6b080c4e815ceb drivers/iommu/amd/iommu.c   Vasant Hegde          2022-08-25  2616  		.unmap_pages	= amd_iommu_unmap_pages,
9a630a4b41a263 drivers/iommu/amd/iommu.c   Lu Baolu              2022-02-16  2617  		.iotlb_sync_map	= amd_iommu_iotlb_sync_map,
9a630a4b41a263 drivers/iommu/amd/iommu.c   Lu Baolu              2022-02-16  2618  		.iova_to_phys	= amd_iommu_iova_to_phys,
eb5ecd1a40e209 drivers/iommu/amd_iommu.c   Suravee Suthikulpanit 2018-02-21  2619  		.flush_iotlb_all = amd_iommu_flush_iotlb_all,
56f8af5e9d38f1 drivers/iommu/amd_iommu.c   Will Deacon           2019-07-02  2620  		.iotlb_sync	= amd_iommu_iotlb_sync,
9a630a4b41a263 drivers/iommu/amd/iommu.c   Lu Baolu              2022-02-16  2621  		.free		= amd_iommu_domain_free,
6043257b1de069 drivers/iommu/amd/iommu.c   Jason Gunthorpe       2022-04-11  2622  		.enforce_cache_coherency = amd_iommu_enforce_cache_coherency,
9a630a4b41a263 drivers/iommu/amd/iommu.c   Lu Baolu              2022-02-16  2623  	}
26961efe0dab9c arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-12-03  2624  };
26961efe0dab9c arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-12-03  2625  

:::::: The code at line 2604 was first introduced by commit
:::::: 3629ec67736fecadc0162585364e462e453bd860 iommu/amd: Add domain_alloc_user based domain allocation

:::::: TO: Joao Martins <joao.m.martins@oracle.com>
:::::: CC: Joao Martins <joao.m.martins@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
