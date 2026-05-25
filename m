Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699283D3007
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 May 2026 07:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779694067; cv=none; b=CdUU5Jy9WgHSlSoS3MBJPbld5dNDTbHTWx8RmUrqtHwx44CM5eB/Cgr5by+2fxIGFmwmIMC98jqYDh4rZ7ocEM0q7z+H62ED+3PPtub+ChNtnNpunTSGvLIDWhTmXOOAQmMrB0BFb30kxs4yygUvKdo4wNzg9bE7ToWC9QvTv6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779694067; c=relaxed/simple;
	bh=+BG8dy+KDytmX7xQrMNmRCIxKR0/Rt5bFq80LR5f7mc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CajDaT8zWFSRTbHJ8gdAfgf57ccY/GbINP79EkHsKcpilmjtodG+zw6V0Y+sflR2cPvQDhnwmpOVlNhi60PSeK18IBxaBG2hbYGv3BJkWXoBLDJtuc+gLIviDwT9359nw//nyFUiU8T2v9O51GArJDVEoudjuXeZVQBBIrSO0VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k62w/8hI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k62w/8hI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779694065; x=1811230065;
  h=date:from:to:cc:subject:message-id;
  bh=+BG8dy+KDytmX7xQrMNmRCIxKR0/Rt5bFq80LR5f7mc=;
  b=k62w/8hIOKHuJMevcwNrD2e7ld+LV+PY18vHuNdPbpVenMF+r1NY6Ieu
   9UwryaMJZ9kvzcVNgZdWWFqEMQBzcTjPidI62vebDjYc5sfKMRJQ5dX6e
   /6K0OmnQ+Q3LqjWAMyryiOatwp76QmJ4VbGM0v8R8KBIXPjHzAXx8I6EB
   B526rBZOS7aSpnmN2enUrgIAvE08dKU2x8UJ7aiLXNZ6xnbjyJuM/oTPA
   BILyWdaaMCJxVsNMGaHHG2I6J86KTZ9kW0E7gnYa90bVg4HdoNYroSSSy
   kXfmE3i93UjFvn+nH7DHKFaLRRh+8BBmpYN5ryBFU/D5JU49ENCxZv/OF
   Q==;
X-CSE-ConnectionGUID: Jv0VCw/fSjGM2KgKYesoIQ==
X-CSE-MsgGUID: pf0XVk4vSwqhTr+pXBNxHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="80567392"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="80567392"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 00:27:45 -0700
X-CSE-ConnectionGUID: eZOHYEN5TgmtrOAAFZoY4A==
X-CSE-MsgGUID: lFtatVt1Q0OJVayS/rIbAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="237327939"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 May 2026 00:27:42 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRPit-000000001Dw-2fDI;
	Mon, 25 May 2026 07:27:39 +0000
Date: Mon, 25 May 2026 15:27:24 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
Subject: drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202605251505.dn9V3jLY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Krzysztof,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e7ae89a0c97ce2b68b0983cd01eda67cf373517d
commit: 1982621decaf788d0611fc291fe89b297b6e5510 pinctrl: Allow compile testing for K210, TB10X and ZYNQ
date:   11 months ago
config: alpha-randconfig-r122-20260524 (https://download.01.org/0day-ci/archive/20260525/202605251505.dn9V3jLY-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260525/202605251505.dn9V3jLY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1982621decaf ("pinctrl: Allow compile testing for K210, TB10X and ZYNQ")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605251505.dn9V3jLY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pinctrl/pinctrl-tb10x.c:770:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *base @@     got void [noderef] __iomem * @@
   drivers/pinctrl/pinctrl-tb10x.c:770:21: sparse:     expected void *base
   drivers/pinctrl/pinctrl-tb10x.c:770:21: sparse:     got void [noderef] __iomem *
>> drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse:     expected void const [noderef] __iomem *addr
   drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse:     got void *base
>> drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse:     expected void [noderef] __iomem *addr
   drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse:     got void *base
>> drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse:     expected void const [noderef] __iomem *addr
   drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse:     got void *base
>> drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse:     expected void [noderef] __iomem *addr
   drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse:     got void *base
   drivers/pinctrl/pinctrl-tb10x.c:511:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:511:31: sparse:     expected void const [noderef] __iomem *addr
   drivers/pinctrl/pinctrl-tb10x.c:511:31: sparse:     got void *base

vim +502 drivers/pinctrl/pinctrl-tb10x.c

5aad0db1c1ebb0 Christian Ruppert 2013-10-15  491  
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  492  static inline void tb10x_pinctrl_set_config(struct tb10x_pinctrl *state,
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  493  				unsigned int port, unsigned int mode)
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  494  {
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  495  	u32 pcfg;
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  496  
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  497  	if (state->ports[port].count)
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  498  		return;
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  499  
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  500  	state->ports[port].mode = mode;
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  501  
5aad0db1c1ebb0 Christian Ruppert 2013-10-15 @502  	pcfg = ioread32(state->base) & ~(PCFG_PORT_MASK(port));
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  503  	pcfg |= (mode << (PCFG_PORT_BITWIDTH * port)) & PCFG_PORT_MASK(port);
5aad0db1c1ebb0 Christian Ruppert 2013-10-15 @504  	iowrite32(pcfg, state->base);
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  505  }
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  506  

:::::: The code at line 502 was first introduced by commit
:::::: 5aad0db1c1ebb0f5be79f0adbecc16a2f0259b21 pinctrl: add TB10x pin control driver

:::::: TO: Christian Ruppert <christian.ruppert@abilis.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
