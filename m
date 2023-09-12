Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6929D944C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 18:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694544082; x=1726080082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rj0SE3CciN0z4kfrezXr0AOEMO+hADJyWx1mFzQixto=;
  b=bY1IMxPEtmMUJRFQDNHPHdBVAxGJz7GPQvyOderPBdPvGUprzDbafsEh
   V2VnlskeuASYbPNqThZvAuqF9VgnO7tIJ7zB9blDG4dnkg8Z0F7yRSsQU
   nxq7FV7u5/KxI4NTR5nr2Ojq1uclsyl91JLK/NuX83VRLADDRV9S1F2mH
   KjfvcRnf/k/xchBVgSZFhyTVr4kTUAsQjFo0Y1KhvHrbg86QmTUX+jWO3
   TEOmi/sXpWZvhJtx9nei44e0M1qoLW6ZxR3MQVDHZTmWQ2kUXlmx+7tJ/
   sTx3fVot0fbzAAejbF1VLtEGQ2n2BavsY7OY/GmmNe2gfsrhHfWkRFwIT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="382270974"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="382270974"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 11:41:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="720516087"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="720516087"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Sep 2023 11:41:12 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg8Jy-00007v-2O;
	Tue, 12 Sep 2023 18:41:10 +0000
Date: Wed, 13 Sep 2023 02:40:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-next 52/321] arch/x86/hyperv/ivm.c:388:18:
 error: 'struct tdx_hypercall_args' has no member named 'r10'
