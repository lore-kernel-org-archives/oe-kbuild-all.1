Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7707F4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 05:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676007447; x=1707543447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IPWrGFkeO6XEb2AJvm5KuBvAF820/kJPMADk9yUWQ2I=;
  b=LZc+Kf7FaeY2iTt28TobB5tujvYwGB5On44sVd8pcSyaNmWdpuGSrGTq
   t2ChC7Znq4JaOfAqQh6PRJk8g67IQJoggB/wKNeXPcUDVaRYC398KJoVh
   2h/t78BPvsC97EHTOO+BDWcA4tmF0U9njVFTv2zeeRjjokphSdcsofDcc
   YlXEIEPhSEHPZCsaGmBQMAo+KqPR9zQHZ7B/vmDEM0lYB98oLrH4rFgA2
   G4k20hJAYk1/bkXmUWBe4WTqk27+YXG/XuHlvSyBchTqZiiKx8VDWB0Qc
   OtrGB9tXgVA3+Bp3gNtPMaPEIa1OadsChP4O57Syt7IBXIlFHR+YrgABg
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="357741395"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="357741395"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 21:37:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="698305781"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="698305781"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Feb 2023 21:37:25 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQM68-0005aU-1U;
	Fri, 10 Feb 2023 05:37:24 +0000
Date: Fri, 10 Feb 2023 13:36:36 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-nomadik:ux500-sound 2/5] sound/soc/pxa/mmp-pcm.c:129:16:
 error: implicit declaration of function
 'snd_dmaengine_pcm_open_request_chan'; did you mean
 'snd_dmaengine_pcm_request_channel'?
Message-ID: <202302101335.52QlY8iD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-sound
head:   b65694eef136170ab7bac3d1f351b7d41fda5167
commit: fd5c9025adb03694a418ffe7f225634df560e2f5 [2/5] ASoC: pxa: remove snd_dmaengine_pcm_open_request_chan()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230210/202302101335.52QlY8iD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git/commit/?id=fd5c9025adb03694a418ffe7f225634df560e2f5
        git remote add linusw-nomadik https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
        git fetch --no-tags linusw-nomadik ux500-sound
        git checkout fd5c9025adb03694a418ffe7f225634df560e2f5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302101335.52QlY8iD-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/pxa/mmp-pcm.c: In function 'mmp_pcm_open':
>> sound/soc/pxa/mmp-pcm.c:129:16: error: implicit declaration of function 'snd_dmaengine_pcm_open_request_chan'; did you mean 'snd_dmaengine_pcm_request_channel'? [-Werror=implicit-function-declaration]
     129 |         return snd_dmaengine_pcm_open_request_chan(substream, filter,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                snd_dmaengine_pcm_request_channel
   cc1: some warnings being treated as errors


vim +129 sound/soc/pxa/mmp-pcm.c

7a824e214e25a4 Zhangfei Gao       2012-06-11  109  
540e59c68bbcd4 Kuninori Morimoto  2019-10-02  110  static int mmp_pcm_open(struct snd_soc_component *component,
540e59c68bbcd4 Kuninori Morimoto  2019-10-02  111  			struct snd_pcm_substream *substream)
7a824e214e25a4 Zhangfei Gao       2012-06-11  112  {
83b95c2fc02839 Kuninori Morimoto  2020-07-20  113  	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
797d16971a2a4f Kuninori Morimoto  2018-01-29  114  	struct platform_device *pdev = to_platform_device(component->dev);
8d8fef280c9486 Kuninori Morimoto  2020-03-23  115  	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
ac581e60dfb4cc Lars-Peter Clausen 2013-03-22  116  	struct mmp_dma_data dma_data;
7a824e214e25a4 Zhangfei Gao       2012-06-11  117  	struct resource *r;
7a824e214e25a4 Zhangfei Gao       2012-06-11  118  
7a824e214e25a4 Zhangfei Gao       2012-06-11  119  	r = platform_get_resource(pdev, IORESOURCE_DMA, substream->stream);
7a824e214e25a4 Zhangfei Gao       2012-06-11  120  	if (!r)
7a824e214e25a4 Zhangfei Gao       2012-06-11  121  		return -EBUSY;
7a824e214e25a4 Zhangfei Gao       2012-06-11  122  
7a824e214e25a4 Zhangfei Gao       2012-06-11  123  	snd_soc_set_runtime_hwparams(substream,
7a824e214e25a4 Zhangfei Gao       2012-06-11  124  				&mmp_pcm_hardware[substream->stream]);
7a824e214e25a4 Zhangfei Gao       2012-06-11  125  
ac581e60dfb4cc Lars-Peter Clausen 2013-03-22  126  	dma_data.dma_res = r;
ac581e60dfb4cc Lars-Peter Clausen 2013-03-22  127  	dma_data.ssp_id = cpu_dai->id;
7a824e214e25a4 Zhangfei Gao       2012-06-11  128  
7c1c1d4a7b4ca1 Lars-Peter Clausen 2013-04-15 @129  	return snd_dmaengine_pcm_open_request_chan(substream, filter,
7c1c1d4a7b4ca1 Lars-Peter Clausen 2013-04-15  130  		    &dma_data);
7a824e214e25a4 Zhangfei Gao       2012-06-11  131  }
7a824e214e25a4 Zhangfei Gao       2012-06-11  132  

:::::: The code at line 129 was first introduced by commit
:::::: 7c1c1d4a7b4ca1266057a3632d27450f5575caf9 ASoC: dmaengine-pcm: Make requesting the DMA channel at PCM open optional

:::::: TO: Lars-Peter Clausen <lars@metafoo.de>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
