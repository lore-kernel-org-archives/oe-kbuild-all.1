Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB9717E0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 19:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747596447; cv=none; b=PnOEvbWoB+brTNvZd+NC5tmuxMkNW7ql8VocD9T5mcLY/D4vzyz5Aaf/eLnOWD63delgxVnQ45SrvILeK1nK2DWRtmp1rUKqR1t+ygmGQIgA8jWEkw+WSdPFAlSYgPcLKVI6FdicwqcoGi8y8xx83Va8dn+GiHURrMJJlBpGSjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747596447; c=relaxed/simple;
	bh=W9Di9UyDJ4uv/qTyfIRFG0xZl3iy/rvpMsRhb8EEyGI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tspFEV4e8pyDuBJYP3rVjTi4lDWZjYSGEEei2Dzo0OS7nBL3fmc7GEbLmJDm6ftmehHGmRgUkXDvbMm7wmndNJjd1AlReog7/K4EQ+Nwi6if89EtiWyXPD2M+SLp5KWphwy4RQiZ72TPEKhmXJFpv/OJcccNKH/udJyKtbxcRwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VdPVS4Xh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VdPVS4Xh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747596445; x=1779132445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W9Di9UyDJ4uv/qTyfIRFG0xZl3iy/rvpMsRhb8EEyGI=;
  b=VdPVS4Xh+JMZRRVLKaqSyuC1qi75yeyq8bIzBDRRnEKx5sTyyk6Hbrb+
   d7EPGbt4+SuwLT8Sasg1JE58YcG+B5vusezHXO+fasmnStZZtNyObuDIh
   smHMlGFz7mheh2tJbR8cCb7RFM43LOazKJD2W1xHaN6i0Wnm8OjXxHLN8
   0stH63i6pWOyESr0mHSJcrZaMj/Ef4F0VSlOdm9/U992haSpfySpdGE5C
   XnyKBeH9vJ3pT6tPoKk9nU+5NCjul0oGl5xsmG8a6zvo4DgsRA+57/t4a
   32KJt/PnVAMl+UYLaJiP/06hwGN+uT1t9xFjUftc6ocmzsa4DhEepXQRH
   Q==;
X-CSE-ConnectionGUID: l02z8M6ZSiihqPFEgMqLMA==
X-CSE-MsgGUID: 6JEr8IVdRi+THwcnq17/pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49649867"
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="49649867"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 12:27:25 -0700
X-CSE-ConnectionGUID: XoRHOHIBSNuxKU9LIV8dxg==
X-CSE-MsgGUID: BlL06dWXTRuHUbq3y7Rd0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="176294707"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa001.jf.intel.com with ESMTP; 18 May 2025 12:27:24 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGjfN-0000kV-25;
	Sun, 18 May 2025 19:27:21 +0000
Date: Mon, 19 May 2025 03:26:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-05-07 107/111]
 sound/soc/codecs/rt9123.c:111:42: error: implicit declaration of function
 'snd_soc_kcontrol_component'; did you mean 'snd_soc_lookup_component'?
