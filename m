Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B6C329375
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 02:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768531657; cv=none; b=VttoM22j/5hzQ1pJc05cqgnO6z3Wvpo4Ajv2a5v/i0Ax+W24cWUEeEGYghiRuNS8P3HyjcdwE53R3sQIWtA9dAWlq4Ce7WE1QKYx+fBu9Pzg0N3czX7pAdCS+KDxhamefHEWYUXVxZ99ryGrxbExgByyH/8jkkPJo1DycvYvObg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768531657; c=relaxed/simple;
	bh=bWX/7k6gxlBX1DYXnmnHx+afruQFMhmFuPMZ8QJ5R+Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ohsZrsVHlpRonN5cBSC55HGFwdwJexffgWu/LkNGnJrKbLczn/GFwXCQJPt9swQIKNIwSGRzHl6Q2X/PJTCh3YFGWkGdD3N7hOuLeOAXMOycnk965wUc/WzJPYkgNfcerKwg036h97fmr7JaGT/+RFwALdS0bOPhr4Fp6G/UsDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbov2ON8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbov2ON8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768531655; x=1800067655;
  h=date:from:to:cc:subject:message-id;
  bh=bWX/7k6gxlBX1DYXnmnHx+afruQFMhmFuPMZ8QJ5R+Y=;
  b=kbov2ON8VgOSCMhw57PkMNEUyFCyzAi1eaYnFLEDBJz5Lj0p6GVLUGD1
   huYg+mBeKUpetBB9N1oAv5aC+asgSAMo5hQ9CgGgUoZzorALgXWoQU47D
   465KqQRy8UubMyZ4piOYEWUxOLDxoPVCdAXnbArfTuAem+YdWDQcjaks1
   6harPw/2R70+18Zd9I7C9FjQsYmu8I7Mem8i6MtchanajeHREl+dv8Oxj
   FJPlQKcMT+WWnqDgqsleuOC4T2W5+vo6nqcKP3SkAtRHEIPfpTGJy+paz
   qsQR9Wn9kp6yaU4tmEIY85Y/RymHz1NItIYGrucwOZBK8s9LeU50P1ga0
   A==;
X-CSE-ConnectionGUID: 80aP12jYR0a8Y1jwSre0MA==
X-CSE-MsgGUID: SQ71poptTG6BXVsGCyizMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="81212649"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="81212649"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 18:47:33 -0800
X-CSE-ConnectionGUID: rQPI9opcRjeqw2P9bUO5HQ==
X-CSE-MsgGUID: moBKVTYhRaOw/SPze6DlWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="228167357"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Jan 2026 18:47:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgZs1-00000000KHc-2HE9;
	Fri, 16 Jan 2026 02:47:29 +0000
Date: Fri, 16 Jan 2026 10:46:49 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:b4/gicv5-host-acpi 6/7]
 drivers/irqchip/irq-gic-v5-its.c:1254:15: error: incomplete definition of
 type 'struct acpi_madt_gicv5_translate_frame'
Message-ID: <202601161043.a9KZjZYF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git b4/gicv5-host-acpi
head:   8b07899770499d7cb5236cda6c96c702d2ad3d92
commit: 27ecb5ebf1ed26b046315b6eb06a66d13fb1fc3a [6/7] irqchip/gic-v5: Add ACPI ITS probing
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260116/202601161043.a9KZjZYF-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161043.a9KZjZYF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161043.a9KZjZYF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v5-its.c:1254:15: error: incomplete definition of type 'struct acpi_madt_gicv5_translate_frame'
    1254 |         if (its_frame->linked_translator_id != current_its_entry->translator_id)
         |             ~~~~~~~~~^
   drivers/irqchip/irq-gic-v5-its.c:1248:9: note: forward declaration of 'struct acpi_madt_gicv5_translate_frame'
    1248 |         struct acpi_madt_gicv5_translate_frame *its_frame;
         |                ^
