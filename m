Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37605CB0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 May 2023 05:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683522690; x=1715058690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8rEGrb2GCYF3g4+08QiYzLUahN6v8CIbVxxQYzGXth8=;
  b=FTIuY2LRvAWc5VmjRhpwn5Tkrwc/dJrp+c99y/ozuWjcfPRinekBGAGS
   AIiKp+ADExQ4ambjecoH7AB4igY6TrbhcieUZIaACeqcKC0d5GRWBFI+0
   w7mEdfiZDKATlG/VG4p952i44aQVIkJXixA9vUwapYsJ+zgsvk9miFNFT
   1YSRh0yX8j3NIUAHkMpe2TroBXzAIljIGEAbGjMstDkAl0a3Md+akxHbr
   eH1cWcE+5/lZMVmNSmnsedh3PL94ko0ZDWBWrWSpU6BzyV7/4LOkRNME3
   jw1C9mMQUmbVXfZzOZlBqyB43oGiH8+ztrGqHHFAOq7n/HUlKi0iZ2Qu/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="333996100"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="333996100"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 22:11:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="698389389"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="698389389"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 May 2023 22:11:29 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvt9k-00013o-34;
	Mon, 08 May 2023 05:11:28 +0000
Date: Mon, 8 May 2023 13:10:59 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v11 6/7] media: i2c: add DS90UB913 driver
Message-ID: <202305081255.n5KHsShj-lkp@intel.com>
References: <20230421101833.345984-7-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421101833.345984-7-tomi.valkeinen@ideasonboard.com>

Hi Tomi,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on wsa/i2c/for-next linus/master sailus-media-tree/streams v6.4-rc1 next-20230505]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomi-Valkeinen/i2c-add-I2C-Address-Translator-ATR-support/20230421-182249
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230421101833.345984-7-tomi.valkeinen%40ideasonboard.com
patch subject: [PATCH v11 6/7] media: i2c: add DS90UB913 driver
config: mips-randconfig-c004-20230508 (https://download.01.org/0day-ci/archive/20230508/202305081255.n5KHsShj-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3aca9704bbf3d069accf3a026b749ec6f10745d4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tomi-Valkeinen/i2c-add-I2C-Address-Translator-ATR-support/20230421-182249
        git checkout 3aca9704bbf3d069accf3a026b749ec6f10745d4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305081255.n5KHsShj-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__clk_get_name" [drivers/media/i2c/ds90ub913.ko] undefined!
>> ERROR: modpost: "devm_clk_hw_register_fixed_factor" [drivers/media/i2c/ds90ub913.ko] undefined!
>> ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/ds90ub913.ko] undefined!
>> ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/ds90ub913.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
