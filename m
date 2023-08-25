Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5439C2FF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 11:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692963258; x=1724499258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M1+A9IAXPF8A2PTd76dF2v40ItPHxeGPvL2RhDGoZKE=;
  b=PuL7torAar8QkBhdSrylCzYsb5JDIaYGUyS1JFgzCGYLOJ6rUXYXydMF
   vE/Chgjm9boNkbkqNsdHOA3UZvfKEdsR1VMtRla+7w4wZpoCHEFKOR/6L
   iPW+8HR06nTnCWkAqP5uh/eBbEFQ4rSceOxvoZX3F4duXkd7pc1g47CbE
   cfWrVXDgJg7VH1iTslypHGYAA5HRpn9MULhDOjkQRkeSP/xAkuDXb06qJ
   F63Q8K9dOkZasOSprAVaRzrJ8I5JhThjLIFIl0xIaUV65MXxIp6HWQZCe
   SMijWyM/gHc56sERP9ucXVToOiwwzcr+7gz6k0D+H5Y8IRWRmsoSMo8VZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="441040957"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="441040957"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 04:34:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="827563914"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="827563914"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Aug 2023 04:34:16 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZV4x-0003WE-1m;
	Fri, 25 Aug 2023 11:34:15 +0000
Date: Fri, 25 Aug 2023 19:34:07 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-0825 13/95]
 drivers/iommu/iommufd/hw_pagetable.c:95: warning: Function parameter or
 member 'dummy' not described in 'iommufd_user_managed_hwpt_alloc'
Message-ID: <202308251920.6MLefAoJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-0825
head:   98c119bc01ddf99ad4ac7c3e93980e3d835c0901
commit: fad95a279b65f9a1c32511e1fd65d5866e6bf75a [13/95] iommufd: Add user-managed hw_pagetable support
config: i386-buildonly-randconfig-002-20230823 (https://download.01.org/0day-ci/archive/20230825/202308251920.6MLefAoJ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251920.6MLefAoJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308251920.6MLefAoJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/hw_pagetable.c:95: warning: Function parameter or member 'dummy' not described in 'iommufd_user_managed_hwpt_alloc'


vim +95 drivers/iommu/iommufd/hw_pagetable.c

    76	
    77	/**
    78	 * iommufd_user_managed_hwpt_alloc() - Get a user-managed hw_pagetable
    79	 * @ictx: iommufd context
    80	 * @pt_obj: Parent object to an HWPT to associate the domain with
    81	 * @idev: Device to get an iommu_domain for
    82	 * @hwpt_type: Requested type of hw_pagetable
    83	 * @user_data: user_data pointer
    84	 *
    85	 * Allocate a new iommu_domain (must be IOMMU_DOMAIN_NESTED) and return it as
    86	 * a user-managed hw_pagetable.
    87	 */
    88	static struct iommufd_hw_pagetable *
    89	iommufd_user_managed_hwpt_alloc(struct iommufd_ctx *ictx,
    90					struct iommufd_object *pt_obj,
    91					struct iommufd_device *idev,
    92					enum iommu_hwpt_type hwpt_type,
    93					struct iommu_user_data *user_data,
    94					bool dummy)
  > 95	{
    96		struct iommufd_hw_pagetable *parent =
    97			container_of(pt_obj, struct iommufd_hw_pagetable, obj);
    98		const struct iommu_ops *ops = dev_iommu_ops(idev->dev);
    99		struct iommufd_hw_pagetable *hwpt;
   100		int rc;
   101	
   102		if (!user_data)
   103			return ERR_PTR(-EINVAL);
   104		if (parent->auto_domain)
   105			return ERR_PTR(-EINVAL);
   106		if (hwpt_type == IOMMU_HWPT_TYPE_DEFAULT)
   107			return ERR_PTR(-EINVAL);
   108	
   109		if (!ops->domain_alloc_user)
   110			return ERR_PTR(-EOPNOTSUPP);
   111	
   112		lockdep_assert_held(&parent->mutex);
   113	
   114		hwpt = iommufd_object_alloc(ictx, hwpt, IOMMUFD_OBJ_HW_PAGETABLE);
   115		if (IS_ERR(hwpt))
   116			return hwpt;
   117	
   118		refcount_inc(&parent->obj.users);
   119		hwpt->parent = parent;
   120		hwpt->user_managed = true;
   121		hwpt->abort = iommufd_user_managed_hwpt_abort;
   122		hwpt->destroy = iommufd_user_managed_hwpt_destroy;
   123	
   124		hwpt->domain = ops->domain_alloc_user(idev->dev, hwpt_type,
   125						      parent->domain, user_data);
   126		if (IS_ERR(hwpt->domain)) {
   127			rc = PTR_ERR(hwpt->domain);
   128			hwpt->domain = NULL;
   129			goto out_abort;
   130		}
   131	
   132		if (WARN_ON_ONCE(hwpt->domain->type != IOMMU_DOMAIN_NESTED)) {
   133			rc = -EINVAL;
   134			goto out_abort;
   135		}
   136		/* Driver is buggy by missing cache_invalidate_user in domain_ops */
   137		if (WARN_ON_ONCE(!hwpt->domain->ops->cache_invalidate_user)) {
   138			rc = -EINVAL;
   139			goto out_abort;
   140		}
   141		return hwpt;
   142	
   143	out_abort:
   144		iommufd_object_abort_and_destroy(ictx, &hwpt->obj);
   145		return ERR_PTR(rc);
   146	}
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
