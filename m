Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D47C193
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 23:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678924275; x=1710460275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i2dqkdZgaBfrsXi6liDW/QZl+g2JNRwll3nxZE2WWuY=;
  b=SdpOuVIrf35sNEhHgnMBfL9BD4NhhVowVrwNQvF1XJ40MXsmL3Igl3AB
   Bb8iVHFcrIe3agnT4Bjn/5+JfauCU4eW7/ZuC1VxJlC5zOY5SqMLAIMFt
   52ja17cgHCthbFClfK0bOHCBvDmYJkmzoekBF6jiQPtJLzD8xng2B/X+g
   mi08DC4xsa9NGtMnzBPr0WWYQDhTb1zjVLigjWOrQwWz1pJfVQeMri7t9
   J2lMaA1Vn+2ooknOGv6s5S/AvgDg9VOMN9piB6taJRugZ/XcDrULw+FU5
   NZ53w/AxJORA3A5hzkrdbJv6KqHx37tKcX1qyMSlwMkTr+zcc9aBFQsBi
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="321687299"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="321687299"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 16:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="768702952"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="768702952"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Mar 2023 16:51:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcatl-00088l-0N;
	Wed, 15 Mar 2023 23:51:13 +0000
Date: Thu, 16 Mar 2023 07:50:17 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 27/31]
 drivers/net/ethernet/mellanox/mlx4/intf.c:62:6: warning: no previous
 prototype for 'is_ib_supported'
Message-ID: <202303160758.xTpKSTx0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   712b4584a71d7f86b5f870dae8ee6e5abd42971f
commit: ed40d1a4b21149df98f2d3975d3b6752e33e2b88 [27/31] mlx4: Connect the infiniband part to the auxiliary bus
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230316/202303160758.xTpKSTx0-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/commit/?id=ed40d1a4b21149df98f2d3975d3b6752e33e2b88
        git remote add leon-rdma https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git
        git fetch --no-tags leon-rdma rdma-next
        git checkout ed40d1a4b21149df98f2d3975d3b6752e33e2b88
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303160758.xTpKSTx0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx4/intf.c:53:6: warning: no previous prototype for 'is_eth_supported' [-Wmissing-prototypes]
      53 | bool is_eth_supported(struct mlx4_dev *dev)
         |      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mellanox/mlx4/intf.c:62:6: warning: no previous prototype for 'is_ib_supported' [-Wmissing-prototypes]
      62 | bool is_ib_supported(struct mlx4_dev *dev)
         |      ^~~~~~~~~~~~~~~


vim +/is_ib_supported +62 drivers/net/ethernet/mellanox/mlx4/intf.c

    61	
  > 62	bool is_ib_supported(struct mlx4_dev *dev)
    63	{
    64		for (int port = 1; port <= dev->caps.num_ports; port++)
    65			if (dev->caps.port_type[port] == MLX4_PORT_TYPE_IB)
    66				return true;
    67	
    68		if (dev->caps.flags & MLX4_DEV_CAP_FLAG_IBOE)
    69			return true;
    70	
    71		return false;
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
