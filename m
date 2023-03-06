Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09652525C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 13:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678110682; x=1709646682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zzHm5bnG0J4Pc1/Z15GC7REHux2IPuBzN5p5sqxcPN0=;
  b=ZBZxjmIkCL9zVYg5dt22Ity1EzOZBRpSVV38U4nQzrXyrrBaHxbEgxRJ
   a0oc5GfGW3zQ569KcY/J9exdR7M/m/9YXpaBRScrsxpzUMO55o+N9RpFX
   aqYZB0x8sC6GrZBZRMcCzn7PuQP4ZvPkPqZfA+imYJR26hzDbrTWynjey
   jUFoLxILrdjkwS9qHyPTSNwb0UnimBkU7LOOfGlSJNoXrz1e63XW1Gd1z
   n8T8Gq+biNM3l5stdFJ5PGQcHBoeQGNtbUq0NXY7BSmXb6RW61Qa8lwaJ
   mzNbK+xjJWVkDi73tbpZ2PjLvAIUun87c5F9x/nJfoOMdd0zW/j7pKNaY
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="337873036"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="337873036"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 05:51:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="921936585"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="921936585"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Mar 2023 05:51:20 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZBFH-0000MB-2s;
	Mon, 06 Mar 2023 13:51:19 +0000
Date: Mon, 6 Mar 2023 21:50:55 +0800
From: kernel test robot <lkp@intel.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djakov-icc:iommu-map 1/2] include/linux/iommu.h:1232:16: error:
 'DMA_MAPPING_ERROR' undeclared
Message-ID: <202303062131.vHMT16pa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git iommu-map
head:   c6ba0a41c1f6bf4e449f09599a87e636cb63caff
commit: c3e62de30983a8b55eb0a3a61a7e2315c2ace7e1 [1/2] iommu/dma: Allow the iommu ops to be called from dma mapping code
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230306/202303062131.vHMT16pa-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git/commit/?id=c3e62de30983a8b55eb0a3a61a7e2315c2ace7e1
        git remote add djakov-icc https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git
        git fetch --no-tags djakov-icc iommu-map
        git checkout c3e62de30983a8b55eb0a3a61a7e2315c2ace7e1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303062131.vHMT16pa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/vhost/vdpa.c:20:
   include/linux/iommu.h: In function 'iommu_dma_map_page':
>> include/linux/iommu.h:1232:16: error: 'DMA_MAPPING_ERROR' undeclared (first use in this function)
    1232 |         return DMA_MAPPING_ERROR;
         |                ^~~~~~~~~~~~~~~~~
   include/linux/iommu.h:1232:16: note: each undeclared identifier is reported only once for each function it appears in


vim +/DMA_MAPPING_ERROR +1232 include/linux/iommu.h

  1227	
  1228	static inline dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
  1229			unsigned long offset, size_t size, enum dma_data_direction dir,
  1230			unsigned long attrs)
  1231	{
> 1232		return DMA_MAPPING_ERROR;
  1233	}
  1234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
