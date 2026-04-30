Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4CA301471
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 03:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519242; cv=none; b=CQbB7dW25oVme/siLwXBIfXjUb6vMhEBCMmS9vh6sAyTgIH1J1nArV/8D1Z4RrxOrX4jG20soeKeXPhGqGHMdFmB7lRXXuQgS0ykemYqXsQWniAJPFmTNMRPNBEMbyb5JC2hfhzmujoDOqBMwvrW0es89/UU4dQRq7HqDOrPm1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519242; c=relaxed/simple;
	bh=E/JRTrSfdfBycmwMq/vyU52WXQ4eF72mumA07RyDLFw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c7gAop8Ezk9MHdzdlz0oPgN8gMIPWnSlK06tfxl0KtJk1UitIuTakSoy/5zQ1QcsVGuUNSFpArDMXeUiOikOkTZSt5IsRe2ip7biCE2mzp+nCOoJx/irSLLPeLXqvg6d0F9MQ2+USqPGOelgkgV7xUr9SU7OdGkT3Dj3gF+Fgx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9BDnJOL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9BDnJOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777519240; x=1809055240;
  h=date:from:to:cc:subject:message-id;
  bh=E/JRTrSfdfBycmwMq/vyU52WXQ4eF72mumA07RyDLFw=;
  b=i9BDnJOL4fou66TyktGyIuAmdcF2Lhsja70zn2EOww6TdiU5NhQLATFy
   fA9bNGMBWMrDX5mFZdrNtsfQrQhTN7gkyKbgxw/K3NlKwJ/BCJs/9yKam
   ruBbQwDTPuR1oBL1h+NWDgHBlD0aBe/M48M5eikXOxYhh49gr97SoeuBI
   gfJahefILTrZlHq+gP19nbG2Zs6oueFPEMcuDvh+QWSUrnnO4oa10gefV
   NxZB++FrtKDVVAL4h5BkQVT4xXrEvE3SVIFVTGejHYJUiROh0jcCG2ike
   2zx1QmARLtlCzr66gQJPla235YdDxT406YEY4nbhQD3Qnr+c7wKPLQ5ZL
   w==;
X-CSE-ConnectionGUID: Z/ZdYjB/QNquUfuc7W4JOg==
X-CSE-MsgGUID: YUfYxWaHQmSaRxtMyDRdHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82316454"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="82316454"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 20:20:37 -0700
X-CSE-ConnectionGUID: yno2RFLPQsmCAU9ugyEQ7Q==
X-CSE-MsgGUID: TbS6wYA2SOGou5+/wUSD9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="257779409"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Apr 2026 20:20:36 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIHx2-00000000Bsq-3KpQ;
	Thu, 30 Apr 2026 03:20:32 +0000
Date: Thu, 30 Apr 2026 11:19:45 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_iommu_irqbypass_v2 13/18]
 drivers/iommu/riscv/iommu-ir.c:333:1: warning: control reaches end of
 non-void function
