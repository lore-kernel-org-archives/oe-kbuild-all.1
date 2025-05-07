Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062F625D20E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746624896; cv=none; b=rE4SiwQj09qklOp9T+Cb9fg9dle1Y3z75U0MUB3/VWGsDIYSKMVSp8ktBMs323voBIT7c7Xjwb/Z0NM/7MnhVcHKSsZbN4BmBAw9VqMoYIuTYnJiD8NmtYemx6vF9uEKhCzrDDywkwG5X2ri7HzQGAs9Qisd2DsAdirkbHZ0pag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746624896; c=relaxed/simple;
	bh=ZunUFrQDPCpvJsJh+bxjCp7LkOl96nkV/2aam1yXje4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AP7Ct1/K3FOeRmmcS77oSPzOXVRD6rJ1eAuqC5Kwx4cigpVsbuuurB0UFWEDmbiVQ+xzzuAZVBSKQyj42CobZK3ohltxBYg0qVo/Lb8Ap6bIteM5koEMlapTewJJnv9bwazYFqbTiap+kziPvGYzeanyhA3tdKCSUvJtqT6oTBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WgWwm2fc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WgWwm2fc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746624895; x=1778160895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZunUFrQDPCpvJsJh+bxjCp7LkOl96nkV/2aam1yXje4=;
  b=WgWwm2fc09mNQzY90NYicdBZzO+MoicNjHda9g7urEBd6gXRMdH5vSNM
   HCWdD3H6RMu+fXXxW5s1GZr8j1h37KPEuyShjnFhJgKZVsKIvk0b724FJ
   tqVcjqwOR+Dz+/nU33lHiqd9zBaEr4s0vRw2FMtW7A1+ImoQOT+FPMoiL
   mR2hGGp+ZaDUVznHBy1fl54a0Lci6zxZSRrk67SLHF3VJ9mezS9RoUwnq
   VfG1LOB4C6UbASjN7wPTwmYtl/8D+/c3TNv+2RBCgGuwefzxedvD/aKxk
   uho8q4IhD8MswVGBkiFqHYPLDqn9ZtwVyWIP5WU5FdnzVdLFs0b1iAc9W
   g==;
X-CSE-ConnectionGUID: iCQjTR/gTgCieWpS0Uw6bg==
X-CSE-MsgGUID: hRN7UV7BSxi6vsBPSHBv3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47606960"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="47606960"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:34:53 -0700
X-CSE-ConnectionGUID: ev9Gq+dDT6iE/Pt5ZJprEw==
X-CSE-MsgGUID: 2pb/m/kzRZCS8+124vgcOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="140006950"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 May 2025 06:34:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCevC-0007sj-0N;
	Wed, 07 May 2025 13:34:50 +0000
Date: Wed, 7 May 2025 21:34:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-04-23 109/116]
 sound/soc/ti/omap3pandora.c:142:45: error: initialization of 'struct
 snd_soc_dapm_context *' from incompatible pointer type 'struct
 snd_soc_dapm_context **'
Message-ID: <202505072155.x1suW0Vk-lkp@intel.com>
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
commit: 8c17ad7a9bd60bcfae26a617abb4c5a524d699ee [109/116] ASoC: soc-dapm: add snd_soc_dapm_alloc()
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250507/202505072155.x1suW0Vk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072155.x1suW0Vk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072155.x1suW0Vk-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/ti/n810.c: In function 'n810_startup':
>> sound/soc/ti/n810.c:91:26: error: passing argument 1 of 'n810_ext_control' from incompatible pointer type [-Wincompatible-pointer-types]
      91 |         n810_ext_control(&rtd->card->dapm);
         |                          ^~~~~~~~~~~~~~~~
         |                          |
         |                          struct snd_soc_dapm_context **
   sound/soc/ti/n810.c:42:59: note: expected 'struct snd_soc_dapm_context *' but argument is of type 'struct snd_soc_dapm_context **'
      42 | static void n810_ext_control(struct snd_soc_dapm_context *dapm)
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   sound/soc/ti/n810.c: In function 'n810_set_spk':
   sound/soc/ti/n810.c:137:26: error: passing argument 1 of 'n810_ext_control' from incompatible pointer type [-Wincompatible-pointer-types]
     137 |         n810_ext_control(&card->dapm);
         |                          ^~~~~~~~~~~
         |                          |
         |                          struct snd_soc_dapm_context **
   sound/soc/ti/n810.c:42:59: note: expected 'struct snd_soc_dapm_context *' but argument is of type 'struct snd_soc_dapm_context **'
      42 | static void n810_ext_control(struct snd_soc_dapm_context *dapm)
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   sound/soc/ti/n810.c: In function 'n810_set_jack':
   sound/soc/ti/n810.c:159:26: error: passing argument 1 of 'n810_ext_control' from incompatible pointer type [-Wincompatible-pointer-types]
     159 |         n810_ext_control(&card->dapm);
         |                          ^~~~~~~~~~~
         |                          |
         |                          struct snd_soc_dapm_context **
   sound/soc/ti/n810.c:42:59: note: expected 'struct snd_soc_dapm_context *' but argument is of type 'struct snd_soc_dapm_context **'
      42 | static void n810_ext_control(struct snd_soc_dapm_context *dapm)
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   sound/soc/ti/n810.c: In function 'n810_set_input':
   sound/soc/ti/n810.c:181:26: error: passing argument 1 of 'n810_ext_control' from incompatible pointer type [-Wincompatible-pointer-types]
     181 |         n810_ext_control(&card->dapm);
         |                          ^~~~~~~~~~~
         |                          |
         |                          struct snd_soc_dapm_context **
   sound/soc/ti/n810.c:42:59: note: expected 'struct snd_soc_dapm_context *' but argument is of type 'struct snd_soc_dapm_context **'
      42 | static void n810_ext_control(struct snd_soc_dapm_context *dapm)
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
--
   sound/soc/ti/rx51.c: In function 'rx51_startup':
