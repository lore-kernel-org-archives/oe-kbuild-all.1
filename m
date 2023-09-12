Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDB98F60
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 13:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694524081; x=1726060081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ilulUADP8iAYFvsNfRtaP3OJtd3x3yRP9r2ptrxQHks=;
  b=lEPSP7af1XkXlzCkXZTBaKnZaYNGk/rw7AXNwDYYjtKr+ejcm6OXGTdL
   7Ho8h3PmKDibjhVGOegzV59O3wdXccAWlazv28faFF7IS+WEuUVRiuRx9
   zggz0NdsvTOlhbZPJa2Ayfr2uUW/dGK2mSsQM+Br3cAVOuFSl4SkQEHcF
   XM2QLHaM6qvNBqQrklnjK8BjVS1+FpHMQKz3nXXp2HflzVJ9+Ec7RqEf4
   e9mxQ9UE68AgKY2kT9b5B6DtCDJH0DN/aMlCmDzM1ELuMEfDivYHnStB3
   3l7FlgN90lJnqejOeUfNXyC7h4bLYGl0GVR2qQlNx3uHG4s6SPbUyxV0Z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377282922"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="377282922"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 06:07:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="778791629"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="778791629"
Received: from lkp-server02.sh.intel.com (HELO 1e56c5165d33) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Sep 2023 06:07:58 -0700
Received: from kbuild by 1e56c5165d33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg37T-0000PF-2V;
	Tue, 12 Sep 2023 13:07:55 +0000
Date: Tue, 12 Sep 2023 21:07:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-next 50/321] arch/x86/hyperv/ivm.c:407:19:
 error: implicit declaration of function '__tdx_hypercall_ret'; did you mean
 '__tdx_hypercall'?
Message-ID: <202309122036.7yqqJFDg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   f6388449e0300e7413c7e2ea4875923875ddb340
commit: 39b3f9ca8e4c9e425442519642108120c1579a88 [50/321] x86/tdx: Make TDX_HYPERCALL asm similar to TDX_MODULE_CALL
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230912/202309122036.7yqqJFDg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309122036.7yqqJFDg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309122036.7yqqJFDg-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/hyperv/ivm.c: In function 'hv_tdx_msr_read':
>> arch/x86/hyperv/ivm.c:407:19: error: implicit declaration of function '__tdx_hypercall_ret'; did you mean '__tdx_hypercall'? [-Werror=implicit-function-declaration]
     407 |         u64 ret = __tdx_hypercall_ret(&args);
         |                   ^~~~~~~~~~~~~~~~~~~
         |                   __tdx_hypercall
   cc1: some warnings being treated as errors


vim +407 arch/x86/hyperv/ivm.c

b9b4fe3a72b60c Dexuan Cui 2023-08-24  398  
b9b4fe3a72b60c Dexuan Cui 2023-08-24  399  static void hv_tdx_msr_read(u64 msr, u64 *val)
b9b4fe3a72b60c Dexuan Cui 2023-08-24  400  {
b9b4fe3a72b60c Dexuan Cui 2023-08-24  401  	struct tdx_hypercall_args args = {
b9b4fe3a72b60c Dexuan Cui 2023-08-24  402  		.r10 = TDX_HYPERCALL_STANDARD,
b9b4fe3a72b60c Dexuan Cui 2023-08-24  403  		.r11 = EXIT_REASON_MSR_READ,
b9b4fe3a72b60c Dexuan Cui 2023-08-24  404  		.r12 = msr,
b9b4fe3a72b60c Dexuan Cui 2023-08-24  405  	};
b9b4fe3a72b60c Dexuan Cui 2023-08-24  406  
b9b4fe3a72b60c Dexuan Cui 2023-08-24 @407  	u64 ret = __tdx_hypercall_ret(&args);
b9b4fe3a72b60c Dexuan Cui 2023-08-24  408  
b9b4fe3a72b60c Dexuan Cui 2023-08-24  409  	if (WARN_ONCE(ret, "Failed to emulate MSR read: %lld\n", ret))
b9b4fe3a72b60c Dexuan Cui 2023-08-24  410  		*val = 0;
b9b4fe3a72b60c Dexuan Cui 2023-08-24  411  	else
b9b4fe3a72b60c Dexuan Cui 2023-08-24  412  		*val = args.r11;
b9b4fe3a72b60c Dexuan Cui 2023-08-24  413  }
a67f6b60d6ed95 Dexuan Cui 2023-08-24  414  

:::::: The code at line 407 was first introduced by commit
:::::: b9b4fe3a72b60c8d74a9ffb61aa778f04eaddd87 x86/hyperv: Use TDX GHCI to access some MSRs in a TDX VM with the paravisor

:::::: TO: Dexuan Cui <decui@microsoft.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
