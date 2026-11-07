Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794041676;
	b=v08PNkKRMWUxeBT0tziwG0EbuPYWPuhha+dcddBzXK52HfXp0884bs+ywtF8zjChyF8c
	 qwNKOmg2+P6B58ECM6JbOELOrYj+9k2ZZ8QkRepqEG0PB+FS092SSEBN0N7WNVdNNLRim
	 9D4VmVu9tNBo2Wch0dUIADD5Ab/HJSe/dbhdQK2tIv6UK6FZARBozu/VHPFXLH7kOE1WK
	 eSbIJyUux8IeeLJ3AFPdq5J5gyTrHO5XTzb+jVvQFGpRlz4tEhVvbzYd8OI5LHJnTjna6
	 SA+RG1dppNe8xNjKD66UlYaH6Muh/thH4yaN2RAtygz6+XpmzoiPA05q4E6VzqFjkNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794041676;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8LqYSuiNcpDHpTc7FaqlxnK4tEHyI8WeAAFKFRwvNrg=;
	b=fGMmjQkcdk2kT+bDwYV/agqv6hDiCRgySFKrgI8XLS+msEyU8YPMt/pHBW3ofIgWewDN
	 oaAs4dEuHFdPMRz/r/+cqnoWtjOs4351/yu7JRoZvaWbJWXtLBMou50nxAu00qov6KFnx
	 t7eVuunkuQJcjrxvR3XvcPSxZadmm0t0L+EibugLnWz4S5A3Bif4T5NaRcvx62eaRcjDx
	 5RoNqlJagFJfEbFejjdg2HrTrk+ZXtMrSc70gTkE2q4sb2U7cW8o6amjvXx76+eYxQrz0
	 p8r2ByC53sqkabLJRzmvHHicmutNhKGiQ41ZeXnlSQdDJUefLYXkiNQstXlP3fqvVHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YtChl8bs;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A1E606A326
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 08:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52A1E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YtChl8bs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794041674; x=1825577674;
  h=date:from:to:cc:subject:message-id;
  bh=l7PHrzr+VYDInO+WsgEfsf4K7tSWnP70Ma2pKfJMWT0=;
  b=YtChl8bsifai09XfVyikLr5ibzUoU4zjxWx0qcIQsvvadt/L0656cMZe
   Kphy6mHu8SHwfyT5J41jlYvLbTaF9J2+ioPMW4nmDJJ8ePdj1rMZrikK5
   w3PRA88qGIdJsZ5EOV8Fx9mvMewrhKq41mxPlvrFFGLLUfwL4rvalVwQL
   ITB8QUbdni9EcMkb1z01vyPAyD64rqoJUF2S7b4UcH7kGoVZdX5IhiIid
   hX01MFzCGAcLL/060n8xgv+hMcthYQoAjdgTD1ZUTcnYU0SPEv3uxR8yh
   EzPahfjKaieg7ft1JBQnJQ0sHD0zrtZvH4ABijFPSC2Vf2s71EUgfxBjj
   w==;
X-CSE-ConnectionGUID: oPynnMSoRYuDKrhOInP2tg==
X-CSE-MsgGUID: PstNyxayTriz/a4YrelRbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2748650"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2748650"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 00:54:34 -0800
X-CSE-ConnectionGUID: PewZNGk2R4mJvAn+yd3GBQ==
X-CSE-MsgGUID: GRwOs7wwRgem5jkzjE8DEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="9323845"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 07 Nov 2026 00:54:32 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPcBw-00000000AcJ-3bZn;
	Sat, 07 Nov 2026 08:54:28 +0000
Date: Sat, 07 Nov 2026 09:54:11 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 53/53]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:338:22: error: 'struct
 iommu_iotlb_gather' has no member named 'end'
