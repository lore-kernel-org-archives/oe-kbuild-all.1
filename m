Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797765;
	b=NpiY5+KKxyWSi1rYY612tXLcdfUNfv1PPEO0Ew0nyT+tdK/dZsaTQZjWN2e13szwjsk2
	 MDxbMUmPZpVkNLq6X4Y4vHnu+/rKWPzCGVbKFyQwCKfqQIrjEtFXb5YZLPQcmTxpJq5GN
	 r0AQZ1TRSJc/nsjAHEiQR9ntery+mbUicW5SyXr08iKnEJlsXVIDR5gQk9aeFKA7/wOGB
	 hCkSUu6RQGXa/tUbvxsib8T5A5Z8p92Jot5GvLKGoxt8WrmQogTvAlRUEvbNu/NrTfI8K
	 eVYoDNSsTfd6EitDbO4TmwBetBqqeXMsBle330G0ubD8jWwJIbsHxtrJIoD5RfNGDdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797765;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XwQAS7wA430vvK4i8Fsm+JUM1R178qMk94FmQByT4Uc=;
	b=WgQ/4ElyS5aNhuy97NNHvBKunKDIA6Q87V3LrIztI4X/XAPMl8bXKL6gehmtLr0Xcbx1
	 7AJ8rAqWdJXxn8LanttYbt80Rrw0ISxZJ86HgejczW/694gqgZIAtcc/Y/djzi0PeD8Gw
	 zlKlvTUSKK0LDYftyJwFRkdjFYxtju/hJc5M0XcQjKoZFsMh4+a8T417NM2wketsWOiFK
	 bF+AWDSfTSjrdijxz6rIQeH/Irm/LZfRbHGhpzMdAGovrUngld6konjsLYPYHr0iGSRQd
	 60S50XXuYFQarCOpUV9NDiUKty9+tnGHN3GIw5JwHy+olhn4dIeyhEaEIb96NUu2TEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bVoR+jPa;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C98B606A331
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 16:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C98B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bVoR+jPa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795797764; x=1827333764;
  h=date:from:to:cc:subject:message-id;
  bh=nH2u/AP0qrzzJ01t8uaDxeV/v44vGklmCY+eELLt1nI=;
  b=bVoR+jPaB6wH5VQfEj7IJsc21wh11ZXoBXYye+ce8rdN9ACSXolQPeNR
   qEUvkhF7Nn+06GNiTKtf75l+zVlAorXfUNkLn9lMQYjxir+uHZPXAVRTo
   F7hUsZ+5Ec3rjbJcJrvbi0UjNU2PbYtzIJR+ouP3We/D/zCsAvkDS42+j
   oERynW4eC0LxQVQOgXwocf3mttcI9tuzGC5FD8cP7Mgx+RrY+mT/jTCGh
   I4WxCxFf8vZTCTWhIg95O5REBDPMCXWNVyjEPfsHGUygo/xe6lXi/jtsa
   /fd57ufozRt3IaNbxtM0+VisUgBGIHsS8oukRgMDw93KcFupRTu38T/3Z
   A==;
X-CSE-ConnectionGUID: aygrMgwkR+yl8VsEQjZnWA==
X-CSE-MsgGUID: I/j8fZzCT9WTSDqy2nZtgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4624302"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4624302"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 08:42:43 -0800
X-CSE-ConnectionGUID: zx06Ua9VSCizSCakii1+Bw==
X-CSE-MsgGUID: dH4CHMH/TVqYQw+OKr6F3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12449448"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 27 Nov 2026 08:42:41 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWz1z-000000000Et-0DI2;
	Fri, 27 Nov 2026 16:42:39 +0000
Date: Fri, 27 Nov 2026 17:41:58 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/irqchip/irq-mtk-cirq.c:93:2: error: call to undeclared function
 'irq_chip_mask_parent'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <20261127173925.6CDWO0gR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Zyta,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   5a9b268fa91d4a7dd6501b35be8cd969e4cff1fd
