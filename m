Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AD83219C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 16:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvE69LOx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697731669; x=1729267669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=orWYF3fTk0TmitQc83076BfPxiEWvOO0fSFwGVffVV0=;
  b=lvE69LOxAMoNA0vnsMr6TJsVKQEcf61ftpqWzYIO3Vk6taXK1Sf2pQML
   TVqpn3T2bwsco1IbrlPkkv3wcqKl43mTmXiW/GJ0ZqWTqW5er5hr9baKm
   kuXX1QK0GVUKpZEP9TWZelF5AyAXeBINMc94TAKHpimHFcjGYqRw6VVFc
   T3SNWlCtjgwktKYHUWkLbCKBxWj9XCtAIsB7GFC/ZkJm/enaWJ5ZcN2mc
   HgHdk8lo/MJaHzkMMhdMjey9E904e8N2AgvvJSfArmvLPVmx7K0H243Ao
   zNM9O2T1B4ruo3N+n+1VhFvkHDT80W5uR1rMus6UKq2ZVQAghjtT/Q0kW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="417409828"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="417409828"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 09:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="786445758"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="786445758"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Oct 2023 09:05:15 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtVWK-0002Ef-2F;
	Thu, 19 Oct 2023 16:05:12 +0000
Date: Fri, 20 Oct 2023 00:04:41 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-10192023-yi 7/54]
 drivers/iommu/iommufd/hw_pagetable.c:197: warning: Function parameter or
 member 'flags' not described in 'iommufd_hwpt_nested_alloc'
Message-ID: <202310192338.qgZcyMew-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-10192023-yi
head:   e3455e3d7e9bdc5a6f2dcc73adad2b8a12b4d2da
commit: b88aa5fb8993fd4ab36fcb7cd56ac8975da26ee8 [7/54] iommufd: Add a nested HW pagetable object
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231019/202310192338.qgZcyMew-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310192338.qgZcyMew-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310192338.qgZcyMew-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/hw_pagetable.c:197: warning: Function parameter or member 'flags' not described in 'iommufd_hwpt_nested_alloc'


vim +197 drivers/iommu/iommufd/hw_pagetable.c

   180	
   181	/**
   182	 * iommufd_hwpt_nested_alloc() - Get a NESTED iommu_domain for a device
   183	 * @ictx: iommufd context
   184	 * @parent: Parent PAGING-type hwpt to associate the domain with
   185	 * @idev: Device to get an iommu_domain for
   186	 * @user_data: user_data pointer. Must be valid
   187	 *
   188	 * Allocate a new iommu_domain (must be IOMMU_DOMAIN_NESTED) and return it as
   189	 * a NESTED hw_pagetable. The given parent PAGING-type hwpt must be capable of
   190	 * being a parent.
   191	 */
   192	static struct iommufd_hwpt_nested *
   193	iommufd_hwpt_nested_alloc(struct iommufd_ctx *ictx,
   194				  struct iommufd_hwpt_paging *parent,
   195				  struct iommufd_device *idev, u32 flags,
   196				  const struct iommu_user_data *user_data)
 > 197	{
   198		const struct iommu_ops *ops = dev_iommu_ops(idev->dev);
   199		struct iommufd_hwpt_nested *hwpt_nested;
   200		struct iommufd_hw_pagetable *hwpt;
   201		int rc;
   202	
   203		if (flags != 0)
   204			return ERR_PTR(-EOPNOTSUPP);
   205		if (!user_data)
   206			return ERR_PTR(-EINVAL);
   207		if (user_data->type == IOMMU_HWPT_DATA_NONE)
   208			return ERR_PTR(-EINVAL);
   209		if (parent->auto_domain)
   210			return ERR_PTR(-EINVAL);
   211		if (!parent->nest_parent)
   212			return ERR_PTR(-EINVAL);
   213	
   214		if (!ops->domain_alloc_user)
   215			return ERR_PTR(-EOPNOTSUPP);
   216	
   217		hwpt_nested = __iommufd_object_alloc(ictx, hwpt_nested,
   218						     IOMMUFD_OBJ_HWPT_NESTED,
   219						     common.obj);
   220		if (IS_ERR(hwpt_nested))
   221			return ERR_CAST(hwpt_nested);
   222		hwpt = &hwpt_nested->common;
   223	
   224		refcount_inc(&parent->common.obj.users);
   225		hwpt_nested->parent = parent;
   226	
   227		hwpt->domain = ops->domain_alloc_user(idev->dev, 0,
   228						      parent->common.domain,
   229						      user_data);
   230		if (IS_ERR(hwpt->domain)) {
   231			rc = PTR_ERR(hwpt->domain);
   232			hwpt->domain = NULL;
   233			goto out_abort;
   234		}
   235	
   236		if (WARN_ON_ONCE(hwpt->domain->type != IOMMU_DOMAIN_NESTED)) {
   237			rc = -EINVAL;
   238			goto out_abort;
   239		}
   240		return hwpt_nested;
   241	
   242	out_abort:
   243		iommufd_object_abort_and_destroy(ictx, &hwpt->obj);
   244		return ERR_PTR(rc);
   245	}
   246	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
