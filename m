Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF423F823C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 18:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791399132; cv=none; b=hos/YNL86CpcRqpNC1BQCVHjIMxWsOKm+GrniQXKhHG/Q67fOG4s1/cCF5u+BK0ozVdEd+/DjkIA4wc3jJWXLyuePAIYLgcr2F/lUYWJAhUsm3RNJ7NjnfvqMhkGmaSooVOvPfrYAtZEvcxMDWycUsami1JHO5d17mMnguGXXSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791399132; c=relaxed/simple;
	bh=9OcbjnAgNNy7piAM8MWRJxj6fdqla7JLBbPTOYLG+qE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=do22whHXny8HgN5h+Zj7eSb9bcuXbGgWtkxj0N6OVMpxtpbT7xkf+MTqVjEANJHM8az66vhvzwiMDnUezwQHhDpENrCJ7Faiwqxhfo1S9MwpG29b3tHw8UwItgUrOoryiCRZv6gqQ75lR43DhpqtsIf6lk7RPzDqCikLk8bsG/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hlcPiKhC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlcPiKhC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791399131; x=1822935131;
  h=date:from:to:cc:subject:message-id;
  bh=9OcbjnAgNNy7piAM8MWRJxj6fdqla7JLBbPTOYLG+qE=;
  b=hlcPiKhCDCdju8+PLZiaKsD2OTBtFK2Fy3jNs2FGyziy/jerK5U+TvQl
   9HY6e7DnYY+82gSwN2As0wSDk0Ly44pACVH54IEJuyY4fFvty3OZgLAI9
   +AhRApVVB3yaTfiO9SBN/tmS+tqibrq9Ax6+JGhZZlSoe0i6bSUhTczV7
   79Mf+d0PPOKu0j0CCqAfjV3kFinMFNyrLflP5yWRevKN7SbFi89BS/wSe
   eyTlHIyXyKBsTTSSOYLegAhn3SheFcUdWk8pC3F+Z5obmEA4hlT/lVAqk
   uKs2YaH6WdUg1pEGYdqCWVmMbkyUz6NLron42P35zpkPWSY+Ypj/wMk1L
   A==;
X-CSE-ConnectionGUID: M+NqBOzBQ+mTZh6GzNh2eQ==
X-CSE-MsgGUID: w0UA8RLAQmC5vtT2apTMFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="54765"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="54765"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 11:52:10 -0700
X-CSE-ConnectionGUID: Nrq9NxaSRMaP75qLZP8srQ==
X-CSE-MsgGUID: fJHzsfDRRGKJxJf51zgaag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="1604931"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 07 Oct 2026 11:52:09 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEWkI-000000003pm-3OcR;
	Wed, 07 Oct 2026 18:52:06 +0000
Date: Wed, 07 Oct 2026 20:52:03 +0200
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [pjw-riscv:temp-testing 22/25]
 arch/riscv/kernel/cpufeature.c:943:7: error: '_pgtable_l4_enabled'
 undeclared; did you mean 'pgtable_l4_enabled'?
