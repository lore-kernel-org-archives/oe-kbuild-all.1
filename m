Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34C2612D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 19:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682107043; x=1713643043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vMSpjSKqVJdB2QR7ewVAhQLPpalfNiPmX5XPErLSgD0=;
  b=P2JJU00vPrMPFshGyIhHKhUaH+W19NUqkzX4L8e7pVoEnDjTYGl4FgOR
   wE4nfEBJUL7xLrjxy4A6pN+X+xSVURCaipb+4NuPRjXhWhBUb7mEzZDQ1
   Lf9MKmfZZpRQTikkYBw4UMypuhYOTgsOiE6HkxuY8jjKYLuF1uWU8Qdyh
   AbFHCDmIi1MGLs9CUCU0s6z/bi4NeTghVFNMzv8HRP3ynE2SM2yfZ4qx0
   Xclf7O2PryDNE7bEqeBD6iZ36PYTfRxlZXeB/H/4lqOioa1aiqvCrWCHE
   4QJxp0vTIMCD8vQqbz6XUPxACxLWyxRXB/g29ks5NiFV3wZCcYOqRErQk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="411338503"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="411338503"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 12:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="724945808"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="724945808"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Apr 2023 12:54:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppwpp-000glq-12;
	Fri, 21 Apr 2023 19:54:21 +0000
Date: Sat, 22 Apr 2023 03:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: Eli Cohen <elic@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Saeed Mahameed <saeedm@nvidia.com>
Subject: [linux-next:master 13449/13717]
 drivers/vdpa/mlx5/net/mlx5_vnet.c:2896:17: error: implicit declaration of
 function 'mlx5_msix_free'; did you mean 'mlx5_db_free'?
Message-ID: <202304220313.aBr2eAyS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d3e1ee0e67e7603d36f4fa2fec6b881c01aabe89
commit: b9ca712f33f59e977592cb639c2e00a02f45a146 [13449/13717] vdpa/mlx5: Support interrupt bypassing
config: microblaze-randconfig-r013-20230421 (https://download.01.org/0day-ci/archive/20230422/202304220313.aBr2eAyS-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b9ca712f33f59e977592cb639c2e00a02f45a146
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b9ca712f33f59e977592cb639c2e00a02f45a146
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash drivers/vdpa/mlx5/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220313.aBr2eAyS-lkp@intel.com/

Note: the linux-next/master HEAD d3e1ee0e67e7603d36f4fa2fec6b881c01aabe89 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'free_irqs':
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:2896:17: error: implicit declaration of function 'mlx5_msix_free'; did you mean 'mlx5_db_free'? [-Werror=implicit-function-declaration]
    2896 |                 mlx5_msix_free(ndev->mvdev.mdev, ent->map);
         |                 ^~~~~~~~~~~~~~
         |                 mlx5_db_free
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'allocate_irqs':
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:3259:28: error: implicit declaration of function 'mlx5_msix_alloc'; did you mean 'mlx5_db_alloc'? [-Werror=implicit-function-declaration]
    3259 |                 ent->map = mlx5_msix_alloc(ndev->mvdev.mdev, int_handler, NULL, ent->name);
         |                            ^~~~~~~~~~~~~~~
         |                            mlx5_db_alloc
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:3259:28: error: incompatible types when assigning to type 'struct msi_map' from type 'int'
   cc1: some warnings being treated as errors


vim +2896 drivers/vdpa/mlx5/net/mlx5_vnet.c

  2885	
  2886	static void free_irqs(struct mlx5_vdpa_net *ndev)
  2887	{
  2888		struct mlx5_vdpa_irq_pool_entry *ent;
  2889		int i;
  2890	
  2891		if (!msix_mode_supported(&ndev->mvdev))
  2892			return;
  2893	
  2894		for (i = ndev->irqp.num_ent - 1; i >= 0; i--) {
  2895			ent = ndev->irqp.entries + i;
> 2896			mlx5_msix_free(ndev->mvdev.mdev, ent->map);
  2897		}
  2898		kfree(ndev->irqp.entries);
  2899	}
  2900	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
