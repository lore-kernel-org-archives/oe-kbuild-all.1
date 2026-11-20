Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795213251;
	b=0bVx9ZVqxgrFjiNx5KljAy/1P/FBlnt941T9cv/4d76jRkw8cl8BzXrxPk0KJ5L9yxxD
	 2V77wulAYOxG9C6WD0YpYsraKuNp4I06yevJpsqqTaykMymGxZ5rjn/897zqmNV9sQnQ6
	 7RcRg40L/MoyeiXMkLhBx7SjvQ/ObyTa5O8uMZbJc9833pRzGc3fBaxBWbXGGDT53kqAN
	 X2IpKu+/CtCqvKR2FSNCqTVkiQddciimzcNbxnOskh8A2UT6E3EN7GlFCVr0tPFQ8VQuo
	 ry5qwYR1ofz7NxOCZlsePWg7VVECaQPmdmVOXuTWeZBZ9QPm0VJA/0PtLuHXl5XVUaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795213251;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=QWEUR7D3KmF029Tez8uyZcvqMoQNG0m+Jyrc/SZQlq8=;
	b=QJhyoylSYEN+HfazKFPAfKugTUhm9Zp+vX3txN4s2LAsaFF0+PcrjWZxLcyWNDgXmOkI
	 K54fMkkjfNwE8RA9zHFSrwUR/XWKNYmP/1PAqqAGKein0RGLQe0+G2r43wObavnMJNB+O
	 8vY1TOCUVISZ+6iz2Y62tQ0lXAimSONRbQSzQ9wOz/b9AvWPSWyyAoMCG2Pbq+jVc6uJ/
	 t7Aul/XHbXzjCKTX5gbVf9KZMDHyZ5NaHZB4YN4b3ddljyyt4TN6DXI+BJOcNYUjd7llY
	 UNk4+HXHTUMQCp35W4vhAXfUNrX6cqPJCoL0QO4th27Z28RmDppMo6KXEQiN0PWRbOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZQ4UoUah;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF05606A696
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 22:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BF05606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZQ4UoUah
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795213249; x=1826749249;
  h=date:from:to:cc:subject:message-id;
  bh=ojmwL34mu5n95ZYfC/Ex9qXV4NeaTnKEmKUFEGV2TkI=;
  b=ZQ4UoUahRLlD7y84dPsp0yjsSk3PqqvZUcjmNtZTjw49hR0mK1/UsMm+
   V8+gIeILdQCeZSx44kRqROe49W6z1dixMv9EzXMSVoD5kYNtVo/6ImsBG
   QyPcec7HcQu85U8m4z8NsfWNpIAzWH2WxbodfO/ta/tkVFHOC4LE+wVvl
   lxn52ahb30lHWB3cEsGgC656eLoP9Tsqk4+b7Mn/z3erLgPxX6K/U5KHs
   SuYp3YPQ7mVV42JUSLYEt6Y30o1bkO9yf+juqLDpdRx4fC7a25ny9TzHY
   sFWFHapJipp4ZpZ5/wtVb5ThueOqoNbDJlHxDuA2VO+mZJQlWEZ7bOozk
   g==;
X-CSE-ConnectionGUID: x8AdkGoiQi+1N/Lq1Kc2qQ==
X-CSE-MsgGUID: uDIECu5KSneTMfBwM+br0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4094507"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4094507"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 14:20:49 -0800
X-CSE-ConnectionGUID: BuMFB1ldR3CmSGLbF3SClw==
X-CSE-MsgGUID: 45vcGwB4TgaD94UHND9OFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10779952"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 20 Nov 2026 14:20:47 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUWyL-0000000048D-1ObQ;
	Fri, 20 Nov 2026 22:20:45 +0000
Date: Fri, 20 Nov 2026 23:20:15 +0100
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:b4/acpi-static-table-irq-probe-defer-v2 3/10]
 drivers/irqchip/irq-ingenic-tcu.c:132:21: warning: shift count >= width of
 type
