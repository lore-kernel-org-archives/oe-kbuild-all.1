Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF9479DE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680279301; x=1711815301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1yD83gNk6JUFNTM2F4InzZw9Y1GlAhCjS7CO1UUw7N0=;
  b=g1yyTQuwjAAChlYr9pkVbuJcPvEDIOiikAaVQPEO284bubCXo+IvyZ0U
   NNqu7brVxGWAKlnqNKUVuOS38dYTR7Xy6CpwxSHKBtll3C9315PP2ioDv
   /5p5/nNKyLXFjfVOVzzZGsv0PnY1h4wAP1NF8ERP9GxN4/OoIQGLO0kfs
   66RSkt04K57rywbmGvyCWhbVTwuLS515rE6pKqAEzdve8f7v1zsj9y0Vt
   DoUtEU6GcWXE293N5gC1pNxNT3q9eCZUyGzoc2PTuCUTd3KXmXJUEP4im
   DUaBYdVaygDhBz/d4PUi2yJpIFNzOtw92mM7YYypSIZsWQ505bj2rwGPk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="330035448"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="330035448"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 09:11:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="859394216"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="859394216"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Mar 2023 09:10:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piHKv-000Lwe-0P;
	Fri, 31 Mar 2023 16:10:45 +0000
Date: Sat, 1 Apr 2023 00:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: Eli Cohen <elic@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Saeed Mahameed <saeedm@nvidia.com>, Shay Drory <shayd@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: [linux-next:master 6041/8375]
 drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c:148:31: error: implicit
 declaration of function 'pci_msix_can_alloc_dyn'
Message-ID: <202304010037.jagzIuJZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4b0f4525dc4fe8af17b3daefe585f0c2eb0fe0a5
commit: 3354822cde5a9f72aa725b3c619188b149a71a33 [6041/8375] net/mlx5: Use dynamic msix vectors allocation
config: alpha-randconfig-r003-20230329 (https://download.01.org/0day-ci/archive/20230401/202304010037.jagzIuJZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3354822cde5a9f72aa725b3c619188b149a71a33
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 3354822cde5a9f72aa725b3c619188b149a71a33
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx5/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304010037.jagzIuJZ-lkp@intel.com/

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
