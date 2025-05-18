Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AFC2F43
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 18:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747592783; cv=none; b=b/alClVg1y+u3BV3gKOpqzv6BG1HmR1aZzhpGmbA+CHYYBQvRAe9651JNo1Hlig+2xc849dS93tzZA6fjlNhHhwiDGR2BEol4v/7qlqqcS8jo6y1T3BUjvTHXuXJifsq1/MmCdf1H43RTQcl4ATrnqaTyPbRQ1JhWnb8Q9mcaVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747592783; c=relaxed/simple;
	bh=5NL8ll+DqMgZIUgoquIcUT3B3MW2hzVw5Aqosvx3xNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qvF3AmyeVChoYTTqBN27TTaGGx2gwJRWmfRSJVgxvWzG7iBGUcql7f760AnQmCAldVtOoYXqUQJiS60b0cA/aE0Cb0z0YB1GH1PiBmpvnbiEjSBPbIwi2sCFP8MDhG5d9d+820Br28UiG04Xjc1dCFEB6iLcBURCVBrt7Muw4Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CuZ5Y3+r; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CuZ5Y3+r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747592782; x=1779128782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5NL8ll+DqMgZIUgoquIcUT3B3MW2hzVw5Aqosvx3xNs=;
  b=CuZ5Y3+r/uGEFJ98zxgORIPqRPLuSmg7ZVZz7cs9HsV0VWvZ2CI7EqzD
   VZMqQLa+ScV+sHoHDsE9k2W89pOX6anEzR65HAkM+kuDN9t2Xu08owocP
   7SGtZZQTXk3/bHHsVV27HyJY9xGN8aExZQdcjMhynwIqEA+4S6e9r2rSL
   kXwVcPIy1moypbzjuQkG2rPF8rd56UyeOopfMkiQEr9fGkY0LJDCmk4xw
   Uve7NazfU9prjBh9Ay51JwuR7EEmBRqFE9OC3yghEnVvl0F0trBPoThM5
   y9dEaQldH23IXYa+zlyJsSsRLlqA+lPhi0Iu6Osf5UMGU9D3YVtjDeXJ5
   Q==;
X-CSE-ConnectionGUID: WkAjj6oJQ9aLLVexp3ZHJg==
X-CSE-MsgGUID: 0u8mF0OOTPeRJA8ewjnr4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="37112536"
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="37112536"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 11:26:21 -0700
X-CSE-ConnectionGUID: tRljALg+Q821VI/SAI7kmQ==
X-CSE-MsgGUID: uJbdqJWATb+vtpuEwOIXfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="144421116"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 May 2025 11:26:20 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGiiI-0000k3-0D;
	Sun, 18 May 2025 18:26:18 +0000
Date: Mon, 19 May 2025 02:25:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-05-07-2 106/112]
 sound/soc/codecs/cs48l32.c:708:45: error: implicit declaration of function
 'snd_soc_component_get_dapm'; did you mean 'snd_soc_component_to_dapm'?
Message-ID: <202505190214.jmwoHqDD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-05-07-2
head:   acdf0bd7ea1bc39def35811e3fec3d0afe79c98d
commit: 71e72d3a99a8161f164d75eefa964475c470b6e7 [106/112] ASoC: soc-component: remove compatibility definition for component
config: m68k-randconfig-2005-20250519 (https://download.01.org/0day-ci/archive/20250519/202505190214.jmwoHqDD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505190214.jmwoHqDD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505190214.jmwoHqDD-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/codecs/cs48l32.c: In function 'cs48l32_in_rate_put':
>> sound/soc/codecs/cs48l32.c:708:45: error: implicit declaration of function 'snd_soc_component_get_dapm'; did you mean 'snd_soc_component_to_dapm'? [-Werror=implicit-function-declaration]
     708 |         struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                             snd_soc_component_to_dapm
>> sound/soc/codecs/cs48l32.c:708:45: warning: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/cs48l32.c: In function 'cs48l32_low_power_mode_put':
   sound/soc/codecs/cs48l32.c:759:45: warning: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     759 |         struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs48l32.c: In function 'cs48l32_eq_mode_put':
   sound/soc/codecs/cs48l32.c:965:45: warning: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     965 |         struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs48l32.c: In function 'cs48l32_eq_coeff_put':
   sound/soc/codecs/cs48l32.c:1029:45: warning: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1029 |         struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs48l32.c: In function 'cs48l32_dsp_rate_put':
   sound/soc/codecs/cs48l32.c:1086:45: warning: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1086 |         struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +708 sound/soc/codecs/cs48l32.c

e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  703  
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  704  static int cs48l32_in_rate_put(struct snd_kcontrol *kcontrol,
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  705  			       struct snd_ctl_elem_value *ucontrol)
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  706  {
7458bae1d4e0af Kuninori Morimoto  2025-05-07  707  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15 @708  	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  709  	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  710  	int ret;
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  711  
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  712  	snd_soc_dapm_mutex_lock(dapm);
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  713  
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  714  	/* Cannot change rate on an active input */
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  715  	if (cs48l32_is_input_enabled(component, e->reg)) {
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  716  		ret = -EBUSY;
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  717  		goto exit;
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  718  	}
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  719  
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  720  	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  721  exit:
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  722  	snd_soc_dapm_mutex_unlock(dapm);
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  723  
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  724  	return ret;
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  725  }
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  726  

:::::: The code at line 708 was first introduced by commit
:::::: e2bcbf99d045f6ae3826e39d1ed25978de17cbfe ASoC: cs48l32: Add driver for Cirrus Logic CS48L32 audio DSP

:::::: TO: Richard Fitzgerald <rf@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
