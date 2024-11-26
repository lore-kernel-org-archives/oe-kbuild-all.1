Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952BB1D5ACF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732630216; cv=none; b=PfEbQjz9NKzbgs2LyJy63Fq/1KNy7K0OEN3vbF1fwMlt+YJuUNP0lOLKLryn9NBE0twwK6lztzn85WGOT/qd6D7cOG//NT33mqdeJBnI2HfiPucnJorUu084KgN430+CSmu6jtYJJ4x+TZgCd4vA5NmbeKgmQhuvU46G/xEHwQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732630216; c=relaxed/simple;
	bh=NxZQqdXVCDjZfakB5L7CoMNx4Yp2VfYyy+fqt3rFQ/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QMs+jULhzu6ZkYBRuczmA9+Gl+X4GUctQCUv3g2c+KH6eZAvt4QxJDrkfnkWo1ax2PS/G01Pu0X8yF0oI1KPV2u0HUAOdyT2cRh54W1BrmGNWtW1BjwKsyJCaErYzsGYhJs+gwXK4HqxIoNoPe12m4Ajh4Lm/SfHLpIvhsjRKqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jyg8sGGc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyg8sGGc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732630215; x=1764166215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NxZQqdXVCDjZfakB5L7CoMNx4Yp2VfYyy+fqt3rFQ/g=;
  b=jyg8sGGcRJcX7AhqXvapkwtnR1qY+k5zn8wEdi0SBZ/wgQOsbqM1KXQP
   aSxuNKP7A2r+yv7WkVVOPW2iQHuHWuGkzCw+XoliVgIOHN0JwuTJaCcX1
   BXE4J8QXjN/Inb2v+FX6wtsp8Jx+gY214acDy70lTH3ol7caLkM6RIZ9L
   e2Vr7dAMI2NIeIdvawT/D5haIPOsztr2hlfsEaeIeRmiyKqxdZ0EPhNaD
   l10fOvmc/MJThU7DSjvB9JsOaV5UWqq2wve6PXRkv1ymx6NNvBxeQnWyg
   QOLMNaevFxscCM/pKPxIfKWoAF8JOHI0vRlN6wV1t0+SK+5l1FrHIoZaq
   g==;
X-CSE-ConnectionGUID: L4tqJss4Tr2FpZiz5GOEuA==
X-CSE-MsgGUID: 8fxI35sTSw2rvPwejBZSrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="35650120"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="35650120"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 06:10:12 -0800
X-CSE-ConnectionGUID: O7MOIzBjSJOjrDIM0ROLLg==
X-CSE-MsgGUID: b/PurZeRTl2AAMQQ4RnA0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="122474021"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Nov 2024 06:10:12 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFwGW-0007KN-2X;
	Tue, 26 Nov 2024 14:10:08 +0000
Date: Tue, 26 Nov 2024 22:09:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangxiangkai <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1527/1527]
 arch/arm64/kernel/virtcca_cvm_guest.c:139:6: warning: no previous prototype
 for function 'enable_swiotlb_for_cvm_dev'
Message-ID: <202411262147.gY9YltBk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b0092ae9263428dae1c544395395ea693608ace2
commit: 77313e84cc513055342c5e92ac8854e78bc15276 [1527/1527] virtcca feature : disable swiotlb for passthrough device
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241126/202411262147.gY9YltBk-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411262147.gY9YltBk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411262147.gY9YltBk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/virtcca_cvm_guest.c:6:
   In file included from include/linux/mm.h:2247:
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
>> arch/arm64/kernel/virtcca_cvm_guest.c:139:6: warning: no previous prototype for function 'enable_swiotlb_for_cvm_dev' [-Wmissing-prototypes]
     139 | void enable_swiotlb_for_cvm_dev(struct device *dev, bool enable)
         |      ^
   arch/arm64/kernel/virtcca_cvm_guest.c:139:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     139 | void enable_swiotlb_for_cvm_dev(struct device *dev, bool enable)
         | ^
         | static 
   6 warnings generated.


vim +/enable_swiotlb_for_cvm_dev +139 arch/arm64/kernel/virtcca_cvm_guest.c

   138	
 > 139	void enable_swiotlb_for_cvm_dev(struct device *dev, bool enable)
   140	{
   141		if (!is_virtcca_cvm_world())
   142			return;
   143	
   144		if (enable)
   145			swiotlb_dev_init(dev);
   146		else
   147			dev->dma_io_tlb_mem = &io_tlb_no_swiotlb_mem;
   148	}
   149	EXPORT_SYMBOL_GPL(enable_swiotlb_for_cvm_dev);
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