Message-ID: <202611070911.VRzf6cPc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   bc10f2ae3a89cd46c1069ed99b65df424ba3d3db
commit: c220ef36a11e4fe05cc1e583f8e24d2a61541a87 [53/53] ANDROID: KVM: arm64: iommu: support iommu_iotlb_gather
config: arm64-randconfig-2200-20261107 (https://download.01.org/0day-ci/archive/20261107/202611070911.VRzf6cPc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611070911.VRzf6cPc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611070911.VRzf6cPc-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:85:5: warning: no previous prototype for 'kvm_iommu_refill' [-Wmissing-prototypes]
      85 | int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
         |     ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:90:6: warning: no previous prototype for 'kvm_iommu_reclaim' [-Wmissing-prototypes]
      90 | void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target)
         |      ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:95:5: warning: no previous prototype for 'kvm_iommu_reclaimable' [-Wmissing-prototypes]
      95 | int kvm_iommu_reclaimable(void)
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c: In function 'kvm_iommu_iotlb_gather_is_disjoint':
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:338:22: error: 'struct iommu_iotlb_gather' has no member named 'end'
     338 |         return gather->end != 0 &&
         |                      ^~
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:339:34: error: 'struct iommu_iotlb_gather' has no member named 'start'
     339 |                 (end + 1 < gather->start || start > gather->end + 1);
         |                                  ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:339:59: error: 'struct iommu_iotlb_gather' has no member named 'end'
     339 |                 (end + 1 < gather->start || start > gather->end + 1);
         |                                                           ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c: In function 'kvm_iommu_iotlb_gather_add_range':
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:347:19: error: 'struct iommu_iotlb_gather' has no member named 'start'
     347 |         if (gather->start > iova)
         |                   ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:348:23: error: 'struct iommu_iotlb_gather' has no member named 'start'
     348 |                 gather->start = iova;
         |                       ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:349:19: error: 'struct iommu_iotlb_gather' has no member named 'end'
     349 |         if (gather->end < end)
         |                   ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:350:23: error: 'struct iommu_iotlb_gather' has no member named 'end'
     350 |                 gather->end = end;
         |                       ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c: In function 'kvm_iommu_iotlb_gather_add_page':
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:358:20: error: 'struct iommu_iotlb_gather' has no member named 'pgsize'
     358 |         if ((gather->pgsize && gather->pgsize != size) ||
         |                    ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:358:38: error: 'struct iommu_iotlb_gather' has no member named 'pgsize'
     358 |         if ((gather->pgsize && gather->pgsize != size) ||
         |                                      ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:362:15: error: 'struct iommu_iotlb_gather' has no member named 'pgsize'
     362 |         gather->pgsize = size;
         |               ^~


vim +338 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

   332	
   333	static bool kvm_iommu_iotlb_gather_is_disjoint(struct iommu_iotlb_gather *gather,
   334						       unsigned long iova, size_t size)
   335	{
   336		unsigned long start = iova, end = start + size - 1;
   337	
 > 338		return gather->end != 0 &&
 > 339			(end + 1 < gather->start || start > gather->end + 1);
   340	}
   341	
   342	static inline void kvm_iommu_iotlb_gather_add_range(struct iommu_iotlb_gather *gather,
   343							    unsigned long iova, size_t size)
   344	{
   345		unsigned long end = iova + size - 1;
   346	
   347		if (gather->start > iova)
   348			gather->start = iova;
   349		if (gather->end < end)
   350			gather->end = end;
   351	}
   352	
   353	void kvm_iommu_iotlb_gather_add_page(void *cookie,
   354					     struct iommu_iotlb_gather *gather,
   355					     unsigned long iova,
   356					     size_t size)
   357	{
 > 358		if ((gather->pgsize && gather->pgsize != size) ||
   359		    kvm_iommu_iotlb_gather_is_disjoint(gather, iova, size))
   360			kvm_iommu_iotlb_sync(cookie, gather);
   361	
   362		gather->pgsize = size;
   363		kvm_iommu_iotlb_gather_add_range(gather, iova, size);
   364	}
   365	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
