Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC8E171A7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 14:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685110060; x=1716646060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rY4SJuM6sU/+Guw4BAMT3TFiP2XcN1ag/ZRnmBIRbxo=;
  b=EQNR6LJA1hdgRhjANj2Y8XOm+dzKGulwXHGZmIzRz0FFfWZMgFhrQbhR
   HOb2oRTgteKiNIVtMcsxJJBYJtoIZEPXjy9aVTfeGtJGmKOq22Dg9lS8o
   AXu4kTctBx2EY+hVErzQDn3zurQ/ItjXbqHTf8k9gkxHyVDankyUI7uDd
   AWjtGtI2l6p4NR1WdYeql8XYHXdTCawb5a92i7We3KjGgrCTFUxLtO0mj
   8tEFiO7AXXVCMNuwrg3S5hbtBRXMe/CePf9rJFmaONAf5m08VF5t7bri+
   G9nS4iVGk1RVQGM+ECpfR+ptXvm1uGiljoX9VrPy52Z6nm2sVW1A3qAjP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="419965252"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="419965252"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 07:07:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="879560638"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="879560638"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 May 2023 07:07:34 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2Y6P-000JOS-19;
	Fri, 26 May 2023 14:07:33 +0000
Date: Fri, 26 May 2023 22:07:26 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 183/9879]
 sound/soc/sof/amd/acp-common.c:78:19: error: incompatible function pointer
 types initializing 'int (*)(struct snd_sof_dev *, struct snd_sof_pcm_stream
 *, void *, size_t)' (aka 'int (*)(struct snd_sof_dev *, struct
 snd_sof_pcm_stream *, void *, unsigned in...
Message-ID: <202305262223.FgLYTb6a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   ad9ab3b3c553cbc3c61f233b6e2cd5abdd2a624b
commit: a5cbb6f360195a5df5a00c415160d0458ed7a0ca [183/9879] ASoC: SOF: Refactor ipc_msg_data to prepare for compress API
config: arm-randconfig-r003-20230524 (https://download.01.org/0day-ci/archive/20230526/202305262223.FgLYTb6a-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/Freescale/linux-fslc/commit/a5cbb6f360195a5df5a00c415160d0458ed7a0ca
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout a5cbb6f360195a5df5a00c415160d0458ed7a0ca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/ drivers/ sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305262223.FgLYTb6a-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sof/amd/acp-common.c:78:19: error: incompatible function pointer types initializing 'int (*)(struct snd_sof_dev *, struct snd_sof_pcm_stream *, void *, size_t)' (aka 'int (*)(struct snd_sof_dev *, struct snd_sof_pcm_stream *, void *, unsigned int)') with an expression of type 'int (struct snd_sof_dev *, struct snd_pcm_substream *, void *, size_t)' (aka 'int (struct snd_sof_dev *, struct snd_pcm_substream *, void *, unsigned int)') [-Wincompatible-function-pointer-types]
           .ipc_msg_data           = acp_sof_ipc_msg_data,
                                     ^~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> sound/soc/sof/intel/hda-common-ops.c:40:18: error: incompatible function pointer types initializing 'int (*)(struct snd_sof_dev *, struct snd_sof_pcm_stream *, void *, size_t)' (aka 'int (*)(struct snd_sof_dev *, struct snd_sof_pcm_stream *, void *, unsigned int)') with an expression of type 'int (struct snd_sof_dev *, struct snd_pcm_substream *, void *, size_t)' (aka 'int (struct snd_sof_dev *, struct snd_pcm_substream *, void *, unsigned int)') [-Wincompatible-function-pointer-types]
           .ipc_msg_data   = hda_ipc_msg_data,
                             ^~~~~~~~~~~~~~~~
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
