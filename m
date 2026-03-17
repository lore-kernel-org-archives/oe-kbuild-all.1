Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33BE345CC0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 09:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773738387; cv=none; b=eizYJDWf671sQva8LkUDoFbi6xQVn/rYSFSpeaF7v5BvVm9/oXP6S0Xi2z/CUCgsyx946MAuZ7Yug9fZ2coO3GJZuvPnvVel5/EWnHzT22r7PsWyfsc3amYiRsQSW4kVui09VJDlwR2Vg7kMYL4gviWSnbJtFIbXzVL7dBbmCa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773738387; c=relaxed/simple;
	bh=Pt8G0uyz6d4cQsOsnwFmr9hRLX2M6U+u939oscxAgMQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mtAQWpXAQz+0scCMwV6qxpHHoJ6MKlyClDTaNInz7Zz17T/4XFv8Z2ev4OwkPJzB97GaJo4blO/oH4onc3opeIlrYUhPdYFAe9Oro2NeOPWMH4ALOKrOIg85cZnwneN+P5Yd6lCFBFwqJ3P/wj/Mmc3BiOukOvxMXMw+nS/YaAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cI3de1X7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cI3de1X7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773738386; x=1805274386;
  h=date:from:to:cc:subject:message-id;
  bh=Pt8G0uyz6d4cQsOsnwFmr9hRLX2M6U+u939oscxAgMQ=;
  b=cI3de1X76QtsJM5BGPbpF27EjuRAE+Ukww/c/5ujKFWVg/p8bxwjsPAQ
   qm/xq2PzfGWcf5hJ1rvBsRFbcFIdi3g5FdbQ91juIBwKnlU5Y5PJAoDrf
   J6iMWDZgBlGnKckNcqbPWkSD5nsnJBmdrTaiRQ8KhlvatMbnEO3rn0szX
   ACjyphDZyrLfhuCzM36aGVpZTfei4e8VVp6hE0NdYXa8/HMeWQdsnmqgn
   2Dncc4m1Gf+yVFhavvGH6h3pdZ5Ysh7075Baqs6Xpjiog7V7Zvj1LK1sp
   jBjcY4WDaACBe8Bn9PrN8wOU/v4DjVxrlUl9xoqtbY5g/BCir6atImqXQ
   Q==;
X-CSE-ConnectionGUID: 36JaIFeTQ7uGsIV5JbiA4Q==
X-CSE-MsgGUID: RMm09DuMQIml99vcIJP/bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="73782691"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="73782691"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:06:24 -0700
X-CSE-ConnectionGUID: ja174xaaQUKVzOJeuqiDoA==
X-CSE-MsgGUID: pAqRTa/fTeS/hG74uX3Y/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226880012"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Mar 2026 02:06:22 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2QNY-0000000008b-0pgp;
	Tue, 17 Mar 2026 09:06:20 +0000
Date: Tue, 17 Mar 2026 17:06:00 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: 
 [broonie-ci:20260310_rf_asoc_wm_adsp_some_improvements_to_firmware_file_search
 4/10] cs35l45.c:undefined reference to `wm_adsp2_remove'
Message-ID: <202603171638.x8RNGAYy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20260310_rf_asoc_wm_adsp_some_improvements_to_firmware_file_search
head:   8fc5c7895185d1119ae76b509892a1d14e0bd483
commit: bf2d44d07de726b0393439cb4d4defc5cf89a4fc [4/10] ASoC: wm_adsp: Add kunit test for firmware file search
config: sparc-randconfig-001-20260317 (https://download.01.org/0day-ci/archive/20260317/202603171638.x8RNGAYy-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603171638.x8RNGAYy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171638.x8RNGAYy-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: sparc-linux-ld: DWARF error: could not find abbrev number 69
   drivers/pci/controller/cadence/pcie-cadence-plat.o: in function `cdns_plat_pcie_probe':
   pcie-cadence-plat.c:(.text+0x140): undefined reference to `cdns_pcie_ep_setup'
   sparc-linux-ld: sparc-linux-ld: DWARF error: could not find abbrev number 57
   sound/soc/codecs/cs35l45.o: in function `cs35l45_remove':
