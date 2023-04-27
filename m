Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF6CC2CB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 18:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682620511; x=1714156511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h4o10fkg0EuXxSlFIxVmumQkl9gvpAEey/NvuLd0mww=;
  b=QvEjfwgUq6MXlb8Ii7QYWcNYRwvUGIkR04Y0erfdtPzlh6Sre8IU6cLa
   6GYvpKVB1OUDvQjQqtQU3nUqAFJaza8Tj0qiznQ/zYc0YW25S21aX7UiU
   Y5v5GQrXgG7P1kmgIQJRag22oIjRHDoe+XZxeeBK0f7RnKcJoukGVGTVZ
   iDzQWmRLSu8wwG7CwTJ9jGBgiNFTuNE3+81TB/oZUeIKLXowbjK+2EBGe
   CApIv+vx5VH9aRZv703dkNmNWs5/SPw3PLsTSE5MfNACnlHroFcQiqKay
   TWtMCmbUZCQBBqqGSWMOnptrtAQuRsGSYa98KBisqczMBFYagxCOuBsjf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="331818965"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="331818965"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 11:33:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="838514225"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="838514225"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2023 11:33:24 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ps6Ql-000043-1t;
	Thu, 27 Apr 2023 18:33:23 +0000
Date: Fri, 28 Apr 2023 02:32:46 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 55/57] drivers/regulator/max8660.c:502:35:
 error: 'max8660_dt_ids' undeclared here (not in a function); did you mean
 'max8660_id'?
Message-ID: <202304280235.HKaympg3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   d03f4bcb40575c1caf4deb8072eb2f9486e51b25
commit: a581a78403b6af4ee0aa9c6ee6701e92dc2555f6 [55/57] Use of_device_get_match_data
config: alpha-buildonly-randconfig-r004-20230427 (https://download.01.org/0day-ci/archive/20230428/202304280235.HKaympg3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=a581a78403b6af4ee0aa9c6ee6701e92dc2555f6
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout a581a78403b6af4ee0aa9c6ee6701e92dc2555f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/regulator/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280235.HKaympg3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/regulator/max8660.c:502:35: error: 'max8660_dt_ids' undeclared here (not in a function); did you mean 'max8660_id'?
     502 |                 .of_match_table = max8660_dt_ids,
         |                                   ^~~~~~~~~~~~~~
         |                                   max8660_id


vim +502 drivers/regulator/max8660.c

   497	
   498	static struct i2c_driver max8660_driver = {
   499		.probe_new = max8660_probe,
   500		.driver		= {
   501			.name	= "max8660",
 > 502			.of_match_table = max8660_dt_ids,
   503		},
   504		.id_table	= max8660_id,
   505	};
   506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
