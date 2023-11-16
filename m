Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C9E2E62B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 15:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BwZz9KaF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700148662; x=1731684662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/3UBU/01HZtRXWAKIosXLthoG0j/tLMkTWVU/W7t+PA=;
  b=BwZz9KaFZmomxqQmG5BGs80SXHSgl+pYa/02dkRN72MkW8dChv5eUP74
   juEv4kiaUeCYE1dFq1yvcmIwMeuCMdCzkKz+xGUbjlnO8oTIn76/WcSWN
   yp5jSL6fdrgkYnqPOi6JV2MLef9CrX6yNxsSv+6whySeqLGLJ9gdZ/Sii
   +YE2PAXAA9e6aQLUh/VH3AHTf/+uVArFi8ieEv/GswKBiiDfybidE4dUZ
   mKvx+USon8rgKEw3jacTG8MlTmNq6ACIo+361QAZFJfZigZ5oHicDnMvW
   bI7T6lAFw7oOMvUxQQR8h6qow/cyu3JS0HMmWS/yq8pa7pLYa0Q+zwZj9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="370467598"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; 
   d="scan'208";a="370467598"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 07:30:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="831298270"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; 
   d="scan'208";a="831298270"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 16 Nov 2023 07:30:53 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3eKR-0001pn-2L;
	Thu, 16 Nov 2023 15:30:51 +0000
Date: Thu, 16 Nov 2023 23:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 09/12] mm/gup: Handle huge pud for follow_pud_mask()
Message-ID: <202311162318.DiZaXRK9-lkp@intel.com>
References: <20231116012908.392077-10-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116012908.392077-10-peterx@redhat.com>

Hi Peter,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Xu/mm-hugetlb-Export-hugetlbfs_pagecache_present/20231116-093155
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231116012908.392077-10-peterx%40redhat.com
patch subject: [PATCH RFC 09/12] mm/gup: Handle huge pud for follow_pud_mask()
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231116/202311162318.DiZaXRK9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311162318.DiZaXRK9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311162318.DiZaXRK9-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `follow_pud_mask.constprop.0.isra.0':
>> gup.c:(.text+0x22307f): undefined reference to `follow_huge_pud'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
