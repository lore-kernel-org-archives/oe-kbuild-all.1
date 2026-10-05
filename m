Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FDE4C224C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 15:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791213091; cv=none; b=I7mo+n5j0/bvd/A93UqtjT3RmoM2EMMYuttUYvKBaA9OSNqBK6DNxEPpjyDkiBNmCvMTjJFc7Eh3f/f71k/YcdJqQGEJtlhYG6cuRogP9ExUBCS9fxadqcqhMugJXUKAOb5NKoSO3gTbmb6vyJsVjd3Y3MZkOTmweN4YdhGlxPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791213091; c=relaxed/simple;
	bh=JWdL3QxlqQX90nZqUoHdwmKuzNv2lziAUc6AMPmvJIA=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWhg45cZDluSy5zE7egO9q+USL0Ci2xfmsjQ9nObEUIrtLD7EIW6xWr84S8eiHqzHVeb3zpSXEuGB82KEj3IDTR2s2VCnS3JHw/V0McQmxB6n0tDlVFTNhIt5gpY/v3k3gotU5c9hMHIcGvRTFK7liBP2SIvCdJjrPajMV1ZMiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hrmrvjxu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hrmrvjxu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791213089; x=1822749089;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=JWdL3QxlqQX90nZqUoHdwmKuzNv2lziAUc6AMPmvJIA=;
  b=HrmrvjxuWNluVHq5ivtx8U2oY66SjLWVBXn87UYAAZvAk+n0fmR4Q92W
   DwQ5LuB76R7/BMibvhmujTtNuckzn6T0Kb0sxvZIqXXBgKq4KkbP7e2aO
   QJ24z7kHPPKCE3Dt63kCyPtHXLUvHA8eVwl7KYH0CNmZRGr5aptbliPj1
   DvRX4w3+VJ0ObyNGUCD968chOmotDv0zbJ+W7rPHeniLp4Hw5qiVoBzJL
   FzUGsFQYtp/qSQGMnP270Yy7eh0vuscLOx/oSwf2KGjcgiQsn0CJ1u+L4
   ehFLBBUmq/kb6I9FiAG0QVWDyDIct5ctnIEsErPgkfmJ2Ri/fJajeMay8
   g==;
X-CSE-ConnectionGUID: iomJckJdQ0aCg3nuFI6RCg==
X-CSE-MsgGUID: CRIErHAfSW+94bHsBVmupQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94375758"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="94375758"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 08:11:28 -0700
X-CSE-ConnectionGUID: HeW+NOOZThWKBM1W1rdxkw==
X-CSE-MsgGUID: 3Dk3dq2gQiyq+NY5lM8LDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="275491121"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 05 Oct 2026 08:11:28 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDkLe-000000000CB-0C0z
	for oe-kbuild-all@lists.linux.dev;
	Mon, 05 Oct 2026 15:11:26 +0000
Date: Mon, 5 Oct 2026 17:11:09 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: ACPI: Add stub for acpi_has_method() for !CONFIG_ACPI
Message-ID: <202610051732.mHvl7l40-lkp@intel.com>
References: <202610051732.mHvl7l40-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610051732.mHvl7l40-lkp@intel.com>

