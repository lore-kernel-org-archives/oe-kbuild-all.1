Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD201FC8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 04:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712552011; cv=none; b=VpKUUK9j40GTi6j3PogtpaOs4wSqC7VFYR+HMt5+KnzkMXPBenWcAv6K/+//FKCfFk+i2316ZZtx11D0OY03hdjLFmS21fhZehhY6DmF5DvoR+1F1JenQxggAByrQl9rRFXLk9rVFzXKFXoljwDvfAEakdZeNepNV5yZpkD5FIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712552011; c=relaxed/simple;
	bh=+8UKjNg6b4fiU62bMsRxFMroVYJMrBTDYk2OHVA4nvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TfOkt/o3+38xH2aBgI0cf1LocKCSi6qSWfjFyoVZvAv9AUQnO5wMmF/fY98vqXItKdP+DwjuzKuFpOV1I16pRWxY07icvMY9RRLR+8NzeVduHPfFyReY6JaEv32he44eheqrGYTnvC03isjbP/524j1OER6fFA35uTFFYpbuLC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFJZTEPD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFJZTEPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712552009; x=1744088009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+8UKjNg6b4fiU62bMsRxFMroVYJMrBTDYk2OHVA4nvE=;
  b=LFJZTEPDew0oNzWd/v3XBFPrrIdSLx17iTQEnnx9SN4OLvZfNNFa7Uhf
   lTjAMeeCP4yA65UgIoDAtHAV/SRGGLORwnP5gRSWhNcjCqaaatu/yo5nj
   Y+qvoaQ8n7JVZRhP6Nbi/M1NEMdPD1d44A/0l37hJmCCLj5pw2fcbCdrk
   UfDKxGOaWACqvCyVq1S3qnJSiEpJ1JcDgeD5++o417KnOopdP0n9F7jh1
   NZG9zybVf2SYYa1/VgC1iGMQ3EA52i8GZVDTo03RjTzPoOO6NHJ3fT7sJ
   6XViTbhLF9KHaNQiSuDaG1Pd+X+jrUaHG1k9hQeOwfTPjUEW2OjrAuMpO
   w==;
X-CSE-ConnectionGUID: mX/CzZBYQZuyyUYUf/7Lbw==
X-CSE-MsgGUID: H7b5oqapRwOu8liyFJ18LA==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="11643227"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="11643227"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2024 21:53:28 -0700
X-CSE-ConnectionGUID: gGMFzj21SC2sGIZgLHtbmg==
X-CSE-MsgGUID: 39DX34MqRxqvgjQsFdCclQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="19786871"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Apr 2024 21:53:25 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rth0V-0004yM-25;
	Mon, 08 Apr 2024 04:53:23 +0000
Date: Mon, 8 Apr 2024 12:53:19 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [linux-next:master 3442/4242] WARNING: modpost: vmlinux: section
 mismatch in reference: (unknown)+0x1270 (section: __ex_table) -> .LASF0
 (section: .debug_str)
