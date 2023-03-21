Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969A610788
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 22:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679437799; x=1710973799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Z2GyrgF3nRmcUYx95B2CPsS1rqunGkqgZkjBGtHn08=;
  b=bQBxH8jRyqHQZVIBPdU67PNS/mDzwufHN0Ezio/lK4yHzhsf/f8JCS61
   UfxIkDsnOrj7T96vOVe/hraV0mz52oSl09tOvvsRE0h3rnis/YOjZOLDu
   s2WUGehz4hP6+FNDmoKb5OoXPY4DjCmJ8DmMoDTBzKqBI/CrHkVn9MKAm
   9sTkTkY0T1f4fJmoqD98ETlxkhvyMSRjhaD3aikXXDeG2xnc2yBY/0wWi
   509G8pXhnB8snAvbCLa37DKJZIijmkX8BsTouhpJoyEmOvjx5y7yyLq1o
   0xqlLSDnAQsGOC0sMT3j7JwNPS/TEgfnn01A9mQ/PqlKyP8J11VS/awnO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="403956830"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="403956830"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 15:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792282813"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="792282813"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2023 15:29:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pekUP-000CUN-1Z;
	Tue, 21 Mar 2023 22:29:57 +0000
Date: Wed, 22 Mar 2023 06:29:34 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:tls-netlink.v7 3/20] drivers/nvme/host/core.c:5419:
 undefined reference to `nvme_keyring_init'
Message-ID: <202303220626.9mNTjr39-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git tls-netlink.v7
head:   5c13b43fa2c503188a6d668b0dec6a22078329a2
commit: e9b1071a27a0122e041829e87e86852c8b80c04a [3/20] nvme-keyring: register '.nvme' keyring
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20230322/202303220626.9mNTjr39-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git/commit/?id=e9b1071a27a0122e041829e87e86852c8b80c04a
        git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git
        git fetch --no-tags hare-scsi-devel tls-netlink.v7
        git checkout e9b1071a27a0122e041829e87e86852c8b80c04a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220626.9mNTjr39-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `nvme_core_init':
>> drivers/nvme/host/core.c:5419: undefined reference to `nvme_keyring_init'
   ld: vmlinux.o: in function `nvme_core_exit':
>> drivers/nvme/host/core.c:5453: undefined reference to `nvme_keyring_exit'


vim +5419 drivers/nvme/host/core.c

  5367	
  5368	
  5369	static int __init nvme_core_init(void)
  5370	{
  5371		int result = -ENOMEM;
  5372	
  5373		_nvme_check_size();
  5374	
  5375		nvme_wq = alloc_workqueue("nvme-wq",
  5376				WQ_UNBOUND | WQ_MEM_RECLAIM | WQ_SYSFS, 0);
  5377		if (!nvme_wq)
  5378			goto out;
  5379	
  5380		nvme_reset_wq = alloc_workqueue("nvme-reset-wq",
  5381				WQ_UNBOUND | WQ_MEM_RECLAIM | WQ_SYSFS, 0);
  5382		if (!nvme_reset_wq)
  5383			goto destroy_wq;
  5384	
  5385		nvme_delete_wq = alloc_workqueue("nvme-delete-wq",
  5386				WQ_UNBOUND | WQ_MEM_RECLAIM | WQ_SYSFS, 0);
  5387		if (!nvme_delete_wq)
  5388			goto destroy_reset_wq;
  5389	
  5390		result = alloc_chrdev_region(&nvme_ctrl_base_chr_devt, 0,
  5391				NVME_MINORS, "nvme");
  5392		if (result < 0)
  5393			goto destroy_delete_wq;
  5394	
  5395		nvme_class = class_create(THIS_MODULE, "nvme");
  5396		if (IS_ERR(nvme_class)) {
  5397			result = PTR_ERR(nvme_class);
  5398			goto unregister_chrdev;
  5399		}
  5400		nvme_class->dev_uevent = nvme_class_uevent;
  5401	
  5402		nvme_subsys_class = class_create(THIS_MODULE, "nvme-subsystem");
  5403		if (IS_ERR(nvme_subsys_class)) {
  5404			result = PTR_ERR(nvme_subsys_class);
  5405			goto destroy_class;
  5406		}
  5407	
  5408		result = alloc_chrdev_region(&nvme_ns_chr_devt, 0, NVME_MINORS,
  5409					     "nvme-generic");
  5410		if (result < 0)
  5411			goto destroy_subsys_class;
  5412	
  5413		nvme_ns_chr_class = class_create(THIS_MODULE, "nvme-generic");
  5414		if (IS_ERR(nvme_ns_chr_class)) {
  5415			result = PTR_ERR(nvme_ns_chr_class);
  5416			goto unregister_generic_ns;
  5417		}
  5418	
> 5419		result = nvme_keyring_init();
  5420		if (result)
  5421			goto destroy_ns_chr;
  5422	
  5423		result = nvme_init_auth();
  5424		if (result)
  5425			goto keyring_exit;
  5426		return 0;
  5427	
  5428	keyring_exit:
  5429		nvme_keyring_exit();
  5430	destroy_ns_chr:
  5431		class_destroy(nvme_ns_chr_class);
  5432	unregister_generic_ns:
  5433		unregister_chrdev_region(nvme_ns_chr_devt, NVME_MINORS);
  5434	destroy_subsys_class:
  5435		class_destroy(nvme_subsys_class);
  5436	destroy_class:
  5437		class_destroy(nvme_class);
  5438	unregister_chrdev:
  5439		unregister_chrdev_region(nvme_ctrl_base_chr_devt, NVME_MINORS);
  5440	destroy_delete_wq:
  5441		destroy_workqueue(nvme_delete_wq);
  5442	destroy_reset_wq:
  5443		destroy_workqueue(nvme_reset_wq);
  5444	destroy_wq:
  5445		destroy_workqueue(nvme_wq);
  5446	out:
  5447		return result;
  5448	}
  5449	
  5450	static void __exit nvme_core_exit(void)
  5451	{
  5452		nvme_exit_auth();
> 5453		nvme_keyring_exit();
  5454		class_destroy(nvme_ns_chr_class);
  5455		class_destroy(nvme_subsys_class);
  5456		class_destroy(nvme_class);
  5457		unregister_chrdev_region(nvme_ns_chr_devt, NVME_MINORS);
  5458		unregister_chrdev_region(nvme_ctrl_base_chr_devt, NVME_MINORS);
  5459		destroy_workqueue(nvme_delete_wq);
  5460		destroy_workqueue(nvme_reset_wq);
  5461		destroy_workqueue(nvme_wq);
  5462		ida_destroy(&nvme_ns_chr_minor_ida);
  5463		ida_destroy(&nvme_instance_ida);
  5464	}
  5465	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
