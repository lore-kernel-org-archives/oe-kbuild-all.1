Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41702E0925
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 19:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768507107; cv=none; b=JSNzeLccY2olizzG1XyNrjqwj0RHDVkwWcqnMxevzbGrk6SOFEZ9WOqt46RaOcuFRP0UWZAomjseFyS4FUiikIglL3sd8sf/MW/b3VM0H+IlehC5phCoxvUP4eXUN8S+SeVF6Nd2pD92esYw8Mbr7JKluhdjcketVpvD49jRdmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768507107; c=relaxed/simple;
	bh=ofas9oNHTgd81iXawRN0ZiSf2p/lUoY5pXEENXmeb8M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R4Hm/lHlttz5FRf2zIRsKpULECmfNKi1I6bOuIYgrmaYN9FZpHk00ETTrfO4ogdfxo6nAOUHTGTya3OS29Ba4DokbSDXTTkCPe3Nk0OsYl+UlvVEMA7PrhnWNG75hg6aHVAqxhP88GdTRrrlL98XvweW+7sC1pRjIdjJ8PsB+3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVSun/mg; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVSun/mg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768507106; x=1800043106;
  h=date:from:to:cc:subject:message-id;
  bh=ofas9oNHTgd81iXawRN0ZiSf2p/lUoY5pXEENXmeb8M=;
  b=WVSun/mgmhUuE7XeGv09hzEnPrcRrgKARQjTgtU3+8ztxa3G3J5LQPG5
   5/qqA2HItdh4kqCVStEybmb8CoQHj6AZF+hOd6Lc3pLQAOTVZgUktOkxS
   vUFCyGXyvdVg/sOTTPZbImQwP2euowXN4tZzizJPW4fOprmH3XeF5UdOf
   0v7yeig60PUwgVtJFuzmQertqu/6FM3bXNz6Ll6tBuBpM5kuZiVnN80hw
   jyqEnhlbuOGb6F8xIwWp5/yKMSD8wyHyYeMEMyYgjE5rktSI05ai1PMeo
   /d69M+EegTc5Yly4d6qIYqYWuttJqSaDnURA+hC+wTRTfh2TpX9iCYu/v
   g==;
X-CSE-ConnectionGUID: r+V8tNvHQH6XVPCfOGHK+Q==
X-CSE-MsgGUID: yB744r+rRliFjHv1HPf/bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="87399315"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="87399315"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 11:58:15 -0800
X-CSE-ConnectionGUID: WCLMgzBrSuuFcKTfBmtADA==
X-CSE-MsgGUID: iRRBYy+dQGiWnEKAr/WIGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="242588208"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Jan 2026 11:58:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgTTu-00000000JwP-22a3;
	Thu, 15 Jan 2026 19:58:10 +0000
Date: Fri, 16 Jan 2026 03:57:23 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:b4/gicv5-host-acpi 5/7]
 drivers/irqchip/irq-gic-v5.c:1183:20: error: invalid use of undefined type
 'struct acpi_madt_gicv5_irs'
Message-ID: <202601160313.GpEn4OLj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git b4/gicv5-host-acpi
head:   8b07899770499d7cb5236cda6c96c702d2ad3d92
commit: c15ba343a84abda6d35dff54678fb7a375882351 [5/7] irqchip/gic-v5: Add ACPI IRS probing
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260116/202601160313.GpEn4OLj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160313.GpEn4OLj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160313.GpEn4OLj-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-gic-v5.c: In function 'acpi_validate_gic_table':
>> drivers/irqchip/irq-gic-v5.c:1183:20: error: invalid use of undefined type 'struct acpi_madt_gicv5_irs'
    1183 |         return (irs->version == ape->driver_data);
         |                    ^~
   drivers/irqchip/irq-gic-v5.c: In function 'gic_acpi_init':
   drivers/irqchip/irq-gic-v5.c:1201:57: error: invalid use of undefined type 'struct acpi_madt_gicv5_irs'
    1201 |         gsi_domain_handle = irq_domain_alloc_fwnode(&irs->config_base_address);
         |                                                         ^~
   In file included from include/linux/irqchip.h:14,
                    from drivers/irqchip/irq-gic-v5.c:14:
   drivers/irqchip/irq-gic-v5.c: At top level:
