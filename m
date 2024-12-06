Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5FF20628B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 17:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733504579; cv=none; b=eLbqyJ1+rQwsiC4HpOPHFp6g95hzGf6ukNRClXr9TFO+UUxXOYkzFdQkPGBKK/VRn+oXtR4xVMYfc4onLLx8hMthKAIJ6oGVGGH80LRLndzqwdqVc4EBr0NhwZvjoaOUptpGrJTmBPGCqynIdhgjk5B1+YgXtxNwMEybTnPpi8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733504579; c=relaxed/simple;
	bh=EwnyuvsgZeL0Q/mPIZi2NgLTRE+uhlEmk1plCulhg6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fw8opL+atdbBXjXmIvAqrtlwg6WdNgo/Zxrk49xSVPxF7d3pbipRZBpKIPk4dN9+1GFxrxcn7mmWXjfkLa+poSJscoYpxM5C4Bqbc8xstdvGDkQiGnUSd9d2qbajiAQMGO1Y2YG4Yw/BEnC5o083VZ40oP9KVdifNrt8vx3gPiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xw1Ru+pc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xw1Ru+pc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733504578; x=1765040578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EwnyuvsgZeL0Q/mPIZi2NgLTRE+uhlEmk1plCulhg6Q=;
  b=Xw1Ru+pcXbU6xZpZ8g1+X5voyDRBPEWSXa7rpiodRhQwC/4fRHmgqwFe
   t9fOqL5iJ3p1kiT8pv4wICCb9jTdB6bcUxBt6mHPjugkljkW1GQZeO9Y7
   HPtJty8bbxOMgL1UqocVO2QWG8SHIywU8CIUv++gRM2Bt1l8jox7C5dkZ
   Iw9wWaoU5kC1d2ZpcMU5dKYXV+paqZXYlQyMNax+EUyE/t8U2vnBMJak9
   gN+1uXUjq11H6+vd9tL2lvIftzcEZmDOyJo02cNGDX9x9ia0Ssq1RKkp0
   PGxckAttaAwRN+gONb1es60nR/zjx4bTqxU2tefQRgIn4mf8nr0DJcyEx
   w==;
X-CSE-ConnectionGUID: f00UK60USjiT69EROClHrw==
X-CSE-MsgGUID: bO2AafXqRiKPbgsM7kfxdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33599512"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="33599512"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 09:02:58 -0800
X-CSE-ConnectionGUID: 1WpsT9+IQ+aDEijTKvecfw==
X-CSE-MsgGUID: u1U2n8T4ReGKG40itda3DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="99268401"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Dec 2024 09:02:56 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJbjC-00026h-0t;
	Fri, 06 Dec 2024 17:02:54 +0000
Date: Sat, 7 Dec 2024 01:02:11 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:syscon-rework-2 10/11] drivers/clk/davinci/pll.c:241:46:
 error: 'clk_divider_ops' undeclared; did you mean 'divider_ops'?
