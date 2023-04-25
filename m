Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0236E7B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 06:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682405544; x=1713941544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2OHUpN6YokFpOz7x9E2V3U+3KdQ7S6caAHTi6IHDZvU=;
  b=FFEL0oZRKypRQqm6CwwkJPTv0Kl0PfptL87zh50XZ4OJ8Px/3p0p3/lw
   SZX0La3SkWhZGE/QKtSay0yFIkjDyUq8/Axfj4iZqwqdTn1Jt9eGRzUQd
   JfG5Ij+ELo1CTvZHbX0EQ0PxWhvYvHBmOFS83h/y0obL5ZPlnxjF8Acle
   CXnyHSjOwwcLnUOgk9RA9ZxCwxyXJ+PhqBvwiwkm14CK0zalMF3ThQnga
   F4JLt4Btu3El9x5+zYemrmNFY3XMcMKa35wnxNZXrhPsoqnqXFphOSiRc
   a5QrZ7ryVO9eJ7pnVZ917C+gtCVS3tJeMZ7PYUvVsoXIRMzgtae6zpwX3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="345433062"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="345433062"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 23:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="696061775"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="696061775"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Apr 2023 23:52:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prCXF-000j7G-0S;
	Tue, 25 Apr 2023 06:52:21 +0000
Date: Tue, 25 Apr 2023 14:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-component-2023-04-25-v1 28/29]
 sound/soc/soc-core.c:2557: warning: expecting prototype for
 snd_soc_register_dais(). Prototype was for devm_snd_soc_register_dais()
 instead
Message-ID: <202304251404.N5PpqB8z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-component-2023-04-25-v1
head:   4e73057aedd52c527ec30871513df16e746c46a6
commit: 1915609dc90041b9f98c4561bd24350500f4bd77 [28/29] ASoC: soc-core.c: use devm_snd_soc_register_dai()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230425/202304251404.N5PpqB8z-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/morimoto/linux/commit/1915609dc90041b9f98c4561bd24350500f4bd77
        git remote add morimoto https://github.com/morimoto/linux
        git fetch --no-tags morimoto sound-component-2023-04-25-v1
        git checkout 1915609dc90041b9f98c4561bd24350500f4bd77
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash sound/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304251404.N5PpqB8z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-core.c:2557: warning: expecting prototype for snd_soc_register_dais(). Prototype was for devm_snd_soc_register_dais() instead


vim +2557 sound/soc/soc-core.c

e11381f38f3478 Kuninori Morimoto 2019-11-05  2546  
daf7737335bf55 Kuninori Morimoto 2019-11-05  2547  /**
daf7737335bf55 Kuninori Morimoto 2019-11-05  2548   * snd_soc_register_dais - Register a DAI with the ASoC core
daf7737335bf55 Kuninori Morimoto 2019-11-05  2549   *
daf7737335bf55 Kuninori Morimoto 2019-11-05  2550   * @component: The component the DAIs are registered for
daf7737335bf55 Kuninori Morimoto 2019-11-05  2551   * @dai_drv: DAI driver to use for the DAIs
daf7737335bf55 Kuninori Morimoto 2019-11-05  2552   * @count: Number of DAIs
daf7737335bf55 Kuninori Morimoto 2019-11-05  2553   */
1915609dc90041 Kuninori Morimoto 2023-03-15  2554  static int devm_snd_soc_register_dais(struct snd_soc_component *component,
daf7737335bf55 Kuninori Morimoto 2019-11-05  2555  				      struct snd_soc_dai_driver *dai_drv,
daf7737335bf55 Kuninori Morimoto 2019-11-05  2556  				      size_t count)
daf7737335bf55 Kuninori Morimoto 2019-11-05 @2557  {
daf7737335bf55 Kuninori Morimoto 2019-11-05  2558  	struct snd_soc_dai *dai;
daf7737335bf55 Kuninori Morimoto 2019-11-05  2559  	unsigned int i;
daf7737335bf55 Kuninori Morimoto 2019-11-05  2560  
daf7737335bf55 Kuninori Morimoto 2019-11-05  2561  	for (i = 0; i < count; i++) {
1915609dc90041 Kuninori Morimoto 2023-03-15  2562  		dai = devm_snd_soc_register_dai(component->dev,
1915609dc90041 Kuninori Morimoto 2023-03-15  2563  						component, dai_drv + i, count == 1 &&
129f055a2144ab Charles Keepax    2022-06-23  2564  						component->driver->legacy_dai_naming);
1915609dc90041 Kuninori Morimoto 2023-03-15  2565  		if (!dai)
1915609dc90041 Kuninori Morimoto 2023-03-15  2566  			return -ENOMEM;
daf7737335bf55 Kuninori Morimoto 2019-11-05  2567  	}
daf7737335bf55 Kuninori Morimoto 2019-11-05  2568  
daf7737335bf55 Kuninori Morimoto 2019-11-05  2569  	return 0;
daf7737335bf55 Kuninori Morimoto 2019-11-05  2570  }
daf7737335bf55 Kuninori Morimoto 2019-11-05  2571  

:::::: The code at line 2557 was first introduced by commit
:::::: daf7737335bf555abf14031530fe8e47b46b373a ASoC: soc-core: move snd_soc_register_dai()

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
