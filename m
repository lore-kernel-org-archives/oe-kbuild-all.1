Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F6A7081E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 08:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766739475; cv=none; b=klpeHrwRUvvls0vHpKStnJEGQQc+etfwiTyctSF0lJst4YwUDUoeL91UIovSx6CE0geuR/4LmTET1JFnO+AuKwikIujZPlXo3xiLJRzQ2zDZdXcsgPUatS7y0OJn5Cj67uhnPVrZyVLaBSWT2XAYIIFZ+gYjUKRfYCqUB5DSxZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766739475; c=relaxed/simple;
	bh=cmPc6HZ4/c9uv6uxGHPab+c+FdprQWmzEOLgHfA4ugU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TVWzc1KA8Ol4hHbeUbxrjV22HM14g6F/XpRmWm7JVh4TCDl84O2CUjxFxP6yI8VQf589O8UsB5nQwmsdG3W32808dw4wWOn4HjS6nM5XhmXq1+/M18VLyO2DfB+g24K+obDEX/Y1oWp4CeDJp0wENDTrmLSkPrgCnykazBtelnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkAUyyAf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkAUyyAf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766739473; x=1798275473;
  h=date:from:to:cc:subject:message-id;
  bh=cmPc6HZ4/c9uv6uxGHPab+c+FdprQWmzEOLgHfA4ugU=;
  b=bkAUyyAfQt3BoAMxlGJtwVAUFaKZaoy4VTimy8zwbZS6fRHpdCCNHSTy
   EKdPtvHvPCOTUMrY8nwetjsn9XesfjPK+GLob5+MMrRvt8C/ADNgV+Ng8
   lFvdvpcxu5j5phgSWYv8vTy5NgCVsUJxP10zaaLrzsOBB/sz9Qh+wrtSm
   0g4dPsFye3qDSx8uo2o5zi1ONptnVPJZqghqkvKf7njHt6z4epAUuR8nc
   Iosu9kEVDrjVQZqoEKoTk3+xWz9ln6ZUccaNK0Mnh8zXmYd6LdL49qXsu
   eieVHJa9WBkioWMzHRBoYY1VZpyD2lI3c0t/6mpWdM+20L0D/EQO7xaED
   w==;
X-CSE-ConnectionGUID: Fz6KBKZaRV+HVtubQN0qjQ==
X-CSE-MsgGUID: tdjYXb7wRamfVh5xQNmXcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="78809255"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="78809255"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 00:57:53 -0800
X-CSE-ConnectionGUID: XQsV/PPOS5qslHgsUIK6/A==
X-CSE-MsgGUID: E3XHwEmNRJmRHxOz7k2uaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="237755536"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Dec 2025 00:57:50 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZ3ds-000000004uD-0xFl;
	Fri, 26 Dec 2025 08:57:48 +0000
Date: Fri, 26 Dec 2025 16:56:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13/13]
 drivers/ub/ubus/interrupt.c:121:15: error: implicit declaration of function
 'usi_setup_interrupts'
