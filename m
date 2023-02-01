Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65A7880A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 18:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675276017; x=1706812017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zXETBhTtOlp5hmvuWgSl5LEIV8q/8G71Ssfh3yZq1cc=;
  b=hWL+LIMOnGKcewQK9S3hpVqqKVmv7+ZmQsm9Jk5eL5jro8KPrxo7m9Hr
   zC5T9faEUPLohmy5HaxRH3xALuV4ReenCGwlsrvE8a21mNtE822WHu0EZ
   vgiY7iu3eyKY99jbZ0wGqXQvkh2ttAxaQVZWb6fjd6PxFKs567azBftHb
   7wAmdTCcF4Ss5BcjNbP8mdjKTCpLf6PxG98JiJ8M7qCbRxEmQb+0wqy2q
   2wSIUJjBgHePKhY0ggLr+JqoWvyRECG+qqfgrWC8n5zW50nNXpL57grMv
   oWjBrfFXAHeJkBSQilpUOtdZPumCJokBxHLZyYWLreJO0dKT0cWNvuaVx
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="390624360"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="390624360"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 10:24:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="807664449"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="807664449"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Feb 2023 10:24:48 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNHmk-0005gU-1H;
	Wed, 01 Feb 2023 18:24:42 +0000
Date: Thu, 2 Feb 2023 02:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] drm/pancsf: Add a new driver for Mali CSF-based GPUs
Message-ID: <202302020210.bkPwVPew-lkp@intel.com>
References: <20230201084832.1708866-1-boris.brezillon@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201084832.1708866-1-boris.brezillon@collabora.com>

Hi Boris,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.2-rc6 next-20230201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Boris-Brezillon/drm-pancsf-Add-a-new-driver-for-Mali-CSF-based-GPUs/20230201-172815
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230201084832.1708866-1-boris.brezillon%40collabora.com
patch subject: [RFC PATCH] drm/pancsf: Add a new driver for Mali CSF-based GPUs
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230202/202302020210.bkPwVPew-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/794ce1c0209242bf1496fc4195ca707d45b37e73
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Boris-Brezillon/drm-pancsf-Add-a-new-driver-for-Mali-CSF-based-GPUs/20230201-172815
        git checkout 794ce1c0209242bf1496fc4195ca707d45b37e73
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/gpu/drm/pancsf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/pancsf/pancsf_drv.c:65:5: warning: no previous prototype for 'pancsf_ioctl_vm_create' [-Wmissing-prototypes]
      65 | int pancsf_ioctl_vm_create(struct drm_device *ddev, void *data,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/pancsf/pancsf_drv.c:84:5: warning: no previous prototype for 'pancsf_ioctl_vm_destroy' [-Wmissing-prototypes]
      84 | int pancsf_ioctl_vm_destroy(struct drm_device *ddev, void *data,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/pancsf/pancsf_drv.c:258:1: warning: no previous prototype for 'pancsf_free_sync_signal_array' [-Wmissing-prototypes]
     258 | pancsf_free_sync_signal_array(struct pancsf_sync_signal_array *array)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/pancsf/pancsf_drv.c:273:1: warning: no previous prototype for 'pancsf_collect_sync_signal_array' [-Wmissing-prototypes]
     273 | pancsf_collect_sync_signal_array(struct drm_file *file,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/pancsf/pancsf_drv.c: In function 'pancsf_collect_sync_signal_array':
   drivers/gpu/drm/pancsf/pancsf_drv.c:290:21: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     290 |                 int ret;
         |                     ^~~
   drivers/gpu/drm/pancsf/pancsf_drv.c: In function 'pancsf_mmap_io':
>> drivers/gpu/drm/pancsf/pancsf_drv.c:628:9: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446462598732840960' to '0' [-Woverflow]
     628 |         case DRM_PANCSF_USER_FLUSH_ID_MMIO_OFFSET:
         |         ^~~~


vim +628 drivers/gpu/drm/pancsf/pancsf_drv.c

   618	
   619	static int pancsf_mmap_io(struct file *filp, struct vm_area_struct *vma)
   620	{
   621		struct drm_file *priv = filp->private_data;
   622		struct pancsf_file *pfile = priv->driver_priv;
   623		struct pancsf_device *pfdev = pfile->pfdev;
   624		phys_addr_t phys_offset;
   625		size_t size;
   626	
   627		switch (vma->vm_pgoff << PAGE_SHIFT) {
 > 628		case DRM_PANCSF_USER_FLUSH_ID_MMIO_OFFSET:
   629			size = PAGE_SIZE;
   630			phys_offset = 0;
   631			break;
   632		default:
   633			return -EINVAL;
   634		}
   635	
   636		if (vma->vm_end - vma->vm_start != size)
   637			return -EINVAL;
   638	
   639		vma->vm_flags |= VM_IO | VM_DONTCOPY | VM_DONTEXPAND | VM_NORESERVE |
   640				 VM_DONTDUMP | VM_PFNMAP;
   641	
   642		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
   643	
   644		return io_remap_pfn_range(vma,
   645					  vma->vm_start,
   646					  (pfdev->phys_addr + phys_offset) >> PAGE_SHIFT,
   647					  size,
   648					  vma->vm_page_prot);
   649	}
   650	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
