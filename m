Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83516AAD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 13:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679060530; x=1710596530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sQ5GoTh47y1LZxGGtWG+scGP6CV0ERpljxuG+rsgUuA=;
  b=mcFmVOqRyO/S02QWDeLQf+FiJ5ZkOujXMp0/lPQbmidXuN9HXDHWTm49
   PB1vedKaI/OHPNUV++vyvSKhaAa1mrepSa3wo3nGcuYURjX6QkMwF3dTo
   r0wO3yQ94iPoXHjv9iZPNboP75Xh1jIsoDLURNhnapEj0KWpwcKVAGvs+
   EM3yney6CDpYlMduKDH3sE/3KO/T2x9Qe2UEmBKCF44u8iIuFFRxzE/V0
   Sb9vYkijvYb27B3tG7N7Kn4xL39pqS7nHWmlabgQWSS09FEX5WpD3Qrjo
   C03+CuZunkg/cc/lu/Et/NTdFf/of5Df6nL5O5RDnsQdJvxMewY+e9vbq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="336961299"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="336961299"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 06:42:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="749257885"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="749257885"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Mar 2023 06:42:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdALQ-0009NC-1o;
	Fri, 17 Mar 2023 13:42:08 +0000
Date: Fri, 17 Mar 2023 21:41:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-dai-ops-2023-03-17-v1 64/64]
 sound/soc/pxa/pxa-ssp.c:834:27: warning: initialization of 'unsigned int'
 from 'int (*)(struct snd_soc_dai *)' makes integer from pointer without a
 cast
Message-ID: <202303172114.8rHG3iCp-lkp@intel.com>
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
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230317/202303172114.8rHG3iCp-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash sound/soc/pxa/ sound/soc/ux500/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303172114.8rHG3iCp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/pxa/pxa-ssp.c:833:18: error: 'struct snd_soc_dai_driver' has no member named 'probe'
     833 |                 .probe = pxa_ssp_probe,
         |                  ^~~~~
   sound/soc/pxa/pxa-ssp.c:833:26: error: initialization of 'const char *' from incompatible pointer type 'int (*)(struct snd_soc_dai *)' [-Werror=incompatible-pointer-types]
     833 |                 .probe = pxa_ssp_probe,
         |                          ^~~~~~~~~~~~~
   sound/soc/pxa/pxa-ssp.c:833:26: note: (near initialization for 'pxa_ssp_dai.name')
   sound/soc/pxa/pxa-ssp.c:834:18: error: 'struct snd_soc_dai_driver' has no member named 'remove'
     834 |                 .remove = pxa_ssp_remove,
         |                  ^~~~~~
>> sound/soc/pxa/pxa-ssp.c:834:27: warning: initialization of 'unsigned int' from 'int (*)(struct snd_soc_dai *)' makes integer from pointer without a cast [-Wint-conversion]
     834 |                 .remove = pxa_ssp_remove,
         |                           ^~~~~~~~~~~~~~
   sound/soc/pxa/pxa-ssp.c:834:27: note: (near initialization for 'pxa_ssp_dai.id')
   cc1: some warnings being treated as errors


vim +834 sound/soc/pxa/pxa-ssp.c

6335d05548eece Eric Miao      2009-03-03  831  
f0fba2ad1b6b53 Liam Girdwood  2010-03-17  832  static struct snd_soc_dai_driver pxa_ssp_dai = {
1b340bd7e444f2 Mark Brown     2008-07-30  833  		.probe = pxa_ssp_probe,
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

:::::: The code at line 834 was first introduced by commit
:::::: 1b340bd7e444f20eb2df88c65fa34960c4736ee9 ASoC: Add PXA SSP support

:::::: TO: Mark Brown <broonie@opensource.wolfsonmicro.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
