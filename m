Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5182C026C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 13:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358179; cv=none; b=PJHrL55856Oy5xjrEqZ7RfXxkmZBbIp06mFCQW7Tw2ZD96t4LskDvErwJC0+Bvdym5Zgp1aNuJRsRKWBK34/O8fXg3CQRTBKN5gROrNBJcwi+X0fcP8cCu7k274qKKU3B6amu/y0b1Pv5vHJh6p+HkXyQ8yPySgBiNmHliMasss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358179; c=relaxed/simple;
	bh=w7P6tIEiB8EHGxZMrg2g+BO0Y+iv//hr3Ibt9P5R50Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QP7LgwaorQA6x4d/mKlio8+iCmGxu5OwpM9OdUrEB7GXETzcV3wrh9PKP5aCajCFDsD12oFG2jH5ABB2gAeoeWmzhjy1A+FXoMLfLrVm12MgkR9NSGbDwqEuR+x4mUI9L3Rij6+1WvRzT0poP0vsvMhVQdwOqtex/08sLrJk67w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JllKNEp+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JllKNEp+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774358178; x=1805894178;
  h=date:from:to:cc:subject:message-id;
  bh=w7P6tIEiB8EHGxZMrg2g+BO0Y+iv//hr3Ibt9P5R50Y=;
  b=JllKNEp+ZynI3GT8GrP3Vwa841VOW9aMHA43qctFbuzeDqnS6Sv8srv9
   /KTTOI9kVlrVl980G0TVjniaQbKuYPcV9VEQCwYQQWBI2b18o+yjRqLDp
   w4jrVvYwCcGjiBNydh7rgmNiE19YistAvjY1rOaX4BCzvkTj/2RoJudq4
   ZxUh96iN0bQnkl/vEaZWPPH5fHLji0z6zR4t97MHcdKXj+viOrUHqV0c6
   03Q3cnOlBLA3mT+9RtV+S2IVJLoGAp7E725K2Js01yaCgT/raqZHI9C3k
   cP/OR745ULCI0gDPdrspxyA2sJADz3OJK4a3ZX3GNkY5kXu5XWUCHBvKa
   Q==;
X-CSE-ConnectionGUID: 1c46ZEInT5iu3WgBle3zeQ==
X-CSE-MsgGUID: b3soSAwTQcGk/v6XJoNEyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="62923537"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="62923537"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:16:14 -0700
X-CSE-ConnectionGUID: GjK9Je9kT2COjGEvmeMmfA==
X-CSE-MsgGUID: WkZNJPBWQXWCsyCd5QJt6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="225993313"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Mar 2026 06:16:12 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w51cA-000000004bV-0bPE;
	Tue, 24 Mar 2026 13:16:10 +0000
Date: Tue, 24 Mar 2026 21:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: Teguh Sobirin <teguh@sobir.in>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 Aaron Kling <webgeek1234@gmail.com>
Subject: [linux-next:master 5148/8143] include/linux/property.h:264:
 undefined reference to `wm_halo_init'
Message-ID: <202603242142.PjJp7e5d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
commit: fc1fbafc18a0352f1f23cdff3533fbd0276dd58e [5148/8143] ASoC: codecs: aw88166: Support device specific firmware
config: xtensa-randconfig-001-20260324 (https://download.01.org/0day-ci/archive/20260324/202603242142.PjJp7e5d-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603242142.PjJp7e5d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603242142.PjJp7e5d-lkp@intel.com/

Note: the linux-next/master HEAD 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   xtensa-linux-ld: sound/soc/codecs/cs35l41.o: in function `cs35l41_dai_set_sysclk':
   sound/soc/codecs/cs35l41.c:879: undefined reference to `wm_adsp2_component_remove'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.o: in function `cs35l41_set_channel_map':
   sound/soc/codecs/cs35l41.c:678: undefined reference to `wm_adsp2_component_remove'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.c:681: undefined reference to `wm_adsp2_component_probe'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.o: in function `cs35l41_component_remove':
   sound/soc/codecs/cs35l41.c:953: undefined reference to `wm_adsp2_component_probe'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.o: in function `cs35l41_main_amp_event':
   sound/soc/codecs/cs35l41.c:511: undefined reference to `wm_adsp_event'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.c:525: undefined reference to `wm_adsp_event'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.c:215: undefined reference to `wm_adsp_early_event'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.o: in function `cs35l41_dsp_audio_ev':
   sound/soc/codecs/cs35l41.c:233: undefined reference to `wm_adsp_early_event'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.c:246: undefined reference to `wm_adsp_event'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.o: in function `cs35l41_boost_enable':
   sound/soc/codecs/cs35l41.c:385: undefined reference to `wm_adsp2_remove'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.o: in function `cs35l41_irq':
   sound/soc/codecs/cs35l41.c:406: undefined reference to `wm_adsp2_remove'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.c:433: undefined reference to `wm_halo_init'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.o: in function `device_property_read_u32':
