Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BF9817
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 06:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674456841; x=1705992841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DBrZuLNdZ/t6tCOEtQeotOKAquVCIi5y1AX8csAoNdI=;
  b=NQxeIw47rqUd0wOMXlA8VbBNwTOU3GBWzOrZAK7z2k6GlQ1URihpOyKk
   MM0XN80UqLw0TQDxtVcLZD7aEiFNOxRoYVXW64j8PlbRhnS/P+2togG8z
   QMsv7NlA7bKYmC4Kuw+2I5pw1QW077GSfxnY0EHnVx65RIWgr5jET6Vve
   oWeyJcvKwtxs4ija9qUAR9Afj8gAjrf7O/iJYcJmbWQC37SGqF3BaiKz1
   2xvUlJnNfwF08pYuHxpwGZtCOWZYRgVnnQI0JRjIhVNL9I1SCxycbynBx
   eilhNgV0OOc4JsEY8PoG3mhofK6+MFqvOIOzKCFcdA4bhMTMu/HX1jXe9
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="390485374"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="390485374"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 22:54:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="693735995"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="693735995"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Jan 2023 22:53:59 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJqiN-0005To-03;
	Mon, 23 Jan 2023 06:53:59 +0000
Date: Mon, 23 Jan 2023 14:53:26 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.14 26/48]
 drivers/memory/atmel-sdramc.c:62:9: error: implicit declaration of function
 'devm_clk_get_enabled'; did you mean 'devm_clk_get'?
Message-ID: <202301231417.EFDqGflX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.14
head:   af839d8756e8b40cb9b53ada292e056f1a75340b
commit: 02e64d17d36480463a28488d15febf91da208c0b [26/48] memory: atmel-sdramc: Fix missing clk_disable_unprepare in atmel_ramc_probe()
config: arm-randconfig-r024-20230123 (https://download.01.org/0day-ci/archive/20230123/202301231417.EFDqGflX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=02e64d17d36480463a28488d15febf91da208c0b
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-4.14
        git checkout 02e64d17d36480463a28488d15febf91da208c0b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/memory/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/memory/atmel-sdramc.c: In function 'atmel_ramc_probe':
>> drivers/memory/atmel-sdramc.c:62:9: error: implicit declaration of function 'devm_clk_get_enabled'; did you mean 'devm_clk_get'? [-Werror=implicit-function-declaration]
      clk = devm_clk_get_enabled(&pdev->dev, "ddrck");
            ^~~~~~~~~~~~~~~~~~~~
            devm_clk_get
>> drivers/memory/atmel-sdramc.c:62:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      clk = devm_clk_get_enabled(&pdev->dev, "ddrck");
          ^
   drivers/memory/atmel-sdramc.c:68:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      clk = devm_clk_get_enabled(&pdev->dev, "mpddr");
          ^
   cc1: some warnings being treated as errors


vim +62 drivers/memory/atmel-sdramc.c

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
