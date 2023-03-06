Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AC9566C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 17:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678124851; x=1709660851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bMJwo5mw539X5zrz04V/faNfgtkIYRXqupEdT1xydFw=;
  b=eaKNBXlc/92kFo6U9BsTK6J9dUvPjSlysopEfl92onpr2Abv0t1bUA9M
   orgeZKYA7OnEd5JqlsKVuqqZkJh8e4FvIHCF+LenQRlLVMgmqAnbtKiVR
   WwiKev9foyW2GJLz/iE76udCVelVGmt6wlAkta/z6jq0GbLJD0qBCOqe+
   5kwQxl65zoZs58S2ZkogqDais+lnQNJuXcQE/KxOPQjZ0nL1joRymFG8+
   H5q7VkZDkg3N4Bajt4h5UB5CEpbVP4QqF4b4BiGGeJKSoAbOqyq9NgyiF
   cZKQvimAhghvB42uUFCWMC5KxW0fRH4Zha5JVaSgbhAcEcNYniLae+Svp
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="335646834"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="335646834"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 09:47:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="653686345"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="653686345"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Mar 2023 09:47:29 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZEvo-0000VX-1L;
	Mon, 06 Mar 2023 17:47:28 +0000
Date: Tue, 7 Mar 2023 01:46:41 +0800
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:iommu-sysfs-default-domain-extension-v3 6/15]
 drivers/iommu/iommufd/selftest.c:276:46: error: 'struct bus_type' has no
 member named 'iommu_ops'
Message-ID: <202303070135.2lAxoM9X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/LuBaolu/intel-iommu.git iommu-sysfs-default-domain-extension-v3
head:   1bd1cf7c3afc447badfd2ea4398c91cb780213ba
commit: 1aa925a3ed2bbfdd2e6c1362fa4f6c082c3b6f36 [6/15] iommu: Retire bus ops
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230307/202303070135.2lAxoM9X-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/LuBaolu/intel-iommu/commit/1aa925a3ed2bbfdd2e6c1362fa4f6c082c3b6f36
        git remote add lubaolu-intel-iommu https://github.com/LuBaolu/intel-iommu.git
        git fetch --no-tags lubaolu-intel-iommu iommu-sysfs-default-domain-extension-v3
        git checkout 1aa925a3ed2bbfdd2e6c1362fa4f6c082c3b6f36
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/iommu/iommufd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070135.2lAxoM9X-lkp@intel.com/

Note: the lubaolu-intel-iommu/iommu-sysfs-default-domain-extension-v3 HEAD 1bd1cf7c3afc447badfd2ea4398c91cb780213ba builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/iommu/iommufd/selftest.c: In function 'iommufd_test_mock_domain':
>> drivers/iommu/iommufd/selftest.c:276:46: error: 'struct bus_type' has no member named 'iommu_ops'
     276 |         static struct bus_type mock_bus = { .iommu_ops = &mock_ops };
         |                                              ^~~~~~~~~
>> drivers/iommu/iommufd/selftest.c:276:58: error: initialization of 'const char *' from incompatible pointer type 'const struct iommu_ops *' [-Werror=incompatible-pointer-types]
     276 |         static struct bus_type mock_bus = { .iommu_ops = &mock_ops };
         |                                                          ^
   drivers/iommu/iommufd/selftest.c:276:58: note: (near initialization for 'mock_bus.name')
   cc1: some warnings being treated as errors


vim +276 drivers/iommu/iommufd/selftest.c

f4b20bb34c83dc Jason Gunthorpe 2022-11-29  271  
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  272  /* Create an hw_pagetable with the mock domain so we can test the domain ops */
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  273  static int iommufd_test_mock_domain(struct iommufd_ucmd *ucmd,
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  274  				    struct iommu_test_cmd *cmd)
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  275  {
f4b20bb34c83dc Jason Gunthorpe 2022-11-29 @276  	static struct bus_type mock_bus = { .iommu_ops = &mock_ops };
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  277  	struct iommufd_hw_pagetable *hwpt;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  278  	struct selftest_obj *sobj;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  279  	struct iommufd_ioas *ioas;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  280  	int rc;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  281  
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  282  	ioas = iommufd_get_ioas(ucmd, cmd->id);
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  283  	if (IS_ERR(ioas))
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  284  		return PTR_ERR(ioas);
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  285  
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  286  	sobj = iommufd_object_alloc(ucmd->ictx, sobj, IOMMUFD_OBJ_SELFTEST);
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  287  	if (IS_ERR(sobj)) {
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  288  		rc = PTR_ERR(sobj);
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  289  		goto out_ioas;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  290  	}
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  291  	sobj->idev.ictx = ucmd->ictx;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  292  	sobj->type = TYPE_IDEV;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  293  	sobj->idev.mock_dev.bus = &mock_bus;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  294  
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  295  	hwpt = iommufd_device_selftest_attach(ucmd->ictx, ioas,
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  296  					      &sobj->idev.mock_dev);
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  297  	if (IS_ERR(hwpt)) {
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  298  		rc = PTR_ERR(hwpt);
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  299  		goto out_sobj;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  300  	}
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  301  	sobj->idev.hwpt = hwpt;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  302  
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  303  	/* Userspace must destroy both of these IDs to destroy the object */
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  304  	cmd->mock_domain.out_hwpt_id = hwpt->obj.id;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  305  	cmd->mock_domain.out_device_id = sobj->obj.id;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  306  	iommufd_object_finalize(ucmd->ictx, &sobj->obj);
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  307  	iommufd_put_object(&ioas->obj);
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  308  	return iommufd_ucmd_respond(ucmd, sizeof(*cmd));
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  309  
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  310  out_sobj:
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  311  	iommufd_object_abort(ucmd->ictx, &sobj->obj);
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  312  out_ioas:
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  313  	iommufd_put_object(&ioas->obj);
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  314  	return rc;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  315  }
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  316  

:::::: The code at line 276 was first introduced by commit
:::::: f4b20bb34c83dceade5470288f48f94ce3598ada iommufd: Add kernel support for testing iommufd

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
