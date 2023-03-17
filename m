Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E9079C5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 20:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679084441; x=1710620441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VH3APdDgcOV4x/cDAHMRiznLObk8L7ulHHcNpxqfsZQ=;
  b=FgsXS8vlq0q/uIiAIVe0DBJPDtMK/aPOagDTHXv1STyyB1BZNqvD8FJE
   Ht5xJAK4QaZRDaOrwacd3StTejPY2yv03a9ZpyCzVsrCVzqLlTWPtzOwF
   bKKSxXZEHlMZDpnqpM6BTeriewkIlH9Mr8pInx6/OXvlsWtu3CZe7yYYy
   zgfJuRhXOLXcSXXrQ1KFW9dobpbbV3SB0cECZP2NfxnNbPzPH0FE8U0ld
   Nx5980eSyJk1LNfYc8eiJWKH86LQwg9wDtQiXfS5BWTnXXrqCrY8aqbdT
   zME3scK5k7DJB84hWNywRTbFyJ3H5K/SxgTQA6yDI/CaVspcwTDoqpOiP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="335849338"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="335849338"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 13:20:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="854574957"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="854574957"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Mar 2023 13:20:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdGYk-0009ZO-1p;
	Fri, 17 Mar 2023 20:20:18 +0000
Date: Sat, 18 Mar 2023 04:19:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-dai-ops-2023-03-17-v1 64/64]
 sound/soc/pxa/pxa-ssp.c:833:18: error: 'struct snd_soc_dai_driver' has no
 member named 'probe'
Message-ID: <202303180450.1cv3R2nT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-dai-ops-2023-03-17-v1
head:   ac006aa2dfde34cedc5570e1ae3b38b6e4d49fa5
commit: ac006aa2dfde34cedc5570e1ae3b38b6e4d49fa5 [64/64] ASoC: soc-dai.h: remove unused call back functions
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230318/202303180450.1cv3R2nT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/morimoto/linux/commit/ac006aa2dfde34cedc5570e1ae3b38b6e4d49fa5
        git remote add morimoto https://github.com/morimoto/linux
        git fetch --no-tags morimoto sound-dai-ops-2023-03-17-v1
        git checkout ac006aa2dfde34cedc5570e1ae3b38b6e4d49fa5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303180450.1cv3R2nT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/pxa/pxa-ssp.c:833:18: error: 'struct snd_soc_dai_driver' has no member named 'probe'
     833 |                 .probe = pxa_ssp_probe,
         |                  ^~~~~
>> sound/soc/pxa/pxa-ssp.c:833:26: error: initialization of 'const char *' from incompatible pointer type 'int (*)(struct snd_soc_dai *)' [-Werror=incompatible-pointer-types]
     833 |                 .probe = pxa_ssp_probe,
         |                          ^~~~~~~~~~~~~
   sound/soc/pxa/pxa-ssp.c:833:26: note: (near initialization for 'pxa_ssp_dai.name')
>> sound/soc/pxa/pxa-ssp.c:834:18: error: 'struct snd_soc_dai_driver' has no member named 'remove'
     834 |                 .remove = pxa_ssp_remove,
         |                  ^~~~~~
   sound/soc/pxa/pxa-ssp.c:834:27: warning: initialization of 'unsigned int' from 'int (*)(struct snd_soc_dai *)' makes integer from pointer without a cast [-Wint-conversion]
     834 |                 .remove = pxa_ssp_remove,
         |                           ^~~~~~~~~~~~~~
   sound/soc/pxa/pxa-ssp.c:834:27: note: (near initialization for 'pxa_ssp_dai.id')
   cc1: some warnings being treated as errors
--
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


vim +833 sound/soc/pxa/pxa-ssp.c

6335d05548eece Eric Miao      2009-03-03  831  
f0fba2ad1b6b53 Liam Girdwood  2010-03-17  832  static struct snd_soc_dai_driver pxa_ssp_dai = {
1b340bd7e444f2 Mark Brown     2008-07-30 @833  		.probe = pxa_ssp_probe,
1b340bd7e444f2 Mark Brown     2008-07-30 @834  		.remove = pxa_ssp_remove,
1b340bd7e444f2 Mark Brown     2008-07-30  835  		.playback = {
1b340bd7e444f2 Mark Brown     2008-07-30  836  			.channels_min = 1,
f34762b6470481 Graeme Gregory 2009-09-25  837  			.channels_max = 8,
1b340bd7e444f2 Mark Brown     2008-07-30  838  			.rates = PXA_SSP_RATES,
1b340bd7e444f2 Mark Brown     2008-07-30  839  			.formats = PXA_SSP_FORMATS,
1b340bd7e444f2 Mark Brown     2008-07-30  840  		},
1b340bd7e444f2 Mark Brown     2008-07-30  841  		.capture = {
1b340bd7e444f2 Mark Brown     2008-07-30  842  			 .channels_min = 1,
f34762b6470481 Graeme Gregory 2009-09-25  843  			 .channels_max = 8,
1b340bd7e444f2 Mark Brown     2008-07-30  844  			.rates = PXA_SSP_RATES,
1b340bd7e444f2 Mark Brown     2008-07-30  845  			.formats = PXA_SSP_FORMATS,
1b340bd7e444f2 Mark Brown     2008-07-30  846  		 },
6335d05548eece Eric Miao      2009-03-03  847  		.ops = &pxa_ssp_dai_ops,
f0fba2ad1b6b53 Liam Girdwood  2010-03-17  848  };
f0fba2ad1b6b53 Liam Girdwood  2010-03-17  849  

:::::: The code at line 833 was first introduced by commit
:::::: 1b340bd7e444f20eb2df88c65fa34960c4736ee9 ASoC: Add PXA SSP support

:::::: TO: Mark Brown <broonie@opensource.wolfsonmicro.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
