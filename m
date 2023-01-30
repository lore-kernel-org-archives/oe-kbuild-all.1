Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C9E746A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 19:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675105339; x=1706641339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VBCGvap9wN5M1ShCkCChb/gK6rdZSAAU5RLpF7oX578=;
  b=OxASbZm5XrpzZvIPK+FjmLB5McXUsSuyKJ1/da2wYjU7AE8L4R75AJKZ
   qfp3EpXJyemEUpxCw4XT/9dxt1HH+VI1HdwF5W6IE2KptYeTjruzBJc7H
   F+nr+UaU0m8BoUwF7w4K3SiTpPWFma596NN0ppa+UAhXnijRgUlSNM5HX
   mIfzpYW/QCAzX/eon5Rb55eBUqr3UThENRgeIBYJ4JN9fym0+SzGStraO
   YYPZUHT3Fkc/JtcdhWLyoNybDU4B3CnfzjdOakdDt/PLOCQPWJHKN9iMf
   dW8SCH4kDOAl4IebztIvF/11vGKH/5KkXD4k6OOGRvTdIs8OKBuOTNQOM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="327666597"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="327666597"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 11:02:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="727602349"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="727602349"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 30 Jan 2023 11:02:17 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMZQ0-0003qA-28;
	Mon, 30 Jan 2023 19:02:16 +0000
Date: Tue, 31 Jan 2023 03:01:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [broonie-ci:v2_20230124_kuninori_morimoto_gx_asoc_use_helper_function_and_cleanup
 117/117] sound/soc/mediatek/mt8188/mt8188-dai-pcm.c:230:16: error: 'struct
 snd_soc_dai' has no member named 'playback_widget'
Message-ID: <202301310249.4CWR7qHF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v2_20230124_kuninori_morimoto_gx_asoc_use_helper_function_and_cleanup
head:   f32adf8d870ed0a7d39b88a261d01a7a1dcb023c
commit: f32adf8d870ed0a7d39b88a261d01a7a1dcb023c [117/117] ASoC: soc-dai.h: cleanup Playback/Capture data for snd_soc_dai
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230131/202301310249.4CWR7qHF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=f32adf8d870ed0a7d39b88a261d01a7a1dcb023c
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci v2_20230124_kuninori_morimoto_gx_asoc_use_helper_function_and_cleanup
        git checkout f32adf8d870ed0a7d39b88a261d01a7a1dcb023c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash sound/soc/mediatek/mt8188/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   sound/soc/mediatek/mt8188/mt8188-dai-pcm.c: In function 'mtk_dai_pcm_prepare':
>> sound/soc/mediatek/mt8188/mt8188-dai-pcm.c:230:16: error: 'struct snd_soc_dai' has no member named 'playback_widget'
     230 |         if (dai->playback_widget->active || dai->capture_widget->active)
         |                ^~
>> sound/soc/mediatek/mt8188/mt8188-dai-pcm.c:230:48: error: 'struct snd_soc_dai' has no member named 'capture_widget'
     230 |         if (dai->playback_widget->active || dai->capture_widget->active)
         |                                                ^~


vim +230 sound/soc/mediatek/mt8188/mt8188-dai-pcm.c

5d43bdd71200e1 Trevor Wu 2023-01-16  225  
5d43bdd71200e1 Trevor Wu 2023-01-16  226  /* dai ops */
5d43bdd71200e1 Trevor Wu 2023-01-16  227  static int mtk_dai_pcm_prepare(struct snd_pcm_substream *substream,
5d43bdd71200e1 Trevor Wu 2023-01-16  228  			       struct snd_soc_dai *dai)
5d43bdd71200e1 Trevor Wu 2023-01-16  229  {
5d43bdd71200e1 Trevor Wu 2023-01-16 @230  	if (dai->playback_widget->active || dai->capture_widget->active)
5d43bdd71200e1 Trevor Wu 2023-01-16  231  		return 0;
5d43bdd71200e1 Trevor Wu 2023-01-16  232  
5d43bdd71200e1 Trevor Wu 2023-01-16  233  	return mtk_dai_pcm_configure(substream, dai);
5d43bdd71200e1 Trevor Wu 2023-01-16  234  }
5d43bdd71200e1 Trevor Wu 2023-01-16  235  

:::::: The code at line 230 was first introduced by commit
:::::: 5d43bdd71200e1b08b7c4b7f3d3c86fdd23c4a3d ASoC: mediatek: mt8188: support pcmif in platform driver

:::::: TO: Trevor Wu <trevor.wu@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
