Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E4B49D5BC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 11:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593476; cv=none; b=JZXwNjd9kLdJSF5A3m9gnohWwMz/Jqke6xIVm9NSKid3Mv1dCFt3BJEkHTxpLNuYVnFk80wlzVbmi7Vq60UokOHEeed4gKQoKYNyhNCrngSylD2mfkLZFsLjlv6DXLshb/P24C2MWC4n+nL+fDNB9ZmGNrNfpzf5bzfTTdME67k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593476; c=relaxed/simple;
	bh=l1oJFdLJpCSbuEU1XQg3Dithdoh+YsJt1wOkVxxf5II=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBfIlqnrGyuJRCGWaRPfSYxuMTeuOR1dqY3lzSEyVnYXgSIa+zzlsfw0y8MXsAtbHuLWPh+1sGZD2gSydZWuAhWycAdI2XygX67xGQdwzHNyQXtFekKZ7qZT/I/dcLdInX7FcZh21FXmOA4nRcz1YJKPcuQ2G6JbU1i5IHXLlsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwGT93Po; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwGT93Po"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790593473; x=1822129473;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=l1oJFdLJpCSbuEU1XQg3Dithdoh+YsJt1wOkVxxf5II=;
  b=dwGT93PoUGCtjNzBam50BNOYllCsXGrMWWEVVu6NAW+vgkb94Ul7XK/5
   Or4BxvT/mqqRgt2K+RRJDPYHfRjfQi5JVU7DYmJyIHP4Hf7jMptu5TJIy
   1E/ad1xGczKY5lQXSWV4xyUdG6HC7rIH7JVkrDmxCrsWaVjGHkqTJpZDN
   yccaOJw270SZu8UPop3Kb9wv2tb1kq+w6Y4QFt0orgvRqyBt3+NEdJAng
   0Gt4QowZzEkLFLquzV0C9S1faaWNng8aKInkYnhgSH8yC84Mo+8Fqttpd
   bF3BVKsUjhiP972k/TsjVd9hW0JRepvCmA1PWfjsscetJcDa/lYA+IfKK
   g==;
X-CSE-ConnectionGUID: SGiKuS8FRUm2XZ8RKWSwtg==
X-CSE-MsgGUID: xuZvNrnHSUmTx25FJ5nYEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="113074411"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="113074411"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 04:04:32 -0700
X-CSE-ConnectionGUID: D9BnqOFCQgutWbALACkgGA==
X-CSE-MsgGUID: T4AaB3sTTVeryM6duKJxDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="274533707"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 28 Sep 2026 04:04:30 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xB99o-000000000yd-2I2y
	for oe-kbuild-all@lists.linux.dev;
	Mon, 28 Sep 2026 11:04:28 +0000
Date: Mon, 28 Sep 2026 13:03:38 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: clk: meson: pll: Remove the dedicated n parameter
Message-ID: <202609281219.WksP0Aus-lkp@intel.com>
References: <202609281219.WksP0Aus-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609281219.WksP0Aus-lkp@intel.com>

