Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F0433F588
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883722; cv=none; b=OQfVSAU0W6ibkxZEiO81oJ3BpvIPNO4RLqWCfn6g3ys0Cmu+N92U8/O3Lm9Bv13Q0ssC3Y9+cxBTL++YQiWcmZq4NHMs6la7QYStHKl6ueE49E6GxCgwbK9CfWDoM0XGmOFf4AC6nULFWpXPTWUBgOPiOOREUsDRiEIvb4GSNTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883722; c=relaxed/simple;
	bh=R8VZd4iMfvfe8KsC55dcE3zBxlggdsxIc1Ccx7eEuVM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UtmOxmstqtON8sIHkrvCfaRxp0+sYrdQS8v8PSLPlmMz/vVO3epLCKaQVuH8RZFGW05t1MzJuGmugzRiHTA0SZu7EVexg00JaUpx9Tj9C1EMqfpvh5EsmW8c7mPf4fDn99nJ9Gg50qIyw+vJtBYR3vo/FKfHmP/RZT6MnMGgNLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOUqqfcH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOUqqfcH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788883717; x=1820419717;
  h=date:from:to:cc:subject:message-id;
  bh=R8VZd4iMfvfe8KsC55dcE3zBxlggdsxIc1Ccx7eEuVM=;
  b=WOUqqfcHfz82xYTXacLbiIdj7QDDJOCxzDAyC4MbZs2obh21luJofB8W
   QobCdljBwQOlMTa22Wawfa/oBgLkVtb/Mt6c5iOqDIPwOvMcbet8QGMrt
   xgDjg20DvaV5STIrbPfSCJQTgYS9uqnBSIDVmf2loHrhuFvlEWqM/h4BA
   fsDzYZYQoiYauAAhnqoQ4VkZU3OT1IY+0pEb42kBl5WZPsw1ghB7eVgiV
   TFgrq4aCUhlkW6gURlcftoKCQFA2G/V/F4k+27lVDeP66aMttxoW2YcVW
   PdElgZL3GmUafZ8f8qj1Wp5dBsXwegwLGt/+enTu5r05aO1v0CLM2Yb68
   w==;
X-CSE-ConnectionGUID: WJbUCsefSm6jiV57bH1xKg==
X-CSE-MsgGUID: o3dL3I4rRam+Ws/QTFpOQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88225432"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="88225432"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 09:08:34 -0700
X-CSE-ConnectionGUID: /bjiCX+mQ5+8OBpVoMoTBA==
X-CSE-MsgGUID: i1CXsWj+TGS4UDBamfZtUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="275172478"
Received: from lkp-server01.sh.intel.com (HELO dc5b8f51e05b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Sep 2026 09:08:33 -0700
Received: from kbuild by dc5b8f51e05b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3yN3-000000000Lr-3KKa;
	Tue, 08 Sep 2026 16:08:29 +0000
Date: Wed, 09 Sep 2026 00:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-09-04 262/343]
 sound/soc/codecs/nau8360.c:2255:16: error: implicit declaration of function
 'devm_snd_soc_register_component'; did you mean 'devm_snd_soc_register_card'?