Message-ID: <202604301140.9miDefDl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_iommu_irqbypass_v2
head:   0ba166d111b762ae8f37075ba1266e345ae5ef59
commit: e3141898f38de6d63cb78f33d1b1e7bfb00d6e29 [13/18] iommu/riscv: Add guest file irqbypass support
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260430/202604301140.9miDefDl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301140.9miDefDl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301140.9miDefDl-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      70 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:91:17: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      91 |                 __BF_FIELD_CHECK_MASK(mask, val, pfx);                  \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:138:17: note: in expansion of macro '__FIELD_PREP'
     138 |                 __FIELD_PREP(_mask, _val, "FIELD_PREP: ");              \
         |                 ^~~~~~~~~~~~
   drivers/iommu/riscv/iommu-ir.c:185:24: note: in expansion of macro 'FIELD_PREP'
     185 |                        FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root)),
         |                        ^~~~~~~~~~
   drivers/iommu/riscv/iommu-ir.c:185:77: error: 'struct riscv_iommu_domain' has no member named 'pgd_root'
     185 |                        FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root)),
         |                                                                             ^~
   include/linux/bitfield.h:92:33: note: in definition of macro '__FIELD_PREP'
      92 |                 ((typeof(mask))(val) << __bf_shf(mask)) & (mask);       \
         |                                 ^~~
   drivers/iommu/riscv/iommu-ir.c:185:24: note: in expansion of macro 'FIELD_PREP'
     185 |                        FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root)),
         |                        ^~~~~~~~~~
   drivers/iommu/riscv/iommu-ir.c: At top level:
   drivers/iommu/riscv/iommu-ir.c:327:53: warning: 'struct riscv_iommu_ir_vcpu_info' declared inside parameter list will not be visible outside of this definition or declaration
     327 |                                              struct riscv_iommu_ir_vcpu_info *vcpu_info)
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-ir.c: In function 'riscv_iommu_ir_vcpu_check_config':
   drivers/iommu/riscv/iommu-ir.c:329:50: error: invalid use of undefined type 'struct riscv_iommu_ir_vcpu_info'
     329 |         return domain->msi_addr_mask == vcpu_info->msi_addr_mask &&
         |                                                  ^~
   drivers/iommu/riscv/iommu-ir.c:330:53: error: invalid use of undefined type 'struct riscv_iommu_ir_vcpu_info'
     330 |                domain->msi_addr_pattern == vcpu_info->msi_addr_pattern &&
         |                                                     ^~
   drivers/iommu/riscv/iommu-ir.c:331:53: error: invalid use of undefined type 'struct riscv_iommu_ir_vcpu_info'
     331 |                domain->group_index_bits == vcpu_info->group_index_bits &&
         |                                                     ^~
   drivers/iommu/riscv/iommu-ir.c:332:54: error: invalid use of undefined type 'struct riscv_iommu_ir_vcpu_info'
     332 |                domain->group_index_shift == vcpu_info->group_index_shift;
         |                                                      ^~
   drivers/iommu/riscv/iommu-ir.c: At top level:
   drivers/iommu/riscv/iommu-ir.c:337:50: warning: 'struct riscv_iommu_ir_vcpu_info' declared inside parameter list will not be visible outside of this definition or declaration
     337 |                                           struct riscv_iommu_ir_vcpu_info *vcpu_info)
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-ir.c: In function 'riscv_iommu_ir_vcpu_new_config':
   drivers/iommu/riscv/iommu-ir.c:343:19: error: 'struct riscv_iommu_domain' has no member named 'pgd_mode'
     343 |         if (domain->pgd_mode)
         |                   ^~
   drivers/iommu/riscv/iommu-ir.c:348:42: error: invalid use of undefined type 'struct riscv_iommu_ir_vcpu_info'
     348 |         domain->msi_addr_mask = vcpu_info->msi_addr_mask;
         |                                          ^~
   drivers/iommu/riscv/iommu-ir.c:349:45: error: invalid use of undefined type 'struct riscv_iommu_ir_vcpu_info'
     349 |         domain->msi_addr_pattern = vcpu_info->msi_addr_pattern;
         |                                             ^~
   drivers/iommu/riscv/iommu-ir.c:350:45: error: invalid use of undefined type 'struct riscv_iommu_ir_vcpu_info'
     350 |         domain->group_index_bits = vcpu_info->group_index_bits;
         |                                             ^~
   drivers/iommu/riscv/iommu-ir.c:351:46: error: invalid use of undefined type 'struct riscv_iommu_ir_vcpu_info'
     351 |         domain->group_index_shift = vcpu_info->group_index_shift;
         |                                              ^~
   drivers/iommu/riscv/iommu-ir.c:355:19: error: 'struct riscv_iommu_domain' has no member named 'pgd_mode'
     355 |         if (domain->pgd_mode) {
         |                   ^~
   drivers/iommu/riscv/iommu-ir.c:373:66: error: invalid use of undefined type 'struct riscv_iommu_ir_vcpu_info'
     373 |         idx = riscv_iommu_ir_compute_msipte_idx(domain, vcpu_info->gpa);
         |                                                                  ^~
   drivers/iommu/riscv/iommu-ir.c:376:46: error: invalid use of undefined type 'struct riscv_iommu_ir_vcpu_info'
     376 |         riscv_iommu_ir_set_pte(pte, vcpu_info->hpa);
         |                                              ^~
   drivers/iommu/riscv/iommu-ir.c: In function 'riscv_iommu_ir_irq_set_vcpu_affinity':
   drivers/iommu/riscv/iommu-ir.c:409:55: error: passing argument 2 of 'riscv_iommu_ir_vcpu_check_config' from incompatible pointer type [-Wincompatible-pointer-types]
     409 |         if (!riscv_iommu_ir_vcpu_check_config(domain, vcpu_info))
         |                                                       ^~~~~~~~~
         |                                                       |
         |                                                       struct riscv_iommu_ir_vcpu_info *
   drivers/iommu/riscv/iommu-ir.c:327:79: note: expected 'struct riscv_iommu_ir_vcpu_info *' but argument is of type 'struct riscv_iommu_ir_vcpu_info *'
     327 |                                              struct riscv_iommu_ir_vcpu_info *vcpu_info)
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   drivers/iommu/riscv/iommu-ir.c:410:69: error: passing argument 3 of 'riscv_iommu_ir_vcpu_new_config' from incompatible pointer type [-Wincompatible-pointer-types]
     410 |                 return riscv_iommu_ir_vcpu_new_config(domain, data, vcpu_info);
         |                                                                     ^~~~~~~~~
         |                                                                     |
         |                                                                     struct riscv_iommu_ir_vcpu_info *
   drivers/iommu/riscv/iommu-ir.c:337:76: note: expected 'struct riscv_iommu_ir_vcpu_info *' but argument is of type 'struct riscv_iommu_ir_vcpu_info *'
     337 |                                           struct riscv_iommu_ir_vcpu_info *vcpu_info)
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   drivers/iommu/riscv/iommu-ir.c:412:70: error: invalid use of undefined type 'struct riscv_iommu_ir_vcpu_info'
     412 |         new_idx = riscv_iommu_ir_compute_msipte_idx(domain, vcpu_info->gpa);
         |                                                                      ^~
   drivers/iommu/riscv/iommu-ir.c:416:50: error: invalid use of undefined type 'struct riscv_iommu_ir_vcpu_info'
     416 |         riscv_iommu_ir_set_pte(&pteval, vcpu_info->hpa);
         |                                                  ^~
   drivers/iommu/riscv/iommu-ir.c: In function 'riscv_ir_set_imsic_global_config':
   drivers/iommu/riscv/iommu-ir.c:620:68: error: 'struct riscv_iommu_domain' has no member named 'numa_node'
     620 |                 domain->msi_root = iommu_alloc_pages_node_sz(domain->numa_node, GFP_KERNEL_ACCOUNT,
         |                                                                    ^~
   drivers/iommu/riscv/iommu-ir.c: In function 'riscv_iommu_ir_attach_paging_domain':
   drivers/iommu/riscv/iommu-ir.c:662:27: error: 'struct riscv_iommu_domain' has no member named 'pgd_mode'
     662 |                 if (domain->pgd_mode) {
         |                           ^~
   drivers/iommu/riscv/iommu-ir.c: In function 'riscv_iommu_ir_vcpu_check_config':
>> drivers/iommu/riscv/iommu-ir.c:333:1: warning: control reaches end of non-void function [-Wreturn-type]
     333 | }
         | ^


vim +333 drivers/iommu/riscv/iommu-ir.c

   325	
   326	static bool riscv_iommu_ir_vcpu_check_config(struct riscv_iommu_domain *domain,
   327						     struct riscv_iommu_ir_vcpu_info *vcpu_info)
   328	{
   329		return domain->msi_addr_mask == vcpu_info->msi_addr_mask &&
   330		       domain->msi_addr_pattern == vcpu_info->msi_addr_pattern &&
   331		       domain->group_index_bits == vcpu_info->group_index_bits &&
   332		       domain->group_index_shift == vcpu_info->group_index_shift;
 > 333	}
   334	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