Message-ID: <20261120231110.XJ1Pqqpz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git b4/acpi-static-table-irq-probe-defer-v2
head:   a75860f203b994ab67f8a876c7f568ac0f7f84c0
commit: 5df91ea5bcbef51cb967f3a07dd7c69c50681213 [3/10] ACPI: Introduce irq_get() for static fwnodes
config: riscv-randconfig-r2307-20261120 (https://download.01.org/0day-ci/archive/20261120/20261120231110.XJ1Pqqpz-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8db60b003f961f25c5cafe91ee44176f61374279)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120231110.XJ1Pqqpz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120231110.XJ1Pqqpz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-ingenic-tcu.c:9:
   In file included from include/linux/irqchip.h:14:
   include/linux/acpi.h:126:15: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     126 |         irq->flags = ACPI_STATIC_IRQ_FLAGS(trigger, polarity);
         |                      ^
   include/linux/acpi.h:71:3: note: expanded from macro 'ACPI_STATIC_IRQ_FLAGS'
      71 |         (FIELD_PREP(ACPI_STATIC_IRQ_TRIGGER_MASK, (trigger))    | \
         |          ^
>> drivers/irqchip/irq-ingenic-tcu.c:132:21: warning: shift count >= width of type [-Wshift-count-overflow]
     132 |         gc->wake_enabled = IRQ_MSK(32);
         |                            ^~~~~~~~~~~
   include/linux/irq.h:1227:41: note: expanded from macro 'IRQ_MSK'
    1227 | #define IRQ_MSK(n) (u32)((n) < 32 ? ((1 << (n)) - 1) : UINT_MAX)
         |                                         ^  ~~~
   drivers/irqchip/irq-ingenic-tcu.c:144:39: warning: shift count >= width of type [-Wshift-count-overflow]
     144 |         regmap_write(tcu->map, TCU_REG_TMSR, IRQ_MSK(32));
         |                                              ^~~~~~~~~~~
   include/linux/irq.h:1227:41: note: expanded from macro 'IRQ_MSK'
    1227 | #define IRQ_MSK(n) (u32)((n) < 32 ? ((1 << (n)) - 1) : UINT_MAX)
         |                                         ^  ~~~
   2 warnings and 1 error generated.


vim +132 drivers/irqchip/irq-ingenic-tcu.c

9536eba03ec7f6 Paul Cercueil     2019-07-24   84  
9536eba03ec7f6 Paul Cercueil     2019-07-24   85  static int __init ingenic_tcu_irq_init(struct device_node *np,
9536eba03ec7f6 Paul Cercueil     2019-07-24   86  				       struct device_node *parent)
9536eba03ec7f6 Paul Cercueil     2019-07-24   87  {
9536eba03ec7f6 Paul Cercueil     2019-07-24   88  	struct irq_chip_generic *gc;
9536eba03ec7f6 Paul Cercueil     2019-07-24   89  	struct irq_chip_type *ct;
9536eba03ec7f6 Paul Cercueil     2019-07-24   90  	struct ingenic_tcu *tcu;
9536eba03ec7f6 Paul Cercueil     2019-07-24   91  	struct regmap *map;
9536eba03ec7f6 Paul Cercueil     2019-07-24   92  	unsigned int i;
9536eba03ec7f6 Paul Cercueil     2019-07-24   93  	int ret, irqs;
9536eba03ec7f6 Paul Cercueil     2019-07-24   94  
9536eba03ec7f6 Paul Cercueil     2019-07-24   95  	map = device_node_to_regmap(np);
9536eba03ec7f6 Paul Cercueil     2019-07-24   96  	if (IS_ERR(map))
9536eba03ec7f6 Paul Cercueil     2019-07-24   97  		return PTR_ERR(map);
9536eba03ec7f6 Paul Cercueil     2019-07-24   98  
bf4afc53b77aea Linus Torvalds    2026-02-21   99  	tcu = kzalloc_obj(*tcu);
9536eba03ec7f6 Paul Cercueil     2019-07-24  100  	if (!tcu)
9536eba03ec7f6 Paul Cercueil     2019-07-24  101  		return -ENOMEM;
9536eba03ec7f6 Paul Cercueil     2019-07-24  102  
9536eba03ec7f6 Paul Cercueil     2019-07-24  103  	tcu->map = map;
9536eba03ec7f6 Paul Cercueil     2019-07-24  104  
9536eba03ec7f6 Paul Cercueil     2019-07-24  105  	irqs = of_property_count_elems_of_size(np, "interrupts", sizeof(u32));
9536eba03ec7f6 Paul Cercueil     2019-07-24  106  	if (irqs < 0 || irqs > ARRAY_SIZE(tcu->parent_irqs)) {
9536eba03ec7f6 Paul Cercueil     2019-07-24  107  		pr_crit("%s: Invalid 'interrupts' property\n", __func__);
9536eba03ec7f6 Paul Cercueil     2019-07-24  108  		ret = -EINVAL;
9536eba03ec7f6 Paul Cercueil     2019-07-24  109  		goto err_free_tcu;
9536eba03ec7f6 Paul Cercueil     2019-07-24  110  	}
9536eba03ec7f6 Paul Cercueil     2019-07-24  111  
9536eba03ec7f6 Paul Cercueil     2019-07-24  112  	tcu->nb_parent_irqs = irqs;
9536eba03ec7f6 Paul Cercueil     2019-07-24  113  
affdc0d1bdfa54 Jiri Slaby (SUSE  2025-03-19  114) 	tcu->domain = irq_domain_create_linear(of_fwnode_handle(np), 32, &irq_generic_chip_ops,
9536eba03ec7f6 Paul Cercueil     2019-07-24  115  					       NULL);
9536eba03ec7f6 Paul Cercueil     2019-07-24  116  	if (!tcu->domain) {
9536eba03ec7f6 Paul Cercueil     2019-07-24  117  		ret = -ENOMEM;
9536eba03ec7f6 Paul Cercueil     2019-07-24  118  		goto err_free_tcu;
9536eba03ec7f6 Paul Cercueil     2019-07-24  119  	}
9536eba03ec7f6 Paul Cercueil     2019-07-24  120  
9536eba03ec7f6 Paul Cercueil     2019-07-24  121  	ret = irq_alloc_domain_generic_chips(tcu->domain, 32, 1, "TCU",
9536eba03ec7f6 Paul Cercueil     2019-07-24  122  					     handle_level_irq, 0,
9536eba03ec7f6 Paul Cercueil     2019-07-24  123  					     IRQ_NOPROBE | IRQ_LEVEL, 0);
9536eba03ec7f6 Paul Cercueil     2019-07-24  124  	if (ret) {
9536eba03ec7f6 Paul Cercueil     2019-07-24  125  		pr_crit("%s: Invalid 'interrupts' property\n", __func__);
9536eba03ec7f6 Paul Cercueil     2019-07-24  126  		goto out_domain_remove;
9536eba03ec7f6 Paul Cercueil     2019-07-24  127  	}
9536eba03ec7f6 Paul Cercueil     2019-07-24  128  
9536eba03ec7f6 Paul Cercueil     2019-07-24  129  	gc = irq_get_domain_generic_chip(tcu->domain, 0);
9536eba03ec7f6 Paul Cercueil     2019-07-24  130  	ct = gc->chip_types;
9536eba03ec7f6 Paul Cercueil     2019-07-24  131  
9536eba03ec7f6 Paul Cercueil     2019-07-24 @132  	gc->wake_enabled = IRQ_MSK(32);

:::::: The code at line 132 was first introduced by commit
:::::: 9536eba03ec7f64fc65144b1323aef7c5e9aafcd irqchip: Add irq-ingenic-tcu driver

:::::: TO: Paul Cercueil <paul@crapouillou.net>
:::::: CC: Paul Burton <paul.burton@mips.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