Message-ID: <202609082306.RPPerhUN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-09-04
head:   dfa282dfe99643be782149d948208f3d514ebb99
commit: ee124ecd0cb27953c01b601bcb3e15734358af1c [262/343] ASoC: soc-component: remove compatible definition
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260908/202609082306.RPPerhUN-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609082306.RPPerhUN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609082306.RPPerhUN-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/nau8360.c: In function 'nau8360_anc_put':
   sound/soc/codecs/nau8360.c:362:35: error: implicit declaration of function 'snd_soc_component_get_drvdata'; did you mean 'snd_soc_component_set_jack'? [-Wimplicit-function-declaration]
     362 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   snd_soc_component_set_jack
   sound/soc/codecs/nau8360.c:362:35: error: initialization of 'struct nau8360 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/nau8360.c: In function 'nau8360_peq_coeff_get':
   sound/soc/codecs/nau8360.c:409:35: error: initialization of 'struct nau8360 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     409 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c: In function 'nau8360_peq_coeff_put':
   sound/soc/codecs/nau8360.c:452:35: error: initialization of 'struct nau8360 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     452 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c: In function 'nau8360_dsp_switch':
   sound/soc/codecs/nau8360.c:688:35: error: initialization of 'struct nau8360 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     688 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c: In function 'nau8360_dac_mux_put_enum':
   sound/soc/codecs/nau8360.c:712:35: error: initialization of 'struct nau8360 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     712 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c: In function 'nau8360_startup':
   sound/soc/codecs/nau8360.c:826:50: error: invalid use of undefined type 'struct snd_soc_dai'
     826 |         struct snd_soc_component *component = dai->component;
         |                                                  ^~
   sound/soc/codecs/nau8360.c:827:35: error: initialization of 'struct nau8360 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     827 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c: In function 'nau8360_shutdown':
   sound/soc/codecs/nau8360.c:855:50: error: invalid use of undefined type 'struct snd_soc_dai'
     855 |         struct snd_soc_component *component = dai->component;
         |                                                  ^~
   sound/soc/codecs/nau8360.c:856:35: error: initialization of 'struct nau8360 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     856 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c: In function 'nau8360_hw_params':
   sound/soc/codecs/nau8360.c:871:50: error: invalid use of undefined type 'struct snd_soc_dai'
     871 |         struct snd_soc_component *component = dai->component;
         |                                                  ^~
   sound/soc/codecs/nau8360.c:872:35: error: initialization of 'struct nau8360 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     872 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c: In function 'nau8360_set_fmt':
   sound/soc/codecs/nau8360.c:931:50: error: invalid use of undefined type 'struct snd_soc_dai'
     931 |         struct snd_soc_component *component = dai->component;
         |                                                  ^~
   sound/soc/codecs/nau8360.c: In function 'nau8360_enable_tdm_channels':
   sound/soc/codecs/nau8360.c:1130:35: error: initialization of 'struct nau8360 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1130 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c: In function 'nau8360_tdm_apply':
   sound/soc/codecs/nau8360.c:1152:35: error: initialization of 'struct nau8360 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1152 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c: In function 'nau8360_set_tdm_slot':
   sound/soc/codecs/nau8360.c:1172:43: error: invalid use of undefined type 'struct snd_soc_dai'
    1172 |         struct snd_soc_component *cp = dai->component;
         |                                           ^~
   sound/soc/codecs/nau8360.c:1174:35: error: initialization of 'struct nau8360 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1174 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c: In function 'nau8360_set_sysclk':
   sound/soc/codecs/nau8360.c:1430:35: error: initialization of 'struct nau8360 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1430 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c: In function 'nau8360_set_pll':
   sound/soc/codecs/nau8360.c:1547:35: error: initialization of 'struct nau8360 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1547 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c: In function 'nau8360_dsp_bootup':
   sound/soc/codecs/nau8360.c:1658:35: error: initialization of 'struct nau8360 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1658 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c: In function 'nau8360_tdm_function_config':
   sound/soc/codecs/nau8360.c:1668:35: error: initialization of 'struct nau8360 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1668 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c: In function 'nau8360_codec_probe':
   sound/soc/codecs/nau8360.c:1713:35: error: initialization of 'struct nau8360 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1713 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c: In function 'nau8360_suspend':
   sound/soc/codecs/nau8360.c:1760:35: error: initialization of 'struct nau8360 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1760 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c: In function 'nau8360_resume':
   sound/soc/codecs/nau8360.c:1776:35: error: initialization of 'struct nau8360 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1776 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c: In function 'nau8360_i2c_probe':
>> sound/soc/codecs/nau8360.c:2255:16: error: implicit declaration of function 'devm_snd_soc_register_component'; did you mean 'devm_snd_soc_register_card'? [-Wimplicit-function-declaration]
    2255 |         return devm_snd_soc_register_component(dev, &soc_comp_dev_nau8360, &nau8360_dai, 1);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                devm_snd_soc_register_card


vim +2255 sound/soc/codecs/nau8360.c

