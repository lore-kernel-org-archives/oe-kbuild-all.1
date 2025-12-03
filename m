Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB4E331A64
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 17:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764783383; cv=none; b=U+7gRv24N8kvNPMJC/P/J2GseWEXr2N+tPOYEW9cGzyc9PbaswuOPbdjWAtAD85rnfpg+/a/lQF+sWzu6OdLsT5z6f9K67geyqiHESR6+Ha7ee1PyeRFJjngoOEE4vOMe2KMu7kvHUib1sRmkPoFifEKMZ25eSWqA+JbrZcJJg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764783383; c=relaxed/simple;
	bh=UfrPAsVnHMF/w7IFGfu9Rt9Iis8wgBLr1edUklD9mVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PJpNGrnkuDVlMcl/w3T5INXmEPYJFHKZwfv8FL9iIrJ5u8M5U6fV7eNuQMsVUDP4AWKn+YzLl567X2LsK06O7ZBAWGOafz5ScdBB+JHob7uL9mZGysgfOkzymcJpdFYISkJZlsKRFyhXABAqW7MGrDsVzM8ja/97s8mBlZ//R4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i42h2Pc9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i42h2Pc9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764783379; x=1796319379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UfrPAsVnHMF/w7IFGfu9Rt9Iis8wgBLr1edUklD9mVk=;
  b=i42h2Pc9UOYMLDRCNNCZ8lUETd5mEPJiBBvOjU4ftGFchZjXz/moMVi4
   RLysCcnZGiC/66hWNNuVUm5ZDmAOVbQEynQaEhHGuyCEMURcFHASu3qlv
   vtMSM+VS/Atm/c6Nd2R+7VlOMI9nbPzt/vOAjMoIPnttACr9gbg6B6/iU
   w7u9CU8dEM3p5yRKiQWL2PRXZ3diU5N7inYGbZnkEp244kvIR2d8QLyrb
   w1PDQ5ZbGCLDsAMqAB4E81ryNSTZrAeo7rSi4jOM/Mzp0d7Rb0HcvBQAl
   YBsv32clP9BrB6w5CkLQDEYwFB8WGjymDEeFAHpDVf429K+qAA/2NVSc6
   g==;
X-CSE-ConnectionGUID: YsT/zTTkRZiYGVq2n1JPmA==
X-CSE-MsgGUID: Hxz0KodrQeiKl8MzE/aNnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="89439020"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="89439020"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 09:36:17 -0800
X-CSE-ConnectionGUID: 1N63m3WiQtOS6xDqxVs3mQ==
X-CSE-MsgGUID: OlG2zrHVT2S+Tlsh9SzWYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="199216491"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Dec 2025 09:36:16 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQqlx-00000000CnR-3uU9;
	Wed, 03 Dec 2025 17:36:13 +0000
Date: Thu, 4 Dec 2025 01:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.18.y 94/124]
 sound/soc/codecs/lpass-wsa-macro.c:1243:26: warning: 'inp_max' is used
 uninitialized
Message-ID: <202512040143.VsmLWrXi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.18.y
head:   c0e9c6b047b399273025aed39b851c94ce0463f4
commit: d3a841fb2856c589ab57c634ef54a679fe4c55d3 [94/124] ASoC: codecs: lpass-wsa-macro: use ports as the DAIs for playback
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251204/202512040143.VsmLWrXi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040143.VsmLWrXi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512040143.VsmLWrXi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/lpass-wsa-macro.c: In function 'wsa_macro_get_active_channels':
>> sound/soc/codecs/lpass-wsa-macro.c:1243:26: warning: 'inp_max' is used uninitialized [-Wuninitialized]
    1243 |                 inp0_dai = inp0_sel < inp_max ? inp_to_dai[inp0_sel] : 0xff;
         |                 ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-wsa-macro.c:1225:16: note: 'inp_max' was declared here
    1225 |         u32 i, inp_max;
         |                ^~~~~~~


vim +/inp_max +1243 sound/soc/codecs/lpass-wsa-macro.c

  1220	
  1221	static int wsa_macro_get_active_channels(const struct snd_soc_dai *dai)
  1222	{
  1223		struct snd_soc_component *component = dai->component;
  1224		struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
  1225		u32 i, inp_max;
  1226		u16 int_mux_cfg0, int_mux_cfg1;
  1227		u8 inp0_sel, inp1_sel, inp2_sel, mix_inp_sel;
  1228		u8 inp0_dai, inp1_dai, inp2_dai, mix_inp_dai;
  1229		int active_ch_mask = 0;
  1230	
  1231		for (i = 0; i < NUM_INTERPOLATORS; i++) {
  1232			int_mux_cfg0 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG0 + WSA_MACRO_MUX_CFG_OFFSET * i;
  1233			int_mux_cfg1 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG1 + WSA_MACRO_MUX_CFG_OFFSET * i;
  1234			inp0_sel = snd_soc_component_read_field(component, int_mux_cfg0,
  1235								wsa->reg_layout->rx_intx_1_mix_inp0_sel_mask);
  1236			inp1_sel = snd_soc_component_read_field(component, int_mux_cfg0,
  1237								wsa->reg_layout->rx_intx_1_mix_inp1_sel_mask);
  1238			inp2_sel = snd_soc_component_read_field(component, int_mux_cfg1,
  1239								wsa->reg_layout->rx_intx_1_mix_inp2_sel_mask);
  1240			mix_inp_sel = snd_soc_component_read_field(component, int_mux_cfg1,
  1241								   wsa->reg_layout->rx_intx_2_sel_mask);
  1242			/* map to corresponding dai->id */
> 1243			inp0_dai = inp0_sel < inp_max ? inp_to_dai[inp0_sel] : 0xff;
  1244			inp1_dai = inp1_sel < inp_max ? inp_to_dai[inp1_sel] : 0xff;
  1245			inp2_dai = inp2_sel < inp_max ? inp_to_dai[inp2_sel] : 0xff;
  1246			mix_inp_dai = mix_inp_sel < inp_max ? inp_to_dai[mix_inp_sel] : 0xff;
  1247	
  1248			/* note: odd values of inp0_sel,etc. are RX0,RX2,etc. (always first channel of the dai) */
  1249			if (inp0_dai == dai->id) active_ch_mask |= (inp0_sel & 1) ? BIT(0) : BIT(1);
  1250			if (inp1_dai == dai->id) active_ch_mask |= (inp1_sel & 1) ? BIT(0) : BIT(1);
  1251			if (inp2_dai == dai->id) active_ch_mask |= (inp2_sel & 1) ? BIT(0) : BIT(1);
  1252			if (mix_inp_dai == dai->id) active_ch_mask |= (mix_inp_sel & 1) ? BIT(0) : BIT(1);
  1253		}
  1254		return active_ch_mask;
  1255	}
  1256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
