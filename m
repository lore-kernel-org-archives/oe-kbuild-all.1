Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D827283CD9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 11:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730372774; cv=none; b=CoH4h+67dMGR9mTVAnGJ4i1Z52kPYeHDyM/HhNLWolrgOF3+gxdHiXSvBrexfSzobMwc7Tsjb69dJapHsZbuvyox0TRXn461IC+X5e7FZqncbylE0HjbWaKQ8P0VV/TdNYA4SUdS2jGeuhlL1HE/CKXwz24vFgVBNYtbYJaJ0Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730372774; c=relaxed/simple;
	bh=SAGOJFefzIoMeN736yFwqOB6W9SWOLtsctRyFjnfEzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ExjevJpLJlp1n3A0K90/R+lfkXG4QUkyeC5O/PFjgGKKsnnPdgCt8xEMOvmwAOvgGw+vFx7UDrLWp2frYZF8T87SlHWHUM8EbEJYIi+ByZxlDTJTQmXUcnLLm7rAjoQCdXfLEGZ5cPpdrPDZ+D7Q2Yj4mW/yngHNa9ou8JgcwUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yltdar/z; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yltdar/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730372772; x=1761908772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SAGOJFefzIoMeN736yFwqOB6W9SWOLtsctRyFjnfEzE=;
  b=Yltdar/zyE6Csc4nfSco7SKwN+Vq/Vv3GHYaR0fpVjJ6msSSzPJNEvds
   fNEtZYEvq4r5S7n8ggydCbJCaqXYfXD2Xic+svOrxoXUVfV4aoxHLfovP
   f4TRkh2Ef3e5fygOaQSef7LmFABOsc03WGyI9VrQgBYWP+c0MEm6D0E85
   WJkk1k/INw5knQF1LV/H2vH30aX8MAgXBK6gx+H3zZajlC43lXrM6bBEn
   KEjSk9r/h54OMeSo4kkujm1vOwi7NmTV3KTHLQyO8mpwdQyZ7NhPeWpSi
   PQDstYeyuiIrZ7EihKCcqjs/Ap/nlO+vr6QZcYnvyqWPWBl5OXtQyysBn
   g==;
X-CSE-ConnectionGUID: 7SjBlaKZRGyY1+QL/DlZbg==
X-CSE-MsgGUID: bYU1E5pSQT6fp/vKtg0fUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="30214654"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="30214654"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 04:06:11 -0700
X-CSE-ConnectionGUID: 3xKC1+8/TgSlV6hvqZuJ1g==
X-CSE-MsgGUID: Dppi1GGiQAyw7pRj8azS+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87198581"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Oct 2024 04:06:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6T0C-000g1a-04;
	Thu, 31 Oct 2024 11:06:08 +0000
Date: Thu, 31 Oct 2024 19:05:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-partner_predev 33/81]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:54:23: warning: no previous prototype
 for function '__get_ctxt'
Message-ID: <202410311951.WCsXgyNb-lkp@intel.com>
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
commit: 0af90376929b38c7a48d52b9471f91bd363776fb [33/81] ANDROID: KVM: arm64: iommu: Use guest allocation function
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241031/202410311951.WCsXgyNb-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311951.WCsXgyNb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311951.WCsXgyNb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:8:
   In file included from arch/arm64/include/asm/kvm_hyp.h:11:
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
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:54:23: warning: no previous prototype for function '__get_ctxt' [-Wmissing-prototypes]
      54 | struct pkvm_hyp_vcpu *__get_ctxt(void)
         |                       ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:54:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      54 | struct pkvm_hyp_vcpu *__get_ctxt(void)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:63:7: warning: no previous prototype for function '__kvm_iommu_donate_pages' [-Wmissing-prototypes]
      63 | void *__kvm_iommu_donate_pages(struct hyp_pool *pool, u8 order, struct kvm_hyp_req *req)
         |       ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:63:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      63 | void *__kvm_iommu_donate_pages(struct hyp_pool *pool, u8 order, struct kvm_hyp_req *req)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:80:6: warning: no previous prototype for function '__kvm_iommu_reclaim_pages' [-Wmissing-prototypes]
      80 | void __kvm_iommu_reclaim_pages(struct hyp_pool *pool, void *p, u8 order)
         |      ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:80:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      80 | void __kvm_iommu_reclaim_pages(struct hyp_pool *pool, void *p, u8 order)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:154:5: warning: no previous prototype for function 'kvm_iommu_refill' [-Wmissing-prototypes]
     154 | int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
         |     ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:154:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     154 | int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:164:6: warning: no previous prototype for function 'kvm_iommu_reclaim' [-Wmissing-prototypes]
     164 | void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target)
         |      ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:164:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     164 | void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:173:5: warning: no previous prototype for function 'kvm_iommu_reclaimable' [-Wmissing-prototypes]
     173 | int kvm_iommu_reclaimable(void)
         |     ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:173:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     173 | int kvm_iommu_reclaimable(void)
         | ^
         | static 
   11 warnings generated.


vim +/__get_ctxt +54 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

    53	
  > 54	struct pkvm_hyp_vcpu *__get_ctxt(void)
    55	{
    56		struct kvm_vcpu *vcpu = this_cpu_ptr(&kvm_host_data)->host_ctxt.__hyp_running_vcpu;
    57	
    58		if (vcpu)
    59			return container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
    60		return NULL;
    61	}
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
