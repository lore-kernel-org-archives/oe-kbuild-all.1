Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413F2180
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 00:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678752656; x=1710288656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pif9g2Hy6tVnxIcY/bqY6k4qxAqJzvCqaLV9EEe7nl4=;
  b=Xz42eW39aPEyh4TDipCFOamcvYpBI3NQLYyEAzyl9cA2fqGuwXmiV+Jw
   9++dWsweXVaYzHawy69jtuUarM+7raSkxZqHrOeZ/0WX51bV4jgU4Dpr1
   HFmk4CAqPMV1ZI1k07VtEIFT1/phk6+3aISYwhL73mNnx4JLEMEe0BlRu
   PS5r0s+VmK3Ta6FRsElGxqDpZjcQsJ+hCHayPXxGvrQrLG90CjHMZUp2m
   Q7BmbwnSc9YFLABHbtNUX2T8Ac5oKgrFFoiTrrx/AB0KqYLiYtxQHzmGP
   SJ/7Gv6ExbwI9gRVNyf8MxzKP0HSbDc3YAJXkIDhhWFqqqBoWjp/ZSgPQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="321143957"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="321143957"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 17:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="767896138"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="767896138"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Mar 2023 17:10:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbsFh-0006H2-28;
	Tue, 14 Mar 2023 00:10:53 +0000
Date: Tue, 14 Mar 2023 08:10:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 52/91] sound/soc/ti/davinci-i2s.c:618:12:
 error: 'struct snd_soc_dai' has no member named 'playback_dma_data'
Message-ID: <202303140827.E1tEJUpu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   86a62a3b93d7da9a5a00f69791aeaa9ca040e5ba
commit: dc94c861974bb68c9d65dc5c77bdf58e062bfd62 [52/91] UPSTREAM: ASoC: soc-dai.h: cleanup Playback/Capture data for snd_soc_dai
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230314/202303140827.E1tEJUpu-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout dc94c861974bb68c9d65dc5c77bdf58e062bfd62
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash sound/soc/ti/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303140827.E1tEJUpu-lkp@intel.com/

Note: the chrome-os/chromeos-6.1 HEAD 86a62a3b93d7da9a5a00f69791aeaa9ca040e5ba builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   sound/soc/ti/davinci-i2s.c: In function 'davinci_i2s_dai_probe':
>> sound/soc/ti/davinci-i2s.c:618:12: error: 'struct snd_soc_dai' has no member named 'playback_dma_data'
     618 |         dai->playback_dma_data = &dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK];
         |            ^~
>> sound/soc/ti/davinci-i2s.c:619:12: error: 'struct snd_soc_dai' has no member named 'capture_dma_data'
     619 |         dai->capture_dma_data = &dev->dma_data[SNDRV_PCM_STREAM_CAPTURE];
         |            ^~
--
   sound/soc/ti/davinci-vcif.c: In function 'davinci_vcif_dai_probe':
>> sound/soc/ti/davinci-vcif.c:165:12: error: 'struct snd_soc_dai' has no member named 'playback_dma_data'
     165 |         dai->playback_dma_data = &dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK];
         |            ^~
>> sound/soc/ti/davinci-vcif.c:166:12: error: 'struct snd_soc_dai' has no member named 'capture_dma_data'
     166 |         dai->capture_dma_data = &dev->dma_data[SNDRV_PCM_STREAM_CAPTURE];
         |            ^~


vim +618 sound/soc/ti/davinci-i2s.c

5204d49676dae3 sound/soc/davinci/davinci-i2s.c Chaithrika U S 2009-06-05  613  
257ade78b6019c sound/soc/davinci/davinci-i2s.c Peter Ujfalusi 2015-03-03  614  static int davinci_i2s_dai_probe(struct snd_soc_dai *dai)
257ade78b6019c sound/soc/davinci/davinci-i2s.c Peter Ujfalusi 2015-03-03  615  {
257ade78b6019c sound/soc/davinci/davinci-i2s.c Peter Ujfalusi 2015-03-03  616  	struct davinci_mcbsp_dev *dev = snd_soc_dai_get_drvdata(dai);
257ade78b6019c sound/soc/davinci/davinci-i2s.c Peter Ujfalusi 2015-03-03  617  
257ade78b6019c sound/soc/davinci/davinci-i2s.c Peter Ujfalusi 2015-03-03 @618  	dai->playback_dma_data = &dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK];
257ade78b6019c sound/soc/davinci/davinci-i2s.c Peter Ujfalusi 2015-03-03 @619  	dai->capture_dma_data = &dev->dma_data[SNDRV_PCM_STREAM_CAPTURE];
257ade78b6019c sound/soc/davinci/davinci-i2s.c Peter Ujfalusi 2015-03-03  620  
257ade78b6019c sound/soc/davinci/davinci-i2s.c Peter Ujfalusi 2015-03-03  621  	return 0;
257ade78b6019c sound/soc/davinci/davinci-i2s.c Peter Ujfalusi 2015-03-03  622  }
257ade78b6019c sound/soc/davinci/davinci-i2s.c Peter Ujfalusi 2015-03-03  623  

:::::: The code at line 618 was first introduced by commit
:::::: 257ade78b6019cf1570c1239894a7a6a549768e1 ASoC: davinci-i2s: Convert to use edma-pcm

:::::: TO: Peter Ujfalusi <peter.ujfalusi@ti.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
