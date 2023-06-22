Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799FC1F16B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 14:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687445118; x=1718981118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gu5I/UqN/1Fh05HmaBCZCgFuM9xn/+cMUX3DaW2Ug1Y=;
  b=PLo9DXHi8YRz61jNdqMK1JH6aIe+Kikvy9MZnmXdYydGz5m8V1Lna/yC
   kr7u+sduNAVUeo2r48hxQ9K8aB3sP5S6lgF6MG2/AhicDLEZFW+T7XRo+
   bykyC7q9AFcbvQ7WPoH9NenxCoq3ep3SGXV304tUQIl5d+B493Toj5AzR
   FFqIqZYUlQAl/S9p6eKKdaGpatubRPNvYaNSBo7GnF/X/VMUKBPhE9uBK
   ZrbHF4iWmFCwL2sHKhGt0qi9ib0bjhKPQZ4G8s5LhFmk8iV+l/r1zu43E
   SP+BLq2EDNKCpD9j+aErNTK80PF2YoDhy64Eg2BM/3mwUiDuqT6zeNdwZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="345256229"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="345256229"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 07:29:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="718095976"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="718095976"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Jun 2023 07:29:42 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCLJd-0007d1-0c;
	Thu, 22 Jun 2023 14:29:41 +0000
Date: Thu, 22 Jun 2023 22:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 147/9881]
 sound/soc/fsl/fsl_esai_client.c:85:5: warning: no previous prototype for
 'fsl_esai_client_pcm_trigger'
Message-ID: <202306222251.k8cCtrbG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   3260d1af47b1bedfe12b79a26efa184b9a60a8a3
commit: 10939ef9325a5db437a8f49f7effef85c75604f1 [147/9881] MLK-24612-1: ASoC: fsl_esai: Add esai client driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230622/202306222251.k8cCtrbG-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306222251.k8cCtrbG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306222251.k8cCtrbG-lkp@intel.com/

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
