Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFA7197A76
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 06:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745562824; cv=none; b=J/73xFwlEC0R7Uh/e/LCQBsubuMu5wVfFAgZaH0MwqRCPJdTv2e4WJ7H6i4m9Zp0zwVLve8Cshnz+zIG/UqJoFFyxCqDOrewsKI9gRidCjI96kLQEOiDnVj1Cv4eBed9FUGkNbxxtlzckkRUjw9PSB6urWDlicZK5FId2SaOL2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745562824; c=relaxed/simple;
	bh=84mQa3OgKi9QhSib52G3ehci3+Rk0ya8aebWoMnUUro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZGwctm89u5vyZUA0Zt68XB1Dc34PTjsr3FcxyK0i0dTquzjz0K+Z9230wesNhstiA71P+2hg5+PyRNHrEDZTpuT+UhVd+T75mYiMUSSlZmAuktN9ppv0YWgVRXaWtlDaV3kbk8rByeaOL/Nnz4iloyRxaT+zcbSb+c36OMrn0Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+x3HJr9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+x3HJr9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745562823; x=1777098823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=84mQa3OgKi9QhSib52G3ehci3+Rk0ya8aebWoMnUUro=;
  b=O+x3HJr9zTICn/wyoLoWIsob6EccYesbcPrn9qv3lCB/pERJAJiI1RRi
   MkxQkPWjAImtbQ0VtrK15y7JQz/0E53S1iY2CGLzbbxgUbM3t1ar8uzs6
   nIxySxJ5EGB0Xsr8Nk6QSlZWutWkdl1YurbWUBWlR7MfTPobz0RWVv8rr
   +eGwnwjpWJcVw1C70TqSa86HkVMOhQrJ3CU3j4vsr5BTiS4Gm34YVO0fm
   DuuNeSo7QJAT+D+8EbMaqg1U/qPyYXzzfsjESKzSO8O88E5pyLlGStqGW
   B87dd2TtRhCQdA3Q9uCR5Vkt6JZaRwOo7Pm0PlM4PYq2ylreuMZh2SC+2
   g==;
X-CSE-ConnectionGUID: li4bvbaETXm15ofl3uYvEQ==
X-CSE-MsgGUID: whp56N1TTVCZpkFaCSkkeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="69708865"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="69708865"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 23:33:42 -0700
X-CSE-ConnectionGUID: C40PLEW8QSSA6zFsdyeetA==
X-CSE-MsgGUID: OQvemO0ATQKzljsqpRRNxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132817461"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Apr 2025 23:33:40 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Cd0-0004t3-2f;
	Fri, 25 Apr 2025 06:33:38 +0000
Date: Fri, 25 Apr 2025 14:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-04-23 104/116]
 sound/soc/codecs/lpass-wsa-macro.c:2138:17: error: implicit declaration of
 function 'snd_soc_dapm_kcontrol_widget'; did you mean
 'snd_soc_dapm_kcontrol_to_widget'?
Message-ID: <202504251405.xAHnHuB1-lkp@intel.com>
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
config: arc-randconfig-002-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251405.xAHnHuB1-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251405.xAHnHuB1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251405.xAHnHuB1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/codecs/lpass-wsa-macro.c: In function 'wsa_macro_rx_mux_get':
>> sound/soc/codecs/lpass-wsa-macro.c:2138:17: error: implicit declaration of function 'snd_soc_dapm_kcontrol_widget'; did you mean 'snd_soc_dapm_kcontrol_to_widget'? [-Werror=implicit-function-declaration]
    2138 |                 snd_soc_dapm_kcontrol_widget(kcontrol);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 snd_soc_dapm_kcontrol_to_widget
>> sound/soc/codecs/lpass-wsa-macro.c:2138:17: warning: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/lpass-wsa-macro.c: In function 'wsa_macro_rx_mux_put':
   sound/soc/codecs/lpass-wsa-macro.c:2152:17: warning: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2152 |                 snd_soc_dapm_kcontrol_widget(kcontrol);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-wsa-macro.c: In function 'wsa_macro_vi_feed_mixer_get':
   sound/soc/codecs/lpass-wsa-macro.c:2276:46: warning: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2276 |         struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-wsa-macro.c: In function 'wsa_macro_vi_feed_mixer_put':
   sound/soc/codecs/lpass-wsa-macro.c:2294:46: warning: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2294 |         struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   sound/soc/codecs/lpass-va-macro.c: In function 'va_macro_put_dec_enum':
