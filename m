Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471543C109B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 12:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598565; cv=none; b=KpLVpgqdTNXehSwoDnqePUbQ+f0xGs8BcLo3zqrRcqL6hOUdmsSi1u5FznZCRz+fjH4UP/NG0DT+30nQ97zltvsgYdmwVDlOHG6c7CWiiH6DT4rAOHu2l+QOB9rC3O14SxGGMEeIi8BKQDy8i1uBjFKlH2N6n73z/fFfPkpoF+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598565; c=relaxed/simple;
	bh=cxXCjc2Okydj6XxXcfOySfAO9DGdnUAQGjCM/bSrcWI=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BBv0akxQTnIVGZufX7HBpWaxSlGPS5/SkUEbCHiEVSEY5mBTADPYFoStYexqyMgXNE89zHc5bO3rZSUYid8O2bmMoCrrIZtNQBOydyJZld5PoJbkH4oZvZ+Togaq/YypVpqgKlajlju0btsZFNXes11/CYNnPPBd/Z90xrKPVJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDb3l3fg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDb3l3fg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790598563; x=1822134563;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=cxXCjc2Okydj6XxXcfOySfAO9DGdnUAQGjCM/bSrcWI=;
  b=XDb3l3fgClCfhSSC1CaQqtCCkuhoNHnd23755tNAtfEZx5zwmNi+y+f+
   /r+wBMYoOS9flGiWFLU1Y5EfXRgWF3Mi+5upI8Wy2RDuUFNOqgNyom5uX
   6gNzxjecGIr6K8Nd9I5sDov0IETbJPbt1IW0jGjPWdHADJh6+zIrUeO3W
   1ArhrIKXvX9b+ekqq4EkEVxxcjwd6GYESO8KnTYpLZ9/zdWhIP8UlTaqj
   ExPXqwYj8nwoHKDkbwfQXgpesjaGD1LQw/u7ijzQ7FGuCBJ4eSjd0EsFS
   mm0sb/JCYtTLfLpj0e7Ol4vHwntC4QGNDA6ERIdywxeBb2Y6U+G/m1ICg
   A==;
X-CSE-ConnectionGUID: upiq52EORV65/DtJWCBJLA==
X-CSE-MsgGUID: glXr5CahQwKBaUHALoeZ/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="78860359"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="78860359"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 05:29:23 -0700
X-CSE-ConnectionGUID: eIqe3TlRRsSnqWiO/F+HCA==
X-CSE-MsgGUID: XPHyrwPJT0WMz0Hdi+7doA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="271527383"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 28 Sep 2026 05:29:22 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBATt-000000000zv-0xa9
	for oe-kbuild-all@lists.linux.dev;
	Mon, 28 Sep 2026 12:29:17 +0000
Date: Mon, 28 Sep 2026 14:28:48 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: clk: meson: pll: Remove the dedicated n parameter
Message-ID: <202609281430.SIgEP6mX-lkp@intel.com>
References: <202609281430.SIgEP6mX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609281430.SIgEP6mX-lkp@intel.com>

