Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663791AAC4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 09:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573038; cv=none; b=llNHOuqw5wP+FC+Rn5tBiI93TfOWj9xS7S/US2NrDyeMcASUJwfH+T5901bzPgHxft21U/IY9IP3nGxA1FvR+FwR5x9rJhp5Ezz75L+A40URvGjl5n6ua2pWRp9W4tDi4b6tWlv90wz4EiU8igzrHKPTNvu1uJdWzjYgyZn1ysA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573038; c=relaxed/simple;
	bh=E/xROZvkKZUVyC61nzFyTo8ZtKz1PkqO3ux24W1lvFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VT286Qq5Q6BDaU6aBQudNfvViLwfvw/BrvxgAZkd/7zo4VLmNmbV3BtTgkR1cfeK+bjWmwqWVsSbpxs+z+LqsoInTdT144nA+yIXGj8zKbENdeyJI3KQ7/KizpHN3crJTTCi2oHLAMCuVwrttvrQgS9l/RTjkaykPgRE4j72uPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZTNKKCy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZTNKKCy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745573036; x=1777109036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E/xROZvkKZUVyC61nzFyTo8ZtKz1PkqO3ux24W1lvFI=;
  b=nZTNKKCyCz9djpBwgN2VU97YSj3KEXfXTtJGL7hagv5vGDzbw1g5MGqU
   VfegHmsJ1CAqbvJsM8PZ1aaEw9S9pD+Ysz0b0f2W3qLOajBKsWN2VLY5k
   asp17MJAZYPHLhis8WacbV1Bf9cVKRV1VGGl/ua1HGo+E+CqwB+Wk/48n
   SzSppbdImZXaYbcD4v0eb9LWnywkyMRorMuROyDcVGrvm74FnHgIyXszP
   ByHIY+pulg5EpdPqaNvkJfy0xaDUuhrMleIIypxUH8v2es/gYFnpXMklL
   gCivK40RVPl+nfdVDn6l5jkC5nnG0E4W7DAgif3UMhOoblHnJttj0BiBt
   Q==;
X-CSE-ConnectionGUID: 4p0eyDLGTROfqSczye700g==
X-CSE-MsgGUID: 8WmIEZcDRHC7GWtUdYBEMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47103919"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47103919"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 02:23:56 -0700
X-CSE-ConnectionGUID: Djuhtyi2QEOh7314OPvOhw==
X-CSE-MsgGUID: FgQleu7+RyqwtckIzfXJxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="137944244"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Apr 2025 02:23:55 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8FHl-00051d-05;
	Fri, 25 Apr 2025 09:23:53 +0000
Date: Fri, 25 Apr 2025 17:22:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-04-23 104/116]
 sound/soc/codecs/lpass-tx-macro.c:804:39: warning: initialization makes
 pointer from integer without a cast
Message-ID: <202504251722.SS6AadCt-lkp@intel.com>
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
config: powerpc64-randconfig-002-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251722.SS6AadCt-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251722.SS6AadCt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251722.SS6AadCt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/lpass-tx-macro.c: In function 'tx_macro_put_dec_enum':
   sound/soc/codecs/lpass-tx-macro.c:804:39: error: implicit declaration of function 'snd_soc_dapm_kcontrol_widget'; did you mean 'snd_soc_dapm_kcontrol_to_widget'? [-Werror=implicit-function-declaration]
     struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                          snd_soc_dapm_kcontrol_to_widget
>> sound/soc/codecs/lpass-tx-macro.c:804:39: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/lpass-tx-macro.c: In function 'tx_macro_tx_mixer_get':
   sound/soc/codecs/lpass-tx-macro.c:863:39: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
     struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c: In function 'tx_macro_tx_mixer_put':
   sound/soc/codecs/lpass-tx-macro.c:881:39: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
     struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +804 sound/soc/codecs/lpass-tx-macro.c

