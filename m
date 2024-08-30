Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B0118E378
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725023535; cv=none; b=bIukgD2EuVOpo+karhnJFcjJwFIZ+s+Oa+v/i8+xA9ddJhFZq+xU9MzbwvmSySHIb/Sp0QjYSTka9wrnDQ0/R6V3/RL703/joIa4TJpKlD7tXFfPdrj5pS2NC7fLLPLklfzrdGq0wN81yVv9Tf993xasUqpMkzmdHaKZgFZnP6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725023535; c=relaxed/simple;
	bh=lcibnXlwWwJcUfD0TVVJ8HjAXqctBdkJA4KQZ2411wI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bL2DM9SuUUEMrfcU1PnySdBRZ7ROv67S57klypNOVIwyFRUbzp1qi/AQXhNQ5JGd01B6p/LbUYxaAe3zPNfMzDJg8WH2Ja58wjT84SrBg+vPXGfN7f6HylaEb95zZIFsVfHH0uyzTBonm10Ae/R8F16Q/wNZ59dS8YmM0lIFPwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bzmb87NF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bzmb87NF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725023534; x=1756559534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lcibnXlwWwJcUfD0TVVJ8HjAXqctBdkJA4KQZ2411wI=;
  b=Bzmb87NFv1Ciquuzjks9G9bcsrwGN72hOPFpx0nZiScz7yxCr5/DKNKs
   vlpz9S5j5gnz9h3NO3v37sXhywAn+ARp+YKJC1HttLKg/xkg7GUNGlyMN
   aR1C/Vk4uf1avQ2UK5QHh/LZ/QSLg0LqiHGo5Cda8BWdVdjHrvcIrfrNR
   2MF/IfNpj3dC0GVNMnTT9wuTHHCgihigd08CoLt+rMgoRmoM1BNBH49Qg
   AoJOAOUZZfx7qjLRRsK0SgZfZlX92iSJO5A8FSgiTKR5nU3dTWDXo/o6N
   FtbMUTY3BDEHJ5/JepD6ePDt2Z/BPV9qiAk1MtqC1AnZFEF2Q+TdkBCPQ
   w==;
X-CSE-ConnectionGUID: NrSIfYozT6+i8F7F8GRm9g==
X-CSE-MsgGUID: Zz0/P8T4TAS3Ii+jiondxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23544395"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="23544395"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 06:12:12 -0700
X-CSE-ConnectionGUID: WVbgAZdRQDy4Wtp498hOCA==
X-CSE-MsgGUID: QZP6X5WzRwePnS1EAiQaKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="63518054"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Aug 2024 06:12:10 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sk1Q8-0001Ul-0P;
	Fri, 30 Aug 2024 13:12:08 +0000
Date: Fri, 30 Aug 2024 21:11:26 +0800
From: kernel test robot <lkp@intel.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [vkoul-dmaengine:next 16/22] drivers/dma/loongson1-apb-dma.c:531:42:
 warning: '%d' directive writing between 1 and 8 bytes into a region of size
 2
Message-ID: <202408302108.xIR18jmD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
head:   5d318b5959824e15d32f19b2224c69da89e98178
commit: e06c432312148ddb550ec55b004e32671657ea23 [16/22] dmaengine: Loongson1: Add Loongson-1 APB DMA driver
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20240830/202408302108.xIR18jmD-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408302108.xIR18jmD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408302108.xIR18jmD-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/openrisc/kernel/head.o: in function `_dispatch_do_ipage_fault':
>> (.text+0x900): relocation truncated to fit: R_OR1K_INSN_REL_26 against `no symbol'
   (.text+0xa00): relocation truncated to fit: R_OR1K_INSN_REL_26 against `no symbol'
   arch/openrisc/kernel/head.o: in function `exit_with_no_dtranslation':
>> (.head.text+0x21bc): relocation truncated to fit: R_OR1K_INSN_REL_26 against `no symbol'
   arch/openrisc/kernel/head.o: in function `exit_with_no_itranslation':
   (.head.text+0x2264): relocation truncated to fit: R_OR1K_INSN_REL_26 against `no symbol'
   init/main.o: in function `trace_event_raw_event_initcall_level':
   main.c:(.text+0x32c): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `strlen' defined in .text section in lib/string.o
   init/main.o: in function `initcall_blacklisted':
   main.c:(.text+0x794): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `strcmp' defined in .text section in lib/string.o
   init/main.o: in function `trace_initcall_finish_cb':
   main.c:(.text+0x8b4): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `__muldi3' defined in .text section in ../lib/gcc/or1k-linux/14.1.0/libgcc.a(_muldi3.o)
   main.c:(.text+0x904): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `__muldi3' defined in .text section in ../lib/gcc/or1k-linux/14.1.0/libgcc.a(_muldi3.o)
   main.c:(.text+0x934): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `__muldi3' defined in .text section in ../lib/gcc/or1k-linux/14.1.0/libgcc.a(_muldi3.o)
   main.c:(.text+0x970): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `__muldi3' defined in .text section in ../lib/gcc/or1k-linux/14.1.0/libgcc.a(_muldi3.o)
   main.c:(.text+0x9d4): additional relocation overflows omitted from the output
--
   drivers/dma/loongson1-apb-dma.c: In function 'ls1x_dma_probe':
>> drivers/dma/loongson1-apb-dma.c:531:42: warning: '%d' directive writing between 1 and 8 bytes into a region of size 2 [-Wformat-overflow=]
     531 |                 sprintf(pdev_irqname, "ch%d", id);
         |                                          ^~
   In function 'ls1x_dma_chan_probe',
       inlined from 'ls1x_dma_probe' at drivers/dma/loongson1-apb-dma.c:605:8:
   drivers/dma/loongson1-apb-dma.c:531:39: note: directive argument in the range [0, 19522579]
     531 |                 sprintf(pdev_irqname, "ch%d", id);
         |                                       ^~~~~~
   drivers/dma/loongson1-apb-dma.c:531:17: note: 'sprintf' output between 4 and 11 bytes into a destination of size 4
     531 |                 sprintf(pdev_irqname, "ch%d", id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +531 drivers/dma/loongson1-apb-dma.c

   516	
   517	static int ls1x_dma_chan_probe(struct platform_device *pdev,
   518				       struct ls1x_dma *dma)
   519	{
   520		void __iomem *reg_base;
   521		int id;
   522	
   523		reg_base = devm_platform_ioremap_resource(pdev, 0);
   524		if (IS_ERR(reg_base))
   525			return PTR_ERR(reg_base);
   526	
   527		for (id = 0; id < dma->nr_chans; id++) {
   528			struct ls1x_dma_chan *chan = &dma->chan[id];
   529			char pdev_irqname[4];
   530	
 > 531			sprintf(pdev_irqname, "ch%d", id);
   532			chan->irq = platform_get_irq_byname(pdev, pdev_irqname);
   533			if (chan->irq < 0)
   534				return dev_err_probe(&pdev->dev, chan->irq,
   535						     "failed to get IRQ for ch%d\n",
   536						     id);
   537	
   538			chan->reg_base = reg_base;
   539			chan->vc.desc_free = ls1x_dma_free_desc;
   540			vchan_init(&chan->vc, &dma->ddev);
   541		}
   542	
   543		return 0;
   544	}
   545	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
