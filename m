Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA7B1A26B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 13:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NKzEOOXX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698069236; x=1729605236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nMOw0psEWY8Om+KCPpH7OBmmS3SzXNboZTrMsgcg+ZU=;
  b=NKzEOOXXgnlJkvhqZsmWvO0n4ddEeHay0fY6wmg7ucjO8DeWGRRPGSQW
   vS8xvhFfWhNVVnkSPLoxCdMbuEXTB2FfQplIjPDkpyPMOoXOQYisucK5f
   OADq7UcvH1KjQParJZFkx80FH7FOmg7hQNi4TRkYmNPEfp4bs8QO8vcBm
   krt+bEbebjH/taxkJ2e5ms2zU486CW6N6tTBia1V24SOx4ddHu2XsfP4i
   GBAUuYu8Gv2Z0fxJKMMGMbHQ008VBHsSzvIpqkI05eq2CcQZ6xy/ojC5T
   zkq0i4qwGkAYpieVv7Y/5t7z5VwbpmHtcXkJBpbIjAhIs+iS0ee1sqBJE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="385732045"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="385732045"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 06:53:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="1005313108"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="1005313108"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Oct 2023 06:53:53 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quvNO-0006wr-2Y;
	Mon, 23 Oct 2023 13:53:50 +0000
Date: Mon, 23 Oct 2023 21:53:39 +0800
From: kernel test robot <lkp@intel.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Lu Baolu <baolu.lu@linux.intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [linux-next:master 11303/14422] include/linux/io-pgtable.h:172:44:
 warning: 'struct iommu_dirty_bitmap' declared inside parameter list will not
 be visible outside of this definition or declaration
Message-ID: <202310232131.TOhkKzZa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e8361b005d7c92997d12f2b85a9e4a525738bd9d
commit: 14207f68dddf152fd0b2916451a1f4702de886e4 [11303/14422] iommu: Add iommu_domain ops for dirty tracking
config: sparc64-randconfig-r002-20220915 (https://download.01.org/0day-ci/archive/20231023/202310232131.TOhkKzZa-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231023/202310232131.TOhkKzZa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310232131.TOhkKzZa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/io-pgtable.c:11:
>> include/linux/io-pgtable.h:172:44: warning: 'struct iommu_dirty_bitmap' declared inside parameter list will not be visible outside of this definition or declaration
     172 |                                     struct iommu_dirty_bitmap *dirty);
         |                                            ^~~~~~~~~~~~~~~~~~


vim +172 include/linux/io-pgtable.h

   149	
   150	/**
   151	 * struct io_pgtable_ops - Page table manipulation API for IOMMU drivers.
   152	 *
   153	 * @map_pages:    Map a physically contiguous range of pages of the same size.
   154	 * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
   155	 * @iova_to_phys: Translate iova to physical address.
   156	 *
   157	 * These functions map directly onto the iommu_ops member functions with
   158	 * the same names.
   159	 */
   160	struct io_pgtable_ops {
   161		int (*map_pages)(struct io_pgtable_ops *ops, unsigned long iova,
   162				 phys_addr_t paddr, size_t pgsize, size_t pgcount,
   163				 int prot, gfp_t gfp, size_t *mapped);
   164		size_t (*unmap_pages)(struct io_pgtable_ops *ops, unsigned long iova,
   165				      size_t pgsize, size_t pgcount,
   166				      struct iommu_iotlb_gather *gather);
   167		phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
   168					    unsigned long iova);
   169		int (*read_and_clear_dirty)(struct io_pgtable_ops *ops,
   170					    unsigned long iova, size_t size,
   171					    unsigned long flags,
 > 172					    struct iommu_dirty_bitmap *dirty);
   173	};
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