Message-ID: <202610072042.NzBrZDn5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pjw/riscv.git temp-testing
head:   2bb0a02401f8949ca3f8c12cf1b6cf01bf41eb9e
commit: 016fdf4cebe05b68f13128f1eb12537b10a89d66 [22/25] riscv: support early isa ext and use it to optimize pgtable_l4|l5_enabled
config: riscv-randconfig-2000-20261007 (https://download.01.org/0day-ci/archive/20261007/202610072042.NzBrZDn5-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610072042.NzBrZDn5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610072042.NzBrZDn5-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/cpufeature.c: In function 'riscv_fill_hwcap_from_isa_string':
>> arch/riscv/kernel/cpufeature.c:943:7: error: '_pgtable_l4_enabled' undeclared (first use in this function); did you mean 'pgtable_l4_enabled'?
      if (_pgtable_l4_enabled)
          ^~~~~~~~~~~~~~~~~~~
          pgtable_l4_enabled
   arch/riscv/kernel/cpufeature.c:943:7: note: each undeclared identifier is reported only once for each function it appears in
>> arch/riscv/kernel/cpufeature.c:945:7: error: '_pgtable_l5_enabled' undeclared (first use in this function); did you mean 'pgtable_l5_enabled'?
      if (_pgtable_l5_enabled)
          ^~~~~~~~~~~~~~~~~~~
          pgtable_l5_enabled
   arch/riscv/kernel/cpufeature.c: In function 'riscv_fill_hwcap_from_ext_list':
   arch/riscv/kernel/cpufeature.c:1108:7: error: '_pgtable_l4_enabled' undeclared (first use in this function); did you mean 'pgtable_l4_enabled'?
      if (_pgtable_l4_enabled)
          ^~~~~~~~~~~~~~~~~~~
          pgtable_l4_enabled
   arch/riscv/kernel/cpufeature.c:1110:7: error: '_pgtable_l5_enabled' undeclared (first use in this function); did you mean 'pgtable_l5_enabled'?
      if (_pgtable_l5_enabled)
          ^~~~~~~~~~~~~~~~~~~
          pgtable_l5_enabled


vim +943 arch/riscv/kernel/cpufeature.c

   882	
   883	static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
   884	{
   885		struct device_node *node;
   886		const char *isa;
   887		int rc;
   888		struct acpi_table_header *rhct;
   889		acpi_status status;
   890		unsigned int cpu;
   891		u64 boot_vendorid;
   892		u64 boot_archid;
   893	
   894		if (!acpi_disabled) {
   895			status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
   896			if (ACPI_FAILURE(status))
   897				return;
   898		}
   899	
   900		boot_vendorid = riscv_get_mvendorid();
   901		boot_archid = riscv_get_marchid();
   902	
   903		for_each_possible_cpu(cpu) {
   904			struct riscv_isainfo *isainfo = &hart_isa[cpu];
   905			unsigned long this_hwcap = 0;
   906			DECLARE_BITMAP(source_isa, RISCV_ISA_EXT_MAX) = { 0 };
   907	
   908			if (acpi_disabled) {
   909				node = of_cpu_device_node_get(cpu);
   910				if (!node) {
   911					pr_warn("Unable to find cpu node\n");
   912					continue;
   913				}
   914	
   915				rc = of_property_read_string(node, "riscv,isa", &isa);
   916				of_node_put(node);
   917				if (rc) {
   918					pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
   919					continue;
   920				}
   921			} else {
   922				rc = acpi_get_riscv_isa(rhct, cpu, &isa);
   923				if (rc < 0) {
   924					pr_warn("Unable to get ISA for the hart - %d\n", cpu);
   925					continue;
   926				}
   927			}
   928	
   929			riscv_parse_isa_string(isa, source_isa);
   930	
   931			/*
   932			 * These ones were as they were part of the base ISA when the
   933			 * port & dt-bindings were upstreamed, and so can be set
   934			 * unconditionally where `i` is in riscv,isa on DT systems.
   935			 */
   936			if (acpi_disabled) {
   937				set_bit(RISCV_ISA_EXT_ZICSR, source_isa);
   938				set_bit(RISCV_ISA_EXT_ZIFENCEI, source_isa);
   939				set_bit(RISCV_ISA_EXT_ZICNTR, source_isa);
   940				set_bit(RISCV_ISA_EXT_ZIHPM, source_isa);
   941			}
   942	
 > 943			if (_pgtable_l4_enabled)
   944				set_bit(RISCV_ISA_EXT_SV48, source_isa);
 > 945			if (_pgtable_l5_enabled)
   946				set_bit(RISCV_ISA_EXT_SV57, source_isa);
   947	
   948			/*
   949			 * "V" in ISA strings is ambiguous in practice: it should mean
   950			 * just the standard V-1.0 but vendors aren't well behaved.
   951			 * Many vendors with T-Head CPU cores which implement the 0.7.1
   952			 * version of the vector specification put "v" into their DTs.
   953			 * CPU cores with the ratified spec will contain non-zero
   954			 * marchid.
   955			 */
   956			if (acpi_disabled && boot_vendorid == THEAD_VENDOR_ID && boot_archid == 0x0)
   957				clear_bit(RISCV_ISA_EXT_V, source_isa);
   958	
   959			riscv_resolve_isa(source_isa, isainfo->isa, &this_hwcap, isa2hwcap);
   960	
   961			/*
   962			 * All "okay" hart should have same isa. Set HWCAP based on
   963			 * common capabilities of every "okay" hart, in case they don't
   964			 * have.
   965			 */
   966			if (elf_hwcap)
   967				elf_hwcap &= this_hwcap;
   968			else
   969				elf_hwcap = this_hwcap;
   970	
   971			if (bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX))
   972				bitmap_copy(riscv_isa, isainfo->isa, RISCV_ISA_EXT_MAX);
   973			else
   974				bitmap_and(riscv_isa, riscv_isa, isainfo->isa, RISCV_ISA_EXT_MAX);
   975		}
   976	
   977		if (!acpi_disabled && rhct)
   978			acpi_put_table((struct acpi_table_header *)rhct);
   979	}
   980	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
