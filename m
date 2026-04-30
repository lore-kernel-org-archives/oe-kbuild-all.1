Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25F5260565
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 02:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777515271; cv=none; b=YtfatLECdbcXk1xFqUVu9Q07sf9Z9W9JN9SI7RStKlv7YtuSoT7S1h5PpvsUukzHv/vNxhve7mHS4uDNN9Nh2cm041H6YbJ/ptwvoEAFmqjX6LNr8cHNYkBQ5SVGLHNeFfSelQpvTTr6Its3KSw4wBN8n4WIVoumuJVqoktWOzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777515271; c=relaxed/simple;
	bh=HwSCtJCE1BhUhqqgpVeiS4KXQmuufAwvLupi7xn5YVU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=awHeE7gw0SxiJulI134H43jkGfkZoJx378i1aY6RND1TEfYXlbXyeneiB0uKSaSQ+SBFoROQ4Ude+ZG2EyxUtHkjXbaVnBwh1tCPXDLnnf03QHbR9h2GzWkfiAKyoNPUGsTeLK7x3EDmYSjmMhTeU5bQbbMuS3yLMkv5+eP88KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5VPorNj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5VPorNj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777515269; x=1809051269;
  h=date:from:to:cc:subject:message-id;
  bh=HwSCtJCE1BhUhqqgpVeiS4KXQmuufAwvLupi7xn5YVU=;
  b=M5VPorNjbKBiTL7bFEDe3wDN5h+YfQItoiVeBl5OQ682l/ZPL3c2Bd9b
   387dEw7DvHNPYAb1LQ3y6CsfENkkkuwPkfjmofOCPJ1sCYXIkasSsuRde
   4VaF5znNfoBP1apfE6ifvE9aWFFG4heyiYgahM+HFyDy08FdRrRd+uO7u
   eIxLPg9UExRGhSQutLjbFpdUCKt5eb35GvW4qxfQX9UYu+716N50CDMkJ
   9NXejaHhhcBpoeE67v/iam0T+E8W3EWv45AJ4fEM9ZjqCk64awOVikOcC
   GtyDv0Enm7uEzcO5WIJaNAE6afGbOGT9HZEeuOjq/D2qsDJjSjerzlXGd
   Q==;
X-CSE-ConnectionGUID: MbUMcr2DRrWqtsjN8xbvig==
X-CSE-MsgGUID: PBzAfcAFT9WLrToPIbBORg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78510098"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78510098"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 19:14:28 -0700
X-CSE-ConnectionGUID: VK7jVwyWTe+iUAzYmSA8HA==
X-CSE-MsgGUID: l+v9zE3LSYqfzqR7lZTm5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="236210274"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Apr 2026 19:14:25 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIGuz-00000000Bo8-2lzI;
	Thu, 30 Apr 2026 02:14:21 +0000
Date: Thu, 30 Apr 2026 10:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_iommu_irqbypass_v2 13/18]
 drivers/iommu/riscv/iommu-ir.c:327:53: warning: 'struct
 riscv_iommu_ir_vcpu_info' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202604301024.IPRzkxWv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_iommu_irqbypass_v2
