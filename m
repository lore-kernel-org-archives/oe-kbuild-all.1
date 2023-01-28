Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4AF199
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 08:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674895046; x=1706431046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cWUHMzGqepqPSXKZ9SuHXnAObjfKvoGh+wANs5Wh5vY=;
  b=I3U61yNt8z/FW7gsG9sZNFdtSaNv/j+CaxttxUS9dOKpGTijmx3n5aFc
   Rz4fmcPE8zpG4wEy/AIlr7ygrOjPE5+SuOadhdfUxBRcNhk51/o+7yBvb
   EUC8pTQUjV8IVpTTmkEi4bxBXUJAdcu+dVPHkwC6xkBjQP6ZoiEagpLm9
   KGBf7tQAISWJrpci/ZHD0qvoKFvbz24i16B1VX8iVms8lBR9A2O35MreG
   LB176Za+3sDAhxtZpLOR1e2L5vsvGs2TbRL3uJGM9LZ1S8FEqcAF3VHcr
   d48fMgMaQoQVJxxN/vNKZxMffqBDy6ip+nAV6dw+PCnfxtGtbsQsQW2vR
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="315229708"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="315229708"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 00:37:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="663556617"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="663556617"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Jan 2023 00:37:24 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLgiB-0000WX-0Z;
	Sat, 28 Jan 2023 08:37:23 +0000
Date: Sat, 28 Jan 2023 16:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-nomadik:ux500-sound 1/5]
 sound/soc/samsung/s3c24xx-i2s.c:436:56: error: passing argument 4 of
 'samsung_asoc_dma_platform_register' from incompatible pointer type
Message-ID: <202301281624.uV0BG9Do-lkp@intel.com>
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
config: microblaze-randconfig-r022-20230123 (https://download.01.org/0day-ci/archive/20230128/202301281624.uV0BG9Do-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git/commit/?id=7310aaadf8ec3701122d4d856d1a8ca497f94582
        git remote add linusw-nomadik https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
        git fetch --no-tags linusw-nomadik ux500-sound
        git checkout 7310aaadf8ec3701122d4d856d1a8ca497f94582
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash sound/soc/codecs/ sound/soc/samsung/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   sound/soc/samsung/s3c24xx-i2s.c: In function 's3c24xx_iis_dev_probe':
>> sound/soc/samsung/s3c24xx-i2s.c:436:56: error: passing argument 4 of 'samsung_asoc_dma_platform_register' from incompatible pointer type [-Werror=incompatible-pointer-types]
     436 |                                                  "tx", "rx", NULL);
         |                                                        ^~~~
         |                                                        |
         |                                                        char *
   In file included from sound/soc/samsung/s3c24xx-i2s.c:21:
   sound/soc/samsung/dma.h:17:55: note: expected 'struct device *' but argument is of type 'char *'
      17 |                                        struct device *dma_dev);
         |                                        ~~~~~~~~~~~~~~~^~~~~~~
