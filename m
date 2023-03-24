Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0445662
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 12:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679662158; x=1711198158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RMG+6EiK4FXdZYLpMcB51dOj7DhkicAwht/ezy/Twi4=;
  b=QBS4GXKS1stbYU1U5Gznuu9MZ97qvAIr7GDoCtOF1Mgnb8q9UEZ9H+Zh
   i5Ns8r2qfrg0U+CZ7juXXbNRniYdmByTVYCV0xElyNYCBPyFuEAKUgi1U
   HPfYSGjiymmt5sEyU9PIJNH38pgIHg66ke+maMXVllxPEUscPFcHQNjPH
   iElPnxtaerbuCvWMT62SjT3n9KSilWAhEMHZF8WIX/016kMYFbjpvYMel
   9gcFUwsbzzbyUnmKqueSCywmFQ7TQbLx/pG3KvI90bJM8AC0SSIcZKmnC
   x2XJJfTJaZwaFVZGxp4z7QdOhf+gna4MSsKULGSsQbGmd78Mp17fYiwfy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="323643109"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="323643109"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 05:49:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="715214165"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="715214165"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Mar 2023 05:49:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfgr5-000FK4-25;
	Fri, 24 Mar 2023 12:49:15 +0000
Date: Fri, 24 Mar 2023 20:48:37 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 5/7] net: mdio: Introduce a regmap-based mdio driver
Message-ID: <202303242009.BW09N8SV-lkp@intel.com>
References: <20230324093644.464704-6-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324093644.464704-6-maxime.chevallier@bootlin.com>

Hi Maxime,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on broonie-regmap/for-next]
[also build test WARNING on lee-mfd/for-mfd-next driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.3-rc3 next-20230324]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/regmap-add-a-helper-to-translate-the-register-address/20230324-173909
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next
patch link:    https://lore.kernel.org/r/20230324093644.464704-6-maxime.chevallier%40bootlin.com
patch subject: [RFC 5/7] net: mdio: Introduce a regmap-based mdio driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230324/202303242009.BW09N8SV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cb259fbfba2e078cfe013cb986496b6af0e55d21
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Chevallier/regmap-add-a-helper-to-translate-the-register-address/20230324-173909
        git checkout cb259fbfba2e078cfe013cb986496b6af0e55d21
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/net/mdio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303242009.BW09N8SV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/mdio/mdio-regmap.c: In function 'devm_mdio_regmap_register':
>> drivers/net/mdio/mdio-regmap.c:72:9: warning: 'strncpy' output may be truncated copying 61 bytes from a string of length 62 [-Wstringop-truncation]
      72 |         strncpy(mii->id, config->name, MII_BUS_ID_SIZE);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +72 drivers/net/mdio/mdio-regmap.c

    46	
    47	struct mii_bus *devm_mdio_regmap_register(struct device *dev,
    48						  const struct mdio_regmap_config *config)
    49	{
    50		struct mdio_regmap_config *mrc;
    51		struct mii_bus *mii;
    52		int rc;
    53	
    54		if (!config->parent)
    55			return ERR_PTR(-EINVAL);
    56	
    57		if (!config->valid_addr)
    58			return ERR_PTR(-EINVAL);
    59	
    60		mii = devm_mdiobus_alloc_size(config->parent, sizeof(*mrc));
    61		if (!mii)
    62			return ERR_PTR(-ENOMEM);
    63	
    64		mrc = mii->priv;
    65		memcpy(mrc, config, sizeof(*mrc));
    66	
    67		mrc->regmap = config->regmap;
    68		mrc->parent = config->parent;
    69		mrc->valid_addr = config->valid_addr;
    70	
    71		mii->name = DRV_NAME;
  > 72		strncpy(mii->id, config->name, MII_BUS_ID_SIZE);
    73		mii->parent = config->parent;
    74		mii->read = mdio_regmap_read_c22;
    75		mii->write = mdio_regmap_write_c22;
    76	
    77		rc = devm_mdiobus_register(dev, mii);
    78		if (rc) {
    79			dev_err(config->parent, "Cannot register MDIO bus![%s] (%d)\n", mii->id, rc);
    80			return ERR_PTR(rc);
    81		}
    82	
    83		return mii;
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