Message-ID: <202309130245.pyp4qyT6-lkp@intel.com>
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
commit: 0e818a85fca5bd4f4a9311dc5dfd250bfe9b88d9 [52/321] x86/tdx: Remove 'struct tdx_hypercall_args'
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230913/202309130245.pyp4qyT6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130245.pyp4qyT6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130245.pyp4qyT6-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/hyperv/ivm.c: In function 'hv_tdx_msr_write':
>> arch/x86/hyperv/ivm.c:387:16: error: variable 'args' has initializer but incomplete type
     387 |         struct tdx_hypercall_args args = {
         |                ^~~~~~~~~~~~~~~~~~
>> arch/x86/hyperv/ivm.c:388:18: error: 'struct tdx_hypercall_args' has no member named 'r10'
     388 |                 .r10 = TDX_HYPERCALL_STANDARD,
         |                  ^~~
   In file included from arch/x86/include/asm/tdx.h:11,
                    from arch/x86/include/asm/kvm_para.h:10,
                    from arch/x86/include/asm/hypervisor.h:37,
                    from arch/x86/hyperv/ivm.c:19:
   arch/x86/include/asm/shared/tdx.h:8:33: warning: excess elements in struct initializer
       8 | #define TDX_HYPERCALL_STANDARD  0
         |                                 ^
   arch/x86/hyperv/ivm.c:388:24: note: in expansion of macro 'TDX_HYPERCALL_STANDARD'
     388 |                 .r10 = TDX_HYPERCALL_STANDARD,
         |                        ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx.h:8:33: note: (near initialization for 'args')
       8 | #define TDX_HYPERCALL_STANDARD  0
         |                                 ^
   arch/x86/hyperv/ivm.c:388:24: note: in expansion of macro 'TDX_HYPERCALL_STANDARD'
     388 |                 .r10 = TDX_HYPERCALL_STANDARD,
         |                        ^~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/hyperv/ivm.c:389:18: error: 'struct tdx_hypercall_args' has no member named 'r11'
     389 |                 .r11 = EXIT_REASON_MSR_WRITE,
         |                  ^~~
   In file included from arch/x86/hyperv/ivm.c:25:
   arch/x86/include/uapi/asm/vmx.h:61:41: warning: excess elements in struct initializer
      61 | #define EXIT_REASON_MSR_WRITE           32
         |                                         ^~
   arch/x86/hyperv/ivm.c:389:24: note: in expansion of macro 'EXIT_REASON_MSR_WRITE'
     389 |                 .r11 = EXIT_REASON_MSR_WRITE,
         |                        ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/uapi/asm/vmx.h:61:41: note: (near initialization for 'args')
      61 | #define EXIT_REASON_MSR_WRITE           32
         |                                         ^~
   arch/x86/hyperv/ivm.c:389:24: note: in expansion of macro 'EXIT_REASON_MSR_WRITE'
     389 |                 .r11 = EXIT_REASON_MSR_WRITE,
         |                        ^~~~~~~~~~~~~~~~~~~~~
>> arch/x86/hyperv/ivm.c:390:18: error: 'struct tdx_hypercall_args' has no member named 'r12'
     390 |                 .r12 = msr,
         |                  ^~~
   arch/x86/hyperv/ivm.c:390:24: warning: excess elements in struct initializer
     390 |                 .r12 = msr,
         |                        ^~~
   arch/x86/hyperv/ivm.c:390:24: note: (near initialization for 'args')
>> arch/x86/hyperv/ivm.c:391:18: error: 'struct tdx_hypercall_args' has no member named 'r13'
     391 |                 .r13 = val,
         |                  ^~~
   arch/x86/hyperv/ivm.c:391:24: warning: excess elements in struct initializer
     391 |                 .r13 = val,
         |                        ^~~
   arch/x86/hyperv/ivm.c:391:24: note: (near initialization for 'args')
>> arch/x86/hyperv/ivm.c:387:35: error: storage size of 'args' isn't known
     387 |         struct tdx_hypercall_args args = {
         |                                   ^~~~
   arch/x86/hyperv/ivm.c:387:35: warning: unused variable 'args' [-Wunused-variable]
   arch/x86/hyperv/ivm.c: In function 'hv_tdx_msr_read':
   arch/x86/hyperv/ivm.c:401:16: error: variable 'args' has initializer but incomplete type
     401 |         struct tdx_hypercall_args args = {
         |                ^~~~~~~~~~~~~~~~~~
   arch/x86/hyperv/ivm.c:402:18: error: 'struct tdx_hypercall_args' has no member named 'r10'
     402 |                 .r10 = TDX_HYPERCALL_STANDARD,
         |                  ^~~
   arch/x86/include/asm/shared/tdx.h:8:33: warning: excess elements in struct initializer
       8 | #define TDX_HYPERCALL_STANDARD  0
         |                                 ^
   arch/x86/hyperv/ivm.c:402:24: note: in expansion of macro 'TDX_HYPERCALL_STANDARD'
     402 |                 .r10 = TDX_HYPERCALL_STANDARD,
         |                        ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx.h:8:33: note: (near initialization for 'args')
       8 | #define TDX_HYPERCALL_STANDARD  0
         |                                 ^
   arch/x86/hyperv/ivm.c:402:24: note: in expansion of macro 'TDX_HYPERCALL_STANDARD'
     402 |                 .r10 = TDX_HYPERCALL_STANDARD,
         |                        ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/hyperv/ivm.c:403:18: error: 'struct tdx_hypercall_args' has no member named 'r11'
     403 |                 .r11 = EXIT_REASON_MSR_READ,
         |                  ^~~
   arch/x86/include/uapi/asm/vmx.h:60:41: warning: excess elements in struct initializer
      60 | #define EXIT_REASON_MSR_READ            31
         |                                         ^~
   arch/x86/hyperv/ivm.c:403:24: note: in expansion of macro 'EXIT_REASON_MSR_READ'
     403 |                 .r11 = EXIT_REASON_MSR_READ,
         |                        ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/uapi/asm/vmx.h:60:41: note: (near initialization for 'args')
      60 | #define EXIT_REASON_MSR_READ            31
         |                                         ^~
   arch/x86/hyperv/ivm.c:403:24: note: in expansion of macro 'EXIT_REASON_MSR_READ'
     403 |                 .r11 = EXIT_REASON_MSR_READ,
         |                        ^~~~~~~~~~~~~~~~~~~~
   arch/x86/hyperv/ivm.c:404:18: error: 'struct tdx_hypercall_args' has no member named 'r12'
     404 |                 .r12 = msr,
         |                  ^~~
   arch/x86/hyperv/ivm.c:404:24: warning: excess elements in struct initializer
     404 |                 .r12 = msr,
         |                        ^~~
   arch/x86/hyperv/ivm.c:404:24: note: (near initialization for 'args')
   arch/x86/hyperv/ivm.c:401:35: error: storage size of 'args' isn't known
     401 |         struct tdx_hypercall_args args = {
         |                                   ^~~~
   arch/x86/hyperv/ivm.c:407:19: error: implicit declaration of function '__tdx_hypercall_ret'; did you mean '__tdx_hypercall'? [-Werror=implicit-function-declaration]
     407 |         u64 ret = __tdx_hypercall_ret(&args);
         |                   ^~~~~~~~~~~~~~~~~~~
         |                   __tdx_hypercall
   arch/x86/hyperv/ivm.c:401:35: warning: unused variable 'args' [-Wunused-variable]
     401 |         struct tdx_hypercall_args args = {
         |                                   ^~~~
   arch/x86/hyperv/ivm.c: In function 'hv_tdx_hypercall':
   arch/x86/hyperv/ivm.c:417:16: error: variable 'args' has initializer but incomplete type
     417 |         struct tdx_hypercall_args args = { };
         |                ^~~~~~~~~~~~~~~~~~
   arch/x86/hyperv/ivm.c:417:35: error: storage size of 'args' isn't known
     417 |         struct tdx_hypercall_args args = { };
         |                                   ^~~~
   arch/x86/hyperv/ivm.c:417:35: warning: unused variable 'args' [-Wunused-variable]
   arch/x86/hyperv/ivm.c:426:1: error: control reaches end of non-void function [-Werror=return-type]
     426 | }
         | ^
   cc1: some warnings being treated as errors


vim +388 arch/x86/hyperv/ivm.c

d3a9d7e49d1531 Dexuan Cui 2023-08-24  383  
b9b4fe3a72b60c Dexuan Cui 2023-08-24  384  #ifdef CONFIG_INTEL_TDX_GUEST
b9b4fe3a72b60c Dexuan Cui 2023-08-24  385  static void hv_tdx_msr_write(u64 msr, u64 val)
b9b4fe3a72b60c Dexuan Cui 2023-08-24  386  {
b9b4fe3a72b60c Dexuan Cui 2023-08-24 @387  	struct tdx_hypercall_args args = {
b9b4fe3a72b60c Dexuan Cui 2023-08-24 @388  		.r10 = TDX_HYPERCALL_STANDARD,
b9b4fe3a72b60c Dexuan Cui 2023-08-24 @389  		.r11 = EXIT_REASON_MSR_WRITE,
b9b4fe3a72b60c Dexuan Cui 2023-08-24 @390  		.r12 = msr,
b9b4fe3a72b60c Dexuan Cui 2023-08-24 @391  		.r13 = val,
b9b4fe3a72b60c Dexuan Cui 2023-08-24  392  	};
b9b4fe3a72b60c Dexuan Cui 2023-08-24  393  
b9b4fe3a72b60c Dexuan Cui 2023-08-24  394  	u64 ret = __tdx_hypercall(&args);
b9b4fe3a72b60c Dexuan Cui 2023-08-24  395  
b9b4fe3a72b60c Dexuan Cui 2023-08-24  396  	WARN_ONCE(ret, "Failed to emulate MSR write: %lld\n", ret);
b9b4fe3a72b60c Dexuan Cui 2023-08-24  397  }
b9b4fe3a72b60c Dexuan Cui 2023-08-24  398  

:::::: The code at line 388 was first introduced by commit
:::::: b9b4fe3a72b60c8d74a9ffb61aa778f04eaddd87 x86/hyperv: Use TDX GHCI to access some MSRs in a TDX VM with the paravisor

:::::: TO: Dexuan Cui <decui@microsoft.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
