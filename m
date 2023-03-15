Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4BE7487
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 22:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678920566; x=1710456566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bb7Dz9B3Kr3HNQDazh5xVfdj9rYOdKQhOzpJVvXgOCk=;
  b=ahEr+cJhu7m1H0wMeS6RFUwletAVILKur8pO4etAJy96Rv0h051BwpNQ
   JjBbND/i1/phcnY93zudIedWEzmT8PBtEyejyKkSNfC9yvZLoQXMARsyT
   QLk5GhAAbee8H76J9jXUsHtyyabgitnI5cakLUKBUahSmAcXW0AgQXePZ
   /A+xZdJS4Y6suMnIdySAGzP/2TGsYSZpfwiuwQlRaSGsCfvMhVNcE0XRe
   qV0plo+/OV+a2umBx8uWCG8JxLhlcHHVv8yOnjgchHtgQyVTv+kM9Tvnw
   6sSXmX/AKYmCEcKuq+/PwsoWtMEdRkC/h9tvX7ZnVwywIBBTlKfRMa2Gi
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="400411206"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="400411206"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 15:49:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="748628072"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="748628072"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Mar 2023 15:49:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcZvj-00085z-0R;
	Wed, 15 Mar 2023 22:49:11 +0000
Date: Thu, 16 Mar 2023 06:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 26/31]
 drivers/net/ethernet/mellanox/mlx4/intf.c:53:6: warning: no previous
 prototype for 'is_eth_supported'
Message-ID: <202303160655.hEOs7oXW-lkp@intel.com>
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
commit: 49f2c235465534f179d6044a2c72f840ab0671ad [26/31] mlx4: Connect the ethernet part to the auxiliary bus
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230316/202303160655.hEOs7oXW-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/commit/?id=49f2c235465534f179d6044a2c72f840ab0671ad
        git remote add leon-rdma https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git
        git fetch --no-tags leon-rdma rdma-next
        git checkout 49f2c235465534f179d6044a2c72f840ab0671ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303160655.hEOs7oXW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx4/intf.c:53:6: warning: no previous prototype for 'is_eth_supported' [-Wmissing-prototypes]
      53 | bool is_eth_supported(struct mlx4_dev *dev)
         |      ^~~~~~~~~~~~~~~~


vim +/is_eth_supported +53 drivers/net/ethernet/mellanox/mlx4/intf.c

    52	
  > 53	bool is_eth_supported(struct mlx4_dev *dev)
    54	{
    55		for (int port = 1; port <= dev->caps.num_ports; port++)
    56			if (dev->caps.port_type[port] == MLX4_PORT_TYPE_ETH)
    57				return true;
    58	
    59		return false;
    60	}
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