>> drivers/irqchip/irq-gic-v5.c:1223:30: error: 'ACPI_MADT_TYPE_GICV5_IRS' undeclared here (not in a function); did you mean 'ACPI_MADT_TYPE_IMSIC'?
    1223 | IRQCHIP_ACPI_DECLARE(gic_v5, ACPI_MADT_TYPE_GICV5_IRS,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:1407:33: note: in definition of macro 'ACPI_DECLARE_SUBTABLE_PROBE_ENTRY'
    1407 |                         .type = subtable,                               \
         |                                 ^~~~~~~~
   drivers/irqchip/irq-gic-v5.c:1223:1: note: in expansion of macro 'IRQCHIP_ACPI_DECLARE'
    1223 | IRQCHIP_ACPI_DECLARE(gic_v5, ACPI_MADT_TYPE_GICV5_IRS,
         | ^~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-gic-v5.c:1224:47: error: 'ACPI_MADT_GIC_VERSION_V5' undeclared here (not in a function); did you mean 'ACPI_MADT_GIC_VERSION_V4'?
    1224 |                      acpi_validate_gic_table, ACPI_MADT_GIC_VERSION_V5,
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:1410:40: note: in definition of macro 'ACPI_DECLARE_SUBTABLE_PROBE_ENTRY'
    1410 |                         .driver_data = data,                            \
         |                                        ^~~~
   drivers/irqchip/irq-gic-v5.c:1223:1: note: in expansion of macro 'IRQCHIP_ACPI_DECLARE'
    1223 | IRQCHIP_ACPI_DECLARE(gic_v5, ACPI_MADT_TYPE_GICV5_IRS,
         | ^~~~~~~~~~~~~~~~~~~~
--
   drivers/irqchip/irq-gic-v5-irs.c: In function 'gic_acpi_parse_iaffid':
>> drivers/irqchip/irq-gic-v5-irs.c:854:17: error: 'struct acpi_madt_generic_interrupt' has no member named 'irs_id'
     854 |         if (gicc->irs_id != current_irsid)
         |                 ^~
>> drivers/irqchip/irq-gic-v5-irs.c:859:17: error: 'struct acpi_madt_generic_interrupt' has no member named 'iaffid'
     859 |         if (gicc->iaffid & ~GENMASK(current_iaffid_bits - 1, 0)) {
         |                 ^~
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
                    from drivers/irqchip/irq-gic-v5-irs.c:8:
   drivers/irqchip/irq-gic-v5-irs.c:860:82: error: 'struct acpi_madt_generic_interrupt' has no member named 'iaffid'
     860 |                 pr_warn("CPU %d iaffid 0x%x exceeds IRS iaffid bits\n", cpu, gicc->iaffid);
         |                                                                                  ^~
   include/linux/printk.h:484:33: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:565:9: note: in expansion of macro 'printk'
     565 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/irqchip/irq-gic-v5-irs.c:860:17: note: in expansion of macro 'pr_warn'
     860 |                 pr_warn("CPU %d iaffid 0x%x exceeds IRS iaffid bits\n", cpu, gicc->iaffid);
         |                 ^~~~~~~
   drivers/irqchip/irq-gic-v5-irs.c:865:47: error: 'struct acpi_madt_generic_interrupt' has no member named 'iaffid'
     865 |         per_cpu(cpu_iaffid, cpu).iaffid = gicc->iaffid;
         |                                               ^~
   drivers/irqchip/irq-gic-v5-irs.c: In function 'gic_acpi_parse_madt_irs':
>> drivers/irqchip/irq-gic-v5-irs.c:918:35: error: invalid use of undefined type 'struct acpi_madt_gicv5_irs'
     918 |         r = gic_request_region(irs->config_base_address, ACPI_GICV5_IRS_MEM_SIZE, "GICv5 IRS");
         |                                   ^~
   drivers/irqchip/irq-gic-v5-irs.c:924:31: error: invalid use of undefined type 'struct acpi_madt_gicv5_irs'
     924 |         irs_base = ioremap(irs->config_base_address, ACPI_GICV5_IRS_MEM_SIZE);
         |                               ^~
   drivers/irqchip/irq-gic-v5-irs.c:931:53: error: invalid use of undefined type 'struct acpi_madt_gicv5_irs'
     931 |         gicv5_irs_init_bases(irs_data, irs_base, irs->flags & ACPI_MADT_IRS_NON_COHERENT);
         |                                                     ^~
>> drivers/irqchip/irq-gic-v5-irs.c:931:63: error: 'ACPI_MADT_IRS_NON_COHERENT' undeclared (first use in this function); did you mean 'ACPI_MADT_ITS_NON_COHERENT'?
     931 |         gicv5_irs_init_bases(irs_data, irs_base, irs->flags & ACPI_MADT_IRS_NON_COHERENT);
         |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                               ACPI_MADT_ITS_NON_COHERENT
   drivers/irqchip/irq-gic-v5-irs.c:931:63: note: each undeclared identifier is reported only once for each function it appears in
   drivers/irqchip/irq-gic-v5-irs.c:933:41: error: invalid use of undefined type 'struct acpi_madt_gicv5_irs'
     933 |         gicv5_irs_acpi_init_affinity(irs->irs_id, irs_data);
         |                                         ^~
   drivers/irqchip/irq-gic-v5-irs.c:940:76: error: invalid use of undefined type 'struct acpi_madt_gicv5_irs'
     940 |                 pr_info("%s @%llx detected SPI range [%u-%u]\n", "IRS", irs->config_base_address,
         |                                                                            ^~
   include/linux/printk.h:484:33: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:585:9: note: in expansion of macro 'printk'
     585 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/irqchip/irq-gic-v5-irs.c:940:17: note: in expansion of macro 'pr_info'
     940 |                 pr_info("%s @%llx detected SPI range [%u-%u]\n", "IRS", irs->config_base_address,
         |                 ^~~~~~~
   drivers/irqchip/irq-gic-v5-irs.c: In function 'gicv5_irs_acpi_probe':
>> drivers/irqchip/irq-gic-v5-irs.c:959:31: error: 'ACPI_MADT_TYPE_GICV5_IRS' undeclared (first use in this function); did you mean 'ACPI_MADT_TYPE_IMSIC'?
     959 |         acpi_table_parse_madt(ACPI_MADT_TYPE_GICV5_IRS, gic_acpi_parse_madt_irs, 0);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
         |                               ACPI_MADT_TYPE_IMSIC


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