>> sound/soc/ti/rx51.c:95:26: error: passing argument 1 of 'rx51_ext_control' from incompatible pointer type [-Wincompatible-pointer-types]
      95 |         rx51_ext_control(&card->dapm);
         |                          ^~~~~~~~~~~
         |                          |
         |                          struct snd_soc_dapm_context **
   sound/soc/ti/rx51.c:43:59: note: expected 'struct snd_soc_dapm_context *' but argument is of type 'struct snd_soc_dapm_context **'
      43 | static void rx51_ext_control(struct snd_soc_dapm_context *dapm)
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   sound/soc/ti/rx51.c: In function 'rx51_set_spk':
   sound/soc/ti/rx51.c:133:26: error: passing argument 1 of 'rx51_ext_control' from incompatible pointer type [-Wincompatible-pointer-types]
     133 |         rx51_ext_control(&card->dapm);
         |                          ^~~~~~~~~~~
         |                          |
         |                          struct snd_soc_dapm_context **
   sound/soc/ti/rx51.c:43:59: note: expected 'struct snd_soc_dapm_context *' but argument is of type 'struct snd_soc_dapm_context **'
      43 | static void rx51_ext_control(struct snd_soc_dapm_context *dapm)
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   sound/soc/ti/rx51.c: In function 'rx51_set_input':
   sound/soc/ti/rx51.c:168:26: error: passing argument 1 of 'rx51_ext_control' from incompatible pointer type [-Wincompatible-pointer-types]
     168 |         rx51_ext_control(&card->dapm);
         |                          ^~~~~~~~~~~
         |                          |
         |                          struct snd_soc_dapm_context **
   sound/soc/ti/rx51.c:43:59: note: expected 'struct snd_soc_dapm_context *' but argument is of type 'struct snd_soc_dapm_context **'
      43 | static void rx51_ext_control(struct snd_soc_dapm_context *dapm)
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   sound/soc/ti/rx51.c: In function 'rx51_set_jack':
   sound/soc/ti/rx51.c:190:26: error: passing argument 1 of 'rx51_ext_control' from incompatible pointer type [-Wincompatible-pointer-types]
     190 |         rx51_ext_control(&card->dapm);
         |                          ^~~~~~~~~~~
         |                          |
         |                          struct snd_soc_dapm_context **
   sound/soc/ti/rx51.c:43:59: note: expected 'struct snd_soc_dapm_context *' but argument is of type 'struct snd_soc_dapm_context **'
      43 | static void rx51_ext_control(struct snd_soc_dapm_context *dapm)
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
--
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from sound/soc/ti/omap3pandora.c:9:
   sound/soc/ti/omap3pandora.c: In function 'omap3pandora_dac_event':
   sound/soc/ti/omap3pandora.c:76:40: error: 'struct snd_soc_dapm_context' has no member named 'dev'
      76 |                         dev_err(w->dapm->dev, "Failed to power DAC: %d\n", ret);
         |                                        ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/ti/omap3pandora.c:76:25: note: in expansion of macro 'dev_err'
      76 |                         dev_err(w->dapm->dev, "Failed to power DAC: %d\n", ret);
         |                         ^~~~~~~
   sound/soc/ti/omap3pandora.c: In function 'omap3pandora_out_init':
