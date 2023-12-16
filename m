Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EF131753
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 22:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMOWS57E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702767484; x=1734303484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jhF83hDtIEK6OHUcLYcb/ey3Dmm3DYC0qF1t+EJzmm0=;
  b=FMOWS57EOC67PQEd5+378kp99ma07hELBIobt4Q1maOR+xiOwZMneo5h
   CgQ9d0ql3A2oj1ZrBivcgUXZYYDemy7hW5BAeKPpfPJnTx4QqIIgRBrGr
   rN/KqY3Ty6kRLE8gTHbDvUD4he3OuDAYINChSCGlE/22SpWvvrP7XoFwB
   QeM8RD/21qpXI+RjM3B2cq10hwnRKqnrlUYcQyflB3LhCd2o8abCgOFoK
   edaCWFEnTGdFi1eIg39MszwVMGLnLteggghdwU4j61lNxcQF4acc85B9+
   Eqq5VaQAcBFU4lSD0fG2Y3+q4JwqZ3FDiBjMJ/NOqEm2UmHkmrTgVkI29
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="459717511"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="459717511"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 14:58:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="778668691"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="778668691"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 16 Dec 2023 14:58:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEdbc-0002JM-2p;
	Sat, 16 Dec 2023 22:58:00 +0000
Date: Sun, 17 Dec 2023 06:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 183/16025]
 sound/soc/sof/amd/acp-common.c:78:19: error: incompatible function pointer
 types initializing 'int (*)(struct snd_sof_dev *, struct snd_sof_pcm_stream
 *, void *, size_t)' (aka 'int (*)(struct snd_sof_dev *, struct
 snd_sof_pcm_stream *, void *, unsigned in...
Message-ID: <202312170625.7xMSiIpI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: a5cbb6f360195a5df5a00c415160d0458ed7a0ca [183/16025] ASoC: SOF: Refactor ipc_msg_data to prepare for compress API
config: i386-randconfig-003-20231217 (https://download.01.org/0day-ci/archive/20231217/202312170625.7xMSiIpI-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170625.7xMSiIpI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170625.7xMSiIpI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sof/amd/acp-common.c:78:19: error: incompatible function pointer types initializing 'int (*)(struct snd_sof_dev *, struct snd_sof_pcm_stream *, void *, size_t)' (aka 'int (*)(struct snd_sof_dev *, struct snd_sof_pcm_stream *, void *, unsigned int)') with an expression of type 'int (struct snd_sof_dev *, struct snd_pcm_substream *, void *, size_t)' (aka 'int (struct snd_sof_dev *, struct snd_pcm_substream *, void *, unsigned int)') [-Wincompatible-function-pointer-types]
           .ipc_msg_data           = acp_sof_ipc_msg_data,
                                     ^~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +78 sound/soc/sof/amd/acp-common.c

4da6b033f5454c Ajit Kumar Pandey    2022-09-13   53  
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   54  /* AMD Common DSP ops */
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   55  struct snd_sof_dsp_ops sof_acp_common_ops = {
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   56  	/* probe and remove */
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   57  	.probe			= amd_sof_acp_probe,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   58  	.remove			= amd_sof_acp_remove,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   59  
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   60  	/* Register IO */
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   61  	.write			= sof_io_write,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   62  	.read			= sof_io_read,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   63  
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   64  	/* Block IO */
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   65  	.block_read		= acp_dsp_block_read,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   66  	.block_write		= acp_dsp_block_write,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   67  
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   68  	/*Firmware loading */
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   69  	.load_firmware		= snd_sof_load_firmware_memcpy,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   70  	.pre_fw_run		= acp_dsp_pre_fw_run,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   71  	.get_bar_index		= acp_get_bar_index,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   72  
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   73  	/* DSP core boot */
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   74  	.run			= acp_sof_dsp_run,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   75  
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   76  	/*IPC */
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   77  	.send_msg		= acp_sof_ipc_send_msg,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13  @78  	.ipc_msg_data		= acp_sof_ipc_msg_data,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   79  	.get_mailbox_offset	= acp_sof_ipc_get_mailbox_offset,
40d3c041e2f871 V sujith kumar Reddy 2022-09-13   80  	.get_window_offset      = acp_sof_ipc_get_window_offset,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   81  	.irq_thread		= acp_sof_ipc_irq_thread,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   82  
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   83  	/* stream callbacks */
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   84  	.pcm_open		= acp_pcm_open,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   85  	.pcm_close		= acp_pcm_close,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   86  	.pcm_hw_params		= acp_pcm_hw_params,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   87  
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   88  	.hw_info		= SNDRV_PCM_INFO_MMAP |
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   89  				  SNDRV_PCM_INFO_MMAP_VALID |
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   90  				  SNDRV_PCM_INFO_INTERLEAVED |
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   91  				  SNDRV_PCM_INFO_PAUSE |
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   92  				  SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   93  
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   94  	/* Machine driver callbacks */
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   95  	.machine_select		= amd_sof_machine_select,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   96  	.machine_register	= sof_machine_register,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   97  	.machine_unregister	= sof_machine_unregister,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   98  
4da6b033f5454c Ajit Kumar Pandey    2022-09-13   99  	/* Trace Logger */
4da6b033f5454c Ajit Kumar Pandey    2022-09-13  100  	.trace_init		= acp_sof_trace_init,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13  101  	.trace_release		= acp_sof_trace_release,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13  102  
4da6b033f5454c Ajit Kumar Pandey    2022-09-13  103  	/* PM */
4da6b033f5454c Ajit Kumar Pandey    2022-09-13  104  	.suspend                = amd_sof_acp_suspend,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13  105  	.resume                 = amd_sof_acp_resume,
4da6b033f5454c Ajit Kumar Pandey    2022-09-13  106  };
4da6b033f5454c Ajit Kumar Pandey    2022-09-13  107  EXPORT_SYMBOL_NS(sof_acp_common_ops, SND_SOC_SOF_AMD_COMMON);
4da6b033f5454c Ajit Kumar Pandey    2022-09-13  108  

:::::: The code at line 78 was first introduced by commit
:::::: 4da6b033f5454ccbac2d5795d7edfb3f2a777104 ASoC: SOF: amd: Make ACP core code generic for newer SOC transition

:::::: TO: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
