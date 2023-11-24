Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE8825749
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 14:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CN+qfPvD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700836812; x=1732372812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2TlKuBqfIezerweplaVRJ4dVYmDdZeAt2UodjUMAIP8=;
  b=CN+qfPvD8FbwE9t5MSeG4jhDJvkDZvLmi7KVvHemnjYk/fuwDbXS1iUZ
   cjYb9EHK9xd0+y7kpLUvLmQHqS0pAKHt9mHWicDTEfzkF1Jd+h3wwMG7F
   TJblfjt/mcKwXyoNDHfWZPnFdywMsMttvEXvJlG8yi3JIrTGLVyOBRyDg
   d6ZRYF7TbCDALrS7P9YoJ359NE8vbi/ZQ6ZcyznTynu2VKaMWYVsj5wL1
   Ix/MP7OHO2hZAJyqWmLiOOi09mTkvUImSZDxuY3zOiAQrga7E5Wx1PAJY
   vQJojAFsxnau8OZBUrmD49wgethtwb4Z+Oh88TQHh1JikX+ZjC8fAg1xH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="11110365"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="11110365"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 06:40:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="911464617"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="911464617"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2023 06:40:09 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6XLj-0002tw-14;
	Fri, 24 Nov 2023 14:40:07 +0000
Date: Fri, 24 Nov 2023 22:39:44 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Seiler <c.seiler@luxflux.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] [RFC] gpio: adv-pcie-1761h: Add Advantech PCIe-1761H
 support
Message-ID: <202311241509.mnaHltA3-lkp@intel.com>
References: <b7e8e35fc4534a2c928853dfacd3d55d88f2033e.camel@luxflux.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7e8e35fc4534a2c928853dfacd3d55d88f2033e.camel@luxflux.de>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Seiler/gpio-adv-pcie-1761h-Add-Advantech-PCIe-1761H-support/20231120-232211
base:   linus/master
patch link:    https://lore.kernel.org/r/b7e8e35fc4534a2c928853dfacd3d55d88f2033e.camel%40luxflux.de
patch subject: [PATCH] [RFC] gpio: adv-pcie-1761h: Add Advantech PCIe-1761H support
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20231124/202311241509.mnaHltA3-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241509.mnaHltA3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241509.mnaHltA3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-adv-pcie-1761h.c:374:13: warning: no previous prototype for 'adv_pcie_1761h_irq_handler' [-Wmissing-prototypes]
     374 | irqreturn_t adv_pcie_1761h_irq_handler(int irq, void *data)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/adv_pcie_1761h_irq_handler +374 drivers/gpio/gpio-adv-pcie-1761h.c

   373	
 > 374	irqreturn_t adv_pcie_1761h_irq_handler(int irq, void *data)
   375	{
   376		struct adv_pcie_1761h_gpiochip *card = data;
   377		unsigned long pending;
   378	
   379		if (card == NULL)
   380			return IRQ_HANDLED;
   381	
   382		/* Read out which lines were set */
   383		raw_spin_lock(&card->lock);
   384		pending = ioread32(card->control_regs + PCIE1761H_OFFSET_IRQFLAG);
   385		raw_spin_unlock(&card->lock);
   386	
   387		if (!pending)
   388			return IRQ_NONE;
   389	
   390		for_each_set_bit(irq, &pending, card->chip.ngpio - 8)
   391			generic_handle_domain_irq(card->chip.irq.domain, irq + 8);
   392	
   393		/* Reset the IRQ flags for those lines */
   394		raw_spin_lock(&card->lock);
   395		iowrite32(pending, card->control_regs + PCIE1761H_OFFSET_IRQFLAG);
   396		raw_spin_unlock(&card->lock);
   397	
   398		return IRQ_HANDLED;
   399	}
   400	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