head:   0ba166d111b762ae8f37075ba1266e345ae5ef59
commit: e3141898f38de6d63cb78f33d1b1e7bfb00d6e29 [13/18] iommu/riscv: Add guest file irqbypass support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260430/202604301024.IPRzkxWv-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301024.IPRzkxWv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301024.IPRzkxWv-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:138:17: note: in expansion of macro '__FIELD_PREP'
     138 |                 __FIELD_PREP(_mask, _val, "FIELD_PREP: ");              \
         |                 ^~~~~~~~~~~~
   drivers/iommu/riscv/iommu-ir.c:184:24: note: in expansion of macro 'FIELD_PREP'
     184 |                 .fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
         |                        ^~~~~~~~~~
   In file included from drivers/iommu/riscv/iommu-bits.h:18,
                    from drivers/iommu/riscv/iommu.h:18:
   drivers/iommu/riscv/iommu-ir.c:184:66: error: 'struct riscv_iommu_domain' has no member named 'pgd_mode'
     184 |                 .fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
         |                                                                  ^~
   include/linux/bitfield.h:92:33: note: in definition of macro '__FIELD_PREP'
      92 |                 ((typeof(mask))(val) << __bf_shf(mask)) & (mask);       \
         |                                 ^~~
   drivers/iommu/riscv/iommu-ir.c:184:24: note: in expansion of macro 'FIELD_PREP'
     184 |                 .fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
         |                        ^~~~~~~~~~
   drivers/iommu/riscv/iommu-ir.c:185:59: error: implicit declaration of function 'virt_to_pfn'; did you mean 'virt_to_phys'? [-Wimplicit-function-declaration]
     185 |                        FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root)),
         |                                                           ^~~~~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
>> drivers/iommu/riscv/iommu-ir.c:327:53: warning: 'struct riscv_iommu_ir_vcpu_info' declared inside parameter list will not be visible outside of this definition or declaration
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


