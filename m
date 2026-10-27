Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108052;
	b=1YGZq/Rpk+WO5IxFtKH+wRsXmfFs9K2ekn48JqTTQ8oxblzd/kvBf685FUf9jMqeIx3Y
	 M8J61MsJ9JGkN2vYTpPqoi+50zKVGNMGqVEiXww3P0vG937IDlcOx3+lkqpaT1eAyU2Ea
	 YjSipYRRmRYBOKxhiuB1l0sIHZ9nWth6P1ymIWSJLV8/LBDa1kzZgq7PPQvsKNlcPJBWx
	 cEb+QukxxFAQw25P62/yXqWdXnsv/dkSMUIaEapU9aw5GUmZeJyoyPHA+ST1M3axh7kM9
	 9ecHUaV5y53qxaIQaAi9ObjHSmH3NA1cqo3x+XVia6/jSqdNruXrzRvJUamU31HUyzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108052;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wd9ea8inpCsRvCnPzE7259ECCIRiZKajwTAmiQw+3ac=;
	b=GRMuPr1NVB1IytT+dIkuRenqWYsoCzyeNPanLcC+dHa6fP/IEkD2aNHndh8rrJgHGs/R
	 zT+/BP2pfA8qtx4IW6DYTp4WGdLNqzOxBOXhnL54bjAh8hA5FJfKpBqgXwKZgziw3wjv+
	 GwVxedk3KXpdmEqEVmlq5FL6TF8PlD9n87ZhljzLvmgSldM0tZ9LL+z2nXjpR5HKjBUdf
	 UO+jyvlqcgqz0K79oINuBwQ/3l/z25tNkZJaqGKN4PNaxr2w8q4thpLX7BX5yOpzHeaJd
	 umjHRIh7+i5pqf/Lv7/3WqH3XC1btJY+CiesEcjFxDLnx7Y479RDGrGGmHR/dUEmhiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GMkatB9r;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23214606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 13:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23214606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GMkatB9r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793108051; x=1824644051;
  h=date:from:to:cc:subject:message-id;
  bh=lb9aTMMY8Zwf8AfZrXfXjVb+juSAvrozWzcIrG4bGAg=;
  b=GMkatB9rXs+cHDVO6But93NY2L2rf9CJTwin2LIAiyUWqhfG1eI9W9l/
   GaFvZ4e4oNcErsbOIIMnL/OpV0FyR+5Qkq5NUo9t9LO7QXJWBLPLXv0tc
   Fw6c5w2P0xzQ3UjLeQPi3e+vGYGcPwkskphGb8KMNA7cTASL3mDEETAn8
   3IdnfA5CSZX6dUQOGCDc2Ig6vLTBK/TlLTurXC4dPSPW6Rf1AT36a62mi
   xZKHKYGGC1zJBuDaVUwCnJS+ez6nH7AEjT6UdL3JoZlY+kcJuDG1HG8Lg
   DbEUCA6Wh5FxkX/YSyxwjJPvc4XArVr4WI1ti3VHxySRtqT9HoXcWfIRR
   w==;
X-CSE-ConnectionGUID: fU3oZCepS1qnbZFRGQ5BTw==
X-CSE-MsgGUID: q7IDviG1SDCJljJ4YCrMTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1688739"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1688739"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 06:34:10 -0700
X-CSE-ConnectionGUID: d9h9I5TVRqiPKv1lz3TCYQ==
X-CSE-MsgGUID: LqHSnsGaTeKqMn8iVy8rLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6306803"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 27 Oct 2026 06:34:08 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLhJV-000000004Wn-3DJn;
	Tue, 27 Oct 2026 13:34:05 +0000
Date: Tue, 27 Oct 2026 14:34:05 +0100
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wens:random-stuff 1/10]
 drivers/clk/meson/meson8b.c:3636:14: warning: unused variable 'notifier_clk'
