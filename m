Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D37C10E3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 01:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693532418; x=1725068418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=54cRa81zVpVhmKc98hS8uGvxoKUY2W8dSMWQQbbP/aM=;
  b=FHyt6d8YbjIf7elLqihFSB+Gwc6p6tUdR8IslY6kAEDwaTw7SFJjir45
   z0evU7t/77ckZZsp0oMc4Ag6X0bkbTFmMSYEhR6+ACXeCH5kkJLdtZuB6
   1s/eBAXsW5VXZ+Czy6BbfT/K2LNRnJ1QVlLF63pkyfNk65KBJ9EBX1kNm
   YdH80rJ4tf0f69KY0K9cQ7jNqBqj4CsuJzy5zfB2NW4MW/llG3yDeeh9a
   uqnD19uaNRN4XnhYi3ceoNLiLr4EfK47ID+W/1/W3/6xH4YrWDbVeWtPr
   GQlPTI8R0rV9mWimG6PNlVsVjkdbS+z5y3wuRglG8V1BqJgongFyGVhxS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="379897068"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="379897068"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 18:40:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="809884015"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="809884015"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 Aug 2023 18:40:15 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbt8v-0000jy-0l;
	Fri, 01 Sep 2023 01:40:13 +0000
Date: Fri, 1 Sep 2023 09:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 178/24603]
 sound/soc/fsl/fsl_esai_client.c:85:5: warning: no previous prototype for
 'fsl_esai_client_pcm_trigger'
Message-ID: <202309010934.tlLILvnI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shengjiu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: c03a789d0a2388b61aeabe8b5bad7935e2951497 [178/24603] MLK-24612-1: ASoC: fsl_esai: Add esai client driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230901/202309010934.tlLILvnI-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010934.tlLILvnI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010934.tlLILvnI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/fsl/fsl_esai_client.c:85:5: warning: no previous prototype for 'fsl_esai_client_pcm_trigger' [-Wmissing-prototypes]
      85 | int fsl_esai_client_pcm_trigger(struct snd_soc_component *component,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/fsl_esai_client_pcm_trigger +85 sound/soc/fsl/fsl_esai_client.c

    84	
  > 85	int fsl_esai_client_pcm_trigger(struct snd_soc_component *component,
    86					struct snd_pcm_substream *substream, int cmd)
    87	{
    88		struct snd_soc_pcm_runtime *rtd = substream->private_data;
    89		struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
    90		struct fsl_esai_client *client = snd_soc_dai_get_drvdata(cpu_dai);
    91		bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
    92	
    93		switch (cmd) {
    94		case SNDRV_PCM_TRIGGER_START:
    95		case SNDRV_PCM_TRIGGER_RESUME:
    96		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
    97			/* These info are needed by esai mix*/
    98			client->dma[tx].buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
    99			client->dma[tx].period_bytes = snd_pcm_lib_period_bytes(substream);
   100			client->dma[tx].buffer_offset = 0;
   101			client->dma[tx].active = true;
   102			break;
   103		case SNDRV_PCM_TRIGGER_SUSPEND:
   104		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
   105		case SNDRV_PCM_TRIGGER_STOP:
   106			client->dma[tx].active = false;
   107			break;
   108		default:
   109			return -EINVAL;
   110		}
   111	
   112		return 0;
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
