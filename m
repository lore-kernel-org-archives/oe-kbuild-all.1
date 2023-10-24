Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D60433D0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 20:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxrG6cIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698178885; x=1729714885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RgqrL9rnJlmDcOvQrgeSRoeOn2zQhngZe51GsES4C4I=;
  b=JxrG6cIp3wOWcomJu1IwWoZ10obpAas9D2AmL+0Z/MFev7zC+uY150Tx
   v/PTqIUUyY7YyiB/uXQJUtvudWmTMOznXpPDTGdh3Eb3+7H+D4VppXXCD
   2Id/GA5q1K3Qru1dhoZw8qgUlaBbzAR5x8myVz1r3vTiPfHirc6rwUl5/
   Ir9vItvFRTUXtUvcTcMoVVg+cwacolBnWQcvwocb/RKdQDIbdu8c6N2Ej
   17jsEYtTWeFYs7yjp8usKTBqyrxX4iskavKG9bilEtW/qgTVLi0/WFoPA
   f3MCMDFu8xGGaW3cSNde9xAxZDaWJV4wnFuzZCuX0X3JEp6tG4umVQ3V2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="377533662"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="377533662"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 13:21:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="735139683"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="735139683"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Oct 2023 13:21:23 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvNtw-0008FA-2Y;
	Tue, 24 Oct 2023 20:21:20 +0000
Date: Wed, 25 Oct 2023 04:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>
Subject: [jgg-iommufd:for-next 36/39]
 drivers/iommu/iommufd/hw_pagetable.c:101: warning: Function parameter or
 member 'user_data' not described in 'iommufd_hwpt_paging_alloc'
Message-ID: <202310250418.NmeDHFgw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jgg/iommufd.git for-next
head:   b893aa6771e1107645f943c1a4d88e931810e025
commit: a6f4f0247d4e7b2dd559554175389f5357901abe [36/39] iommufd: Add a nested HW pagetable object
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231025/202310250418.NmeDHFgw-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310250418.NmeDHFgw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310250418.NmeDHFgw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/hw_pagetable.c:101: warning: Function parameter or member 'user_data' not described in 'iommufd_hwpt_paging_alloc'


vim +101 drivers/iommu/iommufd/hw_pagetable.c

