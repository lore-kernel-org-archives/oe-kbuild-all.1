Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111540;
	b=FsAqwfGCy+nJZN0PY/TdUeGZ95A8+jQz5BFPZfKlhbuXzj6K3AVeQfvoQk/OiJyJ2l6P
	 sWL6G5r05nlqDuUiyp3c0x5JmBkNAm6Yj60LsBfXUpJSr7zwYa7XCip+9siCgCaFKRkZa
	 +HM/kbbFh0C57vj+QQXhbGqgZdzgG66gbfWQxHd1RGzraFwKfl4fxYzRrkqYd8nufQ3jm
	 iOq/p4ACmiFwmR/BffGyrract5fGzTPIJK8Fx9fIirNI3svSICJqM8pjWGJENkPBamKAQ
	 /dfx3Ml8SbraBumLDJOpRTYYkiZt64fj88Ng/o81X36+PlnA1UogebIza5odOmN97yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111540;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=BXzIPT1VGG7pH04Vn1iaBUkDRcqwdFbHGifNwjtjK4A=;
	b=oBsK57maUIwiKxrR6/TLm3GGypJZnhgr7kQMtlSd2eI1KKFXu/I+i90JeFLN0xu4Rwpy
	 AA/MQoal2bMqlNpao3YCN1uG07j2hJTFGAEy2o3LAZN75N8GbipytTANcdYqx5tOTGGwh
	 /qV51pbqDKWfuhkwzoi1j/BjR8loLEWv/poDQBaRhPPUDSiwD+kZlzwUqxkUWw1Bmpmob
	 QKGevUJ55y3z/Yqwh2LpB9HrqJqULi/14cexEGCgkaTtJCQBIOMcactHeHbVvdQz/cMNa
	 HWpHYaet3hqzDchdR13Yi6urf136V6lAgbTay0PlH8NnipTKMwufuihP4fDlT57qWOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QJUnzpnw;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03D4606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 04:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B03D4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QJUnzpnw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794111538; x=1825647538;
  h=date:from:to:cc:subject:message-id;
  bh=nCjEhDy18X613AucxPL7Cwc5KpT5kTkSEyWG5NKg/aE=;
  b=QJUnzpnw0vNHhnncozEBKL8N9qLud9R04ETkGrIel4OQacPvUf5jivmS
   ytvoHdXGEkKhcM4od2k+JA97hRGyxBRTUXs+ddK4Wzll23i0F43/mXofe
   sQIQo/YEQpGjkXPMMEwJnz91AJVHiwuh4qJXcBzONWZ79k3S/bczmaoUI
   R6XI+EtKeRQ/0FIWGE/Cah14xgpcmskpncux3jwo46GIPzm20D6XXLFq9
   QGx/t9IaanjiZNAx68A38hisUJviC55+T01dF5dLj3HxdJV2iqFb9SiS/
   mUKqMIHk2B6avf8fgkl9Fhswt+0OTQ4ib54U1R9u7wklgxFdH8+iWAW6o
   A==;
X-CSE-ConnectionGUID: 6Ils8tUyT9idYJVXlEb7/g==
X-CSE-MsgGUID: PW1P0qC4Q9qVLciCxXlYhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2865930"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2865930"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 20:18:57 -0800
X-CSE-ConnectionGUID: Knzf6gZIRwSXiIrDjlKtKA==
X-CSE-MsgGUID: Xv4CVFadRdCf54okxS/wgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7760045"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 07 Nov 2026 20:18:57 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPuMm-00000000B0m-34dL;
	Sun, 08 Nov 2026 04:18:52 +0000
Date: Sun, 08 Nov 2026 05:18:10 +0100
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
 Sunil V L <sunilvl@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_support_v6 54/80]
 drivers/acpi/apei/bert.c:160:25: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202611080529.ydxZCJPn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v6
