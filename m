Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EEB625
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 04:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688444135; x=1719980135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZEOKIJuaR2nGf7/SElUvVYZ+AeSws71NmKJliL5de3Y=;
  b=FTIRQRZ1SvuT/QjxdFtQaa/IbYKPjlN/cKEwSDrtwJngEIp/8V6GZ5f0
   YdQsJNZ9uhphcXnfsPAmFlSr01MaHbJlhcnf3uzSljt6qu0XYdk2Wtl5o
   JiM8XtOI4K2eVfXDAGRh2fZK6Ktme4lqtScWNm3rSa2bArDEEKGTy3glp
   kOcBygeSEbXcqi0LugHVnFjeeCAFMY+Z6AAedFXFvCt2dB7M/lWlNrzrQ
   NSx8D8aN9kRPI2S3L+gPM19q4nfOLR2/BgHCzyZQZKI+RfYGFVD2P4nn0
   IlOR+kjQvuCW2/bxbKnguAKgzA7BmULGIb55wVAbdux8Wxb4ZCnj/b5Cq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="360505712"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="360505712"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 21:15:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="753933288"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="753933288"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Jul 2023 21:15:33 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGXRs-000Hs9-10;
	Tue, 04 Jul 2023 04:15:32 +0000
Date: Tue, 4 Jul 2023 12:14:56 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-07032023-yi 9/65]
 drivers/iommu/iommufd/hw_pagetable.c:130 iommufd_hw_pagetable_alloc() warn:
 inconsistent indenting
Message-ID: <202307041245.GFf0QwMd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-07032023-yi
head:   ac623a6f5d61ed4f4d90a3f835c668728b07ab95
commit: ec9e02ca63a655973a1f9b9a66f19e1065504df3 [9/65] iommufd: Pass in hwpt_type/parent/user_data to iommufd_hw_pagetable_alloc()
config: i386-randconfig-m021-20230703 (https://download.01.org/0day-ci/archive/20230704/202307041245.GFf0QwMd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041245.GFf0QwMd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307041245.GFf0QwMd-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/hw_pagetable.c:130 iommufd_hw_pagetable_alloc() warn: inconsistent indenting

vim +130 drivers/iommu/iommufd/hw_pagetable.c

    60	
    61	/**
    62	 * iommufd_hw_pagetable_alloc() - Get an iommu_domain for a device
    63	 * @ictx: iommufd context
    64	 * @ioas: IOAS to associate the domain with
    65	 * @idev: Device to get an iommu_domain for
    66	 * @hwpt_type: Requested type of hw_pagetable
    67	 * @parent: Optional parent HWPT to associate with
    68	 * @user_data: Optional user_data pointer
    69	 * @immediate_attach: True if idev should be attached to the hwpt
    70	 *
    71	 * Allocate a new iommu_domain and return it as a hw_pagetable. The HWPT
    72	 * will be linked to the given ioas and upon return the underlying iommu_domain
    73	 * is fully popoulated.
    74	 *
    75	 * The caller must hold the ioas->mutex until after
    76	 * iommufd_object_abort_and_destroy() or iommufd_object_finalize() is called on
    77	 * the returned hwpt.
    78	 */
    79	struct iommufd_hw_pagetable *
    80	iommufd_hw_pagetable_alloc(struct iommufd_ctx *ictx, struct iommufd_ioas *ioas,
    81				   struct iommufd_device *idev,
    82				   enum iommu_hwpt_type hwpt_type,
    83				   struct iommufd_hw_pagetable *parent,
    84				   union iommu_domain_user_data *user_data,
    85				   bool immediate_attach)
    86	{
    87		const struct iommu_ops *ops = dev_iommu_ops(idev->dev);
    88		struct iommu_domain *parent_domain = NULL;
    89		struct iommufd_hw_pagetable *hwpt;
    90		int rc;
    91	
    92		lockdep_assert_held(&ioas->mutex);
    93	
    94		if (parent && !user_data)
    95			return ERR_PTR(-EINVAL);
    96		if (user_data && !ops->domain_alloc_user)
    97			return ERR_PTR(-EOPNOTSUPP);
    98	
    99		hwpt = iommufd_object_alloc(ictx, hwpt, IOMMUFD_OBJ_HW_PAGETABLE);
   100		if (IS_ERR(hwpt))
   101			return hwpt;
   102	
   103		INIT_LIST_HEAD(&hwpt->hwpt_item);
   104		/* Pairs with iommufd_hw_pagetable_destroy() */
   105		refcount_inc(&ioas->obj.users);
   106		hwpt->ioas = ioas;
   107		if (parent) {
   108			hwpt->parent = parent;
   109			parent_domain = parent->domain;
   110			refcount_inc(&parent->obj.users);
   111		}
   112	
   113		if (ops->domain_alloc_user) {
   114			hwpt->domain = ops->domain_alloc_user(idev->dev, hwpt_type,
   115							      parent_domain, user_data);
   116			if (IS_ERR(hwpt->domain)) {
   117				rc = PTR_ERR(hwpt->domain);
   118				hwpt->domain = NULL;
   119				goto out_abort;
   120			}
   121		} else {
   122			hwpt->domain = iommu_domain_alloc(idev->dev->bus);
   123			if (!hwpt->domain) {
   124				rc = -ENOMEM;
   125				goto out_abort;
   126			}
   127		}
   128	
   129		/* It must be either NESTED or UNMANAGED, depending on parent_domain */
 > 130	       if (WARN_ON_ONCE((parent_domain &&
   131				 hwpt->domain->type != IOMMU_DOMAIN_NESTED) ||
   132				(!parent_domain &&
   133				 hwpt->domain->type != IOMMU_DOMAIN_UNMANAGED))) {
   134			rc = -EINVAL;
   135			goto out_abort;
   136		}
   137	
   138		/*
   139		 * Set the coherency mode before we do iopt_table_add_domain() as some
   140		 * iommus have a per-PTE bit that controls it and need to decide before
   141		 * doing any maps. It is an iommu driver bug to report
   142		 * IOMMU_CAP_ENFORCE_CACHE_COHERENCY but fail enforce_cache_coherency on
   143		 * a new domain.
   144		 */
   145		if (idev->enforce_cache_coherency) {
   146			rc = iommufd_hw_pagetable_enforce_cc(hwpt);
   147			if (WARN_ON(rc))
   148				goto out_abort;
   149		}
   150	
   151		/*
   152		 * immediate_attach exists only to accommodate iommu drivers that cannot
   153		 * directly allocate a domain. These drivers do not finish creating the
   154		 * domain until attach is completed. Thus we must have this call
   155		 * sequence. Once those drivers are fixed this should be removed.
   156		 */
   157		if (immediate_attach) {
   158			rc = iommufd_hw_pagetable_attach(hwpt, idev);
   159			if (rc)
   160				goto out_abort;
   161		}
   162	
   163		rc = iopt_table_add_domain(&hwpt->ioas->iopt, hwpt->domain);
   164		if (rc)
   165			goto out_detach;
   166		list_add_tail(&hwpt->hwpt_item, &hwpt->ioas->hwpt_list);
   167		return hwpt;
   168	
   169	out_detach:
   170		if (immediate_attach)
   171			iommufd_hw_pagetable_detach(idev);
   172	out_abort:
   173		iommufd_object_abort_and_destroy(ictx, &hwpt->obj);
   174		return ERR_PTR(rc);
   175	}
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
