Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D16C8DD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 09:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a96lUjQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705137760; x=1736673760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aRWI6C3+kIz/MYGKTFsuUJ1+vFgbJ86qze8y22Pah78=;
  b=a96lUjQhBl0tBjZ7jxJ8lPsIdJJDocDax1sbZwNUuZb8TfSx1IJ1bQCc
   eTRJkGsiOcVP/tJnxmqul8Xwx2mw2zcwUetr+GH+GQZh2Ke8jgzlAcc5B
   4IOX9EsMMKOz5BYVDRu6dM8zu1vLgYXJWjY+kShyELGCxYrkV4nZ7T5wh
   ljPG6CceYFHAFBDj5hJSaPWvLHNjbCz47sMwAC7rFdD/qCJj73dDikzA1
   2gfJhODF328aBUDZQoVvRf+Gaw/3fDPIpVHfnhRqP56mu5gkk5NnCm7De
   R6cN+j5fR9S+Vmr4GJOdHpL0a88rgXAJtFimCNOxqtE1cH6w1kLVDFiJ2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="463645323"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="463645323"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 01:22:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="759371398"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="759371398"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Jan 2024 01:22:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOaDs-000AJ2-2f;
	Sat, 13 Jan 2024 09:22:36 +0000
Date: Sat, 13 Jan 2024 17:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 183/17888]
 sound/soc/sof/intel/hda-common-ops.c:40:27: error: initialization of 'int
 (*)(struct snd_sof_dev *, struct snd_sof_pcm_stream *, void *, size_t)' {aka
 'int (*)(struct snd_sof_dev *, struct snd_sof_pcm_stream *, void *, long
 unsigned int)'} from incompatib...
Message-ID: <202401131755.4OeS18LB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   32a344619c750cdcbe31bed754adc1b30d362e45
commit: a5cbb6f360195a5df5a00c415160d0458ed7a0ca [183/17888] ASoC: SOF: Refactor ipc_msg_data to prepare for compress API
config: x86_64-randconfig-012-20240113 (https://download.01.org/0day-ci/archive/20240113/202401131755.4OeS18LB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131755.4OeS18LB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131755.4OeS18LB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sof/intel/hda-common-ops.c:40:27: error: initialization of 'int (*)(struct snd_sof_dev *, struct snd_sof_pcm_stream *, void *, size_t)' {aka 'int (*)(struct snd_sof_dev *, struct snd_sof_pcm_stream *, void *, long unsigned int)'} from incompatible pointer type 'int (*)(struct snd_sof_dev *, struct snd_pcm_substream *, void *, size_t)' {aka 'int (*)(struct snd_sof_dev *, struct snd_pcm_substream *, void *, long unsigned int)'} [-Werror=incompatible-pointer-types]
      40 |         .ipc_msg_data   = hda_ipc_msg_data,
         |                           ^~~~~~~~~~~~~~~~
   sound/soc/sof/intel/hda-common-ops.c:40:27: note: (near initialization for 'sof_hda_common_ops.ipc_msg_data')
   cc1: some warnings being treated as errors
--
>> sound/soc/sof/amd/acp-common.c:78:35: error: initialization of 'int (*)(struct snd_sof_dev *, struct snd_sof_pcm_stream *, void *, size_t)' {aka 'int (*)(struct snd_sof_dev *, struct snd_sof_pcm_stream *, void *, long unsigned int)'} from incompatible pointer type 'int (*)(struct snd_sof_dev *, struct snd_pcm_substream *, void *, size_t)' {aka 'int (*)(struct snd_sof_dev *, struct snd_pcm_substream *, void *, long unsigned int)'} [-Werror=incompatible-pointer-types]
      78 |         .ipc_msg_data           = acp_sof_ipc_msg_data,
         |                                   ^~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/amd/acp-common.c:78:35: note: (near initialization for 'sof_acp_common_ops.ipc_msg_data')
   cc1: some warnings being treated as errors


vim +40 sound/soc/sof/intel/hda-common-ops.c

37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  16  
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  17  struct snd_sof_dsp_ops sof_hda_common_ops = {
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  18  	/* probe/remove/shutdown */
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  19  	.probe		= hda_dsp_probe,
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  20  	.remove		= hda_dsp_remove,
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  21  
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  22  	/* Register IO */
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  23  	.write		= sof_io_write,
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  24  	.read		= sof_io_read,
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  25  	.write64	= sof_io_write64,
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  26  	.read64		= sof_io_read64,
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  27  
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  28  	/* Block IO */
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  29  	.block_read	= sof_block_read,
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  30  	.block_write	= sof_block_write,
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  31  
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  32  	/* Mailbox IO */
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  33  	.mailbox_read	= sof_mailbox_read,
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  34  	.mailbox_write	= sof_mailbox_write,
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  35  
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  36  	/* ipc */
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  37  	.get_mailbox_offset = hda_dsp_ipc_get_mailbox_offset,
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  38  	.get_window_offset = hda_dsp_ipc_get_window_offset,
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14  39  
37e809d5f8a7bf Pierre-Louis Bossart 2022-04-14 @40  	.ipc_msg_data	= hda_ipc_msg_data,

:::::: The code at line 40 was first introduced by commit
:::::: 37e809d5f8a7bfbf0abbd4666d0b8ad499f12b7f ASoC: SOF: Intel: hda: use common ops across platforms

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