d34f0c8ee2e30b8 Krzysztof Kozlowski           2024-02-26  800  
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  801  static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  802  				 struct snd_ctl_elem_value *ucontrol)
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  803  {
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11 @804  	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  805  	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  806  	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
d34f0c8ee2e30b8 Krzysztof Kozlowski           2024-02-26  807  	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
d34f0c8ee2e30b8 Krzysztof Kozlowski           2024-02-26  808  	unsigned int val;
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  809  	u16 mic_sel_reg;
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  810  
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  811  	val = ucontrol->value.enumerated.item[0];
75e5fab7db0cecb Ravulapati Vishnu Vardhan Rao 2023-05-11  812  	if (val >= e->items)
75e5fab7db0cecb Ravulapati Vishnu Vardhan Rao 2023-05-11  813  		return -EINVAL;
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  814  
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  815  	switch (e->reg) {
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  816  	case CDC_TX_INP_MUX_ADC_MUX0_CFG0:
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  817  		mic_sel_reg = CDC_TX0_TX_PATH_CFG0;
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  818  		break;
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  819  	case CDC_TX_INP_MUX_ADC_MUX1_CFG0:
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  820  		mic_sel_reg = CDC_TX1_TX_PATH_CFG0;
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  821  		break;
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  822  	case CDC_TX_INP_MUX_ADC_MUX2_CFG0:
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  823  		mic_sel_reg = CDC_TX2_TX_PATH_CFG0;
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  824  		break;
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  825  	case CDC_TX_INP_MUX_ADC_MUX3_CFG0:
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  826  		mic_sel_reg = CDC_TX3_TX_PATH_CFG0;
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  827  		break;
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  828  	case CDC_TX_INP_MUX_ADC_MUX4_CFG0:
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  829  		mic_sel_reg = CDC_TX4_TX_PATH_CFG0;
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  830  		break;
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  831  	case CDC_TX_INP_MUX_ADC_MUX5_CFG0:
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  832  		mic_sel_reg = CDC_TX5_TX_PATH_CFG0;
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  833  		break;
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  834  	case CDC_TX_INP_MUX_ADC_MUX6_CFG0:
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  835  		mic_sel_reg = CDC_TX6_TX_PATH_CFG0;
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  836  		break;
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  837  	case CDC_TX_INP_MUX_ADC_MUX7_CFG0:
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  838  		mic_sel_reg = CDC_TX7_TX_PATH_CFG0;
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  839  		break;
75e5fab7db0cecb Ravulapati Vishnu Vardhan Rao 2023-05-11  840  	default:
75e5fab7db0cecb Ravulapati Vishnu Vardhan Rao 2023-05-11  841  		dev_err(component->dev, "Error in configuration!!\n");
75e5fab7db0cecb Ravulapati Vishnu Vardhan Rao 2023-05-11  842  		return -EINVAL;
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  843  	}
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  844  
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  845  	if (val != 0) {
d34f0c8ee2e30b8 Krzysztof Kozlowski           2024-02-26  846  		if (widget->shift) /* MSM DMIC */
710ccba0cf0e12c Srinivas Kandagatla           2022-11-15  847  			snd_soc_component_write_field(component, mic_sel_reg,
710ccba0cf0e12c Srinivas Kandagatla           2022-11-15  848  						      CDC_TXn_ADC_DMIC_SEL_MASK, 1);
d34f0c8ee2e30b8 Krzysztof Kozlowski           2024-02-26  849  		else if (tx->data->ver <= LPASS_VER_9_0_0)
d34f0c8ee2e30b8 Krzysztof Kozlowski           2024-02-26  850  			tx_macro_update_smic_sel_v9(component, widget, tx,
d34f0c8ee2e30b8 Krzysztof Kozlowski           2024-02-26  851  						    mic_sel_reg, val);
d34f0c8ee2e30b8 Krzysztof Kozlowski           2024-02-26  852  		else
d34f0c8ee2e30b8 Krzysztof Kozlowski           2024-02-26  853  			tx_macro_update_smic_sel_v9_2(component, widget, tx,
d34f0c8ee2e30b8 Krzysztof Kozlowski           2024-02-26  854  						      mic_sel_reg, val);
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  855  	}
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  856  
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  857  	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  858  }
d207bdea0ca9efd Srinivas Kandagatla           2021-02-11  859  

:::::: The code at line 804 was first introduced by commit
:::::: d207bdea0ca9efde321ff142e9b9f2ef73f9cdf5 ASoC: codecs: lpass-tx-macro: add dapm widgets and route

:::::: TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
