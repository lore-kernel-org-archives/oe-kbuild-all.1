Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ED6246788
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 23:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768519886; cv=none; b=n28MPIauzZCHv7Rvdcckl+/faijQpL5xsVu51bddv7w5UuB9/4aN6Gh68GCaxJ290lR3zF0cs6veRcqONRULW0BRA4O1tAQbuDKTXZHc2KvUHnFrEwzdOu1dzNoOShx1y2XjbvUKRUtEkPm2so/UafHZCc/FBHNjg0qhUSA3DQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768519886; c=relaxed/simple;
	bh=+sF+LXRJFAUS0lgFlvkzRgV1YXa62fH3bSmyIxVFTj8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tu3YFTMIVZguWqx62PXq5ySLZP1YSM+aotiP2ApYsE22SRLLJYGP9T6a+8nfs5/GS/8NfMFJaJviO+A6+I/nkZ2Vl2nICQ/k80SymuYSqm8zTNVnTLxcBHM1eY/DY6aI+GzSFZGpvrJiAEqeDNxiCNVHICAAJmuRxifQkgsd9RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FQR97ce8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FQR97ce8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768519885; x=1800055885;
  h=date:from:to:cc:subject:message-id;
  bh=+sF+LXRJFAUS0lgFlvkzRgV1YXa62fH3bSmyIxVFTj8=;
  b=FQR97ce8bVrNks4MdH6zvHeOSaBTmqa+8eGUZ52/psJINqOvWScvEUBW
   +5MMr0+Icq5+oWwazdlHy29tQdLeo+uU9oNGRTymWohrIHJU6N93ilBEX
   Nc398BnlhcKFmDrANaQ0OgUUWdKngyPVwjDLtNs584IgsRw8+wKNkIbbX
   j1NlVO1Szelujw5A97YbK9Fn/pckTCB6swquRuewHHzIFPq2UuNE5udrZ
   5Zl11CZcJK5KtVJkM89pWOO+Bb5czAxSsBAfoJOWumIODO9u5Pc3/IsmA
   ZFH9NmRZYkfD9IBjtXAvpcqPCLcianpteK5N6IyfY6bfMKuX55Q4yKEc8
   A==;
X-CSE-ConnectionGUID: A1+JnePZSaOeVuGrRCjBbg==
X-CSE-MsgGUID: vzFAnvf6RB6xVuICv1RGAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="87413236"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="87413236"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 15:31:24 -0800
X-CSE-ConnectionGUID: 80NeeYjJRAGyN1UXVyfLjw==
X-CSE-MsgGUID: 62YQbmfVSQSvXUG+MmvWrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="204704660"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Jan 2026 15:31:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgWoB-00000000K6i-1tEU;
	Thu, 15 Jan 2026 23:31:19 +0000
Date: Fri, 16 Jan 2026 07:30:21 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:b4/gicv5-host-acpi 6/7]
 drivers/irqchip/irq-gic-v5-its.c:1254:22: error: invalid use of undefined
 type 'struct acpi_madt_gicv5_translate_frame'
Message-ID: <202601160706.8uEmzmN0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git b4/gicv5-host-acpi
head:   8b07899770499d7cb5236cda6c96c702d2ad3d92
commit: 27ecb5ebf1ed26b046315b6eb06a66d13fb1fc3a [6/7] irqchip/gic-v5: Add ACPI ITS probing
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260116/202601160706.8uEmzmN0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160706.8uEmzmN0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160706.8uEmzmN0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-gic-v5-its.c: In function 'gic_acpi_parse_madt_its_translate':
>> drivers/irqchip/irq-gic-v5-its.c:1254:22: error: invalid use of undefined type 'struct acpi_madt_gicv5_translate_frame'
    1254 |         if (its_frame->linked_translator_id != current_its_entry->translator_id)
         |                      ^~
