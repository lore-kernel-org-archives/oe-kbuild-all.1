Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22038BD12
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 04:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674965564; x=1706501564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2gbhL4C0dsuascfNB2Cf58aoG5ppAOxbOutSsyOfwpE=;
  b=K4XsJV/9cvicxytMP7wTNKzPwK/3Pl1HpnQXMwrGbOoXG7qlCsk4+1R9
   TWGqzgy90tqpWzpgfnxMwWmnElFW8alrsIitCtWsiA0YxAXBFmKlG7bSI
   l0xv75QEa5mkYDH1IPfrO5vaxMmQq6jtzX57d4ujsidNXPexa2qtKJF8z
   hcWo768yhgO+7t+S5dMUisfBNsGK9iUOTYy18FG5XcaA3/ZCYMRxk7FoF
   9l8a6PofY8DgePmuXbDfVfa2gFSB6TAOgklCR32U/pil1oscPUfVBO8mB
   Q6OUBYgkvI1OApffdtkk0uFbpSfk2Ar8jecuQXNFeWHZpfwbbGMcHGwIz
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="310982873"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="310982873"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 20:12:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="752416786"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="752416786"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Jan 2023 20:12:41 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLz3Y-0002SM-2K;
	Sun, 29 Jan 2023 04:12:40 +0000
Date: Sun, 29 Jan 2023 12:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Aswath Govindraju <a-govindraju@ti.com>
Subject: drivers/gpio/gpio-davinci.c:704:1: sparse: sparse: symbol
 'davinci_gpio_dev_pm_ops' was not declared. Should it be static?
Message-ID: <202301291241.d3xh6GiJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c96618275234ad03d44eafe9f8844305bb44fda4
commit: 0651a730924b172476f67c7c6e01e898f84cd8f3 gpio: davinci: Add support for system suspend/resume PM
date:   6 months ago
config: arm64-randconfig-s051-20230129 (https://download.01.org/0day-ci/archive/20230129/202301291241.d3xh6GiJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0651a730924b172476f67c7c6e01e898f84cd8f3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0651a730924b172476f67c7c6e01e898f84cd8f3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-davinci.c:704:1: sparse: sparse: symbol 'davinci_gpio_dev_pm_ops' was not declared. Should it be static?

vim +/davinci_gpio_dev_pm_ops +704 drivers/gpio/gpio-davinci.c

   699	
   700	DEFINE_SIMPLE_DEV_PM_OPS(davinci_gpio_dev_pm_ops, davinci_gpio_suspend,
   701				 davinci_gpio_resume);
   702	
   703	static const struct of_device_id davinci_gpio_ids[] = {
 > 704		{ .compatible = "ti,keystone-gpio", keystone_gpio_get_irq_chip},
   705		{ .compatible = "ti,am654-gpio", keystone_gpio_get_irq_chip},
   706		{ .compatible = "ti,dm6441-gpio", davinci_gpio_get_irq_chip},
   707		{ /* sentinel */ },
   708	};
   709	MODULE_DEVICE_TABLE(of, davinci_gpio_ids);
   710	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
