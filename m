Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB60242D6A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 05:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779341305; cv=none; b=UfU3MIKG4FajoKNdZE6Ue8rgHO9CwPSbJrVMVy4uELh0JnZpt4omkCRPz6Iid+Vhp/OWIVQdp7m88Vnh9yiIOL+KBL2jpnudSIZYmLV2Fgf8sgnYJRJktKEEZlijPPLdI3EwcFvjpC5u2nphMg/3AoLOi6np+BktEBOtrOvzTow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779341305; c=relaxed/simple;
	bh=KpFCyUWZh4U/HopnUsysFgUv/vBTDVSM+kyApN4fouY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h9pqVKrRHipNeFF8KTvEMT/RBUr8/ZFymwWZFJVuvx6m/yRg6z3maxJzENzz9pvGaogqGxoqnvP2ymKfPA9u/L9xn2IbKuBivgsiE+hPCuUeYT/h1WbYCE0mskTJWieRwFRhEuaIoxg5Z16Ajyh7LGZhkdYwSH2DEaM1W42lZas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nOQMf+Zy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nOQMf+Zy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779341303; x=1810877303;
  h=date:from:to:cc:subject:message-id;
  bh=KpFCyUWZh4U/HopnUsysFgUv/vBTDVSM+kyApN4fouY=;
  b=nOQMf+ZyNPNxqiwNI6OP3owk6uAJpzFovVHP7sr8Z2y/Lhc3Rf8kwRJI
   QxsyCXd23Qj/yN2XUAStjcAM7TwDmR91wr6zrpn07rRdmrm3d2rk9QuQw
   R6Mh4cwy8tsWwmBK4LOeW78xk81befTeNLj8FtT6mmjLLWXWVsWgTwNSy
   Lb2xslPtVk1DLO4SKwqIplGf/rh3zUirM2bnWxjNBOaK04pT0TVzxaRb6
   IGq3mDLnLFI+5KqwANIZpYAP86jcJ9z//O8Klky0qvrsjrmz2Gu83F+pV
   p4ZkMdMxV9+o+3o9iEgrt4lNsic2hoS1eBqLfHQkIvwBdZb/xv0lPaZRF
   g==;
X-CSE-ConnectionGUID: Wf+oKIa+QUylUPHYet+6Fg==
X-CSE-MsgGUID: svHCNyGcR469bzSzznkTBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97682437"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="97682437"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 22:28:23 -0700
X-CSE-ConnectionGUID: E+gYjudlQhq9aXH6dQA4Pw==
X-CSE-MsgGUID: 0D5m2KfsTs2ouDs0xHelZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="244728960"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 May 2026 22:28:22 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPvx8-000000004SR-2WRx;
	Thu, 21 May 2026 05:28:18 +0000
Date: Thu, 21 May 2026 13:26:51 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 340/1130]
 drivers/gpu/drm/bridge/tda998x_drv.c:974:12: warning: 'tda998x_derive_cts_n'
 defined but not used