Hi Jian,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Jian-Hu-via-B4-Relay/clk-meson-pll-Remove-the-dedicated-n-parameter/20260923-191447
base:   
patch link:    https://lore.kernel.org/r/202609281219.WksP0Aus-lkp%40intel.com
config: arm64-randconfig-r2104-20260928 (https://download.01.org/0day-ci/archive/20260928/202609281219.WksP0Aus-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609281219.WksP0Aus-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609281219.WksP0Aus-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/clk/meson/a1-pll.c:40:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
      40 |                 .n = {
         |                  ^
         |                  en
   drivers/clk/meson/a1-pll.c:45:25: warning: initialized field overwritten [-Woverride-init]
      45 |                 .frac = {
         |                         ^
   drivers/clk/meson/a1-pll.c:45:25: note: (near initialization for '(anonymous).frac')
   drivers/clk/meson/a1-pll.c:111:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     111 |                 .n = {
         |                  ^
         |                  en
   drivers/clk/meson/a1-pll.c:116:25: warning: initialized field overwritten [-Woverride-init]
     116 |                 .frac = {
         |                         ^
   drivers/clk/meson/a1-pll.c:116:25: note: (near initialization for '(anonymous).frac')
--
>> drivers/clk/meson/g12a.c:152:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     152 |                 .n = {
         |                  ^
         |                  en
   drivers/clk/meson/g12a.c:157:25: warning: initialized field overwritten [-Woverride-init]
     157 |                 .frac = {
         |                         ^
   drivers/clk/meson/g12a.c:157:25: note: (near initialization for '(anonymous).frac')
   drivers/clk/meson/g12a.c:221:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     221 |                 .n = {
         |                  ^
         |                  en
   drivers/clk/meson/g12a.c:280:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     280 |                 .n = {
         |                  ^
         |                  en
   drivers/clk/meson/g12a.c:418:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     418 |                 .n = {
         |                  ^
         |                  en
   drivers/clk/meson/g12a.c:423:25: warning: initialized field overwritten [-Woverride-init]
     423 |                 .frac = {
         |                         ^
   drivers/clk/meson/g12a.c:423:25: note: (near initialization for '(anonymous).frac')
   drivers/clk/meson/g12a.c:483:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     483 |                 .n = {
         |                  ^
         |                  en
   drivers/clk/meson/g12a.c:488:25: warning: initialized field overwritten [-Woverride-init]
     488 |                 .frac = {
         |                         ^
   drivers/clk/meson/g12a.c:488:25: note: (near initialization for '(anonymous).frac')
   drivers/clk/meson/g12a.c:558:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     558 |                 .n = {
         |                  ^
         |                  en
   drivers/clk/meson/g12a.c:563:25: warning: initialized field overwritten [-Woverride-init]
     563 |                 .frac = {
         |                         ^
   drivers/clk/meson/g12a.c:563:25: note: (near initialization for '(anonymous).frac')
>> drivers/clk/meson/g12a.c:633:38: error: array type has incomplete element type 'struct pll_params_table'
     633 | static const struct pll_params_table g12a_pcie_pll_table[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~
>> drivers/clk/meson/g12a.c:634:9: error: implicit declaration of function 'PLL_PARAMS' [-Werror=implicit-function-declaration]
     634 |         PLL_PARAMS(150, 1),
         |         ^~~~~~~~~~
   drivers/clk/meson/g12a.c:650:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     650 |                 .n = {
         |                  ^
         |                  en
   drivers/clk/meson/g12a.c:655:25: warning: initialized field overwritten [-Woverride-init]
     655 |                 .frac = {
         |                         ^
   drivers/clk/meson/g12a.c:655:25: note: (near initialization for '(anonymous).frac')
>> drivers/clk/meson/g12a.c:670:18: error: 'struct meson_clk_pll_data' has no member named 'table'
     670 |                 .table = g12a_pcie_pll_table,
         |                  ^~~~~
   drivers/clk/meson/g12a.c:744:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     744 |                 .n = {
         |                  ^
         |                  en
   drivers/clk/meson/g12a.c:749:25: warning: initialized field overwritten [-Woverride-init]
     749 |                 .frac = {
         |                         ^
   drivers/clk/meson/g12a.c:749:25: note: (near initialization for '(anonymous).frac')
>> drivers/clk/meson/g12a.c:633:38: warning: 'g12a_pcie_pll_table' defined but not used [-Wunused-variable]
     633 | static const struct pll_params_table g12a_pcie_pll_table[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> drivers/clk/meson/gxbb.c:130:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     130 |                 .n = {
         |                  ^
         |                  en
   drivers/clk/meson/gxbb.c:135:25: warning: initialized field overwritten [-Woverride-init]
     135 |                 .frac = {
         |                         ^
   drivers/clk/meson/gxbb.c:135:25: note: (near initialization for '(anonymous).frac')
   drivers/clk/meson/gxbb.c:207:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     207 |                 .n = {
         |                  ^
         |                  en
   drivers/clk/meson/gxbb.c:212:25: warning: initialized field overwritten [-Woverride-init]
     212 |                 .frac = {
         |                         ^
   drivers/clk/meson/gxbb.c:212:25: note: (near initialization for '(anonymous).frac')
   drivers/clk/meson/gxbb.c:255:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     255 |                 .n = {
         |                  ^
         |                  en
   drivers/clk/meson/gxbb.c:266:25: warning: initialized field overwritten [-Woverride-init]
     266 |                 .frac = {
         |                         ^
   drivers/clk/meson/gxbb.c:266:25: note: (near initialization for '(anonymous).frac')
   drivers/clk/meson/gxbb.c:428:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     428 |                 .n = {
         |                  ^
         |                  en
>> drivers/clk/meson/gxbb.c:472:38: error: array type has incomplete element type 'struct pll_params_table'
     472 | static const struct pll_params_table gxbb_gp0_pll_params_table[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/meson/gxbb.c:473:9: error: implicit declaration of function 'PLL_PARAMS' [-Werror=implicit-function-declaration]
     473 |         PLL_PARAMS(32, 1),
         |         ^~~~~~~~~~
   drivers/clk/meson/gxbb.c:525:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     525 |                 .n = {
         |                  ^
         |                  en
>> drivers/clk/meson/gxbb.c:540:18: error: 'struct meson_clk_pll_data' has no member named 'table'
     540 |                 .table = gxbb_gp0_pll_params_table,
         |                  ^~~~~
   drivers/clk/meson/gxbb.c:554:38: error: array type has incomplete element type 'struct pll_params_table'
     554 | static const struct pll_params_table gxl_gp0_pll_params_table[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/meson/gxbb.c:603:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     603 |                 .n = {
         |                  ^
         |                  en
   drivers/clk/meson/gxbb.c:608:25: warning: initialized field overwritten [-Woverride-init]
     608 |                 .frac = {
         |                         ^
   drivers/clk/meson/gxbb.c:608:25: note: (near initialization for '(anonymous).frac')
   drivers/clk/meson/gxbb.c:623:18: error: 'struct meson_clk_pll_data' has no member named 'table'
     623 |                 .table = gxl_gp0_pll_params_table,
         |                  ^~~~~
>> drivers/clk/meson/gxbb.c:554:38: warning: 'gxl_gp0_pll_params_table' defined but not used [-Wunused-variable]
     554 | static const struct pll_params_table gxl_gp0_pll_params_table[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/meson/gxbb.c:472:38: warning: 'gxbb_gp0_pll_params_table' defined but not used [-Wunused-variable]
     472 | static const struct pll_params_table gxbb_gp0_pll_params_table[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> drivers/clk/meson/s4-pll.c:71:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
      71 |                 .n = {
         |                  ^
         |                  en
   drivers/clk/meson/s4-pll.c:76:22: warning: initialized field overwritten [-Woverride-init]
      76 |                 .l = {
         |                      ^
   drivers/clk/meson/s4-pll.c:76:22: note: (near initialization for '(anonymous).l')
   drivers/clk/meson/s4-pll.c:305:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     305 |                 .n = {
         |                  ^
         |                  en
   drivers/clk/meson/s4-pll.c:376:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     376 |                 .n = {
         |                  ^
         |                  en
   drivers/clk/meson/s4-pll.c:381:25: warning: initialized field overwritten [-Woverride-init]
     381 |                 .frac = {
         |                         ^
   drivers/clk/meson/s4-pll.c:381:25: note: (near initialization for '(anonymous).frac')
   drivers/clk/meson/s4-pll.c:443:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     443 |                 .n = {
         |                  ^
         |                  en
--
>> drivers/clk/meson/c3-pll.c:263:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     263 |                 .n = {
         |                  ^
         |                  en
   drivers/clk/meson/c3-pll.c:268:22: warning: initialized field overwritten [-Woverride-init]
     268 |                 .l = {
         |                      ^
   drivers/clk/meson/c3-pll.c:268:22: note: (near initialization for '(anonymous).l')
   drivers/clk/meson/c3-pll.c:346:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     346 |                 .n = {
         |                  ^
         |                  en
   drivers/clk/meson/c3-pll.c:351:22: warning: initialized field overwritten [-Woverride-init]
     351 |                 .l = {
         |                      ^
   drivers/clk/meson/c3-pll.c:351:22: note: (near initialization for '(anonymous).l')
   drivers/clk/meson/c3-pll.c:418:18: error: 'struct meson_clk_pll_data' has no member named 'n'; did you mean 'en'?
     418 |                 .n = {
         |                  ^
         |                  en


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
