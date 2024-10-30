Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDFC15B0F7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 22:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730328596; cv=none; b=GVffKI+Q2Tq57Z7km7XZT/E3X39qlZiRjdigzysWhGaJgOF3JJ56D7nIv5wDCClfOLnH6d/Ea2yn3xU/Ry7othtirKJ3TwMfg0QrVZkyO1GngzpWbSyAwiVQG1VQ8d+IVZejb98r9MjhQJe+7WbS7zs8gmIZ0odSYVHi1MP/CBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730328596; c=relaxed/simple;
	bh=9UXr/q0bjhJbrXt8w75QGSOeDJWuUuTfPyIBKfiHt8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QJhfDxDj73GinWoWAy2aSWeH86PR1c5Ve4ZEyk47kdVb9OG0/SaI+FHajYe19AQy9ChaRR4S+8M2Z77gvjBQgFnqFkXGrjSoY1j+JLDp1x2Hdc1BVP2OZ+VUmUl327t00ua34eVxbKQRCQEOOYLbrsql3HN/Rh9WBno/aPTKT1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eYnlj6L2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYnlj6L2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730328594; x=1761864594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9UXr/q0bjhJbrXt8w75QGSOeDJWuUuTfPyIBKfiHt8c=;
  b=eYnlj6L2IJl2sWYejQdk9WW6N8ZnnpcoZvIoomXVx5KQsKCTA25cutem
   7S9vNdaU3VkAYDyXvpgu1c2WWUDoBVlO5Mnmco/IgHkMee/N0VuKWLFTC
   dJwbWwJ8oj23jZYIZsp5Df9KnUJac9qccDyJwPr/tqCLk8MxHR9t/Ihyo
   u9wWhWRIoWc8WTZ4GSgTz9aokAR2Opy565MBsFmJb0APKlx16lsO+bB6h
   gKz9UB8gWp249TtST97mThVInrXRsEWtx44IIq3WT3ov0iAUqpBUPgUBp
   ObhzPwWMPcBcOGbw2uAsjui9wGg5sVor3Xr92mnrCqttMnxGne/obsPAb
   A==;
X-CSE-ConnectionGUID: 2mcTcDQ3Rvew5iuiI4rEqQ==
X-CSE-MsgGUID: ie5MrTigTKeVQre+dwmaqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30207992"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30207992"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 15:49:53 -0700
X-CSE-ConnectionGUID: y2/aN80aQ8CwxenLrdqMXw==
X-CSE-MsgGUID: ULhoqxuNQma30vFvaeHiRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="105776192"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Oct 2024 15:49:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6HVQ-000fOM-0i;
	Wed, 30 Oct 2024 22:49:36 +0000
Date: Thu, 31 Oct 2024 06:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-partner_predev 27/81]
 arch/x86/kvm/../../../virt/kvm/vfio.c:363:2: error: use of undeclared
 identifier 'pkvm_handle_t'
Message-ID: <202410310639.1bJk4CEd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   4f78c3d7bcf25a6712f168ec3e669c779412364f
commit: ef8dd7aa3457fd60fee7bd4e01dfb6a0bdd8d997 [27/81] ANDROID: kvm/vfio: pviommu: Add set config IOCTL
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241031/202410310639.1bJk4CEd-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310639.1bJk4CEd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310639.1bJk4CEd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/../../../virt/kvm/vfio.c:12:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/../../../virt/kvm/vfio.c:12:
   include/linux/kvm_host.h:1575:6: warning: no previous prototype for function 'kvm_arch_reclaim_device' [-Wmissing-prototypes]
    1575 | void kvm_arch_reclaim_device(struct device *dev)
         |      ^
   include/linux/kvm_host.h:1575:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1575 | void kvm_arch_reclaim_device(struct device *dev)
         | ^
         | static 
   include/linux/kvm_host.h:1579:6: warning: no previous prototype for function 'kvm_arch_reclaim_group' [-Wmissing-prototypes]
    1579 | void kvm_arch_reclaim_group(struct iommu_group *group)
         |      ^
   include/linux/kvm_host.h:1579:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1579 | void kvm_arch_reclaim_group(struct iommu_group *group)
         | ^
         | static 
>> arch/x86/kvm/../../../virt/kvm/vfio.c:363:2: error: use of undeclared identifier 'pkvm_handle_t'
     363 |         pkvm_handle_t iommu;
         |         ^
