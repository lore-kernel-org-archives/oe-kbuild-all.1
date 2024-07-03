Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1350A17A59B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 13:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720014775; cv=none; b=CPP/P7BcOo3NNdndt5THP0o71tJcEsZEcmWhHGryxus3Ni0ZqsGVpbge0kWBXKwrMWUZSyYZI6vKo468qv9uY1BsUV+gvx9Nkd0/e3aFfOAeXtXzT8pHbXCXndHr+UrfCmO1KUMYeWipdgT3HjvYg61PVy+Z0UpqkG2cj4HvTrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720014775; c=relaxed/simple;
	bh=FDNPTcs+5mEeRlIL5gxrn7nFof13bDS0re9sh5SdWD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QGhS4nvIU4hPgQdCkNoHLUu3YBSbEFg/bicZFHWQykZMJ1EQwwaJZCkzLzKugnwrSCTFPriYUbelr6kX4zRESpjLyWDuHcTumu5cWLEHDm3RqxKaLPetKpTWjjSGs2qnStX4w2+2RH62QNGKntQVcPsTzOvKXYFfJGC6VElNtxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mY/g5Ony; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mY/g5Ony"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720014773; x=1751550773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FDNPTcs+5mEeRlIL5gxrn7nFof13bDS0re9sh5SdWD4=;
  b=mY/g5OnyB2ooldC7/xuaTbqTa7mmiOm1vjARnzVh8Gl1hO+2OOJtOAhJ
   Tt4lhpPGbNpTR2fgxH30RRjN+hxwORzvTJciev/YpPxAFGAxasDt28Mij
   4HlHLUuLxh5tf1lLqHtPi1TSXz0FPxGCp+33KRsQ5Wi6WWuQ5e/P+HEWP
   8EKmiQeDcFr8rXJoeyhJ+BxKV8fwtZik9J4N03Dk7F0+/ammY8a8fpdhQ
   f6QKc9GHep3agcDubKgtKiIWVqWdKmOpySbO6irWz7KFUAKfSXKy2xBHG
   ne0huTfbE0TaL2Jo7rMUG67vN3MgPBh0yDB2+Qc2tpeb572OIsX7iuEIK
   w==;
X-CSE-ConnectionGUID: BJUoJLTJSqaCuRXWRKIhwA==
X-CSE-MsgGUID: lYPli3MyStSWnxITV/TVsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="16968006"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="16968006"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 06:52:52 -0700
X-CSE-ConnectionGUID: 4Hy/ZUA5SYmz0yvYDpAIrQ==
X-CSE-MsgGUID: 1nkhADQtRfu7BYI8tvlm9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="46272887"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jul 2024 06:52:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sP0Pg-000Pna-0X;
	Wed, 03 Jul 2024 13:52:48 +0000
Date: Wed, 3 Jul 2024 21:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>
Subject: [atishp04:smmc_working_package 3/3]
 drivers/irqchip/irq-riscv-smmc.c:217:26: error: implicit declaration of
 function 'acpi_extract_package'
Message-ID: <202407032142.RKidHaB4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux smmc_working_package
head:   c5f4dcedbb148c0b500d39f8387e4488af669c4c
commit: c5f4dcedbb148c0b500d39f8387e4488af669c4c [3/3] Add SMMC driver package based.
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240703/202407032142.RKidHaB4-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407032142.RKidHaB4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407032142.RKidHaB4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/irqchip/irq-riscv-smmc.c:8:
   drivers/irqchip/irq-riscv-smmc.c: In function 'smmc_find_dres_for_gsi':
>> include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 2 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:436:25: note: in definition of macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:507:9: note: in expansion of macro 'printk'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:507:16: note: in expansion of macro 'KERN_ERR'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/irqchip/irq-riscv-smmc.c:48:17: note: in expansion of macro 'pr_err'
      48 |                 pr_err("gsino %d regs %lx ah %lx\n", devres->cfg->gsino, devres->regs, devres->cfg->addr_hi);
         |                 ^~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'void *' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:436:25: note: in definition of macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:507:9: note: in expansion of macro 'printk'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:507:16: note: in expansion of macro 'KERN_ERR'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/irqchip/irq-riscv-smmc.c:48:17: note: in expansion of macro 'pr_err'
      48 |                 pr_err("gsino %d regs %lx ah %lx\n", devres->cfg->gsino, devres->regs, devres->cfg->addr_hi);
         |                 ^~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:436:25: note: in definition of macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:507:9: note: in expansion of macro 'printk'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:507:16: note: in expansion of macro 'KERN_ERR'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/irqchip/irq-riscv-smmc.c:48:17: note: in expansion of macro 'pr_err'
      48 |                 pr_err("gsino %d regs %lx ah %lx\n", devres->cfg->gsino, devres->regs, devres->cfg->addr_hi);
         |                 ^~~~~~
   drivers/irqchip/irq-riscv-smmc.c: In function 'smmc_msi_write_msg':