>> sound/soc/ti/omap3pandora.c:142:45: error: initialization of 'struct snd_soc_dapm_context *' from incompatible pointer type 'struct snd_soc_dapm_context **' [-Wincompatible-pointer-types]
     142 |         struct snd_soc_dapm_context *dapm = &rtd->card->dapm;
         |                                             ^
   sound/soc/ti/omap3pandora.c: In function 'omap3pandora_in_init':
   sound/soc/ti/omap3pandora.c:161:45: error: initialization of 'struct snd_soc_dapm_context *' from incompatible pointer type 'struct snd_soc_dapm_context **' [-Wincompatible-pointer-types]
     161 |         struct snd_soc_dapm_context *dapm = &rtd->card->dapm;
         |                                             ^
--
   sound/soc/ux500/mop500_ab8500.c: In function 'mop500_ab8500_machine_init':
>> sound/soc/ux500/mop500_ab8500.c:360:45: error: initialization of 'struct snd_soc_dapm_context *' from incompatible pointer type 'struct snd_soc_dapm_context **' [-Wincompatible-pointer-types]
     360 |         struct snd_soc_dapm_context *dapm = &rtd->card->dapm;
         |                                             ^


vim +142 sound/soc/ti/omap3pandora.c

68fb740774a429 sound/soc/omap/omap3pandora.c Grazvydas Ignotas  2008-12-04  139  
f0fba2ad1b6b53 sound/soc/omap/omap3pandora.c Liam Girdwood      2010-03-17  140  static int omap3pandora_out_init(struct snd_soc_pcm_runtime *rtd)
68fb740774a429 sound/soc/omap/omap3pandora.c Grazvydas Ignotas  2008-12-04  141  {
987731bb7c80b1 sound/soc/omap/omap3pandora.c Lars-Peter Clausen 2015-07-06 @142  	struct snd_soc_dapm_context *dapm = &rtd->card->dapm;
68fb740774a429 sound/soc/omap/omap3pandora.c Grazvydas Ignotas  2008-12-04  143  
8f008062943c85 sound/soc/omap/omap3pandora.c Grazvydas Ignotas  2009-01-31  144  	/* All TWL4030 output pins are floating */
ce6120cca2589e sound/soc/omap/omap3pandora.c Liam Girdwood      2010-11-05  145  	snd_soc_dapm_nc_pin(dapm, "EARPIECE");
ce6120cca2589e sound/soc/omap/omap3pandora.c Liam Girdwood      2010-11-05  146  	snd_soc_dapm_nc_pin(dapm, "PREDRIVEL");
ce6120cca2589e sound/soc/omap/omap3pandora.c Liam Girdwood      2010-11-05  147  	snd_soc_dapm_nc_pin(dapm, "PREDRIVER");
ce6120cca2589e sound/soc/omap/omap3pandora.c Liam Girdwood      2010-11-05  148  	snd_soc_dapm_nc_pin(dapm, "HSOL");
ce6120cca2589e sound/soc/omap/omap3pandora.c Liam Girdwood      2010-11-05  149  	snd_soc_dapm_nc_pin(dapm, "HSOR");
ce6120cca2589e sound/soc/omap/omap3pandora.c Liam Girdwood      2010-11-05  150  	snd_soc_dapm_nc_pin(dapm, "CARKITL");
ce6120cca2589e sound/soc/omap/omap3pandora.c Liam Girdwood      2010-11-05  151  	snd_soc_dapm_nc_pin(dapm, "CARKITR");
ce6120cca2589e sound/soc/omap/omap3pandora.c Liam Girdwood      2010-11-05  152  	snd_soc_dapm_nc_pin(dapm, "HFL");
ce6120cca2589e sound/soc/omap/omap3pandora.c Liam Girdwood      2010-11-05  153  	snd_soc_dapm_nc_pin(dapm, "HFR");
ce6120cca2589e sound/soc/omap/omap3pandora.c Liam Girdwood      2010-11-05  154  	snd_soc_dapm_nc_pin(dapm, "VIBRA");
ce6120cca2589e sound/soc/omap/omap3pandora.c Liam Girdwood      2010-11-05  155  
b2e69054ea1a36 sound/soc/omap/omap3pandora.c Lars-Peter Clausen 2014-03-12  156  	return 0;
68fb740774a429 sound/soc/omap/omap3pandora.c Grazvydas Ignotas  2008-12-04  157  }
68fb740774a429 sound/soc/omap/omap3pandora.c Grazvydas Ignotas  2008-12-04  158  

:::::: The code at line 142 was first introduced by commit
:::::: 987731bb7c80b170228e6e1acf2e7b91efb51100 ASoC: omap3pandora: Use card DAPM context to access widgets

:::::: TO: Lars-Peter Clausen <lars@metafoo.de>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
