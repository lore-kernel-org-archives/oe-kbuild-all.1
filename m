Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E412EC8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 01:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686189074; x=1717725074;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DfBhjySOC/aOfriddPQHUPE/IPwmhqkYZ8Upp9h/SZk=;
  b=cjdkRHz6H3SPLdrkWCip5JBRxdOdptKenoE2UHLBS5bgNroTnwIwizeO
   62e9rM/1qfPiw0DbFv9jAfhjmrM1qd8Dn4lYKIuFKbEXzclXZSExTfc1X
   fe0fpuejRrK2OFLqSJG4rPFULjnQd8i8iMeGb5lkjLcegJbnhM7K34kbL
   gsTi3PfXNHPZfiZEVlPWvbzMSd3BQn/08tTFYOC7vZkR5Ka9/HBoc84Li
   wEg6z5EvvV85/MziSx6pJLX8epaFGMTkI4lI27eqF8Xw+bU5KhjxOgqv2
   rJ8mKe438Dg+jdHabxWciy9z6Jb11VZitgzIMaSmox53mXF3QN/KrhEMw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="346781374"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="346781374"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 18:51:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="822400339"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="822400339"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Jun 2023 18:51:12 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q74nv-00077N-2x;
	Thu, 08 Jun 2023 01:51:11 +0000
Date: Thu, 8 Jun 2023 09:50:19 +0800
From: kernel test robot <lkp@intel.com>
To: Paul M Stillwell Jr <paul.m.stillwell.jr@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH net-next v12 3/4] ice: add ability to
 read FW log data and configure the number of log buffers
Message-ID: <202306080921.rgVC3eYY-lkp@intel.com>
References: <20230607222443.119-4-paul.m.stillwell.jr@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607222443.119-4-paul.m.stillwell.jr@intel.com>

Hi Paul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-M-Stillwell-Jr/ice-remove-FW-logging-code/20230608-062658
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230607222443.119-4-paul.m.stillwell.jr%40intel.com
patch subject: [Intel-wired-lan] [PATCH net-next v12 3/4] ice: add ability to read FW log data and configure the number of log buffers
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230608/202306080921.rgVC3eYY-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add net-next https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
        git fetch net-next main
        git checkout net-next/main
        b4 shazam https://lore.kernel.org/r/20230607222443.119-4-paul.m.stillwell.jr@intel.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/net/ethernet/intel/ice/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080921.rgVC3eYY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/ice/ice_fwlog.c: In function 'ice_fwlog_alloc_ring_buffs':
   drivers/net/ethernet/intel/ice/ice_fwlog.c:41:30: error: implicit declaration of function 'vzalloc'; did you mean 'kvzalloc'? [-Werror=implicit-function-declaration]
      41 |                 ring->data = vzalloc(ring->data_size);
         |                              ^~~~~~~
         |                              kvzalloc
>> drivers/net/ethernet/intel/ice/ice_fwlog.c:41:28: warning: assignment to 'u8 *' {aka 'unsigned char *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
      41 |                 ring->data = vzalloc(ring->data_size);
         |                            ^
   drivers/net/ethernet/intel/ice/ice_fwlog.c: In function 'ice_fwlog_free_ring_buffs':
   drivers/net/ethernet/intel/ice/ice_fwlog.c:59:25: error: implicit declaration of function 'vfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
      59 |                         vfree(ring->data);
         |                         ^~~~~
         |                         kvfree
   cc1: some warnings being treated as errors


vim +41 drivers/net/ethernet/intel/ice/ice_fwlog.c

    32	
    33	static int ice_fwlog_alloc_ring_buffs(struct ice_fwlog_ring *rings)
    34	{
    35		int i, ret = 0;
    36	
    37		for (i = 0; i < rings->size; i++) {
    38			struct ice_fwlog_data *ring = &rings->rings[i];
    39	
    40			ring->data_size = PAGE_SIZE;
  > 41			ring->data = vzalloc(ring->data_size);
    42			if (!ring->data) {
    43				ret = -ENOMEM;
    44				break;
    45			}
    46		}
    47	
    48		return ret;
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
