Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8828F15D5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 05:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696310671; x=1727846671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lsK7/W1kpK5YnBwCU9gy8dni+vf1DQZcQd5q6bqvHa4=;
  b=cAWCT8IaiLO0TzyVjZUfuAgtnl920an4gZJFHa7J1VDTSmd3o8M305X9
   jpO7Kw8Let8VkSyXpNx/HQbHUSBZfNRBfKpspN51vld12lD3AVbhCE+Oq
   m72Q8nb0L+j8qviNmhdmFYFHaCFy2fCKyapDe5GSi+2mfZr17IeDeclND
   YdGal+yaANmc9jNNaCGTPQnDgeQ5M6By0HrCYeBCZsVZAFjtksM1IVVnm
   4u87X+w3JFhL8XAK2Bz4ofudfFj/zaIWM+LkLcclH5iNskLAMIwuZejpu
   OvGYfGA7yK4gIyPL/6l6tHPoKIO53u/29BOytOLRTOA8VeIq16W4ahxJv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="385617706"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="385617706"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 22:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="744366778"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="744366778"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 02 Oct 2023 22:24:28 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnXtR-0006nv-31;
	Tue, 03 Oct 2023 05:24:25 +0000
Date: Tue, 3 Oct 2023 13:23:03 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/4] mm/mempolicy: Implement set_mempolicy2 and
Message-ID: <202310031347.QuX07lzo-lkp@intel.com>
References: <20231003002156.740595-3-gregory.price@memverge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003002156.740595-3-gregory.price@memverge.com>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-mempolicy-refactor-do_set_mempolicy-for-code-re-use/20231003-082354
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231003002156.740595-3-gregory.price%40memverge.com
patch subject: [RFC PATCH v2 2/4] mm/mempolicy: Implement set_mempolicy2 and
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231003/202310031347.QuX07lzo-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310031347.QuX07lzo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310031347.QuX07lzo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1573:2: warning: #warning syscall set_mempolicy2 not implemented [-Wcpp]
>> <stdin>:1576:2: warning: #warning syscall get_mempolicy2 not implemented [-Wcpp]
--
   In file included from mm/fadvise.c:19:
>> include/linux/syscalls.h:816:43: warning: 'struct mempolicy_args' declared inside parameter list will not be visible outside of this definition or declaration
     816 | asmlinkage long sys_get_mempolicy2(struct mempolicy_args __user *args,
         |                                           ^~~~~~~~~~~~~~
   include/linux/syscalls.h:818:43: warning: 'struct mempolicy_args' declared inside parameter list will not be visible outside of this definition or declaration
     818 | asmlinkage long sys_set_mempolicy2(struct mempolicy_args __user *args,
         |                                           ^~~~~~~~~~~~~~
   In file included from mm/fadvise.c:24:
   mm/internal.h: In function 'shrinker_debugfs_name_alloc':
   mm/internal.h:1223:9: warning: function 'shrinker_debugfs_name_alloc' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1223 |         shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
         |         ^~~~~~~~
--
   In file included from mm/mincore.c:15:
>> include/linux/syscalls.h:816:43: warning: 'struct mempolicy_args' declared inside parameter list will not be visible outside of this definition or declaration
     816 | asmlinkage long sys_get_mempolicy2(struct mempolicy_args __user *args,
         |                                           ^~~~~~~~~~~~~~
   include/linux/syscalls.h:818:43: warning: 'struct mempolicy_args' declared inside parameter list will not be visible outside of this definition or declaration
     818 | asmlinkage long sys_set_mempolicy2(struct mempolicy_args __user *args,
         |                                           ^~~~~~~~~~~~~~
--
>> <stdin>:1573:2: warning: #warning syscall set_mempolicy2 not implemented [-Wcpp]
>> <stdin>:1576:2: warning: #warning syscall get_mempolicy2 not implemented [-Wcpp]
--
>> <stdin>:1573:2: warning: #warning syscall set_mempolicy2 not implemented [-Wcpp]
>> <stdin>:1576:2: warning: #warning syscall get_mempolicy2 not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
