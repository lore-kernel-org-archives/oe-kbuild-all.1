Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4331E659
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 07:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675150265; x=1706686265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bwDNbMI84S+lBq+pJ8Egpkwu9V5D61dR7PuLqEqjr/o=;
  b=hJcWzbKztwRCtEF28VFmpPHpd1DcELRWtRcVt1EyD9xN54mHx0cK1B0c
   2vXMatODRtX6LTS+B6ebyiviewoOhEsrNY8Be6n6N1XjfIsMYlOHAIpKO
   tHVXLVPjDShyW/2HK6Pi/PtoKvdVc8P3KPODSMySS2U8K1vfXoy8qIG/R
   MA5UH1Bpw7xQGJUk654hJpsKY8sk0W/Ow/6o+fOFQQmSB+lMTNMbLSlXU
   eyQ/OvnQQ/4gDrjAZrtg4b2jBcdqb+Ogwu6F3ngGhBHk0nWnvsGH3Tg1c
   o3JKvEmV0PjGcHrFSF1gKrZ02XJcu7yU4BJiXEnfeCnvanIxqGoM+4tOC
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="307429582"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="307429582"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 23:30:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="694855692"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="694855692"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Jan 2023 23:30:41 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMl6G-0004Ge-39;
	Tue, 31 Jan 2023 07:30:40 +0000
Date: Tue, 31 Jan 2023 15:29:45 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [linux-stable-rc:linux-5.15.y 9007/9999]
 drivers/extcon/extcon-usbc-tusb320.c:19: warning: expecting prototype for
 drivers/extcon/extcon-tusb320.c(). Prototype was for TUSB320_REG8() instead
Message-ID: <202301311547.ZhYEzT9x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
head:   5605d15db0225e49efaa8f83e03f78a8bee3bb5d
commit: ac067e75c4c2a80c617326ad5c4a8754b16f5079 [9007/9999] extcon: usbc-tusb320: Add USB TYPE-C support
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230131/202301311547.ZhYEzT9x-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=ac067e75c4c2a80c617326ad5c4a8754b16f5079
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.15.y
        git checkout ac067e75c4c2a80c617326ad5c4a8754b16f5079
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/extcon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/extcon/extcon-usbc-tusb320.c:19: warning: expecting prototype for drivers/extcon/extcon-tusb320.c(). Prototype was for TUSB320_REG8() instead


vim +19 drivers/extcon/extcon-usbc-tusb320.c

    18	
  > 19	#define TUSB320_REG8				0x8
    20	#define TUSB320_REG8_CURRENT_MODE_ADVERTISE	GENMASK(7, 6)
    21	#define TUSB320_REG8_CURRENT_MODE_ADVERTISE_USB	0x0
    22	#define TUSB320_REG8_CURRENT_MODE_ADVERTISE_15A	0x1
    23	#define TUSB320_REG8_CURRENT_MODE_ADVERTISE_30A	0x2
    24	#define TUSB320_REG8_CURRENT_MODE_DETECT	GENMASK(5, 4)
    25	#define TUSB320_REG8_CURRENT_MODE_DETECT_DEF	0x0
    26	#define TUSB320_REG8_CURRENT_MODE_DETECT_MED	0x1
    27	#define TUSB320_REG8_CURRENT_MODE_DETECT_ACC	0x2
    28	#define TUSB320_REG8_CURRENT_MODE_DETECT_HI	0x3
    29	#define TUSB320_REG8_ACCESSORY_CONNECTED	GENMASK(3, 2)
    30	#define TUSB320_REG8_ACCESSORY_CONNECTED_NONE	0x0
    31	#define TUSB320_REG8_ACCESSORY_CONNECTED_AUDIO	0x4
    32	#define TUSB320_REG8_ACCESSORY_CONNECTED_ACC	0x5
    33	#define TUSB320_REG8_ACCESSORY_CONNECTED_DEBUG	0x6
    34	#define TUSB320_REG8_ACTIVE_CABLE_DETECTION	BIT(0)
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
