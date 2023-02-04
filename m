Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE52023A9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 14:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675520027; x=1707056027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=soD1SAGS4pMGPYMPCMzP4mVHMVARDwCLTFCXv1W6mTI=;
  b=KTgPWBA9uId+jGGyODz3t1SI4XAWd0oVgQ+6gx/gwGDpvn7xXlW9xlA/
   skl3UAGrAVbKFUKoKhx7a94BbAEQoecX6f6dFoNPRaRfyhohUyIyb/UmC
   GO7/B0jBPA3wZmDJdhdJIqNoE9wSV4CZThPFazbUIlVXoH+K5e/rCJhbR
   XHIXFuQOVkivg6NAINDMAxe8nd6hFRWVi1RwmSCVE1100YMMNg6XZLTKS
   5Fy6zj5avk+s9Tn/M0JGoaEsPOC3UGcFiLBM8jkaq3rz4Wzdm6OnGXFA0
   Ceg30z81TV6fDMa4ZVcmgUS6m7pP9CXAsDsK3d2Dye4POc4fu12BXD3dH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="393541928"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="393541928"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 06:13:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="666028844"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="666028844"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Feb 2023 06:13:46 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOJIX-0001LY-0g;
	Sat, 04 Feb 2023 14:13:45 +0000
Date: Sat, 4 Feb 2023 22:13:14 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 178/20209]
 sound/soc/fsl/fsl_esai_client.c:85:5: warning: no previous prototype for
 'fsl_esai_client_pcm_trigger'
Message-ID: <202302042240.d6i0xqRG-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: c03a789d0a2388b61aeabe8b5bad7935e2951497 [178/20209] MLK-24612-1: ASoC: fsl_esai: Add esai client driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230204/202302042240.d6i0xqRG-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/c03a789d0a2388b61aeabe8b5bad7935e2951497
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout c03a789d0a2388b61aeabe8b5bad7935e2951497
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/accessibility/speakup/ drivers/base/power/ drivers/dma/ drivers/firmware/imx/ drivers/gpu/drm/bridge/ drivers/gpu/drm/imx/ drivers/i2c/busses/ drivers/input/touchscreen/ drivers/mailbox/ drivers/media/platform/ drivers/mtd/nand/raw/gpmi-nand/ drivers/net/ethernet/freescale/ drivers/net/phy/ drivers/pci/controller/dwc/ drivers/pci/controller/mobiveil/ drivers/power/supply/ drivers/pwm/ drivers/regulator/ drivers/rpmsg/ drivers/soc/imx/ drivers/staging/ drivers/thermal/ drivers/video/backlight/ drivers/video/fbdev/ net/ sound/soc/fsl/ sound/soc/sof/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
https://github.com/intel/lkp-tests
