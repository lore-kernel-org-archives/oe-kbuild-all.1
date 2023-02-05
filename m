Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463637B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 06:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675579873; x=1707115873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EhKuWWwq+09FzVnax3NjxOWKQQIwf3qLdVwrQbRIHqY=;
  b=mEU+XTsH4mE4pFPQvHHDjcBDX7CaQifStoBly3AJ2BxrJzxi5ubgpSMN
   GEmFHRwKBRNxJtZgteGajn2wbFjJdJbsty2xEyPLeikFSbwR8godaZcs2
   ymlDDcQBhz0cbrc2b5jqaDH4aDtcYhELE2u/YVESJe2D8FU09EdXlrw1g
   69DW2bgpIMMULLp6LtYoCXsd7V5eMs6dKC8WuhOnyh9+ToAB4TI7nplZS
   KNYeflMyV2gC5bFhR9xfv+5W6EZmLpnN4uwOoSY0AQisZt6wj4VQ/AFLm
   azHeiVoz7/6kECL7Hqr/JKCBvDUmI9BamqkDInjPqYZdaVbDCH1gc70lz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="330314717"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="330314717"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 22:51:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="790121113"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="790121113"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Feb 2023 22:51:12 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOYrn-0001oB-0y;
	Sun, 05 Feb 2023 06:51:11 +0000
Date: Sun, 5 Feb 2023 14:50:16 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 14597/20209] ERROR: modpost:
 "__divdi3" [sound/soc/fsl/snd-soc-fsl-xcvr.ko] undefined!
Message-ID: <202302051416.2wMShobJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chancel,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: e8119d420e52befc919c1dbe609d467436382a13 [14597/20209] MLK-25951-2: ASoC: fsl_xcvr: Add soc data of i.MX93
config: xtensa-randconfig-r036-20230205 (https://download.01.org/0day-ci/archive/20230205/202302051416.2wMShobJ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/e8119d420e52befc919c1dbe609d467436382a13
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout e8119d420e52befc919c1dbe609d467436382a13
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: missing MODULE_LICENSE() in drivers/video/fbdev/mxc/mxc_edid.o
>> ERROR: modpost: "__divdi3" [sound/soc/fsl/snd-soc-fsl-xcvr.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
