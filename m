Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D30B33C4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 11:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681902952; x=1713438952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZDAIH7VGC2PTDjC+WiK47ThxiMhVDJh+ytsPf9d9/CQ=;
  b=akcVfy7b1uQWMdJK5u27BK6oJ0tZxawfZRgBfDvtaaCK9bGT4eHjefF2
   on+k7Kg8WBrETJyZFSuqcQoYaeDEsO10wjWNs8Y2ypqVNM48VwQqf7wrm
   bWh2KySnaqBFsMnT+2RU/oD+Xl4QMthp+TBVk1uj8rBPf4w7QDHJq0e58
   Mlj2wBRy0q7Uoum2xysoZOwxV4VnFqSh9duDQA6brZwaigaeKgtKYJZAh
   Lfng3lzreh1CC5aPdXSr4sxTrXOCmV5y6KKnq++jkMbjxodV4R8IA6omF
   FC9uyJ8ElPrYkNOKslc25nIATbr9YS1ie9Cuvbw9LY+TWtqBgDyjStBLf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="410648625"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="410648625"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 04:15:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="937634870"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="937634870"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Apr 2023 04:15:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pp5mu-000eq7-0e;
	Wed, 19 Apr 2023 11:15:48 +0000
Date: Wed, 19 Apr 2023 19:15:42 +0800
From: kernel test robot <lkp@intel.com>
To: Dhruva Gole <d-gole@ti.com>, Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Dhruva Gole <d-gole@ti.com>,
	Vaishnav Achath <vaishnav.a@ti.com>, Vignesh <vigneshr@ti.com>,
	Apurva Nandan <a-nandan@ti.com>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] spi: cadence-quadspi: use macro
 DEFINE_SIMPLE_DEV_PM_OPS
Message-ID: <202304191900.2fARFQW9-lkp@intel.com>
References: <20230419084817.481136-1-d-gole@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419084817.481136-1-d-gole@ti.com>

Hi Dhruva,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230418]
[also build test ERROR on linus/master v6.3-rc7]
[cannot apply to broonie-spi/for-next v6.3-rc7 v6.3-rc6 v6.3-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dhruva-Gole/spi-cadence-quadspi-use-macro-DEFINE_SIMPLE_DEV_PM_OPS/20230419-165052
patch link:    https://lore.kernel.org/r/20230419084817.481136-1-d-gole%40ti.com
patch subject: [PATCH V2] spi: cadence-quadspi: use macro DEFINE_SIMPLE_DEV_PM_OPS
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230419/202304191900.2fARFQW9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/83ce1615dd395c8034756cc6aa97b38c16c0b07d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dhruva-Gole/spi-cadence-quadspi-use-macro-DEFINE_SIMPLE_DEV_PM_OPS/20230419-165052
        git checkout 83ce1615dd395c8034756cc6aa97b38c16c0b07d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304191900.2fARFQW9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-cadence-quadspi.c:1918:24: error: 'cqspi_dev_pm_ops' undeclared here (not in a function); did you mean 'cqspi_mem_ops'?
    1918 |                 .pm = &cqspi_dev_pm_ops,
         |                        ^~~~~~~~~~~~~~~~
         |                        cqspi_mem_ops


vim +1918 drivers/spi/spi-cadence-quadspi.c

  1912	
  1913	static struct platform_driver cqspi_platform_driver = {
  1914		.probe = cqspi_probe,
  1915		.remove_new = cqspi_remove,
  1916		.driver = {
  1917			.name = CQSPI_NAME,
> 1918			.pm = &cqspi_dev_pm_ops,
  1919			.of_match_table = cqspi_dt_ids,
  1920		},
  1921	};
  1922	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
