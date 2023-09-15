Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C2562D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 01:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694741410; x=1726277410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ynRZuSicbz+G0tNKn+pJGJaTa+vOsE/MsiXszK0foy4=;
  b=nQWhQDm0iwGXzyNCgYrTs2yMydYP/+vzu1Wjet1zTAZ82wjCLJhUsWN5
   uaHlHa9dzLOhIj49HOS/Chq+Uor7lbPE2naPyoXlA4VYHlB/PNVDinN87
   Y3Wl/NQ1GUqcQPdit4aViJUIHd9kvWDDGTkMoy1YBWxzDOb8csbRDBPku
   g3nqBdlMZxj1NhMElTY+uUsTwcejG/SgVESgNRAuRulPqDLd9fe/xpHrW
   7iGKfbg/yCzj0K+GscWAwkxcPoIm1eN9k+pbaRK1+pY2RdStaxkL7dGSm
   5hz88DToj7PfykaGZlWLFDfhwi3g9teZ+eR85YvECw0otb7uirJOiWgvT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="382951520"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="382951520"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 18:30:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="774113607"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="774113607"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Sep 2023 18:30:08 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgxeo-0002Gj-17;
	Fri, 15 Sep 2023 01:30:06 +0000
Date: Fri, 15 Sep 2023 09:29:08 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/3] mm/mempolicy: Implement set_mempolicy2 and
 get_mempolicy2 syscalls
Message-ID: <202309150932.CRafaPQ8-lkp@intel.com>
References: <20230914235457.482710-3-gregory.price@memverge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914235457.482710-3-gregory.price@memverge.com>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-mempolicy-refactor-do_set_mempolicy-for-code-re-use/20230915-075649
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230914235457.482710-3-gregory.price%40memverge.com
patch subject: [RFC PATCH 2/3] mm/mempolicy: Implement set_mempolicy2 and get_mempolicy2 syscalls
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230915/202309150932.CRafaPQ8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309150932.CRafaPQ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309150932.CRafaPQ8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: arch/x86/entry/syscall_32.o:(.rodata+0x718): undefined reference to `__ia32_sys_set_mempolicy2'
>> ld: arch/x86/entry/syscall_32.o:(.rodata+0x71c): undefined reference to `__ia32_sys_get_mempolicy2'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
