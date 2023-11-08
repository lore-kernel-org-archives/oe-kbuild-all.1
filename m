Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28501CFBB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 22:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZEr/KGo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699484158; x=1731020158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zMyc0AoRpaxbDAt3JviU9G0kymSd051L8RrHfOr0v9k=;
  b=RZEr/KGoxygiP4wpcXrwUFdypLiRXzBSkqvn62v/sChI9fo18ma+3jkY
   4GBF77p5GwoTdb7Qf6Sbv6Y55b4jHF742if9LiXDN40L6YL6hFyEsQlvx
   7/cZ1b8xemudIRPfIVfLIvCjUhHblMmQoT8nAJVErAXCCcDGwGrBg3zEY
   YJEUqJsm6AkisenAJJPNCE8Mqszp64EsDUqW5fUXWc+XaMCCvNKJLGgsa
   2K0OxuRBz+IO1NXrxukR4aDXROll++uAYxpYNWxU2f27o1ph9xQCwyaqB
   YPbkjtgOI7nTv+6mZ4HDwtbUqtZ5vDhZ12jZuhUcKYADatu/b33XUQIPD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="2833479"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="2833479"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 14:55:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="886803088"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="886803088"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Nov 2023 14:55:54 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0rSh-0008Ga-1a;
	Wed, 08 Nov 2023 22:55:51 +0000
Date: Thu, 9 Nov 2023 06:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/stacktrace/kunwind 1/2]
 arch/arm64/kernel/stacktrace.c:117:42: error: 'struct kunwind_state' has no
 member named 'pc'
Message-ID: <202311090655.NIPmhCSC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/stacktrace/kunwind
head:   73ada9012201d97bd158a87e5cc0cd0c2af7c20b
commit: d8a9a6ecc87ed6e6e2e0354e56239b415c1cec67 [1/2] arm64: stacktrace: factor out kernel unwind state
config: arm64-randconfig-004-20231108 (https://download.01.org/0day-ci/archive/20231109/202311090655.NIPmhCSC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311090655.NIPmhCSC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311090655.NIPmhCSC-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/stacktrace.c: In function 'kunwind_recover_return_address':
>> arch/arm64/kernel/stacktrace.c:117:42: error: 'struct kunwind_state' has no member named 'pc'
     117 |         if (is_kretprobe_trampoline(state->pc)) {
         |                                          ^~
   arch/arm64/kernel/stacktrace.c:118:22: error: 'struct kunwind_state' has no member named 'pc'
     118 |                 state->pc = kretprobe_find_ret_addr(state->task,
         |                      ^~
>> arch/arm64/kernel/stacktrace.c:119:66: error: 'struct kunwind_state' has no member named 'fp'
     119 |                                                     (void *)state->fp,
         |                                                                  ^~


vim +117 arch/arm64/kernel/stacktrace.c

9e09d445f1cab5 Mark Rutland 2023-04-11  115  
9e09d445f1cab5 Mark Rutland 2023-04-11  116  #ifdef CONFIG_KRETPROBES
9e09d445f1cab5 Mark Rutland 2023-04-11 @117  	if (is_kretprobe_trampoline(state->pc)) {
9e09d445f1cab5 Mark Rutland 2023-04-11  118  		state->pc = kretprobe_find_ret_addr(state->task,
9e09d445f1cab5 Mark Rutland 2023-04-11 @119  						    (void *)state->fp,
9e09d445f1cab5 Mark Rutland 2023-04-11  120  						    &state->kr_cur);
9e09d445f1cab5 Mark Rutland 2023-04-11  121  	}
9e09d445f1cab5 Mark Rutland 2023-04-11  122  #endif /* CONFIG_KRETPROBES */
9e09d445f1cab5 Mark Rutland 2023-04-11  123  
9e09d445f1cab5 Mark Rutland 2023-04-11  124  	return 0;
9e09d445f1cab5 Mark Rutland 2023-04-11  125  }
9e09d445f1cab5 Mark Rutland 2023-04-11  126  

:::::: The code at line 117 was first introduced by commit
:::::: 9e09d445f1cab518eedf4454d119ead27979b8f4 arm64: stacktrace: recover return address for first entry

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
