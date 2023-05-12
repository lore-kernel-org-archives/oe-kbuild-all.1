Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC2BBE4E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 14:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683901011; x=1715437011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qV9WshMxyAqybQHIx3STQm5nTqBaOmoYqRackSG6mIM=;
  b=JTczzOq77ae0b4der0mjJh3heojgvAInYmeTqzc/0X8gsnvYiDNoVW/D
   7Z2lckdjw1L57beVG8u9mQTe5TxINclI2bmijuB5iGDq8inLbxip0dUOw
   PHDyqXmRHknU0s48dvS6EF9oA/IChgD3Gw50ReW+8XPDLy7T4ccpwqll1
   o5Hxsn0QMF70XPK8SLw+YWCaHARsVZp5l7gtAhKUghwHBQ1x6jRESuIxc
   0sXsktRQsem7CD3ViWT4CM8ik0SwrFKq566U23sqJpEzSTLpB4xggYEAd
   Z0V4r9g1ca4NiqZKWmlyLjS6deha1pg4hfieGVz1EG2kAaJkrN754hX8M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="335315587"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="335315587"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 07:16:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="677672157"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="677672157"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 May 2023 07:16:49 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxTZg-0004v4-2j;
	Fri, 12 May 2023 14:16:48 +0000
Date: Fri, 12 May 2023 22:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kalle Valo <kvalo@kernel.org>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.19.y 4143/5827] rt2800lib.c:undefined reference to
 `clk_get_sys'
Message-ID: <202305122244.LLs1eJZX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   cdfda37ab2cfc783a190b563806cda611c35d1e3
commit: 5ab1829c353647919bfae9a87f9230811ea26ffd [4143/5827] wifi: rt2x00: set SoC wmac clock register
config: m68k-randconfig-r021-20230512 (https://download.01.org/0day-ci/archive/20230512/202305122244.LLs1eJZX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=5ab1829c353647919bfae9a87f9230811ea26ffd
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 5ab1829c353647919bfae9a87f9230811ea26ffd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305122244.LLs1eJZX-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/net/wireless/ralink/rt2x00/rt2800lib.o: in function `rt2800_init_registers':
>> rt2800lib.c:(.text+0xe9ea): undefined reference to `clk_get_sys'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NEED_MULTIPLE_NODES
   Depends on [n]: DISCONTIGMEM [=n] || NUMA
   Selected by [y]:
   - SINGLE_MEMORY_CHUNK [=y] && MMU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
