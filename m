Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12062658
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 02:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694743992; x=1726279992;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o0ihxlD9VGYdDUFHJQC3Y4QhtalS/ktYCLLHzl7ZjXs=;
  b=DCJoBKm+bqPgI1yTwmDd//5fqd2CTcBpTjgSQD72BxvNlYZZzsabtmfL
   G6E+DgqWy5L1oosX5GBZmK7EFfoXgy7ty+rEynqhCOk3B6I4bLhNT1sCz
   y7gw3qViisudqMrxkTWX3Fl6wtAl2YIqcTU6sy6VbkGvd5P4JWA2WY8cm
   x4HVtP8UYVDroM3+W/VnrE5IHX6rpTEZrfDWzI3KhaHZ8lUItj/frAREh
   kK5F/MlVa3bP+fPieSKy9V7DuTPzg7ja0Ka/P5nz9Nwxl3ymDMhqgyGoO
   Lu6alsTeLTiQdDL3l8KUZyrEv3awZqxmL0usHD2DZVUXrj1LaSoXSKhFF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="410077489"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="410077489"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 19:13:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="1075621684"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="1075621684"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Sep 2023 19:13:10 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgyKS-0002J5-0L;
	Fri, 15 Sep 2023 02:13:08 +0000
Date: Fri, 15 Sep 2023 10:12:17 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/3] mm/mempolicy: Implement set_mempolicy2 and
 get_mempolicy2 syscalls
Message-ID: <202309150911.zqWpX8gL-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-mempolicy-refactor-do_set_mempolicy-for-code-re-use/20230915-075649
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230914235457.482710-3-gregory.price%40memverge.com
patch subject: [RFC PATCH 2/3] mm/mempolicy: Implement set_mempolicy2 and get_mempolicy2 syscalls
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230915/202309150911.zqWpX8gL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309150911.zqWpX8gL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309150911.zqWpX8gL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1573:2: warning: #warning syscall set_mempolicy2 not implemented [-Wcpp]
>> <stdin>:1576:2: warning: #warning syscall get_mempolicy2 not implemented [-Wcpp]
--
   In file included from mm/fadvise.c:19:
>> include/linux/syscalls.h:816:43: warning: 'struct mempolicy_args' declared inside parameter list will not be visible outside of this definition or declaration
     816 | asmlinkage long sys_get_mempolicy2(struct mempolicy_args __user *args);
         |                                           ^~~~~~~~~~~~~~
   include/linux/syscalls.h:817:43: warning: 'struct mempolicy_args' declared inside parameter list will not be visible outside of this definition or declaration
     817 | asmlinkage long sys_set_mempolicy2(struct mempolicy_args __user *args);
         |                                           ^~~~~~~~~~~~~~
--
>> <stdin>:1573:2: warning: #warning syscall set_mempolicy2 not implemented [-Wcpp]
>> <stdin>:1576:2: warning: #warning syscall get_mempolicy2 not implemented [-Wcpp]
--
   WARNING: unmet direct dependencies detected for STACKTRACE
   Depends on [n]: STACKTRACE_SUPPORT
   Selected by [y]:
   - STACKDEPOT [=y]
>> <stdin>:1573:2: warning: #warning syscall set_mempolicy2 not implemented [-Wcpp]
>> <stdin>:1576:2: warning: #warning syscall get_mempolicy2 not implemented [-Wcpp]

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for STACKTRACE
   Depends on [n]: STACKTRACE_SUPPORT
   Selected by [y]:
   - STACKDEPOT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
