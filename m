Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A435110A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 18:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686422202; x=1717958202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zoq5aSIWKXhIkZ8vyPC/sp7ZlJXARkQ6BkpXREIC/ME=;
  b=laSHEc2iBwU42jb4X0Hnpu4D5g/oBfijEDU0wboaK/zIOEgMsPcoJIoT
   mnCXg5e8/2MmtilRmxOAeQ7WQh4c0FyIp7Deq+Rgw6Fk/mjbdPBPBxBXQ
   bfynlOO+0MjRwhOUgKP/7gXvG1VWfGy3p1GhdY0FTsc08NTon5PU7LYSx
   MOf8njoHktBuO3PgQm1Jq+RDgZ/5N2bNJ3xowqrwncbuPxzAqEB+5gq/g
   MmWgXRws3YmuH+58Ml+NHRcP+AaMdNpWCVm8HCxxzgX+WfryynSNLTPQW
   05wn50qwJ3mGDFv3e8vHUOsqq0hOjH3GduE3m1h+/ns/zYEI5ViBTvFe2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="421387829"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="421387829"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 11:36:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="855099499"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="855099499"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2023 11:36:40 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q83S3-000AMC-2t;
	Sat, 10 Jun 2023 18:36:39 +0000
Date: Sun, 11 Jun 2023 02:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:regcache-raw-kunit 3/3] ERROR: modpost:
 "__regmap_init_raw_ram" [drivers/base/regmap/regmap-kunit.ko] undefined!
Message-ID: <202306110234.Nh8eZVQ0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git regcache-raw-kunit
head:   fb8380b5b67d85540ef032c2c48c5e9dc3c45f55
commit: fb8380b5b67d85540ef032c2c48c5e9dc3c45f55 [3/3] regmap: Provide basic KUnit coverage for the raw register I/O
config: parisc-buildonly-randconfig-r006-20230611 (https://download.01.org/0day-ci/archive/20230611/202306110234.Nh8eZVQ0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=fb8380b5b67d85540ef032c2c48c5e9dc3c45f55
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci regcache-raw-kunit
        git checkout fb8380b5b67d85540ef032c2c48c5e9dc3c45f55
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306110234.Nh8eZVQ0-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: drivers/base/regmap/regmap-raw-ram: '__regmap_init_ram' exported twice. Previous export was in drivers/base/regmap/regmap-ram.ko
>> ERROR: modpost: "__regmap_init_raw_ram" [drivers/base/regmap/regmap-kunit.ko] undefined!
ERROR: modpost: "__regmap_init_ram" [drivers/base/regmap/regmap-raw-ram.ko] was exported without definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