Message-ID: <202404081248.FE1RbA1V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8568bb2ccc278f344e6ac44af6ed010a90aa88dc
commit: e79da3a55e4e7b60b2790b3402a1a6c19829e9ce [3442/4242] mm/gup: merge pXd huge mapping checks
config: riscv-buildonly-randconfig-r001-20230517 (https://download.01.org/0day-ci/archive/20240408/202404081248.FE1RbA1V-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240408/202404081248.FE1RbA1V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404081248.FE1RbA1V-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: mchp_tc_count_action_read+0x2a (section: .text) -> .L2051 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mchp_tc_count_action_read+0x34 (section: .text) -> .L2051 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mchp_tc_count_action_read+0x58 (section: .text) -> .L2051 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mchp_tc_count_action_read+0x60 (section: .text) -> .L2052 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mchp_tc_count_signal_read+0x44 (section: .text) -> .L2053 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mchp_tc_count_signal_read+0x4a (section: .text) -> .L2054 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mchp_tc_count_function_write+0x5c (section: .text) -> .L2055 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mchp_tc_count_function_write+0x62 (section: .text) -> .L2056 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mchp_tc_count_function_write+0x80 (section: .text) -> page_alloc_sysctl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: master_info+0x1c (section: .text) -> kmem_cache_init_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snd_ctl_apply_vmaster_followers+0x22 (section: .text) -> slab_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snd_ctl_apply_vmaster_followers+0x2a (section: .text) -> slab_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snd_ctl_apply_vmaster_followers+0x36 (section: .text) -> slab_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snd_ctl_apply_vmaster_followers+0x3c (section: .text) -> kmem_cache_init_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snd_pcm_hw_limit_rates+0xa6 (section: .text) -> setup_numabalancing (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snd_pcm_rate_to_rate_bit+0x18 (section: .text) -> setup_numabalancing (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_eld_sad+0x18 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_eld_sad+0x26 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_eld_sad+0x30 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: map_rate_families+0xe (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: map_rate_families+0x16 (section: .text) -> sparse_buffer_fini (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sad_rate_mask+0x44 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snd_pcm_hw_constraint_eld+0xa (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snd_pcm_hw_constraint_eld+0x18 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snd_pcm_hw_constraint_eld+0x32 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snd_pcm_hw_constraint_eld+0x3a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: eld_limit_rates+0x40 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: eld_limit_rates+0x60 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: eld_limit_rates+0x72 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: eld_limit_channels+0x5c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: eld_limit_channels+0xda (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: eld_limit_channels+0xec (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: loopback_notify_put+0x84 (section: .text) -> kmemleak_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: loopback_notify_put+0x8a (section: .text) -> phys_align_check.constprop.0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: loopback_notify_put+0xa2 (section: .text) -> .LVL1052 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: loopback_notify_get+0x30 (section: .text) -> .LVL1053 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: loopback_notify_get+0x4a (section: .text) -> .LVL1054 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: loopback_rate_shift_put+0x24 (section: .text) -> .LVL1055 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: loopback_rate_shift_put+0x30 (section: .text) -> .LVL1056 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: loopback_rate_shift_put+0x4c (section: .text) -> .LVL1057 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ak4613_dai_trigger+0x8 (section: .text) -> inotify_user_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ak4613_dai_trigger+0xe (section: .text) -> inotify_user_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_mic_bias_1_event+0x18 (section: .text) -> proc_softirqs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_mic_bias_1_event+0x36 (section: .text) -> proc_self_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_hp_event+0x32 (section: .text) -> proc_self_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_hp_event+0x42 (section: .text) -> proc_softirqs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_hp_event+0x4e (section: .text) -> proc_softirqs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dmic_clock_control+0x5a (section: .text) -> kernfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dmic_clock_control+0x64 (section: .text) -> kernfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8824_output_dac_event+0x12 (section: .text) -> sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8824_output_dac_event+0x1a (section: .text) -> .LBB521 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8824_output_dac_event+0x1e (section: .text) -> .LBB523 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8824_output_dac_event+0x34 (section: .text) -> .LBB521 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8824_spk_event+0x1a (section: .text) -> .LVL205 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8824_spk_event+0x1e (section: .text) -> .LBB527 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8824_spk_event+0x34 (section: .text) -> .LVL205 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8824_spk_event+0x38 (section: .text) -> .LBE527 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8824_set_pll+0x60 (section: .text) -> .LBB528 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8824_set_pll+0x90 (section: .text) -> .LVL208 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8824_set_pll+0xaa (section: .text) -> .LVL210 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8824_set_pll+0xb2 (section: .text) -> .LVL202 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8824_set_pll+0xb6 (section: .text) -> .LVL203 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8824_set_pll+0xde (section: .text) -> .LVL203 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8824_set_pll+0x142 (section: .text) -> .LVL203 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uni_player_stop+0x2c (section: .text) -> exit_nilfs_fs (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: uni_player_stop+0x42 (section: .text) -> exit_nilfs_fs (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: uni_player_trigger+0x10 (section: .text) -> exit_nilfs_fs (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: uni_player_trigger+0x16 (section: .text) -> init_nilfs_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uni_player_trigger+0x1a (section: .text) -> init_nilfs_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: parse_option_str+0x56 (section: .text) -> btrfs_init_cachep (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nti_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nti_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ortek_driver_exit+0x8 (section: .exit.text) -> .L194 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ortek_driver_exit+0xc (section: .exit.text) -> .L194 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pl_driver_exit+0x8 (section: .exit.text) -> .LBB731 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pl_driver_exit+0xc (section: .exit.text) -> .LBB731 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hidled_driver_exit+0x8 (section: .exit.text) -> sbi_system_suspend_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hidled_driver_exit+0xc (section: .exit.text) -> sbi_system_suspend_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: goldfish_pipe_driver_exit+0x8 (section: .exit.text) -> .LVL5837 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: goldfish_pipe_driver_exit+0xc (section: .exit.text) -> .LVL5837 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdq_drv_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdq_drv_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_adc_driver_exit+0x8 (section: .exit.text) -> tasks_cblist_init_generic (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_adc_driver_exit+0xc (section: .exit.text) -> tasks_cblist_init_generic (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_dac_driver_exit+0x8 (section: .exit.text) -> .LBB236 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_dac_driver_exit+0xc (section: .exit.text) -> .LBB236 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: isl29125_driver_exit+0x8 (section: .exit.text) -> set_trace_boot_options (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: isl29125_driver_exit+0xc (section: .exit.text) -> set_trace_boot_options (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nvmem_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nvmem_exit+0x14 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1258 (section: __ex_table) -> .LC59 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x1258 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1260 (section: __ex_table) -> .LASF3592 (section: .debug_str)
ERROR: modpost: __ex_table+0x1260 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1264 (section: __ex_table) -> .LC59 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x1264 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x126c (section: __ex_table) -> .Ldebug_ranges0 (section: .debug_ranges)
ERROR: modpost: __ex_table+0x126c references non-executable section '.debug_ranges'
>> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1270 (section: __ex_table) -> .LASF0 (section: .debug_str)
ERROR: modpost: __ex_table+0x1270 references non-executable section '.debug_str'
>> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1278 (section: __ex_table) -> .LASF2 (section: .debug_str)
ERROR: modpost: __ex_table+0x1278 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x127c (section: __ex_table) -> .LASF0 (section: .debug_str)
ERROR: modpost: __ex_table+0x127c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1284 (section: __ex_table) -> .LASF6 (section: .debug_str)
ERROR: modpost: __ex_table+0x1284 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1288 (section: __ex_table) -> .LASF7 (section: .debug_str)
ERROR: modpost: __ex_table+0x1288 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1290 (section: __ex_table) -> .LASF9 (section: .debug_str)
ERROR: modpost: __ex_table+0x1290 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1294 (section: __ex_table) -> .LASF11 (section: .debug_str)
ERROR: modpost: __ex_table+0x1294 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x129c (section: __ex_table) -> .LASF13 (section: .debug_str)
ERROR: modpost: __ex_table+0x129c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x12a0 (section: __ex_table) -> .LASF15 (section: .debug_str)
ERROR: modpost: __ex_table+0x12a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x12a8 (section: __ex_table) -> .LASF17 (section: .debug_str)
ERROR: modpost: __ex_table+0x12a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x12ac (section: __ex_table) -> .LASF19 (section: .debug_str)
ERROR: modpost: __ex_table+0x12ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x12b4 (section: __ex_table) -> .LASF21 (section: .debug_str)
ERROR: modpost: __ex_table+0x12b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x12b8 (section: __ex_table) -> .LASF23 (section: .debug_str)
ERROR: modpost: __ex_table+0x12b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x12c0 (section: __ex_table) -> .LASF25 (section: .debug_str)
ERROR: modpost: __ex_table+0x12c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x12c4 (section: __ex_table) -> .LASF23 (section: .debug_str)
ERROR: modpost: __ex_table+0x12c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x12cc (section: __ex_table) -> .LASF28 (section: .debug_str)
ERROR: modpost: __ex_table+0x12cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x12d0 (section: __ex_table) -> .LASF30 (section: .debug_str)
ERROR: modpost: __ex_table+0x12d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x12d8 (section: __ex_table) -> .LASF32 (section: .debug_str)
ERROR: modpost: __ex_table+0x12d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x12dc (section: __ex_table) -> .LASF34 (section: .debug_str)
ERROR: modpost: __ex_table+0x12dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x12e4 (section: __ex_table) -> .LASF36 (section: .debug_str)
ERROR: modpost: __ex_table+0x12e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x12e8 (section: __ex_table) -> .LASF38 (section: .debug_str)
ERROR: modpost: __ex_table+0x12e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x12f0 (section: __ex_table) -> .LASF40 (section: .debug_str)
ERROR: modpost: __ex_table+0x12f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x12f4 (section: __ex_table) -> .LASF42 (section: .debug_str)
ERROR: modpost: __ex_table+0x12f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x12fc (section: __ex_table) -> .LASF44 (section: .debug_str)
ERROR: modpost: __ex_table+0x12fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1300 (section: __ex_table) -> .LASF46 (section: .debug_str)
ERROR: modpost: __ex_table+0x1300 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1308 (section: __ex_table) -> .LASF48 (section: .debug_str)
ERROR: modpost: __ex_table+0x1308 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x130c (section: __ex_table) -> .LASF50 (section: .debug_str)
ERROR: modpost: __ex_table+0x130c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1314 (section: __ex_table) -> .LASF52 (section: .debug_str)
ERROR: modpost: __ex_table+0x1314 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1318 (section: __ex_table) -> .LASF50 (section: .debug_str)
ERROR: modpost: __ex_table+0x1318 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1320 (section: __ex_table) -> .LASF56 (section: .debug_str)
ERROR: modpost: __ex_table+0x1320 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1324 (section: __ex_table) -> .LASF59 (section: .debug_str)
ERROR: modpost: __ex_table+0x1324 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x132c (section: __ex_table) -> .LASF58 (section: .debug_str)
ERROR: modpost: __ex_table+0x132c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1330 (section: __ex_table) -> .LASF59 (section: .debug_str)
ERROR: modpost: __ex_table+0x1330 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1338 (section: __ex_table) -> .LASF62 (section: .debug_str)
ERROR: modpost: __ex_table+0x1338 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x133c (section: __ex_table) -> .LASF75 (section: .debug_str)
ERROR: modpost: __ex_table+0x133c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1344 (section: __ex_table) -> .LASF65 (section: .debug_str)
ERROR: modpost: __ex_table+0x1344 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1348 (section: __ex_table) -> .LASF75 (section: .debug_str)
ERROR: modpost: __ex_table+0x1348 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1350 (section: __ex_table) -> .LASF68 (section: .debug_str)
ERROR: modpost: __ex_table+0x1350 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1354 (section: __ex_table) -> .LASF70 (section: .debug_str)
ERROR: modpost: __ex_table+0x1354 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x135c (section: __ex_table) -> .LASF72 (section: .debug_str)
ERROR: modpost: __ex_table+0x135c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1360 (section: __ex_table) -> .LASF74 (section: .debug_str)
ERROR: modpost: __ex_table+0x1360 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1368 (section: __ex_table) -> .LASF77 (section: .debug_str)
ERROR: modpost: __ex_table+0x1368 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x136c (section: __ex_table) -> .LASF74 (section: .debug_str)
ERROR: modpost: __ex_table+0x136c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1374 (section: __ex_table) -> .LASF80 (section: .debug_str)
ERROR: modpost: __ex_table+0x1374 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1378 (section: __ex_table) -> .LASF82 (section: .debug_str)
ERROR: modpost: __ex_table+0x1378 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1380 (section: __ex_table) -> .LASF84 (section: .debug_str)
ERROR: modpost: __ex_table+0x1380 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1384 (section: __ex_table) -> .LASF82 (section: .debug_str)
ERROR: modpost: __ex_table+0x1384 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x138c (section: __ex_table) -> .LASF87 (section: .debug_str)
ERROR: modpost: __ex_table+0x138c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1390 (section: __ex_table) -> .LASF89 (section: .debug_str)
ERROR: modpost: __ex_table+0x1390 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1398 (section: __ex_table) -> .LASF667 (section: .debug_str)
ERROR: modpost: __ex_table+0x1398 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x139c (section: __ex_table) -> .LASF669 (section: .debug_str)
ERROR: modpost: __ex_table+0x139c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x13a4 (section: __ex_table) -> .LASF671 (section: .debug_str)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