>> cs35l45.c:(.text+0x164): undefined reference to `wm_adsp2_remove'
   sparc-linux-ld: sound/soc/codecs/cs35l45.o: in function `cs35l45_component_remove':
>> cs35l45.c:(.text+0x52c): undefined reference to `wm_adsp2_component_remove'
   sparc-linux-ld: sound/soc/codecs/cs35l45.o: in function `cs35l45_component_probe':
>> cs35l45.c:(.text+0x544): undefined reference to `wm_adsp2_component_probe'
   sparc-linux-ld: sound/soc/codecs/cs35l45.o: in function `cs35l45_dsp_preload_ev':
>> cs35l45.c:(.text+0x5bc): undefined reference to `wm_adsp_event'
>> sparc-linux-ld: cs35l45.c:(.text+0x5f0): undefined reference to `wm_adsp_early_event'
>> sparc-linux-ld: cs35l45.c:(.text+0x5fc): undefined reference to `wm_adsp_event'
   sparc-linux-ld: sound/soc/codecs/cs35l45.o: in function `cs35l45_probe':
>> cs35l45.c:(.text+0x1074): undefined reference to `wm_halo_init'
>> sparc-linux-ld: cs35l45.c:(.text+0x11d0): undefined reference to `wm_adsp2_remove'
>> sparc-linux-ld: sound/soc/codecs/cs35l45.o:(.rodata+0x57c): undefined reference to `wm_adsp2_preloader_get'
>> sparc-linux-ld: sound/soc/codecs/cs35l45.o:(.rodata+0x580): undefined reference to `wm_adsp2_preloader_put'
>> sparc-linux-ld: sound/soc/codecs/cs35l45.o:(.rodata+0x5ac): undefined reference to `wm_adsp_fw_get'
>> sparc-linux-ld: sound/soc/codecs/cs35l45.o:(.rodata+0x5b0): undefined reference to `wm_adsp_fw_put'
>> sparc-linux-ld: sound/soc/codecs/cs35l45.o:(.rodata+0x5b8): undefined reference to `wm_adsp_fw_enum'
   sparc-linux-ld: sparc-linux-ld: DWARF error: could not find abbrev number 9
   sound/soc/codecs/cs35l41.o: in function `cs35l41_component_remove':
>> cs35l41.c:(.text+0xfc): undefined reference to `wm_adsp2_component_remove'
   sparc-linux-ld: sound/soc/codecs/cs35l41.o: in function `cs35l41_component_probe':
>> cs35l41.c:(.text+0x124): undefined reference to `wm_adsp2_component_probe'
   sparc-linux-ld: sound/soc/codecs/cs35l41.o: in function `cs35l41_dsp_audio_ev':
>> cs35l41.c:(.text+0x264): undefined reference to `wm_adsp_event'
   sparc-linux-ld: sound/soc/codecs/cs35l41.o: in function `cs35l41_dsp_preload_ev':
