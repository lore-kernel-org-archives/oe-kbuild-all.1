Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7BBA945
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 17:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676310211; x=1707846211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fkJuZQ25nXJCP/8RiESPkPS8bhlk+G5RAXVTCu4kSds=;
  b=byDzV9Rtkhy0Wzw4p9UU2Gr/psGaEnivEL5DVCx4lVn1U/89mrMF9tbq
   UkFjZ8cHO3sRU+3udy+dEmJzdcA1w04LMyzPGhxvPYUO63fFfVttlx0CS
   pitkN/yX9NPSkeq1gYJKT8Q9wc3KZmUwFnpYemSdsgUeRe+890K/LYoSD
   1KiAHFn1jaR0dPbFwtz2FgHw0yKEOvIwd5Y02MVYHpkzvy3pomd/q224K
   FnL10wLVQKBP0eP7dZnh+sj3tTX7ZKW3gmkiuW62iEi6v22cqkDGXZLPz
   QYgH61acxHfuvDt1WOzqW3hqdIKKRV6b49Wj585mzj6HvNUaJ2oms3TFq
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="358356546"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="358356546"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 09:43:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="732567361"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="732567361"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Feb 2023 09:43:29 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRcrR-0007v7-0r;
	Mon, 13 Feb 2023 17:43:29 +0000
Date: Tue, 14 Feb 2023 01:43:10 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:vfio_device_cdev_v3 16/19]
 drivers/vfio/vfio_main.c:252:48: error: 'struct vfio_device' has no member
 named 'cdev'; did you mean 'dev'?
Message-ID: <202302140101.lFRZRg5S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git vfio_device_cdev_v3
head:   98491da60ae1496187eb3585f5de36c843a237d1
commit: 241853c75dabceb7ecc9d96df30fff1c586c6b03 [16/19] vfio: Add cdev for vfio_device
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230214/202302140101.lFRZRg5S-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/yiliu1765/iommufd/commit/241853c75dabceb7ecc9d96df30fff1c586c6b03
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd vfio_device_cdev_v3
        git checkout 241853c75dabceb7ecc9d96df30fff1c586c6b03
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/vfio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302140101.lFRZRg5S-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/vfio/vfio_main.c: In function 'vfio_device_add':
>> drivers/vfio/vfio_main.c:252:48: error: 'struct vfio_device' has no member named 'cdev'; did you mean 'dev'?
     252 |                 ret = cdev_device_add(&device->cdev, &device->device);
         |                                                ^~~~
         |                                                dev
   drivers/vfio/vfio_main.c: In function 'vfio_device_del':
   drivers/vfio/vfio_main.c:261:42: error: 'struct vfio_device' has no member named 'cdev'; did you mean 'dev'?
     261 |                 cdev_device_del(&device->cdev, &device->device);
         |                                          ^~~~
         |                                          dev


vim +252 drivers/vfio/vfio_main.c

   246	
   247	static int vfio_device_add(struct vfio_device *device)
   248	{
   249		int ret;
   250	
   251		if (IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV))
 > 252			ret = cdev_device_add(&device->cdev, &device->device);
   253		else
   254			ret = device_add(&device->device);
   255		return ret;
   256	}
   257	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
