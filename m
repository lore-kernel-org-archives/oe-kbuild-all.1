Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4F91D7E26
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 19:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725392079; cv=none; b=kbPjD7JAzgfag9DWJWG/SPkSsOlcA7/GVJBgkOH5pBtZ+iCVUeaDJ0I6ZZZ9lhZsIxqWTyPiDCOcaF1AOepMzROtQtfREjswAM/byOFQjnRTm08Jv6yMdTDab+1NVfSKvq5xyZJWSsaIuD9gtkMf+vgedPQzL6doPibIQHQMFkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725392079; c=relaxed/simple;
	bh=39b9O7q+kR3qkDl+dB6CSlhcuomrGDPE7Ar69fnE79M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guhIRozNbxaY8C4jsc/jdEds/3A909EXBMdNa8iPkX37V8WzJJ16iPHR0ZP7Hy1A9ybS4otd8uqJvO0gncbyjUXQCB6RzDWvlT8FfDQwizmZ/ALkxKiu7RE1HEyiGKG7fKyyGN5/FNiJfw6t9IwkQ8ftmg3WoiY/gvBYtVXAY3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/ZQpr/u; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/ZQpr/u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725392077; x=1756928077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=39b9O7q+kR3qkDl+dB6CSlhcuomrGDPE7Ar69fnE79M=;
  b=R/ZQpr/uyUJBbbBxko1Cc7TGm+LteohPqaGp2CFbzmYvhGceUT1bVaIB
   wY7XmoFYIVKSU/853rGUztYfLah/oKvuoiC3/3bwtFQXz+dl4Mj+uAe0V
   JMKZlpMYcVgKtVDkkGaTaUUcHKWQfBUw2bBcmQMGek1FT7HSXWAZOksFk
   Plle+MgUOtxqy0Y2Rh8RDo/oJrnZY4dEG7IrcxAhEJNX/6r4QmaGtGHUE
   sYhMPd+5oyt+9qcOL0w7/954KyLHh0M2nIG0oIa5XuU60kXXpMG6lT8dU
   TZHlgyP1uNEd5kdCMshKoXuJpVlVFh4cwBVFQPDTjXwIz9FzwRm+W11mk
   w==;
X-CSE-ConnectionGUID: eDx7ERZRRW2QDQiFw/hAtg==
X-CSE-MsgGUID: UT3zhi5tSZK+a4SMy8pu9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23880887"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="23880887"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 12:34:28 -0700
X-CSE-ConnectionGUID: GTql1d8wTumUPQKfy8GjJA==
X-CSE-MsgGUID: aIqKD51FSTmvzog4ygQ+fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="69408530"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Sep 2024 12:34:27 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slZIH-00075E-0v;
	Tue, 03 Sep 2024 19:34:25 +0000
Date: Wed, 4 Sep 2024 03:33:48 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
Message-ID: <202409040328.ZqAuHw0k-lkp@intel.com>
References: <20240902-th1520-pinctrl-v1-2-639bf83ef50a@tenstorrent.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902-th1520-pinctrl-v1-2-639bf83ef50a@tenstorrent.com>

Hi Drew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5be63fc19fcaa4c236b307420483578a56986a37]

url:    https://github.com/intel-lab-lkp/linux/commits/Drew-Fustini/dt-bindings-pinctrl-Add-thead-th1520-pinctrl-bindings/20240903-121111
base:   5be63fc19fcaa4c236b307420483578a56986a37
patch link:    https://lore.kernel.org/r/20240902-th1520-pinctrl-v1-2-639bf83ef50a%40tenstorrent.com
patch subject: [PATCH 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
config: hexagon-randconfig-r073-20240904 (https://download.01.org/0day-ci/archive/20240904/202409040328.ZqAuHw0k-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040328.ZqAuHw0k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409040328.ZqAuHw0k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pinctrl/pinctrl-th1520.c:13:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/pinctrl/pinctrl-th1520.c:13:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/pinctrl/pinctrl-th1520.c:13:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/pinctrl/pinctrl-th1520.c:870:29: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     870 |                 return dev_err_probe(dev, ret, "unit address did not match any pad group\n");
         |                                           ^~~
   drivers/pinctrl/pinctrl-th1520.c:849:9: note: initialize the variable 'ret' to silence this warning
     849 |         int ret;
         |                ^
         |                 = 0
   7 warnings generated.


vim +/ret +870 drivers/pinctrl/pinctrl-th1520.c

   841	
   842	static int th1520_pinctrl_probe(struct platform_device *pdev)
   843	{
   844		struct device *dev = &pdev->dev;
   845		const struct th1520_pad_group *group;
   846		struct device_node *np = dev->of_node;
   847		struct th1520_pinctrl *thp;
   848		struct clk *clk;
   849		int ret;
   850	
   851		thp = devm_kzalloc(dev, sizeof(*thp), GFP_KERNEL);
   852		if (!thp)
   853			return -ENOMEM;
   854	
   855		thp->base = devm_platform_ioremap_resource(pdev, 0);
   856		if (IS_ERR(thp->base))
   857			return PTR_ERR(thp->base);
   858	
   859		clk = devm_clk_get_enabled(dev, NULL);
   860		if (IS_ERR(clk))
   861			return dev_err_probe(dev, PTR_ERR(clk), "error getting clock\n");
   862	
   863		if (strcmp(np->full_name, TH1520_PAD_GROUP1) == 0)
   864			group = &th1520_group1;
   865		else if (strcmp(np->full_name, TH1520_PAD_GROUP2) == 0)
   866			group = &th1520_group2;
   867		else if (strcmp(np->full_name, TH1520_PAD_GROUP3) == 0)
   868			group = &th1520_group3;
   869		else
 > 870			return dev_err_probe(dev, ret, "unit address did not match any pad group\n");
   871	
   872		thp->desc.name = group->name;
   873		thp->desc.pins = group->pins;
   874		thp->desc.npins = group->npins;
   875		thp->desc.pctlops = &th1520_pinctrl_ops;
   876		thp->desc.pmxops = &th1520_pinmux_ops;
   877		thp->desc.confops = &th1520_pinconf_ops;
   878		thp->desc.owner = THIS_MODULE;
   879		mutex_init(&thp->mutex);
   880		raw_spin_lock_init(&thp->lock);
   881	
   882		ret = devm_pinctrl_register_and_init(dev, &thp->desc, thp, &thp->pctl);
   883		if (ret)
   884			return dev_err_probe(dev, ret, "could not register pinctrl driver\n");
   885	
   886		return pinctrl_enable(thp->pctl);
   887	}
   888	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
