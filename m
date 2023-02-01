Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C745C2F5E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 13:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675258591; x=1706794591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uLqL2bctvHOJKvWRhlv3K2vVHsVETIGXDpz82PZw6j0=;
  b=URqpUtsMcdnkKn1jCZURYvWOzvZ0SMIkRu/W3+ZiwEoYFzM3K1HuDCEG
   ZVDvPIv14YeTFGC0UgIGhJkzHYhOIZokA85fFlSjyj7zuYaE1ikNT4oqR
   Hpii/53Txd87kkJQ6HbwxX4jaw+bF70pbvOEYr7cOHZOCt0YdiE/7pklZ
   fe/D2hQ0emQXPevsDG9+raOMUSxSHk5JsR2VGNNFCjOFd2BrJyxiS2Zvy
   0jAsh76iKjp8ODfoYtUF1mZcNkyAn86kJeNIMaOkEILV/aHzJ2PoFpII6
   hBzjfivR1fx2T1MrXGVVNmldXMZD7RvKPZlo4qhDlAViLvJvKJNuiVt+B
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="308483041"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="308483041"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 05:36:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="788888307"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="788888307"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Feb 2023 05:36:28 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNDHn-0005TF-2Y;
	Wed, 01 Feb 2023 13:36:27 +0000
Date: Wed, 1 Feb 2023 21:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-stable-rc:queue/4.19 1/66]
 drivers/memory/atmel-sdramc.c:62:23: error: implicit declaration of function
 'devm_clk_get_enabled'
Message-ID: <202302012152.IA9WllvH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/4.19
head:   923e939ad273761d537bc8b4e314e7fbac1d975d
commit: e283c92e9ef8852a075bed84d3427a0704159f9c [1/66] memory: atmel-sdramc: Fix missing clk_disable_unprepare in atmel_ramc_probe()
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230201/202302012152.IA9WllvH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=e283c92e9ef8852a075bed84d3427a0704159f9c
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/4.19
        git checkout e283c92e9ef8852a075bed84d3427a0704159f9c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/memory/atmel-sdramc.c: In function 'atmel_ramc_probe':
>> drivers/memory/atmel-sdramc.c:62:23: error: implicit declaration of function 'devm_clk_get_enabled' [-Werror=implicit-function-declaration]
      62 |                 clk = devm_clk_get_enabled(&pdev->dev, "ddrck");
         |                       ^~~~~~~~~~~~~~~~~~~~
   drivers/memory/atmel-sdramc.c:62:21: warning: assignment to 'struct clk *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      62 |                 clk = devm_clk_get_enabled(&pdev->dev, "ddrck");
         |                     ^
   drivers/memory/atmel-sdramc.c:68:21: warning: assignment to 'struct clk *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      68 |                 clk = devm_clk_get_enabled(&pdev->dev, "mpddr");
         |                     ^
   cc1: some warnings being treated as errors


vim +/devm_clk_get_enabled +62 drivers/memory/atmel-sdramc.c

    53	
    54	static int atmel_ramc_probe(struct platform_device *pdev)
    55	{
    56		const struct at91_ramc_caps *caps;
    57		struct clk *clk;
    58	
    59		caps = of_device_get_match_data(&pdev->dev);
    60	
    61		if (caps->has_ddrck) {
  > 62			clk = devm_clk_get_enabled(&pdev->dev, "ddrck");
    63			if (IS_ERR(clk))
    64				return PTR_ERR(clk);
    65		}
    66	
    67		if (caps->has_mpddr_clk) {
    68			clk = devm_clk_get_enabled(&pdev->dev, "mpddr");
    69			if (IS_ERR(clk)) {
    70				pr_err("AT91 RAMC: couldn't get mpddr clock\n");
    71				return PTR_ERR(clk);
    72			}
    73		}
    74	
    75		return 0;
    76	}
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
