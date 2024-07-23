Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05508F70
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 08:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721724206; cv=none; b=GLGuV/iqq9s0jtsmOW9U821mUSp/jwblfOl6oj0u9IVV3E/e/pklKHBr3ZixPalOdkn3kBHGCV56cs6Sy4ZMyiJ546zr3i4LtpKlcgtTuLpzcIhMBFZfdWysHI2eXipvOp2WQGt2B/Ngw59K+23RTF75aRFhb6JVnXlGb1z6jHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721724206; c=relaxed/simple;
	bh=3f/nhS6EqGB2twKtptRu1U2buH6kgUF5RoZTGjiCvWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TTmPMwVP11mJM8rQO/gAjlmZDZQMJE5iSGi6Ep3JMGeRdJ6TqU+NEjQdfmdc5urNegoGrMawOfUCISqPhisANlmedXKBWSOjowQQ+bKIr9SphNRGyyNH+oP748Ynw4nhXdf8OiRFyxPVKQj5YQ6Ic6rKAJsZgkuec6GOfpDCUk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q/mMbjFv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q/mMbjFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721724203; x=1753260203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3f/nhS6EqGB2twKtptRu1U2buH6kgUF5RoZTGjiCvWk=;
  b=Q/mMbjFv27ZlWnG/ZPWTyhc5nw/TWtv7LEh9qEtRHOhTW/MHCa9IEiex
   htitZucqoaGLICEz9/gbtjyJjcmgE0Gyiz7U0pEIQw3zkvqvV+0jmQBmj
   50ersJCLJ+uVhMpjgLFTz/qIHbBsoBP4VD2edsQCKJf5geVSVXJSUt2dz
   bi3NUNXOJftci3Boc7Q1P1J7HkexgarKCHLjnztpAJLtj9VvUZxUK4KVZ
   /qdCeXM9Bp47MoamowXJPJZU76Sxxdglomx6Xsw3DeMuV3zDcpBK3Fgf1
   f726rbzOx1pmOWl6s2SXgUYPTWQ+6zys5nFM8LQpTgQKtl2DtWgAQIKNf
   Q==;
X-CSE-ConnectionGUID: QUQpYae2T5eMwlMn1YhE5g==
X-CSE-MsgGUID: Zz/RydszRsOp5vfPiB/+WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="29995542"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="29995542"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 01:43:23 -0700
X-CSE-ConnectionGUID: MuXUQ+eXR5+xF+YaoUA/Mw==
X-CSE-MsgGUID: pTb5KpVCQyKzzDsq12rA7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="51867936"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Jul 2024 01:43:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWB7A-000lnV-0j;
	Tue, 23 Jul 2024 08:43:20 +0000
Date: Tue, 23 Jul 2024 16:42:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 38/39] drivers/irqchip/irq-sunxi-nmi.c:101:32:
 error: 'struct irq_chip_regs' has no member named 'type'
Message-ID: <202407231647.WfjFTxxx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   1e1bdb344732a802f35083905524f9dd512d776d
commit: 0437480ae45fc31a35c0a12e1cde2d3587d04d94 [38/39] irq: Remove irq_chip_regs' type & polarity
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240723/202407231647.WfjFTxxx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407231647.WfjFTxxx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407231647.WfjFTxxx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-sunxi-nmi.c: In function 'sunxi_sc_nmi_set_type':
>> drivers/irqchip/irq-sunxi-nmi.c:101:32: error: 'struct irq_chip_regs' has no member named 'type'
     101 |         u32 ctrl_off = ct->regs.type;
         |                                ^
   drivers/irqchip/irq-sunxi-nmi.c:133:44: error: 'struct irq_chip_regs' has no member named 'type'
     133 |                         ctrl_off = ct->regs.type;
         |                                            ^
   drivers/irqchip/irq-sunxi-nmi.c: In function 'sunxi_sc_nmi_irq_init':
   drivers/irqchip/irq-sunxi-nmi.c:192:31: error: 'struct irq_chip_regs' has no member named 'type'
     192 |         gc->chip_types[0].regs.type             = reg_offs->ctrl;
         |                               ^
   drivers/irqchip/irq-sunxi-nmi.c:201:31: error: 'struct irq_chip_regs' has no member named 'type'
     201 |         gc->chip_types[1].regs.type             = reg_offs->ctrl;
         |                               ^


vim +101 drivers/irqchip/irq-sunxi-nmi.c

