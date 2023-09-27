Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733A41C690
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 20:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695845192; x=1727381192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C1PIVZsB79jRNfph3FjfCuuw9GWHBalqa+JkTr1l1EA=;
  b=N2yGJdY15UP269JuuOcgqx7x9f7LGLSZBHXF11VhXoWhxNzGGiTA3uPZ
   XV/CXy0FV6ndN7N9Tmyk504XySqf6l2D5M7FvdqfSkox1DG53AelC5/BS
   uK9WejfDnYNJaFvdrj3cuqxCyxhyk25b0KDxlx2oAhymOny1nWwAaeM1Q
   qEe1K16eQ+eBdpvzTsyeFMXUYrW3Oya+f9LRh3dAYS+kNPuPGZaSTAF0x
   eyTg5hecba3R9XIo6BzYl82G3yWeRw9mvxahvEFlpYlKvZG/kt0aS3nqT
   Bg0WujM082WjsglkAwvGyIMKls6BpwrhsYUFjv7QJY7RZGVA/mmqlO6Ya
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="366969853"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="366969853"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 13:06:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="778659380"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="778659380"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 27 Sep 2023 13:06:28 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlank-0000cF-0J;
	Wed, 27 Sep 2023 20:06:28 +0000
Date: Thu, 28 Sep 2023 04:06:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v5_20230927_wangweidong_a_asoc_codecs_add_aw87390_amplifier_driver
 62/71] arch/sh/boards/mach-se/7724/setup.c:304:27: warning: excess elements
 in struct initializer
