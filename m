Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCFF14AA5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 11:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bs2Noq1d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699614805; x=1731150805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3OJVK5M6pOOOGyhtIFkFz1xu5XmERU3bWXwtADwX4TA=;
  b=Bs2Noq1dZ8uNvbnFslp910WPUWs6YJpB1YmuOOwpwsnNPv64yc2o7af7
   ob9zW9bF44yqagtamIwoVhpZc0I+R24S9ORKV3UCgiLp4i444xCTPYfyV
   29TAqxnCpTyOdcm34tYgGZbYF/5TdZh4S8h/kUu+wZzdqN8nVO9PmemNS
   18CpUC4pM9Yf7O4Miua/92hX5+CbiDUstXTBKgJc0M2EjO+G3wCquicSS
   0zEbbmd1P0mLt0biwPKPDJsRmxq1QxDnFxgV2Ezu9O4WWDlIlAXjmvrr7
   45pmCXyqbfPw6L79dzKKXp9dqzxTebmNC0L1JClVB1520dloNyJLINGNZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="394076053"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="394076053"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 03:13:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="763734591"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="763734591"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Nov 2023 03:13:23 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1PRx-0009Yc-1S;
	Fri, 10 Nov 2023 11:13:21 +0000
Date: Fri, 10 Nov 2023 19:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 09/10] unwind: Introduce SFrame user space unwinding
Message-ID: <202311101855.npau2GOV-lkp@intel.com>
References: <09460e60dd1c2f8ea1abb8d9188195db699ce76f.1699487758.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09460e60dd1c2f8ea1abb8d9188195db699ce76f.1699487758.git.jpoimboe@kernel.org>

Hi Josh,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20231110]
[cannot apply to perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools acme/perf/core v6.6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josh-Poimboeuf/perf-Remove-get_perf_callchain-init_nr-argument/20231109-085548
base:   linus/master
patch link:    https://lore.kernel.org/r/09460e60dd1c2f8ea1abb8d9188195db699ce76f.1699487758.git.jpoimboe%40kernel.org
patch subject: [PATCH RFC 09/10] unwind: Introduce SFrame user space unwinding
config: x86_64-randconfig-001-20231110 (https://download.01.org/0day-ci/archive/20231110/202311101855.npau2GOV-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311101855.npau2GOV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311101855.npau2GOV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/unwind/user.c:9:0:
>> arch/x86/include/asm/user_unwind.h:6:13: warning: overflow in implicit constant conversion [-Woverflow]
     .ra_off  = sizeof(long) * -1,    \
                ^
   kernel/unwind/user.c:12:2: note: in expansion of macro 'ARCH_INIT_USER_FP_FRAME'
     ARCH_INIT_USER_FP_FRAME
     ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/user_unwind.h:8:13: warning: overflow in implicit constant conversion [-Woverflow]
     .fp_off  = sizeof(long) * -2,    \
                ^
   kernel/unwind/user.c:12:2: note: in expansion of macro 'ARCH_INIT_USER_FP_FRAME'
     ARCH_INIT_USER_FP_FRAME
     ^~~~~~~~~~~~~~~~~~~~~~~


vim +6 arch/x86/include/asm/user_unwind.h

c8c95a7eb658588 Josh Poimboeuf 2023-11-08   4  
c8c95a7eb658588 Josh Poimboeuf 2023-11-08   5  #define ARCH_INIT_USER_FP_FRAME						\
c8c95a7eb658588 Josh Poimboeuf 2023-11-08  @6  	.ra_off		= sizeof(long) * -1,				\
c8c95a7eb658588 Josh Poimboeuf 2023-11-08   7  	.cfa_off	= sizeof(long) * 2,				\
c8c95a7eb658588 Josh Poimboeuf 2023-11-08   8  	.fp_off		= sizeof(long) * -2,				\
c8c95a7eb658588 Josh Poimboeuf 2023-11-08   9  	.use_fp		= true,
c8c95a7eb658588 Josh Poimboeuf 2023-11-08  10  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