be88847a8bb1a1 Neo Chang 2026-08-25  2211  
be88847a8bb1a1 Neo Chang 2026-08-25  2212  static int nau8360_i2c_probe(struct i2c_client *i2c)
be88847a8bb1a1 Neo Chang 2026-08-25  2213  {
be88847a8bb1a1 Neo Chang 2026-08-25  2214  	struct device *dev = &i2c->dev;
be88847a8bb1a1 Neo Chang 2026-08-25  2215  	struct nau8360 *nau8360;
be88847a8bb1a1 Neo Chang 2026-08-25  2216  	struct regmap_config regmap_cfg = nau8360_regmap_config;
be88847a8bb1a1 Neo Chang 2026-08-25  2217  	struct reg_default *dyn_defaults;
be88847a8bb1a1 Neo Chang 2026-08-25  2218  	int num_total_regs;
be88847a8bb1a1 Neo Chang 2026-08-25  2219  	int ret, value;
be88847a8bb1a1 Neo Chang 2026-08-25  2220  
be88847a8bb1a1 Neo Chang 2026-08-25  2221  	nau8360 = devm_kzalloc(dev, sizeof(*nau8360), GFP_KERNEL);
be88847a8bb1a1 Neo Chang 2026-08-25  2222  	if (!nau8360)
be88847a8bb1a1 Neo Chang 2026-08-25  2223  		return -ENOMEM;
be88847a8bb1a1 Neo Chang 2026-08-25  2224  
be88847a8bb1a1 Neo Chang 2026-08-25  2225  	i2c_set_clientdata(i2c, nau8360);
be88847a8bb1a1 Neo Chang 2026-08-25  2226  	mutex_init(&nau8360->lock);
be88847a8bb1a1 Neo Chang 2026-08-25  2227  	INIT_WORK(&nau8360->load_fw_work, nau8360_load_fw_work);
be88847a8bb1a1 Neo Chang 2026-08-25  2228  
be88847a8bb1a1 Neo Chang 2026-08-25  2229  	dyn_defaults = nau8360_alloc_defaults(dev, &num_total_regs);
be88847a8bb1a1 Neo Chang 2026-08-25  2230  	if (!dyn_defaults)
be88847a8bb1a1 Neo Chang 2026-08-25  2231  		return -ENOMEM;
be88847a8bb1a1 Neo Chang 2026-08-25  2232  
be88847a8bb1a1 Neo Chang 2026-08-25  2233  	regmap_cfg.reg_defaults = dyn_defaults;
be88847a8bb1a1 Neo Chang 2026-08-25  2234  	regmap_cfg.num_reg_defaults = num_total_regs;
be88847a8bb1a1 Neo Chang 2026-08-25  2235  
be88847a8bb1a1 Neo Chang 2026-08-25  2236  	nau8360->regmap = devm_regmap_init(dev, NULL, i2c, &regmap_cfg);
be88847a8bb1a1 Neo Chang 2026-08-25  2237  	if (IS_ERR(nau8360->regmap))
be88847a8bb1a1 Neo Chang 2026-08-25  2238  		return PTR_ERR(nau8360->regmap);
be88847a8bb1a1 Neo Chang 2026-08-25  2239  	nau8360->dev = dev;
be88847a8bb1a1 Neo Chang 2026-08-25  2240  
be88847a8bb1a1 Neo Chang 2026-08-25  2241  	nau8360_reset_chip(nau8360->regmap);
be88847a8bb1a1 Neo Chang 2026-08-25  2242  	ret = regmap_read(nau8360->regmap, NAU8360_R46_I2C_DEVICE_ID, &value);
be88847a8bb1a1 Neo Chang 2026-08-25  2243  	if (ret) {
be88847a8bb1a1 Neo Chang 2026-08-25  2244  		dev_err(dev, "Failed to read NAU83G60 device id %d", ret);
be88847a8bb1a1 Neo Chang 2026-08-25  2245  		return ret;
be88847a8bb1a1 Neo Chang 2026-08-25  2246  	}
be88847a8bb1a1 Neo Chang 2026-08-25  2247  
be88847a8bb1a1 Neo Chang 2026-08-25  2248  	ret = nau8360_read_device_properties(nau8360);
be88847a8bb1a1 Neo Chang 2026-08-25  2249  	if (ret)
be88847a8bb1a1 Neo Chang 2026-08-25  2250  		return ret;
be88847a8bb1a1 Neo Chang 2026-08-25  2251  
be88847a8bb1a1 Neo Chang 2026-08-25  2252  	nau8360_print_device_properties(nau8360);
be88847a8bb1a1 Neo Chang 2026-08-25  2253  	nau8360_init_regs(nau8360);
be88847a8bb1a1 Neo Chang 2026-08-25  2254  
be88847a8bb1a1 Neo Chang 2026-08-25 @2255  	return devm_snd_soc_register_component(dev, &soc_comp_dev_nau8360, &nau8360_dai, 1);
be88847a8bb1a1 Neo Chang 2026-08-25  2256  }
be88847a8bb1a1 Neo Chang 2026-08-25  2257  

:::::: The code at line 2255 was first introduced by commit
:::::: be88847a8bb1a14194cf50116f8909d127861318 ASoC: codecs: nau8360: Add support for NAU83G60 amplifier

:::::: TO: Neo Chang <YLCHANG2@nuvoton.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
