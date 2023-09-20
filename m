Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6169823CF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 22:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695249524; x=1726785524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DDfObYajov6TDML3jWIrPnuZ1mOJuN+EqgpphWNYXM4=;
  b=LWx2y05E+BWgrLK7tVkFyZJ7GXiO9Z2hsIorjDajmBWLPvSZ3+vgJd//
   WFU2fybsYg3bU1hejsDRgBaB/KRJnJXI4e3q2F9Jv+3JNNWQnmiF87d3e
   mxASHL2NXVamQ+tJXdj03tLWcje02Lk7Bs29n9uz22TV9l49q+JyII13p
   WdGbAPscAQE0kOFgJFTdTUiZJGo3WAsdOBrykdae4Gpx4iJKVOx2c8o5v
   soCEukXhSPl4IDTR2vvtiW7flxeSd1JyYWiLrYCAs8nzBFY/qetbhkYl8
   GiTCKinzLMNbnx0xQ1KQFNI6QWamMUWFs5mFS3Kgqa9atFZ4P3rXCz3qM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="383102234"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="383102234"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 15:38:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="920467699"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="920467699"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Sep 2023 15:38:25 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj5pv-0009Ds-1R;
	Wed, 20 Sep 2023 22:38:23 +0000
Date: Thu, 21 Sep 2023 06:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-09202023-yi 24/30]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2928: warning: Function
 parameter or member 'flags' not described in '__arm_smmu_domain_alloc'
Message-ID: <202309210638.npWN8pYp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-09202023-yi
head:   5b4388d50a82e09067420dd07d85ee351e7defca
commit: d96d9373bbbd59e9aa8df8b7f25d8d9286f2ddac [24/30] iommu/arm-smmu-v3: Add arm_smmu_domain_alloc_user
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230921/202309210638.npWN8pYp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210638.npWN8pYp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309210638.npWN8pYp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2928: warning: Function parameter or member 'flags' not described in '__arm_smmu_domain_alloc'


vim +2928 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  2905	
  2906	/**
  2907	 * __arm_smmu_domain_alloc - Allocate a customizable iommu_domain
  2908	 * @type: Type of the new iommu_domain, in form of IOMMU_DOMAIN_*
  2909	 * @master: Optional master pointer for the allocation. If given, this will be
  2910	 *          used to call arm_smmu_domain_finalise at the end of the allocation.
  2911	 *          Otherwise, arm_smmu_domain_finalise will be done when the domain is
  2912	 *          attached to a device.
  2913	 * @user_cfg: Optional user configuration for the allocation. This allows the
  2914	 *            caller, mainly user space, to customize the iommu_domain in the
  2915	 *            arm_smmu_domain_finalise function that decodes the user_cfg data.
  2916	 *
  2917	 * This helper function is shared by domain_alloc_user() and domain_alloc().
  2918	 * Unlike ops->domain_alloc has been so far only called by the iommu core that
  2919	 * sets default values of domain->type, domain->ops and domain->pgsize_bitmap,
  2920	 * the ops->domain_alloc_user could be directly called by the iommufd core. So,
  2921	 * this function should set those default values for an ops->domain_alloc_user
  2922	 * call. Note that domain->pgsize_bitmap is set in arm_smmu_domain_finalise().
  2923	 */
  2924	static struct iommu_domain *
  2925	__arm_smmu_domain_alloc(unsigned type,
  2926				struct arm_smmu_master *master, u32 flags,
  2927				const struct iommu_hwpt_arm_smmuv3 *user_cfg)
> 2928	{
  2929		bool flag_s2 = flags & IOMMU_HWPT_ALLOC_NEST_PARENT;
  2930		struct arm_smmu_domain *smmu_domain;
  2931		struct iommu_domain *domain;
  2932		int ret = 0;
  2933	
  2934		if (type == IOMMU_DOMAIN_SVA)
  2935			return arm_smmu_sva_domain_alloc();
  2936	
  2937		if (type != IOMMU_DOMAIN_UNMANAGED &&
  2938		    type != IOMMU_DOMAIN_DMA &&
  2939		    type != IOMMU_DOMAIN_IDENTITY)
  2940			return NULL;
  2941	
  2942		/*
  2943		 * Allocate the domain and initialise some of its data structures.
  2944		 * We can't really finalise the domain unless a master is given.
  2945		 */
  2946		smmu_domain = kzalloc(sizeof(*smmu_domain), GFP_KERNEL);
  2947		if (!smmu_domain)
  2948			return NULL;
  2949		domain = &smmu_domain->domain;
  2950	
  2951		domain->type = type;
  2952		domain->ops = arm_smmu_ops.default_domain_ops;
  2953	
  2954		mutex_init(&smmu_domain->init_mutex);
  2955		INIT_LIST_HEAD(&smmu_domain->devices);
  2956		spin_lock_init(&smmu_domain->devices_lock);
  2957		INIT_LIST_HEAD(&smmu_domain->mmu_notifiers);
  2958	
  2959		if (master) {
  2960			smmu_domain->smmu = master->smmu;
  2961			ret = arm_smmu_domain_finalise(domain, master, flag_s2, user_cfg);
  2962			if (ret) {
  2963				kfree(smmu_domain);
  2964				return NULL;
  2965			}
  2966		}
  2967	
  2968		return domain;
  2969	}
  2970	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
