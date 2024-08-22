Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EA01D1733
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 21:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724362629; cv=none; b=gSKx172O0iDVFuXfKbenBrZtyi2vbqPAQnt66v05g8+St1p/31JaBm8UCb50bix0N8WkVGma3Y//9KQdUYHZDKZPWFZS1sWKwz/21WvY0xgyAsB2e0CcJkAve/66mQHoZF2OuyROc4IQlyzHZheAVP20bJpf0gKB+DA8l8L6Djk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724362629; c=relaxed/simple;
	bh=icQnrCzDD/QHiymbI340Kuyyn1Ca7Gddfa0MRaGXDZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B5maAQ6Ffx4nJr1fAFs0j9xkxCFFh7NN8nOJ3ejtVG3Sf2pWf1Md8zqg8I/EsQlW1aL7SnGQeKIeJixBiUALY0kFUG5SQtpRxlobx0O4n/9SNOwEdtIGUP+VL+UZA1YmoJr5eOSjQUpk7IOEHFEF1Llky+rXCAA+TJrhfR36R6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tpaz0k2p; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tpaz0k2p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724362627; x=1755898627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=icQnrCzDD/QHiymbI340Kuyyn1Ca7Gddfa0MRaGXDZI=;
  b=Tpaz0k2p/lp+dzutk4Lh+B+jqss4AoKZGCmAvL5hjwY6YBfmoLhDojCb
   CYaVEFOmhv/wfONmxCevMOf+EZ86ztfqUeZQDDu7HPRgTS7X4+ReLUTec
   P6CYKRqn1nnSPS1xOdwIbWsufqObjRcq2UGhxv2ieQdiUhHXsx7pCy2u6
   /BlDvb+KgLx7MayIRPZDQvp0kJXr3f+pkIncbgkRtmd1D7yJrRPp+jwVO
   AzQ7/LftdjEaxB1BAp7GMMFTtdZB/sUyOTWvReq5Lkkw+3Qd16HjWLtWL
   Q1JLkFk0PufqaTsyRIJGSLmdWFb6wnrhIk4zoloovegiHl0PnsTJ5rhyo
   w==;
X-CSE-ConnectionGUID: w8fJ78ZTTPWwHEP7zhKwjg==
X-CSE-MsgGUID: MDQIJ/NrTWCeVdLZF6rIOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22973250"
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; 
   d="scan'208";a="22973250"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 14:37:07 -0700
X-CSE-ConnectionGUID: 2ffUV8QAQHuprfxMizfYwQ==
X-CSE-MsgGUID: RQy+U63LR4mpzcCdL5sW/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; 
   d="scan'208";a="66487955"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Aug 2024 14:37:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shFUM-000DD6-0d;
	Thu, 22 Aug 2024 21:37:02 +0000
Date: Fri, 23 Aug 2024 05:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: Yue Haibing <yuehaibing@huawei.com>, anup@brainfault.org,
	tglx@linutronix.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, ruanjinjie@huawei.com, bjorn@rivosinc.com
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, yuehaibing@huawei.com
Subject: Re: [PATCH -next] irqchip/riscv-aplic: Fix NULL vs IS_ERR() bug
Message-ID: <202408230558.er4j09Nd-lkp@intel.com>
References: <20240820132857.247679-1-yuehaibing@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820132857.247679-1-yuehaibing@huawei.com>

Hi Yue,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240820]

url:    https://github.com/intel-lab-lkp/linux/commits/Yue-Haibing/irqchip-riscv-aplic-Fix-NULL-vs-IS_ERR-bug/20240820-213521
base:   next-20240820
patch link:    https://lore.kernel.org/r/20240820132857.247679-1-yuehaibing%40huawei.com
patch subject: [PATCH -next] irqchip/riscv-aplic: Fix NULL vs IS_ERR() bug
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240823/202408230558.er4j09Nd-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408230558.er4j09Nd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408230558.er4j09Nd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/irqchip/irq-riscv-aplic-main.c: In function 'aplic_probe':
>> drivers/irqchip/irq-riscv-aplic-main.c:178:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     178 |         if (IS_ERR(regs))
         |         ^~
   drivers/irqchip/irq-riscv-aplic-main.c:180:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     180 |                 return PTR_ERR(regs);
         |                 ^~~~~~
>> drivers/irqchip/irq-riscv-aplic-main.c:174:13: warning: unused variable 'rc' [-Wunused-variable]
     174 |         int rc;
         |             ^~
>> drivers/irqchip/irq-riscv-aplic-main.c:172:14: warning: unused variable 'msi_mode' [-Wunused-variable]
     172 |         bool msi_mode = false;
         |              ^~~~~~~~
   drivers/irqchip/irq-riscv-aplic-main.c: At top level:
>> drivers/irqchip/irq-riscv-aplic-main.c:187:9: warning: data definition has no type or storage class
     187 |         msi_mode = of_property_present(to_of_node(dev->fwnode), "msi-parent");
         |         ^~~~~~~~
