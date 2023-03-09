Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5FF29B2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 08:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678349959; x=1709885959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EvUHVVVeLaDZbNWE1L2aX/TtA+n6Q1INv3oUvhLyHNY=;
  b=D8/b/a6v4wfjtWCn9FY2WMTPqURMu4XCgeA039J15kXV5pXB7wcxBfX4
   Riep/xBnvAyH4oRH69caUPe/2FbPwkrcryaTaruYisfE+G/DmNP4JBGrJ
   SJiLtVsBINEKSD0BqpskraYoCTyEaRP63/a3tdq1C65FZ1xMEi6Cj0ceL
   zNDHvI+aJfO24RCM5HmT6RT+GPeOQO0ZfA9NG5b4jOiDaH6zkv4nuSmFN
   eL6kaUsm+b4z2MgGy2jxdr7N2Fmj8b3hfZR90MVcA7A1BV/wTiCl0HEQx
   uv0AO8/Bh/M620MIXdg1rTBN7XTFzt6gar44YuraXevOwgYxssdfconYZ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="324707090"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="324707090"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 00:19:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="627267788"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="627267788"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Mar 2023 00:19:15 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paBUZ-0002mP-0n;
	Thu, 09 Mar 2023 08:19:15 +0000
Date: Thu, 9 Mar 2023 16:18:19 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:iommufd_nesting 9/39]
 drivers/iommu/iommufd/hw_pagetable.c:100:6: warning: variable 'rc' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202303091646.RZphKLED-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git iommufd_nesting
