Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E56915C0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 01:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675561326; x=1707097326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JGYVo1RZJVNUBLdPobzm3WqBXXo8QaF8V2av2xGECYI=;
  b=TEWpRU0pKmkVSnc+GTuTRjXHEo7cSl0X+49R+TYaC8ZvRTxGja21tgaH
   DfAu06k8V73i65i31mzCTGaIVuTMdRH/VU5vB2IMgFnSulc8y/kUE2Jqm
   yG4GOuyZqzFP8X/nhn9XxO9173j/SieK0l3kI9qg1W7tLXpKZriW7jMgJ
   8Qh2KA6fT02PVTj5gcP9gpJpvGmiqu++ItEHlW7DzLaE11j/WsZOKk8PE
   h9Av6f+drpF4/PEjQ/eONt5zslwsxrrGyz4l1cRzNdigzVJRri2Gmn0MR
   NbAf5S9PdwNaV0J4VFp6o2sMT7AUQs7RYabufTt0ZJK8KB+uhlCv4rilT
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="327641888"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="327641888"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 17:42:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="616094893"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="616094893"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Feb 2023 17:42:03 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOU2d-0001e0-0K;
	Sun, 05 Feb 2023 01:42:03 +0000
Date: Sun, 5 Feb 2023 09:41:25 +0800
From: kernel test robot <lkp@intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Aswath Govindraju <a-govindraju@ti.com>
Subject: drivers/gpio/gpio-davinci.c:704:1: sparse: sparse: symbol
 'davinci_gpio_dev_pm_ops' was not declared. Should it be static?
Message-ID: <202302050901.FR4NtarP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   95078069c1e70d1b3b141132d18d0c563acedd0c
commit: 0651a730924b172476f67c7c6e01e898f84cd8f3 gpio: davinci: Add support for system suspend/resume PM
date:   7 months ago
config: arm64-randconfig-s053-20230205 (https://download.01.org/0day-ci/archive/20230205/202302050901.FR4NtarP-lkp@intel.com/config)
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