Message-ID: <202505190337.IAAIZdG4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-05-07
head:   0a0c1dc2dfedd13824871fa9159e588e3dd5bcf9
commit: 11b71af7bc15a3aec6cae0d6ee768d3d51e68faa [107/111] ASoC: soc-dapm: remove compatibility definition for dapm
config: m68k-randconfig-2005-20250519 (https://download.01.org/0day-ci/archive/20250519/202505190337.IAAIZdG4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505190337.IAAIZdG4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505190337.IAAIZdG4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/codecs/rt9123.c: In function 'rt9123_kcontrol_name_comp':
>> sound/soc/codecs/rt9123.c:111:42: error: implicit declaration of function 'snd_soc_kcontrol_component'; did you mean 'snd_soc_lookup_component'? [-Werror=implicit-function-declaration]
     111 |         struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                          snd_soc_lookup_component
>> sound/soc/codecs/rt9123.c:111:42: warning: initialization of 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/rt9123.c: In function 'rt9123_xhandler_get':
   sound/soc/codecs/rt9123.c:122:42: warning: initialization of 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     122 |         struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/rt9123.c: In function 'rt9123_xhandler_put':
   sound/soc/codecs/rt9123.c:150:42: warning: initialization of 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     150 |         struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   sound/soc/codecs/cs48l32.c: In function 'cs48l32_rate_put':
>> sound/soc/codecs/cs48l32.c:234:47: error: implicit declaration of function 'snd_soc_kcontrol_component'; did you mean 'snd_soc_lookup_component'? [-Werror=implicit-function-declaration]
     234 |         struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                               snd_soc_lookup_component
   sound/soc/codecs/cs48l32.c:234:47: warning: initialization of 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/cs48l32.c: In function 'cs48l32_inmux_put':
   sound/soc/codecs/cs48l32.c:323:47: error: implicit declaration of function 'snd_soc_dapm_kcontrol_component'; did you mean 'snd_soc_dapm_kcontrol_to_component'? [-Werror=implicit-function-declaration]
     323 |         struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                               snd_soc_dapm_kcontrol_to_component
   sound/soc/codecs/cs48l32.c:323:47: warning: initialization of 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/cs48l32.c:324:45: error: implicit declaration of function 'snd_soc_dapm_kcontrol_dapm'; did you mean 'snd_soc_dapm_kcontrol_to_dapm'? [-Werror=implicit-function-declaration]
     324 |         struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                             snd_soc_dapm_kcontrol_to_dapm
   sound/soc/codecs/cs48l32.c:324:45: warning: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/cs48l32.c: In function 'cs48l32_dmode_put':
   sound/soc/codecs/cs48l32.c:388:45: warning: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     388 |         struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs48l32.c: In function 'cs48l32_in_rate_put':
   sound/soc/codecs/cs48l32.c:707:47: warning: initialization of 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     707 |         struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs48l32.c:708:45: error: implicit declaration of function 'snd_soc_component_get_dapm'; did you mean 'snd_soc_component_to_dapm'? [-Werror=implicit-function-declaration]
     708 |         struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                             snd_soc_component_to_dapm
   sound/soc/codecs/cs48l32.c:708:45: warning: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/cs48l32.c: In function 'cs48l32_low_power_mode_put':
   sound/soc/codecs/cs48l32.c:758:47: warning: initialization of 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     758 |         struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs48l32.c:759:45: warning: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     759 |         struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs48l32.c: In function 'cs48l32_lhpf_coeff_put':
   sound/soc/codecs/cs48l32.c:915:47: warning: initialization of 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     915 |         struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs48l32.c: In function 'cs48l32_eq_mode_get':
   sound/soc/codecs/cs48l32.c:950:47: warning: initialization of 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     950 |         struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs48l32.c: In function 'cs48l32_eq_mode_put':
   sound/soc/codecs/cs48l32.c:964:47: warning: initialization of 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     964 |         struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs48l32.c:965:45: warning: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     965 |         struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs48l32.c: In function 'cs48l32_eq_coeff_get':
   sound/soc/codecs/cs48l32.c:1003:47: warning: initialization of 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1003 |         struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs48l32.c: In function 'cs48l32_eq_coeff_put':
   sound/soc/codecs/cs48l32.c:1028:47: warning: initialization of 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1028 |         struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs48l32.c:1029:45: warning: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1029 |         struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs48l32.c: In function 'cs48l32_dsp_rate_get':
   sound/soc/codecs/cs48l32.c:1065:47: warning: initialization of 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1065 |         struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs48l32.c: In function 'cs48l32_dsp_rate_put':
   sound/soc/codecs/cs48l32.c:1085:47: warning: initialization of 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1085 |         struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs48l32.c:1086:45: warning: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1086 |         struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs48l32.c: In function 'cs48l32_in_put_volsw':
   sound/soc/codecs/cs48l32.c:2465:47: warning: initialization of 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2465 |         struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +111 sound/soc/codecs/rt9123.c

8bffd24e45618b ChiYuan Huang 2025-04-10   96  
8bffd24e45618b ChiYuan Huang 2025-04-10   97  static const DECLARE_TLV_DB_SCALE(dig_tlv, -10375, 25, 0);
8bffd24e45618b ChiYuan Huang 2025-04-10   98  static const DECLARE_TLV_DB_RANGE(ana_tlv,
8bffd24e45618b ChiYuan Huang 2025-04-10   99  				  0, 0, TLV_DB_SCALE_ITEM(-1200, 0, 0),
8bffd24e45618b ChiYuan Huang 2025-04-10  100  				  1, 9, TLV_DB_SCALE_ITEM(0, 150, 0),
8bffd24e45618b ChiYuan Huang 2025-04-10  101  				  10, 10, TLV_DB_SCALE_ITEM(1400, 0, 0));
8bffd24e45618b ChiYuan Huang 2025-04-10  102  static const char * const pwmfreq_text[] = { "300KHz", "325KHz", "350KHz", "375KHz" };
8bffd24e45618b ChiYuan Huang 2025-04-10  103  static const struct soc_enum rt9123_pwm_freq_enum =
8bffd24e45618b ChiYuan Huang 2025-04-10  104  	SOC_ENUM_SINGLE(RT9123_REG_AMPCTRL, 4, ARRAY_SIZE(pwmfreq_text), pwmfreq_text);
8bffd24e45618b ChiYuan Huang 2025-04-10  105  static const char * const i2sch_text[] = { "(L+R)/2", "LCH", "RCH", "(L+R)/2" };
8bffd24e45618b ChiYuan Huang 2025-04-10  106  static const struct soc_enum rt9123_i2sch_select_enum =
8bffd24e45618b ChiYuan Huang 2025-04-10  107  	SOC_ENUM_SINGLE(RT9123_REG_I2SOPT, 4, ARRAY_SIZE(i2sch_text), i2sch_text);
8bffd24e45618b ChiYuan Huang 2025-04-10  108  
8bffd24e45618b ChiYuan Huang 2025-04-10  109  static int rt9123_kcontrol_name_comp(struct snd_kcontrol *kcontrol, const char *s)
8bffd24e45618b ChiYuan Huang 2025-04-10  110  {
8bffd24e45618b ChiYuan Huang 2025-04-10 @111  	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
8bffd24e45618b ChiYuan Huang 2025-04-10  112  	const char *kctlname = kcontrol->id.name;
8bffd24e45618b ChiYuan Huang 2025-04-10  113  
8bffd24e45618b ChiYuan Huang 2025-04-10  114  	if (comp && comp->name_prefix)
8bffd24e45618b ChiYuan Huang 2025-04-10  115  		kctlname += strlen(comp->name_prefix) + 1;
8bffd24e45618b ChiYuan Huang 2025-04-10  116  
8bffd24e45618b ChiYuan Huang 2025-04-10  117  	return strcmp(kctlname, s);
8bffd24e45618b ChiYuan Huang 2025-04-10  118  }
8bffd24e45618b ChiYuan Huang 2025-04-10  119  

:::::: The code at line 111 was first introduced by commit
:::::: 8bffd24e45618b6c3d6ce11947193c6d8ba846a7 ASoC: codecs: Add support for Richtek rt9123

:::::: TO: ChiYuan Huang <cy_huang@richtek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
