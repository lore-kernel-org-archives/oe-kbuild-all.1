Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128623C0A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 18:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682447397; x=1713983397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UcDvxsWNhDEYEBDpbQhhocooaM+L6gkLKMrzC5kPb+Q=;
  b=B99Vh0B6G5juTajFLwdcD1r0ZmrG7NSO/JY8KYKu5IUXEodhPgkYc9hs
   0hZf8i9e2NeLaTyZC/otnQOI1SI82ynrL/k05iosTEfKYEZm6UBelQojO
   q6HKsHc/N5Ve/jsE9Z+q39eUEJDCWtKinx+uMaN+K7/ZTTHQ8vOCNcdoi
   z29NFE4PriFSrIWXg1MsyRdcdJ9bVXrgrfWawr43YS9TILJTvL3bgMum5
   Ez46hHxJf1HDt5flKzgkg8NzgwX1El+iJ3mTi6DijWUii00SawTfb3jZR
   rzDSdhbWXebKPiylZt4Z+nZaUHZmujwz3i3faVflL85/FCUuSqzbejCW6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="433127009"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="433127009"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 11:29:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="724108983"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="724108983"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 25 Apr 2023 11:29:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prNQI-000jfY-15;
	Tue, 25 Apr 2023 18:29:54 +0000
Date: Wed, 26 Apr 2023 02:29:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-dai-ops-2023-04-25-v1 59/59]
 sound/soc/pxa/mmp-sspa.c:353:10: error: 'struct snd_soc_dai_driver' has no
 member named 'probe'
Message-ID: <202304260246.iiEMVx9g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-dai-ops-2023-04-25-v1
head:   50b09e58ed93011cdf912403597b750aa9e43f16
commit: 50b09e58ed93011cdf912403597b750aa9e43f16 [59/59] ASoC: soc-dai.h: remove unused call back functions
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230426/202304260246.iiEMVx9g-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/morimoto/linux/commit/50b09e58ed93011cdf912403597b750aa9e43f16
        git remote add morimoto https://github.com/morimoto/linux
        git fetch --no-tags morimoto sound-dai-ops-2023-04-25-v1
        git checkout 50b09e58ed93011cdf912403597b750aa9e43f16
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304260246.iiEMVx9g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/pxa/mmp-sspa.c:353:10: error: 'struct snd_soc_dai_driver' has no member named 'probe'
     353 |         .probe = mmp_sspa_probe,
         |          ^~~~~
>> sound/soc/pxa/mmp-sspa.c:353:18: error: initialization of 'const char *' from incompatible pointer type 'int (*)(struct snd_soc_dai *)' [-Werror=incompatible-pointer-types]
     353 |         .probe = mmp_sspa_probe,
         |                  ^~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c:353:18: note: (near initialization for 'mmp_sspa_dai.name')
   cc1: some warnings being treated as errors
--
>> sound/soc/ux500/ux500_msp_dai.c:698:10: error: 'struct snd_soc_dai_driver' has no member named 'probe'
     698 |         .probe                 = ux500_msp_dai_of_probe,
         |          ^~~~~
>> sound/soc/ux500/ux500_msp_dai.c:698:34: error: initialization of 'const char *' from incompatible pointer type 'int (*)(struct snd_soc_dai *)' [-Werror=incompatible-pointer-types]
     698 |         .probe                 = ux500_msp_dai_of_probe,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/ux500/ux500_msp_dai.c:698:34: note: (near initialization for 'ux500_msp_dai_drv.name')
   cc1: some warnings being treated as errors


vim +353 sound/soc/pxa/mmp-sspa.c

fa375d42f0e531 Zhangfei Gao       2012-06-11  351  
5d9ff402152fe9 Lars-Peter Clausen 2013-05-14  352  static struct snd_soc_dai_driver mmp_sspa_dai = {
fa375d42f0e531 Zhangfei Gao       2012-06-11 @353  	.probe = mmp_sspa_probe,
fa375d42f0e531 Zhangfei Gao       2012-06-11  354  	.playback = {
fa375d42f0e531 Zhangfei Gao       2012-06-11  355  		.channels_min = 1,
fa375d42f0e531 Zhangfei Gao       2012-06-11  356  		.channels_max = 128,
fa375d42f0e531 Zhangfei Gao       2012-06-11  357  		.rates = MMP_SSPA_RATES,
fa375d42f0e531 Zhangfei Gao       2012-06-11  358  		.formats = MMP_SSPA_FORMATS,
fa375d42f0e531 Zhangfei Gao       2012-06-11  359  	},
fa375d42f0e531 Zhangfei Gao       2012-06-11  360  	.capture = {
fa375d42f0e531 Zhangfei Gao       2012-06-11  361  		.channels_min = 1,
fa375d42f0e531 Zhangfei Gao       2012-06-11  362  		.channels_max = 2,
fa375d42f0e531 Zhangfei Gao       2012-06-11  363  		.rates = MMP_SSPA_RATES,
fa375d42f0e531 Zhangfei Gao       2012-06-11  364  		.formats = MMP_SSPA_FORMATS,
fa375d42f0e531 Zhangfei Gao       2012-06-11  365  	},
fa375d42f0e531 Zhangfei Gao       2012-06-11  366  	.ops = &mmp_sspa_dai_ops,
fa375d42f0e531 Zhangfei Gao       2012-06-11  367  };
fa375d42f0e531 Zhangfei Gao       2012-06-11  368  

:::::: The code at line 353 was first introduced by commit
:::::: fa375d42f0e531b7ca4316ea9fd5444e01d585e8 ASoC: mmp: add sspa support

:::::: TO: Zhangfei Gao <zhangfei.gao@marvell.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