>> sound/soc/codecs/lpass-va-macro.c:521:17: error: implicit declaration of function 'snd_soc_dapm_kcontrol_widget'; did you mean 'snd_soc_dapm_kcontrol_to_widget'? [-Werror=implicit-function-declaration]
     521 |                 snd_soc_dapm_kcontrol_widget(kcontrol);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 snd_soc_dapm_kcontrol_to_widget
>> sound/soc/codecs/lpass-va-macro.c:521:17: warning: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/lpass-va-macro.c: In function 'va_macro_tx_mixer_get':
   sound/soc/codecs/lpass-va-macro.c:561:17: warning: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     561 |                 snd_soc_dapm_kcontrol_widget(kcontrol);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-va-macro.c: In function 'va_macro_tx_mixer_put':
   sound/soc/codecs/lpass-va-macro.c:582:41: warning: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     582 |                                         snd_soc_dapm_kcontrol_widget(kcontrol);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   sound/soc/codecs/lpass-tx-macro.c: In function 'tx_macro_put_dec_enum':
>> sound/soc/codecs/lpass-tx-macro.c:804:46: error: implicit declaration of function 'snd_soc_dapm_kcontrol_widget'; did you mean 'snd_soc_dapm_kcontrol_to_widget'? [-Werror=implicit-function-declaration]
     804 |         struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                              snd_soc_dapm_kcontrol_to_widget
>> sound/soc/codecs/lpass-tx-macro.c:804:46: warning: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/lpass-tx-macro.c: In function 'tx_macro_tx_mixer_get':
   sound/soc/codecs/lpass-tx-macro.c:863:46: warning: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     863 |         struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c: In function 'tx_macro_tx_mixer_put':
   sound/soc/codecs/lpass-tx-macro.c:881:46: warning: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     881 |         struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   sound/soc/codecs/lpass-rx-macro.c: In function 'rx_macro_int_dem_inp_mux_put':
>> sound/soc/codecs/lpass-rx-macro.c:1684:46: error: implicit declaration of function 'snd_soc_dapm_kcontrol_widget'; did you mean 'snd_soc_dapm_kcontrol_to_widget'? [-Werror=implicit-function-declaration]
    1684 |         struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                              snd_soc_dapm_kcontrol_to_widget
>> sound/soc/codecs/lpass-rx-macro.c:1684:46: warning: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/lpass-rx-macro.c: In function 'rx_macro_mux_get':
   sound/soc/codecs/lpass-rx-macro.c:2461:46: warning: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2461 |         struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-rx-macro.c: In function 'rx_macro_mux_put':
   sound/soc/codecs/lpass-rx-macro.c:2473:46: warning: initialization of 'struct snd_soc_dapm_widget *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2473 |         struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +2138 sound/soc/codecs/lpass-wsa-macro.c

809bcbcecebff8 Srinivas Kandagatla 2020-11-05  2133  
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  2134  static int wsa_macro_rx_mux_get(struct snd_kcontrol *kcontrol,
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  2135  				struct snd_ctl_elem_value *ucontrol)
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  2136  {
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  2137  	struct snd_soc_dapm_widget *widget =
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05 @2138  		snd_soc_dapm_kcontrol_widget(kcontrol);
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  2139  	struct snd_soc_component *component =
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  2140  				snd_soc_dapm_to_component(widget->dapm);
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  2141  	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  2142  
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  2143  	ucontrol->value.integer.value[0] =
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  2144  			wsa->rx_port_value[widget->shift];
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  2145  	return 0;
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  2146  }
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  2147  

:::::: The code at line 2138 was first introduced by commit
:::::: 2c4066e5d428d47a28f87407b3d73ebe40c06fd4 ASoC: codecs: lpass-wsa-macro: add dapm widgets and route

:::::: TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