>> arch/x86/kvm/../../../virt/kvm/vfio.c:377:8: error: call to undeclared function 'kvm_iommu_device_id'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     377 |         ret = kvm_iommu_device_id(dev, config->sid_idx, &iommu, &phys_sid);
         |               ^
>> arch/x86/kvm/../../../virt/kvm/vfio.c:377:51: error: use of undeclared identifier 'iommu'; did you mean 'fiommu'?
     377 |         ret = kvm_iommu_device_id(dev, config->sid_idx, &iommu, &phys_sid);
         |                                                          ^~~~~
         |                                                          fiommu
   arch/x86/kvm/../../../virt/kvm/vfio.c:357:53: note: 'fiommu' declared here
     357 | static int kvm_vfio_pviommu_set_config(struct file *fiommu, struct kvm_vfio_iommu_config *config)
         |                                                     ^
   arch/x86/kvm/../../../virt/kvm/vfio.c:381:8: error: call to undeclared function 'kvm_call_hyp_nvhe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     381 |         ret = kvm_call_hyp_nvhe(__pkvm_pviommu_add_vsid, pviommu->dev->kvm, pviommu->fd,
         |               ^
>> arch/x86/kvm/../../../virt/kvm/vfio.c:381:26: error: use of undeclared identifier '__pkvm_pviommu_add_vsid'
     381 |         ret = kvm_call_hyp_nvhe(__pkvm_pviommu_add_vsid, pviommu->dev->kvm, pviommu->fd,
         |                                 ^
   arch/x86/kvm/../../../virt/kvm/vfio.c:382:5: error: use of undeclared identifier 'iommu'
     382 |                                 iommu, phys_sid, config->vsid);
         |                                 ^
   arch/x86/kvm/../../../virt/kvm/vfio.c:436:8: error: call to undeclared function 'kvm_call_hyp_nvhe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     436 |         ret = kvm_call_hyp_nvhe(__pkvm_pviommu_attach, dev->kvm, pviommu->fd);
         |               ^
   arch/x86/kvm/../../../virt/kvm/vfio.c:436:26: error: use of undeclared identifier '__pkvm_pviommu_attach'; did you mean 'kvm_vfio_pviommu_attach'?
     436 |         ret = kvm_call_hyp_nvhe(__pkvm_pviommu_attach, dev->kvm, pviommu->fd);
         |                                 ^~~~~~~~~~~~~~~~~~~~~
         |                                 kvm_vfio_pviommu_attach
   arch/x86/kvm/../../../virt/kvm/vfio.c:418:12: note: 'kvm_vfio_pviommu_attach' declared here
     418 | static int kvm_vfio_pviommu_attach(struct kvm_device *dev)
         |            ^
   arch/x86/kvm/../../../virt/kvm/vfio.c:464:18: error: call to undeclared function 'kvm_iommu_device_num_ids'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     464 |         info->nr_sids = kvm_iommu_device_num_ids(device);
         |                         ^
   7 warnings and 9 errors generated.


vim +/pkvm_handle_t +363 arch/x86/kvm/../../../virt/kvm/vfio.c

   356	
   357	static int kvm_vfio_pviommu_set_config(struct file *fiommu, struct kvm_vfio_iommu_config *config)
   358	{
   359		int vfio_dev_fd = config->device_fd;
   360		struct file *filp;
   361		int ret;
   362		u32 phys_sid;
 > 363		pkvm_handle_t iommu;
   364		struct kvm_pviommu *pviommu = fiommu->private_data;
   365		struct device *dev;
   366	
   367		filp = fget(vfio_dev_fd);
   368		if (!filp)
   369			return -EBADF;
   370	
   371		dev = kvm_vfio_file_get_device(filp);
   372		if (!dev) {
   373			ret = -ENODEV;
   374			goto err_fput;
   375		}
   376	
 > 377		ret = kvm_iommu_device_id(dev, config->sid_idx, &iommu, &phys_sid);
   378		if (ret)
   379			goto err_fput;
   380	
 > 381		ret = kvm_call_hyp_nvhe(__pkvm_pviommu_add_vsid, pviommu->dev->kvm, pviommu->fd,
   382					iommu, phys_sid, config->vsid);
   383	
   384	err_fput:
   385		fput(filp);
   386		return ret;
   387	}
   388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
