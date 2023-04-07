Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB935A46
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 01:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680829341; x=1712365341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=l44n4DfXfnK2U+JdUfzGbbqRY+iwVbJ0t3nY6q0Wrdg=;
  b=mCjiQ9/vF0KZZBH3jIRVN1B9/Vbm/gNpFA5cRLCbYvJP7alp3I22rVmv
   pgmBtCwABxuM62TWx4nc8V7G264JZdSBul5Ujv+5nA3DPlZ+Rujbg42LN
   HjW/OKAgeIFPdbakaYj45Da2iWOBZWf2JaNqu1w3OteICvU9VE7/VwfS3
   /JaNwlsrsB1hdUtJQiSvC7PPyU3Qb3aKmEzo9Rc/YF6gLrW5hmIxC/xun
   p9S30KupjOLI413jID7Hvq7i5RC5rfcQlJfIYfyMR1ffIgD1zwvgPFLqC
   vzhGASxvh8Vmflt+rY2pnpJIseRQGCgfVufAr24LTQmBArYXRAyzsbTdh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="429171454"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="429171454"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 18:02:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="756525155"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="756525155"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Apr 2023 18:02:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkaUd-000RxM-29;
	Fri, 07 Apr 2023 01:02:19 +0000
Date: Fri, 7 Apr 2023 09:02:03 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next RFC v4 4/5] net: Let the active time stamping
 layer be selectable.
Message-ID: <202304070815.SZz8unLJ-lkp@intel.com>
References: <20230406173308.401924-5-kory.maincent@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230406173308.401924-5-kory.maincent@bootlin.com>

Hi Köry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/K-ry-Maincent/net-ethtool-Refactor-identical-get_ts_info-implementations/20230407-013517
patch link:    https://lore.kernel.org/r/20230406173308.401924-5-kory.maincent%40bootlin.com
patch subject: [PATCH net-next RFC v4 4/5] net: Let the active time stamping layer be selectable.
config: parisc-randconfig-r011-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070815.SZz8unLJ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/33059abec2b9e9f064c3a8ac681fc91bf857d888
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review K-ry-Maincent/net-ethtool-Refactor-identical-get_ts_info-implementations/20230407-013517
        git checkout 33059abec2b9e9f064c3a8ac681fc91bf857d888
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070815.SZz8unLJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: hppa-linux-ld: DWARF error: could not find abbrev number 88
   net/core/dev_ioctl.o: in function `__dev_eth_ioctl':
>> dev_ioctl.c:(.text+0x254): undefined reference to `phy_mii_ioctl'
   hppa-linux-ld: net/core/dev_ioctl.o: in function `.LC0':
>> dev_ioctl.c:(.rodata.cst4+0x0): undefined reference to `phy_do_ioctl'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
