Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E02217CA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 03:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZHfWdwv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705203752; x=1736739752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2FEgKu83dkOoAOSOOMiur+lPx6TvGZgYNSxlCTNNGr0=;
  b=iZHfWdwv6GDCvJBdWPM2gTlEoK8AD6EQrL9qP/GNa6M+0ll47Nnl5YN5
   JXnvngAe5MYpHcNXbz9cvaPqtvdiZjCULQXEnjZhcCoQ7uuMpnqoyn3Zf
   Fabf8Un0E/bG/GTpC4EstM/c5sGcEolRDB63gTiP/n7CudMRLISTFTl+/
   AHBRy/8FZSr78/lOgUnPiNhvEvLawwlNG7m9jOKZ5iITevtYCJCIeZDAW
   3/A3OM2MP+W6eRVM+9RtASF7PppeZTW58e5q+4WD+IkYYXpWWsJ5J1raF
   UdSDk0Svjv6CDCb6sPFIsWlx7UR9SUT4Vzmq7u69fGOgE6hg5KkgA95LK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="430598118"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="430598118"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 19:42:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="25123002"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 13 Jan 2024 19:42:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOrOF-000BAE-2T;
	Sun, 14 Jan 2024 03:42:27 +0000
Date: Sun, 14 Jan 2024 11:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 147/17888]
 sound/soc/fsl/fsl_esai_client.c:85:5: warning: no previous prototype for
 function 'fsl_esai_client_pcm_trigger'
Message-ID: <202401141124.dLKlwMrY-lkp@intel.com>
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
commit: 10939ef9325a5db437a8f49f7effef85c75604f1 [147/17888] MLK-24612-1: ASoC: fsl_esai: Add esai client driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240114/202401141124.dLKlwMrY-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401141124.dLKlwMrY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401141124.dLKlwMrY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/fsl/fsl_esai_client.c:85:5: warning: no previous prototype for function 'fsl_esai_client_pcm_trigger' [-Wmissing-prototypes]
      85 | int fsl_esai_client_pcm_trigger(struct snd_soc_component *component,
         |     ^
   sound/soc/fsl/fsl_esai_client.c:85:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      85 | int fsl_esai_client_pcm_trigger(struct snd_soc_component *component,
         | ^
         | static 
   1 warning generated.


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