>> drivers/irqchip/irq-gic-v5-its.c:1254:65: error: invalid use of undefined type 'struct acpi_madt_gicv5_translator'
    1254 |         if (its_frame->linked_translator_id != current_its_entry->translator_id)
         |                                                                 ^~
   drivers/irqchip/irq-gic-v5-its.c:1257:30: error: invalid use of undefined type 'struct acpi_madt_gicv5_translate_frame'
    1257 |         res.start = its_frame->base_address;
         |                              ^~
   drivers/irqchip/irq-gic-v5-its.c:1258:28: error: invalid use of undefined type 'struct acpi_madt_gicv5_translate_frame'
    1258 |         res.end = its_frame->base_address + ACPI_GICV5_ITS_MEM_SIZE - 1;
         |                            ^~
   drivers/irqchip/irq-gic-v5-its.c:1268:51: error: invalid use of undefined type 'struct acpi_madt_gicv5_translate_frame'
    1268 |         err = iort_register_domain_token(its_frame->translate_frame_id, res.start,
         |                                                   ^~
   In file included from include/asm-generic/bug.h:31,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/arm64/include/asm/preempt.h:5,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:14,
                    from drivers/irqchip/irq-gic-v5-its.c:8:
   drivers/irqchip/irq-gic-v5-its.c:1272:45: error: invalid use of undefined type 'struct acpi_madt_gicv5_translate_frame'
    1272 |                        &res.start, its_frame->translate_frame_id);
         |                                             ^~
   include/linux/printk.h:484:33: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:555:9: note: in expansion of macro 'printk'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/irqchip/irq-gic-v5-its.c:1271:17: note: in expansion of macro 'pr_err'
    1271 |                 pr_err("ITS@%pa: Unable to register GICv5 ITS domain token (ITS TRANSLATE FRAME ID %d) to IORT\n",
         |                 ^~~~~~
   drivers/irqchip/irq-gic-v5-its.c: In function 'gic_acpi_free_madt_its_translate':
   drivers/irqchip/irq-gic-v5-its.c:1287:22: error: invalid use of undefined type 'struct acpi_madt_gicv5_translate_frame'
    1287 |         if (its_frame->linked_translator_id != current_its_entry->translator_id)
         |                      ^~
   drivers/irqchip/irq-gic-v5-its.c:1287:65: error: invalid use of undefined type 'struct acpi_madt_gicv5_translator'
    1287 |         if (its_frame->linked_translator_id != current_its_entry->translator_id)
         |                                                                 ^~
   drivers/irqchip/irq-gic-v5-its.c:1290:58: error: invalid use of undefined type 'struct acpi_madt_gicv5_translate_frame'
    1290 |         msi_dom_handle = iort_find_domain_token(its_frame->translate_frame_id);
         |                                                          ^~
   drivers/irqchip/irq-gic-v5-its.c:1294:47: error: invalid use of undefined type 'struct acpi_madt_gicv5_translate_frame'
    1294 |         iort_deregister_domain_token(its_frame->translate_frame_id);
         |                                               ^~
   drivers/irqchip/irq-gic-v5-its.c: In function 'gic_acpi_parse_madt_its':
   drivers/irqchip/irq-gic-v5-its.c:1310:30: error: invalid use of undefined type 'struct acpi_madt_gicv5_translator'
    1310 |         res.start = its_entry->base_address;
         |                              ^~
   drivers/irqchip/irq-gic-v5-its.c:1311:28: error: invalid use of undefined type 'struct acpi_madt_gicv5_translator'
    1311 |         res.end = its_entry->base_address + ACPI_GICV5_ITS_MEM_SIZE - 1;
         |                            ^~
>> drivers/irqchip/irq-gic-v5-its.c:1328:31: error: 'ACPI_MADT_TYPE_GICV5_ITS_TRANSLATE' undeclared (first use in this function); did you mean 'ACPI_MADT_TYPE_GENERIC_TRANSLATOR'?
    1328 |         acpi_table_parse_madt(ACPI_MADT_TYPE_GICV5_ITS_TRANSLATE,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               ACPI_MADT_TYPE_GENERIC_TRANSLATOR
   drivers/irqchip/irq-gic-v5-its.c:1328:31: note: each undeclared identifier is reported only once for each function it appears in
   drivers/irqchip/irq-gic-v5-its.c:1338:45: error: invalid use of undefined type 'struct acpi_madt_gicv5_translator'
    1338 |                                    its_entry->flags & ACPI_MADT_GICV5_ITS_NON_COHERENT);
         |                                             ^~
>> drivers/irqchip/irq-gic-v5-its.c:1338:55: error: 'ACPI_MADT_GICV5_ITS_NON_COHERENT' undeclared (first use in this function); did you mean 'ACPI_MADT_ITS_NON_COHERENT'?
    1338 |                                    its_entry->flags & ACPI_MADT_GICV5_ITS_NON_COHERENT);
         |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                       ACPI_MADT_ITS_NON_COHERENT
   drivers/irqchip/irq-gic-v5-its.c: In function 'gicv5_its_acpi_probe':
>> drivers/irqchip/irq-gic-v5-its.c:1357:31: error: 'ACPI_MADT_TYPE_GICV5_ITS' undeclared (first use in this function); did you mean 'ACPI_MADT_TYPE_IMSIC'?
    1357 |         acpi_table_parse_madt(ACPI_MADT_TYPE_GICV5_ITS, gic_acpi_parse_madt_its, 0);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
         |                               ACPI_MADT_TYPE_IMSIC


