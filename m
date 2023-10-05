Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C309F3399F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 15:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrmDSLqX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696521564; x=1728057564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GPYaDik/BSMukCSC61ePnDGiK68X+19pXqH7sDsft2M=;
  b=mrmDSLqXZQWbnSkbJlCjnkc9gWB7hawjOjp8wlFfUZKhiuaztPv9bfbG
   uyHHugIrd8w7GguCQBW5mmsnkYu6ZIajZFWvRLoT5i2oTfTIIORgtIpaZ
   92lh3jYrJ0b8xzrSNPtQVZuiY1oIN6G7iIDUfUV+CCgEgI9am6nGCL7PH
   sh11GoLoHlK13P2LiSXwrOBYh73ATtzUOB1bi6fL3mKR2FUjYQXEQvr6A
   aI9NTof53OqgQ6e1i+7kIiDbu3uL/h3Y8hNdVHUojmiK9r9iYUSnzkoZq
   XE+T6+tXXuYx5h3ZfHzWcilZsC9q0+JG52pEO0xMUGZxTtPjryV1lHt1q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="450029505"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="450029505"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 08:59:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="895491629"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="895491629"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 05 Oct 2023 08:57:47 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoQkq-000Lay-0R;
	Thu, 05 Oct 2023 15:59:12 +0000
Date: Thu, 5 Oct 2023 23:58:35 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 3/3] pmpool: Mark reserved range as "kernel
 reserved" in kexec e820 table
Message-ID: <202310052300.FaQMeNIN-lkp@intel.com>
References: <169645820784.11424.922048380402402210.stgit@skinsburskii.>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169645820784.11424.922048380402402210.stgit@skinsburskii.>

Hi Stanislav,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/master linus/master tip/auto-latest v6.6-rc4]
[cannot apply to akpm-mm/mm-everything next-20231005]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Kinsburskii/x86-boot-e820-Expose-kexec-range-update-remove-and-table-update-functions/20231005-062443
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/169645820784.11424.922048380402402210.stgit%40skinsburskii.
patch subject: [RFC PATCH v3 3/3] pmpool: Mark reserved range as "kernel reserved" in kexec e820 table
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20231005/202310052300.FaQMeNIN-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310052300.FaQMeNIN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310052300.FaQMeNIN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/pmpool.c:14:10: fatal error: asm/e820/api.h: No such file or directory
      14 | #include <asm/e820/api.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CMA
   Depends on [n]: MMU [=n]
   Selected by [y]:
   - PMPOOL [=y]


vim +14 mm/pmpool.c

    13	
  > 14	#include <asm/e820/api.h>
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
