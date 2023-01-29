Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C8F28F4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 17:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675014502; x=1706550502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BSqSXxyoe+Ln0ibKcoEP/+4MLSBZmq4j61nSghhkAkc=;
  b=Iwz+ggDQ3MzWEyJdk0Fuhmv2oYVU2gyUomxyf4cE3em41lnorX59nqJr
   u2r4Q0pL2Gg63vsyqhToV1UFIvaTtgzWoPxo14slwGnDni+EjDPiYEsIT
   52eZAVLSK3X4LdlLfy/craHiVLx0sLPgqquT+HXiMPJUUDIGNAhBrNybb
   OC/NohSlZAYDtcwljBB2tYQ+GAFVMf0Dlw+hFeH36z08as5Ho2Y4PmqGW
   DXTyv/j7kwNN1vZFNOY19RRCLKXhBXFOcO2OZ7n6UGFnxBX3m7i4tOUq7
   ymqOb3c+2ETN94Uwou3n79asv5Ym/7L/ln7LFGPDfMz5BBnAGl+Wu0mBQ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="307760394"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="307760394"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 09:48:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="613781126"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="613781126"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Jan 2023 09:48:19 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMBms-0002zc-1w;
	Sun, 29 Jan 2023 17:48:18 +0000
Date: Mon, 30 Jan 2023 01:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-nomadik:ux500-sound 1/5]
 sound/soc/samsung/s3c2412-i2s.c:217:55: error: 'struct s3c_audio_pdata' has
 no member named 'dma_playback'
Message-ID: <202301300138.1UAkexaK-lkp@intel.com>
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
commit: 7310aaadf8ec3701122d4d856d1a8ca497f94582 [1/5] ASoC: samsung: remove DMA filter function and data
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230130/202301300138.1UAkexaK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git/commit/?id=7310aaadf8ec3701122d4d856d1a8ca497f94582
        git remote add linusw-nomadik https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
        git fetch --no-tags linusw-nomadik ux500-sound
        git checkout 7310aaadf8ec3701122d4d856d1a8ca497f94582
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   sound/soc/samsung/s3c2412-i2s.c: In function 's3c2412_iis_dev_probe':
>> sound/soc/samsung/s3c2412-i2s.c:217:55: error: 'struct s3c_audio_pdata' has no member named 'dma_playback'
     217 |         s3c2412_i2s_pcm_stereo_out.filter_data = pdata->dma_playback;
         |                                                       ^~
>> sound/soc/samsung/s3c2412-i2s.c:219:54: error: 'struct s3c_audio_pdata' has no member named 'dma_capture'
     219 |         s3c2412_i2s_pcm_stereo_in.filter_data = pdata->dma_capture;
         |                                                      ^~
>> sound/soc/samsung/s3c2412-i2s.c:222:55: error: 'struct s3c_audio_pdata' has no member named 'dma_filter'
     222 |                                                  pdata->dma_filter,
         |                                                       ^~
>> sound/soc/samsung/s3c2412-i2s.c:223:56: error: passing argument 4 of 'samsung_asoc_dma_platform_register' from incompatible pointer type [-Werror=incompatible-pointer-types]
     223 |                                                  "tx", "rx", NULL);
         |                                                        ^~~~
         |                                                        |
         |                                                        char *
   In file included from sound/soc/samsung/s3c2412-i2s.c:22:
   sound/soc/samsung/dma.h:17:55: note: expected 'struct device *' but argument is of type 'char *'
      17 |                                        struct device *dma_dev);
         |                                        ~~~~~~~~~~~~~~~^~~~~~~
