Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F39110A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Apr 2023 07:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680937478; x=1712473478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6L6LLCe6dSgPgcaXqmkyjHNyDe8VEpVc4p44iM4iVUU=;
  b=NStgqho6N2K+B7PFnAn3p25TfXryAfGjZnKx1RCCQuYXkc9S2LuGrrn3
   AeD00+Xmj72eU6twBJA8qIyj+nPHEuODIm/MHAmA/JzNYt6RqhKtMYchx
   VzZh3IuIYV2Rvey//Lj4BwxZy5o7uLTBmXII4rWZLLSWDBxOWIBQElMf2
   PEhAMLGBKznc98ebQ9iixmd2Ika0bxdgeZmu6ZFbNautZhb0tVFReXT6p
   JNqhHZhnyULcfBSmrOnhD4YHpGkH3hf7OnubVdiYQiEgXyjN5C2cHQnEz
   ZILiqTdb4qaCa1FDJI907a5v4FOU5W6hc7zWp/wO5YNavw8oftQTjPV0W
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="341869741"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="341869741"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 00:04:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="718050799"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="718050799"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Apr 2023 00:04:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pl2cl-000TRf-1c;
	Sat, 08 Apr 2023 07:04:35 +0000
Date: Sat, 8 Apr 2023 15:04:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 36/76]
 sound/soc/mediatek/mt8188/mt8188-dai-pcm.c:230:16: error: 'struct
 snd_soc_dai' has no member named 'playback_widget'
Message-ID: <202304081532.msNCjBQH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   ba182faf669dff6e8eaef91b0df486c9056c3fcd
commit: 8a36b84b6e32a265ee281b1b44a7c952008d2ced [36/76] UPSTREAM: ASoC: mediatek: mt8188: support audio clock control
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230408/202304081532.msNCjBQH-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout 8a36b84b6e32a265ee281b1b44a7c952008d2ced
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash sound/soc/mediatek/mt8188/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304081532.msNCjBQH-lkp@intel.com/

Note: the chrome-os/chromeos-6.1 HEAD ba182faf669dff6e8eaef91b0df486c9056c3fcd builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   sound/soc/mediatek/mt8188/mt8188-dai-pcm.c: In function 'mtk_dai_pcm_prepare':
>> sound/soc/mediatek/mt8188/mt8188-dai-pcm.c:230:16: error: 'struct snd_soc_dai' has no member named 'playback_widget'
     230 |         if (dai->playback_widget->active || dai->capture_widget->active)
         |                ^~
>> sound/soc/mediatek/mt8188/mt8188-dai-pcm.c:230:48: error: 'struct snd_soc_dai' has no member named 'capture_widget'
     230 |         if (dai->playback_widget->active || dai->capture_widget->active)
         |                                                ^~


vim +230 sound/soc/mediatek/mt8188/mt8188-dai-pcm.c

7d1ef9cacaeb81 Trevor Wu 2023-01-16  225  
7d1ef9cacaeb81 Trevor Wu 2023-01-16  226  /* dai ops */
7d1ef9cacaeb81 Trevor Wu 2023-01-16  227  static int mtk_dai_pcm_prepare(struct snd_pcm_substream *substream,
7d1ef9cacaeb81 Trevor Wu 2023-01-16  228  			       struct snd_soc_dai *dai)
7d1ef9cacaeb81 Trevor Wu 2023-01-16  229  {
7d1ef9cacaeb81 Trevor Wu 2023-01-16 @230  	if (dai->playback_widget->active || dai->capture_widget->active)
7d1ef9cacaeb81 Trevor Wu 2023-01-16  231  		return 0;
7d1ef9cacaeb81 Trevor Wu 2023-01-16  232  
7d1ef9cacaeb81 Trevor Wu 2023-01-16  233  	return mtk_dai_pcm_configure(substream, dai);
7d1ef9cacaeb81 Trevor Wu 2023-01-16  234  }
7d1ef9cacaeb81 Trevor Wu 2023-01-16  235  

:::::: The code at line 230 was first introduced by commit
:::::: 7d1ef9cacaeb81d3f1eea7026afe8f6778fef88b UPSTREAM: ASoC: mediatek: mt8188: support pcmif in platform driver

:::::: TO: Trevor Wu <trevor.wu@mediatek.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
