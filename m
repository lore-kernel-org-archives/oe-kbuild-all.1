Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94888463
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 May 2023 15:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685372622; x=1716908622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gwa9wLEbsHpy/LTAGTDN+oeTljoKUpk+7jvHYDIpUb4=;
  b=Y+bf4qWsB2inwHrZLmlnyyta5Zieg+V+bfmVc/I1cjlp5B0fMaWpVb5G
   diLZneQcDQKKcGYsVBOhWDiYnHLBNYgIaKD/HY9KvY2xasMvJm9b4MQLf
   d2h+RK1mTndIcMtjXMh2+I9XnJrM6YgirAT20VoSJieoy6GXOakfgwmPo
   ePH8yJf4jnNAfXTGuxSt3iAtChHnZSXVTi61jcKtQ2Ufd0A2usS0NwKBD
   6+O0hprGb2ctz5AN/QjCIa1J+7GtsfA9sbOH+7jH2Uct0Z3sk478lS1XO
   uBza0kAaFoYjKOfjNfHHY70jcJzdlaYwPBgyTmRnUqQtXySd0US7vtb2o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="420480847"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="420480847"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 08:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="739190078"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="739190078"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 May 2023 08:03:40 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3ePM-000L1q-0k;
	Mon, 29 May 2023 15:03:40 +0000
Date: Mon, 29 May 2023 23:02:58 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 2/11] drivers/cxl/core/region.c:622:11: error: initializing
 'struct attribute **' with an expression of type 'const struct attribute
 *[8]' discards qualifiers in nested pointer types
Message-ID: <202305292217.isfvqDM9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   c81db35145ac2ec46628bbddefee2b381bdd1c6d
commit: 919fc91d80c06fc9f42723d80506cbae7beefc79 [2/11] cxl: Constify sysfs attribute groups
config: i386-randconfig-i051-20230529 (https://download.01.org/0day-ci/archive/20230529/202305292217.isfvqDM9-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/919fc91d80c06fc9f42723d80506cbae7beefc79
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k doe
        git checkout 919fc91d80c06fc9f42723d80506cbae7beefc79
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cxl/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305292217.isfvqDM9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cxl/core/region.c:622:11: error: initializing 'struct attribute **' with an expression of type 'const struct attribute *[8]' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .attrs = cxl_region_attrs,
                    ^~~~~~~~~~~~~~~~
   drivers/cxl/core/region.c:1905:11: error: initializing 'struct attribute **' with an expression of type 'const struct attribute *[17]' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .attrs = target_attrs,
                    ^~~~~~~~~~~~
   2 errors generated.


vim +622 drivers/cxl/core/region.c

dd5ba0ebbdc414f Ben Widawsky 2021-05-27  620  
dd5ba0ebbdc414f Ben Widawsky 2021-05-27  621  static const struct attribute_group cxl_region_group = {
dd5ba0ebbdc414f Ben Widawsky 2021-05-27 @622  	.attrs = cxl_region_attrs,
dd5ba0ebbdc414f Ben Widawsky 2021-05-27  623  	.is_visible = cxl_region_visible,
dd5ba0ebbdc414f Ben Widawsky 2021-05-27  624  };
dd5ba0ebbdc414f Ben Widawsky 2021-05-27  625  

:::::: The code at line 622 was first introduced by commit
:::::: dd5ba0ebbdc414f4dda4dc4ec076f46fb6f26ffd cxl/region: Add a 'uuid' attribute

:::::: TO: Ben Widawsky <bwidawsk@kernel.org>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