Hi Bowen,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Bowen-Yu/ACPI-Add-stub-for-acpi_has_method-for-CONFIG_ACPI/20260929-201347
base:   
patch link:    https://lore.kernel.org/r/202610051732.mHvl7l40-lkp%40intel.com
config: mips-randconfig-r2307-20261005 (https://download.01.org/0day-ci/archive/20261005/202610051732.mHvl7l40-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 195c81658995a4b7531c30a12c5aef6cf2bbd671)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051732.mHvl7l40-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051732.mHvl7l40-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-goldfish-pic.c:12:
   In file included from include/linux/irqchip.h:14:
   include/linux/acpi.h:1033:20: error: redefinition of 'acpi_has_method'
    1033 | static inline bool acpi_has_method(acpi_handle handle, char *name)
         |                    ^
   include/acpi/acpi_bus.h:957:20: note: previous definition is here
     957 | static inline bool acpi_has_method(acpi_handle handle, char *name)
         |                    ^
>> drivers/irqchip/irq-goldfish-pic.c:101:29: warning: shift count >= width of type [-Wshift-count-overflow]
     101 |         irq_setup_generic_chip(gc, IRQ_MSK(GFPIC_NR_IRQS), 0,
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/irq.h:1227:41: note: expanded from macro 'IRQ_MSK'
    1227 | #define IRQ_MSK(n) (u32)((n) < 32 ? ((1 << (n)) - 1) : UINT_MAX)
         |                                         ^  ~~~
   drivers/irqchip/irq-goldfish-pic.c:120:31: warning: shift count >= width of type [-Wshift-count-overflow]
     120 |         irq_destroy_generic_chip(gc, IRQ_MSK(GFPIC_NR_IRQS),
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/irq.h:1227:41: note: expanded from macro 'IRQ_MSK'
    1227 | #define IRQ_MSK(n) (u32)((n) < 32 ? ((1 << (n)) - 1) : UINT_MAX)
         |                                         ^  ~~~
   2 warnings and 1 error generated.


vim +101 drivers/irqchip/irq-goldfish-pic.c

4235ff50cf98dd Miodrag Dinic     2017-12-29   54  
4235ff50cf98dd Miodrag Dinic     2017-12-29   55  static int __init goldfish_pic_of_init(struct device_node *of_node,
4235ff50cf98dd Miodrag Dinic     2017-12-29   56  				       struct device_node *parent)
4235ff50cf98dd Miodrag Dinic     2017-12-29   57  {
4235ff50cf98dd Miodrag Dinic     2017-12-29   58  	struct goldfish_pic_data *gfpic;
4235ff50cf98dd Miodrag Dinic     2017-12-29   59  	struct irq_chip_generic *gc;
4235ff50cf98dd Miodrag Dinic     2017-12-29   60  	struct irq_chip_type *ct;
4235ff50cf98dd Miodrag Dinic     2017-12-29   61  	unsigned int parent_irq;
4235ff50cf98dd Miodrag Dinic     2017-12-29   62  	int ret = 0;
4235ff50cf98dd Miodrag Dinic     2017-12-29   63  
bf4afc53b77aea Linus Torvalds    2026-02-21   64  	gfpic = kzalloc_obj(*gfpic);
4235ff50cf98dd Miodrag Dinic     2017-12-29   65  	if (!gfpic) {
4235ff50cf98dd Miodrag Dinic     2017-12-29   66  		ret = -ENOMEM;
4235ff50cf98dd Miodrag Dinic     2017-12-29   67  		goto out_err;
4235ff50cf98dd Miodrag Dinic     2017-12-29   68  	}
4235ff50cf98dd Miodrag Dinic     2017-12-29   69  
4235ff50cf98dd Miodrag Dinic     2017-12-29   70  	parent_irq = irq_of_parse_and_map(of_node, 0);
4235ff50cf98dd Miodrag Dinic     2017-12-29   71  	if (!parent_irq) {
4235ff50cf98dd Miodrag Dinic     2017-12-29   72  		pr_err("Failed to map parent IRQ!\n");
4235ff50cf98dd Miodrag Dinic     2017-12-29   73  		ret = -EINVAL;
4235ff50cf98dd Miodrag Dinic     2017-12-29   74  		goto out_free;
4235ff50cf98dd Miodrag Dinic     2017-12-29   75  	}
4235ff50cf98dd Miodrag Dinic     2017-12-29   76  
4235ff50cf98dd Miodrag Dinic     2017-12-29   77  	gfpic->base = of_iomap(of_node, 0);
4235ff50cf98dd Miodrag Dinic     2017-12-29   78  	if (!gfpic->base) {
4235ff50cf98dd Miodrag Dinic     2017-12-29   79  		pr_err("Failed to map base address!\n");
4235ff50cf98dd Miodrag Dinic     2017-12-29   80  		ret = -ENOMEM;
4235ff50cf98dd Miodrag Dinic     2017-12-29   81  		goto out_unmap_irq;
4235ff50cf98dd Miodrag Dinic     2017-12-29   82  	}
4235ff50cf98dd Miodrag Dinic     2017-12-29   83  
4235ff50cf98dd Miodrag Dinic     2017-12-29   84  	/* Mask interrupts. */
4235ff50cf98dd Miodrag Dinic     2017-12-29   85  	writel(1, gfpic->base + GFPIC_REG_IRQ_DISABLE_ALL);
4235ff50cf98dd Miodrag Dinic     2017-12-29   86  
4235ff50cf98dd Miodrag Dinic     2017-12-29   87  	gc = irq_alloc_generic_chip("GFPIC", 1, GFPIC_IRQ_BASE, gfpic->base,
4235ff50cf98dd Miodrag Dinic     2017-12-29   88  				    handle_level_irq);
4235ff50cf98dd Miodrag Dinic     2017-12-29   89  	if (!gc) {
4235ff50cf98dd Miodrag Dinic     2017-12-29   90  		pr_err("Failed to allocate chip structures!\n");
4235ff50cf98dd Miodrag Dinic     2017-12-29   91  		ret = -ENOMEM;
4235ff50cf98dd Miodrag Dinic     2017-12-29   92  		goto out_iounmap;
4235ff50cf98dd Miodrag Dinic     2017-12-29   93  	}
4235ff50cf98dd Miodrag Dinic     2017-12-29   94  
4235ff50cf98dd Miodrag Dinic     2017-12-29   95  	ct = gc->chip_types;
4235ff50cf98dd Miodrag Dinic     2017-12-29   96  	ct->regs.enable = GFPIC_REG_IRQ_ENABLE;
4235ff50cf98dd Miodrag Dinic     2017-12-29   97  	ct->regs.disable = GFPIC_REG_IRQ_DISABLE;
4235ff50cf98dd Miodrag Dinic     2017-12-29   98  	ct->chip.irq_unmask = irq_gc_unmask_enable_reg;
4235ff50cf98dd Miodrag Dinic     2017-12-29   99  	ct->chip.irq_mask = irq_gc_mask_disable_reg;
4235ff50cf98dd Miodrag Dinic     2017-12-29  100  
4235ff50cf98dd Miodrag Dinic     2017-12-29 @101  	irq_setup_generic_chip(gc, IRQ_MSK(GFPIC_NR_IRQS), 0,
4235ff50cf98dd Miodrag Dinic     2017-12-29  102  			       IRQ_NOPROBE | IRQ_LEVEL, 0);
4235ff50cf98dd Miodrag Dinic     2017-12-29  103  
affdc0d1bdfa54 Jiri Slaby (SUSE  2025-03-19  104) 	gfpic->irq_domain = irq_domain_create_legacy(of_fwnode_handle(of_node), GFPIC_NR_IRQS,
affdc0d1bdfa54 Jiri Slaby (SUSE  2025-03-19  105) 						     GFPIC_IRQ_BASE, 0, &goldfish_irq_domain_ops,
4235ff50cf98dd Miodrag Dinic     2017-12-29  106  						     NULL);
4235ff50cf98dd Miodrag Dinic     2017-12-29  107  	if (!gfpic->irq_domain) {
4235ff50cf98dd Miodrag Dinic     2017-12-29  108  		pr_err("Failed to add irqdomain!\n");
4235ff50cf98dd Miodrag Dinic     2017-12-29  109  		ret = -ENOMEM;
4235ff50cf98dd Miodrag Dinic     2017-12-29  110  		goto out_destroy_generic_chip;
4235ff50cf98dd Miodrag Dinic     2017-12-29  111  	}
4235ff50cf98dd Miodrag Dinic     2017-12-29  112  
4235ff50cf98dd Miodrag Dinic     2017-12-29  113  	irq_set_chained_handler_and_data(parent_irq,
4235ff50cf98dd Miodrag Dinic     2017-12-29  114  					 goldfish_pic_cascade, gfpic);
4235ff50cf98dd Miodrag Dinic     2017-12-29  115  
4235ff50cf98dd Miodrag Dinic     2017-12-29  116  	pr_info("Successfully registered.\n");
4235ff50cf98dd Miodrag Dinic     2017-12-29  117  	return 0;
4235ff50cf98dd Miodrag Dinic     2017-12-29  118  
4235ff50cf98dd Miodrag Dinic     2017-12-29  119  out_destroy_generic_chip:
4235ff50cf98dd Miodrag Dinic     2017-12-29  120  	irq_destroy_generic_chip(gc, IRQ_MSK(GFPIC_NR_IRQS),
4235ff50cf98dd Miodrag Dinic     2017-12-29  121  				 IRQ_NOPROBE | IRQ_LEVEL, 0);
4235ff50cf98dd Miodrag Dinic     2017-12-29  122  out_iounmap:
4235ff50cf98dd Miodrag Dinic     2017-12-29  123  	iounmap(gfpic->base);
4235ff50cf98dd Miodrag Dinic     2017-12-29  124  out_unmap_irq:
4235ff50cf98dd Miodrag Dinic     2017-12-29  125  	irq_dispose_mapping(parent_irq);
4235ff50cf98dd Miodrag Dinic     2017-12-29  126  out_free:
4235ff50cf98dd Miodrag Dinic     2017-12-29  127  	kfree(gfpic);
4235ff50cf98dd Miodrag Dinic     2017-12-29  128  out_err:
4235ff50cf98dd Miodrag Dinic     2017-12-29  129  	pr_err("Failed to initialize! (errno = %d)\n", ret);
4235ff50cf98dd Miodrag Dinic     2017-12-29  130  	return ret;
4235ff50cf98dd Miodrag Dinic     2017-12-29  131  }
4235ff50cf98dd Miodrag Dinic     2017-12-29  132  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
