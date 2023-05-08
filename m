Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233C723A4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 May 2023 02:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683511289; x=1715047289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HL/4DPoG/s6t6CmYQYa2gSJHTwK1CCGnOU71yWvLCog=;
  b=L9/A0UtaSFEB0gtRLczBV+CaILdqM1aCVfXFbCtdnLQOS/bvDhg7pS1z
   fuQ4EcVcJ5vDfVhq0H0KDSA9w6UdebOMJQSi0TDceNViW/B9wrgTHt9GC
   m78mzHN1rUu4vHhFSeM9OFS8sN9uk24YX+xchuz45cAZrv7eUs8zGy3ae
   6wlHB4R8OuDIrmE/ROr3jgpU6hCODbsTqYmMND6TNYPciahgOQmV/cFvi
   5qHbc4A9sp+NfTiLQ/8v7neWQrIfc2hdiU9qTKhPbEVtiCuZUwBVfECl4
   mnV5nORopTbMaKecSNn5dUgGFsKDtZS0pVNnFSDBO1K4MWeE5QnJADv6I
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="412792244"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="412792244"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 19:01:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="842533024"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="842533024"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 May 2023 19:01:27 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvqBq-0000wv-2f;
	Mon, 08 May 2023 02:01:26 +0000
Date: Mon, 8 May 2023 10:01:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_all_defdom 32/46] drivers/iommu/iommu.c:291:6:
 warning: no previous prototype for 'iommu_device_unregister_bus'
Message-ID: <202305080942.RuCeGped-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_all_defdom
head:   0d32aaa7c58040c56a21127e0619a38a53a70da6
commit: 859d9dfcd9c5074b4148b9fb260f2f449e81ad65 [32/46] iommufd/selftest: Make the mock iommu driver into a real driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230508/202305080942.RuCeGped-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jgunthorpe/linux/commit/859d9dfcd9c5074b4148b9fb260f2f449e81ad65
        git remote add jgunthorpe https://github.com/jgunthorpe/linux
        git fetch --no-tags jgunthorpe iommu_all_defdom
        git checkout 859d9dfcd9c5074b4148b9fb260f2f449e81ad65
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/iommu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305080942.RuCeGped-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommu.c:291:6: warning: no previous prototype for 'iommu_device_unregister_bus' [-Wmissing-prototypes]
     291 | void iommu_device_unregister_bus(struct iommu_device *iommu,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/iommu.c:305:5: warning: no previous prototype for 'iommu_device_register_bus' [-Wmissing-prototypes]
     305 | int iommu_device_register_bus(struct iommu_device *iommu,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/iommu_device_unregister_bus +291 drivers/iommu/iommu.c

   289	
   290	#if IS_ENABLED(CONFIG_IOMMUFD_TEST)
 > 291	void iommu_device_unregister_bus(struct iommu_device *iommu,
   292					 struct bus_type *bus,
   293					 struct notifier_block *nb)
   294	{
   295		bus_unregister_notifier(bus, nb);
   296		iommu_device_unregister(iommu);
   297	}
   298	EXPORT_SYMBOL_NS_GPL(iommu_device_unregister_bus, IOMMUFD);
   299	
   300	/*
   301	 * Register an iommu driver against a single bus. This is only used by iommufd
   302	 * selftest to create a mock iommu driver. The caller must provide
   303	 * some memory to hold a notifier_block.
   304	 */
 > 305	int iommu_device_register_bus(struct iommu_device *iommu,
   306				      const struct iommu_ops *ops, struct bus_type *bus,
   307				      struct notifier_block *nb)
   308	{
   309		int err;
   310	
   311		iommu->ops = ops;
   312		nb->notifier_call = iommu_bus_notifier;
   313		err = bus_register_notifier(bus, nb);
   314		if (err)
   315			return err;
   316	
   317		spin_lock(&iommu_device_lock);
   318		list_add_tail(&iommu->list, &iommu_device_list);
   319		spin_unlock(&iommu_device_lock);
   320	
   321		bus->iommu_ops = ops;
   322		err = bus_iommu_probe(bus);
   323		if (err) {
   324			iommu_device_unregister_bus(iommu, bus, nb);
   325			return err;
   326		}
   327		return 0;
   328	}
   329	EXPORT_SYMBOL_NS_GPL(iommu_device_register_bus, IOMMUFD);
   330	#endif
   331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
