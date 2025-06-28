Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158BE1C860F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jun 2025 01:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751075649; cv=none; b=SS80O488zKuviGEKBAvOE5Ianp9IcSd1GZitU2f2+eMXcx6UysdALruwKk002n+BUZR+udlAuRFYpXJILrEktxMHx1yiDVifH4M2FSV0phCJwsfTHwwTnJ6zpIpOE9EPrHLV1e195AjlAtXudwmVSZ78wTNWKjqH6GIvFwck06g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751075649; c=relaxed/simple;
	bh=UZTbi4ut1TBCNp3s/jTvwhQdi5zgEbmpvbdeTdF9HXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FreK6s6TTadSQYjkGeUIeXDi8NVS/TXaIibc8Q3tlVH/ed8yxjV6TNGrfJ6c3BqjZKhVRA02QNCF1YYcUj2FDrDtVCT1zm5I2wuGExssazt3xUbb7BYl0O6pYFfftXqSxHAToeRqBhWjFsSI4xyKO20GbHqvvPT9aQ5vawMJMsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bjy70s0Y; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bjy70s0Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751075648; x=1782611648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UZTbi4ut1TBCNp3s/jTvwhQdi5zgEbmpvbdeTdF9HXw=;
  b=Bjy70s0YQXCMtZ3rU14dfw2g5IER0YU4gsN4E08XKsMaNN0PN1SgT1Cf
   1S5F0eSPhoIe39rDkA6mv9oG1bChQwGOiz2nMYopuDQI0mbeU34QQX+uR
   MOXtGo7DO/CIFkjmTSPH7Stu76Edu9jX84boZS4m1C0HI2ahzI+ojvP56
   /k8140GqqHFRMR+yfoh6KZEBOEO7WRQinkDSyxjYb8ZbE2ZTo7vfTkqeW
   7PKhc/aoDKMnuO7W8Ky6xLije0x5IW1+t8cj+GWWyHK20aNiG8pAmxNMb
   EZESEA1IIb92vYlCifuC5If/BG525GgDoXsXqhrZjC62qrTdhsoB96I55
   g==;
X-CSE-ConnectionGUID: 1084JDWnRpmDfkfZ4Zj35Q==
X-CSE-MsgGUID: MQSEuloeTFe4fBm7YJTszA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="64449121"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="64449121"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 18:54:07 -0700
X-CSE-ConnectionGUID: ySf4ohXKSieAu9tmvmjC2g==
X-CSE-MsgGUID: PHXgZSyIQaaR4Z5sMqnVyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="153433071"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2025 18:54:06 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVKlX-000Wes-19;
	Sat, 28 Jun 2025 01:54:03 +0000
Date: Sat, 28 Jun 2025 09:53:51 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 2764/5998]
 drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202506280913.5Kd10INP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2aeda9592360c200085898a258c4754bfe879921
commit: 1982621decaf788d0611fc291fe89b297b6e5510 [2764/5998] pinctrl: Allow compile testing for K210, TB10X and ZYNQ
config: alpha-randconfig-r122-20250628 (https://download.01.org/0day-ci/archive/20250628/202506280913.5Kd10INP-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250628/202506280913.5Kd10INP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506280913.5Kd10INP-lkp@intel.com/

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
