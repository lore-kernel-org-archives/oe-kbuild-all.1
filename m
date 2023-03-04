Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA7915B1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 03:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677899260; x=1709435260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=p9wuUBRJAuSisbmC0MWSa/lJzRmQ5d5xrSZ5zn9hbAk=;
  b=Vo9KK6UTNqjhfyeXACI0t5w9+6QqDngrAmgKS7LCy9tc7Ii0zxrw18La
   1ds3qMIAio95NRzFbvqPd/JYfiD1SUrPmenK+6PllOR16wHOn7ExzBYs/
   M5v+9e+BMnO4OAbcRd9ZL9JBsWiujJa8YiVRJ43ekj8C0l/eTQJUS2D/V
   u4mAMbsE7rrRb5aaXQKnGBl4vANTcUraVvmXW01MvCaXjTnX5WBfSnrCA
   4u/fC7AJH9LIiXfVz6OyF6YZpraKyVMVW5Xpp0bBCzGfvt5xsFy4DOXEm
   p9V4tqr4sbDMnazJYkKZjVRB4v7YlVf9eEDjnY7iCMCL57Pcu6rRk0Yfn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="421485947"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="421485947"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 19:07:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="744450365"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="744450365"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Mar 2023 19:07:32 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYIF9-0001oW-2T;
	Sat, 04 Mar 2023 03:07:31 +0000
Date: Sat, 4 Mar 2023 11:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Michael Walle <michael@walle.cc>,
	Richard Cochran <richardcochran@gmail.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	thomas.petazzoni@bootlin.com, Jay Vosburgh <j.vosburgh@gmail.com>,
	Veaceslav Falico <vfalico@gmail.com>,
	Andy Gospodarek <andy@greyhouse.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Joakim Zhang <qiangqing.zhang@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	UNGLinuxDriver@microchip.com,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Minghao Chi <chi.minghao@zte.com.cn>,
	Jie Wang <wangjie125@huawei.com>,
	Guangbin Huang <huangguangbin2@huawei.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Wang Yufen <wangyufen@huawei.com>,
	Alexandru Tachici <alexandru.tachici@analog.com>,
	Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v2 3/4] net: Let the active time stamping layer be
 selectable.
Message-ID: <202303041027.GxlLyldN-lkp@intel.com>
References: <20230303164248.499286-4-kory.maincent@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303164248.499286-4-kory.maincent@bootlin.com>

Hi Köry,

I love your patch! Yet something to improve:

[auto build test ERROR on v6.2]
[also build test ERROR on next-20230303]
[cannot apply to net/master net-next/master horms-ipvs/master linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/K-ry-Maincent/net-ethtool-Refactor-identical-get_ts_info-implementations/20230304-004527
patch link:    https://lore.kernel.org/r/20230303164248.499286-4-kory.maincent%40bootlin.com
patch subject: [PATCH v2 3/4] net: Let the active time stamping layer be selectable.
config: csky-defconfig (https://download.01.org/0day-ci/archive/20230304/202303041027.GxlLyldN-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/00a0656f9b222cfeb7c1253a4a2771b1f63b5c9b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review K-ry-Maincent/net-ethtool-Refactor-identical-get_ts_info-implementations/20230304-004527
        git checkout 00a0656f9b222cfeb7c1253a4a2771b1f63b5c9b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303041027.GxlLyldN-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: net/core/dev_ioctl.o: in function `dev_ifsioc':
>> dev_ioctl.c:(.text+0x292): undefined reference to `phy_mii_ioctl'
>> csky-linux-ld: dev_ioctl.c:(.text+0x370): undefined reference to `phy_do_ioctl'
>> csky-linux-ld: dev_ioctl.c:(.text+0x374): undefined reference to `phy_mii_ioctl'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
