Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D91FC12
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 00:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730161510; cv=none; b=U2vpDMzGTVJzfejfLVLjkeJjcAnfSeSz9yo6UjfwwdmYlrbnuiF350EmywmffSj9pArkTOX7IddtQXOc+ihkGxYyZjt0y83RS+OIxiKa0E27zq/WHiGXZn2g1p30IIHCmbEfuVPUpZjeRysA+hHKy+iWkKcipBRlGRiirOHrPrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730161510; c=relaxed/simple;
	bh=gjt+D62TA4xo9oZy+aL0HuDntbqbmwcm48N/cq9AU4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DkPtduU2U2pEMvozG5ZcpxiCIZJAYU3OI5XAx8b9x+FFGVPzXAU+dcbKAtDZqD+TK3iawN0zHA3Kddk7gpZ5HzVbH3FwGsjkAXvjKFKplC+29+5GS3MzugLAYrLT5KUs9PmMSmMQ/8VgPkKFvlIAc+osuSJig6briforP32Lyd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NrTl5YpL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NrTl5YpL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730161508; x=1761697508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gjt+D62TA4xo9oZy+aL0HuDntbqbmwcm48N/cq9AU4E=;
  b=NrTl5YpLhXb2e9ue9LqfW+qP8SMRnihwuU7DA6Nl3HQAbCXW808wZLG0
   wyfiEL0zOtTzdIYPiZ+I98FnDHmaosTC4le4tiH34f3y8tEb+bOgNxCk2
   r8mCYMi0KJlioJj8W9lIN7eK69CYAvz28zjgGX/1MF0W7vHxuNskyzQWS
   2rWBnDeZU34l9Zt4MUdm0cpjkAH5ys2++7BpSirAW1nEgd+3kAdjVVCaT
   S+Ht9BR4q4eSMtwpS2BsM4w1wyW288bJfrZ/kRL5d+trgbFjv7ZItwGpJ
   KYHce8RKt3/I+jDPwsfuVwXr4N/UbIbibGYlHhInOwgYA0nz+RdcUx4nD
   A==;
X-CSE-ConnectionGUID: tUtNq8bhRTCU0s07vwVPpQ==
X-CSE-MsgGUID: r/lM1fFXTFGHj+/HHPTGbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="32639685"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="32639685"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 17:25:06 -0700
X-CSE-ConnectionGUID: qQ8UIRXvTFaCmVVbOOksiA==
X-CSE-MsgGUID: 1DvmOix0TL+yPmRaKKEHIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="81403313"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Oct 2024 17:23:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5a1C-000d3U-2Q;
	Tue, 29 Oct 2024 00:23:30 +0000
Date: Tue, 29 Oct 2024 08:23:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangxiangkai <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 14667/15358] arch/arm64/kvm/virtcca_cvm.c:954:5:
 warning: no previous prototype for function 'kvm_cvm_create_dev_ttt_levels'
Message-ID: <202410290851.Q4YycFaU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   27e5d43e49e85d816bd05ffe8672ceea631a07e4
commit: 6ae1290a135c545470e99e6b117d9be75836d0ac [14667/15358] virtcca feature: vfio driver dma map
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241029/202410290851.Q4YycFaU-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410290851.Q4YycFaU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410290851.Q4YycFaU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/virtcca_cvm.c:5:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2243:
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
>> arch/arm64/kvm/virtcca_cvm.c:954:5: warning: no previous prototype for function 'kvm_cvm_create_dev_ttt_levels' [-Wmissing-prototypes]
     954 | int kvm_cvm_create_dev_ttt_levels(struct kvm *kvm, struct virtcca_cvm *cvm,
         |     ^
   arch/arm64/kvm/virtcca_cvm.c:954:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     954 | int kvm_cvm_create_dev_ttt_levels(struct kvm *kvm, struct virtcca_cvm *cvm,
         | ^
         | static 
   6 warnings generated.


vim +/kvm_cvm_create_dev_ttt_levels +954 arch/arm64/kvm/virtcca_cvm.c

   952	
   953	/* CVM create ttt level information about device */
 > 954	int kvm_cvm_create_dev_ttt_levels(struct kvm *kvm, struct virtcca_cvm *cvm,
   955				unsigned long ipa,
   956				int level,
   957				int max_level,
   958				struct kvm_mmu_memory_cache *mc)
   959	{
   960		int ret = 0;
   961	
   962		if (WARN_ON(level == max_level))
   963			return 0;
   964	
   965		while (level++ < max_level) {
   966			u64 numa_set = kvm_get_first_binded_numa_set(kvm);
   967	
   968			ret = kvm_cvm_dev_ttt_create(cvm, ipa, level, numa_set);
   969			if (ret)
   970				return -ENXIO;
   971		}
   972	
   973		return 0;
   974	}
   975	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
