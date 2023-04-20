Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5F92F22
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 07:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681977157; x=1713513157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RL7mF0DM6LQKZIQEuQBeW+pewYUWijy4MdQXj8oC6Qg=;
  b=b/1EVPIxA28r+hqXmb23VBQAvA8CjpF0nIyDG8YCTP/AWFtrhMdgynGY
   CXOovrhdnKuT2CbtzMqdHFOrJPB09X8vj3QPfxamlw13ui4Q9RWKOwbi8
   Nj+2OO1roywHubQDGpnHFAodEKwGfilYIX1fJGOzsoLNGrecRjZSZ+MsQ
   U7n9yaNSvtOiktR66Ur9oX5qctJKmNPO0n1YZfdc3uRwTelY2DAKHlkKb
   yNCsAy/qy8yPomI4MYuiwqFyKgtziy0JQkYw8498H18VbB2ErDoY2p8KS
   Tb+ih15vBO3s2fPE0ADz/qI4qv/kWYLONfkFipKilYaiGShdtDNJk3MkK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="347527199"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="347527199"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 00:52:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="1021501293"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="1021501293"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Apr 2023 00:52:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppP5j-000fb4-0N;
	Thu, 20 Apr 2023 07:52:31 +0000
Date: Thu, 20 Apr 2023 15:51:41 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 183/9845]
 sound/soc/sof/intel/hda-common-ops.c:40:27: error: initialization of 'int
 (*)(struct snd_sof_dev *, struct snd_sof_pcm_stream *, void *, size_t)' {aka
 'int (*)(struct snd_sof_dev *, struct snd_sof_pcm_stream *, void *, long
 unsigned int)'} from incompatib...
Message-ID: <202304201520.BXtY5NPy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   897d73a656fe33d0c4549c5de1d07797f99d6871
commit: a5cbb6f360195a5df5a00c415160d0458ed7a0ca [183/9845] ASoC: SOF: Refactor ipc_msg_data to prepare for compress API
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230420/202304201520.BXtY5NPy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/a5cbb6f360195a5df5a00c415160d0458ed7a0ca
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout a5cbb6f360195a5df5a00c415160d0458ed7a0ca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/staging/ drivers/video/fbdev/ sound/soc/sof/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201520.BXtY5NPy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sof/intel/hda-common-ops.c:40:27: error: initialization of 'int (*)(struct snd_sof_dev *, struct snd_sof_pcm_stream *, void *, size_t)' {aka 'int (*)(struct snd_sof_dev *, struct snd_sof_pcm_stream *, void *, long unsigned int)'} from incompatible pointer type 'int (*)(struct snd_sof_dev *, struct snd_pcm_substream *, void *, size_t)' {aka 'int (*)(struct snd_sof_dev *, struct snd_pcm_substream *, void *, long unsigned int)'} [-Werror=incompatible-pointer-types]
      40 |         .ipc_msg_data   = hda_ipc_msg_data,
         |                           ^~~~~~~~~~~~~~~~
   sound/soc/sof/intel/hda-common-ops.c:40:27: note: (near initialization for 'sof_hda_common_ops.ipc_msg_data')
   cc1: some warnings being treated as errors


vim +40 sound/soc/sof/intel/hda-common-ops.c

37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  16  
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  17  struct snd_sof_dsp_ops sof_hda_common_ops = {
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  18  	/* probe/remove/shutdown */
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  19  	.probe		= hda_dsp_probe,
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  20  	.remove		= hda_dsp_remove,
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  21  
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  22  	/* Register IO */
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  23  	.write		= sof_io_write,
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  24  	.read		= sof_io_read,
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  25  	.write64	= sof_io_write64,
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  26  	.read64		= sof_io_read64,
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  27  
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  28  	/* Block IO */
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  29  	.block_read	= sof_block_read,
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  30  	.block_write	= sof_block_write,
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  31  
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  32  	/* Mailbox IO */
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  33  	.mailbox_read	= sof_mailbox_read,
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  34  	.mailbox_write	= sof_mailbox_write,
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  35  
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  36  	/* ipc */
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  37  	.get_mailbox_offset = hda_dsp_ipc_get_mailbox_offset,
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  38  	.get_window_offset = hda_dsp_ipc_get_window_offset,
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14  39  
37e809d5f8a7bfb Pierre-Louis Bossart 2022-04-14 @40  	.ipc_msg_data	= hda_ipc_msg_data,

:::::: The code at line 40 was first introduced by commit
:::::: 37e809d5f8a7bfbf0abbd4666d0b8ad499f12b7f ASoC: SOF: Intel: hda: use common ops across platforms

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
