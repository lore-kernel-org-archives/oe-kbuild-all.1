Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173B320180
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 19:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692733656; x=1724269656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h63LyRFRb/e7txiZ9nTahuFsm9z87F7oMqyKVOIkPNk=;
  b=OB7KTmxZ0DINnt7rmML0iXFQo2dnN7wcDmWzfZHXR0hc6xap1mKea1f8
   7DLXqdQqKCqOlLceMlseLwkaQrA6qAYvAWyFZMdFaV/mji0AKbSwNOuRr
   2Ns22DtEo6pfeDTeOQG9qfObxl8UFiytETm6Ftzp+okveM3q5AbTM+4fT
   Ru5Jw2adMxYYCItJ7A6Qb+L+Oow/RZ7miTrvl4a+GAwjbCLortH8bshS7
   dbYuhcN92NSleJpG7JrphnyKO2lMiWabpsN5thVJb3+5cqJ1hYtfKa32m
   wSqlX1ooudY8CzIiAgf/nsukoQSmra4OgWxZAitQ7oN92DEk5ON0XY9NF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="440346209"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="440346209"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 12:45:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="880090878"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2023 12:45:54 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYXK1-0000US-05;
	Tue, 22 Aug 2023 19:45:49 +0000
Date: Wed, 23 Aug 2023 03:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-0822 13/86]
 drivers/iommu/iommufd/hw_pagetable.c:95: warning: Function parameter or
 member 'dummy' not described in 'iommufd_user_managed_hwpt_alloc'
Message-ID: <202308230341.KFi59OKE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-0822
head:   426d61ce13f336809ba8d8720761c165b1de60fc
commit: fad95a279b65f9a1c32511e1fd65d5866e6bf75a [13/86] iommufd: Add user-managed hw_pagetable support
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230823/202308230341.KFi59OKE-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230341.KFi59OKE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230341.KFi59OKE-lkp@intel.com/

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
