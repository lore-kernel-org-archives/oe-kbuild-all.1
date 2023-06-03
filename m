Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C085197
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jun 2023 00:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685751253; x=1717287253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mV5e1Hnq07g551uwzC226d+w5qtZ9w+Zk2ndFYOJh4s=;
  b=PVI5W3DtLQbukDou18cJtgeJgnyIx9HOW0VFv+Z358NP1lDkoYqLfqMD
   ytrBCe4m4RiDLs1sfRredxX0XyWZddokg7kRZt1ndkt83kV+ZRnewCJeq
   AIj7cfujL9wjP/BnKF37Ocz/ZQlktOmyb3DKUspls4xp1zQFZWkvU2JvX
   26fG0q3z/tp1a5xPGZAeig87HuUT2+Wfbm5JyM6DV4BPik7RdsR2Unnab
   8qYXXVxRMA2i8Q7JLNVvLR2keteu3cH8W8rSTszsAR4UUHucCY3icFr9o
   5rgiiL2ZGphC3oo/oyzURmSgK4pcMBbV+JiogZmIwZB1/a+F5hdMCsVxg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="353497866"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="353497866"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 17:12:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="797761721"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="797761721"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Jun 2023 17:12:07 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5EsI-00014f-14;
	Sat, 03 Jun 2023 00:12:06 +0000
Date: Sat, 3 Jun 2023 08:11:11 +0800
From: kernel test robot <lkp@intel.com>
To: Brent Lu <brent.lu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ranjan Dutta <ranjan.dutta@intel.com>,
	Bard Liao <bard.liao@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [intel-lts:5.10/yocto 14/27] ERROR: modpost: "sof_dai_get_bclk"
 [sound/soc/intel/boards/snd-soc-intel-sof-cirrus-common.ko] undefined!
Message-ID: <202306030818.hAZxp1VC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   37a4db0e223afb2dcefa8dedf2107011e9bf447c
commit: 9a88fb0ffebe240db18f71e3a5c49ac40a627429 [14/27] ASoC: SOF: add a helper to get topology configured bclk
config: i386-randconfig-i002-20230531 (https://download.01.org/0day-ci/archive/20230603/202306030818.hAZxp1VC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel/linux-intel-lts/commit/9a88fb0ffebe240db18f71e3a5c49ac40a627429
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout 9a88fb0ffebe240db18f71e3a5c49ac40a627429
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306030818.hAZxp1VC-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_LICENSE() in sound/soc/intel/boards/snd-soc-intel-hda-dsp-common.o
>> ERROR: modpost: "sof_dai_get_bclk" [sound/soc/intel/boards/snd-soc-intel-sof-cirrus-common.ko] undefined!
>> ERROR: modpost: "sof_dai_get_mclk" [sound/soc/intel/boards/snd-soc-intel-sof-realtek-common.ko] undefined!
ERROR: modpost: "__moddi3" [drivers/net/ethernet/intel/igc/igc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
