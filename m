Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8122A36AF2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 15:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OV/gJ8qT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700150070; x=1731686070;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AG/OkLTL2SW6fItpLCAkQqMgTQiT2Gxyfew/hBLT0Rw=;
  b=OV/gJ8qTvZoHAOGbCXJ18F0shCKKCyx4bRMN9wIkzE/p/C+B/BNJRvbR
   3BhfbYPI8yJfN71ByeZu+nTtZMaSdApksOquJAQXUtq+zIWfsN3ZcX2EI
   oAkXhWCRzRUSFBm3zjpYX6gfG0qMXkqguMx/MvqpkcGiYPs8kXd4By131
   VICdb8B4OUxSVzvixMFxeS90Bf0K9LoM7nkx+LDPbsb49JOt1O30Mz7l0
   JP3xOPlbieYtMZ4MbwCvzIf1uhNC0QeMWdI72cFdF1ZG2HLpuoX7qvszj
   j05EN4VIIeGEVYHm0MPXwGaIpp3RM+Nnd/X6MJaVF+17jCjj0f18EVrKS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="395032451"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; 
   d="scan'208";a="395032451"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 07:54:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="765338133"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; 
   d="scan'208";a="765338133"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 16 Nov 2023 07:54:26 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3eh0-0001qV-22;
	Thu, 16 Nov 2023 15:54:14 +0000
Date: Thu, 16 Nov 2023 23:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 10/12] mm/gup: Handle huge pmd for follow_pmd_mask()
Message-ID: <202311162331.zb5PxT59-lkp@intel.com>
References: <20231116012908.392077-11-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116012908.392077-11-peterx@redhat.com>

Hi Peter,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Xu/mm-hugetlb-Export-hugetlbfs_pagecache_present/20231116-093155
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231116012908.392077-11-peterx%40redhat.com
patch subject: [PATCH RFC 10/12] mm/gup: Handle huge pmd for follow_pmd_mask()
config: i386-defconfig (https://download.01.org/0day-ci/archive/20231116/202311162331.zb5PxT59-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311162331.zb5PxT59-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311162331.zb5PxT59-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/gup.o: in function `follow_page_mask':
   gup.c:(.text+0x11f5): undefined reference to `follow_huge_pud'
>> ld: gup.c:(.text+0x129d): undefined reference to `follow_huge_pmd'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