vim +327 drivers/iommu/riscv/iommu-ir.c

   176	
   177	static void riscv_iommu_ir_msiptp_update(struct riscv_iommu_domain *domain)
   178	{
   179		struct riscv_iommu_bond *bond;
   180		struct riscv_iommu_device *iommu, *prev;
   181		struct riscv_iommu_dc new_dc = {
   182			.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
   183			      RISCV_IOMMU_PC_TA_V,
   184			.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
 > 185			       FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root)),
   186			.msiptp = virt_to_pfn(domain->msi_root) |
   187				  FIELD_PREP(RISCV_IOMMU_DC_MSIPTP_MODE,
   188					     RISCV_IOMMU_DC_MSIPTP_MODE_FLAT),
   189			.msi_addr_mask = domain->msi_addr_mask,
   190			.msi_addr_pattern = domain->msi_addr_pattern,
   191		};
   192	
   193		/* Like riscv_iommu_ir_msitbl_inval(), synchronize with riscv_iommu_bond_link() */
   194		smp_mb();
   195	
   196		rcu_read_lock();
   197	
   198		prev = NULL;
   199		list_for_each_entry_rcu(bond, &domain->bonds, list) {
   200			iommu = dev_to_iommu(bond->dev);
   201			if (iommu == prev)
   202				continue;
   203	
   204			riscv_iommu_iodir_update(iommu, bond->dev, &new_dc);
   205			prev = iommu;
   206		}
   207	
   208		rcu_read_unlock();
   209	}
   210	
   211	struct riscv_iommu_ir_chip_data {
   212		size_t idx;
   213		u32 config;
   214	};
   215	
   216	static size_t riscv_iommu_ir_irq_msitbl_idx(struct irq_data *data)
   217	{
   218		struct riscv_iommu_ir_chip_data *chip_data = irq_data_get_irq_chip_data(data);
   219	
   220		return chip_data->idx;
   221	}
   222	
   223	static u32 riscv_iommu_ir_irq_msitbl_config(struct irq_data *data)
   224	{
   225		struct riscv_iommu_ir_chip_data *chip_data = irq_data_get_irq_chip_data(data);
   226	
   227		return chip_data->config;
   228	}
   229	
   230	static void riscv_iommu_ir_irq_set_msitbl_info(struct irq_data *data,
   231						       size_t idx, u32 config)
   232	{
   233		struct riscv_iommu_ir_chip_data *chip_data = irq_data_get_irq_chip_data(data);
   234	
   235		chip_data->idx = idx;
   236		chip_data->config = config;
   237	}
   238	
   239	static void riscv_iommu_ir_msitbl_map(struct riscv_iommu_domain *domain,
   240					      struct irq_data *data,
   241					      size_t idx, phys_addr_t addr)
   242	{
   243		struct riscv_iommu_msipte *pte;
   244	
   245		riscv_iommu_ir_irq_set_msitbl_info(data, idx, domain->msitbl_config);
   246	
   247		if (!domain->msi_root)
   248			return;
   249	
   250		if (!refcount_inc_not_zero(&domain->msi_pte_counts[idx])) {
   251			scoped_guard(raw_spinlock_irqsave, &domain->msi_lock) {
   252				if (refcount_read(&domain->msi_pte_counts[idx]) == 0) {
   253					pte = &domain->msi_root[idx];
   254					riscv_iommu_ir_set_pte(pte, addr);
   255					riscv_iommu_ir_msitbl_inval(domain, pte);
   256					refcount_set(&domain->msi_pte_counts[idx], 1);
   257				} else {
   258					refcount_inc(&domain->msi_pte_counts[idx]);
   259				}
   260			}
   261		}
   262	}
   263	
   264	static void riscv_iommu_ir_msitbl_unmap(struct riscv_iommu_domain *domain,
   265						struct irq_data *data, size_t idx)
   266	{
   267		struct riscv_iommu_msipte *pte;
   268		u32 config;
   269	
   270		config = riscv_iommu_ir_irq_msitbl_config(data);
   271		riscv_iommu_ir_irq_set_msitbl_info(data, -1, -1);
   272	
   273		if (WARN_ON_ONCE(config != domain->msitbl_config))
   274			return;
   275	
   276		if (!domain->msi_root)
   277			return;
   278	
   279		scoped_guard(raw_spinlock_irqsave, &domain->msi_lock) {
   280			if (refcount_dec_and_test(&domain->msi_pte_counts[idx])) {
   281				pte = &domain->msi_root[idx];
   282				riscv_iommu_ir_clear_pte(pte);
   283				riscv_iommu_ir_msitbl_inval(domain, pte);
   284			}
   285		}
   286	}
   287	
   288	static size_t riscv_iommu_ir_get_msipte_idx_from_target(struct riscv_iommu_domain *domain,
   289								struct irq_data *data, phys_addr_t *addr)
   290	{
   291		struct msi_msg msg;
   292	
   293		BUG_ON(irq_chip_compose_msi_msg(data, &msg));
   294	
   295		*addr = ((phys_addr_t)msg.address_hi << 32) | msg.address_lo;
   296	
   297		return riscv_iommu_ir_compute_msipte_idx(domain, *addr);
   298	}
   299	
   300	static int riscv_iommu_ir_irq_set_affinity(struct irq_data *data,
   301						   const struct cpumask *dest, bool force)
   302	{
   303		struct riscv_iommu_info *info = data->domain->host_data;
   304		struct riscv_iommu_domain *domain = info->domain;
   305		size_t old_idx, new_idx;
   306		phys_addr_t new_addr;
   307		int ret;
   308	
   309		old_idx = riscv_iommu_ir_irq_msitbl_idx(data);
   310	
   311		ret = irq_chip_set_affinity_parent(data, dest, force);
   312		if (ret < 0)
   313			return ret;
   314	
   315		new_idx = riscv_iommu_ir_get_msipte_idx_from_target(domain, data, &new_addr);
   316	
   317		if (new_idx == old_idx)
   318			return ret;
   319	
   320		riscv_iommu_ir_msitbl_unmap(domain, data, old_idx);
   321		riscv_iommu_ir_msitbl_map(domain, data, new_idx, new_addr);
   322	
   323		return ret;
   324	}
   325	
   326	static bool riscv_iommu_ir_vcpu_check_config(struct riscv_iommu_domain *domain,
 > 327						     struct riscv_iommu_ir_vcpu_info *vcpu_info)
   328	{
   329		return domain->msi_addr_mask == vcpu_info->msi_addr_mask &&
   330		       domain->msi_addr_pattern == vcpu_info->msi_addr_pattern &&
   331		       domain->group_index_bits == vcpu_info->group_index_bits &&
   332		       domain->group_index_shift == vcpu_info->group_index_shift;
   333	}
   334	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