>> include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 4 has type 'irq_hw_number_t' {aka 'long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:436:25: note: in definition of macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:507:9: note: in expansion of macro 'printk'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:507:16: note: in expansion of macro 'KERN_ERR'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/irqchip/irq-riscv-smmc.c:103:9: note: in expansion of macro 'pr_err'
     103 |         pr_err("%s: In d->irq %d hwirq %d msg_hi %lx msg_low %lx data %lx\n",
         |         ^~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'u32' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:436:25: note: in definition of macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:507:9: note: in expansion of macro 'printk'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:507:16: note: in expansion of macro 'KERN_ERR'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/irqchip/irq-riscv-smmc.c:103:9: note: in expansion of macro 'pr_err'
     103 |         pr_err("%s: In d->irq %d hwirq %d msg_hi %lx msg_low %lx data %lx\n",
         |         ^~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'u32' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:436:25: note: in definition of macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:507:9: note: in expansion of macro 'printk'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:507:16: note: in expansion of macro 'KERN_ERR'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/irqchip/irq-riscv-smmc.c:103:9: note: in expansion of macro 'pr_err'
     103 |         pr_err("%s: In d->irq %d hwirq %d msg_hi %lx msg_low %lx data %lx\n",
         |         ^~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 7 has type 'u32' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:436:25: note: in definition of macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:507:9: note: in expansion of macro 'printk'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:507:16: note: in expansion of macro 'KERN_ERR'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/irqchip/irq-riscv-smmc.c:103:9: note: in expansion of macro 'pr_err'
     103 |         pr_err("%s: In d->irq %d hwirq %d msg_hi %lx msg_low %lx data %lx\n",
         |         ^~~~~~
   drivers/irqchip/irq-riscv-smmc.c: In function 'smmc_parse_package_resource':
>> drivers/irqchip/irq-riscv-smmc.c:217:26: error: implicit declaration of function 'acpi_extract_package' [-Werror=implicit-function-declaration]
     217 |                 status = acpi_extract_package(&(smmc_obj->package.elements[i]),
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 4 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:436:25: note: in definition of macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:507:9: note: in expansion of macro 'printk'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:507:16: note: in expansion of macro 'KERN_ERR'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/irqchip/irq-riscv-smmc.c:224:17: note: in expansion of macro 'pr_err'
     224 |                 pr_err("%s: smmc_obj data package i %d: %d %lx %lx \n", __func__, i, res->cfg->gsino, res->cfg->addr_low, res->cfg->addr_hi);
         |                 ^~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:436:25: note: in definition of macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:507:9: note: in expansion of macro 'printk'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:507:16: note: in expansion of macro 'KERN_ERR'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/irqchip/irq-riscv-smmc.c:224:17: note: in expansion of macro 'pr_err'
     224 |                 pr_err("%s: smmc_obj data package i %d: %d %lx %lx \n", __func__, i, res->cfg->gsino, res->cfg->addr_low, res->cfg->addr_hi);
         |                 ^~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:436:25: note: in definition of macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:507:9: note: in expansion of macro 'printk'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:507:16: note: in expansion of macro 'KERN_ERR'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/irqchip/irq-riscv-smmc.c:224:17: note: in expansion of macro 'pr_err'
     224 |                 pr_err("%s: smmc_obj data package i %d: %d %lx %lx \n", __func__, i, res->cfg->gsino, res->cfg->addr_low, res->cfg->addr_hi);
         |                 ^~~~~~
   drivers/irqchip/irq-riscv-smmc.c: In function 'smmc_probe':
>> drivers/irqchip/irq-riscv-smmc.c:284:9: error: implicit declaration of function 'acpi_dev_clear_dependencies' [-Werror=implicit-function-declaration]
     284 |         acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-riscv-smmc.c: At top level:
>> drivers/irqchip/irq-riscv-smmc.c:289:36: warning: 'smmc_acpi_match' defined but not used [-Wunused-const-variable=]
     289 | static const struct acpi_device_id smmc_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RISCV_SMMC
   Depends on [n]: ACPI [=n] && RISCV [=y]
   Selected by [y]:
   - RISCV [=y]


vim +/acpi_extract_package +217 drivers/irqchip/irq-riscv-smmc.c

   169	
   170	static int smmc_parse_package_resource(struct platform_device *pdev, struct smmc_data *data)
   171	{
   172		struct device *dev = &pdev->dev;
   173		int result = -EFAULT;
   174		acpi_status status = AE_OK;
   175		struct acpi_buffer buffer = {ACPI_ALLOCATE_BUFFER, NULL};
   176		union acpi_object *smmc_obj = NULL;
   177		struct acpi_buffer format = {sizeof("NNNNN"), "NNNNN"};
   178		struct acpi_buffer state = {0, NULL};
   179		struct smmc_dev_res *res;
   180		int i;
   181	
   182		struct acpi_handle *handle = ACPI_HANDLE_FWNODE(dev->fwnode);
   183	
   184		status = acpi_evaluate_object_typed(handle, "CFGN", NULL,
   185						    &buffer, ACPI_TYPE_PACKAGE);
   186		if (status == AE_NOT_FOUND)
   187			return 0;
   188		if (ACPI_FAILURE(status))
   189			return -ENODEV;
   190	
   191		smmc_obj = buffer.pointer;
   192		if (!smmc_obj || smmc_obj->package.count != 2) {
   193			pr_err("Invalid SMMC data\n");
   194			goto end;
   195		}
   196	
   197		pr_err("%s: package count %d\n", __func__, smmc_obj->package.count);
   198	
   199		for (i = 0; i < smmc_obj->package.count; i++) {
   200			res = devm_kzalloc(dev, sizeof(*res), GFP_KERNEL);
   201			if (!res)
   202				goto end_nomem;
   203			res->cfg = devm_kzalloc(dev, sizeof(struct smmc_dev_cfg), GFP_KERNEL);
   204			if (!res->cfg)
   205				goto end_nomem;
   206	
   207			res->regs = devm_platform_ioremap_resource(pdev, i);
   208			if (IS_ERR(res->regs)) {
   209				result = PTR_ERR(res->regs);
   210				//TODO: Free up the list/memory for cfg
   211				goto end;
   212			}
   213	
   214			state.length = sizeof(struct smmc_dev_cfg);
   215			state.pointer = res->cfg;
   216	
 > 217			status = acpi_extract_package(&(smmc_obj->package.elements[i]),
   218					      &format, &state);
   219			if (ACPI_FAILURE(status)) {
   220				pr_err("Invalid SMMC CFG %d\n", status);
   221				goto end;
   222			}
   223	
 > 224			pr_err("%s: smmc_obj data package i %d: %d %lx %lx \n", __func__, i, res->cfg->gsino, res->cfg->addr_low, res->cfg->addr_hi);
   225			list_add(&res->list, &data->dev_res_list);
   226		}
   227		result = 0;
   228	
   229	end_nomem:
   230		result = -ENOMEM;
   231	end:
   232		kfree(buffer.pointer);
   233		return result;
   234	}
   235	
   236	static int smmc_probe(struct platform_device *pdev)
   237	{
   238		struct device *dev = &pdev->dev;
   239		int rc = 0;
   240	    	const struct imsic_global_config *imsic_global;
   241		struct irq_domain *msi_domain;
   242		struct smmc_data *data;
   243	
   244		/* SMMC device is only valid for ACPI supported platforms */
   245		if (acpi_disabled)
   246			return -ENODEV;
   247	
   248		data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
   249		if (!data)
   250			return -ENOMEM;
   251	
   252		data->dev = dev;
   253		INIT_LIST_HEAD(&data->dev_res_list);
   254	
   255	    	rc = riscv_acpi_get_gsi_info(dev->fwnode, &data->gsi_base, &data->id,
   256						     &data->nr_irqs, NULL);
   257		if (rc) {
   258			dev_err(dev, "failed to find GSI mapping\n");
   259			return rc;
   260		}
   261	
   262		smmc_parse_package_resource(pdev, data);
   263		//TODO: Setup any initial state of the device and enable MSI delivery
   264	
   265		imsic_global = imsic_get_global_config();
   266		if (!imsic_global) {
   267			dev_err(dev, "IMSIC global config not found\n");
   268			return -ENODEV;
   269		}
   270	
   271		if (!dev_get_msi_domain(dev)) {
   272			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
   273								DOMAIN_BUS_PLATFORM_MSI);
   274				if (msi_domain)
   275					dev_set_msi_domain(dev, msi_domain);
   276		}
   277	
   278		if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN, &smmc_msi_template,
   279							data->nr_irqs + 1, data, data)) {
   280			dev_err(dev, "failed to create MSI irq domain\n");
   281			return -ENOMEM;
   282		}
   283	
 > 284		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
   285	
   286		return rc;
   287	}
   288	
 > 289	static const struct acpi_device_id smmc_acpi_match[] = {
   290		{ "RSCV0005", 0 },
   291		{}
   292	};
   293	MODULE_DEVICE_TABLE(acpi, smmc_acpi_match);
   294	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
