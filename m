Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E693FE2E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 20:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709410322; cv=none; b=Zv/Kst1hq9Gnsrolee3WgpasEIhmWavRl16d9C3TCcZAHSdDZS3oGeT737pVIYO7i907tmaRvroy0zrcpAsYsm7M9YWUAps/oBl9CIw865drBV7AyvgTMr0C836DB55b9/VS1GU8pqHOrnwic08ewl7I0EExYEqA2lCdAogoYYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709410322; c=relaxed/simple;
	bh=yOZfqIG18s9v8a6qqAQeq1QYdLCUJa4UtLVvXekQicA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C/sv1bCzhZ29LYvU0CzI/uP0OOCSgODrnITfKz5amXC07AHYSFtO83H4TVc81KgtnQhjWqX0ySyvdZ20fe5c7WqqoYexWjQMlvPlyhgmg4QQuxoPvekbMpN1qfyxqOHfuvj3kUyF61wqQgFepNVW0oZ0/9AnQlUD/iF+jgkenWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JuSiBbMR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JuSiBbMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709410320; x=1740946320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yOZfqIG18s9v8a6qqAQeq1QYdLCUJa4UtLVvXekQicA=;
  b=JuSiBbMRNklJFbK5ro9b9X2134PDlfDdt0I9T3SUgDZyL8yFdZxXrxEG
   DZ9HMKpsRTWjXPBzNRhMyR7pLZHNyVJfUaWlpxm025cFg4qSma6GFwrVJ
   qe6Xag0Gm06JSEeD3HQsGC6wp8Yo3p2IMvZ0cLjjVIrgbhQIZQBEYs+TB
   qkpGscNIOsyEembnhtuFrvPrD3vgGl4jTKxF3FCdZPASFPj/3jhP2lMXo
   pAG9XvSLn6dX0NgJCsBMSJRTUZCFXUmEc3YXjavVKlj+3/3EkKIMdog0U
   CW00mfdLMbnSLEwCuiTt4T9lk3DZkHgtTdVoX9TciB2LlWt5OevCxihSW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="7754558"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="7754558"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 12:11:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="39551500"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Mar 2024 12:11:58 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgVi7-0000HI-34;
	Sat, 02 Mar 2024 20:11:55 +0000
Date: Sun, 3 Mar 2024 04:11:42 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 257/27938]
 sound/soc/sof/intel/pci-tng.c:155:27: error: 'intel_ipc_msg_data' undeclared
 here (not in a function); did you mean 'sof_ipc_msg_data'?
Message-ID: <202403030441.iaO6tKtC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   d761b18f6bc83bce94251467e3c0974243318456
commit: 51b86bcaf08f3cd48122cdbee63e8f469dcb3e64 [257/27938] LF-3774-1 ASoC: sof: Make Intel IPC stream ops generic
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240303/202403030441.iaO6tKtC-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403030441.iaO6tKtC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403030441.iaO6tKtC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sof/intel/pci-tng.c:155:27: error: 'intel_ipc_msg_data' undeclared here (not in a function); did you mean 'sof_ipc_msg_data'?
     155 |         .ipc_msg_data   = intel_ipc_msg_data,
         |                           ^~~~~~~~~~~~~~~~~~
         |                           sof_ipc_msg_data
>> sound/soc/sof/intel/pci-tng.c:156:27: error: 'intel_ipc_pcm_params' undeclared here (not in a function); did you mean 'sof_ipc_pcm_params'?
     156 |         .ipc_pcm_params = intel_ipc_pcm_params,
         |                           ^~~~~~~~~~~~~~~~~~~~
         |                           sof_ipc_pcm_params
>> sound/soc/sof/intel/pci-tng.c:170:27: error: 'intel_pcm_open' undeclared here (not in a function)
     170 |         .pcm_open       = intel_pcm_open,
         |                           ^~~~~~~~~~~~~~
>> sound/soc/sof/intel/pci-tng.c:171:27: error: 'intel_pcm_close' undeclared here (not in a function)
     171 |         .pcm_close      = intel_pcm_close,
         |                           ^~~~~~~~~~~~~~~


vim +155 sound/soc/sof/intel/pci-tng.c

47fad2393b0446 Pierre-Louis Bossart 2021-05-05  126  
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  127  const struct snd_sof_dsp_ops sof_tng_ops = {
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  128  	/* device init */
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  129  	.probe		= tangier_pci_probe,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  130  
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  131  	/* DSP core boot / reset */
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  132  	.run		= atom_run,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  133  	.reset		= atom_reset,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  134  
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  135  	/* Register IO */
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  136  	.write		= sof_io_write,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  137  	.read		= sof_io_read,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  138  	.write64	= sof_io_write64,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  139  	.read64		= sof_io_read64,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  140  
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  141  	/* Block IO */
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  142  	.block_read	= sof_block_read,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  143  	.block_write	= sof_block_write,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  144  
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  145  	/* doorbell */
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  146  	.irq_handler	= atom_irq_handler,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  147  	.irq_thread	= atom_irq_thread,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  148  
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  149  	/* ipc */
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  150  	.send_msg	= atom_send_msg,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  151  	.fw_ready	= sof_fw_ready,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  152  	.get_mailbox_offset = atom_get_mailbox_offset,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  153  	.get_window_offset = atom_get_window_offset,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  154  
47fad2393b0446 Pierre-Louis Bossart 2021-05-05 @155  	.ipc_msg_data	= intel_ipc_msg_data,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05 @156  	.ipc_pcm_params	= intel_ipc_pcm_params,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  157  
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  158  	/* machine driver */
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  159  	.machine_select = atom_machine_select,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  160  	.machine_register = sof_machine_register,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  161  	.machine_unregister = sof_machine_unregister,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  162  	.set_mach_params = atom_set_mach_params,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  163  
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  164  	/* debug */
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  165  	.debug_map	= tng_debugfs,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  166  	.debug_map_count	= ARRAY_SIZE(tng_debugfs),
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  167  	.dbg_dump	= atom_dump,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  168  
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  169  	/* stream callbacks */
47fad2393b0446 Pierre-Louis Bossart 2021-05-05 @170  	.pcm_open	= intel_pcm_open,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05 @171  	.pcm_close	= intel_pcm_close,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  172  
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  173  	/* module loading */
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  174  	.load_module	= snd_sof_parse_module_memcpy,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  175  
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  176  	/*Firmware loading */
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  177  	.load_firmware	= snd_sof_load_firmware_memcpy,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  178  
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  179  	/* DAI drivers */
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  180  	.drv = atom_dai,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  181  	.num_drv = 3, /* we have only 3 SSPs on byt*/
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  182  
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  183  	/* ALSA HW info flags */
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  184  	.hw_info =	SNDRV_PCM_INFO_MMAP |
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  185  			SNDRV_PCM_INFO_MMAP_VALID |
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  186  			SNDRV_PCM_INFO_INTERLEAVED |
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  187  			SNDRV_PCM_INFO_PAUSE |
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  188  			SNDRV_PCM_INFO_BATCH,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  189  
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  190  	.arch_ops = &sof_xtensa_arch_ops,
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  191  };
47fad2393b0446 Pierre-Louis Bossart 2021-05-05  192  

:::::: The code at line 155 was first introduced by commit
:::::: 47fad2393b0446229883f95e373067441794e22f ASoC: SOF: Intel: move common ATOM stuff to module

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
