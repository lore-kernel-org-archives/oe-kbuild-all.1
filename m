Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDEC361
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 02:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681351294; x=1712887294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tuvljj4M739lMCx7NzAuDCy00wujC8xvERu0P4ZRyGU=;
  b=A2W9FdwpF7kgvDlwGVLJh/n/ymI1Z4V11n7JHgscaOEi800Iz2VLhLOO
   2w//T59aiB3UkWEWUtvqdWOc8NutNDgI5eTIVRop/Kwd5oke6L91fwLy/
   HK3siZ0Qc3e3HqrWma0hbAain9VpkwPBczuxGICwvtjBqEctyZsNRjagK
   vLf4XrfX+PFh46Fd8F9nW6YPniCkBzmsAq6b9diff8Kn75hkGSzATwZ5y
   9XPefcERt2uiJsSIjvrpSDR0owzOwqhjJq6mY20pmms58yfDYZtSIjwP8
   i8Cfuc0I8nlWailZT3Q51Xvx/qFUVI7kZkvtk9GCgvB9Hx5cqoAx21XT1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="371917880"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="371917880"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 19:01:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="863535924"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="863535924"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Apr 2023 19:01:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmmHC-000YFJ-2W;
	Thu, 13 Apr 2023 02:01:30 +0000
Date: Thu, 13 Apr 2023 10:01:06 +0800
From: kernel test robot <lkp@intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Davor Joja <davor.joja@logicbricks.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 334/1065]
 drivers/media/i2c/adv7511-v4l2.c:2222:21: warning: no previous prototype for
 'adv7511_subdev'
Message-ID: <202304130956.qxUACXxh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   e5753363b5e03fc0a3055d5476c6cca93e9ea28b
commit: 735b2b500b004b16981ba99aed31749db2e7104a [334/1065] drivers: media: Customized adv7511 for Xylon LogiCVC (deprecated)
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230413/202304130956.qxUACXxh-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/735b2b500b004b16981ba99aed31749db2e7104a
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1_LTS
        git checkout 735b2b500b004b16981ba99aed31749db2e7104a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/irqchip/ drivers/media/i2c/ drivers/net/ethernet/xilinx/ drivers/spi/ drivers/staging/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130956.qxUACXxh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/adv7511-v4l2.c:2222:21: warning: no previous prototype for 'adv7511_subdev' [-Wmissing-prototypes]
    2222 | struct v4l2_subdev *adv7511_subdev(struct v4l2_subdev *sd)
         |                     ^~~~~~~~~~~~~~


vim +/adv7511_subdev +2222 drivers/media/i2c/adv7511-v4l2.c

  2221	
> 2222	struct v4l2_subdev *adv7511_subdev(struct v4l2_subdev *sd)
  2223	{
  2224		static struct v4l2_subdev *subdev;
  2225	
  2226		if (sd)
  2227			subdev = sd;
  2228	
  2229		return subdev;
  2230	}
  2231	EXPORT_SYMBOL(adv7511_subdev);
  2232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