17bad52708b457 Jason Gunthorpe 2023-07-17   79  
ea4acfac57b9de Jason Gunthorpe 2022-11-29   80  /**
3bc7f01ff2de6b Nicolin Chen    2023-10-24   81   * iommufd_hwpt_paging_alloc() - Get a PAGING iommu_domain for a device
ea4acfac57b9de Jason Gunthorpe 2022-11-29   82   * @ictx: iommufd context
ea4acfac57b9de Jason Gunthorpe 2022-11-29   83   * @ioas: IOAS to associate the domain with
339fbf3ae14426 Jason Gunthorpe 2023-03-01   84   * @idev: Device to get an iommu_domain for
89d63875d80ea1 Yi Liu          2023-09-28   85   * @flags: Flags from userspace
339fbf3ae14426 Jason Gunthorpe 2023-03-01   86   * @immediate_attach: True if idev should be attached to the hwpt
ea4acfac57b9de Jason Gunthorpe 2022-11-29   87   *
339fbf3ae14426 Jason Gunthorpe 2023-03-01   88   * Allocate a new iommu_domain and return it as a hw_pagetable. The HWPT
339fbf3ae14426 Jason Gunthorpe 2023-03-01   89   * will be linked to the given ioas and upon return the underlying iommu_domain
339fbf3ae14426 Jason Gunthorpe 2023-03-01   90   * is fully popoulated.
70eadc7fc7ef29 Jason Gunthorpe 2023-07-17   91   *
70eadc7fc7ef29 Jason Gunthorpe 2023-07-17   92   * The caller must hold the ioas->mutex until after
70eadc7fc7ef29 Jason Gunthorpe 2023-07-17   93   * iommufd_object_abort_and_destroy() or iommufd_object_finalize() is called on
70eadc7fc7ef29 Jason Gunthorpe 2023-07-17   94   * the returned hwpt.
ea4acfac57b9de Jason Gunthorpe 2022-11-29   95   */
3bc7f01ff2de6b Nicolin Chen    2023-10-24   96  struct iommufd_hwpt_paging *
3bc7f01ff2de6b Nicolin Chen    2023-10-24   97  iommufd_hwpt_paging_alloc(struct iommufd_ctx *ictx, struct iommufd_ioas *ioas,
89d63875d80ea1 Yi Liu          2023-09-28   98  			  struct iommufd_device *idev, u32 flags,
a6f4f0247d4e7b Nicolin Chen    2023-10-24   99  			  bool immediate_attach,
a6f4f0247d4e7b Nicolin Chen    2023-10-24  100  			  const struct iommu_user_data *user_data)
ea4acfac57b9de Jason Gunthorpe 2022-11-29 @101  {
25e47d7949d471 Nicolin Chen    2023-10-24  102  	const u32 valid_flags = IOMMU_HWPT_ALLOC_NEST_PARENT |
25e47d7949d471 Nicolin Chen    2023-10-24  103  				IOMMU_HWPT_ALLOC_DIRTY_TRACKING;
7975b722087fa2 Yi Liu          2023-09-28  104  	const struct iommu_ops *ops = dev_iommu_ops(idev->dev);
3bc7f01ff2de6b Nicolin Chen    2023-10-24  105  	struct iommufd_hwpt_paging *hwpt_paging;
ea4acfac57b9de Jason Gunthorpe 2022-11-29  106  	struct iommufd_hw_pagetable *hwpt;
ea4acfac57b9de Jason Gunthorpe 2022-11-29  107  	int rc;
ea4acfac57b9de Jason Gunthorpe 2022-11-29  108  
339fbf3ae14426 Jason Gunthorpe 2023-03-01  109  	lockdep_assert_held(&ioas->mutex);
339fbf3ae14426 Jason Gunthorpe 2023-03-01  110  
a6f4f0247d4e7b Nicolin Chen    2023-10-24  111  	if ((flags || user_data) && !ops->domain_alloc_user)
4ff54216339707 Yi Liu          2023-09-28  112  		return ERR_PTR(-EOPNOTSUPP);
25e47d7949d471 Nicolin Chen    2023-10-24  113  	if (flags & ~valid_flags)
25e47d7949d471 Nicolin Chen    2023-10-24  114  		return ERR_PTR(-EOPNOTSUPP);
4ff54216339707 Yi Liu          2023-09-28  115  
3bc7f01ff2de6b Nicolin Chen    2023-10-24  116  	hwpt_paging = __iommufd_object_alloc(
3bc7f01ff2de6b Nicolin Chen    2023-10-24  117  		ictx, hwpt_paging, IOMMUFD_OBJ_HWPT_PAGING, common.obj);
3bc7f01ff2de6b Nicolin Chen    2023-10-24  118  	if (IS_ERR(hwpt_paging))
3bc7f01ff2de6b Nicolin Chen    2023-10-24  119  		return ERR_CAST(hwpt_paging);
3bc7f01ff2de6b Nicolin Chen    2023-10-24  120  	hwpt = &hwpt_paging->common;
ea4acfac57b9de Jason Gunthorpe 2022-11-29  121  
3bc7f01ff2de6b Nicolin Chen    2023-10-24  122  	INIT_LIST_HEAD(&hwpt_paging->hwpt_item);
ea4acfac57b9de Jason Gunthorpe 2022-11-29  123  	/* Pairs with iommufd_hw_pagetable_destroy() */
ea4acfac57b9de Jason Gunthorpe 2022-11-29  124  	refcount_inc(&ioas->obj.users);
3bc7f01ff2de6b Nicolin Chen    2023-10-24  125  	hwpt_paging->ioas = ioas;
a6f4f0247d4e7b Nicolin Chen    2023-10-24  126  	hwpt_paging->nest_parent = flags & IOMMU_HWPT_ALLOC_NEST_PARENT;
25cde97d953208 Jason Gunthorpe 2023-03-01  127  
7975b722087fa2 Yi Liu          2023-09-28  128  	if (ops->domain_alloc_user) {
a6f4f0247d4e7b Nicolin Chen    2023-10-24  129  		hwpt->domain = ops->domain_alloc_user(idev->dev, flags, NULL,
a6f4f0247d4e7b Nicolin Chen    2023-10-24  130  						      user_data);
7975b722087fa2 Yi Liu          2023-09-28  131  		if (IS_ERR(hwpt->domain)) {
7975b722087fa2 Yi Liu          2023-09-28  132  			rc = PTR_ERR(hwpt->domain);
7975b722087fa2 Yi Liu          2023-09-28  133  			hwpt->domain = NULL;
7975b722087fa2 Yi Liu          2023-09-28  134  			goto out_abort;
7975b722087fa2 Yi Liu          2023-09-28  135  		}
7975b722087fa2 Yi Liu          2023-09-28  136  	} else {
339fbf3ae14426 Jason Gunthorpe 2023-03-01  137  		hwpt->domain = iommu_domain_alloc(idev->dev->bus);
25cde97d953208 Jason Gunthorpe 2023-03-01  138  		if (!hwpt->domain) {
25cde97d953208 Jason Gunthorpe 2023-03-01  139  			rc = -ENOMEM;
25cde97d953208 Jason Gunthorpe 2023-03-01  140  			goto out_abort;
25cde97d953208 Jason Gunthorpe 2023-03-01  141  		}
7975b722087fa2 Yi Liu          2023-09-28  142  	}
25cde97d953208 Jason Gunthorpe 2023-03-01  143  
17bad52708b457 Jason Gunthorpe 2023-07-17  144  	/*
17bad52708b457 Jason Gunthorpe 2023-07-17  145  	 * Set the coherency mode before we do iopt_table_add_domain() as some
17bad52708b457 Jason Gunthorpe 2023-07-17  146  	 * iommus have a per-PTE bit that controls it and need to decide before
17bad52708b457 Jason Gunthorpe 2023-07-17  147  	 * doing any maps. It is an iommu driver bug to report
17bad52708b457 Jason Gunthorpe 2023-07-17  148  	 * IOMMU_CAP_ENFORCE_CACHE_COHERENCY but fail enforce_cache_coherency on
17bad52708b457 Jason Gunthorpe 2023-07-17  149  	 * a new domain.
2ccabf81ddff81 Nicolin Chen    2023-10-23  150  	 *
2ccabf81ddff81 Nicolin Chen    2023-10-23  151  	 * The cache coherency mode must be configured here and unchanged later.
2ccabf81ddff81 Nicolin Chen    2023-10-23  152  	 * Note that a HWPT (non-CC) created for a device (non-CC) can be later
2ccabf81ddff81 Nicolin Chen    2023-10-23  153  	 * reused by another device (either non-CC or CC). However, A HWPT (CC)
2ccabf81ddff81 Nicolin Chen    2023-10-23  154  	 * created for a device (CC) cannot be reused by another device (non-CC)
2ccabf81ddff81 Nicolin Chen    2023-10-23  155  	 * but only devices (CC). Instead user space in this case would need to
2ccabf81ddff81 Nicolin Chen    2023-10-23  156  	 * allocate a separate HWPT (non-CC).
17bad52708b457 Jason Gunthorpe 2023-07-17  157  	 */
17bad52708b457 Jason Gunthorpe 2023-07-17  158  	if (idev->enforce_cache_coherency) {
3bc7f01ff2de6b Nicolin Chen    2023-10-24  159  		rc = iommufd_hwpt_paging_enforce_cc(hwpt_paging);
17bad52708b457 Jason Gunthorpe 2023-07-17  160  		if (WARN_ON(rc))
17bad52708b457 Jason Gunthorpe 2023-07-17  161  			goto out_abort;
17bad52708b457 Jason Gunthorpe 2023-07-17  162  	}
17bad52708b457 Jason Gunthorpe 2023-07-17  163  
339fbf3ae14426 Jason Gunthorpe 2023-03-01  164  	/*
339fbf3ae14426 Jason Gunthorpe 2023-03-01  165  	 * immediate_attach exists only to accommodate iommu drivers that cannot
339fbf3ae14426 Jason Gunthorpe 2023-03-01  166  	 * directly allocate a domain. These drivers do not finish creating the
339fbf3ae14426 Jason Gunthorpe 2023-03-01  167  	 * domain until attach is completed. Thus we must have this call
339fbf3ae14426 Jason Gunthorpe 2023-03-01  168  	 * sequence. Once those drivers are fixed this should be removed.
339fbf3ae14426 Jason Gunthorpe 2023-03-01  169  	 */
339fbf3ae14426 Jason Gunthorpe 2023-03-01  170  	if (immediate_attach) {
339fbf3ae14426 Jason Gunthorpe 2023-03-01  171  		rc = iommufd_hw_pagetable_attach(hwpt, idev);
339fbf3ae14426 Jason Gunthorpe 2023-03-01  172  		if (rc)
91a2e17e243f70 Jason Gunthorpe 2023-07-17  173  			goto out_abort;
339fbf3ae14426 Jason Gunthorpe 2023-03-01  174  	}
339fbf3ae14426 Jason Gunthorpe 2023-03-01  175  
3bc7f01ff2de6b Nicolin Chen    2023-10-24  176  	rc = iopt_table_add_domain(&ioas->iopt, hwpt->domain);
339fbf3ae14426 Jason Gunthorpe 2023-03-01  177  	if (rc)
339fbf3ae14426 Jason Gunthorpe 2023-03-01  178  		goto out_detach;
3bc7f01ff2de6b Nicolin Chen    2023-10-24  179  	list_add_tail(&hwpt_paging->hwpt_item, &ioas->hwpt_list);
3bc7f01ff2de6b Nicolin Chen    2023-10-24  180  	return hwpt_paging;
ea4acfac57b9de Jason Gunthorpe 2022-11-29  181  
339fbf3ae14426 Jason Gunthorpe 2023-03-01  182  out_detach:
339fbf3ae14426 Jason Gunthorpe 2023-03-01  183  	if (immediate_attach)
91a2e17e243f70 Jason Gunthorpe 2023-07-17  184  		iommufd_hw_pagetable_detach(idev);
ea4acfac57b9de Jason Gunthorpe 2022-11-29  185  out_abort:
25cde97d953208 Jason Gunthorpe 2023-03-01  186  	iommufd_object_abort_and_destroy(ictx, &hwpt->obj);
ea4acfac57b9de Jason Gunthorpe 2022-11-29  187  	return ERR_PTR(rc);
ea4acfac57b9de Jason Gunthorpe 2022-11-29  188  }
7074d7bd67d495 Jason Gunthorpe 2023-07-17  189  

:::::: The code at line 101 was first introduced by commit
:::::: ea4acfac57b9dee57a7d5840359a41cc3251de92 iommufd: Add a HW pagetable object

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