>> drivers/irqchip/irq-gic-v5-its.c:1254:58: error: incomplete definition of type 'struct acpi_madt_gicv5_translator'
    1254 |         if (its_frame->linked_translator_id != current_its_entry->translator_id)
         |                                                ~~~~~~~~~~~~~~~~~^
   drivers/irqchip/irq-gic-v5-its.c:1242:15: note: forward declaration of 'struct acpi_madt_gicv5_translator'
    1242 | static struct acpi_madt_gicv5_translator *current_its_entry __initdata;
         |               ^
   drivers/irqchip/irq-gic-v5-its.c:1257:23: error: incomplete definition of type 'struct acpi_madt_gicv5_translate_frame'
    1257 |         res.start = its_frame->base_address;
         |                     ~~~~~~~~~^
   drivers/irqchip/irq-gic-v5-its.c:1248:9: note: forward declaration of 'struct acpi_madt_gicv5_translate_frame'
    1248 |         struct acpi_madt_gicv5_translate_frame *its_frame;
         |                ^
   drivers/irqchip/irq-gic-v5-its.c:1258:21: error: incomplete definition of type 'struct acpi_madt_gicv5_translate_frame'
    1258 |         res.end = its_frame->base_address + ACPI_GICV5_ITS_MEM_SIZE - 1;
         |                   ~~~~~~~~~^
   drivers/irqchip/irq-gic-v5-its.c:1248:9: note: forward declaration of 'struct acpi_madt_gicv5_translate_frame'
    1248 |         struct acpi_madt_gicv5_translate_frame *its_frame;
         |                ^
   drivers/irqchip/irq-gic-v5-its.c:1268:44: error: incomplete definition of type 'struct acpi_madt_gicv5_translate_frame'
    1268 |         err = iort_register_domain_token(its_frame->translate_frame_id, res.start,
         |                                          ~~~~~~~~~^
   drivers/irqchip/irq-gic-v5-its.c:1248:9: note: forward declaration of 'struct acpi_madt_gicv5_translate_frame'
    1248 |         struct acpi_madt_gicv5_translate_frame *its_frame;
         |                ^
   drivers/irqchip/irq-gic-v5-its.c:1272:31: error: incomplete definition of type 'struct acpi_madt_gicv5_translate_frame'
    1272 |                        &res.start, its_frame->translate_frame_id);
         |                                    ~~~~~~~~~^
   include/linux/printk.h:555:33: note: expanded from macro 'pr_err'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/irqchip/irq-gic-v5-its.c:1248:9: note: forward declaration of 'struct acpi_madt_gicv5_translate_frame'
    1248 |         struct acpi_madt_gicv5_translate_frame *its_frame;
         |                ^
   drivers/irqchip/irq-gic-v5-its.c:1287:15: error: incomplete definition of type 'struct acpi_madt_gicv5_translate_frame'
    1287 |         if (its_frame->linked_translator_id != current_its_entry->translator_id)
         |             ~~~~~~~~~^
   drivers/irqchip/irq-gic-v5-its.c:1283:9: note: forward declaration of 'struct acpi_madt_gicv5_translate_frame'
    1283 |         struct acpi_madt_gicv5_translate_frame *its_frame;
         |                ^
   drivers/irqchip/irq-gic-v5-its.c:1287:58: error: incomplete definition of type 'struct acpi_madt_gicv5_translator'
    1287 |         if (its_frame->linked_translator_id != current_its_entry->translator_id)
         |                                                ~~~~~~~~~~~~~~~~~^
   drivers/irqchip/irq-gic-v5-its.c:1242:15: note: forward declaration of 'struct acpi_madt_gicv5_translator'
    1242 | static struct acpi_madt_gicv5_translator *current_its_entry __initdata;
         |               ^
   drivers/irqchip/irq-gic-v5-its.c:1290:51: error: incomplete definition of type 'struct acpi_madt_gicv5_translate_frame'
    1290 |         msi_dom_handle = iort_find_domain_token(its_frame->translate_frame_id);
         |                                                 ~~~~~~~~~^
   drivers/irqchip/irq-gic-v5-its.c:1283:9: note: forward declaration of 'struct acpi_madt_gicv5_translate_frame'
    1283 |         struct acpi_madt_gicv5_translate_frame *its_frame;
         |                ^
   drivers/irqchip/irq-gic-v5-its.c:1294:40: error: incomplete definition of type 'struct acpi_madt_gicv5_translate_frame'
    1294 |         iort_deregister_domain_token(its_frame->translate_frame_id);
         |                                      ~~~~~~~~~^
   drivers/irqchip/irq-gic-v5-its.c:1283:9: note: forward declaration of 'struct acpi_madt_gicv5_translate_frame'
    1283 |         struct acpi_madt_gicv5_translate_frame *its_frame;
         |                ^
   drivers/irqchip/irq-gic-v5-its.c:1310:23: error: incomplete definition of type 'struct acpi_madt_gicv5_translator'
    1310 |         res.start = its_entry->base_address;
         |                     ~~~~~~~~~^
   drivers/irqchip/irq-gic-v5-its.c:1242:15: note: forward declaration of 'struct acpi_madt_gicv5_translator'
    1242 | static struct acpi_madt_gicv5_translator *current_its_entry __initdata;
         |               ^
   drivers/irqchip/irq-gic-v5-its.c:1311:21: error: incomplete definition of type 'struct acpi_madt_gicv5_translator'
    1311 |         res.end = its_entry->base_address + ACPI_GICV5_ITS_MEM_SIZE - 1;
         |                   ~~~~~~~~~^
   drivers/irqchip/irq-gic-v5-its.c:1242:15: note: forward declaration of 'struct acpi_madt_gicv5_translator'
    1242 | static struct acpi_madt_gicv5_translator *current_its_entry __initdata;
         |               ^
