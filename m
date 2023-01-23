Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DD5A21
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 07:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674459305; x=1705995305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9u6kgLgJHFhWoV091raryGvZaNLEWviXKdBUt3dVvmg=;
  b=lNQHpPpHXDWRi2aEneG5yFRsRMbenbZ6PACq8Zk/kmZ1fiPQBSSjz7Nl
   WM15kmK7GgA2GB2WZU2jruk9Y4q5Xw7jsC4rA3iZQ9hvPW1DpOjVviVpK
   BMRv2TJgGHZqMSKbzSl1v89Su0cKHyTTTzx3AaxDTveW/pUmj8AWJpCmS
   yTcCh2mu9cNpMuoJ8+ptvSVu3cjZskSu+++sgxW63Y3F0DRESVO59gnIE
   07SH6F/IUyf9q9fVJRJMLRnqdk7lYqvG97re22p0/nwoQSz6/LkuZI6le
   dv0bZZemS0DRXWiLDe1rISW88BysO/XUxp8GX/XP4ZPTaYSNWH+5tXKpr
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="353249230"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="353249230"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 23:35:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="639041052"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="639041052"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Jan 2023 23:35:01 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJrM4-0005V4-0B;
	Mon, 23 Jan 2023 07:35:00 +0000
Date: Mon, 23 Jan 2023 15:34:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 38/72]
 drivers/memory/atmel-sdramc.c:62:21: warning: assignment to 'struct clk *'
 from 'int' makes pointer from integer without a cast
Message-ID: <202301231522.0K8IfRgZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   63b7af8b6594d0f0bf80efe27747e0470b8ad027
commit: 3eff8c56965cb20768bd8c93a5e8de24516196f6 [38/72] memory: atmel-sdramc: Fix missing clk_disable_unprepare in atmel_ramc_probe()
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230123/202301231522.0K8IfRgZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=3eff8c56965cb20768bd8c93a5e8de24516196f6
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-4.19
        git checkout 3eff8c56965cb20768bd8c93a5e8de24516196f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/dma/xilinx/ drivers/memory/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/memory/atmel-sdramc.c: In function 'atmel_ramc_probe':
   drivers/memory/atmel-sdramc.c:62:23: error: implicit declaration of function 'devm_clk_get_enabled' [-Werror=implicit-function-declaration]
      62 |                 clk = devm_clk_get_enabled(&pdev->dev, "ddrck");
         |                       ^~~~~~~~~~~~~~~~~~~~
>> drivers/memory/atmel-sdramc.c:62:21: warning: assignment to 'struct clk *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      62 |                 clk = devm_clk_get_enabled(&pdev->dev, "ddrck");
         |                     ^
   drivers/memory/atmel-sdramc.c:68:21: warning: assignment to 'struct clk *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      68 |                 clk = devm_clk_get_enabled(&pdev->dev, "mpddr");
         |                     ^
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
