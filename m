Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1982E0EA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 07:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686985222; x=1718521222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=18EXmf1ImqqBQryVs0M61kNZg8/G3F7WDm4OV3eMEvc=;
  b=YauU3AmGEXIkdfyzB5nOg9TzJ43JtS4Zhwwk4m9ZF+KxKWUgsiyoaYPZ
   +7SbY5mt75pBulZAtR/iM8bv9KMep71n5NoPihL0EPslSbitoMRR6IIVj
   T2bADrhfBvm+BhvpRMOAcZzTbdrL3OtWH32zwC5NWxT1HvqkU5q26omVR
   LTPLo7tdbLXCZ/WBEu7y6S0xHMb1Mv9gbhBZXR/BFKxYlvf9grCrH7fWE
   qu+qIxlEBzyFGgcV0y8tQQnf4Fnj8bxRjvk0A8JL6EYQWJKVwjp7Sn/Yi
   zwGKToSaItHPDPft1q4g6FU2NFS4Ial5vIgigYLeGkiXXp9zoyPQ1vJiK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="361903327"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="361903327"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 00:00:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="713122387"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="713122387"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 17 Jun 2023 00:00:20 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAPv2-0002Q5-07;
	Sat, 17 Jun 2023 07:00:20 +0000
Date: Sat, 17 Jun 2023 14:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [dcui-tdx:decui/upstream-tip/x86/tdx/v7-wip 7/15]
 arch/x86/hyperv/ivm.c:427: undefined reference to `__tdx_hypercall_ret'
Message-ID: <202306171459.JCFAEPYe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/upstream-tip/x86/tdx/v7-wip
head:   2ed5ddebd0892b9aba336de12ecfef74076d1ce9
commit: c95e14c94d53cbb21418b661eb397cee1c67dd24 [7/15] x86/hyperv: Support hypercalls for TDX guests
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230617/202306171459.JCFAEPYe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/dcui/tdx/commit/c95e14c94d53cbb21418b661eb397cee1c67dd24
        git remote add dcui-tdx https://github.com/dcui/tdx
        git fetch --no-tags dcui-tdx decui/upstream-tip/x86/tdx/v7-wip
        git checkout c95e14c94d53cbb21418b661eb397cee1c67dd24
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306171459.JCFAEPYe-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `hv_tdx_hypercall':
>> arch/x86/hyperv/ivm.c:427: undefined reference to `__tdx_hypercall_ret'


vim +427 arch/x86/hyperv/ivm.c

   418	
   419	u64 hv_tdx_hypercall(u64 control, u64 param1, u64 param2)
   420	{
   421		struct tdx_hypercall_args args = { };
   422	
   423		args.r10 = control;
   424		args.rdx = param1;
   425		args.r8  = param2;
   426	
 > 427		(void)__tdx_hypercall_ret(&args);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