>> drivers/irqchip/irq-gic-v5-its.c:1328:24: error: use of undeclared identifier 'ACPI_MADT_TYPE_GICV5_ITS_TRANSLATE'; did you mean 'ACPI_MADT_TYPE_GENERIC_TRANSLATOR'?
    1328 |         acpi_table_parse_madt(ACPI_MADT_TYPE_GICV5_ITS_TRANSLATE,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               ACPI_MADT_TYPE_GENERIC_TRANSLATOR
   include/acpi/actbl2.h:1157:2: note: 'ACPI_MADT_TYPE_GENERIC_TRANSLATOR' declared here
    1157 |         ACPI_MADT_TYPE_GENERIC_TRANSLATOR = 15,
         |         ^
   drivers/irqchip/irq-gic-v5-its.c:1338:17: error: incomplete definition of type 'struct acpi_madt_gicv5_translator'
    1338 |                                    its_entry->flags & ACPI_MADT_GICV5_ITS_NON_COHERENT);
         |                                    ~~~~~~~~~^
   drivers/irqchip/irq-gic-v5-its.c:1242:15: note: forward declaration of 'struct acpi_madt_gicv5_translator'
    1242 | static struct acpi_madt_gicv5_translator *current_its_entry __initdata;
         |               ^
>> drivers/irqchip/irq-gic-v5-its.c:1338:27: error: use of undeclared identifier 'ACPI_MADT_GICV5_ITS_NON_COHERENT'
    1338 |                                    its_entry->flags & ACPI_MADT_GICV5_ITS_NON_COHERENT);
         |                                                       ^
   drivers/irqchip/irq-gic-v5-its.c:1347:24: error: use of undeclared identifier 'ACPI_MADT_TYPE_GICV5_ITS_TRANSLATE'; did you mean 'ACPI_MADT_TYPE_GENERIC_TRANSLATOR'?
    1347 |         acpi_table_parse_madt(ACPI_MADT_TYPE_GICV5_ITS_TRANSLATE,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               ACPI_MADT_TYPE_GENERIC_TRANSLATOR
   include/acpi/actbl2.h:1157:2: note: 'ACPI_MADT_TYPE_GENERIC_TRANSLATOR' declared here
    1157 |         ACPI_MADT_TYPE_GENERIC_TRANSLATOR = 15,
         |         ^
>> drivers/irqchip/irq-gic-v5-its.c:1357:24: error: use of undeclared identifier 'ACPI_MADT_TYPE_GICV5_ITS'
    1357 |         acpi_table_parse_madt(ACPI_MADT_TYPE_GICV5_ITS, gic_acpi_parse_madt_its, 0);
         |                               ^
   17 errors generated.


vim +1254 drivers/irqchip/irq-gic-v5-its.c

  1241	
> 1242	static struct acpi_madt_gicv5_translator *current_its_entry __initdata;
  1243	static struct fwnode_handle *current_its_fwnode __initdata;
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
  1310		res.start = its_entry->base_address;
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
> 1347		acpi_table_parse_madt(ACPI_MADT_TYPE_GICV5_ITS_TRANSLATE,
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