Message-ID: <202412070033.SPZhLDpd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git syscon-rework-2
head:   42a4c7e62a39fecc74b811e4faae3e4d65417107
commit: 35904222355e971c24b3eb9b9fad3dd0c38d1393 [10/11] clk: divider, gate: trivially implement regmaps
config: arm-multi_v5_defconfig (https://download.01.org/0day-ci/archive/20241207/202412070033.SPZhLDpd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070033.SPZhLDpd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070033.SPZhLDpd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/davinci/pll.c: In function 'davinci_pll_div_register':
>> drivers/clk/davinci/pll.c:241:46: error: 'clk_divider_ops' undeclared (first use in this function); did you mean 'divider_ops'?
     241 |         const struct clk_ops *divider_ops = &clk_divider_ops;
         |                                              ^~~~~~~~~~~~~~~
         |                                              divider_ops
   drivers/clk/davinci/pll.c:241:46: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/clk/davinci/pll.c:266:32: error: 'clk_divider_ro_ops' undeclared (first use in this function)
     266 |                 divider_ops = &clk_divider_ro_ops;
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/clk/davinci/pll.c: In function 'davinci_pll_obsclk_register':
   drivers/clk/davinci/pll.c:618:53: error: 'clk_divider_ops' undeclared (first use in this function); did you mean 'clk_divider'?
     618 |                                      &divider->hw, &clk_divider_ops,
         |                                                     ^~~~~~~~~~~~~~~
         |                                                     clk_divider
   drivers/clk/davinci/pll.c: In function 'davinci_pll_sysclk_register':
   drivers/clk/davinci/pll.c:680:46: error: 'clk_divider_ops' undeclared (first use in this function); did you mean 'divider_ops'?
     680 |         const struct clk_ops *divider_ops = &clk_divider_ops;
         |                                              ^~~~~~~~~~~~~~~
         |                                              divider_ops
   drivers/clk/davinci/pll.c:714:32: error: 'clk_divider_ro_ops' undeclared (first use in this function)
     714 |                 divider_ops = &clk_divider_ro_ops;
         |                                ^~~~~~~~~~~~~~~~~~


vim +241 drivers/clk/davinci/pll.c

2d172691515961 David Lechner 2018-03-15  223  
2d172691515961 David Lechner 2018-03-15  224  /**
2d172691515961 David Lechner 2018-03-15  225   * davinci_pll_div_register - common *DIV clock implementation
76c9dd9dbd6459 David Lechner 2018-05-25  226   * @dev: The PLL platform device or NULL
2d172691515961 David Lechner 2018-03-15  227   * @name: the clock name
2d172691515961 David Lechner 2018-03-15  228   * @parent_name: the parent clock name
2d172691515961 David Lechner 2018-03-15  229   * @reg: the *DIV register
2d172691515961 David Lechner 2018-03-15  230   * @fixed: if true, the divider is a fixed value
2d172691515961 David Lechner 2018-03-15  231   * @flags: bitmap of CLK_* flags from clock-provider.h
2d172691515961 David Lechner 2018-03-15  232   */
2d172691515961 David Lechner 2018-03-15  233  static struct clk *davinci_pll_div_register(struct device *dev,
2d172691515961 David Lechner 2018-03-15  234  					    const char *name,
2d172691515961 David Lechner 2018-03-15  235  					    const char *parent_name,
2d172691515961 David Lechner 2018-03-15  236  					    void __iomem *reg,
2d172691515961 David Lechner 2018-03-15  237  					    bool fixed, u32 flags)
2d172691515961 David Lechner 2018-03-15  238  {
2d172691515961 David Lechner 2018-03-15  239  	const char * const *parent_names = parent_name ? &parent_name : NULL;
2d172691515961 David Lechner 2018-03-15  240  	int num_parents = parent_name ? 1 : 0;
2d172691515961 David Lechner 2018-03-15 @241  	const struct clk_ops *divider_ops = &clk_divider_ops;
2d172691515961 David Lechner 2018-03-15  242  	struct clk_gate *gate;
2d172691515961 David Lechner 2018-03-15  243  	struct clk_divider *divider;
76c9dd9dbd6459 David Lechner 2018-05-25  244  	struct clk *clk;
76c9dd9dbd6459 David Lechner 2018-05-25  245  	int ret;
2d172691515961 David Lechner 2018-03-15  246  
76c9dd9dbd6459 David Lechner 2018-05-25  247  	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
2d172691515961 David Lechner 2018-03-15  248  	if (!gate)
2d172691515961 David Lechner 2018-03-15  249  		return ERR_PTR(-ENOMEM);
2d172691515961 David Lechner 2018-03-15  250  
2d172691515961 David Lechner 2018-03-15  251  	gate->reg = reg;
2d172691515961 David Lechner 2018-03-15  252  	gate->bit_idx = DIV_ENABLE_SHIFT;
2d172691515961 David Lechner 2018-03-15  253  
76c9dd9dbd6459 David Lechner 2018-05-25  254  	divider = kzalloc(sizeof(*divider), GFP_KERNEL);
76c9dd9dbd6459 David Lechner 2018-05-25  255  	if (!divider) {
76c9dd9dbd6459 David Lechner 2018-05-25  256  		ret = -ENOMEM;
76c9dd9dbd6459 David Lechner 2018-05-25  257  		goto err_free_gate;
76c9dd9dbd6459 David Lechner 2018-05-25  258  	}
2d172691515961 David Lechner 2018-03-15  259  
2d172691515961 David Lechner 2018-03-15  260  	divider->reg = reg;
2d172691515961 David Lechner 2018-03-15  261  	divider->shift = DIV_RATIO_SHIFT;
2d172691515961 David Lechner 2018-03-15  262  	divider->width = DIV_RATIO_WIDTH;
2d172691515961 David Lechner 2018-03-15  263  
2d172691515961 David Lechner 2018-03-15  264  	if (fixed) {
2d172691515961 David Lechner 2018-03-15  265  		divider->flags |= CLK_DIVIDER_READ_ONLY;
2d172691515961 David Lechner 2018-03-15 @266  		divider_ops = &clk_divider_ro_ops;
2d172691515961 David Lechner 2018-03-15  267  	}
2d172691515961 David Lechner 2018-03-15  268  
76c9dd9dbd6459 David Lechner 2018-05-25  269  	clk = clk_register_composite(dev, name, parent_names, num_parents,
2d172691515961 David Lechner 2018-03-15  270  				     NULL, NULL, &divider->hw, divider_ops,
2d172691515961 David Lechner 2018-03-15  271  				     &gate->hw, &clk_gate_ops, flags);
76c9dd9dbd6459 David Lechner 2018-05-25  272  	if (IS_ERR(clk)) {
76c9dd9dbd6459 David Lechner 2018-05-25  273  		ret = PTR_ERR(clk);
76c9dd9dbd6459 David Lechner 2018-05-25  274  		goto err_free_divider;
76c9dd9dbd6459 David Lechner 2018-05-25  275  	}
76c9dd9dbd6459 David Lechner 2018-05-25  276  
76c9dd9dbd6459 David Lechner 2018-05-25  277  	return clk;
76c9dd9dbd6459 David Lechner 2018-05-25  278  
76c9dd9dbd6459 David Lechner 2018-05-25  279  err_free_divider:
76c9dd9dbd6459 David Lechner 2018-05-25  280  	kfree(divider);
76c9dd9dbd6459 David Lechner 2018-05-25  281  err_free_gate:
76c9dd9dbd6459 David Lechner 2018-05-25  282  	kfree(gate);
76c9dd9dbd6459 David Lechner 2018-05-25  283  
76c9dd9dbd6459 David Lechner 2018-05-25  284  	return ERR_PTR(ret);
2d172691515961 David Lechner 2018-03-15  285  }
2d172691515961 David Lechner 2018-03-15  286  

:::::: The code at line 241 was first introduced by commit
:::::: 2d172691515961cad2abb4bf1b15d187bf2106cf clk: davinci: New driver for davinci PLL clocks

:::::: TO: David Lechner <david@lechnology.com>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