commit: 3a6f5d8bb93a24a08c3bcf615b349a5d93e4a265 [1/1] ANDROID: kconfig: Allow the MTK_IRQ to be unset
config: i386-randconfig-r2107-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127173925.6CDWO0gR-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127173925.6CDWO0gR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127173925.6CDWO0gR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-mtk-cirq.c:93:2: error: call to undeclared function 'irq_chip_mask_parent'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      93 |         irq_chip_mask_parent(data);
         |         ^
>> drivers/irqchip/irq-mtk-cirq.c:99:2: error: call to undeclared function 'irq_chip_unmask_parent'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      99 |         irq_chip_unmask_parent(data);
         |         ^
>> drivers/irqchip/irq-mtk-cirq.c:127:15: error: no member named 'parent_data' in 'struct irq_data'
     127 |         data = data->parent_data;
         |                ~~~~  ^
>> drivers/irqchip/irq-mtk-cirq.c:136:14: error: use of undeclared identifier 'irq_chip_eoi_parent'
     136 |         .irq_eoi                = irq_chip_eoi_parent,
         |                                   ^~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mtk-cirq.c:138:20: error: use of undeclared identifier 'irq_chip_retrigger_hierarchy'
     138 |         .irq_retrigger          = irq_chip_retrigger_hierarchy,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mtk-cirq.c:186:2: error: call to undeclared function 'irq_domain_set_hwirq_and_chip'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     186 |         irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
         |         ^
>> drivers/irqchip/irq-mtk-cirq.c:190:33: error: no member named 'parent' in 'struct irq_domain'
     190 |         parent_fwspec.fwnode = domain->parent->fwnode;
         |                                ~~~~~~  ^