head:   551f84400c686d776a22c80bf3d0de8c948c07c3
commit: 8b22006bfeef44946dce05dcef9223d76c922f06 [9/39] iommufd: Pass parent hwpt and user_data to iommufd_hw_pagetable_alloc()
config: arm64-randconfig-r023-20230308 (https://download.01.org/0day-ci/archive/20230309/202303091646.RZphKLED-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/yiliu1765/iommufd/commit/8b22006bfeef44946dce05dcef9223d76c922f06
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd iommufd_nesting
        git checkout 8b22006bfeef44946dce05dcef9223d76c922f06
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/iommu/iommufd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091646.RZphKLED-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/hw_pagetable.c:100:6: warning: variable 'rc' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if ((parent_domain && hwpt->domain->type != IOMMU_DOMAIN_NESTED) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/hw_pagetable.c:149:17: note: uninitialized use occurs here
           return ERR_PTR(rc);
                          ^~
   drivers/iommu/iommufd/hw_pagetable.c:100:2: note: remove the 'if' if its condition is always false
           if ((parent_domain && hwpt->domain->type != IOMMU_DOMAIN_NESTED) ||
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/iommufd/hw_pagetable.c:100:6: warning: variable 'rc' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
           if ((parent_domain && hwpt->domain->type != IOMMU_DOMAIN_NESTED) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/hw_pagetable.c:149:17: note: uninitialized use occurs here
           return ERR_PTR(rc);
                          ^~
   drivers/iommu/iommufd/hw_pagetable.c:100:6: note: remove the '||' if its condition is always false
           if ((parent_domain && hwpt->domain->type != IOMMU_DOMAIN_NESTED) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/hw_pagetable.c:68:8: note: initialize the variable 'rc' to silence this warning
           int rc;
                 ^
                  = 0
   2 warnings generated.


vim +100 drivers/iommu/iommufd/hw_pagetable.c

    45	
    46	/**
    47	 * iommufd_hw_pagetable_alloc() - Get an iommu_domain for a device
    48	 * @ictx: iommufd context
    49	 * @ioas: IOAS to associate the domain with
    50	 * @idev: Device to get an iommu_domain for
    51	 * @parent: Optional parent HWPT to associate with the domain with
    52	 * @user_data: Optional user_data pointer
    53	 * @immediate_attach: True if idev should be attached to the hwpt
    54	 *
    55	 * Allocate a new iommu_domain and return it as a hw_pagetable. The HWPT
    56	 * will be linked to the given ioas and upon return the underlying iommu_domain
    57	 * is fully popoulated.
    58	 */
    59	struct iommufd_hw_pagetable *
    60	iommufd_hw_pagetable_alloc(struct iommufd_ctx *ictx, struct iommufd_ioas *ioas,
    61				   struct iommufd_device *idev,
    62				   struct iommufd_hw_pagetable *parent,
    63				   void *user_data, bool immediate_attach)
    64	{
    65		const struct iommu_ops *ops = dev_iommu_ops(idev->dev);
    66		struct iommu_domain *parent_domain = NULL;
    67		struct iommufd_hw_pagetable *hwpt;
    68		int rc;
    69	
    70		lockdep_assert_held(&ioas->mutex);
    71	
    72		if (parent && !ops->domain_alloc_user)
    73			return ERR_PTR(-EOPNOTSUPP);
    74	
    75		hwpt = iommufd_object_alloc(ictx, hwpt, IOMMUFD_OBJ_HW_PAGETABLE);
    76		if (IS_ERR(hwpt))
    77			return hwpt;
    78	
    79		INIT_LIST_HEAD(&hwpt->hwpt_item);
    80		/* Pairs with iommufd_hw_pagetable_destroy() */
    81		refcount_inc(&ioas->obj.users);
    82		hwpt->ioas = ioas;
    83		if (parent) {
    84			hwpt->parent = parent;
    85			parent_domain = parent->domain;
    86			refcount_inc(&parent->obj.users);
    87		}
    88	
    89		if (ops->domain_alloc_user)
    90			hwpt->domain = ops->domain_alloc_user(idev->dev,
    91							      parent_domain, user_data);
    92		else
    93			hwpt->domain = iommu_domain_alloc(idev->dev->bus);
    94		if (!hwpt->domain) {
    95			rc = -ENOMEM;
    96			goto out_abort;
    97		}
    98	
    99		/* It must be either NESTED or UNMANAGED, depending on parent_domain */
 > 100		if ((parent_domain && hwpt->domain->type != IOMMU_DOMAIN_NESTED) ||
   101		   (!parent_domain && hwpt->domain->type != IOMMU_DOMAIN_UNMANAGED))
   102			goto out_abort;
   103	
   104		/*
   105		 * Set the coherency mode before we do iopt_table_add_domain() as some
   106		 * iommus have a per-PTE bit that controls it and need to decide before
   107		 * doing any maps. It is an iommu driver bug to report
   108		 * IOMMU_CAP_ENFORCE_CACHE_COHERENCY but fail enforce_cache_coherency on
   109		 * a new domain.
   110		 */
   111		if (idev->enforce_cache_coherency) {
   112			rc = iommufd_hw_pagetable_enforce_cc(hwpt);
   113			if (WARN_ON(rc))
   114				goto out_abort;
   115		}
   116	
   117		mutex_lock(&idev->igroup->lock);
   118	
   119		/*
   120		 * immediate_attach exists only to accommodate iommu drivers that cannot
   121		 * directly allocate a domain. These drivers do not finish creating the
   122		 * domain until attach is completed. Thus we must have this call
   123		 * sequence. Once those drivers are fixed this should be removed.
   124		 *
   125		 * Note we hold the igroup->lock here which prevents any other thread
   126		 * from observing igroup->hwpt until we finish setting it up.
   127		 */
   128		if (immediate_attach) {
   129			rc = iommufd_hw_pagetable_attach(hwpt, idev);
   130			if (rc)
   131				goto out_unlock;
   132		}
   133	
   134		rc = iopt_table_add_domain(&hwpt->ioas->iopt, hwpt->domain);
   135		if (rc)
   136			goto out_detach;
   137		list_add_tail(&hwpt->hwpt_item, &hwpt->ioas->hwpt_list);
   138	
   139		mutex_unlock(&idev->igroup->lock);
   140		return hwpt;
   141	
   142	out_detach:
   143		if (immediate_attach)
   144			iommufd_hw_pagetable_detach(idev);
   145	out_unlock:
   146		mutex_unlock(&idev->igroup->lock);
   147	out_abort:
   148		iommufd_object_abort_and_destroy(ictx, &hwpt->obj);
   149		return ERR_PTR(rc);
   150	}
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
