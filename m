Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E14E522B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 13:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686664653; x=1718200653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2pfVWqaK6WyJ+W2ITuuNWmOg7DSjcT61H80CBVSHgbw=;
  b=eqdDRMjw+rRP513+s8nSFfnm4uz/5fbieVRQkeJppKHkuSUIy8aXQiIK
   6ARTBae9OzoVLdGRvTaR11fl/exXRNv0EFN/RTQt5IYS6SXWN89i3AHmB
   sYcAFPmgt3rZE77D0puZV/hgAnoUYEqZXPoy3bvh/p25JN1FDu2ufH6wd
   ROv3zZjFthyfxygwalEk04bFPp3cUs+A6Vrk4L72Z7OkSDlUaABYR73sD
   8Ifl3li9JNl+FT+5rNtnlK7lpWU88328lJJtH6QdnjzR3dYy/Zv/6tqcx
   0B/PUQH6GKXYrzS8nPVHNfDI1ouRdBWvc5ScWmVeSpB72VJ6rn0pS2H5r
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="386735700"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="386735700"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 06:57:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="705807577"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="705807577"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Jun 2023 06:56:59 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q94W3-0001PT-0R;
	Tue, 13 Jun 2023 13:56:59 +0000
Date: Tue, 13 Jun 2023 21:55:57 +0800
From: kernel test robot <lkp@intel.com>
To: Edward Cree <ecree.xilinx@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <simon.horman@corigine.com>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>
Subject: [linux-next:master 8226/9385] csky-linux-ld:
 drivers/net/ethernet/sfc/ef100_netdev.c:114: undefined reference to
 `efx_tc_netevent_event'
Message-ID: <202306132155.BFZc9arF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1f6ce8392d6ff486af5ca96df9ded5882c4b6977
commit: 7e5e7d800011adf4aeda615f8a1bc31c0c1e2bb9 [8226/9385] sfc: neighbour lookup for TC encap action offload
config: csky-randconfig-c044-20230612 (https://download.01.org/0day-ci/archive/20230613/202306132155.BFZc9arF-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7e5e7d800011adf4aeda615f8a1bc31c0c1e2bb9
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 7e5e7d800011adf4aeda615f8a1bc31c0c1e2bb9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306132155.BFZc9arF-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/net/ethernet/sfc/ef100_netdev.o: in function `ef100_netdev_event':
   drivers/net/ethernet/sfc/ef100_netdev.c:313: undefined reference to `efx_tc_netdev_event'
   csky-linux-ld: drivers/net/ethernet/sfc/ef100_netdev.o: in function `ef100_netevent_event':
   drivers/net/ethernet/sfc/ef100_netdev.c:329: undefined reference to `efx_tc_netevent_event'
   csky-linux-ld: drivers/net/ethernet/sfc/ef100_netdev.o: in function `ef100_net_stop':
   drivers/net/ethernet/sfc/ef100_netdev.c:114: undefined reference to `efx_tc_netdev_event'
>> csky-linux-ld: drivers/net/ethernet/sfc/ef100_netdev.c:114: undefined reference to `efx_tc_netevent_event'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
