Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C316AA9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 14:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676643438; x=1708179438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IfjU6VoglcudU9MVoLBjcE11OltrkjDw/SkPpLTPsjs=;
  b=d8+DCnYwoo0vPDCkeOK+6+r2M3kr3ooBUyL+P2PCQMh6MzOo549duoXG
   mGw5m0AWg1bh784qKIXr8536LqXx6ANxSS4baJ+tHFpz4xMQ0e64mzP39
   X1THup/UptagKp15452Pfxv2PaAQi1AOr5p5ZJMIKhwUx0LrA9WYJf3rL
   l6a+TknBJHBJ0Zwl9WX+oaPAMAx6GQf0Oe21tvghkBIPyEt1IOtml3YQq
   oQN5pG1wO7jz73fqOF1Iv2bJ8PXCyPJc9lt598lQiY6nRPSMsAbkxgWN0
   VxvXiq4RRnVB0Y46X7OdxOrkxZD5ZBcYR4fusLjTS31V8mISW8qJTL84C
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331996560"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="331996560"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 06:17:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="759381321"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="759381321"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Feb 2023 06:17:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT1Y3-000BX5-1h;
	Fri, 17 Feb 2023 14:17:15 +0000
Date: Fri, 17 Feb 2023 22:16:35 +0800
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:iommu-sysfs-default-domain-extension-v2 7/15]
 drivers/iommu/iommufd/selftest.c:276:46: error: 'struct bus_type' has no
 member named 'iommu_ops'
Message-ID: <202302172248.wQ4cQtbV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/LuBaolu/intel-iommu.git iommu-sysfs-default-domain-extension-v2
head:   3e96bb06aac226fad4b65d267b4f491192ee4de8
commit: 8558d27a0efa753b27fdcfaf69ff348575fd4c98 [7/15] iommu: Retire bus ops
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230217/202302172248.wQ4cQtbV-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/LuBaolu/intel-iommu/commit/8558d27a0efa753b27fdcfaf69ff348575fd4c98
        git remote add lubaolu-intel-iommu https://github.com/LuBaolu/intel-iommu.git
        git fetch --no-tags lubaolu-intel-iommu iommu-sysfs-default-domain-extension-v2
        git checkout 8558d27a0efa753b27fdcfaf69ff348575fd4c98
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/iommu/iommufd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302172248.wQ4cQtbV-lkp@intel.com/

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
