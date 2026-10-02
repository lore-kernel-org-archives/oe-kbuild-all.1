Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C082F2914
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 02:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790908200; cv=none; b=DB7SwxZYO9HLBwbBMpINPrt0NHgLNVV5C+MTlIiv/PkW4HbWQTxCgkfSB0Wshrmz2/nBFzJ9dpdtI1iqJgp+puOyMh7/XgkLAWLMFkQQbgAFLo2YJXLQOuf8/PCUQCK/dC76qtvokJOE+h4Oyv8Mf4e3BbU8kyxGiLSADSN3Z4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790908200; c=relaxed/simple;
	bh=seSjJNkuLwGzyZnBI86+pcXBTE75uR8NOttQEWm110A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hyV5bu3HxV62dWpU+oXIpGmm5+2gcInBLewz3V/rLAFo8PWRN9hiwHA6haA4T78FAyo9XhA6AViXN4bhmIFseL41A68bZsPJmr6pn+gqRmtVp+J/HvWfof/YUijPbUJOaSFrdDS/cnjA0jYaxBbkAgYDesec+Py7UF+BuNHMapc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O5uXX3uD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5uXX3uD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790908199; x=1822444199;
  h=date:from:to:cc:subject:message-id;
  bh=seSjJNkuLwGzyZnBI86+pcXBTE75uR8NOttQEWm110A=;
  b=O5uXX3uDI068taJ8kh1DMKzXbXj2ryiC34S7qm/LCqcQqL1+sOcU0evC
   g3r+6X4Flq38URRQcTZiiNpNHIgd+GBuiyprUgdkza0X/iLPSHcMSm48p
   Y2jAmW5nVh614Qec3qjXlAuhYicWzCY+v9EADteHKByLXcHYlFrF6+CY8
   0K83L5SMiep1os0cJx7Ni48mxj2uQcTqHtnmyF3+pbGUFEhY3cjcJSTiH
   BZ6LjlSlIB+EyA1mnUlM+xtfpySzaBDAdsmJb1gKL2eCtOk8GMP62WM11
   G/DHWIaWl6dJ39yYSeYz0WOphrFMcHda03mHn/DVnrfQDd/bbvQDj4S2P
   w==;
X-CSE-ConnectionGUID: HheQFw3NTGaF3E5/xWVjMg==
X-CSE-MsgGUID: GPMF4HSBRuatFIS992Q1TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90890796"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90890796"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 19:29:58 -0700
X-CSE-ConnectionGUID: 8O0ejXNCQiiIrl0cSbuqcQ==
X-CSE-MsgGUID: Tot0WgcXTxO4dnXvh9IZig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="304104457"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 01 Oct 2026 19:29:55 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCT21-000000000MD-2u9B;
	Fri, 02 Oct 2026 02:29:53 +0000
Date: Fri, 02 Oct 2026 04:29:35 +0200
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12898/13246]
 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c:99:22: error:
 'pinctrl_generic_get_group_count' undeclared here (not in a function); did
 you mean 'pinctrl_generic_to_map'?
Message-ID: <202610020415.JhlnaDVS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9f24d789f03b22941b905ded43cb5ff8eea9ce62
commit: 7fced31d9754f81fc9e79a8f1ef10e6766816480 [12898/13246] Merge branch 'devel' into for-next
config: m68k-randconfig-r2100-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020415.JhlnaDVS-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020415.JhlnaDVS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020415.JhlnaDVS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c:99:22: error: 'pinctrl_generic_get_group_count' undeclared here (not in a function); did you mean 'pinctrl_generic_to_map'?
     .get_groups_count = pinctrl_generic_get_group_count,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                         pinctrl_generic_to_map
>> drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c:100:22: error: 'pinctrl_generic_get_group_name' undeclared here (not in a function); did you mean 'pinctrl_generic_to_map'?
     .get_group_name   = pinctrl_generic_get_group_name,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                         pinctrl_generic_to_map
>> drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c:101:22: error: 'pinctrl_generic_get_group_pins' undeclared here (not in a function); did you mean 'pinctrl_get_group_pins'?
     .get_group_pins   = pinctrl_generic_get_group_pins,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                         pinctrl_get_group_pins
   drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c: In function 'jhb100_set_mux':
>> drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c:149:10: error: implicit declaration of function 'pinctrl_generic_get_group'; did you mean 'pinctrl_generic_to_map'? [-Werror=implicit-function-declaration]
     group = pinctrl_generic_get_group(pctldev, gsel);
             ^~~~~~~~~~~~~~~~~~~~~~~~~
             pinctrl_generic_to_map
>> drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c:149:8: warning: assignment to 'const struct group_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     group = pinctrl_generic_get_group(pctldev, gsel);
           ^
>> drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c:153:19: error: dereferencing pointer to incomplete type 'const struct group_desc'
     functions = group->data;
                      ^~
   drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c: At top level:
>> drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c:304:25: error: 'pinmux_generic_get_function_count' undeclared here (not in a function); did you mean 'pinmux_generic_free_functions'?
     .get_functions_count = pinmux_generic_get_function_count,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            pinmux_generic_free_functions
>> drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c:305:23: error: 'pinmux_generic_get_function_name' undeclared here (not in a function); did you mean 'pinmux_generic_free_functions'?
     .get_function_name = pinmux_generic_get_function_name,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                          pinmux_generic_free_functions
>> drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c:306:25: error: 'pinmux_generic_get_function_groups' undeclared here (not in a function); did you mean 'pinmux_generic_free_functions'?
     .get_function_groups = pinmux_generic_get_function_groups,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            pinmux_generic_free_functions
   drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c: In function 'jhb100_pinconf_group_get':
   drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c:880:8: warning: assignment to 'const struct group_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     group = pinctrl_generic_get_group(pctldev, gsel);
           ^
   drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c:884:42: error: dereferencing pointer to incomplete type 'const struct group_desc'
     return jhb100_pinconf_get(pctldev, group->grp.pins[0], config);
                                             ^~
   drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c: In function 'jhb100_pinconf_group_set':
   drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c:896:8: warning: assignment to 'const struct group_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     group = pinctrl_generic_get_group(pctldev, gsel);
           ^
   drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c:900:23: error: dereferencing pointer to incomplete type 'const struct group_desc'
     for (i = 0; i < group->grp.npins; i++) {
                          ^~
   drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c: In function 'jhb100_pinconf_group_get':
>> drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c:885:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PINCTRL_STARFIVE_JHB100
   Depends on [n]: PINCTRL [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STARFIVE_JHB100_PER1 [=y] && PINCTRL [=y] && (ARCH_STARFIVE || COMPILE_TEST [=y])
   - PINCTRL_STARFIVE_JHB100_PER2POK [=y] && PINCTRL [=y] && (ARCH_STARFIVE || COMPILE_TEST [=y])
   - PINCTRL_STARFIVE_JHB100_SYS0 [=y] && PINCTRL [=y] && (ARCH_STARFIVE || COMPILE_TEST [=y])
   Selected by [m]:
   - PINCTRL_STARFIVE_JHB100_PER0 [=m] && PINCTRL [=y] && (ARCH_STARFIVE || COMPILE_TEST [=y])
   - PINCTRL_STARFIVE_JHB100_PER2 [=m] && PINCTRL [=y] && (ARCH_STARFIVE || COMPILE_TEST [=y])
   - PINCTRL_STARFIVE_JHB100_PER3 [=m] && PINCTRL [=y] && (ARCH_STARFIVE || COMPILE_TEST [=y])
   - PINCTRL_STARFIVE_JHB100_SYS2 [=m] && PINCTRL [=y] && (ARCH_STARFIVE || COMPILE_TEST [=y])


vim +99 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c

9c4d0c8fc4c10e Changhuang Liang 2026-09-10   97  
9c4d0c8fc4c10e Changhuang Liang 2026-09-10   98  static const struct pinctrl_ops jhb100_pinctrl_ops = {
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  @99  	.get_groups_count = pinctrl_generic_get_group_count,
9c4d0c8fc4c10e Changhuang Liang 2026-09-10 @100  	.get_group_name	  = pinctrl_generic_get_group_name,
9c4d0c8fc4c10e Changhuang Liang 2026-09-10 @101  	.get_group_pins   = pinctrl_generic_get_group_pins,
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  102  	.dt_node_to_map	  = pinctrl_generic_pins_function_dt_node_to_map,
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  103  	.dt_free_map	  = pinctrl_utils_free_map,
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  104  };
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  105  
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  106  static void jhb100_set_function(struct jhb100_pinctrl *sfp,
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  107  				unsigned int pin, u8 func)
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  108  {
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  109  	const struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  110  	unsigned int pins_per_reg, offset, shift;
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  111  	void __iomem *func_sel_reg;
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  112  	u32 func_sel_mask;
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  113  	u32 func_sel_val;
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  114  
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  115  	if (!pinctrl_regs->func_sel.reg || !pinctrl_regs->func_sel.width_per_pin)
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  116  		return;
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  117  
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  118  	pins_per_reg = 32 / pinctrl_regs->func_sel.width_per_pin;
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  119  	offset = 4 * (pin / pins_per_reg);
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  120  	shift = pinctrl_regs->func_sel.width_per_pin * (pin % pins_per_reg);
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  121  
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  122  	func_sel_reg = sfp->base + pinctrl_regs->func_sel.reg + offset;
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  123  	func_sel_mask = GENMASK(pinctrl_regs->func_sel.width_per_pin - 1, 0) << shift;
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  124  	func_sel_val = func << shift;
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  125  
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  126  	guard(raw_spinlock_irqsave)(&sfp->lock);
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  127  
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  128  	func_sel_val |= readl_relaxed(func_sel_reg) & ~func_sel_mask;
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  129  	writel_relaxed(func_sel_val, func_sel_reg);
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  130  }
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  131  
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  132  static int jhb100_set_one_pin_mux(struct jhb100_pinctrl *sfp,
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  133  				  unsigned int pin,
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  134  				  u8 func)
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  135  {
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  136  	jhb100_set_function(sfp, pin, func);
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  137  
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  138  	return 0;
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  139  }
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  140  
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  141  static int jhb100_set_mux(struct pinctrl_dev *pctldev,
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  142  			  unsigned int fsel, unsigned int gsel)
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  143  {
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  144  	struct jhb100_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  145  	const struct group_desc *group;
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  146  	unsigned int i;
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  147  	const char **functions;
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  148  
9c4d0c8fc4c10e Changhuang Liang 2026-09-10 @149  	group = pinctrl_generic_get_group(pctldev, gsel);
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  150  	if (!group)
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  151  		return -EINVAL;
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  152  
9c4d0c8fc4c10e Changhuang Liang 2026-09-10 @153  	functions = group->data;
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  154  
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  155  	for (i = 0; i < group->grp.npins; i++) {
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  156  		int function;
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  157  
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  158  		function = jhb100_map_get_func_val(sfp, functions[i], group->grp.pins[i]);
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  159  		if (function < 0) {
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  160  			dev_err(pctldev->dev, "invalid function %s\n", functions[i]);
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  161  			return function;
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  162  		}
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  163  
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  164  		jhb100_set_one_pin_mux(sfp, group->grp.pins[i], function);
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  165  	}
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  166  
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  167  	return 0;
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  168  }
9c4d0c8fc4c10e Changhuang Liang 2026-09-10  169  

:::::: The code at line 99 was first introduced by commit
:::::: 9c4d0c8fc4c10eaecc651ecd3d2aa706f06a6637 pinctrl: starfive: Add StarFive JHB100 sys0 controller driver

:::::: TO: Changhuang Liang <changhuang.liang@starfivetech.com>
:::::: CC: Linus Walleij <linusw@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