>> sound/soc/samsung/s3c2412-i2s.c:221:15: error: too many arguments to function 'samsung_asoc_dma_platform_register'
     221 |         ret = samsung_asoc_dma_platform_register(&pdev->dev,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/samsung/dma.h:15:5: note: declared here
      15 | int samsung_asoc_dma_platform_register(struct device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +217 sound/soc/samsung/s3c2412-i2s.c

eca3b01d088554 sound/soc/samsung/s3c2412-i2s.c Kuninori Morimoto  2013-03-21  200  
fdca21ad460320 sound/soc/samsung/s3c2412-i2s.c Bill Pemberton     2012-12-07  201  static int s3c2412_iis_dev_probe(struct platform_device *pdev)
f0fba2ad1b6b53 sound/soc/s3c24xx/s3c2412-i2s.c Liam Girdwood      2010-03-17  202  {
a08485d8fdf6f6 sound/soc/samsung/s3c2412-i2s.c Padmavathi Venna   2012-12-07  203  	int ret = 0;
87b132bc0315fd sound/soc/samsung/s3c2412-i2s.c Vasily Khoruzhick  2014-06-23  204  	struct resource *res;
359fdfa6fde04b sound/soc/samsung/s3c2412-i2s.c Arnd Bergmann      2015-11-18  205  	struct s3c_audio_pdata *pdata = dev_get_platdata(&pdev->dev);
359fdfa6fde04b sound/soc/samsung/s3c2412-i2s.c Arnd Bergmann      2015-11-18  206  
359fdfa6fde04b sound/soc/samsung/s3c2412-i2s.c Arnd Bergmann      2015-11-18  207  	if (!pdata) {
359fdfa6fde04b sound/soc/samsung/s3c2412-i2s.c Arnd Bergmann      2015-11-18  208  		dev_err(&pdev->dev, "missing platform data");
359fdfa6fde04b sound/soc/samsung/s3c2412-i2s.c Arnd Bergmann      2015-11-18  209  		return -ENXIO;
359fdfa6fde04b sound/soc/samsung/s3c2412-i2s.c Arnd Bergmann      2015-11-18  210  	}
87b132bc0315fd sound/soc/samsung/s3c2412-i2s.c Vasily Khoruzhick  2014-06-23  211  
87a32d00249e6e sound/soc/samsung/s3c2412-i2s.c Yang Yingliang     2021-06-16  212  	s3c2412_i2s.regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
71864b22f50cea sound/soc/samsung/s3c2412-i2s.c Wei Yongjun        2014-07-20  213  	if (IS_ERR(s3c2412_i2s.regs))
71864b22f50cea sound/soc/samsung/s3c2412-i2s.c Wei Yongjun        2014-07-20  214  		return PTR_ERR(s3c2412_i2s.regs);
87b132bc0315fd sound/soc/samsung/s3c2412-i2s.c Vasily Khoruzhick  2014-06-23  215  
ea37bd4df55f64 sound/soc/samsung/s3c2412-i2s.c Sylwester Nawrocki 2016-08-04  216  	s3c2412_i2s_pcm_stereo_out.addr = res->start + S3C2412_IISTXD;
ea37bd4df55f64 sound/soc/samsung/s3c2412-i2s.c Sylwester Nawrocki 2016-08-04 @217  	s3c2412_i2s_pcm_stereo_out.filter_data = pdata->dma_playback;
ea37bd4df55f64 sound/soc/samsung/s3c2412-i2s.c Sylwester Nawrocki 2016-08-04  218  	s3c2412_i2s_pcm_stereo_in.addr = res->start + S3C2412_IISRXD;
ea37bd4df55f64 sound/soc/samsung/s3c2412-i2s.c Sylwester Nawrocki 2016-08-04 @219  	s3c2412_i2s_pcm_stereo_in.filter_data = pdata->dma_capture;
a08485d8fdf6f6 sound/soc/samsung/s3c2412-i2s.c Padmavathi Venna   2012-12-07  220  
73f5dfc68316be sound/soc/samsung/s3c2412-i2s.c Marek Szyprowski   2016-10-27 @221  	ret = samsung_asoc_dma_platform_register(&pdev->dev,
73f5dfc68316be sound/soc/samsung/s3c2412-i2s.c Marek Szyprowski   2016-10-27 @222  						 pdata->dma_filter,
0f928c19b646f6 sound/soc/samsung/s3c2412-i2s.c Sylwester Nawrocki 2019-02-14 @223  						 "tx", "rx", NULL);
a08485d8fdf6f6 sound/soc/samsung/s3c2412-i2s.c Padmavathi Venna   2012-12-07  224  	if (ret) {
73f5dfc68316be sound/soc/samsung/s3c2412-i2s.c Marek Szyprowski   2016-10-27  225  		pr_err("failed to register the DMA: %d\n", ret);
a08485d8fdf6f6 sound/soc/samsung/s3c2412-i2s.c Padmavathi Venna   2012-12-07  226  		return ret;
a08485d8fdf6f6 sound/soc/samsung/s3c2412-i2s.c Padmavathi Venna   2012-12-07  227  	}
a08485d8fdf6f6 sound/soc/samsung/s3c2412-i2s.c Padmavathi Venna   2012-12-07  228  
73f5dfc68316be sound/soc/samsung/s3c2412-i2s.c Marek Szyprowski   2016-10-27  229  	ret = s3c_i2sv2_register_component(&pdev->dev, -1,
73f5dfc68316be sound/soc/samsung/s3c2412-i2s.c Marek Szyprowski   2016-10-27  230  					   &s3c2412_i2s_component,
73f5dfc68316be sound/soc/samsung/s3c2412-i2s.c Marek Szyprowski   2016-10-27  231  					   &s3c2412_i2s_dai);
7253e354e712d2 sound/soc/samsung/s3c2412-i2s.c Tushar Behera      2014-05-21  232  	if (ret)
73f5dfc68316be sound/soc/samsung/s3c2412-i2s.c Marek Szyprowski   2016-10-27  233  		pr_err("failed to register the dai\n");
a08485d8fdf6f6 sound/soc/samsung/s3c2412-i2s.c Padmavathi Venna   2012-12-07  234  
a08485d8fdf6f6 sound/soc/samsung/s3c2412-i2s.c Padmavathi Venna   2012-12-07  235  	return ret;
f0fba2ad1b6b53 sound/soc/s3c24xx/s3c2412-i2s.c Liam Girdwood      2010-03-17  236  }
f0fba2ad1b6b53 sound/soc/s3c24xx/s3c2412-i2s.c Liam Girdwood      2010-03-17  237  

:::::: The code at line 217 was first introduced by commit
:::::: ea37bd4df55f640b5146ac08cd377242d3042e2e ASoC: samsung: Drop usage of struct s3c_dma_params from s3c2412-i2s.c

:::::: TO: Sylwester Nawrocki <s.nawrocki@samsung.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
