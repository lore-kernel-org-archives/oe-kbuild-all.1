Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22077182BD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 01:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739843547; cv=none; b=HXEpMuPUIAOCyUjAlS1kqxh7pdjfbHJWjWW5zEhvOyBXiwUqbgrOgy976hHRWCzMGIy5GWAdKRe88yy/+0OWtONv6Xda/RWl4XA+DUTR16cg6GMBTv6sR/SganSuhpK7bnUAjVgWQD21r9gQpizL7p6Xy7Q0flmkqh7+vQkcqHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739843547; c=relaxed/simple;
	bh=U3qGu2v3uwTXa6i5Jz0NfnB/Hd+1IkX7VtLeeQctO7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QVzZ/9JFKoR5SQym2doQOuhBw8/3LAXfI1+FjCQVY10AwbFWxzG62pTXt3SBiNluL4TXoPYkgJTk5roym5d8ubjuMG8QrjbO0ytv/mECWSITjj0FJhLyp9cCtXCnAGZOVaqc6VZ2vYW/2mFCU+Hp+SYrXzZxOKFcJxsr9HsPv3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BOB3jxU7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BOB3jxU7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739843545; x=1771379545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U3qGu2v3uwTXa6i5Jz0NfnB/Hd+1IkX7VtLeeQctO7A=;
  b=BOB3jxU7Kj3HoG5mKWH7YI5Jrpw1EMedf3XgQSOcVU53YZtVimpNrS4e
   zhjottGZO01ytUx7JeOUNiaWinVG9LotUV5du4kAQd6V3Le8/NH8YjQzk
   CRsSvj+Pd1YcMrZTG29F0TqW9y8jiDMvnXTV+0RwZD44QRimDxsbUv0gF
   WhbnBNgoo+MIiMhOg3CAvLYN7L1zM9Jc92DydP1vFkh6Dj4WNssmAA0lC
   LcloJ5h2EZEswxS0j9h6g7jM76Wz67eYExohbItzgGMKq222T7fl4RbMA
   BAnGqk3TtKNpbYok/ljZBV5U8ciY7mmoOYhg6/xf9AdMwdgIpk3ponC0V
   g==;
X-CSE-ConnectionGUID: MVmW/FJRRGCrJsCn9/EXoQ==
X-CSE-MsgGUID: +Ek4PgqUTYaH9glkyyOW3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40551836"
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="40551836"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 17:52:25 -0800
X-CSE-ConnectionGUID: GtsW5ADuTmq5Na4M71fZ4w==
X-CSE-MsgGUID: NP1CB/8XRb2UxpK5fMjLNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137495136"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 17 Feb 2025 17:52:23 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkCjm-000027-2D;
	Tue, 18 Feb 2025 01:49:57 +0000
Date: Tue, 18 Feb 2025 09:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 28/28]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:322:2: error: call to undeclared
 function '_iommu_iotlb_add_page'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202502180927.O44atuj9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   beb8e60d0487cc606d41b948106c68787f909dee
commit: 561f9e328538b6f1abb7b17faae3db6505172925 [28/28] BACKPORT: FROMLIST: KVM: arm64: iommu: support iommu_iotlb_gather
config: arm64-randconfig-002-20250217 (https://download.01.org/0day-ci/archive/20250218/202502180927.O44atuj9-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502180927.O44atuj9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502180927.O44atuj9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:7:
   In file included from include/kvm/iommu.h:5:
   In file included from arch/arm64/include/asm/kvm_host.h:22:
   In file included from arch/arm64/include/asm/arch_gicv3.h:17:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:322:2: error: call to undeclared function '_iommu_iotlb_add_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     322 |         _iommu_iotlb_add_page(domain, gather, iova, size, kvm_iommu_iotlb_sync);
         |         ^
   4 warnings and 1 error generated.


vim +/_iommu_iotlb_add_page +322 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

   316	
   317	void kvm_iommu_iotlb_gather_add_page(struct kvm_hyp_iommu_domain *domain,
   318					     struct iommu_iotlb_gather *gather,
   319					     unsigned long iova,
   320					     size_t size)
   321	{
 > 322		_iommu_iotlb_add_page(domain, gather, iova, size, kvm_iommu_iotlb_sync);
   323	}
   324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
