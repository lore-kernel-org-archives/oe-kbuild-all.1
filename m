Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2417C2EFD81
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 17:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752254039; cv=none; b=jfzQig9+h65UN/O6cfiWyIA9KKYKfMLwuPk8wwPBlXUwEpL7Kij3oVvD5NrGmY4N1UzuDTau+UwflG3Z6prrGu+CEo1pC8YqA7MDv5piSMccCIsTAQhFexpRXyPmDXdRhxjDf94ESp+KnKV1rkHTPAW/mk5VdmcWCreRbrvwy/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752254039; c=relaxed/simple;
	bh=XMbRIVkwobmiz6YGt2DG45vgqNNFxiLj6dawk2pkXVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UcTYX0XykPEciGTXhgIxeLJWtHf0eZptVdPnRuG9WCk6ohYIi1DBNChphz37OZ60+ToO4XjLD/1Yc3+eaxUfvMJ2EDiwK3ZJOxxY/bw6JUXkoXnnqGS48IGIFbBt4FbjZEUZUuLidUTaBUTcjItsuy+GFipE7KCvWmO6MUGZ5Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8BE456i; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8BE456i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752254037; x=1783790037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XMbRIVkwobmiz6YGt2DG45vgqNNFxiLj6dawk2pkXVo=;
  b=Y8BE456ifBXEw5l+Ckx1APpN3he4gf6t0P+mZZNhlfA1VPjj27v2cx0+
   0znujPzA0inJ13AUaTxQlO8u1LTm/ucbI5jxo7i2pL18zCOsQNXjwkEKc
   itR/1z72LTi0EC/KFnAimp2rPsTEP0RAG+TJzH/rYzKPIu9sAm0TGuAXl
   Z/1Ln8MgUMLt32H92vZzK3CmtAYr6JMUpmWgmazDkHR5F3OjSNLF0KxrD
   Tl9tlX3aVFW3yX37Uk65VRc/I7Z67kSM2LvEl61peI6aPeigydPPuyjJY
   LxFap0Ykkm8w7NU20UDsd10espXFCtT5VviCSRukMLz/Sn0f8uFdIa2HF
   Q==;
X-CSE-ConnectionGUID: 3Af/MBIlRJ2ehwHRlTU2mQ==
X-CSE-MsgGUID: 6fcAiYrMQVeKliSRYLirlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72004683"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="72004683"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 10:13:56 -0700
X-CSE-ConnectionGUID: Oh6euQBHTTqY6fFsFL4JQQ==
X-CSE-MsgGUID: AOrRSEQ5RfS+5+jFN7IsgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="156508666"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jul 2025 10:13:55 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaHJo-0006b1-1u;
	Fri, 11 Jul 2025 17:13:52 +0000
Date: Sat, 12 Jul 2025 01:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: [linux-next:master 8533/9053] include/linux/limits.h:11:25: warning:
 conversion from 'long long unsigned int' to 'long unsigned int' changes
 value from '18446744073709551615' to '4294967295'
Message-ID: <202507120122.8Tizf08n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a62b7a37e6fcf4a675b1548e7c168b96ec836442
commit: 44b6b311bedcd301731cf16738373bd66f7e96c8 [8533/9053] iommufd: Add mmap interface
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250712/202507120122.8Tizf08n-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507120122.8Tizf08n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507120122.8Tizf08n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/overflow.h:6,
                    from include/linux/string.h:13,
                    from include/linux/scatterlist.h:5,
                    from include/linux/iommu.h:10,
                    from drivers/iommu/iommufd/iommufd_private.h:7,
                    from drivers/iommu/iommufd/driver.c:4:
   drivers/iommu/iommufd/driver.c: In function '_iommufd_alloc_mmap':
>> include/linux/limits.h:11:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
      11 | #define PHYS_ADDR_MAX   (~(phys_addr_t)0)
         |                         ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/driver.c:61:43: note: in expansion of macro 'PHYS_ADDR_MAX'
      61 |                                PAGE_SIZE, PHYS_ADDR_MAX, GFP_KERNEL);
         |                                           ^~~~~~~~~~~~~


vim +11 include/linux/limits.h

54d50897d544c87 Masahiro Yamada 2019-03-07   8  
54d50897d544c87 Masahiro Yamada 2019-03-07   9  #define SIZE_MAX	(~(size_t)0)
dabba87229411a5 Pasha Tatashin  2022-05-27  10  #define SSIZE_MAX	((ssize_t)(SIZE_MAX >> 1))
54d50897d544c87 Masahiro Yamada 2019-03-07 @11  #define PHYS_ADDR_MAX	(~(phys_addr_t)0)
54d50897d544c87 Masahiro Yamada 2019-03-07  12  

:::::: The code at line 11 was first introduced by commit
:::::: 54d50897d544c874562253e2a8f70dfcad22afe8 linux/kernel.h: split *_MAX and *_MIN macros into <linux/limits.h>

:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
