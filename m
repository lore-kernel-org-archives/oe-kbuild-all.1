Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76696134A5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 12:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689769123; x=1721305123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=stZf3wQVAP/1HyEyYJXt0nxeGoQJqRJ0ttWfs94/UQo=;
  b=Vy19+BqVy8Khob2harwtEFLSW3DTBtzbZktE45r0f6/hNdXqqGcu4LQx
   GX8aNTauo1Id21fIMFRsuOj2JJUvYjyAcL+estL55+jOef3Ty5D2ST2Dc
   lx7D6hjEOzgRfY3Yj8fToUybXnyX4Vv000jOKCnylMny47hGPsp0I5fpQ
   SiobGwcBcjHrK51POa87ynue78cWx1tL0tfd2Oi8tVFKwO5I4N7wtCw3H
   q/qcZZflC8fWm6NE943Vw69Pi3kLIxCz29E7SslCuxoKq1tHfmwaJTVtc
   WFQOnrh+sceBZJgX38/E+IBZtpSF5zMtRKAXA13v2wLq+Nroh9NLcfnhp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="370004225"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="370004225"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 05:18:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="848043724"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="848043724"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 19 Jul 2023 05:18:41 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM68f-0004mr-0H;
	Wed, 19 Jul 2023 12:18:41 +0000
Date: Wed, 19 Jul 2023 20:17:42 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/637 147/12466]
 sound/soc/fsl/fsl_esai_client.c:85:5: warning: no previous prototype for
 'fsl_esai_client_pcm_trigger'
Message-ID: <202307192020.7q2xPayU-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/637
head:   ec33c7fc43bef23fa0b69db996fee0ba601875e9
commit: 10939ef9325a5db437a8f49f7effef85c75604f1 [147/12466] MLK-24612-1: ASoC: fsl_esai: Add esai client driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230719/202307192020.7q2xPayU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307192020.7q2xPayU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307192020.7q2xPayU-lkp@intel.com/

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