6058bb362818e0 Carlo Caione 2014-03-19   95  
6058bb362818e0 Carlo Caione 2014-03-19   96  static int sunxi_sc_nmi_set_type(struct irq_data *data, unsigned int flow_type)
6058bb362818e0 Carlo Caione 2014-03-19   97  {
6058bb362818e0 Carlo Caione 2014-03-19   98  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(data);
6058bb362818e0 Carlo Caione 2014-03-19   99  	struct irq_chip_type *ct = gc->chip_types;
6058bb362818e0 Carlo Caione 2014-03-19  100  	u32 src_type_reg;
6058bb362818e0 Carlo Caione 2014-03-19 @101  	u32 ctrl_off = ct->regs.type;
6058bb362818e0 Carlo Caione 2014-03-19  102  	unsigned int src_type;
6058bb362818e0 Carlo Caione 2014-03-19  103  	unsigned int i;
6058bb362818e0 Carlo Caione 2014-03-19  104  
6058bb362818e0 Carlo Caione 2014-03-19  105  	irq_gc_lock(gc);
6058bb362818e0 Carlo Caione 2014-03-19  106  
6058bb362818e0 Carlo Caione 2014-03-19  107  	switch (flow_type & IRQF_TRIGGER_MASK) {
6058bb362818e0 Carlo Caione 2014-03-19  108  	case IRQ_TYPE_EDGE_FALLING:
6058bb362818e0 Carlo Caione 2014-03-19  109  		src_type = SUNXI_SRC_TYPE_EDGE_FALLING;
6058bb362818e0 Carlo Caione 2014-03-19  110  		break;
6058bb362818e0 Carlo Caione 2014-03-19  111  	case IRQ_TYPE_EDGE_RISING:
6058bb362818e0 Carlo Caione 2014-03-19  112  		src_type = SUNXI_SRC_TYPE_EDGE_RISING;
6058bb362818e0 Carlo Caione 2014-03-19  113  		break;
6058bb362818e0 Carlo Caione 2014-03-19  114  	case IRQ_TYPE_LEVEL_HIGH:
6058bb362818e0 Carlo Caione 2014-03-19  115  		src_type = SUNXI_SRC_TYPE_LEVEL_HIGH;
6058bb362818e0 Carlo Caione 2014-03-19  116  		break;
6058bb362818e0 Carlo Caione 2014-03-19  117  	case IRQ_TYPE_NONE:
6058bb362818e0 Carlo Caione 2014-03-19  118  	case IRQ_TYPE_LEVEL_LOW:
6058bb362818e0 Carlo Caione 2014-03-19  119  		src_type = SUNXI_SRC_TYPE_LEVEL_LOW;
6058bb362818e0 Carlo Caione 2014-03-19  120  		break;
6058bb362818e0 Carlo Caione 2014-03-19  121  	default:
6058bb362818e0 Carlo Caione 2014-03-19  122  		irq_gc_unlock(gc);
2d6caaed0997f3 Chen-Yu Tsai 2015-10-06  123  		pr_err("Cannot assign multiple trigger modes to IRQ %d.\n",
2d6caaed0997f3 Chen-Yu Tsai 2015-10-06  124  			data->irq);
6058bb362818e0 Carlo Caione 2014-03-19  125  		return -EBADR;
6058bb362818e0 Carlo Caione 2014-03-19  126  	}
6058bb362818e0 Carlo Caione 2014-03-19  127  
6058bb362818e0 Carlo Caione 2014-03-19  128  	irqd_set_trigger_type(data, flow_type);
6058bb362818e0 Carlo Caione 2014-03-19  129  	irq_setup_alt_chip(data, flow_type);
6058bb362818e0 Carlo Caione 2014-03-19  130  
febe06962ab191 Axel Lin     2015-06-07  131  	for (i = 0; i < gc->num_ct; i++, ct++)
6058bb362818e0 Carlo Caione 2014-03-19  132  		if (ct->type & flow_type)
6058bb362818e0 Carlo Caione 2014-03-19  133  			ctrl_off = ct->regs.type;
6058bb362818e0 Carlo Caione 2014-03-19  134  
6058bb362818e0 Carlo Caione 2014-03-19  135  	src_type_reg = sunxi_sc_nmi_read(gc, ctrl_off);
6058bb362818e0 Carlo Caione 2014-03-19  136  	src_type_reg &= ~SUNXI_NMI_SRC_TYPE_MASK;
6058bb362818e0 Carlo Caione 2014-03-19  137  	src_type_reg |= src_type;
6058bb362818e0 Carlo Caione 2014-03-19  138  	sunxi_sc_nmi_write(gc, ctrl_off, src_type_reg);
6058bb362818e0 Carlo Caione 2014-03-19  139  
6058bb362818e0 Carlo Caione 2014-03-19  140  	irq_gc_unlock(gc);
6058bb362818e0 Carlo Caione 2014-03-19  141  
6058bb362818e0 Carlo Caione 2014-03-19  142  	return IRQ_SET_MASK_OK;
6058bb362818e0 Carlo Caione 2014-03-19  143  }
6058bb362818e0 Carlo Caione 2014-03-19  144  

:::::: The code at line 101 was first introduced by commit
:::::: 6058bb362818e09990de722e983a7f2874e7f61c ARM: sun7i/sun6i: irqchip: Add irqchip driver for NMI controller

:::::: TO: Carlo Caione <carlo@caione.org>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
