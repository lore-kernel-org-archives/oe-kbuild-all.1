Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CE262B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 01:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695518301; x=1727054301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i6LgKrpDDAjh8lq9/LI4HTdV2dQol2paF+wtTPgDCUs=;
  b=EBk+DnNhxGmgDZJVKliDgBzlnnRRk5VC/5o9tMMWo8bjcw1elzvi1pgE
   vbaoKtx5mwVVzRXSSfWpMcOZMo2Vnh+ne1jL5T3VLZpf4yb5JQATkLeE1
   k1/Y47vQ1y2w9XENEyi+7BDP2tKufU3wgoQXaG3VATtEdsx5vdbG0BUh0
   ZT8iFyrfuv8KCssTdt2NOHtLOxjY2LtbD7VPyfLDel0g0Uyo37gpjmQxT
   aRk5SUl07WHPTstIu22xOdg+iRICbvAjGIalxwKS0KSExgYTVgcQFwVbz
   1g3tc3VowLV0Y9g+kty8vWGZgaYG3+kFD/m7uFMSrn1/lAO4zCWGe1oL0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="411998596"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="411998596"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 18:18:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="813521580"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="813521580"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2023 18:18:17 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkDlH-00034N-2S;
	Sun, 24 Sep 2023 01:18:15 +0000
Date: Sun, 24 Sep 2023 09:18:12 +0800
From: kernel test robot <lkp@intel.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 6/7] iommu: Retire bus ops
Message-ID: <202309240920.GEdNuhRO-lkp@intel.com>
References: <c43f24d2fce3f4e02bc9056a30021ee45e19e35b.1694693889.git.robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c43f24d2fce3f4e02bc9056a30021ee45e19e35b.1694693889.git.robin.murphy@arm.com>

Hi Robin,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on linus/master v6.6-rc2 next-20230921]
[cannot apply to joro-iommu/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Robin-Murphy/iommu-Factor-out-some-helpers/20230916-010009
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/c43f24d2fce3f4e02bc9056a30021ee45e19e35b.1694693889.git.robin.murphy%40arm.com
patch subject: [PATCH v3 6/7] iommu: Retire bus ops
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230924/202309240920.GEdNuhRO-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240920.GEdNuhRO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309240920.GEdNuhRO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/iommu.c: In function 'iommu_device_register_bus':
>> drivers/iommu/iommu.c:318:12: error: 'struct bus_type' has no member named 'iommu_ops'
     318 |         bus->iommu_ops = ops;
         |            ^~


vim +318 drivers/iommu/iommu.c

23a1b46f15d575 Jason Gunthorpe 2023-08-02  296  
23a1b46f15d575 Jason Gunthorpe 2023-08-02  297  /*
23a1b46f15d575 Jason Gunthorpe 2023-08-02  298   * Register an iommu driver against a single bus. This is only used by iommufd
23a1b46f15d575 Jason Gunthorpe 2023-08-02  299   * selftest to create a mock iommu driver. The caller must provide
23a1b46f15d575 Jason Gunthorpe 2023-08-02  300   * some memory to hold a notifier_block.
23a1b46f15d575 Jason Gunthorpe 2023-08-02  301   */
23a1b46f15d575 Jason Gunthorpe 2023-08-02  302  int iommu_device_register_bus(struct iommu_device *iommu,
23a1b46f15d575 Jason Gunthorpe 2023-08-02  303  			      const struct iommu_ops *ops, struct bus_type *bus,
23a1b46f15d575 Jason Gunthorpe 2023-08-02  304  			      struct notifier_block *nb)
23a1b46f15d575 Jason Gunthorpe 2023-08-02  305  {
23a1b46f15d575 Jason Gunthorpe 2023-08-02  306  	int err;
23a1b46f15d575 Jason Gunthorpe 2023-08-02  307  
23a1b46f15d575 Jason Gunthorpe 2023-08-02  308  	iommu->ops = ops;
23a1b46f15d575 Jason Gunthorpe 2023-08-02  309  	nb->notifier_call = iommu_bus_notifier;
23a1b46f15d575 Jason Gunthorpe 2023-08-02  310  	err = bus_register_notifier(bus, nb);
23a1b46f15d575 Jason Gunthorpe 2023-08-02  311  	if (err)
23a1b46f15d575 Jason Gunthorpe 2023-08-02  312  		return err;
23a1b46f15d575 Jason Gunthorpe 2023-08-02  313  
23a1b46f15d575 Jason Gunthorpe 2023-08-02  314  	spin_lock(&iommu_device_lock);
23a1b46f15d575 Jason Gunthorpe 2023-08-02  315  	list_add_tail(&iommu->list, &iommu_device_list);
23a1b46f15d575 Jason Gunthorpe 2023-08-02  316  	spin_unlock(&iommu_device_lock);
23a1b46f15d575 Jason Gunthorpe 2023-08-02  317  
23a1b46f15d575 Jason Gunthorpe 2023-08-02 @318  	bus->iommu_ops = ops;
23a1b46f15d575 Jason Gunthorpe 2023-08-02  319  	err = bus_iommu_probe(bus);
23a1b46f15d575 Jason Gunthorpe 2023-08-02  320  	if (err) {
23a1b46f15d575 Jason Gunthorpe 2023-08-02  321  		iommu_device_unregister_bus(iommu, bus, nb);
23a1b46f15d575 Jason Gunthorpe 2023-08-02  322  		return err;
23a1b46f15d575 Jason Gunthorpe 2023-08-02  323  	}
23a1b46f15d575 Jason Gunthorpe 2023-08-02  324  	return 0;
23a1b46f15d575 Jason Gunthorpe 2023-08-02  325  }
23a1b46f15d575 Jason Gunthorpe 2023-08-02  326  EXPORT_SYMBOL_GPL(iommu_device_register_bus);
23a1b46f15d575 Jason Gunthorpe 2023-08-02  327  #endif
23a1b46f15d575 Jason Gunthorpe 2023-08-02  328  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