Hi Jian,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Jian-Hu-via-B4-Relay/clk-meson-pll-Remove-the-dedicated-n-parameter/20260923-191447
base:   
patch link:    https://lore.kernel.org/r/202609281430.SIgEP6mX-lkp%40intel.com
config: arm64-randconfig-r2301-20260928 (https://download.01.org/0day-ci/archive/20260928/202609281430.SIgEP6mX-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609281430.SIgEP6mX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609281430.SIgEP6mX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/meson/a1-pll.c:40:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
      40 |                 .n = {
         |                 ~^~~~~
      41 |                         .reg_off = ANACTRL_FIXPLL_CTRL0,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      42 |                         .shift   = 10,
         |                         ~~~~~~~~~~~~~~
      43 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
      44 |                 },
         |                 ~
   drivers/clk/meson/a1-pll.c:111:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
     111 |                 .n = {
         |                 ~^~~~~
     112 |                         .reg_off = ANACTRL_HIFIPLL_CTRL0,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     113 |                         .shift   = 10,
         |                         ~~~~~~~~~~~~~~
     114 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
     115 |                 },
         |                 ~
   2 errors generated.
--
>> drivers/clk/meson/axg.c:122:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
     122 |                 .n = {
         |                 ~^~~~~
     123 |                         .reg_off = HHI_MPLL_CNTL,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~
     124 |                         .shift   = 9,
         |                         ~~~~~~~~~~~~~
     125 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
     126 |                 },
         |                 ~
   drivers/clk/meson/axg.c:186:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
     186 |                 .n = {
         |                 ~^~~~~
     187 |                         .reg_off = HHI_SYS_PLL_CNTL,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     188 |                         .shift   = 9,
         |                         ~~~~~~~~~~~~~
     189 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
     190 |                 },
         |                 ~
>> drivers/clk/meson/axg.c:230:62: error: array has incomplete element type 'const struct pll_params_table'
     230 | static const struct pll_params_table axg_gp0_pll_params_table[] = {
         |                                                              ^
   drivers/clk/meson/axg.c:230:21: note: forward declaration of 'struct pll_params_table'
     230 | static const struct pll_params_table axg_gp0_pll_params_table[] = {
         |                     ^
>> drivers/clk/meson/axg.c:231:2: error: call to undeclared function 'PLL_PARAMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     231 |         PLL_PARAMS(40, 1),
         |         ^
   drivers/clk/meson/axg.c:774:63: error: array has incomplete element type 'const struct pll_params_table'
     774 | static const struct pll_params_table axg_pcie_pll_params_table[] = {
         |                                                               ^
   drivers/clk/meson/axg.c:230:21: note: forward declaration of 'struct pll_params_table'
     230 | static const struct pll_params_table axg_gp0_pll_params_table[] = {
         |                     ^
   5 errors generated.
--
>> drivers/clk/meson/g12a.c:152:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
     152 |                 .n = {
         |                 ~^~~~~
     153 |                         .reg_off = HHI_FIX_PLL_CNTL0,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     154 |                         .shift   = 10,
         |                         ~~~~~~~~~~~~~~
     155 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
     156 |                 },
         |                 ~
   drivers/clk/meson/g12a.c:221:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
     221 |                 .n = {
         |                 ~^~~~~
     222 |                         .reg_off = HHI_SYS_PLL_CNTL0,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     223 |                         .shift   = 10,
         |                         ~~~~~~~~~~~~~~
     224 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
     225 |                 },
         |                 ~
   drivers/clk/meson/g12a.c:280:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
     280 |                 .n = {
         |                 ~^~~~~
     281 |                         .reg_off = HHI_SYS1_PLL_CNTL0,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     282 |                         .shift   = 10,
         |                         ~~~~~~~~~~~~~~
     283 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
     284 |                 },
         |                 ~
   drivers/clk/meson/g12a.c:418:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
     418 |                 .n = {
         |                 ~^~~~~
     419 |                         .reg_off = HHI_GP0_PLL_CNTL0,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     420 |                         .shift   = 10,
         |                         ~~~~~~~~~~~~~~
     421 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
     422 |                 },
         |                 ~
   drivers/clk/meson/g12a.c:483:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
     483 |                 .n = {
         |                 ~^~~~~
     484 |                         .reg_off = HHI_GP1_PLL_CNTL0,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     485 |                         .shift   = 10,
         |                         ~~~~~~~~~~~~~~
     486 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
     487 |                 },
         |                 ~
   drivers/clk/meson/g12a.c:558:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
     558 |                 .n = {
         |                 ~^~~~~
     559 |                         .reg_off = HHI_HIFI_PLL_CNTL0,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     560 |                         .shift   = 10,
         |                         ~~~~~~~~~~~~~~
     561 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
     562 |                 },
         |                 ~
>> drivers/clk/meson/g12a.c:633:57: error: array has incomplete element type 'const struct pll_params_table'
     633 | static const struct pll_params_table g12a_pcie_pll_table[] = {
         |                                                         ^
   drivers/clk/meson/g12a.c:633:21: note: forward declaration of 'struct pll_params_table'
     633 | static const struct pll_params_table g12a_pcie_pll_table[] = {
         |                     ^
>> drivers/clk/meson/g12a.c:634:2: error: call to undeclared function 'PLL_PARAMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     634 |         PLL_PARAMS(150, 1),
         |         ^
   drivers/clk/meson/g12a.c:744:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
     744 |                 .n = {
         |                 ~^~~~~
     745 |                         .reg_off = HHI_HDMI_PLL_CNTL0,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     746 |                         .shift   = 10,
         |                         ~~~~~~~~~~~~~~
     747 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
     748 |                 },
         |                 ~
   9 errors generated.
--
>> drivers/clk/meson/c3-pll.c:263:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
     263 |                 .n = {
         |                 ~^~~~~
     264 |                         .reg_off = ANACTRL_GP0PLL_CTRL0,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     265 |                         .shift   = 10,
         |                         ~~~~~~~~~~~~~~
     266 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
     267 |                 },
         |                 ~
   drivers/clk/meson/c3-pll.c:346:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
     346 |                 .n = {
         |                 ~^~~~~
     347 |                         .reg_off = ANACTRL_HIFIPLL_CTRL0,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     348 |                         .shift   = 10,
         |                         ~~~~~~~~~~~~~~
     349 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
     350 |                 },
         |                 ~
   drivers/clk/meson/c3-pll.c:418:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
     418 |                 .n = {
         |                 ~^~~~~
     419 |                         .reg_off = ANACTRL_MPLL_CTRL0,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     420 |                         .shift   = 16,
         |                         ~~~~~~~~~~~~~~
     421 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
     422 |                 },
         |                 ~
   3 errors generated.
--
>> drivers/clk/meson/gxbb.c:130:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
     130 |                 .n = {
         |                 ~^~~~~
     131 |                         .reg_off = HHI_MPLL_CNTL,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~
     132 |                         .shift   = 9,
         |                         ~~~~~~~~~~~~~
     133 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
     134 |                 },
         |                 ~
   drivers/clk/meson/gxbb.c:207:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
     207 |                 .n = {
         |                 ~^~~~~
     208 |                         .reg_off = HHI_HDMI_PLL_CNTL,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     209 |                         .shift   = 9,
         |                         ~~~~~~~~~~~~~
     210 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
     211 |                 },
         |                 ~
   drivers/clk/meson/gxbb.c:255:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
     255 |                 .n = {
         |                 ~^~~~~
     256 |                         .reg_off = HHI_HDMI_PLL_CNTL,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     257 |                         .shift   = 9,
         |                         ~~~~~~~~~~~~~
     258 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
     259 |                 },
         |                 ~
   drivers/clk/meson/gxbb.c:428:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
     428 |                 .n = {
         |                 ~^~~~~
     429 |                         .reg_off = HHI_SYS_PLL_CNTL,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     430 |                         .shift   = 9,
         |                         ~~~~~~~~~~~~~
     431 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
     432 |                 },
         |                 ~
>> drivers/clk/meson/gxbb.c:472:63: error: array has incomplete element type 'const struct pll_params_table'
     472 | static const struct pll_params_table gxbb_gp0_pll_params_table[] = {
         |                                                               ^
   drivers/clk/meson/gxbb.c:472:21: note: forward declaration of 'struct pll_params_table'
     472 | static const struct pll_params_table gxbb_gp0_pll_params_table[] = {
         |                     ^
>> drivers/clk/meson/gxbb.c:473:2: error: call to undeclared function 'PLL_PARAMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     473 |         PLL_PARAMS(32, 1),
         |         ^
   drivers/clk/meson/gxbb.c:554:62: error: array has incomplete element type 'const struct pll_params_table'
     554 | static const struct pll_params_table gxl_gp0_pll_params_table[] = {
         |                                                              ^
   drivers/clk/meson/gxbb.c:472:21: note: forward declaration of 'struct pll_params_table'
     472 | static const struct pll_params_table gxbb_gp0_pll_params_table[] = {
         |                     ^
   7 errors generated.
--
>> drivers/clk/meson/s4-pll.c:71:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
      71 |                 .n = {
         |                 ~^~~~~
      72 |                         .reg_off = ANACTRL_FIXPLL_CTRL0,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      73 |                         .shift   = 10,
         |                         ~~~~~~~~~~~~~~
      74 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
      75 |                 },
         |                 ~
   drivers/clk/meson/s4-pll.c:305:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
     305 |                 .n = {
         |                 ~^~~~~
     306 |                         .reg_off = ANACTRL_GP0PLL_CTRL0,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     307 |                         .shift   = 10,
         |                         ~~~~~~~~~~~~~~
     308 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
     309 |                 },
         |                 ~
   drivers/clk/meson/s4-pll.c:376:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
     376 |                 .n = {
         |                 ~^~~~~
     377 |                         .reg_off = ANACTRL_HIFIPLL_CTRL0,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     378 |                         .shift   = 10,
         |                         ~~~~~~~~~~~~~~
     379 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
     380 |                 },
         |                 ~
   drivers/clk/meson/s4-pll.c:443:4: error: field designator 'n' does not refer to any field in type 'struct meson_clk_pll_data'
     443 |                 .n = {
         |                 ~^~~~~
     444 |                         .reg_off = ANACTRL_HDMIPLL_CTRL0,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     445 |                         .shift   = 10,
         |                         ~~~~~~~~~~~~~~
     446 |                         .width   = 5,
         |                         ~~~~~~~~~~~~~
     447 |                 },
         |                 ~
   4 errors generated.


vim +40 drivers/clk/meson/a1-pll.c

28f3be518081b2 Dmitry Rokosov 2023-05-23  27  
4c4e17f2701316 Jerome Brunet  2025-07-02  28  static struct clk_regmap a1_fixed_pll_dco = {
28f3be518081b2 Dmitry Rokosov 2023-05-23  29  	.data = &(struct meson_clk_pll_data){
28f3be518081b2 Dmitry Rokosov 2023-05-23  30  		.en = {
28f3be518081b2 Dmitry Rokosov 2023-05-23  31  			.reg_off = ANACTRL_FIXPLL_CTRL0,
28f3be518081b2 Dmitry Rokosov 2023-05-23  32  			.shift   = 28,
28f3be518081b2 Dmitry Rokosov 2023-05-23  33  			.width   = 1,
28f3be518081b2 Dmitry Rokosov 2023-05-23  34  		},
28f3be518081b2 Dmitry Rokosov 2023-05-23  35  		.m = {
28f3be518081b2 Dmitry Rokosov 2023-05-23  36  			.reg_off = ANACTRL_FIXPLL_CTRL0,
28f3be518081b2 Dmitry Rokosov 2023-05-23  37  			.shift   = 0,
28f3be518081b2 Dmitry Rokosov 2023-05-23  38  			.width   = 8,
28f3be518081b2 Dmitry Rokosov 2023-05-23  39  		},
28f3be518081b2 Dmitry Rokosov 2023-05-23 @40  		.n = {
28f3be518081b2 Dmitry Rokosov 2023-05-23  41  			.reg_off = ANACTRL_FIXPLL_CTRL0,
28f3be518081b2 Dmitry Rokosov 2023-05-23  42  			.shift   = 10,
28f3be518081b2 Dmitry Rokosov 2023-05-23  43  			.width   = 5,
28f3be518081b2 Dmitry Rokosov 2023-05-23  44  		},
28f3be518081b2 Dmitry Rokosov 2023-05-23  45  		.frac = {
28f3be518081b2 Dmitry Rokosov 2023-05-23  46  			.reg_off = ANACTRL_FIXPLL_CTRL1,
28f3be518081b2 Dmitry Rokosov 2023-05-23  47  			.shift   = 0,
28f3be518081b2 Dmitry Rokosov 2023-05-23  48  			.width   = 19,
28f3be518081b2 Dmitry Rokosov 2023-05-23  49  		},
28f3be518081b2 Dmitry Rokosov 2023-05-23  50  		.l = {
28f3be518081b2 Dmitry Rokosov 2023-05-23  51  			.reg_off = ANACTRL_FIXPLL_STS,
28f3be518081b2 Dmitry Rokosov 2023-05-23  52  			.shift   = 31,
28f3be518081b2 Dmitry Rokosov 2023-05-23  53  			.width   = 1,
28f3be518081b2 Dmitry Rokosov 2023-05-23  54  		},
28f3be518081b2 Dmitry Rokosov 2023-05-23  55  		.rst = {
28f3be518081b2 Dmitry Rokosov 2023-05-23  56  			.reg_off = ANACTRL_FIXPLL_CTRL0,
28f3be518081b2 Dmitry Rokosov 2023-05-23  57  			.shift   = 29,
28f3be518081b2 Dmitry Rokosov 2023-05-23  58  			.width   = 1,
28f3be518081b2 Dmitry Rokosov 2023-05-23  59  		},
28f3be518081b2 Dmitry Rokosov 2023-05-23  60  	},
28f3be518081b2 Dmitry Rokosov 2023-05-23  61  	.hw.init = &(struct clk_init_data){
28f3be518081b2 Dmitry Rokosov 2023-05-23  62  		.name = "fixed_pll_dco",
28f3be518081b2 Dmitry Rokosov 2023-05-23  63  		.ops = &meson_clk_pll_ro_ops,
28f3be518081b2 Dmitry Rokosov 2023-05-23  64  		.parent_data = &(const struct clk_parent_data) {
28f3be518081b2 Dmitry Rokosov 2023-05-23  65  			.fw_name = "fixpll_in",
28f3be518081b2 Dmitry Rokosov 2023-05-23  66  		},
28f3be518081b2 Dmitry Rokosov 2023-05-23  67  		.num_parents = 1,
28f3be518081b2 Dmitry Rokosov 2023-05-23  68  	},
28f3be518081b2 Dmitry Rokosov 2023-05-23  69  };
28f3be518081b2 Dmitry Rokosov 2023-05-23  70  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