Message-ID: <202512261650.agrBBnFd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   03c9c649e6f28e26260d276ce755f785b2435da3
commit: 1faf759d302206a8387d685808928c228c9aa306 [13/13] ub:ubus: Add MSI capability for UBUS driver
config: arm64-randconfig-004-20251226 (https://download.01.org/0day-ci/archive/20251226/202512261650.agrBBnFd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512261650.agrBBnFd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512261650.agrBBnFd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/ub/ubus/interrupt.c:43:6: warning: no previous prototype for 'ub_intr_init' [-Wmissing-prototypes]
      43 | void ub_intr_init(struct ub_entity *uent)
         |      ^~~~~~~~~~~~
   drivers/ub/ubus/interrupt.c: In function 'int_type1_capability_init':
>> drivers/ub/ubus/interrupt.c:121:15: error: implicit declaration of function 'usi_setup_interrupts' [-Werror=implicit-function-declaration]
     121 |         ret = usi_setup_interrupts(uent, entries, nvec, affd);
         |               ^~~~~~~~~~~~~~~~~~~~
   drivers/ub/ubus/interrupt.c: In function 'int_type2_capability_init':
>> drivers/ub/ubus/interrupt.c:151:25: error: implicit declaration of function 'ub_intr_addr_count'; did you mean 'ub_intr_vec_count'? [-Werror=implicit-function-declaration]
     151 |         addr_num = (int)ub_intr_addr_count(uent);
         |                         ^~~~~~~~~~~~~~~~~~
         |                         ub_intr_vec_count
   drivers/ub/ubus/interrupt.c: In function '__ub_enable_usi_range':
>> drivers/ub/ubus/interrupt.c:235:15: error: implicit declaration of function 'ub_setup_msi_context' [-Werror=implicit-function-declaration]
     235 |         ret = ub_setup_msi_context(uent);
         |               ^~~~~~~~~~~~~~~~~~~~
>> drivers/ub/ubus/interrupt.c:239:14: error: implicit declaration of function 'ub_setup_usi_device_domain' [-Werror=implicit-function-declaration]
     239 |         if (!ub_setup_usi_device_domain(uent, hwsize)) {
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/usi_setup_interrupts +121 drivers/ub/ubus/interrupt.c

    42	
  > 43	void ub_intr_init(struct ub_entity *uent)
    44	{
    45		if (uent->cfg1_bitmap[0] & UB_INT_TYPE2_CAP_BIT)
    46			uent->intr_type1 = 0;
    47		else if (uent->cfg1_bitmap[0] & UB_INT_TYPE1_CAP_BIT)
    48			uent->intr_type1 = 1;
    49		else
    50			uent->no_intr = 1;
    51	}
    52	
    53	u32 ub_int_type1_vec_count(struct ub_entity *uent)
    54	{
    55		u16 vector_num = 0;
    56		int ret;
    57	
    58		ret = ub_cfg_read_word(uent, UB_INT_TYPE1_SUP_INT_NUM, &vector_num);
    59		if (ret)
    60			return 0;
    61	
    62		/* Mapping between the number of bitmaps and vectors defined in the protocol */
    63		vector_num = 1 << vector_num;
    64	
    65		return vector_num;
    66	}
    67	EXPORT_SYMBOL_GPL(ub_int_type1_vec_count);
    68	
    69	static void __iomem *ub_intr_map_region(struct ub_entity *uent,
    70						enum ub_intr_tbl_type type, int nr_entries)
    71	{
    72		u32 addr_reg_l, addr_reg_h, offset_l, offset_h;
    73		resource_size_t tb_phys_addr;
    74		unsigned long flags, sz;
    75		u64 offset;
    76		int ret;
    77	
    78		if (nr_entries <= 0)
    79			return NULL;
    80		if (type == UB_INTR_VECTOR_TBL) {
    81			addr_reg_l = UB_INT_VECTOR_TBL_SA_L;
    82			addr_reg_h = UB_INT_VECTOR_TBL_SA_H;
    83			sz = (unsigned long)(nr_entries * UB_INTR_VECTOR_ENTRY_SIZE);
    84		} else {
    85			addr_reg_l = UB_INT_ADDR_TBL_SA_L;
    86			addr_reg_h = UB_INT_ADDR_TBL_SA_H;
    87			sz = (unsigned long)(nr_entries * UB_INTR_ADDR_ENTRY_SIZE);
    88		}
    89	
    90		ret = ub_cfg_read_dword(uent, addr_reg_l, &offset_l);
    91		ret |= ub_cfg_read_dword(uent, addr_reg_h, &offset_h);
    92		if (ret) {
    93			ub_err(uent, "read addr register failed, ret=%d\n", ret);
    94			return NULL;
    95		}
    96	
    97		offset = ((u64)offset_h << 32) | offset_l;
    98	
    99		flags = ub_resource_flags(uent, 0);
   100		if (!flags || (flags & IORESOURCE_UNSET))
   101			return NULL;
   102	
   103		if (offset + sz > ub_resource_len(uent, 0)) {
   104			ub_err(uent, "UB interrupt table(type:%u) off:%#llx + sz:%#lx is out of range!\n",
   105			       type, offset, sz);
   106			return NULL;
   107		}
   108		tb_phys_addr = ub_resource_start(uent, 0) + offset;
   109	
   110		return ioremap(tb_phys_addr, sz);
   111	}
   112	
   113	static int int_type1_capability_init(struct ub_entity *uent,
   114					     struct ub_usi_entry *entries, int nvec,
   115					     struct irq_affinity *affd)
   116	{
   117		int ret;
   118	
   119		uent->intr_enabled = 1;
   120	
 > 121		ret = usi_setup_interrupts(uent, entries, nvec, affd);
   122		if (ret)
   123			goto out_disable;
   124	
   125		ub_cfg_write_byte(uent, UB_INT_TYPE1_ENABLE, 1);
   126		return 0;
   127	
   128	out_disable:
   129		uent->intr_enabled = 0;
   130	
   131		return ret;
   132	}
   133	
   134	static int int_type2_capability_init(struct ub_entity *uent,
   135					     struct ub_usi_entry *entries, int nvec,
   136					     struct irq_affinity *affd)
   137	{
   138		void __iomem *vector_base, *addr_base;
   139		int vector_num, addr_num;
   140		int ret;
   141	
   142		uent->intr_enabled = 1;
   143	
   144		vector_num = (int)ub_intr_vec_count(uent);
   145		/* Request & Map UB interrupt table region */
   146		vector_base = ub_intr_map_region(uent, UB_INTR_VECTOR_TBL, vector_num);
   147		if (!vector_base) {
   148			ret = -ENOMEM;
   149			goto out_disable;
   150		}
 > 151		addr_num = (int)ub_intr_addr_count(uent);
   152		addr_base = ub_intr_map_region(uent, UB_INTR_ADDR_TBL, addr_num);
   153		if (!addr_base) {
   154			iounmap(vector_base);
   155			ret = -ENOMEM;
   156			goto out_disable;
   157		}
   158		uent->intr_vector_base = vector_base;
   159		uent->intr_addr_base = addr_base;
   160	
   161		ret = usi_setup_interrupts(uent, entries, nvec, affd);
   162		if (ret)
   163			goto out_disable;
   164	
   165		ub_cfg_write_byte(uent, UB_INT_MASK, 0);
   166		ub_cfg_write_byte(uent, UB_INT_EN, 1);
   167	
   168		return 0;
   169	
   170	out_disable:
   171		uent->intr_enabled = 0;
   172	
   173		return ret;
   174	}
   175	
   176	static int ub_msi_supported(struct ub_entity *uent, int nvec)
   177	{
   178		if (!uent || uent->no_intr || nvec < 1)
   179			return 0;
   180	
   181		return 1;
   182	}
   183	
   184	static int ub_usi_entry_invalid_check(struct ub_usi_entry *ents,
   185					      int nvec, int nr_ents)
   186	{
   187		int i, j;
   188	
   189		if (!ents)
   190			return 0;
   191	
   192		for (i = 0; i < nvec; i++) {
   193			if (ents[i].entry >= nr_ents)
   194				return -EINVAL;
   195	
   196			for (j = i + 1; j < nvec; j++)
   197				if (ents[i].entry == ents[j].entry)
   198					return -EINVAL;
   199		}
   200	
   201		return 0;
   202	}
   203	
   204	static int __ub_enable_usi_range(struct ub_entity *uent,
   205					 struct ub_usi_entry *entries, int minvec,
   206					 int maxvec, struct irq_affinity *affd)
   207	{
   208		int hwsize, nvec = maxvec;
   209		int ret;
   210	
   211		if (maxvec < minvec)
   212			return -ERANGE;
   213	
   214		if (!ub_msi_supported(uent, nvec))
   215			return -EINVAL;
   216	
   217		if (uent->intr_type1)
   218			hwsize = (int)ub_int_type1_vec_count(uent);
   219		else
   220			hwsize = (int)ub_intr_vec_count(uent);
   221		if (hwsize == 0) {
   222			ub_err(uent, "int vector cnt is zero.\n");
   223			return -ENOSPC;
   224		}
   225	
   226		ret = ub_usi_entry_invalid_check(entries, nvec, hwsize);
   227		if (ret)
   228			return ret;
   229	
   230		if (hwsize < nvec)
   231			nvec = hwsize;
   232		if (nvec < minvec)
   233			return -ENOSPC;
   234	
 > 235		ret = ub_setup_msi_context(uent);
   236		if (ret)
   237			return ret;
   238	
 > 239		if (!ub_setup_usi_device_domain(uent, hwsize)) {
   240			ub_err(uent, "ub setup device domain failed.\n");
   241			return -ENODEV;
   242		}
   243	
   244		if (affd) {
   245			nvec = ub_irq_calc_affinity_vectors(minvec, nvec, affd);
   246			if (nvec < minvec) {
   247				ub_err(uent, "irq calc affd failed.\n");
   248				return -ENOSPC;
   249			}
   250		}
   251	
   252		if (uent->intr_type1)
   253			ret = int_type1_capability_init(uent, entries, nvec, affd);
   254		else
   255			ret = int_type2_capability_init(uent, entries, nvec, affd);
   256		if (ret)
   257			return ret;
   258	
   259		return nvec;
   260	}
   261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