Message-ID: <202605211316.IMuKBDRX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 88aeac7d0691e6cbf6b17d417b7981bc6c7405fa [340/1130] [CHERRY-PICK] drm: i2c: Include hdmi-codec definitions only when required
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260521/202605211316.IMuKBDRX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211316.IMuKBDRX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211316.IMuKBDRX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/tda998x_drv.c:974:12: warning: 'tda998x_derive_cts_n' defined but not used [-Wunused-function]
     974 | static int tda998x_derive_cts_n(struct tda998x_priv *priv,
         |            ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/tda998x_drv.c:894:41: warning: 'tda998x_audio_route' defined but not used [-Wunused-const-variable=]
     894 | static const struct tda998x_audio_route tda998x_audio_route[AUDIO_ROUTE_NUM] = {
         |                                         ^~~~~~~~~~~~~~~~~~~


vim +/tda998x_derive_cts_n +974 drivers/gpu/drm/bridge/tda998x_drv.c

ad975f9364a3e1be drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2016-10-23   893  
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01  @894  static const struct tda998x_audio_route tda998x_audio_route[AUDIO_ROUTE_NUM] = {
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   895  	[AUDIO_ROUTE_I2S] = {
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   896  		.ena_aclk = 1,
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   897  		.mux_ap = MUX_AP_SELECT_I2S,
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   898  		.aip_clksel = AIP_CLKSEL_AIP_I2S | AIP_CLKSEL_FS_ACLK,
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   899  	},
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   900  	[AUDIO_ROUTE_SPDIF] = {
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   901  		.ena_aclk = 0,
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   902  		.mux_ap = MUX_AP_SELECT_SPDIF,
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   903  		.aip_clksel = AIP_CLKSEL_AIP_SPDIF | AIP_CLKSEL_FS_FS64SPDIF,
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   904  	},
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   905  };
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   906  
88aeac7d0691e6cb drivers/gpu/drm/bridge/tda998x_drv.c Christian Ehrhardt 2025-06-11   907  #ifdef CONFIG_SND_SOC_HDMI_CODEC
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   908  /* Configure the TDA998x audio data and clock routing. */
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   909  static int tda998x_derive_routing(struct tda998x_priv *priv,
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   910  				  struct tda998x_audio_settings *s,
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   911  				  unsigned int route)
c4c11dd160a8cc98 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2013-08-14   912  {
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   913  	s->route = &tda998x_audio_route[route];
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   914  	s->ena_ap = priv->audio_port_enable[route];
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   915  	if (s->ena_ap == 0) {
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   916  		dev_err(&priv->hdmi->dev, "no audio configuration found\n");
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   917  		return -EINVAL;
c4c11dd160a8cc98 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2013-08-14   918  	}
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   919  
26f7bf1251c70baf drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-03-01   920  	return 0;
c4c11dd160a8cc98 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2013-08-14   921  }
88aeac7d0691e6cb drivers/gpu/drm/bridge/tda998x_drv.c Christian Ehrhardt 2025-06-11   922  #endif
c4c11dd160a8cc98 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2013-08-14   923  
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   924  /*
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   925   * The audio clock divisor register controls a divider producing Audio_Clk_Out
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   926   * from SERclk by dividing it by 2^n where 0 <= n <= 5.  We don't know what
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   927   * Audio_Clk_Out or SERclk are. We guess SERclk is the same as TMDS clock.
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   928   *
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   929   * It seems that Audio_Clk_Out must be the smallest value that is greater
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   930   * than 128*fs, otherwise audio does not function. There is some suggestion
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   931   * that 126*fs is a better value.
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   932   */
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   933  static u8 tda998x_get_adiv(struct tda998x_priv *priv, unsigned int fs)
c4c11dd160a8cc98 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2013-08-14   934  {
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   935  	unsigned long min_audio_clk = fs * 128;
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   936  	unsigned long ser_clk = priv->tmds_clock * 1000;
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   937  	u8 adiv;
c4c11dd160a8cc98 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2013-08-14   938  
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   939  	for (adiv = AUDIO_DIV_SERCLK_32; adiv != AUDIO_DIV_SERCLK_1; adiv--)
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   940  		if (ser_clk > min_audio_clk << adiv)
c4c11dd160a8cc98 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2013-08-14   941  			break;
c4c11dd160a8cc98 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2013-08-14   942  
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   943  	dev_dbg(&priv->hdmi->dev,
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   944  		"ser_clk=%luHz fs=%uHz min_aclk=%luHz adiv=%d\n",
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   945  		ser_clk, fs, min_audio_clk, adiv);
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   946  
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   947  	return adiv;
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   948  }
7dad3740aeb71038 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-27   949  
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   950  /*
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   951   * In auto-CTS mode, the TDA998x uses a "measured time stamp" counter to
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   952   * generate the CTS value.  It appears that the "measured time stamp" is
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   953   * the number of TDMS clock cycles within a number of audio input clock
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   954   * cycles defined by the k and N parameters defined below, in a similar
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   955   * way to that which is set out in the CTS generation in the HDMI spec.
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   956   *
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   957   *  tmdsclk ----> mts -> /m ---> CTS
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   958   *                 ^
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   959   *  sclk -> /k -> /N
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   960   *
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   961   * CTS = mts / m, where m is 2^M.
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   962   * /k is a divider based on the K value below, K+1 for K < 4, or 8 for K >= 4
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   963   * /N is a divider based on the HDMI specified N value.
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   964   *
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   965   * This produces the following equation:
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   966   *  CTS = tmds_clock * k * N / (sclk * m)
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   967   *
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   968   * When combined with the sink-side equation, and realising that sclk is
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   969   * bclk_ratio * fs, we end up with:
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   970   *  k = m * bclk_ratio / 128.
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   971   *
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   972   * Note: S/PDIF always uses a bclk_ratio of 64.
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   973   */
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22  @974  static int tda998x_derive_cts_n(struct tda998x_priv *priv,
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   975  				struct tda998x_audio_settings *settings,
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   976  				unsigned int ratio)
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   977  {
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   978  	switch (ratio) {
95db3b255fde4e83 drivers/gpu/drm/i2c/tda998x_drv.c    Jyri Sarha         2016-08-09   979  	case 16:
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   980  		settings->cts_n = CTS_N_M(3) | CTS_N_K(0);
95db3b255fde4e83 drivers/gpu/drm/i2c/tda998x_drv.c    Jyri Sarha         2016-08-09   981  		break;
95db3b255fde4e83 drivers/gpu/drm/i2c/tda998x_drv.c    Jyri Sarha         2016-08-09   982  	case 32:
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   983  		settings->cts_n = CTS_N_M(3) | CTS_N_K(1);
c4c11dd160a8cc98 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2013-08-14   984  		break;
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   985  	case 48:
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   986  		settings->cts_n = CTS_N_M(3) | CTS_N_K(2);
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   987  		break;
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   988  	case 64:
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   989  		settings->cts_n = CTS_N_M(3) | CTS_N_K(3);
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   990  		break;
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   991  	case 128:
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   992  		settings->cts_n = CTS_N_M(0) | CTS_N_K(0);
95db3b255fde4e83 drivers/gpu/drm/i2c/tda998x_drv.c    Jyri Sarha         2016-08-09   993  		break;
3b28802e37bb1ca1 drivers/gpu/drm/i2c/tda998x_drv.c    David Rheinsberg   2013-09-01   994  	default:
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   995  		dev_err(&priv->hdmi->dev, "unsupported bclk ratio %ufs\n",
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   996  			ratio);
95db3b255fde4e83 drivers/gpu/drm/i2c/tda998x_drv.c    Jyri Sarha         2016-08-09   997  		return -EINVAL;
c4c11dd160a8cc98 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2013-08-14   998  	}
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22   999  	return 0;
a03a915b8387286d drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2019-02-22  1000  }
c4c11dd160a8cc98 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King       2013-08-14  1001  

:::::: The code at line 974 was first introduced by commit
:::::: a03a915b8387286dfd1e7500705124414802ede7 drm/i2c: tda998x: derive CTS_N value from aclk sample rate ratio

:::::: TO: Russell King <rmk+kernel@armlinux.org.uk>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