head:   f98be19c4d4f657fa0ed2a17aa8ef5ece29fe8dc
commit: 24380e2e902d4fcc26fe8fb3bd035c9d4701ad84 [54/80] riscv: Select HAVE_ACPI_APEI required for RAS
config: riscv-randconfig-r2308-20261108 (https://download.01.org/0day-ci/archive/20261108/202611080529.ydxZCJPn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080529.ydxZCJPn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080529.ydxZCJPn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/apei/bert.c:160:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got struct acpi_bert_region *[assigned] boot_error_region @@
   drivers/acpi/apei/bert.c:160:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/acpi/apei/bert.c:160:25: sparse:     got struct acpi_bert_region *[assigned] boot_error_region
--
   drivers/acpi/apei/erst.c:292:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *src @@     got void [noderef] __iomem * @@
   drivers/acpi/apei/erst.c:292:13: sparse:     expected void *src
   drivers/acpi/apei/erst.c:292:13: sparse:     got void [noderef] __iomem *
   drivers/acpi/apei/erst.c:295:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *dst @@     got void [noderef] __iomem * @@
   drivers/acpi/apei/erst.c:295:13: sparse:     expected void *dst
   drivers/acpi/apei/erst.c:295:13: sparse:     got void [noderef] __iomem *
   drivers/acpi/apei/erst.c:297:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *src @@
   drivers/acpi/apei/erst.c:297:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/acpi/apei/erst.c:297:25: sparse:     got void *src
   drivers/acpi/apei/erst.c:303:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *src @@
   drivers/acpi/apei/erst.c:303:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/acpi/apei/erst.c:303:17: sparse:     got void *src
   drivers/acpi/apei/erst.c:304:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *dst @@
   drivers/acpi/apei/erst.c:304:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/acpi/apei/erst.c:304:17: sparse:     got void *dst
   drivers/acpi/apei/erst.c:825:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got void [noderef] __iomem *static [toplevel] vaddr @@
   drivers/acpi/apei/erst.c:825:27: sparse:     expected void *
   drivers/acpi/apei/erst.c:825:27: sparse:     got void [noderef] __iomem *static [toplevel] vaddr
   drivers/acpi/apei/erst.c:826:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cper_record_header *rcd_erange @@     got void [noderef] __iomem *static [toplevel] vaddr @@
   drivers/acpi/apei/erst.c:826:20: sparse:     expected struct cper_record_header *rcd_erange
   drivers/acpi/apei/erst.c:826:20: sparse:     got void [noderef] __iomem *static [toplevel] vaddr
   drivers/acpi/apei/erst.c:863:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cper_record_header *rcd_tmp @@     got void [noderef] __iomem * @@
   drivers/acpi/apei/erst.c:863:17: sparse:     expected struct cper_record_header *rcd_tmp
   drivers/acpi/apei/erst.c:863:17: sparse:     got void [noderef] __iomem *
>> drivers/acpi/apei/erst.c:1253:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *static [addressable] [toplevel] vaddr @@     got void * @@
   drivers/acpi/apei/erst.c:1253:27: sparse:     expected void [noderef] __iomem *static [addressable] [toplevel] vaddr
   drivers/acpi/apei/erst.c:1253:27: sparse:     got void *

vim +160 drivers/acpi/apei/bert.c

a3e2acc5e37b22 Ying Huang 2016-06-29  115  
a3e2acc5e37b22 Ying Huang 2016-06-29  116  static int __init bert_init(void)
a3e2acc5e37b22 Ying Huang 2016-06-29  117  {
41139ac3cd76c6 Ying Huang 2017-02-20  118  	struct apei_resources bert_resources;
a3e2acc5e37b22 Ying Huang 2016-06-29  119  	struct acpi_bert_region *boot_error_region;
a3e2acc5e37b22 Ying Huang 2016-06-29  120  	struct acpi_table_bert *bert_tab;
a3e2acc5e37b22 Ying Huang 2016-06-29  121  	unsigned int region_len;
a3e2acc5e37b22 Ying Huang 2016-06-29  122  	acpi_status status;
a3e2acc5e37b22 Ying Huang 2016-06-29  123  	int rc = 0;
a3e2acc5e37b22 Ying Huang 2016-06-29  124  
a3e2acc5e37b22 Ying Huang 2016-06-29  125  	if (acpi_disabled)
a3e2acc5e37b22 Ying Huang 2016-06-29  126  		return 0;
a3e2acc5e37b22 Ying Huang 2016-06-29  127  
a3e2acc5e37b22 Ying Huang 2016-06-29  128  	if (bert_disable) {
a3e2acc5e37b22 Ying Huang 2016-06-29  129  		pr_info("Boot Error Record Table support is disabled.\n");
a3e2acc5e37b22 Ying Huang 2016-06-29  130  		return 0;
a3e2acc5e37b22 Ying Huang 2016-06-29  131  	}
a3e2acc5e37b22 Ying Huang 2016-06-29  132  
a3e2acc5e37b22 Ying Huang 2016-06-29  133  	status = acpi_get_table(ACPI_SIG_BERT, 0, (struct acpi_table_header **)&bert_tab);
a3e2acc5e37b22 Ying Huang 2016-06-29  134  	if (status == AE_NOT_FOUND)
a3e2acc5e37b22 Ying Huang 2016-06-29  135  		return 0;
a3e2acc5e37b22 Ying Huang 2016-06-29  136  
a3e2acc5e37b22 Ying Huang 2016-06-29  137  	if (ACPI_FAILURE(status)) {
a3e2acc5e37b22 Ying Huang 2016-06-29  138  		pr_err("get table failed, %s.\n", acpi_format_exception(status));
a3e2acc5e37b22 Ying Huang 2016-06-29  139  		return -EINVAL;
a3e2acc5e37b22 Ying Huang 2016-06-29  140  	}
a3e2acc5e37b22 Ying Huang 2016-06-29  141  
a3e2acc5e37b22 Ying Huang 2016-06-29  142  	rc = bert_check_table(bert_tab);
a3e2acc5e37b22 Ying Huang 2016-06-29  143  	if (rc) {
a3e2acc5e37b22 Ying Huang 2016-06-29  144  		pr_err(FW_BUG "table invalid.\n");
3d995f88adb106 Hanjun Guo 2020-05-07  145  		goto out_put_bert_tab;
a3e2acc5e37b22 Ying Huang 2016-06-29  146  	}
a3e2acc5e37b22 Ying Huang 2016-06-29  147  
a3e2acc5e37b22 Ying Huang 2016-06-29  148  	region_len = bert_tab->region_length;
41139ac3cd76c6 Ying Huang 2017-02-20  149  	apei_resources_init(&bert_resources);
41139ac3cd76c6 Ying Huang 2017-02-20  150  	rc = apei_resources_add(&bert_resources, bert_tab->address,
41139ac3cd76c6 Ying Huang 2017-02-20  151  				region_len, true);
41139ac3cd76c6 Ying Huang 2017-02-20  152  	if (rc)
3d995f88adb106 Hanjun Guo 2020-05-07  153  		goto out_put_bert_tab;
41139ac3cd76c6 Ying Huang 2017-02-20  154  	rc = apei_resources_request(&bert_resources, "APEI BERT");
41139ac3cd76c6 Ying Huang 2017-02-20  155  	if (rc)
41139ac3cd76c6 Ying Huang 2017-02-20  156  		goto out_fini;
a3e2acc5e37b22 Ying Huang 2016-06-29  157  	boot_error_region = ioremap_cache(bert_tab->address, region_len);
a3e2acc5e37b22 Ying Huang 2016-06-29  158  	if (boot_error_region) {
a3e2acc5e37b22 Ying Huang 2016-06-29  159  		bert_print_all(boot_error_region, region_len);
a3e2acc5e37b22 Ying Huang 2016-06-29 @160  		iounmap(boot_error_region);
a3e2acc5e37b22 Ying Huang 2016-06-29  161  	} else {
a3e2acc5e37b22 Ying Huang 2016-06-29  162  		rc = -ENOMEM;
a3e2acc5e37b22 Ying Huang 2016-06-29  163  	}
a3e2acc5e37b22 Ying Huang 2016-06-29  164  
41139ac3cd76c6 Ying Huang 2017-02-20  165  	apei_resources_release(&bert_resources);
41139ac3cd76c6 Ying Huang 2017-02-20  166  out_fini:
41139ac3cd76c6 Ying Huang 2017-02-20  167  	apei_resources_fini(&bert_resources);
3d995f88adb106 Hanjun Guo 2020-05-07  168  out_put_bert_tab:
3d995f88adb106 Hanjun Guo 2020-05-07  169  	acpi_put_table((struct acpi_table_header *)bert_tab);
a3e2acc5e37b22 Ying Huang 2016-06-29  170  
a3e2acc5e37b22 Ying Huang 2016-06-29  171  	return rc;
a3e2acc5e37b22 Ying Huang 2016-06-29  172  }
a3e2acc5e37b22 Ying Huang 2016-06-29  173  

:::::: The code at line 160 was first introduced by commit
:::::: a3e2acc5e37b22b6808a0b8e46887c3577de9c9e ACPI / APEI: Add Boot Error Record Table (BERT) support

:::::: TO: Huang Ying <ying.huang@intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
