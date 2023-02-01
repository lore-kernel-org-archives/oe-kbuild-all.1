Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6805D8483
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 17:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675272761; x=1706808761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1lwTGWBj0+y9xsU+27/cINJlAnAQZb4KD0qasn/kJlM=;
  b=QP1g/gJKyFJZI0m+4El7YbI20kkMhHBwGyPaap4ybBLeVzgtIuVW//CS
   XFyx/BSv8l5qVsQf+Ig5rgJRyLtnfSsQumAi2t7DXeJLnuRnGy4HlwMAh
   fh/lntGr2L/kAmLy5o7hAElJvq9+d3D/bnc8a2DbPiChBiG8bBTRI05xX
   NWGRcCRGaZopZ50xwMZ/wWUPDerKNyKSnNBd55L3PXNcRTF18f/CKfXid
   M4GEoywF/f9buB9PMWtz7GLptgy+Q6IWtM2ZBfIiN8tUdL6FEiXWtlQPv
   yLv0yh8bP4psm9aJo4lWG3x1i843WC08N+BgGEURfvGbtwCGFCmR2fmCb
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="316211315"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="316211315"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 09:32:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="697336396"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="697336396"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Feb 2023 09:32:38 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNGyM-0005d9-08;
	Wed, 01 Feb 2023 17:32:38 +0000
Date: Thu, 2 Feb 2023 01:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: drivers/pci/p2pdma.c:199:44: sparse: sparse: dereference of noderef
 expression
Message-ID: <202302020153.4eL3mwiK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c0b67534c95c537f7a506a06b98e5e85d72e2b7d
commit: 7e9c7ef83d785236f5a8c3761dd053fae9b92fb8 PCI/P2PDMA: Allow userspace VMA allocations through sysfs
date:   3 months ago
config: arm64-randconfig-s042-20230201 (https://download.01.org/0day-ci/archive/20230202/202302020153.4eL3mwiK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7e9c7ef83d785236f5a8c3761dd053fae9b92fb8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7e9c7ef83d785236f5a8c3761dd053fae9b92fb8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/pci/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/p2pdma.c:199:44: sparse: sparse: dereference of noderef expression

vim +199 drivers/pci/p2pdma.c

   193	
   194	static void p2pdma_page_free(struct page *page)
   195	{
   196		struct pci_p2pdma_pagemap *pgmap = to_p2p_pgmap(page->pgmap);
   197		struct percpu_ref *ref;
   198	
 > 199		gen_pool_free_owner(pgmap->provider->p2pdma->pool,
   200				    (uintptr_t)page_to_virt(page), PAGE_SIZE,
   201				    (void **)&ref);
   202		percpu_ref_put(ref);
   203	}
   204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
