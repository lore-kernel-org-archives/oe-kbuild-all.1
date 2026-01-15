Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A788332572D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 21:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768514302; cv=none; b=U+60wOhsRIJDMhZ6Y8/lXdPkFtpspDskqChGIWKMNR+SXERfq9W7ttnP1fXXB6HZC1OLNUiSrhVMeGiu0xr9yW5dn89JX9MAtG7ZcSqdaZyLZpnbf9LUvS2iA/O9fL+eoNk0MN0JvZNQptAbRqZc4JMqHXWdzZWOxVxS05gbgOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768514302; c=relaxed/simple;
	bh=V+n6aM75OHhDJh3i8/rT2Gz2+mI52kyJVnP1ldFC2GI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VD8MeS9r+py53PcfRP69SlQQLgQMONL+Oj4N2IUAwIlLzSXxdGyOmJllU9NX1zOV2yGd3MOZbGgiolpZcfy8rj+Cz94XxyfNIYT/qcrSpXhM+ZVzvrGU5xQuTJwQ61BggrWx709mG3Ydr1scVa0n/g3xF/HROi/S5mX+i6JhfFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TK6/0ZgG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TK6/0ZgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768514301; x=1800050301;
  h=date:from:to:cc:subject:message-id;
  bh=V+n6aM75OHhDJh3i8/rT2Gz2+mI52kyJVnP1ldFC2GI=;
  b=TK6/0ZgGJSSSnAlRD2z6F8ZBGzIQ8WR3EG0k2XoHFn0UuLncdygNHaKp
   E7OyCgIR12KqZjnHyoPxY9bB/zx5AOdAQjohW/pf7fzPQpJdpODzzseba
   vQdw8FhA4hoJOk1J8DAVtdy2uY/sxq5TdYrUKu13fhaG4LXLl6OFvQDyV
   4eWhswJPC2AfMKHyqLVnZOE373jbmIJulFVrFE1jfb06DV4RojOYDjaMU
   UpncWNJ/7lC7Z0L07uFy7/GReljvlzXGQ9cDIUb3hYOOplvu6rmKve7MJ
   6KU1wgE0mwRn3SnoQwh0HyyGfqCLr4EcjssT1jnk0e5Fye3DJfHZky2dA
   w==;
X-CSE-ConnectionGUID: pCRHQ2KMSD+Q2CnG2h/SvA==
X-CSE-MsgGUID: C1bPLuJdQs26vR8La3DYBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69735550"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="69735550"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 13:58:19 -0800
X-CSE-ConnectionGUID: bilzXQ0RQ+KjFf+bDbbM6g==
X-CSE-MsgGUID: zHixdotsSgSeR/onwT5GgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="209930205"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jan 2026 13:58:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgVM7-00000000K2T-0kPz;
	Thu, 15 Jan 2026 21:58:15 +0000
Date: Fri, 16 Jan 2026 05:57:25 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:b4/gicv5-host-acpi 5/7]
 drivers/irqchip/irq-gic-v5.c:1183:13: error: incomplete definition of type
 'struct acpi_madt_gicv5_irs'
Message-ID: <202601160515.sTlC1Am6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git b4/gicv5-host-acpi
head:   8b07899770499d7cb5236cda6c96c702d2ad3d92
commit: c15ba343a84abda6d35dff54678fb7a375882351 [5/7] irqchip/gic-v5: Add ACPI IRS probing
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260116/202601160515.sTlC1Am6-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160515.sTlC1Am6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160515.sTlC1Am6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v5.c:1183:13: error: incomplete definition of type 'struct acpi_madt_gicv5_irs'
    1183 |         return (irs->version == ape->driver_data);
         |                 ~~~^
   drivers/irqchip/irq-gic-v5.c:1181:9: note: forward declaration of 'struct acpi_madt_gicv5_irs'
    1181 |         struct acpi_madt_gicv5_irs *irs = (struct acpi_madt_gicv5_irs *)header;
         |                ^
   drivers/irqchip/irq-gic-v5.c:1201:50: error: incomplete definition of type 'struct acpi_madt_gicv5_irs'
    1201 |         gsi_domain_handle = irq_domain_alloc_fwnode(&irs->config_base_address);
         |                                                      ~~~^
   drivers/irqchip/irq-gic-v5.c:1195:9: note: forward declaration of 'struct acpi_madt_gicv5_irs'
    1195 |         struct acpi_madt_gicv5_irs *irs = (struct acpi_madt_gicv5_irs *)header;
         |                ^
