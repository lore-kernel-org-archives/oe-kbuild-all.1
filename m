Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019E67B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 05:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682401893; x=1713937893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qk+lBsYsrsi/kYYti1rvGQmAo+g+l9F0084vSiFvSog=;
  b=O+vmOtO74TxbujAh+T5i0YMpdGK6NyJ8D+ygcXtLvkre9M+esWaN1agP
   z+LwGipuTOqMZWi0aU/2qlphEnKhGc8w/l7ExPcIHCdO0e11l1465gxVk
   0wuB/7GIzxFZZTSD6k5j3IYCpEV2/r8ou/M29Gh3jIv+QYEvJq7Goq4Hc
   p6xO8Qvo06KKixxvH91rg2M68oTt4rJY3ngYEMqTNB5ajm4oNypXqwdmD
   sBU2CTSAZLbec+75cmOeX/ekefGDWdmvHmqqMQo8i8X98fElcVC7F+UGm
   Z8au7msBdjrwO+XRSGs5ZDSTXkQVwEPYNYTuutPELRTSciYqOIwGt5tr4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="432927528"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="432927528"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 22:51:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="687246283"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="687246283"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Apr 2023 22:51:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prBaA-000j3Q-2P;
	Tue, 25 Apr 2023 05:51:18 +0000
Date: Tue, 25 Apr 2023 13:50:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-dai-ops-2023-04-25-v1 12/59]
 sound/soc/soc-core.c:256:5: warning: no previous prototype for
 'snd_soc_dlc_dai_is_match'
Message-ID: <202304251351.hzT6wo7q-lkp@intel.com>
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
commit: 1d91fc9c466eb125b9090cff5782307aceb77c47 [12/59] ASoC: soc-dai.c: add DAI get/match functions
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230425/202304251351.hzT6wo7q-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/morimoto/linux/commit/1d91fc9c466eb125b9090cff5782307aceb77c47
        git remote add morimoto https://github.com/morimoto/linux
        git fetch --no-tags morimoto sound-dai-ops-2023-04-25-v1
        git checkout 1d91fc9c466eb125b9090cff5782307aceb77c47
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304251351.hzT6wo7q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-core.c:256:5: warning: no previous prototype for 'snd_soc_dlc_dai_is_match' [-Wmissing-prototypes]
     256 | int snd_soc_dlc_dai_is_match(const struct snd_soc_dai_link_component *dlc, struct snd_soc_dai *dai)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/snd_soc_dlc_dai_is_match +256 sound/soc/soc-core.c

   255	
 > 256	int snd_soc_dlc_dai_is_match(const struct snd_soc_dai_link_component *dlc, struct snd_soc_dai *dai)
   257	{
   258		if (dlc->dai_name) {
   259			/* see snd_soc_dai_name_get() */
   260			if (dai->driver->name)
   261				return strcmp(dlc->dai_name, dai->driver->name) == 0;
   262	
   263			if (dai->name)
   264				return strcmp(dlc->dai_name, dai->name) == 0;
   265	
   266			if (dai->component->name)
   267				return strcmp(dlc->dai_name, dai->component->name) == 0;
   268		}
   269	
   270		return 0;
   271	}
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
