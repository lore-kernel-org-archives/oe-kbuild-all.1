Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996E9657
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 20:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678308666; x=1709844666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ekNnRc9bVNbrEGAoemQAtszrJBdp1aKfrI5BQfMZzlg=;
  b=Dnx5TeOrYI8nZAYFh8OrHb+dZNT2rEtdhLaOjtktfYbotmlIYJVsJxHy
   mJRuouz1lkHPQn9SDFQpDRyAGdgM88Diraw6INC9NieAA+NXi47+SiMYa
   907CWtoW4U7u3dxrz3JEYhkS6+eRGPrJIv2mfdeNvDqSy/d3SfhMr0EnP
   zMp4LsHTHkrZfcLtpParo8KC30bjSY7jmUjVlMz4kAsW1B+yCO93IYx0v
   7Qdvhu0c9dlOyLo3KC8O7ZF8b8yvnZ72PVJbd62hVCaMg5ADZ89b2U9Or
   a1tmQZayS63q5katxIReowl4bnCQQRAT4mGVELYSq2NN+RrxmVR7flKzl
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="320103107"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="320103107"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 12:51:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="670468948"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="670468948"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 Mar 2023 12:50:58 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa0kT-0002OX-1V;
	Wed, 08 Mar 2023 20:50:57 +0000
Date: Thu, 9 Mar 2023 04:50:43 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 4/7] soc: qcom: Make the Qualcomm UFS/SDCC ICE a
 dedicated driver
Message-ID: <202303090452.BnFbrmdA-lkp@intel.com>
References: <20230308155838.1094920-5-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308155838.1094920-5-abel.vesa@linaro.org>

Hi Abel,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on robh/for-next]
[also build test ERROR on mkp-scsi/for-next jejb-scsi/for-next linus/master v6.3-rc1 next-20230308]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/dt-bindings-soc-qcom-Add-schema-for-Inline-Crypto-Engine/20230309-000152
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230308155838.1094920-5-abel.vesa%40linaro.org
patch subject: [RFC PATCH v2 4/7] soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230309/202303090452.BnFbrmdA-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/633203cb3c00e8a4fc2cb442e3ff8bc16a4a685c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Abel-Vesa/dt-bindings-soc-qcom-Add-schema-for-Inline-Crypto-Engine/20230309-000152
        git checkout 633203cb3c00e8a4fc2cb442e3ff8bc16a4a685c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090452.BnFbrmdA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/qcom/ice.c: In function 'qcom_ice_check_supported':
>> drivers/soc/qcom/ice.c:48:21: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      48 |         int major = FIELD_GET(GENMASK(31, 24), regval);
         |                     ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +48 drivers/soc/qcom/ice.c

    36	
    37	#define qcom_ice_writel(engine, val, reg)	\
    38		writel((val), (engine)->base + (reg))
    39	
    40	#define qcom_ice_readl(engine, reg)	\
    41		readl((engine)->base + (reg))
    42	
    43	/* Only one ICE instance is currently supported by HW */
    44	static bool qcom_ice_check_supported(struct qcom_ice *ice)
    45	{
    46		u32 regval = qcom_ice_readl(ice, QCOM_ICE_REG_VERSION);
    47		struct device *dev = ice->dev;
  > 48		int major = FIELD_GET(GENMASK(31, 24), regval);
    49		int minor = FIELD_GET(GENMASK(23, 16), regval);
    50		int step = FIELD_GET(GENMASK(15, 0), regval);
    51	
    52		/* For now this driver only supports ICE version 3. */
    53		if (major != 3) {
    54			dev_warn(dev, "Unsupported ICE version: v%d.%d.%d\n",
    55				 major, minor, step);
    56			return false;
    57		}
    58	
    59		dev_info(dev, "Found QC Inline Crypto Engine (ICE) v%d.%d.%d\n",
    60			 major, minor, step);
    61	
    62		/* If fuses are blown, ICE might not work in the standard way. */
    63		regval = qcom_ice_readl(ice, QCOM_ICE_REG_FUSE_SETTING);
    64		if (regval & (QCOM_ICE_FUSE_SETTING_MASK |
    65			      QCOM_ICE_FORCE_HW_KEY0_SETTING_MASK |
    66			      QCOM_ICE_FORCE_HW_KEY1_SETTING_MASK)) {
    67			dev_warn(dev, "Fuses are blown; ICE is unusable!\n");
    68			return false;
    69		}
    70	
    71		return true;
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