>> sound/soc/samsung/s3c24xx-i2s.c:435:15: error: too many arguments to function 'samsung_asoc_dma_platform_register'
     435 |         ret = samsung_asoc_dma_platform_register(&pdev->dev, NULL,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/samsung/dma.h:15:5: note: declared here
      15 | int samsung_asoc_dma_platform_register(struct device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/samsung_asoc_dma_platform_register +436 sound/soc/samsung/s3c24xx-i2s.c

5642ddff274172 sound/soc/samsung/s3c24xx-i2s.c Kuninori Morimoto  2013-03-21  422  
fdca21ad460320 sound/soc/samsung/s3c24xx-i2s.c Bill Pemberton     2012-12-07  423  static int s3c24xx_iis_dev_probe(struct platform_device *pdev)
f0fba2ad1b6b53 sound/soc/s3c24xx/s3c24xx-i2s.c Liam Girdwood      2010-03-17  424  {
87b132bc0315fd sound/soc/samsung/s3c24xx-i2s.c Vasily Khoruzhick  2014-06-23  425  	struct resource *res;
5d3c1f633ea298 sound/soc/samsung/s3c24xx-i2s.c Sylwester Nawrocki 2016-11-02  426  	int ret;
87b132bc0315fd sound/soc/samsung/s3c24xx-i2s.c Vasily Khoruzhick  2014-06-23  427  
b73cbd7b1c2d47 sound/soc/samsung/s3c24xx-i2s.c Yang Yingliang     2021-06-16  428  	s3c24xx_i2s.regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
c479163a1b6ab4 sound/soc/samsung/s3c24xx-i2s.c Wei Yongjun        2015-04-16  429  	if (IS_ERR(s3c24xx_i2s.regs))
c479163a1b6ab4 sound/soc/samsung/s3c24xx-i2s.c Wei Yongjun        2015-04-16  430  		return PTR_ERR(s3c24xx_i2s.regs);
87b132bc0315fd sound/soc/samsung/s3c24xx-i2s.c Vasily Khoruzhick  2014-06-23  431  
8999390e40abe8 sound/soc/samsung/s3c24xx-i2s.c Sylwester Nawrocki 2016-08-04  432  	s3c24xx_i2s_pcm_stereo_out.addr = res->start + S3C2410_IISFIFO;
8999390e40abe8 sound/soc/samsung/s3c24xx-i2s.c Sylwester Nawrocki 2016-08-04  433  	s3c24xx_i2s_pcm_stereo_in.addr = res->start + S3C2410_IISFIFO;
a08485d8fdf6f6 sound/soc/samsung/s3c24xx-i2s.c Padmavathi Venna   2012-12-07  434  
6c9473c55e7bb9 sound/soc/samsung/s3c24xx-i2s.c Sylwester Nawrocki 2016-11-02 @435  	ret = samsung_asoc_dma_platform_register(&pdev->dev, NULL,
0f928c19b646f6 sound/soc/samsung/s3c24xx-i2s.c Sylwester Nawrocki 2019-02-14 @436  						 "tx", "rx", NULL);
a08485d8fdf6f6 sound/soc/samsung/s3c24xx-i2s.c Padmavathi Venna   2012-12-07  437  	if (ret) {
6c9473c55e7bb9 sound/soc/samsung/s3c24xx-i2s.c Sylwester Nawrocki 2016-11-02  438  		dev_err(&pdev->dev, "Failed to register the DMA: %d\n", ret);
a08485d8fdf6f6 sound/soc/samsung/s3c24xx-i2s.c Padmavathi Venna   2012-12-07  439  		return ret;
a08485d8fdf6f6 sound/soc/samsung/s3c24xx-i2s.c Padmavathi Venna   2012-12-07  440  	}
a08485d8fdf6f6 sound/soc/samsung/s3c24xx-i2s.c Padmavathi Venna   2012-12-07  441  
73f5dfc68316be sound/soc/samsung/s3c24xx-i2s.c Marek Szyprowski   2016-10-27  442  	ret = devm_snd_soc_register_component(&pdev->dev,
73f5dfc68316be sound/soc/samsung/s3c24xx-i2s.c Marek Szyprowski   2016-10-27  443  			&s3c24xx_i2s_component, &s3c24xx_i2s_dai, 1);
7253e354e712d2 sound/soc/samsung/s3c24xx-i2s.c Tushar Behera      2014-05-21  444  	if (ret)
6c9473c55e7bb9 sound/soc/samsung/s3c24xx-i2s.c Sylwester Nawrocki 2016-11-02  445  		dev_err(&pdev->dev, "Failed to register the DAI\n");
a08485d8fdf6f6 sound/soc/samsung/s3c24xx-i2s.c Padmavathi Venna   2012-12-07  446  
a08485d8fdf6f6 sound/soc/samsung/s3c24xx-i2s.c Padmavathi Venna   2012-12-07  447  	return ret;
f0fba2ad1b6b53 sound/soc/s3c24xx/s3c24xx-i2s.c Liam Girdwood      2010-03-17  448  }
f0fba2ad1b6b53 sound/soc/s3c24xx/s3c24xx-i2s.c Liam Girdwood      2010-03-17  449  

:::::: The code at line 436 was first introduced by commit
:::::: 0f928c19b646f6af39ccf7481a546e5da616bb78 ASoC: samsung: Specify DMA channel names through custom DMA config

:::::: TO: Sylwester Nawrocki <s.nawrocki@samsung.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
