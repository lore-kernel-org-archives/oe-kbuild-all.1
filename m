Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEE714A97
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 11:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GI6D9slB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698059930; x=1729595930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KA9DNhcrTvsUHxf9h4KBPhbHw/uFNLpx4j6sIg1FsC8=;
  b=GI6D9slBK1Q8Vs1mULFT0NzatDyiK7WCGDfQm55w3xf5T0JsjdTaE6WL
   dE/SoxSEPkroO3NmD+xFrMNrE8t/OLT2w7tWMcM2kdy2Shdt380E8HJ+E
   vqaPsogZNpBc5iZae79pzn+EUL90rEqT/p8paqN8c1T11vfJzG8Rhc75q
   YsYHzlMuv8IMOwI2btDSDG0Ko7CyE+umaamaW9B5kAfgqv8VLIcVwjzgj
   RCvIz4T63Tuqd+qtqUDm25rmj0WIistI3L+lROMt+1mRZtafII2VQoT0T
   yFb29yzsPFXmSJVsUDjMf/pEMYnNZtuMcfk/ypE8F1aSLgDdB3y9bkCdB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="453288118"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="453288118"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 04:18:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="874676670"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="874676670"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Oct 2023 04:18:47 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qusxJ-0006pz-1s;
	Mon, 23 Oct 2023 11:18:45 +0000
Date: Mon, 23 Oct 2023 19:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Subject: [linux-next:master 11306/14422] hw_pagetable.c:undefined reference
 to `__udivdi3'
Message-ID: <202310231933.c8k54ybn-lkp@intel.com>
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
config: xtensa-randconfig-r003-20230213 (https://download.01.org/0day-ci/archive/20231023/202310231933.c8k54ybn-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231023/202310231933.c8k54ybn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310231933.c8k54ybn-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/iommu/iommufd/hw_pagetable.o: in function `iommufd_hwpt_alloc':
>> hw_pagetable.c:(.text+0x440): undefined reference to `__udivdi3'
>> xtensa-linux-ld: hw_pagetable.c:(.text+0x468): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