vim +1254 drivers/irqchip/irq-gic-v5-its.c

  1244	
  1245	static int __init gic_acpi_parse_madt_its_translate(union acpi_subtable_headers *header,
  1246							    const unsigned long end)
  1247	{
  1248		struct acpi_madt_gicv5_translate_frame *its_frame;
  1249		struct fwnode_handle *msi_dom_handle;
  1250		struct resource res = {};
  1251		int err;
  1252	
  1253		its_frame = (struct acpi_madt_gicv5_translate_frame *)header;
> 1254		if (its_frame->linked_translator_id != current_its_entry->translator_id)
  1255			return 0;
  1256	
  1257		res.start = its_frame->base_address;
  1258		res.end = its_frame->base_address + ACPI_GICV5_ITS_MEM_SIZE - 1;
  1259		res.flags = IORESOURCE_MEM;
  1260	
  1261		msi_dom_handle = irq_domain_alloc_parented_fwnode(&res.start, current_its_fwnode);
  1262		if (!msi_dom_handle) {
  1263			pr_err("ITS@%pa: Unable to allocate GICv5 ITS translate domain token\n",
  1264			       &res.start);
  1265			return -ENOMEM;
  1266		}
  1267	
  1268		err = iort_register_domain_token(its_frame->translate_frame_id, res.start,
  1269						 msi_dom_handle);
  1270		if (err) {
  1271			pr_err("ITS@%pa: Unable to register GICv5 ITS domain token (ITS TRANSLATE FRAME ID %d) to IORT\n",
  1272			       &res.start, its_frame->translate_frame_id);
  1273			irq_domain_free_fwnode(msi_dom_handle);
  1274			return err;
  1275		}
  1276	
  1277		return 0;
  1278	}
  1279	
  1280	static int __init gic_acpi_free_madt_its_translate(union acpi_subtable_headers *header,
  1281							   const unsigned long end)
  1282	{
  1283		struct acpi_madt_gicv5_translate_frame *its_frame;
  1284		struct fwnode_handle *msi_dom_handle;
  1285	
  1286		its_frame = (struct acpi_madt_gicv5_translate_frame *)header;
  1287		if (its_frame->linked_translator_id != current_its_entry->translator_id)
  1288			return 0;
  1289	
  1290		msi_dom_handle = iort_find_domain_token(its_frame->translate_frame_id);
  1291		if (!msi_dom_handle)
  1292			return 0;
  1293	
  1294		iort_deregister_domain_token(its_frame->translate_frame_id);
  1295		irq_domain_free_fwnode(msi_dom_handle);
  1296	
  1297		return 0;
  1298	}
  1299	
  1300	static int __init gic_acpi_parse_madt_its(union acpi_subtable_headers *header,
  1301						  const unsigned long end)
  1302	{
  1303		struct acpi_madt_gicv5_translator *its_entry;
  1304		struct fwnode_handle *dom_handle;
  1305		struct resource res = {};
  1306		void __iomem *its_base;
  1307		int err;
  1308	
  1309		its_entry = (struct acpi_madt_gicv5_translator *)header;
> 1310		res.start = its_entry->base_address;
  1311		res.end = its_entry->base_address + ACPI_GICV5_ITS_MEM_SIZE - 1;
  1312		res.flags = IORESOURCE_MEM;
  1313	
  1314		if (!request_mem_region(res.start, resource_size(&res), "GICv5 ITS"))
  1315			return -EBUSY;
  1316	
  1317		dom_handle = irq_domain_alloc_fwnode(&res.start);
  1318		if (!dom_handle) {
  1319			pr_err("ITS@%pa: Unable to allocate GICv5 ITS domain token\n",
  1320			       &res.start);
  1321			err = -ENOMEM;
  1322			goto out_rel_res;
  1323		}
  1324	
  1325		current_its_entry = its_entry;
  1326		current_its_fwnode = dom_handle;
  1327	
> 1328		acpi_table_parse_madt(ACPI_MADT_TYPE_GICV5_ITS_TRANSLATE,
  1329				      gic_acpi_parse_madt_its_translate, 0);
  1330	
  1331		its_base = ioremap(res.start, ACPI_GICV5_ITS_MEM_SIZE);
  1332		if (!its_base) {
  1333			err = -ENOMEM;
  1334			goto out_unregister;
  1335		}
  1336	
  1337		err = gicv5_its_init_bases(its_base, dom_handle, gicv5_global_data.lpi_domain,
> 1338					   its_entry->flags & ACPI_MADT_GICV5_ITS_NON_COHERENT);
  1339		if (err)
  1340			goto out_unmap;
  1341	
  1342		return 0;
  1343	
  1344	out_unmap:
  1345		iounmap(its_base);
  1346	out_unregister:
  1347		acpi_table_parse_madt(ACPI_MADT_TYPE_GICV5_ITS_TRANSLATE,
  1348				      gic_acpi_free_madt_its_translate, 0);
  1349		irq_domain_free_fwnode(dom_handle);
  1350	out_rel_res:
  1351		release_mem_region(res.start, resource_size(&res));
  1352		return err;
  1353	}
  1354	
  1355	void __init gicv5_its_acpi_probe(void)
  1356	{
> 1357		acpi_table_parse_madt(ACPI_MADT_TYPE_GICV5_ITS, gic_acpi_parse_madt_its, 0);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
