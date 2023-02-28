Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14B53D79
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 22:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677623522; x=1709159522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oTkuu9o52eh0ctPcN4fzixGhAd1A3qYzgwdFDiGM8fk=;
  b=WndXUtAvFft6rzc+cpk9LSkUIT0rHpfkT/Ou1NDlpdi0uxgt0Djg0XMc
   fJg+qOiLT8A06F58sgi/z5F8SErWE9RlNSK1Tmmd+KgeRkFlBfZuC/vwL
   3N7NDdY8MHoasTvBma6EF+syjeSO9/In4KvpTGTknP0l18//P43smb0Gz
   i8hRfpXIE9WW6YVF0kpX02L7cGmHzWp9OUN3xnMk1cR+1tOll9XL3JHtX
   /IgFsCO6cype8MPPmkaDF9r2ZXvwyTB+p26H7hrxk+k5Q7i8VGZkMC3hn
   Z2yoELC7b286xyQcLPclFBLln4O305kbEjPVqnrCXsQikMFZs38JgInVG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="314689077"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="314689077"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 14:31:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="651770239"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="651770239"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Feb 2023 14:31:54 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pX8Vl-0005gR-0u;
	Tue, 28 Feb 2023 22:31:53 +0000
Date: Wed, 1 Mar 2023 06:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 1/47]
 drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:10395:9: error:
 implicit declaration of function 'mlxsw_sp_mp_hash_parsing_depth_adjust';
 did you mean 'mlxsw_sp_nve_inc_parsing_depth_put'?
Message-ID: <202303010618.trZ2uPcc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   3ca2a4e66b215098468b997c748c1709307cc9df
commit: 344642a775b90ec422363b3eea863385570cbb6e [1/47] mlxsw: spectrum: Fix incorrect parsing depth after reload
config: microblaze-randconfig-c043-20230226 (https://download.01.org/0day-ci/archive/20230301/202303010618.trZ2uPcc-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jpirko/linux_mlxsw/commit/344642a775b90ec422363b3eea863385570cbb6e
        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
        git fetch --no-tags jpirko-mlxsw combined_queue
        git checkout 344642a775b90ec422363b3eea863385570cbb6e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash drivers/net/ethernet/mellanox/mlxsw/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303010618.trZ2uPcc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c: In function 'mlxsw_sp_mp_hash_fini':
>> drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:10395:9: error: implicit declaration of function 'mlxsw_sp_mp_hash_parsing_depth_adjust'; did you mean 'mlxsw_sp_nve_inc_parsing_depth_put'? [-Werror=implicit-function-declaration]
   10395 |         mlxsw_sp_mp_hash_parsing_depth_adjust(mlxsw_sp, old_inc_parsing_depth,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         mlxsw_sp_nve_inc_parsing_depth_put
   cc1: some warnings being treated as errors


vim +10395 drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c

 10390	
 10391	static void mlxsw_sp_mp_hash_fini(struct mlxsw_sp *mlxsw_sp)
 10392	{
 10393		bool old_inc_parsing_depth = mlxsw_sp->router->inc_parsing_depth;
 10394	
 10395		mlxsw_sp_mp_hash_parsing_depth_adjust(mlxsw_sp, old_inc_parsing_depth,
 10396						      false);
 10397	}
 10398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
