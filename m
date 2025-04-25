Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CF41DFDAB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745563487; cv=none; b=Y1Rr+A6MTI4mmQct8rMYg6GDccbW3XbxX8QwnfC/sZ4awT/DyP+38vXF+uQRzsbjNqkmwR46ghb+N90LT14N9OScxaAEj2d77PkxRLXN9bu3MbzZ1C+g8uCkRTAYAZfXboBXJvFD8jCF18Z0TEKS8K5s57FYBS7zny2y5vtCals=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745563487; c=relaxed/simple;
	bh=FpbLcjV7Bz5XUF/bWrolaixaPhN9veKFzoVZ7lJ6RUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YwhZ8qqeCc4erfHwWPbmfz64aSt1xCWmLqRa/a55OIFO2xe9ik+Krlkwa8qAXSC18ZaQJgGZQdoow9gH96oFXPvtjf0Lx+QSIgDwKIBJ6lV8AnTkn+Jz20nwZAvCXgsC3hApBeuGq9MuEonFsu/CRwV9VvIDtyveF3sgcHHsVHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5UEkkPU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5UEkkPU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745563485; x=1777099485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FpbLcjV7Bz5XUF/bWrolaixaPhN9veKFzoVZ7lJ6RUQ=;
  b=B5UEkkPUcw+7qqQwOY+FJIuBuW4gp+QcgcKXUEvq1TFXh0AaWISyMZlw
   CxucsWcyHdXP4+/MetNh+4UGO3papixWhIcrFeqwvZamI/FpoZ6N6Kj7f
   DEFm2slb8MCYOpwhEBgI+cSqp/9sQ6x2ovJviQ840887PGvCmW420E9q5
   okwosW3ihS82E5ZEYaWxqMsxmKvE8wGkCHCTLnp0qrJtA4bqU7uWm6VrA
   yG/P8b/vW0mQLOf5lYRs3HKrljJb8kP/Q9IVHcAyNFftsL3wsIWPpO11Q
   8bupAQh7MhfO2+4sFrJ7Q312suK0vTVrnCU+hiHAKI3eg8x85O1oGF2dg
   w==;
X-CSE-ConnectionGUID: gMxwdAPCRyKW/SNXbXl0Sg==
X-CSE-MsgGUID: CUw35RmoSjmN3tKSzi/UAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="64747483"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="64747483"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 23:44:44 -0700
X-CSE-ConnectionGUID: upr66TM1T6+tLwqIOb8UCA==
X-CSE-MsgGUID: 546aqyJvTIWyFmCGPBKQkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132709892"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Apr 2025 23:44:42 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Cnf-0004tR-20;
	Fri, 25 Apr 2025 06:44:39 +0000
Date: Fri, 25 Apr 2025 14:43:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-04-23 104/116]
 sound/soc/codecs/simple-mux.c:37:45: error: implicit declaration of function
 'snd_soc_dapm_kcontrol_dapm'; did you mean 'snd_soc_dapm_kcontrol_to_dapm'?
Message-ID: <202504251446.SHvcZTKX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-04-23
head:   66104ef95f2f8e651b29bf32aaa483868492887e
commit: 30fb5bcc9ac75eb759c5494a4e5636464e90e38c [104/116] ASoC: soc-dapm: remove compatibility definition for dapm
config: arc-randconfig-001-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251446.SHvcZTKX-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251446.SHvcZTKX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251446.SHvcZTKX-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/simple-mux.c: In function 'simple_mux_control_get':
>> sound/soc/codecs/simple-mux.c:37:45: error: implicit declaration of function 'snd_soc_dapm_kcontrol_dapm'; did you mean 'snd_soc_dapm_kcontrol_to_dapm'? [-Wimplicit-function-declaration]
      37 |         struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                             snd_soc_dapm_kcontrol_to_dapm
>> sound/soc/codecs/simple-mux.c:37:45: error: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/simple-mux.c: In function 'simple_mux_control_put':
   sound/soc/codecs/simple-mux.c:49:45: error: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      49 |         struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/codecs/lpass-wsa-macro.c: In function 'wsa_macro_rx_mux_get':
   sound/soc/codecs/lpass-wsa-macro.c:2138:17: error: implicit declaration of function 'snd_soc_dapm_kcontrol_widget'; did you mean 'snd_soc_dapm_kcontrol_to_widget'? [-Wimplicit-function-declaration]
    2138 |                 snd_soc_dapm_kcontrol_widget(kcontrol);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 snd_soc_dapm_kcontrol_to_widget
>> sound/soc/codecs/lpass-wsa-macro.c:2138:17: error: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/lpass-wsa-macro.c: In function 'wsa_macro_rx_mux_put':
   sound/soc/codecs/lpass-wsa-macro.c:2152:17: error: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2152 |                 snd_soc_dapm_kcontrol_widget(kcontrol);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-wsa-macro.c: In function 'wsa_macro_vi_feed_mixer_get':
   sound/soc/codecs/lpass-wsa-macro.c:2276:46: error: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2276 |         struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-wsa-macro.c: In function 'wsa_macro_vi_feed_mixer_put':
   sound/soc/codecs/lpass-wsa-macro.c:2294:46: error: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2294 |         struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/codecs/lpass-tx-macro.c: In function 'tx_macro_put_dec_enum':
   sound/soc/codecs/lpass-tx-macro.c:804:46: error: implicit declaration of function 'snd_soc_dapm_kcontrol_widget'; did you mean 'snd_soc_dapm_kcontrol_to_widget'? [-Wimplicit-function-declaration]
     804 |         struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                              snd_soc_dapm_kcontrol_to_widget
>> sound/soc/codecs/lpass-tx-macro.c:804:46: error: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/lpass-tx-macro.c: In function 'tx_macro_tx_mixer_get':
   sound/soc/codecs/lpass-tx-macro.c:863:46: error: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     863 |         struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c: In function 'tx_macro_tx_mixer_put':
   sound/soc/codecs/lpass-tx-macro.c:881:46: error: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     881 |         struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +37 sound/soc/codecs/simple-mux.c

342fbb7578d174 Alexandre Belloni 2020-12-05  33  
342fbb7578d174 Alexandre Belloni 2020-12-05  34  static int simple_mux_control_get(struct snd_kcontrol *kcontrol,
342fbb7578d174 Alexandre Belloni 2020-12-05  35  				  struct snd_ctl_elem_value *ucontrol)
342fbb7578d174 Alexandre Belloni 2020-12-05  36  {
342fbb7578d174 Alexandre Belloni 2020-12-05 @37  	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
342fbb7578d174 Alexandre Belloni 2020-12-05  38  	struct snd_soc_component *c = snd_soc_dapm_to_component(dapm);
342fbb7578d174 Alexandre Belloni 2020-12-05  39  	struct simple_mux *priv = snd_soc_component_get_drvdata(c);
342fbb7578d174 Alexandre Belloni 2020-12-05  40  
342fbb7578d174 Alexandre Belloni 2020-12-05  41  	ucontrol->value.enumerated.item[0] = priv->mux;
342fbb7578d174 Alexandre Belloni 2020-12-05  42  
342fbb7578d174 Alexandre Belloni 2020-12-05  43  	return 0;
342fbb7578d174 Alexandre Belloni 2020-12-05  44  }
342fbb7578d174 Alexandre Belloni 2020-12-05  45  

:::::: The code at line 37 was first introduced by commit
:::::: 342fbb7578d1741ff646d7b08e14e8753267b9fa ASoC: add simple-mux

:::::: TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
