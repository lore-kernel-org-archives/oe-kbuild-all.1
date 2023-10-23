Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA02219EE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 18:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DYBoe94g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698086177; x=1729622177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0VC9viOFRqa4oKiS46czmBtHUwRMU9jEHhA7NmVqtwo=;
  b=DYBoe94gHON/nisIE9Wl+tNuhqpKpfAHu6od5Y9VEvjO0uEFdxdnjQ4P
   c9vPXAvLdaLQzvho8pkKkC5kCtFYeeuCQYuPxmHo53YTedz4xpEjF0Dw8
   TFo5cFG7pcOO2956l1gjTtCSnGlg3uzAQ8dS76Osn4unakz06epkKA0Sy
   fwo2QiIzBVL564BpnoCzd8NxKhL2bTW7mt+3iISFXMmq6OxXzqwytXo5r
   aiGEjAtwM6CJdECPKReASNXWcjavRp4U+S/V/y0gjHAHaIklrQc6yxBds
   ythVkLqRFCBNZfyhsgXj0MZ/8smsYPbhs6XS0HV3HcQM0JQcOadOmr00f
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="390787348"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="390787348"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 11:36:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="848854029"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="848854029"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Oct 2023 11:36:06 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quzmW-00079p-1o;
	Mon, 23 Oct 2023 18:36:04 +0000
Date: Tue, 24 Oct 2023 02:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Subject: [linux-next:master 11306/14422]
 drivers/iommu/iommufd/hw_pagetable.c:234:undefined reference to `__udivdi3'
Message-ID: <202310240246.FyXNZrbZ-lkp@intel.com>
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
commit: 1337d793ea254e9b6e79568e1dd063c6ed8c2741 [11306/14422] iommufd: Add IOMMU_HWPT_GET_DIRTY_BITMAP
config: microblaze-randconfig-r015-20230422 (https://download.01.org/0day-ci/archive/20231024/202310240246.FyXNZrbZ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310240246.FyXNZrbZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240246.FyXNZrbZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/iommu/iommufd/hw_pagetable.o: in function `iommufd_check_iova_range':
>> drivers/iommu/iommufd/hw_pagetable.c:234:(.text+0x99c): undefined reference to `__udivdi3'
   microblaze-linux-ld: drivers/iommu/iommufd/hw_pagetable.o: in function `iommufd_hwpt_get_dirty_bitmap':
   drivers/iommu/iommufd/hw_pagetable.c:234:(.text+0xa6c): undefined reference to `__udivdi3'


vim +234 drivers/iommu/iommufd/hw_pagetable.c

   223	
   224	int iommufd_check_iova_range(struct iommufd_ioas *ioas,
   225				     struct iommu_hwpt_get_dirty_bitmap *bitmap)
   226	{
   227		unsigned long npages;
   228		size_t iommu_pgsize;
   229		int rc = -EINVAL;
   230	
   231		if (!bitmap->page_size)
   232			return rc;
   233	
 > 234		npages = bitmap->length / bitmap->page_size;
   235		if (!npages || (npages > ULONG_MAX))
   236			return rc;
   237	
   238		iommu_pgsize = ioas->iopt.iova_alignment;
   239	
   240		if (bitmap->iova & (iommu_pgsize - 1))
   241			return rc;
   242	
   243		if (!bitmap->length || bitmap->length & (iommu_pgsize - 1))
   244			return rc;
   245	
   246		return 0;
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
