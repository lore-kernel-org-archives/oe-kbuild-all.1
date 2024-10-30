Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D3F1BD9DA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 18:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730312372; cv=none; b=PSl6qwQqV86mdhYMD4wJbR5wf6f64l2+ACzl8sd0ktSQ2OE967H44u7NXiOUncxD5DPRgn/+1DaUOLlEkS11tMZlUU01b2poUnlK/1CZZIe8U777eIj6WnUQn/MNNT5hze+ODWtVm2WylT54fUwWl2GWdKXPHn2RVECbGh+zSQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730312372; c=relaxed/simple;
	bh=2M0AvPeBVphtJTpBQLfgx2j2RTTjL6AicahE6e3Ja8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AOaznK6zyrlXqD52ugrRYNprbdDdPEMhu6dfMWzfcUU47Qx6SC+MIUT/XUBele8G99sMndSN3xvFdqKDYrOXJWsb95Z0vTj++qmLX+5ReP5OgHhOV4bKv2qR06kWMHgdJJy+4ttSg7DxarpnunjyNv1jczjN7Lj33CLh+U2kmyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtrFEvNb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtrFEvNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730312370; x=1761848370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2M0AvPeBVphtJTpBQLfgx2j2RTTjL6AicahE6e3Ja8M=;
  b=PtrFEvNbAjs0GalxYRpEsJEeNrvEsEPXXvp9UPLG7zUz7k/heMr3RB8v
   Sv8Iz5u+PRuocqAbofBJcSYyFaYMGvaN5QB1Z6tgTSisRia0UtjPmPRSe
   2VTVAZvmoMkHNV6/Of4jJhdaFnGMZBoCU3CG9RWevNJis1T2Aryji6JKo
   kJ7W2ZwtKr95AGo1nx2R/vbve8LXrZQm/U0VlpXN7T4UY52bxvASbdAyT
   l37ceTg1Jx1OGLB0fCX51GBJ48iY3ismt2ccX1qnbieqNN/2uurR71G4w
   YjKoKmnQzFBe4/IX8KvBbocW50fNersufrfAnqpSn0Q2KTYlZqbzpIfdv
   Q==;
X-CSE-ConnectionGUID: dQWrf92oQviJ9Zo1fhFa1g==
X-CSE-MsgGUID: L4mtdWZGT4efHb1dSsckTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="29928914"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="29928914"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 11:19:30 -0700
X-CSE-ConnectionGUID: krAAYrV3R5CczHWszOu5EA==
X-CSE-MsgGUID: ulNbLW8BSwWD35rx8J2PLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="82823663"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Oct 2024 11:19:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6DHy-000fBg-0H;
	Wed, 30 Oct 2024 18:19:26 +0000
Date: Thu, 31 Oct 2024 02:19:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-partner_predev 26/81]
 arch/x86/kvm/../../../virt/kvm/vfio.c:422:18: error: call to undeclared
 function 'kvm_iommu_device_num_ids'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202410310238.6yVXYugE-lkp@intel.com>
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
commit: af6fdeb325822ebc7fb32ed24751fc597d78c952 [26/81] ANDROID: kvm/vfio: pviommu: Add attr to probe device IOMMU info
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241031/202410310238.6yVXYugE-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310238.6yVXYugE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310238.6yVXYugE-lkp@intel.com/

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
   arch/x86/kvm/../../../virt/kvm/vfio.c:394:8: error: call to undeclared function 'kvm_call_hyp_nvhe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     394 |         ret = kvm_call_hyp_nvhe(__pkvm_pviommu_attach, dev->kvm, pviommu->fd);
         |               ^
   arch/x86/kvm/../../../virt/kvm/vfio.c:394:26: error: use of undeclared identifier '__pkvm_pviommu_attach'; did you mean 'kvm_vfio_pviommu_attach'?
     394 |         ret = kvm_call_hyp_nvhe(__pkvm_pviommu_attach, dev->kvm, pviommu->fd);
         |                                 ^~~~~~~~~~~~~~~~~~~~~
         |                                 kvm_vfio_pviommu_attach
   arch/x86/kvm/../../../virt/kvm/vfio.c:376:12: note: 'kvm_vfio_pviommu_attach' declared here
     376 | static int kvm_vfio_pviommu_attach(struct kvm_device *dev)
         |            ^
>> arch/x86/kvm/../../../virt/kvm/vfio.c:422:18: error: call to undeclared function 'kvm_iommu_device_num_ids'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     422 |         info->nr_sids = kvm_iommu_device_num_ids(device);
         |                         ^
   7 warnings and 3 errors generated.


vim +/kvm_iommu_device_num_ids +422 arch/x86/kvm/../../../virt/kvm/vfio.c

   403	
   404	static int kvm_vfio_pviommu_get_info(struct kvm_device *dev,
   405					     struct kvm_vfio_iommu_info *info)
   406	{
   407		int vfio_dev_fd = info->device_fd;
   408		int ret = 0;
   409		struct file *filp;
   410		struct device *device;
   411	
   412		filp = fget(vfio_dev_fd);
   413		if (!filp)
   414			return -EBADF;
   415	
   416		device = kvm_vfio_file_get_device(filp);
   417		if (!device) {
   418			ret = -ENODEV;
   419			goto err_fput;
   420		}
   421	
 > 422		info->nr_sids = kvm_iommu_device_num_ids(device);
   423	err_fput:
   424		fput(filp);
   425		return ret;
   426	}
   427	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
