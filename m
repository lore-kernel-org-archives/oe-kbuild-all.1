Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9121CAB6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Nov 2023 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dA5x+Uqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699881672; x=1731417672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hAx2E/B4AeGjEJ1PdDHS+y0ncyJCfkCZr6zpxW632GQ=;
  b=dA5x+UqjqNrpNuUrLAmpwf9/LxLFs8bZV0GNFwSmey6tfz+TxHw2BV1e
   77/CKDLVERlYxmqRaX+/hXFQEZAGY7y1UQTgrh8nZGT3PQnrtIBLHJR6P
   Hx1blfSL8HOEVRPKc08XNcg3VD/a0JrS92HibhXwYd8963fvmJ6nwg/ma
   FJlKnuENBMx6ldmBPRLiOM3kzQviC+IJRznc8ZGuB+EFIGcWmRIDwTrvS
   88YXmBTRCFxxBLwO115E5pyqMzdocv+8KXMFppPMnspwydjpGM2o4GHf5
   q1IKEqzybBhe/hlrwjeMNJD7B9h3hSGk2ymEcJnXRUycHvW9ltGB7ucXj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="370633279"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="370633279"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:21:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="887917608"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="887917608"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 13 Nov 2023 05:21:10 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2WsF-000C7Y-36;
	Mon, 13 Nov 2023 13:21:07 +0000
Date: Mon, 13 Nov 2023 21:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Bloch <mbloch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 17/19] include/linux/mlx5/eswitch.h:220:19:
 error: redefinition of 'mlx5_eswitch_manager_vport'
Message-ID: <202311132146.VcxMTz7m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   c559cb7113158c02d75401ac162652072ef1b5f0
commit: 1efa1ad5a92370a6b6c6395bfd04cf1586632824 [17/19] net/mlx5: E-Switch, expose eswitch manager vport
config: loongarch-randconfig-001-20231113 (https://download.01.org/0day-ci/archive/20231113/202311132146.VcxMTz7m-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311132146.VcxMTz7m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311132146.VcxMTz7m-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mellanox/mlx5/core/eswitch.h:42,
                    from drivers/net/ethernet/mellanox/mlx5/core/devlink.c:9:
>> include/linux/mlx5/eswitch.h:220:19: error: redefinition of 'mlx5_eswitch_manager_vport'
     220 | static inline u16 mlx5_eswitch_manager_vport(struct mlx5_core_dev *dev)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/eswitch.h:202:19: note: previous definition of 'mlx5_eswitch_manager_vport' with type 'u16(struct mlx5_core_dev *)' {aka 'short unsigned int(struct mlx5_core_dev *)'}
     202 | static inline u16 mlx5_eswitch_manager_vport(struct mlx5_core_dev *dev)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mlx5_eswitch_manager_vport +220 include/linux/mlx5/eswitch.h

   218	
   219	/* The returned number is valid only when the dev is eswitch manager. */
 > 220	static inline u16 mlx5_eswitch_manager_vport(struct mlx5_core_dev *dev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
