Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F4428BABF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 16:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636085; cv=none; b=XCH7SvYi3XY0alrC0h+6skBjVmVPkLm8RjoIBcpnFeYLGZ0wPxAxY9YREDt+26iBdoqtaSaiWkv+u4/saTirvJmE9eN/10hRwLclaQxuoO58pJMj8w7casBAlkBFd6iFac8H+IMEeRCci4YOQKsRyf5kI+GngOC/RerV+G3TYX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636085; c=relaxed/simple;
	bh=E0eA16U1Nw3YRpuIi6iC8IyQcrj8Svl6r52uSYIVa8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gn9DI0XydLvyohYQcP4L+5qYomfJZmqxbdpY/FAYOItf711qNb9cWxNzd+wR7GTLF51coiT+XBaSw+lm7eH93qzGEa0S+Y9He9KH1sD6tX16IU6UdhI9Edj4oo60v/jUqHzVUxOGVYL0pkFxXKulJgplEdS3YhmSNUdzTzdV9zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gBVazDRP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gBVazDRP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746636084; x=1778172084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E0eA16U1Nw3YRpuIi6iC8IyQcrj8Svl6r52uSYIVa8Y=;
  b=gBVazDRPWgyol1ZGfB5o05mPZ2zXltkuT8nX6fVTJZWs3qptcOtjwUBN
   Hxzuc9O9ErTTnsf38hLZa0IUohVm6x9XzvNjj6ueeiYJFA/yeC/WVxoMx
   vCZWLpX+liXTQyPuVAwvX+a5V75X2+qm67FrmUJw7cg+IoJYPCUg5JkU9
   CkEz8wn1w7k0rCqHT3zLCyaThGG61O2b3umYNolKBsXOZsa8LzHDj2wBx
   egTfX/D4/SNO/3bKMI/7ImKq0/ldSdBnFjzCR57pyeJWAkkCO1xlhEUy0
   DOKs2bhVeV5k8lDBOWCL+iWFO6BZintsYpiqvWdw14cnKAX3RdmqbZq2X
   Q==;
X-CSE-ConnectionGUID: WpuVW7BTRJmrZbCjWpM3fA==
X-CSE-MsgGUID: 1bvv4CxhQXifRMMJjlPTdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48539028"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48539028"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 09:41:19 -0700
X-CSE-ConnectionGUID: Wx7/AZ7/Smu1EiC6gvWvHA==
X-CSE-MsgGUID: upyh5fmTRnS6t3Oi6Mg37w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136030167"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2025 09:41:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uChpa-0008Ar-1i;
	Wed, 07 May 2025 16:41:14 +0000
Date: Thu, 8 May 2025 00:40:59 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_raid6_rvv_v3 56/58] drivers/acpi/apei/bert.c:160:25:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202505080008.J7eijxaC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Himanshu,

First bad commit (maybe != root cause):

tree:   https://github.com/avpatel/linux.git riscv_raid6_rvv_v3
head:   5c5a7e6795406fdac17fd52dfc4ac3c5b0f6e25f
commit: aa0c1c01b8e026d55184578506346e5b6acbe35e [56/58] riscv: Enable APEI and NMI safe cmpxchg options required for RAS
config: riscv-randconfig-r112-20250426 (https://download.01.org/0day-ci/archive/20250508/202505080008.J7eijxaC-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250508/202505080008.J7eijxaC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505080008.J7eijxaC-lkp@intel.com/

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
   drivers/acpi/apei/erst.c:825:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *static [toplevel] vaddr @@
   drivers/acpi/apei/erst.c:825:9: sparse:     expected void const *
   drivers/acpi/apei/erst.c:825:9: sparse:     got void [noderef] __iomem *static [toplevel] vaddr
   drivers/acpi/apei/erst.c:825:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *static [toplevel] vaddr @@
   drivers/acpi/apei/erst.c:825:9: sparse:     expected void const *
   drivers/acpi/apei/erst.c:825:9: sparse:     got void [noderef] __iomem *static [toplevel] vaddr
   drivers/acpi/apei/erst.c:825:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got void [noderef] __iomem *static [toplevel] vaddr @@
   drivers/acpi/apei/erst.c:825:9: sparse:     expected void *
   drivers/acpi/apei/erst.c:825:9: sparse:     got void [noderef] __iomem *static [toplevel] vaddr
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