>> drivers/irqchip/irq-gic-v5.c:1223:30: error: use of undeclared identifier 'ACPI_MADT_TYPE_GICV5_IRS'
    1223 | IRQCHIP_ACPI_DECLARE(gic_v5, ACPI_MADT_TYPE_GICV5_IRS,
         |                              ^
>> drivers/irqchip/irq-gic-v5.c:1224:33: error: use of undeclared identifier 'ACPI_MADT_GIC_VERSION_V5'
    1224 |                      acpi_validate_gic_table, ACPI_MADT_GIC_VERSION_V5,
         |                                               ^
   4 errors generated.
--
>> drivers/irqchip/irq-gic-v5-irs.c:854:12: error: no member named 'irs_id' in 'struct acpi_madt_generic_interrupt'
     854 |         if (gicc->irs_id != current_irsid)
         |             ~~~~  ^
>> drivers/irqchip/irq-gic-v5-irs.c:859:12: error: no member named 'iaffid' in 'struct acpi_madt_generic_interrupt'
     859 |         if (gicc->iaffid & ~GENMASK(current_iaffid_bits - 1, 0)) {
         |             ~~~~  ^
   drivers/irqchip/irq-gic-v5-irs.c:860:70: error: no member named 'iaffid' in 'struct acpi_madt_generic_interrupt'
     860 |                 pr_warn("CPU %d iaffid 0x%x exceeds IRS iaffid bits\n", cpu, gicc->iaffid);
         |                                                                              ~~~~  ^
   include/linux/printk.h:565:37: note: expanded from macro 'pr_warn'
     565 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                            ^~~~~~~~~~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/irqchip/irq-gic-v5-irs.c:865:42: error: no member named 'iaffid' in 'struct acpi_madt_generic_interrupt'
     865 |         per_cpu(cpu_iaffid, cpu).iaffid = gicc->iaffid;
         |                                           ~~~~  ^
>> drivers/irqchip/irq-gic-v5-irs.c:918:28: error: incomplete definition of type 'struct acpi_madt_gicv5_irs'
     918 |         r = gic_request_region(irs->config_base_address, ACPI_GICV5_IRS_MEM_SIZE, "GICv5 IRS");
         |                                ~~~^
   drivers/irqchip/irq-gic-v5-irs.c:904:9: note: forward declaration of 'struct acpi_madt_gicv5_irs'
     904 |         struct acpi_madt_gicv5_irs *irs = (struct acpi_madt_gicv5_irs *)header;
         |                ^
   drivers/irqchip/irq-gic-v5-irs.c:924:24: error: incomplete definition of type 'struct acpi_madt_gicv5_irs'
     924 |         irs_base = ioremap(irs->config_base_address, ACPI_GICV5_IRS_MEM_SIZE);
         |                            ~~~^
   drivers/irqchip/irq-gic-v5-irs.c:904:9: note: forward declaration of 'struct acpi_madt_gicv5_irs'
     904 |         struct acpi_madt_gicv5_irs *irs = (struct acpi_madt_gicv5_irs *)header;
         |                ^
   drivers/irqchip/irq-gic-v5-irs.c:931:46: error: incomplete definition of type 'struct acpi_madt_gicv5_irs'
     931 |         gicv5_irs_init_bases(irs_data, irs_base, irs->flags & ACPI_MADT_IRS_NON_COHERENT);
         |                                                  ~~~^
   drivers/irqchip/irq-gic-v5-irs.c:904:9: note: forward declaration of 'struct acpi_madt_gicv5_irs'
     904 |         struct acpi_madt_gicv5_irs *irs = (struct acpi_madt_gicv5_irs *)header;
         |                ^
>> drivers/irqchip/irq-gic-v5-irs.c:931:56: error: use of undeclared identifier 'ACPI_MADT_IRS_NON_COHERENT'
     931 |         gicv5_irs_init_bases(irs_data, irs_base, irs->flags & ACPI_MADT_IRS_NON_COHERENT);
         |                                                               ^
   drivers/irqchip/irq-gic-v5-irs.c:933:34: error: incomplete definition of type 'struct acpi_madt_gicv5_irs'
     933 |         gicv5_irs_acpi_init_affinity(irs->irs_id, irs_data);
         |                                      ~~~^
   drivers/irqchip/irq-gic-v5-irs.c:904:9: note: forward declaration of 'struct acpi_madt_gicv5_irs'
     904 |         struct acpi_madt_gicv5_irs *irs = (struct acpi_madt_gicv5_irs *)header;
         |                ^
   drivers/irqchip/irq-gic-v5-irs.c:940:62: error: incomplete definition of type 'struct acpi_madt_gicv5_irs'
     940 |                 pr_info("%s @%llx detected SPI range [%u-%u]\n", "IRS", irs->config_base_address,
         |                                                                         ~~~^
   include/linux/printk.h:585:34: note: expanded from macro 'pr_info'
     585 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                         ^~~~~~~~~~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/irqchip/irq-gic-v5-irs.c:904:9: note: forward declaration of 'struct acpi_madt_gicv5_irs'
     904 |         struct acpi_madt_gicv5_irs *irs = (struct acpi_madt_gicv5_irs *)header;
         |                ^
>> drivers/irqchip/irq-gic-v5-irs.c:959:24: error: use of undeclared identifier 'ACPI_MADT_TYPE_GICV5_IRS'
     959 |         acpi_table_parse_madt(ACPI_MADT_TYPE_GICV5_IRS, gic_acpi_parse_madt_irs, 0);
         |                               ^
   11 errors generated.


vim +1183 drivers/irqchip/irq-gic-v5.c

  1176	
  1177	#ifdef CONFIG_ACPI
  1178	static bool __init acpi_validate_gic_table(struct acpi_subtable_header *header,
  1179						   struct acpi_probe_entry *ape)
  1180	{
  1181		struct acpi_madt_gicv5_irs *irs = (struct acpi_madt_gicv5_irs *)header;
  1182	
> 1183		return (irs->version == ape->driver_data);
  1184	}
  1185	
  1186	static struct fwnode_handle *gsi_domain_handle;
  1187	
  1188	static struct fwnode_handle *gic_v5_get_gsi_domain_id(u32 gsi)
  1189	{
  1190		return gsi_domain_handle;
  1191	}
  1192	
  1193	static int __init gic_acpi_init(union acpi_subtable_headers *header, const unsigned long end)
  1194	{
  1195		struct acpi_madt_gicv5_irs *irs = (struct acpi_madt_gicv5_irs *)header;
  1196		int ret;
  1197	
  1198		if (gsi_domain_handle)
  1199			return 0;
  1200	
  1201		gsi_domain_handle = irq_domain_alloc_fwnode(&irs->config_base_address);
  1202		if (!gsi_domain_handle)
  1203			return -ENOMEM;
  1204	
  1205		ret = gicv5_irs_acpi_probe();
  1206		if (ret)
  1207			goto out_fwnode;
  1208	
  1209		ret = gicv5_init_common(gsi_domain_handle);
  1210		if (ret)
  1211			goto out_irs;
  1212	
  1213		acpi_set_irq_model(ACPI_IRQ_MODEL_GIC_V5, gic_v5_get_gsi_domain_id);
  1214	
  1215		return 0;
  1216	
  1217	out_irs:
  1218		gicv5_irs_remove();
  1219	out_fwnode:
  1220		irq_domain_free_fwnode(gsi_domain_handle);
  1221		return ret;
  1222	}
> 1223	IRQCHIP_ACPI_DECLARE(gic_v5, ACPI_MADT_TYPE_GICV5_IRS,
> 1224			     acpi_validate_gic_table, ACPI_MADT_GIC_VERSION_V5,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
