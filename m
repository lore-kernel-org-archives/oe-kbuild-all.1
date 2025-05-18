Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4A84C8F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 19:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747596687; cv=none; b=br3LS8h/GyrWmQEnSPLnfAxmQtduEeWI+tVOOEyRlqgDumb6EHOTm/7Ft89ga0UnYafnlP/SO8FFZ+tAiF0IClixOnkuDFKBP7HVqQdcg5X12bj4D8R2y3rftQJjGN08uuk3WYzf6VyIQpdmdyArPhfDGIKTLYy1jLn19e6nkms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747596687; c=relaxed/simple;
	bh=wM+N0LKANjRc7HX204LKq0PxCtmV93lQ7cutJnwVBc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OCqgez9q/boUso4iq+BY/DHzhccvb8j1yhuodNE7qIGxOKvJMyP/hmU8UJwg/wPoy85Bsu3GLu0C7u0sjzJu1lc+ft55sN0hQ7T5bnm91LITJVFdACIbi1cP9u04O9qiBhXaZVvAYAmTtrDVYEm79t22n3NZITrifAXwLT/F12g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=brqNxvGp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="brqNxvGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747596686; x=1779132686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wM+N0LKANjRc7HX204LKq0PxCtmV93lQ7cutJnwVBc4=;
  b=brqNxvGpUtl+jSd0//LHVebHvylrKAKinh1KAbH0Z4fWfWZM67gteSb5
   j+i1C+++A92s+qk+fsSpmpaPQRtdcAflWNn8gBNatK03Qc6Ycu4o+/cbG
   D+GREbaSqBVFeekyLoqolZanMsiog3IIIdJ6CBuJqLV7UpH9KyQHMZ+Lg
   P9knLx9mH/i3d5y2ZCjnqri/OGfsiPDwP85IsBbvMlqKxtnSniMw8/vLX
   Mn/bzE95E7zpgJFr1YYoNfeHRC5oYN2KRfg8rAWyPtcs1QFldFOIM2dZa
   M+nN/CPgN0fXa5+GKqopvZ6ymG/RxTpCL4LBRjj0mbYOpisudhTgWYZPR
   A==;
X-CSE-ConnectionGUID: 4DT2AxzUTu2XVjSVuR12Yw==
X-CSE-MsgGUID: xSLUBrWTTdyXIKlR9fn+qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49372713"
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="49372713"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 12:31:26 -0700
X-CSE-ConnectionGUID: Hx9NByM4TWO2Z9KSIr3nlw==
X-CSE-MsgGUID: 6gtXY2TVQbWXGtkIwZ3lpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="139696620"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa007.jf.intel.com with ESMTP; 18 May 2025 12:31:24 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGjjF-0000kZ-2v;
	Sun, 18 May 2025 19:31:21 +0000
Date: Mon, 19 May 2025 03:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-05-07-2 110/112]
 sound/soc/codecs/cs48l32.c:350:49: error: invalid use of undefined type
 'struct snd_soc_dapm_context'
Message-ID: <202505190306.WYiVlKJo-lkp@intel.com>
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
commit: 57a61b2976d93977cfddb6369ec5e6b24d9348bb [110/112] ASoC: soc-dapm: move struct snd_soc_dapm_context
config: m68k-randconfig-2005-20250519 (https://download.01.org/0day-ci/archive/20250519/202505190306.WYiVlKJo-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505190306.WYiVlKJo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505190306.WYiVlKJo-lkp@intel.com/

All errors (new ones prefixed by >>):

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
>> sound/soc/codecs/cs48l32.c:350:49: error: invalid use of undefined type 'struct snd_soc_dapm_context'
     350 |         ret = snd_soc_component_update_bits(dapm->component,
         |                                                 ^~
   sound/soc/codecs/cs48l32.c: In function 'cs48l32_dmode_put':
   sound/soc/codecs/cs48l32.c:388:45: warning: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     388 |         struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs48l32.c: In function 'cs48l32_in_rate_put':
   sound/soc/codecs/cs48l32.c:708:45: error: implicit declaration of function 'snd_soc_component_get_dapm'; did you mean 'snd_soc_component_to_dapm'? [-Werror=implicit-function-declaration]
     708 |         struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                             snd_soc_component_to_dapm
   sound/soc/codecs/cs48l32.c:708:45: warning: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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


vim +350 sound/soc/codecs/cs48l32.c

e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  319  
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  320  static int cs48l32_inmux_put(struct snd_kcontrol *kcontrol,
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  321  			     struct snd_ctl_elem_value *ucontrol)
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  322  {
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  323  	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  324  	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  325  	struct cs48l32_codec *cs48l32_codec = snd_soc_component_get_drvdata(component);
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  326  	struct soc_enum *e = (struct soc_enum *) kcontrol->private_value;
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  327  	unsigned int mux, src_val, in_type;
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  328  	int ret;
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  329  
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  330  	mux = ucontrol->value.enumerated.item[0];
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  331  	if (mux > 1)
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  332  		return -EINVAL;
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  333  
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  334  	switch (e->reg) {
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  335  	case CS48L32_IN1L_CONTROL1:
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  336  		in_type = cs48l32_codec->in_type[0][mux];
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  337  		break;
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  338  	case CS48L32_IN1R_CONTROL1:
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  339  		in_type = cs48l32_codec->in_type[1][mux];
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  340  		break;
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  341  	default:
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  342  		return -EINVAL;
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  343  	}
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  344  
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  345  	src_val = mux << e->shift_l;
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  346  
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  347  	if (in_type == CS48L32_IN_TYPE_SE)
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  348  		src_val |= 1 << CS48L32_INx_SRC_SHIFT;
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  349  
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15 @350  	ret = snd_soc_component_update_bits(dapm->component,
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  351  					    e->reg,
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  352  					    CS48L32_INx_SRC_MASK,
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  353  					    src_val);
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  354  	if (ret > 0)
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  355  		snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  356  
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  357  	return ret;
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  358  }
e2bcbf99d045f6 Richard Fitzgerald 2025-04-15  359  

:::::: The code at line 350 was first introduced by commit
:::::: e2bcbf99d045f6ae3826e39d1ed25978de17cbfe ASoC: cs48l32: Add driver for Cirrus Logic CS48L32 audio DSP

:::::: TO: Richard Fitzgerald <rf@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
