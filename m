Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF111D6DB1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 06:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733465456; cv=none; b=rHoaWSPlWuKCuS3tiXRcHOyz8gpOlKYc3kIelY/KlTamnEyOwL6wT+J9vz/Nu19Ur6u6Gr5AkkVcjtbp9IIpYVgSr+k7NArAMDOHueBwd5erpx7RFB0t7TFWWyhcqY1zAcZo7cPUhkSwQruANdfFLs/RUSUnWN69964eAZtCURE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733465456; c=relaxed/simple;
	bh=/sIsAd5yBE9i70zxhcQK/EC3COmjRYhqM7PE9AJWgxk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WS9pUWfzpoMit43ZdmeVYHYtp9QH7bmGztXU7Lsx0fnKmP+7ANFic9YggECR4kxJHXBegSFOWWQJ51/y8lQytPeYcErhKX8UPlm4MyIRBMR2ENc6P560kjOeGZHUWqpbfJUHUBAC8u0xxIaD4yzmjkT8eVhZBnbjyGQjQ8dffLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpz+zaYJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpz+zaYJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733465454; x=1765001454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/sIsAd5yBE9i70zxhcQK/EC3COmjRYhqM7PE9AJWgxk=;
  b=lpz+zaYJx/EghXzBO9qz8QUqeOHnr+RmD9x9cKywhB99/nPjdOS1M3co
   POshWeYBO1Z/mD2uxPCnjfjdrmmwdqDo3cHsPLEEkhfM2W/oYsmTuzV/H
   6oiC2P++xQmY9zOw0xADGSSXLHEt6ND8Rmn03kj8/ELeAz6Ci4+yTJg45
   8RSS0VAi+ivpK3Sqv951XUfKVDqQivKQuBwlJz4yZ5lM+QqOhHkUTTNvS
   EskWgTXBWswjTu3vnuGeBwVQMCVgRolU4XMnD1kxjVLBYlIPcIIQCf0Ny
   W5VCzb/iah8u/mQ8DIkIYMTP7lqOwtvmjVv4RoiQRBCfsBJkkQNzj9RMY
   w==;
X-CSE-ConnectionGUID: UCesuPvRRSuaaiIZG6UKAw==
X-CSE-MsgGUID: 21m8a7EsQFqdd7hM0yFiaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37742506"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="37742506"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 22:10:53 -0800
X-CSE-ConnectionGUID: 2cIdU2ykTu+DBxLufw14AQ==
X-CSE-MsgGUID: 3rjWQ5lDTcCEle8Ci5CgHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="99267812"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Dec 2024 22:10:53 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJRYA-0000l7-06;
	Fri, 06 Dec 2024 06:10:50 +0000
Date: Fri, 6 Dec 2024 14:10:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-partner_predev 23/81]
 arch/x86/kvm/../../../virt/kvm/vfio.c:394:8: error: call to undeclared
 function 'kvm_call_hyp_nvhe'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202412061436.BFNE5ITW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   189fb017ecf5ae2222e37e4461dc2369022a9b99
commit: ce9964a039a624643c11ab2dab631b29c81d865f [23/81] ANDROID: kvm/vfio: Add pviommu group and attach function
config: i386-buildonly-randconfig-001-20241206 (https://download.01.org/0day-ci/archive/20241206/202412061436.BFNE5ITW-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412061436.BFNE5ITW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412061436.BFNE5ITW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/../../../virt/kvm/vfio.c:12:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
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
   arch/x86/kvm/../../../virt/kvm/vfio.c:94:18: error: use of undeclared identifier 'vfio_file_get_device'; did you mean 'kvm_vfio_file_get_device'?
      94 |         fn = symbol_get(vfio_file_get_device);
         |                         ^~~~~~~~~~~~~~~~~~~~
         |                         kvm_vfio_file_get_device
   include/linux/module.h:814:40: note: expanded from macro 'symbol_get'
     814 | #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visibility("hidden"))); &(x); })
         |                                        ^
   arch/x86/kvm/../../../virt/kvm/vfio.c:89:23: note: 'kvm_vfio_file_get_device' declared here
      89 | static struct device *kvm_vfio_file_get_device(struct file *file)
         |                       ^
>> arch/x86/kvm/../../../virt/kvm/vfio.c:394:8: error: call to undeclared function 'kvm_call_hyp_nvhe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     394 |         ret = kvm_call_hyp_nvhe(__pkvm_pviommu_attach, dev->kvm, pviommu->fd);
         |               ^
>> arch/x86/kvm/../../../virt/kvm/vfio.c:394:26: error: use of undeclared identifier '__pkvm_pviommu_attach'; did you mean 'kvm_vfio_pviommu_attach'?
     394 |         ret = kvm_call_hyp_nvhe(__pkvm_pviommu_attach, dev->kvm, pviommu->fd);
         |                                 ^~~~~~~~~~~~~~~~~~~~~
         |                                 kvm_vfio_pviommu_attach
   arch/x86/kvm/../../../virt/kvm/vfio.c:376:12: note: 'kvm_vfio_pviommu_attach' declared here
     376 | static int kvm_vfio_pviommu_attach(struct kvm_device *dev)
         |            ^
   3 warnings and 3 errors generated.


vim +/kvm_call_hyp_nvhe +394 arch/x86/kvm/../../../virt/kvm/vfio.c

   375	
   376	static int kvm_vfio_pviommu_attach(struct kvm_device *dev)
   377	{
   378		int ret;
   379		struct kvm_pviommu *pviommu;
   380	
   381		pviommu = kmalloc(sizeof(*pviommu), GFP_KERNEL);
   382		if (!pviommu)
   383			return -ENOMEM;
   384	
   385		pviommu->dev = dev;
   386	
   387		ret = anon_inode_getfd("kvm-pviommu", &pviommu_fops, pviommu, O_CLOEXEC);
   388		if (ret < 0)
   389			goto out_free;
   390	
   391		pviommu->fd = ret;
   392	
   393		/* Create pvIOMMU with this ID. */
 > 394		ret = kvm_call_hyp_nvhe(__pkvm_pviommu_attach, dev->kvm, pviommu->fd);
   395		if (ret)
   396			goto out_free;
   397	
   398		return pviommu->fd;
   399	out_free:
   400		kfree(pviommu);
   401		return ret;
   402	}
   403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
