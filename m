Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DEB10E3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 06:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680069821; x=1711605821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B7nGMIyFj6PiKwJP0ljGC19e9jPFQqulPkrakTI7EMg=;
  b=ZAU4pP0FMQrUOcDKv63pKszBHFvZXdOamkImQEXvWPhQrnv/72s9jrEO
   6y0wbgdX0VosdWyVEUuuHDarg1D+y3Q/QdF6nCAlidMhm0enVpOzELYQi
   NybY72USdr+IQ2F1wTQicoQ/pjEzPTsFGjoJuqNNjFHxubbqLfIQ6bohV
   wMhwBBhsOzkTMAcnyHPfYA0iqk37sllzcuCfyPKmnV7m4MXJi+KDTLIWE
   BNOL+t+tFfItiNNbOE7Ig365iaHFMlJ5Os+O/iO95/JDt9nolvrl60OmH
   EjJiXvzXmvpL1K5M/o9PlyZVyrfycp4976IFtg11CAHLdRLrp6V/iEY9S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="338289807"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="338289807"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 23:03:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="930176855"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="930176855"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Mar 2023 23:03:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phOuI-000JGw-2P;
	Wed, 29 Mar 2023 06:03:38 +0000
Date: Wed, 29 Mar 2023 14:03:20 +0800
From: kernel test robot <lkp@intel.com>
To: Eli Cohen <elic@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Saeed Mahameed <saeedm@nvidia.com>,
	Shay Drory <shayd@nvidia.com>
Subject: [saeed:testing/vdpa-posted-interrupt 10/15]
 drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c:148:31: error: implicit
 declaration of function 'pci_msix_can_alloc_dyn'
Message-ID: <202303291328.sNmTyyWF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git testing/vdpa-posted-interrupt
head:   fa4692657f1fab7ab4169159d3f37ba4d016c02c
commit: 06ce7507eb897a1195eb3f7c1138aa261549461c [10/15] net/mlx5: Use dynamic msix vectors allocation
config: alpha-randconfig-c004-20230326 (https://download.01.org/0day-ci/archive/20230329/202303291328.sNmTyyWF-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git/commit/?id=06ce7507eb897a1195eb3f7c1138aa261549461c
        git remote add saeed https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git
        git fetch --no-tags saeed testing/vdpa-posted-interrupt
        git checkout 06ce7507eb897a1195eb3f7c1138aa261549461c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx5/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303291328.sNmTyyWF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c: In function 'irq_release':
>> drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c:148:31: error: implicit declaration of function 'pci_msix_can_alloc_dyn' [-Werror=implicit-function-declaration]
     148 |         if (irq->map.index && pci_msix_can_alloc_dyn(pool->dev->pdev))
         |                               ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/pci_msix_can_alloc_dyn +148 drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c

   145	
   146		free_cpumask_var(irq->mask);
   147		free_irq(irq->map.virq, &irq->nh);
 > 148		if (irq->map.index && pci_msix_can_alloc_dyn(pool->dev->pdev))
   149			pci_msix_free_irq(pool->dev->pdev, irq->map);
   150		kfree(irq);
   151	}
   152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