>> cs35l41.c:(.text+0x36c): undefined reference to `wm_adsp_early_event'
>> sparc-linux-ld: cs35l41.c:(.text+0x378): undefined reference to `wm_adsp_event'
   sparc-linux-ld: sound/soc/codecs/cs35l41.o: in function `cs35l41_remove':
>> cs35l41.c:(.text+0xbdc): undefined reference to `wm_adsp2_remove'
   sparc-linux-ld: sound/soc/codecs/cs35l41.o: in function `cs35l41_probe':
>> cs35l41.c:(.text+0x1258): undefined reference to `wm_halo_init'
   sparc-linux-ld: cs35l41.c:(.text+0x13b0): undefined reference to `wm_adsp2_remove'
   sparc-linux-ld: cs35l41.c:(.text+0x13dc): undefined reference to `wm_adsp2_remove'
   sparc-linux-ld: sound/soc/codecs/cs35l41.o:(.rodata+0x2d70): undefined reference to `wm_adsp2_preloader_get'
   sparc-linux-ld: sound/soc/codecs/cs35l41.o:(.rodata+0x2d74): undefined reference to `wm_adsp2_preloader_put'
   sparc-linux-ld: sound/soc/codecs/cs35l41.o:(.rodata+0x2da0): undefined reference to `wm_adsp_fw_get'
   sparc-linux-ld: sound/soc/codecs/cs35l41.o:(.rodata+0x2da4): undefined reference to `wm_adsp_fw_put'
   sparc-linux-ld: sound/soc/codecs/cs35l41.o:(.rodata+0x2dac): undefined reference to `wm_adsp_fw_enum'
   sparc-linux-ld: sparc-linux-ld: DWARF error: could not find abbrev number 15289
   sound/soc/codecs/cs35l56.o: in function `cs35l56_component_remove':
   cs35l56.c:(.text+0xad8): undefined reference to `wm_adsp_power_down'
   sparc-linux-ld: cs35l56.c:(.text+0xae4): undefined reference to `wm_adsp2_component_remove'
   sparc-linux-ld: sound/soc/codecs/cs35l56.o: in function `cs35l56_component_probe':
   cs35l56.c:(.text+0xbac): undefined reference to `wm_adsp2_component_probe'
   sparc-linux-ld: sound/soc/codecs/cs35l56.o: in function `cs35l56_dsp_event':
   cs35l56.c:(.text+0xd20): undefined reference to `wm_adsp_event'
   sparc-linux-ld: sound/soc/codecs/cs35l56.o: in function `cs35l56_write_cal':
   cs35l56.c:(.text+0xd50): undefined reference to `wm_adsp_run'
   sparc-linux-ld: cs35l56.c:(.text+0xd74): undefined reference to `wm_adsp_stop'
   sparc-linux-ld: sound/soc/codecs/cs35l56.o: in function `cs35l56_common_probe':
   cs35l56.c:(.text+0x124c): undefined reference to `wm_halo_init'
   sparc-linux-ld: sound/soc/codecs/cs35l56.o: in function `cs35l56_dsp_download_and_power_up.constprop.27':
   cs35l56.c:(.text+0x1304): undefined reference to `wm_adsp_power_up'
   sparc-linux-ld: cs35l56.c:(.text+0x1338): undefined reference to `wm_adsp_power_up'
   sparc-linux-ld: sparc-linux-ld: DWARF error: could not find abbrev number 57
   sound/soc/codecs/cs35l56-shared.o: in function `cs35l56_cal_set_status_get':
   cs35l56-shared.c:(.text+0x1504): undefined reference to `cs_dsp_get_ctl'
   sparc-linux-ld: cs35l56-shared.c:(.text+0x1514): undefined reference to `cs_dsp_coeff_read_ctrl'
   sparc-linux-ld: sound/soc/codecs/cs35l56-shared.o: in function `cs35l56_log_tuning':
   cs35l56-shared.c:(.text+0x15c4): undefined reference to `cs_dsp_get_ctl'
   sparc-linux-ld: cs35l56-shared.c:(.text+0x15d4): undefined reference to `cs_dsp_coeff_read_ctrl'
   sparc-linux-ld: cs35l56-shared.c:(.text+0x15f8): undefined reference to `cs_dsp_get_ctl'
   sparc-linux-ld: cs35l56-shared.c:(.text+0x1608): undefined reference to `cs_dsp_coeff_read_ctrl'
   sparc-linux-ld: cs35l56-shared.c:(.text+0x1628): undefined reference to `cs_dsp_get_ctl'
   sparc-linux-ld: cs35l56-shared.c:(.text+0x1638): undefined reference to `cs_dsp_coeff_read_ctrl'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
