Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC2824512
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 21:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691615630; x=1723151630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hj2wNvchfQm0HAX4bPtnX3RPREtf5YnHe3SvaD6L5QU=;
  b=SU24nB02AbPPYTuzrZlfKVy/bAv8rQP2Ktr0pJKPF4bJ45JbWvdW8Umh
   nveOqIxD7A8c1E3kO3MlHqxT16lt/ISzYN1/iXB89ik9H53oiIYO+fU7U
   53CbUdj02B+qCf+vOWT1/aTeZCMyr+ewBQm0K6IHvaCNtSuNZ0m5dGw9F
   l/WIIdEzYmmDxDEQAGZdew9eUGGOtbKb9MFfI8kkoeR1aecFBX2A/w65z
   FNmPWu8wmn65VJpLIjRUtGegzxYzmaopnGr/S1UH4u2jNUXwBp0TB/90S
   dBJDX9ZpTO+KnTrjBddpd8vj9/QhDjr3T+8OOnbiN451E85dgP7bJpbq1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="374014173"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="374014173"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 14:13:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="761535947"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="761535947"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Aug 2023 14:13:45 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTqUy-0006PM-2C;
	Wed, 09 Aug 2023 21:13:44 +0000
Date: Thu, 10 Aug 2023 05:13:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting_08092023-yi 50/63]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2764:45: warning: 'union
 iommu_set_dev_user_data' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202308100555.XjFKY2XX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting_08092023-yi
head:   deac4d727b4f1a29d87ddb50c141530c3f07003a
commit: 35f6e4c9f90f34f3fdbbbc012fde4ab018610cc9 [50/63] iommu/arm-smmu-v3: Add arm_smmu_set/unset_dev_user_data
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230810/202308100555.XjFKY2XX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100555.XjFKY2XX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100555.XjFKY2XX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2764:45: warning: 'union iommu_set_dev_user_data' declared inside parameter list will not be visible outside of this definition or declaration
    2764 |                                 const union iommu_set_dev_user_data *user_data)
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2932:35: error: initialization of 'int (*)(struct device *, const union iommu_set_dev_data_user_data *)' from incompatible pointer type 'int (*)(struct device *, const union iommu_set_dev_user_data *)' [-Werror=incompatible-pointer-types]
    2932 |         .set_dev_user_data      = arm_smmu_set_dev_user_data,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2932:35: note: (near initialization for 'arm_smmu_ops.set_dev_user_data')
   cc1: some warnings being treated as errors


vim +2764 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  2762	
  2763	static int arm_smmu_set_dev_user_data(struct device *dev,
> 2764					const union iommu_set_dev_user_data *user_data)
  2765	{
  2766		const struct iommu_dev_data_arm_smmuv3 *user =
  2767			(const struct iommu_dev_data_arm_smmuv3 *)user_data;
  2768		struct arm_smmu_master *master = dev_iommu_priv_get(dev);
  2769		struct arm_smmu_stream *stream = &master->streams[0];
  2770		struct arm_smmu_device *smmu = master->smmu;
  2771		u32 sid_user = user->sid;
  2772		int ret = 0;
  2773	
  2774		if (!sid_user)
  2775			return -EINVAL;
  2776	
  2777		ret = xa_alloc(&smmu->streams_user, &sid_user, stream,
  2778			       XA_LIMIT(sid_user, sid_user), GFP_KERNEL_ACCOUNT);
  2779		if (ret)
  2780			return ret;
  2781		stream->id_user = sid_user;
  2782		return 0;
  2783	}
  2784	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