Message-ID: <202309280417.rOLRdrdM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v5_20230927_wangweidong_a_asoc_codecs_add_aw87390_amplifier_driver
head:   cadf6ebe01b1b5f5bdb2eab0652f30c084c92495
commit: ad484cc98f2c7ee8e22f63691562a7abae5a9832 [62/71] ASoC: remove asoc_xxx() compatible macro
config: sh-se7724_defconfig (https://download.01.org/0day-ci/archive/20230928/202309280417.rOLRdrdM-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309280417.rOLRdrdM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280417.rOLRdrdM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sh/boards/mach-se/7724/setup.c:303:15: error: variable 'fsi_ak4642_info' has initializer but incomplete type
     303 | static struct asoc_simple_card_info fsi_ak4642_info = {
         |               ^~~~~~~~~~~~~~~~~~~~~
   arch/sh/boards/mach-se/7724/setup.c:304:10: error: 'struct asoc_simple_card_info' has no member named 'name'
     304 |         .name           = "AK4642",
         |          ^~~~
>> arch/sh/boards/mach-se/7724/setup.c:304:27: warning: excess elements in struct initializer
     304 |         .name           = "AK4642",
         |                           ^~~~~~~~
   arch/sh/boards/mach-se/7724/setup.c:304:27: note: (near initialization for 'fsi_ak4642_info')
   arch/sh/boards/mach-se/7724/setup.c:305:10: error: 'struct asoc_simple_card_info' has no member named 'card'
     305 |         .card           = "FSIA-AK4642",
         |          ^~~~
   arch/sh/boards/mach-se/7724/setup.c:305:27: warning: excess elements in struct initializer
     305 |         .card           = "FSIA-AK4642",
         |                           ^~~~~~~~~~~~~
   arch/sh/boards/mach-se/7724/setup.c:305:27: note: (near initialization for 'fsi_ak4642_info')
   arch/sh/boards/mach-se/7724/setup.c:306:10: error: 'struct asoc_simple_card_info' has no member named 'codec'
     306 |         .codec          = "ak4642-codec.0-0012",
         |          ^~~~~
   arch/sh/boards/mach-se/7724/setup.c:306:27: warning: excess elements in struct initializer
     306 |         .codec          = "ak4642-codec.0-0012",
         |                           ^~~~~~~~~~~~~~~~~~~~~
   arch/sh/boards/mach-se/7724/setup.c:306:27: note: (near initialization for 'fsi_ak4642_info')
   arch/sh/boards/mach-se/7724/setup.c:307:10: error: 'struct asoc_simple_card_info' has no member named 'platform'
     307 |         .platform       = "sh_fsi.0",
         |          ^~~~~~~~
   arch/sh/boards/mach-se/7724/setup.c:307:27: warning: excess elements in struct initializer
     307 |         .platform       = "sh_fsi.0",
         |                           ^~~~~~~~~~
   arch/sh/boards/mach-se/7724/setup.c:307:27: note: (near initialization for 'fsi_ak4642_info')
   arch/sh/boards/mach-se/7724/setup.c:308:10: error: 'struct asoc_simple_card_info' has no member named 'daifmt'
     308 |         .daifmt         = SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_CBP_CFP,
         |          ^~~~~~
   In file included from include/sound/soc-topology.h:15,
                    from include/sound/soc-dapm.h:15,
                    from include/sound/soc.h:418,
                    from include/sound/sh_fsi.h:12,
                    from arch/sh/boards/mach-se/7724/setup.c:40:
>> include/uapi/sound/asoc.h:152:41: warning: excess elements in struct initializer
     152 | #define SND_SOC_DAI_FORMAT_LEFT_J       3 /* Left Justified mode */
         |                                         ^
   include/sound/soc-dai.h:29:41: note: in expansion of macro 'SND_SOC_DAI_FORMAT_LEFT_J'
      29 | #define SND_SOC_DAIFMT_LEFT_J           SND_SOC_DAI_FORMAT_LEFT_J
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/sh/boards/mach-se/7724/setup.c:308:27: note: in expansion of macro 'SND_SOC_DAIFMT_LEFT_J'
     308 |         .daifmt         = SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_CBP_CFP,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/sound/asoc.h:152:41: note: (near initialization for 'fsi_ak4642_info')
     152 | #define SND_SOC_DAI_FORMAT_LEFT_J       3 /* Left Justified mode */
         |                                         ^
   include/sound/soc-dai.h:29:41: note: in expansion of macro 'SND_SOC_DAI_FORMAT_LEFT_J'
      29 | #define SND_SOC_DAIFMT_LEFT_J           SND_SOC_DAI_FORMAT_LEFT_J
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/sh/boards/mach-se/7724/setup.c:308:27: note: in expansion of macro 'SND_SOC_DAIFMT_LEFT_J'
     308 |         .daifmt         = SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_CBP_CFP,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   arch/sh/boards/mach-se/7724/setup.c:309:10: error: 'struct asoc_simple_card_info' has no member named 'cpu_dai'
     309 |         .cpu_dai = {
         |          ^~~~~~~
   arch/sh/boards/mach-se/7724/setup.c:309:20: error: extra brace group at end of initializer
     309 |         .cpu_dai = {
         |                    ^
   arch/sh/boards/mach-se/7724/setup.c:309:20: note: (near initialization for 'fsi_ak4642_info')
   arch/sh/boards/mach-se/7724/setup.c:309:20: warning: excess elements in struct initializer
   arch/sh/boards/mach-se/7724/setup.c:309:20: note: (near initialization for 'fsi_ak4642_info')
   arch/sh/boards/mach-se/7724/setup.c:312:10: error: 'struct asoc_simple_card_info' has no member named 'codec_dai'
     312 |         .codec_dai = {
         |          ^~~~~~~~~
   arch/sh/boards/mach-se/7724/setup.c:312:22: error: extra brace group at end of initializer
     312 |         .codec_dai = {
         |                      ^
   arch/sh/boards/mach-se/7724/setup.c:312:22: note: (near initialization for 'fsi_ak4642_info')
   arch/sh/boards/mach-se/7724/setup.c:312:22: warning: excess elements in struct initializer
   arch/sh/boards/mach-se/7724/setup.c:312:22: note: (near initialization for 'fsi_ak4642_info')
   arch/sh/boards/mach-se/7724/setup.c:303:37: error: storage size of 'fsi_ak4642_info' isn't known
     303 | static struct asoc_simple_card_info fsi_ak4642_info = {
         |                                     ^~~~~~~~~~~~~~~


vim +304 arch/sh/boards/mach-se/7724/setup.c

3e9ad52b95e259 Kuninori Morimoto 2009-08-21  302  
af8a2fe12fae1b Kuninori Morimoto 2012-04-08  303  static struct asoc_simple_card_info fsi_ak4642_info = {
45f3121615b2b3 Kuninori Morimoto 2011-11-23 @304  	.name		= "AK4642",
45f3121615b2b3 Kuninori Morimoto 2011-11-23  305  	.card		= "FSIA-AK4642",
45f3121615b2b3 Kuninori Morimoto 2011-11-23  306  	.codec		= "ak4642-codec.0-0012",
45f3121615b2b3 Kuninori Morimoto 2011-11-23  307  	.platform	= "sh_fsi.0",
81a13ac7e3e490 Mark Brown        2021-09-15  308  	.daifmt		= SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_CBP_CFP,
a4a2992c531f6c Kuninori Morimoto 2013-01-10  309  	.cpu_dai = {
a4a2992c531f6c Kuninori Morimoto 2013-01-10  310  		.name	= "fsia-dai",
a4a2992c531f6c Kuninori Morimoto 2013-01-10  311  	},
a4a2992c531f6c Kuninori Morimoto 2013-01-10  312  	.codec_dai = {
a4a2992c531f6c Kuninori Morimoto 2013-01-10  313  		.name	= "ak4642-hifi",
a4a2992c531f6c Kuninori Morimoto 2013-01-10  314  		.sysclk	= 11289600,
a4a2992c531f6c Kuninori Morimoto 2013-01-10  315  	},
45f3121615b2b3 Kuninori Morimoto 2011-11-23  316  };
45f3121615b2b3 Kuninori Morimoto 2011-11-23  317  

:::::: The code at line 304 was first introduced by commit
:::::: 45f3121615b2b354f7d95d30f795bc5fe0043e92 ASoC: fsi-ak4642: modify specification method of FSI / ak464x

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