>> drivers/irqchip/irq-mtk-cirq.c:191:9: error: call to undeclared function 'irq_domain_alloc_irqs_parent'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     191 |         return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs,
         |                ^
   drivers/irqchip/irq-mtk-cirq.c:191:9: note: did you mean 'irq_domain_alloc_irqs'?
   include/linux/irqdomain.h:702:19: note: 'irq_domain_alloc_irqs' declared here
     702 | static inline int irq_domain_alloc_irqs(struct irq_domain *domain,
         |                   ^
>> drivers/irqchip/irq-mtk-cirq.c:198:11: error: use of undeclared identifier 'irq_domain_free_irqs_common'; did you mean 'irq_domain_free_irqs'?
     198 |         .free           = irq_domain_free_irqs_common,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                           irq_domain_free_irqs
   include/linux/irqdomain.h:708:20: note: 'irq_domain_free_irqs' declared here
     708 | static inline void irq_domain_free_irqs(unsigned int virq,
         |                    ^
>> drivers/irqchip/irq-mtk-cirq.c:196:3: error: field designator 'translate' does not refer to any field in type 'const struct irq_domain_ops'
     196 |         .translate      = mtk_cirq_domain_translate,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mtk-cirq.c:197:3: error: field designator 'alloc' does not refer to any field in type 'const struct irq_domain_ops'
     197 |         .alloc          = mtk_cirq_domain_alloc,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mtk-cirq.c:198:3: error: field designator 'free' does not refer to any field in type 'const struct irq_domain_ops'
     198 |         .free           = irq_domain_free_irqs_common,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mtk-cirq.c:339:11: error: call to undeclared function 'irq_domain_add_hierarchy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     339 |         domain = irq_domain_add_hierarchy(domain_parent, 0,
         |                  ^
   drivers/irqchip/irq-mtk-cirq.c:339:11: note: did you mean 'irq_domain_is_hierarchy'?
   include/linux/irqdomain.h:711:20: note: 'irq_domain_is_hierarchy' declared here
     711 | static inline bool irq_domain_is_hierarchy(struct irq_domain *domain)
         |                    ^
>> drivers/irqchip/irq-mtk-cirq.c:339:9: error: incompatible integer to pointer conversion assigning to 'struct irq_domain *' from 'int' [-Wint-conversion]
     339 |         domain = irq_domain_add_hierarchy(domain_parent, 0,
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     340 |                                           irq_num, node,
         |                                           ~~~~~~~~~~~~~~
     341 |                                           &cirq_domain_ops, cirq_data);
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   14 errors generated.
--
>> drivers/irqchip/irq-mtk-sysirq.c:54:15: error: no member named 'parent_data' in 'struct irq_data'
      54 |         data = data->parent_data;
         |                ~~~~  ^
>> drivers/irqchip/irq-mtk-sysirq.c:62:15: error: use of undeclared identifier 'irq_chip_mask_parent'
      62 |         .irq_mask               = irq_chip_mask_parent,
         |                                   ^~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mtk-sysirq.c:63:17: error: use of undeclared identifier 'irq_chip_unmask_parent'
      63 |         .irq_unmask             = irq_chip_unmask_parent,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mtk-sysirq.c:64:14: error: use of undeclared identifier 'irq_chip_eoi_parent'
      64 |         .irq_eoi                = irq_chip_eoi_parent,
         |                                   ^~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mtk-sysirq.c:66:20: error: use of undeclared identifier 'irq_chip_retrigger_hierarchy'
      66 |         .irq_retrigger          = irq_chip_retrigger_hierarchy,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mtk-sysirq.c:67:22: error: use of undeclared identifier 'irq_chip_set_affinity_parent'
      67 |         .irq_set_affinity       = irq_chip_set_affinity_parent,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mtk-sysirq.c:109:3: error: call to undeclared function 'irq_domain_set_hwirq_and_chip'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     109 |                 irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
         |                 ^
>> drivers/irqchip/irq-mtk-sysirq.c:113:30: error: no member named 'parent' in 'struct irq_domain'
     113 |         gic_fwspec.fwnode = domain->parent->fwnode;
         |                             ~~~~~~  ^
>> drivers/irqchip/irq-mtk-sysirq.c:114:9: error: call to undeclared function 'irq_domain_alloc_irqs_parent'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     114 |         return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &gic_fwspec);
         |                ^
   drivers/irqchip/irq-mtk-sysirq.c:114:9: note: did you mean 'irq_domain_alloc_irqs'?
   include/linux/irqdomain.h:702:19: note: 'irq_domain_alloc_irqs' declared here
     702 | static inline int irq_domain_alloc_irqs(struct irq_domain *domain,
         |                   ^
>> drivers/irqchip/irq-mtk-sysirq.c:120:11: error: use of undeclared identifier 'irq_domain_free_irqs_common'; did you mean 'irq_domain_free_irqs'?
     120 |         .free           = irq_domain_free_irqs_common,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                           irq_domain_free_irqs
   include/linux/irqdomain.h:708:20: note: 'irq_domain_free_irqs' declared here
     708 | static inline void irq_domain_free_irqs(unsigned int virq,
         |                    ^
>> drivers/irqchip/irq-mtk-sysirq.c:118:3: error: field designator 'translate' does not refer to any field in type 'const struct irq_domain_ops'
     118 |         .translate      = mtk_sysirq_domain_translate,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mtk-sysirq.c:119:3: error: field designator 'alloc' does not refer to any field in type 'const struct irq_domain_ops'
     119 |         .alloc          = mtk_sysirq_domain_alloc,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mtk-sysirq.c:120:3: error: field designator 'free' does not refer to any field in type 'const struct irq_domain_ops'
     120 |         .free           = irq_domain_free_irqs_common,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mtk-sysirq.c:210:11: error: call to undeclared function 'irq_domain_add_hierarchy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     210 |         domain = irq_domain_add_hierarchy(domain_parent, 0, intpol_num, node,
         |                  ^
   drivers/irqchip/irq-mtk-sysirq.c:210:11: note: did you mean 'irq_domain_is_hierarchy'?
   include/linux/irqdomain.h:711:20: note: 'irq_domain_is_hierarchy' declared here
     711 | static inline bool irq_domain_is_hierarchy(struct irq_domain *domain)
         |                    ^
>> drivers/irqchip/irq-mtk-sysirq.c:210:9: error: incompatible integer to pointer conversion assigning to 'struct irq_domain *' from 'int' [-Wint-conversion]
     210 |         domain = irq_domain_add_hierarchy(domain_parent, 0, intpol_num, node,
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     211 |                                           &sysirq_domain_ops, chip_data);
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   15 errors generated.


vim +/irq_chip_mask_parent +93 drivers/irqchip/irq-mtk-cirq.c

9dbbbd33aafaf1f Youlin Pei 2017-04-07   89  
9dbbbd33aafaf1f Youlin Pei 2017-04-07   90  static void mtk_cirq_mask(struct irq_data *data)
9dbbbd33aafaf1f Youlin Pei 2017-04-07   91  {
9dbbbd33aafaf1f Youlin Pei 2017-04-07   92  	mtk_cirq_write_mask(data, CIRQ_MASK_SET);
9dbbbd33aafaf1f Youlin Pei 2017-04-07  @93  	irq_chip_mask_parent(data);
9dbbbd33aafaf1f Youlin Pei 2017-04-07   94  }
9dbbbd33aafaf1f Youlin Pei 2017-04-07   95  
9dbbbd33aafaf1f Youlin Pei 2017-04-07   96  static void mtk_cirq_unmask(struct irq_data *data)
9dbbbd33aafaf1f Youlin Pei 2017-04-07   97  {
9dbbbd33aafaf1f Youlin Pei 2017-04-07   98  	mtk_cirq_write_mask(data, CIRQ_MASK_CLR);
9dbbbd33aafaf1f Youlin Pei 2017-04-07  @99  	irq_chip_unmask_parent(data);
9dbbbd33aafaf1f Youlin Pei 2017-04-07  100  }
9dbbbd33aafaf1f Youlin Pei 2017-04-07  101  
9dbbbd33aafaf1f Youlin Pei 2017-04-07  102  static int mtk_cirq_set_type(struct irq_data *data, unsigned int type)
9dbbbd33aafaf1f Youlin Pei 2017-04-07  103  {
9dbbbd33aafaf1f Youlin Pei 2017-04-07  104  	int ret;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  105  
9dbbbd33aafaf1f Youlin Pei 2017-04-07  106  	switch (type & IRQ_TYPE_SENSE_MASK) {
9dbbbd33aafaf1f Youlin Pei 2017-04-07  107  	case IRQ_TYPE_EDGE_FALLING:
9dbbbd33aafaf1f Youlin Pei 2017-04-07  108  		mtk_cirq_write_mask(data, CIRQ_POL_CLR);
9dbbbd33aafaf1f Youlin Pei 2017-04-07  109  		mtk_cirq_write_mask(data, CIRQ_SENS_CLR);
9dbbbd33aafaf1f Youlin Pei 2017-04-07  110  		break;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  111  	case IRQ_TYPE_EDGE_RISING:
9dbbbd33aafaf1f Youlin Pei 2017-04-07  112  		mtk_cirq_write_mask(data, CIRQ_POL_SET);
9dbbbd33aafaf1f Youlin Pei 2017-04-07  113  		mtk_cirq_write_mask(data, CIRQ_SENS_CLR);
9dbbbd33aafaf1f Youlin Pei 2017-04-07  114  		break;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  115  	case IRQ_TYPE_LEVEL_LOW:
9dbbbd33aafaf1f Youlin Pei 2017-04-07  116  		mtk_cirq_write_mask(data, CIRQ_POL_CLR);
9dbbbd33aafaf1f Youlin Pei 2017-04-07  117  		mtk_cirq_write_mask(data, CIRQ_SENS_SET);
9dbbbd33aafaf1f Youlin Pei 2017-04-07  118  		break;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  119  	case IRQ_TYPE_LEVEL_HIGH:
9dbbbd33aafaf1f Youlin Pei 2017-04-07  120  		mtk_cirq_write_mask(data, CIRQ_POL_SET);
9dbbbd33aafaf1f Youlin Pei 2017-04-07  121  		mtk_cirq_write_mask(data, CIRQ_SENS_SET);
9dbbbd33aafaf1f Youlin Pei 2017-04-07  122  		break;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  123  	default:
9dbbbd33aafaf1f Youlin Pei 2017-04-07  124  		break;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  125  	}
9dbbbd33aafaf1f Youlin Pei 2017-04-07  126  
9dbbbd33aafaf1f Youlin Pei 2017-04-07 @127  	data = data->parent_data;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  128  	ret = data->chip->irq_set_type(data, type);
9dbbbd33aafaf1f Youlin Pei 2017-04-07  129  	return ret;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  130  }
9dbbbd33aafaf1f Youlin Pei 2017-04-07  131  
9dbbbd33aafaf1f Youlin Pei 2017-04-07  132  static struct irq_chip mtk_cirq_chip = {
9dbbbd33aafaf1f Youlin Pei 2017-04-07  133  	.name			= "MT_CIRQ",
9dbbbd33aafaf1f Youlin Pei 2017-04-07  134  	.irq_mask		= mtk_cirq_mask,
9dbbbd33aafaf1f Youlin Pei 2017-04-07  135  	.irq_unmask		= mtk_cirq_unmask,
9dbbbd33aafaf1f Youlin Pei 2017-04-07 @136  	.irq_eoi		= irq_chip_eoi_parent,
9dbbbd33aafaf1f Youlin Pei 2017-04-07  137  	.irq_set_type		= mtk_cirq_set_type,
9dbbbd33aafaf1f Youlin Pei 2017-04-07 @138  	.irq_retrigger		= irq_chip_retrigger_hierarchy,
9dbbbd33aafaf1f Youlin Pei 2017-04-07  139  #ifdef CONFIG_SMP
9dbbbd33aafaf1f Youlin Pei 2017-04-07  140  	.irq_set_affinity	= irq_chip_set_affinity_parent,
9dbbbd33aafaf1f Youlin Pei 2017-04-07  141  #endif
9dbbbd33aafaf1f Youlin Pei 2017-04-07  142  };
9dbbbd33aafaf1f Youlin Pei 2017-04-07  143  
9dbbbd33aafaf1f Youlin Pei 2017-04-07  144  static int mtk_cirq_domain_translate(struct irq_domain *d,
9dbbbd33aafaf1f Youlin Pei 2017-04-07  145  				     struct irq_fwspec *fwspec,
9dbbbd33aafaf1f Youlin Pei 2017-04-07  146  				     unsigned long *hwirq,
9dbbbd33aafaf1f Youlin Pei 2017-04-07  147  				     unsigned int *type)
9dbbbd33aafaf1f Youlin Pei 2017-04-07  148  {
9dbbbd33aafaf1f Youlin Pei 2017-04-07  149  	if (is_of_node(fwspec->fwnode)) {
9dbbbd33aafaf1f Youlin Pei 2017-04-07  150  		if (fwspec->param_count != 3)
9dbbbd33aafaf1f Youlin Pei 2017-04-07  151  			return -EINVAL;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  152  
9dbbbd33aafaf1f Youlin Pei 2017-04-07  153  		/* No PPI should point to this domain */
9dbbbd33aafaf1f Youlin Pei 2017-04-07  154  		if (fwspec->param[0] != 0)
9dbbbd33aafaf1f Youlin Pei 2017-04-07  155  			return -EINVAL;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  156  
9dbbbd33aafaf1f Youlin Pei 2017-04-07  157  		/* cirq support irq number check */
9dbbbd33aafaf1f Youlin Pei 2017-04-07  158  		if (fwspec->param[1] < cirq_data->ext_irq_start ||
9dbbbd33aafaf1f Youlin Pei 2017-04-07  159  		    fwspec->param[1] > cirq_data->ext_irq_end)
9dbbbd33aafaf1f Youlin Pei 2017-04-07  160  			return -EINVAL;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  161  
9dbbbd33aafaf1f Youlin Pei 2017-04-07  162  		*hwirq = fwspec->param[1] - cirq_data->ext_irq_start;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  163  		*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  164  		return 0;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  165  	}
9dbbbd33aafaf1f Youlin Pei 2017-04-07  166  
9dbbbd33aafaf1f Youlin Pei 2017-04-07  167  	return -EINVAL;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  168  }
9dbbbd33aafaf1f Youlin Pei 2017-04-07  169  
9dbbbd33aafaf1f Youlin Pei 2017-04-07  170  static int mtk_cirq_domain_alloc(struct irq_domain *domain, unsigned int virq,
9dbbbd33aafaf1f Youlin Pei 2017-04-07  171  				 unsigned int nr_irqs, void *arg)
9dbbbd33aafaf1f Youlin Pei 2017-04-07  172  {
9dbbbd33aafaf1f Youlin Pei 2017-04-07  173  	int ret;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  174  	irq_hw_number_t hwirq;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  175  	unsigned int type;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  176  	struct irq_fwspec *fwspec = arg;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  177  	struct irq_fwspec parent_fwspec = *fwspec;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  178  
9dbbbd33aafaf1f Youlin Pei 2017-04-07  179  	ret = mtk_cirq_domain_translate(domain, fwspec, &hwirq, &type);
9dbbbd33aafaf1f Youlin Pei 2017-04-07  180  	if (ret)
9dbbbd33aafaf1f Youlin Pei 2017-04-07  181  		return ret;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  182  
9dbbbd33aafaf1f Youlin Pei 2017-04-07  183  	if (WARN_ON(nr_irqs != 1))
9dbbbd33aafaf1f Youlin Pei 2017-04-07  184  		return -EINVAL;
9dbbbd33aafaf1f Youlin Pei 2017-04-07  185  
9dbbbd33aafaf1f Youlin Pei 2017-04-07 @186  	irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
9dbbbd33aafaf1f Youlin Pei 2017-04-07  187  				      &mtk_cirq_chip,
9dbbbd33aafaf1f Youlin Pei 2017-04-07  188  				      domain->host_data);
9dbbbd33aafaf1f Youlin Pei 2017-04-07  189  
9dbbbd33aafaf1f Youlin Pei 2017-04-07 @190  	parent_fwspec.fwnode = domain->parent->fwnode;
9dbbbd33aafaf1f Youlin Pei 2017-04-07 @191  	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs,
9dbbbd33aafaf1f Youlin Pei 2017-04-07  192  					    &parent_fwspec);
9dbbbd33aafaf1f Youlin Pei 2017-04-07  193  }
9dbbbd33aafaf1f Youlin Pei 2017-04-07  194  
9dbbbd33aafaf1f Youlin Pei 2017-04-07  195  static const struct irq_domain_ops cirq_domain_ops = {
9dbbbd33aafaf1f Youlin Pei 2017-04-07 @196  	.translate	= mtk_cirq_domain_translate,
9dbbbd33aafaf1f Youlin Pei 2017-04-07 @197  	.alloc		= mtk_cirq_domain_alloc,
9dbbbd33aafaf1f Youlin Pei 2017-04-07 @198  	.free		= irq_domain_free_irqs_common,
9dbbbd33aafaf1f Youlin Pei 2017-04-07  199  };
9dbbbd33aafaf1f Youlin Pei 2017-04-07  200  

:::::: The code at line 93 was first introduced by commit
:::::: 9dbbbd33aafaf1f95b1cce940bdf4331cd8b822e irqchip: Add Mediatek mtk-cirq driver

:::::: TO: Youlin Pei <youlin.pei@mediatek.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
