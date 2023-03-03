Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54471851
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 04:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677816412; x=1709352412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tCkJizst54F29PGx6LDTaNkAB0MBu4vheN1sM91IZvE=;
  b=iSFEbp2M898FE/KMffms2dxOEVH3IxZAgzh6xCsXx2WD/9sOistSR1l0
   rLc8HGVuQL3qxn9rg7wHNWcbFj+6V8ud9RwSJfzCY0mRmfGvkSeSBuyJ5
   5m0lMM+ENNKn6II8EJI3N+3Ikm9XWc8nJFFVq8MFRVpu2jHaIm+Hy+MnF
   fNSafZJMREtenXneoC9TENRnDs5mtFkWqWMdp/BDSdx3eJRdnHzXjHTXr
   RvgEIz4VxPDfCk7dcmaIoGWnMHzbhMXiQP0/npfFfsF0mvbA5iINMXf5S
   bce6TWKcYWLRuo3Lwucc+So7AlUAjO8KvOBqvXiARbZfhmqyVEELFSp4J
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="315350200"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="315350200"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 20:06:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="818331363"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="818331363"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 02 Mar 2023 20:06:49 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXwgy-0001BC-2h;
	Fri, 03 Mar 2023 04:06:48 +0000
Date: Fri, 3 Mar 2023 12:06:24 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>
Subject: [lunn:v6.2.0-net-next-phy-leds 10/23]
 drivers/net/dsa/qca/qca8k-leds.c:396:1: error: redefinition of
 'qca8k_setup_led_ctrl'
Message-ID: <202303031105.pg4VWu6l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.2.0-net-next-phy-leds
head:   754bf629fa1ea70b4e2b779ac7955e744ae1608d
commit: 4224813a0f5a6ce1476d73761e5eed08884b2da6 [10/23] net: dsa: qca8k: add LEDs support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230303/202303031105.pg4VWu6l-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/4224813a0f5a6ce1476d73761e5eed08884b2da6
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.2.0-net-next-phy-leds
        git checkout 4224813a0f5a6ce1476d73761e5eed08884b2da6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/net/dsa/qca/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303031105.pg4VWu6l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/dsa/qca/qca8k-leds.c:396:1: error: redefinition of 'qca8k_setup_led_ctrl'
     396 | qca8k_setup_led_ctrl(struct qca8k_priv *priv)
         | ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/dsa/qca/qca8k-leds.c:5:
   drivers/net/dsa/qca/qca8k.h:577:19: note: previous definition of 'qca8k_setup_led_ctrl' with type 'int(struct qca8k_priv *)'
     577 | static inline int qca8k_setup_led_ctrl(struct qca8k_priv *priv)
         |                   ^~~~~~~~~~~~~~~~~~~~


vim +/qca8k_setup_led_ctrl +396 drivers/net/dsa/qca/qca8k-leds.c

   394	
   395	int
 > 396	qca8k_setup_led_ctrl(struct qca8k_priv *priv)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
