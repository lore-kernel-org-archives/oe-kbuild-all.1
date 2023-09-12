Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BB4168DA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694527925; x=1726063925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PXzv8qm2hNmKvYmOAtKIAuCt9W6OZvmY50dBev2g9eA=;
  b=hRstIJ2pAGhma5yUljST2VO8E7bzIKuG2/xEB1OYSRGjH62vmuE7ySEU
   kzs4uR6vwyL9GGIqWN7Mu21EzsVMyogrRAk/QUuvgWlqk8B3qKIiQMTSM
   OYC64Q8ZMPtpNAfizXdlTTJN8MSFO1ZG76EL2o7qzVseXkAwLL8rL1AF9
   RnEZgAfwi9jDxOsX2G5bonj3+znP1NF33ng4TKgsynJPs1jYBfTbAbtUv
   xXTjJPIf/8yDY1+iKIVB5lsBynPlX2oiWGoDYfvdmmofkqxRW3UR7dsCU
   w621eXr3APVKGN7PCS/OBnOuC1Sj7tig9fFJz6zx874W7itFr4cQp7wCk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="382193290"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="382193290"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 07:12:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="813837995"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="813837995"
Received: from lkp-server02.sh.intel.com (HELO 0a6943a0b3e1) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 12 Sep 2023 07:12:02 -0700
Received: from kbuild by 0a6943a0b3e1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg47V-00003F-2d;
	Tue, 12 Sep 2023 14:12:01 +0000
Date: Tue, 12 Sep 2023 22:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-next 52/321]
 arch/x86/include/asm/shared/tdx.h:8:33: warning: excess elements in struct
 initializer
Message-ID: <202309122217.ilUPf9gd-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230912/202309122217.ilUPf9gd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309122217.ilUPf9gd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309122217.ilUPf9gd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/hyperv/ivm.c: In function 'hv_tdx_msr_write':
   arch/x86/hyperv/ivm.c:387:16: error: variable 'args' has initializer but incomplete type
     387 |         struct tdx_hypercall_args args = {
         |                ^~~~~~~~~~~~~~~~~~
   arch/x86/hyperv/ivm.c:388:18: error: 'struct tdx_hypercall_args' has no member named 'r10'
     388 |                 .r10 = TDX_HYPERCALL_STANDARD,
         |                  ^~~
   In file included from arch/x86/include/asm/tdx.h:11,
                    from arch/x86/include/asm/kvm_para.h:10,
                    from arch/x86/include/asm/hypervisor.h:37,
                    from arch/x86/hyperv/ivm.c:19:
>> arch/x86/include/asm/shared/tdx.h:8:33: warning: excess elements in struct initializer
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
   arch/x86/hyperv/ivm.c:389:18: error: 'struct tdx_hypercall_args' has no member named 'r11'
     389 |                 .r11 = EXIT_REASON_MSR_WRITE,
         |                  ^~~
   In file included from arch/x86/hyperv/ivm.c:25:
>> arch/x86/include/uapi/asm/vmx.h:61:41: warning: excess elements in struct initializer
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
   arch/x86/hyperv/ivm.c:390:18: error: 'struct tdx_hypercall_args' has no member named 'r12'
     390 |                 .r12 = msr,
         |                  ^~~
>> arch/x86/hyperv/ivm.c:390:24: warning: excess elements in struct initializer
     390 |                 .r12 = msr,
         |                        ^~~
   arch/x86/hyperv/ivm.c:390:24: note: (near initialization for 'args')
   arch/x86/hyperv/ivm.c:391:18: error: 'struct tdx_hypercall_args' has no member named 'r13'
     391 |                 .r13 = val,
         |                  ^~~
   arch/x86/hyperv/ivm.c:391:24: warning: excess elements in struct initializer
     391 |                 .r13 = val,
         |                        ^~~
   arch/x86/hyperv/ivm.c:391:24: note: (near initialization for 'args')
   arch/x86/hyperv/ivm.c:387:35: error: storage size of 'args' isn't known
     387 |         struct tdx_hypercall_args args = {
         |                                   ^~~~
>> arch/x86/hyperv/ivm.c:387:35: warning: unused variable 'args' [-Wunused-variable]
   arch/x86/hyperv/ivm.c: In function 'hv_tdx_msr_read':
   arch/x86/hyperv/ivm.c:401:16: error: variable 'args' has initializer but incomplete type
     401 |         struct tdx_hypercall_args args = {
         |                ^~~~~~~~~~~~~~~~~~
   arch/x86/hyperv/ivm.c:402:18: error: 'struct tdx_hypercall_args' has no member named 'r10'
     402 |                 .r10 = TDX_HYPERCALL_STANDARD,
         |                  ^~~
>> arch/x86/include/asm/shared/tdx.h:8:33: warning: excess elements in struct initializer
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


vim +8 arch/x86/include/asm/shared/tdx.h

4c5b9aac6cade5 Kirill A. Shutemov 2022-04-06  7  
4c5b9aac6cade5 Kirill A. Shutemov 2022-04-06 @8  #define TDX_HYPERCALL_STANDARD  0
4c5b9aac6cade5 Kirill A. Shutemov 2022-04-06  9  

:::::: The code at line 8 was first introduced by commit
:::::: 4c5b9aac6cade51aef64cc6ed67f2ad5acda9aed x86/boot: Port I/O: Add decompression-time support for TDX

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Dave Hansen <dave.hansen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