>> drivers/irqchip/irq-riscv-aplic-main.c:187:9: error: type defaults to 'int' in declaration of 'msi_mode' [-Wimplicit-int]
   In file included from drivers/irqchip/irq-riscv-aplic-main.c:10:
>> include/linux/of.h:168:9: error: braced-group within expression allowed only inside a function
     168 |         ({                                                              \
         |         ^
   drivers/irqchip/irq-riscv-aplic-main.c:187:40: note: in expansion of macro 'to_of_node'
     187 |         msi_mode = of_property_present(to_of_node(dev->fwnode), "msi-parent");
         |                                        ^~~~~~~~~~
>> drivers/irqchip/irq-riscv-aplic-main.c:188:9: error: expected identifier or '(' before 'if'
     188 |         if (msi_mode)
         |         ^~
>> drivers/irqchip/irq-riscv-aplic-main.c:190:9: error: expected identifier or '(' before 'else'
     190 |         else
         |         ^~~~
   drivers/irqchip/irq-riscv-aplic-main.c:192:9: error: expected identifier or '(' before 'if'
     192 |         if (rc)
         |         ^~
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/irqchip/irq-riscv-aplic-main.c:12:
>> include/linux/dev_printk.h:111:10: error: expected identifier or '(' before ')' token
     111 |         })
         |          ^
   include/linux/dev_printk.h:154:9: note: in expansion of macro 'dev_printk_index_wrap'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-riscv-aplic-main.c:193:17: note: in expansion of macro 'dev_err'
     193 |                 dev_err(dev, "failed to setup APLIC in %s mode\n", msi_mode ? "MSI" : "direct");
         |                 ^~~~~~~
>> drivers/irqchip/irq-riscv-aplic-main.c:195:9: error: expected identifier or '(' before 'return'
     195 |         return rc;
         |         ^~~~~~
>> drivers/irqchip/irq-riscv-aplic-main.c:196:1: error: expected identifier or '(' before '}' token
     196 | }
         | ^


vim +187 drivers/irqchip/irq-riscv-aplic-main.c

2333df5ae51ead Anup Patel  2024-03-07  168  
2333df5ae51ead Anup Patel  2024-03-07  169  static int aplic_probe(struct platform_device *pdev)
2333df5ae51ead Anup Patel  2024-03-07  170  {
2333df5ae51ead Anup Patel  2024-03-07  171  	struct device *dev = &pdev->dev;
2333df5ae51ead Anup Patel  2024-03-07 @172  	bool msi_mode = false;
2333df5ae51ead Anup Patel  2024-03-07  173  	void __iomem *regs;
2333df5ae51ead Anup Patel  2024-03-07 @174  	int rc;
2333df5ae51ead Anup Patel  2024-03-07  175  
2333df5ae51ead Anup Patel  2024-03-07  176  	/* Map the MMIO registers */
2333df5ae51ead Anup Patel  2024-03-07  177  	regs = devm_platform_ioremap_resource(pdev, 0);
bb109b384dab1e Yue Haibing 2024-08-20 @178  	if (IS_ERR(regs))
2333df5ae51ead Anup Patel  2024-03-07  179  		dev_err(dev, "failed map MMIO registers\n");
bb109b384dab1e Yue Haibing 2024-08-20  180  		return PTR_ERR(regs);
2333df5ae51ead Anup Patel  2024-03-07  181  	}
2333df5ae51ead Anup Patel  2024-03-07  182  
2333df5ae51ead Anup Patel  2024-03-07  183  	/*
2333df5ae51ead Anup Patel  2024-03-07  184  	 * If msi-parent property is present then setup APLIC MSI
2333df5ae51ead Anup Patel  2024-03-07  185  	 * mode otherwise setup APLIC direct mode.
2333df5ae51ead Anup Patel  2024-03-07  186  	 */
2333df5ae51ead Anup Patel  2024-03-07 @187  	msi_mode = of_property_present(to_of_node(dev->fwnode), "msi-parent");
2333df5ae51ead Anup Patel  2024-03-07 @188  	if (msi_mode)
ca8df97fe6798a Anup Patel  2024-03-07  189  		rc = aplic_msi_setup(dev, regs);
2333df5ae51ead Anup Patel  2024-03-07 @190  	else
2333df5ae51ead Anup Patel  2024-03-07  191  		rc = aplic_direct_setup(dev, regs);
2333df5ae51ead Anup Patel  2024-03-07  192  	if (rc)
2333df5ae51ead Anup Patel  2024-03-07  193  		dev_err(dev, "failed to setup APLIC in %s mode\n", msi_mode ? "MSI" : "direct");
2333df5ae51ead Anup Patel  2024-03-07  194  
2333df5ae51ead Anup Patel  2024-03-07 @195  	return rc;
2333df5ae51ead Anup Patel  2024-03-07 @196  }
2333df5ae51ead Anup Patel  2024-03-07  197  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