>> include/linux/property.h:264: undefined reference to `wm_halo_init'
>> xtensa-linux-ld: include/linux/property.h:264: undefined reference to `wm_adsp2_remove'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.o: in function `cs35l41_probe':
   sound/soc/codecs/cs35l41.c:1222: undefined reference to `wm_adsp2_remove'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.o:(.rodata+0x2ebc): undefined reference to `wm_adsp2_preloader_get'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.o:(.rodata+0x2ec0): undefined reference to `wm_adsp2_preloader_put'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.o:(.rodata+0x2eec): undefined reference to `wm_adsp_fw_get'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.o:(.rodata+0x2ef0): undefined reference to `wm_adsp_fw_put'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.o:(.rodata+0x2ef8): undefined reference to `wm_adsp_fw_enum'
   xtensa-linux-ld: sound/soc/codecs/cs35l45.o: in function `cs35l45_pll_unlock':
   sound/soc/codecs/cs35l45.c:1230: undefined reference to `wm_adsp2_remove'
   xtensa-linux-ld: sound/soc/codecs/cs35l45.o: in function `cs35l45_asp_hw_params':
   sound/soc/codecs/cs35l45.c:787: undefined reference to `wm_adsp2_component_remove'
   xtensa-linux-ld: sound/soc/codecs/cs35l45.o: in function `cs35l45_asp_set_sysclk':
   sound/soc/codecs/cs35l45.c:791: undefined reference to `wm_adsp2_component_probe'
   xtensa-linux-ld: sound/soc/codecs/cs35l45.c:810: undefined reference to `wm_adsp_event'
   xtensa-linux-ld: sound/soc/codecs/cs35l45.o: in function `cs35l45_mute_stream':
   sound/soc/codecs/cs35l45.c:819: undefined reference to `wm_adsp_early_event'
   xtensa-linux-ld: sound/soc/codecs/cs35l45.c:827: undefined reference to `wm_adsp_event'
   xtensa-linux-ld: sound/soc/codecs/cs35l45.o: in function `cs35l45_probe':
   sound/soc/codecs/cs35l45.c:1402: undefined reference to `wm_halo_init'
   xtensa-linux-ld: sound/soc/codecs/cs35l45.o: in function `cs35l45_initialize':
   sound/soc/codecs/cs35l45.c:1286: undefined reference to `wm_adsp2_remove'
   xtensa-linux-ld: sound/soc/codecs/cs35l45.o:(.rodata+0x6c0): undefined reference to `wm_adsp2_preloader_get'
   xtensa-linux-ld: sound/soc/codecs/cs35l45.o:(.rodata+0x6c4): undefined reference to `wm_adsp2_preloader_put'
   xtensa-linux-ld: sound/soc/codecs/cs35l45.o:(.rodata+0x6f0): undefined reference to `wm_adsp_fw_get'
   xtensa-linux-ld: sound/soc/codecs/cs35l45.o:(.rodata+0x6f4): undefined reference to `wm_adsp_fw_put'
   xtensa-linux-ld: sound/soc/codecs/cs35l45.o:(.rodata+0x6fc): undefined reference to `wm_adsp_fw_enum'
   xtensa-linux-ld: sound/soc/codecs/cs35l56.o: in function `cs35l56_asp_dai_hw_params':
   sound/soc/codecs/cs35l56.c:516: undefined reference to `wm_adsp_power_down'
   xtensa-linux-ld: sound/soc/codecs/cs35l56.c:525: undefined reference to `wm_adsp_power_down'
   xtensa-linux-ld: sound/soc/codecs/cs35l56.c:525: undefined reference to `wm_adsp2_component_remove'
   xtensa-linux-ld: sound/soc/codecs/cs35l56.o: in function `cs35l56_asp_dai_set_fmt':
   sound/soc/codecs/cs35l56.c:380: undefined reference to `wm_adsp2_component_probe'
   xtensa-linux-ld: sound/soc/codecs/cs35l56.o: in function `dev_get_drvdata':
   include/linux/device.h:782: undefined reference to `wm_adsp_event'
   xtensa-linux-ld: sound/soc/codecs/cs35l56.o: in function `cs35l56_set_bias_level':
   sound/soc/codecs/cs35l56.c:1342: undefined reference to `wm_adsp_power_up'
   xtensa-linux-ld: sound/soc/codecs/cs35l56.c:1309: undefined reference to `wm_adsp_power_up'
   xtensa-linux-ld: sound/soc/codecs/cs35l56.o: in function `cs35l56_component_remove':
   sound/soc/codecs/cs35l56.c:1316: undefined reference to `wm_adsp_power_up'
   xtensa-linux-ld: sound/soc/codecs/cs35l56.c:1319: undefined reference to `wm_adsp_run'
   xtensa-linux-ld: sound/soc/codecs/cs35l56.c:1319: undefined reference to `wm_adsp_stop'
   xtensa-linux-ld: sound/soc/codecs/cs35l56.c:1328: undefined reference to `wm_adsp_run'
   xtensa-linux-ld: sound/soc/codecs/cs35l56.c:1237: undefined reference to `wm_adsp_stop'
   xtensa-linux-ld: sound/soc/codecs/cs35l56.o: in function `cs35l56_patch':
   sound/soc/codecs/cs35l56.c:826: undefined reference to `wm_halo_init'
   xtensa-linux-ld: sound/soc/codecs/cs35l56-shared.o: in function `cs35l56_runtime_suspend_common':
   sound/soc/codecs/cs35l56-shared.c:568: undefined reference to `cs_dsp_get_ctl'
   xtensa-linux-ld: sound/soc/codecs/cs35l56-shared.c:568: undefined reference to `cs_dsp_coeff_read_ctrl'
   xtensa-linux-ld: sound/soc/codecs/cs35l56-shared.o: in function `cs35l56_system_reset':
   sound/soc/codecs/cs35l56-shared.c:580: undefined reference to `cs_dsp_get_ctl'
   xtensa-linux-ld: sound/soc/codecs/cs35l56-shared.c:584: undefined reference to `cs_dsp_coeff_read_ctrl'
   xtensa-linux-ld: sound/soc/codecs/cs35l56-shared.o: in function `cs35l56_irq_request':
   sound/soc/codecs/cs35l56-shared.c:632: undefined reference to `cs_dsp_get_ctl'
   xtensa-linux-ld: sound/soc/codecs/cs35l56-shared.c:632: undefined reference to `cs_dsp_coeff_read_ctrl'
   xtensa-linux-ld: sound/soc/codecs/cs35l56-shared.c:636: undefined reference to `cs_dsp_get_ctl'
   xtensa-linux-ld: sound/soc/codecs/cs35l56-shared.c:636: undefined reference to `cs_dsp_coeff_read_ctrl'
   xtensa-linux-ld: sound/soc/codecs/cs35l56-shared.o: in function `cs35l56_irq':
   sound/soc/codecs/cs35l56-shared.c:636: undefined reference to `cs_dsp_get_ctl'
   xtensa-linux-ld: sound/soc/codecs/cs35l56-shared.c:645: undefined reference to `cs_dsp_coeff_read_ctrl'


vim +264 include/linux/property.h

b31384fa5de37a Rafael J. Wysocki 2014-11-04  260  
046b6a171009e1 Guenter Roeck     2023-04-19  261  static inline int device_property_read_u32(const struct device *dev,
b31384fa5de37a Rafael J. Wysocki 2014-11-04  262  					   const char *propname, u32 *val)
b31384fa5de37a Rafael J. Wysocki 2014-11-04  263  {
b31384fa5de37a Rafael J. Wysocki 2014-11-04 @264  	return device_property_read_u32_array(dev, propname, val, 1);
b31384fa5de37a Rafael J. Wysocki 2014-11-04  265  }
b31384fa5de37a Rafael J. Wysocki 2014-11-04  266  

:::::: The code at line 264 was first introduced by commit
:::::: b31384fa5de37a100507751dfb5c0a49d06cee67 Driver core: Unified device properties interface for platform firmware

:::::: TO: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