Message-ID: <202610271406.SnQrnGTr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git random-stuff
head:   6c5d9e149cf308ead35a6bd9016a5f1c74a33cea
commit: 040fc32d92a1a50000f1c4cad511ce2148a53e89 [1/10] clk: meson: meson8b: Simplify notifier clock lookup
config: arm-randconfig-2001-20261027 (https://download.01.org/0day-ci/archive/20261027/202610271406.SnQrnGTr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271406.SnQrnGTr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271406.SnQrnGTr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/meson/meson8b.c: In function 'meson8b_clkc_init_common':
>> drivers/clk/meson/meson8b.c:3636:14: warning: unused variable 'notifier_clk' [-Wunused-variable]
     struct clk *notifier_clk;
                 ^~~~~~~~~~~~


vim +/notifier_clk +3636 drivers/clk/meson/meson8b.c

5e4e480466e611f Neil Armstrong      2023-06-12  3630  
cce433e6bc53b39 Martin Blumenstingl 2018-12-08  3631  static void __init meson8b_clkc_init_common(struct device_node *np,
5e4e480466e611f Neil Armstrong      2023-06-12  3632  					    struct meson_clk_hw_data *hw_clks)
189621726bc2f66 Martin Blumenstingl 2017-07-28  3633  {
189621726bc2f66 Martin Blumenstingl 2017-07-28  3634  	struct meson8b_clk_reset *rstc;
89ab396d712f7c9 Liang He            2022-06-28  3635  	struct device_node *parent_np;
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15 @3636  	struct clk *notifier_clk;
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3637  	struct regmap *map;
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3638  	int i, ret;
189621726bc2f66 Martin Blumenstingl 2017-07-28  3639  
89ab396d712f7c9 Liang He            2022-06-28  3640  	parent_np = of_get_parent(np);
89ab396d712f7c9 Liang He            2022-06-28  3641  	map = syscon_node_to_regmap(parent_np);
89ab396d712f7c9 Liang He            2022-06-28  3642  	of_node_put(parent_np);
bb6eddd1d28c9c4 Martin Blumenstingl 2018-10-28  3643  	if (IS_ERR(map)) {
40e977400d21aab Martin Blumenstingl 2020-12-21  3644  		pr_err("failed to get HHI regmap - Trying obsolete regs\n");
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3645  		return;
bb6eddd1d28c9c4 Martin Blumenstingl 2018-10-28  3646  	}
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3647  
bf4afc53b77aeaa Linus Torvalds      2026-02-21  3648  	rstc = kzalloc_obj(*rstc);
189621726bc2f66 Martin Blumenstingl 2017-07-28  3649  	if (!rstc)
189621726bc2f66 Martin Blumenstingl 2017-07-28  3650  		return;
189621726bc2f66 Martin Blumenstingl 2017-07-28  3651  
189621726bc2f66 Martin Blumenstingl 2017-07-28  3652  	/* Reset Controller */
93c873d68646165 Martin Blumenstingl 2018-07-21  3653  	rstc->regmap = map;
189621726bc2f66 Martin Blumenstingl 2017-07-28  3654  	rstc->reset.ops = &meson8b_clk_reset_ops;
189621726bc2f66 Martin Blumenstingl 2017-07-28  3655  	rstc->reset.nr_resets = ARRAY_SIZE(meson8b_clk_reset_bits);
189621726bc2f66 Martin Blumenstingl 2017-07-28  3656  	rstc->reset.of_node = np;
189621726bc2f66 Martin Blumenstingl 2017-07-28  3657  	ret = reset_controller_register(&rstc->reset);
189621726bc2f66 Martin Blumenstingl 2017-07-28  3658  	if (ret) {
189621726bc2f66 Martin Blumenstingl 2017-07-28  3659  		pr_err("%s: Failed to register clkc reset controller: %d\n",
189621726bc2f66 Martin Blumenstingl 2017-07-28  3660  		       __func__, ret);
189621726bc2f66 Martin Blumenstingl 2017-07-28  3661  		return;
189621726bc2f66 Martin Blumenstingl 2017-07-28  3662  	}
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3663  
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3664  	/*
40e977400d21aab Martin Blumenstingl 2020-12-21  3665  	 * register all clks and start with the first used ID (which is
40e977400d21aab Martin Blumenstingl 2020-12-21  3666  	 * CLKID_PLL_FIXED)
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3667  	 */
5e4e480466e611f Neil Armstrong      2023-06-12  3668  	for (i = CLKID_PLL_FIXED; i < hw_clks->num; i++) {
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3669  		/* array might be sparse */
5e4e480466e611f Neil Armstrong      2023-06-12  3670  		if (!hw_clks->hws[i])
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3671  			continue;
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3672  
5e4e480466e611f Neil Armstrong      2023-06-12  3673  		ret = of_clk_hw_register(np, hw_clks->hws[i]);
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3674  		if (ret)
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3675  			return;
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3676  	}
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3677  
5e4e480466e611f Neil Armstrong      2023-06-12  3678  	meson8b_cpu_nb_data.cpu_clk = hw_clks->hws[CLKID_CPUCLK];
cce433e6bc53b39 Martin Blumenstingl 2018-12-08  3679  
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3680  	/*
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3681  	 * FIXME we shouldn't program the muxes in notifier handlers. The
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3682  	 * tricky programming sequence will be handled by the forthcoming
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3683  	 * coordinated clock rates mechanism once that feature is released.
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3684  	 */
040fc32d92a1a50 Chen-Yu Tsai        2023-03-15  3685  	ret = clk_notifier_register(meson8b_cpu_scale_out_sel.hw.clk, &meson8b_cpu_nb_data.nb);
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3686  	if (ret) {
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3687  		pr_err("%s: failed to register the CPU clock notifier\n",
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3688  		       __func__);
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3689  		return;
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3690  	}
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3691  
5e4e480466e611f Neil Armstrong      2023-06-12  3692  	ret = of_clk_add_hw_provider(np, meson_clk_hw_get, hw_clks);
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3693  	if (ret)
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3694  		pr_err("%s: failed to register clock provider\n", __func__);
189621726bc2f66 Martin Blumenstingl 2017-07-28  3695  }
189621726bc2f66 Martin Blumenstingl 2017-07-28  3696  

:::::: The code at line 3636 was first introduced by commit
:::::: 7dc7eeb8c0875c4bb7607509d9270ad3fd726b6b clk: meson: meson8b: run from the XTAL when changing the CPU frequency

:::::: TO: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
:::::: CC: Neil Armstrong <narmstrong@baylibre.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
