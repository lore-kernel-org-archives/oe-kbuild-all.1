Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BD630AD10
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 07:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774336116; cv=none; b=Jjsxb5FtI17X666sjWwuNG3OyYHHjiZzupSdHMMLMU+m1siKgtmDnNO8EY77v2WvqgNEkPRdbytmqAH0M4Ja0laG2rbDKX3GtrY90BcZSgTn6i24sMf22T+hqhnnXssm+gC5MAgaNqNI/55qAyDoYAxqR/3/bZJUngUcqjDL8wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774336116; c=relaxed/simple;
	bh=vb2uuKDLtc9oZxC1mfm7JG/gHpL5hhvr5ot3xId0g3g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fMXDLdYZ4b0d//Fbdg70+QBYNtKKwYH2MgcGf8FmiQouSpxJYoG7yQSMtN+z72sEDtWcKGoO9FMOiA4PJmd8f/SaVgLwY6IKW2QjiifusH//3Y2/oW8xnbSH5la/+4DKW1TpvFB546UTJRWNcyPmQbV6j4qdzx7Rnx17yO0V5q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ly3+hAL3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ly3+hAL3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774336108; x=1805872108;
  h=date:from:to:cc:subject:message-id;
  bh=vb2uuKDLtc9oZxC1mfm7JG/gHpL5hhvr5ot3xId0g3g=;
  b=ly3+hAL3XLYrSHFYoCPO886mvqhlvCztjapn533muf5Csjt6QhEICrUf
   rcdSCNdzBcvjxr9+8+U3UwI0qFh4L6VsvfEKZw+JIBeOzYhYBQGV9mjts
   9rIeAVvXs+dqiGBIpvUJohPG+1nEWVzXX3q41bZcS6loG5nsj2sqDY8ka
   Pk0JfBmATCliocfVl48CrPmC1TgeW5JNG/9fulG+QOoNAFmjj/FjBjc8g
   Pw6kUcQkalGGto5r4OBCG4I/qfCwtAYL9+k4G7ApEdKiJPO906LiBWzpO
   Gm1Lr5FwMduNWtrIlbELbfVwYkkfHO6aD8613npo0bVTSbX6Z3UzstGUA
   A==;
X-CSE-ConnectionGUID: s01W6cVwSg+BTikUtRTXZA==
X-CSE-MsgGUID: yemSc0vtTIGkR4BYaiI/lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74529741"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="74529741"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 00:08:27 -0700
X-CSE-ConnectionGUID: VZWkD0qFT6eiY+K8YqwjRQ==
X-CSE-MsgGUID: GcFqVIh9SNy8ybMG3+JRVA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Mar 2026 00:08:25 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4vsE-0000000047v-3xBj;
	Tue, 24 Mar 2026 07:08:22 +0000
Date: Tue, 24 Mar 2026 15:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 8082/8143] xtensa-linux-ld:
 sound/soc/codecs/cs35l41.c:402: undefined reference to `wm_adsp2_remove'
Message-ID: <202603241527.WQ5SzKfW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
commit: 0b43101ac812aca1d9bf5ecddd51021a7139e9e9 [8082/8143] Merge branch 'master' of https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
config: xtensa-randconfig-001-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241527.WQ5SzKfW-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241527.WQ5SzKfW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241527.WQ5SzKfW-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: fs/nilfs2/bmap.o: in function `nilfs_bmap_assign':
   fs/nilfs2/bmap.c:395: undefined reference to `__udivdi3'
   xtensa-linux-ld: fs/nilfs2/bmap.o: in function `nilfs_bmap_mark':
   fs/nilfs2/bmap.c:402: undefined reference to `__udivdi3'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.o: in function `cs35l41_dai_set_sysclk':
   sound/soc/codecs/cs35l41.c:886: undefined reference to `wm_adsp2_component_remove'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.o: in function `cs35l41_set_channel_map':
   sound/soc/codecs/cs35l41.c:679: undefined reference to `wm_adsp2_component_remove'
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
   xtensa-linux-ld: sound/soc/codecs/cs35l41.o: in function `cs35l41_irq':
   sound/soc/codecs/cs35l41.c:385: undefined reference to `wm_adsp2_remove'
>> xtensa-linux-ld: sound/soc/codecs/cs35l41.c:402: undefined reference to `wm_adsp2_remove'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.c:434: undefined reference to `wm_halo_init'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.o: in function `cs35l41_handle_pdata':
>> sound/soc/codecs/cs35l41.c:1042: undefined reference to `wm_halo_init'
   xtensa-linux-ld: sound/soc/codecs/cs35l41.o: in function `device_property_read_u32':
>> include/linux/property.h:264: undefined reference to `wm_adsp2_remove'
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
   sound/soc/codecs/cs35l45.c:1281: undefined reference to `wm_adsp2_remove'
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
   include/linux/device.h:882: undefined reference to `wm_adsp_event'
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
   sound/soc/codecs/cs35l56-shared.c:627: undefined reference to `cs_dsp_get_ctl'
   xtensa-linux-ld: sound/soc/codecs/cs35l56-shared.c:632: undefined reference to `cs_dsp_coeff_read_ctrl'
   xtensa-linux-ld: sound/soc/codecs/cs35l56-shared.c:636: undefined reference to `cs_dsp_get_ctl'
   xtensa-linux-ld: sound/soc/codecs/cs35l56-shared.c:636: undefined reference to `cs_dsp_coeff_read_ctrl'
   xtensa-linux-ld: sound/soc/codecs/cs35l56-shared.c:636: undefined reference to `cs_dsp_get_ctl'
   xtensa-linux-ld: sound/soc/codecs/cs35l56-shared.c:636: undefined reference to `cs_dsp_coeff_read_ctrl'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
