Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A09F19B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 23:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675811201; x=1707347201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6zdVLq5NteMHzzmM86PV+wLFZcbxgMiXNEPBmZpgIMk=;
  b=REr2wlvxYymw33fzFu3seiZy6lJJXWX+zXumi5nyCWpmmbTV97WEqy6F
   t3aahbylsO0uOWpz0KiRDLhRPJ61+UqbJA5laVxKnb+jCTynFS7hKyUxT
   ZS7S+l82W6e2RL2DYmNpeQQwwgpMTWh1HsoDfF4toZ142ZQP0j61ZjYnf
   VjF523RLeX61PNDRot8BGBV3xBA3GizdJFCioj+/SiqFlSaK5H0zwkxM0
   XoRfzPa+xe9v+TdKEkgKf3bVuK2eBoqtKud0av0cHB4xMQAnNdqUFYA47
   vCh8Oa2ysdPyYG385sSqr/bkdLF+zz8LO+jRC76/16fmFPt8372oyTAY8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="357032789"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="357032789"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 15:06:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="616986651"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="616986651"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Feb 2023 15:06:39 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPX2s-0003xq-2B;
	Tue, 07 Feb 2023 23:06:38 +0000
Date: Wed, 8 Feb 2023 07:05:52 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 06/12] gpiolib: split linux/gpio/driver.h out of
 linux/gpio.h
Message-ID: <202302080617.x8qGSBNL-lkp@intel.com>
References: <20230207142952.51844-7-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230207142952.51844-7-andriy.shevchenko@linux.intel.com>

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on brgl/gpio/for-next]
[cannot apply to powerpc/next powerpc/fixes soc/for-next linus/master v6.2-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/gpiolib-remove-empty-asm-gpio-h-files/20230207-223652
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20230207142952.51844-7-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v3 06/12] gpiolib: split linux/gpio/driver.h out of linux/gpio.h
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230208/202302080617.x8qGSBNL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c34b5f7d305e096c35a9b2587084ecde7ee165fb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/gpiolib-remove-empty-asm-gpio-h-files/20230207-223652
        git checkout c34b5f7d305e096c35a9b2587084ecde7ee165fb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/hte/hte-tegra194-test.c:96:34: error: array type has incomplete element type 'struct of_device_id'
      96 | static const struct of_device_id tegra_hte_test_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/hte/hte-tegra194-test.c:96:34: warning: 'tegra_hte_test_of_match' defined but not used [-Wunused-variable]


vim +96 drivers/hte/hte-tegra194-test.c

9a75a7cd03c957 Dipen Patel 2022-04-22   95  
9a75a7cd03c957 Dipen Patel 2022-04-22  @96  static const struct of_device_id tegra_hte_test_of_match[] = {
9a75a7cd03c957 Dipen Patel 2022-04-22   97  	{ .compatible = "nvidia,tegra194-hte-test"},
9a75a7cd03c957 Dipen Patel 2022-04-22   98  	{ }
9a75a7cd03c957 Dipen Patel 2022-04-22   99  };
9a75a7cd03c957 Dipen Patel 2022-04-22  100  MODULE_DEVICE_TABLE(of, tegra_hte_test_of_match);
9a75a7cd03c957 Dipen Patel 2022-04-22  101  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
