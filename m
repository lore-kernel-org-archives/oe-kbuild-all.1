Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1B22AE8B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 22:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730241217; cv=none; b=ftPxcC4rv590dBW8hO6BCw+D8WLaN/PT+ma+2J37/UdDHK2kVacmF/XR+MQLruSjc37RewPdKpsWR3bLUQ40GLo+kfRpUirXiEZAYu/ItUlqYrLJNPphSyLIbcrznAIC8eSrv42gXbXPk9vjaG91c3EvlBLiP1QPd2/RQLxzrkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730241217; c=relaxed/simple;
	bh=3C6CC95f2bGcdIVV8STWeHAg6JRDRPMNXXWmxBrCYvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VS5amraWiWKCBA5F7lXZ2efV8KuRUZiCfdg7u4VdiJoK3T6CkFHDixiCgZd/UjHdyuZv7TP/GRSEWmybXHbbAW1tPs4ox5P118/N6E3evnRaleeMrsihaghCxEWG6iszPR7VySGxQ6d66F+w6ln63O6AdK5oAKILEi+NkCaisBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GpurnNpY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpurnNpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730241214; x=1761777214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3C6CC95f2bGcdIVV8STWeHAg6JRDRPMNXXWmxBrCYvI=;
  b=GpurnNpYDvhMRDyHo5xv8eC1tq7VwfQqaGwwtRDvCtEBTwjIHUPKU68u
   RspmsXuBRQ8TL3kc9nf5TRIrtrpX129XE1rutac6rfAf0SiuYlmFhOOnE
   BQLTioB3x9U0SKnI+eju9EJWtOW3ibiWdFsOA9Wl2WYq2Ldn6hYmpOCdR
   xJJcADHpoN4BSwkvMM/MiXtly6uTrCyGUHumYPc2meTLEcwv48VMU1Vjx
   V/OBr2kWUKbNFbX1iL9WlB+E21nHVX+L0sojbSCixgjyNsPNHfLmCP3o+
   /fRjK9Nf2HyHUxztNq4vc/I7K3jM/tsdnmcm4Ze4QIl47IrxODP1c1qqw
   w==;
X-CSE-ConnectionGUID: h8cBSZkAStuO/QgKEurYkQ==
X-CSE-MsgGUID: pdbHE4leRfi7q+grITkOWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="29363500"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="29363500"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 15:33:34 -0700
X-CSE-ConnectionGUID: PbmmPDg/RF6ESKumllCwew==
X-CSE-MsgGUID: 10jaT6FVTAuakuZehsPEuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="86720481"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Oct 2024 15:33:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5umI-000eEQ-3A;
	Tue, 29 Oct 2024 22:33:30 +0000
Date: Wed, 30 Oct 2024 06:32:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-partner_predev 23/68]
 arch/x86/kvm/../../../virt/kvm/vfio.c:394:8: error: call to undeclared
 function 'kvm_call_hyp_nvhe'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202410300656.9ykMfqNC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   0db30a10b0076364f5db3533414a8aea94f662d6
commit: ce9964a039a624643c11ab2dab631b29c81d865f [23/68] ANDROID: kvm/vfio: Add pviommu group and attach function
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241030/202410300656.9ykMfqNC-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300656.9ykMfqNC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300656.9ykMfqNC-lkp@intel.com/

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
   arch/x86/kvm/../../../virt/kvm/vfio.c:94:18: error: use of undeclared identifier 'vfio_file_get_device'; did you mean 'kvm_vfio_file_get_device'?
      94 |         fn = symbol_get(vfio_file_get_device);
         |                         ^~~~~~~~~~~~~~~~~~~~
         |                         kvm_vfio_file_get_device
   include/linux/module.h:304:33: note: expanded from macro 'symbol_get'
     304 | #define symbol_get(x) ((typeof(&x))(__symbol_get(__stringify(x))))
         |                                 ^
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
   7 warnings and 3 errors generated.


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
