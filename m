Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD78C2C5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 23:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694560537; x=1726096537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xLDVCjkgA0wjCuBFu4kDMpdw2SNPeiJHYCH/w7dlKhw=;
  b=Q1Q6iIkeGH0ate9jHT+nl5I6wt3s28NeBQfRcK5L2GOUAh9bhG4B2PNa
   32BT8VQhHz41NJOq1L617Tn8BxXOfiXwkI3QOb8iAmRqXC3g1YYy8dodr
   FZxPc4z7fnjcR6VjAHAVEyDU7d4mpzjl2oY61RLrMfSCIQTvl0CkC3Vq6
   ciyQBHPFsXZmY0/lSokCZRH0rP1Ie1C44dbAe7dUoGu+hhnjEBfXF9RIy
   n0njcuGA0v/krv+EGu/n2WWxlQhOlqAgUEFDw/QrW/mFOqf1IeXPSrLQw
   /sPq5qXvqQqQD3bLdOp1kRxZB6TtLW/hn7/+WJQj8uhWfu50eNEjLhK8d
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="368783638"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="368783638"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 16:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="990675285"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="990675285"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Sep 2023 16:15:06 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgCb2-0000Pp-27;
	Tue, 12 Sep 2023 23:15:04 +0000
Date: Wed, 13 Sep 2023 07:14:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [tip:x86/tdx 10/12] arch/x86/coco/tdx/tdx.c:729:32: warning: excess
 elements in struct initializer
Message-ID: <202309130740.KtUrIwC5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/tdx
head:   d6cb0f01644c5cd2bc51b88df933e07849cfaa76
commit: 8cb19d6ef21bbf7e109336f895574ed2a267ea08 [10/12] x86/tdx: Remove 'struct tdx_hypercall_args'
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230913/202309130740.KtUrIwC5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130740.KtUrIwC5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130740.KtUrIwC5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/coco/tdx/tdx.c: In function 'tdx_map_gpa':
   arch/x86/coco/tdx/tdx.c:726:24: error: variable 'args' has initializer but incomplete type
     726 |                 struct tdx_hypercall_args args = {
         |                        ^~~~~~~~~~~~~~~~~~
   arch/x86/coco/tdx/tdx.c:727:26: error: 'struct tdx_hypercall_args' has no member named 'r10'
     727 |                         .r10 = TDX_HYPERCALL_STANDARD,
         |                          ^~~
   In file included from arch/x86/include/asm/tdx.h:11,
                    from arch/x86/coco/tdx/tdx.c:11:
   arch/x86/include/asm/shared/tdx.h:8:33: warning: excess elements in struct initializer
       8 | #define TDX_HYPERCALL_STANDARD  0
         |                                 ^
   arch/x86/coco/tdx/tdx.c:727:32: note: in expansion of macro 'TDX_HYPERCALL_STANDARD'
     727 |                         .r10 = TDX_HYPERCALL_STANDARD,
         |                                ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx.h:8:33: note: (near initialization for 'args')
       8 | #define TDX_HYPERCALL_STANDARD  0
         |                                 ^
   arch/x86/coco/tdx/tdx.c:727:32: note: in expansion of macro 'TDX_HYPERCALL_STANDARD'
     727 |                         .r10 = TDX_HYPERCALL_STANDARD,
         |                                ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/coco/tdx/tdx.c:728:26: error: 'struct tdx_hypercall_args' has no member named 'r11'
     728 |                         .r11 = TDVMCALL_MAP_GPA,
         |                          ^~~
   arch/x86/include/asm/shared/tdx.h:25:41: warning: excess elements in struct initializer
      25 | #define TDVMCALL_MAP_GPA                0x10001
         |                                         ^~~~~~~
   arch/x86/coco/tdx/tdx.c:728:32: note: in expansion of macro 'TDVMCALL_MAP_GPA'
     728 |                         .r11 = TDVMCALL_MAP_GPA,
         |                                ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx.h:25:41: note: (near initialization for 'args')
      25 | #define TDVMCALL_MAP_GPA                0x10001
         |                                         ^~~~~~~
   arch/x86/coco/tdx/tdx.c:728:32: note: in expansion of macro 'TDVMCALL_MAP_GPA'
     728 |                         .r11 = TDVMCALL_MAP_GPA,
         |                                ^~~~~~~~~~~~~~~~
   arch/x86/coco/tdx/tdx.c:729:26: error: 'struct tdx_hypercall_args' has no member named 'r12'
     729 |                         .r12 = start,
         |                          ^~~
>> arch/x86/coco/tdx/tdx.c:729:32: warning: excess elements in struct initializer
     729 |                         .r12 = start,
         |                                ^~~~~
   arch/x86/coco/tdx/tdx.c:729:32: note: (near initialization for 'args')
   arch/x86/coco/tdx/tdx.c:730:26: error: 'struct tdx_hypercall_args' has no member named 'r13'
     730 |                         .r13 = end - start };
         |                          ^~~
   arch/x86/coco/tdx/tdx.c:730:32: warning: excess elements in struct initializer
     730 |                         .r13 = end - start };
         |                                ^~~
   arch/x86/coco/tdx/tdx.c:730:32: note: (near initialization for 'args')
   arch/x86/coco/tdx/tdx.c:726:43: error: storage size of 'args' isn't known
     726 |                 struct tdx_hypercall_args args = {
         |                                           ^~~~
   arch/x86/coco/tdx/tdx.c:733:27: error: implicit declaration of function '__tdx_hypercall_ret'; did you mean '__tdx_hypercall'? [-Werror=implicit-function-declaration]
     733 |                 u64 ret = __tdx_hypercall_ret(&args);
         |                           ^~~~~~~~~~~~~~~~~~~
         |                           __tdx_hypercall
>> arch/x86/coco/tdx/tdx.c:726:43: warning: unused variable 'args' [-Wunused-variable]
     726 |                 struct tdx_hypercall_args args = {
         |                                           ^~~~
   cc1: some warnings being treated as errors


vim +729 arch/x86/coco/tdx/tdx.c

7dbde763162989 Kirill A. Shutemov 2022-04-06  707  
7dbde763162989 Kirill A. Shutemov 2022-04-06  708  /*
019b383d1132e4 Dexuan Cui         2023-08-10  709   * Notify the VMM about page mapping conversion. More info about ABI
019b383d1132e4 Dexuan Cui         2023-08-10  710   * can be found in TDX Guest-Host-Communication Interface (GHCI),
019b383d1132e4 Dexuan Cui         2023-08-10  711   * section "TDG.VP.VMCALL<MapGPA>".
7dbde763162989 Kirill A. Shutemov 2022-04-06  712   */
019b383d1132e4 Dexuan Cui         2023-08-10  713  static bool tdx_map_gpa(phys_addr_t start, phys_addr_t end, bool enc)
7dbde763162989 Kirill A. Shutemov 2022-04-06  714  {
019b383d1132e4 Dexuan Cui         2023-08-10  715  	/* Retrying the hypercall a second time should succeed; use 3 just in case */
019b383d1132e4 Dexuan Cui         2023-08-10  716  	const int max_retries_per_page = 3;
019b383d1132e4 Dexuan Cui         2023-08-10  717  	int retry_count = 0;
7dbde763162989 Kirill A. Shutemov 2022-04-06  718  
7dbde763162989 Kirill A. Shutemov 2022-04-06  719  	if (!enc) {
7dbde763162989 Kirill A. Shutemov 2022-04-06  720  		/* Set the shared (decrypted) bits: */
7dbde763162989 Kirill A. Shutemov 2022-04-06  721  		start |= cc_mkdec(0);
7dbde763162989 Kirill A. Shutemov 2022-04-06  722  		end   |= cc_mkdec(0);
7dbde763162989 Kirill A. Shutemov 2022-04-06  723  	}
7dbde763162989 Kirill A. Shutemov 2022-04-06  724  
019b383d1132e4 Dexuan Cui         2023-08-10  725  	while (retry_count < max_retries_per_page) {
019b383d1132e4 Dexuan Cui         2023-08-10 @726  		struct tdx_hypercall_args args = {
019b383d1132e4 Dexuan Cui         2023-08-10  727  			.r10 = TDX_HYPERCALL_STANDARD,
019b383d1132e4 Dexuan Cui         2023-08-10  728  			.r11 = TDVMCALL_MAP_GPA,
019b383d1132e4 Dexuan Cui         2023-08-10 @729  			.r12 = start,
019b383d1132e4 Dexuan Cui         2023-08-10  730  			.r13 = end - start };
019b383d1132e4 Dexuan Cui         2023-08-10  731  
019b383d1132e4 Dexuan Cui         2023-08-10  732  		u64 map_fail_paddr;
019b383d1132e4 Dexuan Cui         2023-08-10  733  		u64 ret = __tdx_hypercall_ret(&args);
019b383d1132e4 Dexuan Cui         2023-08-10  734  
019b383d1132e4 Dexuan Cui         2023-08-10  735  		if (ret != TDVMCALL_STATUS_RETRY)
019b383d1132e4 Dexuan Cui         2023-08-10  736  			return !ret;
7dbde763162989 Kirill A. Shutemov 2022-04-06  737  		/*
019b383d1132e4 Dexuan Cui         2023-08-10  738  		 * The guest must retry the operation for the pages in the
019b383d1132e4 Dexuan Cui         2023-08-10  739  		 * region starting at the GPA specified in R11. R11 comes
019b383d1132e4 Dexuan Cui         2023-08-10  740  		 * from the untrusted VMM. Sanity check it.
7dbde763162989 Kirill A. Shutemov 2022-04-06  741  		 */
019b383d1132e4 Dexuan Cui         2023-08-10  742  		map_fail_paddr = args.r11;
019b383d1132e4 Dexuan Cui         2023-08-10  743  		if (map_fail_paddr < start || map_fail_paddr >= end)
019b383d1132e4 Dexuan Cui         2023-08-10  744  			return false;
019b383d1132e4 Dexuan Cui         2023-08-10  745  
019b383d1132e4 Dexuan Cui         2023-08-10  746  		/* "Consume" a retry without forward progress */
019b383d1132e4 Dexuan Cui         2023-08-10  747  		if (map_fail_paddr == start) {
019b383d1132e4 Dexuan Cui         2023-08-10  748  			retry_count++;
019b383d1132e4 Dexuan Cui         2023-08-10  749  			continue;
019b383d1132e4 Dexuan Cui         2023-08-10  750  		}
019b383d1132e4 Dexuan Cui         2023-08-10  751  
019b383d1132e4 Dexuan Cui         2023-08-10  752  		start = map_fail_paddr;
019b383d1132e4 Dexuan Cui         2023-08-10  753  		retry_count = 0;
019b383d1132e4 Dexuan Cui         2023-08-10  754  	}
019b383d1132e4 Dexuan Cui         2023-08-10  755  
019b383d1132e4 Dexuan Cui         2023-08-10  756  	return false;
019b383d1132e4 Dexuan Cui         2023-08-10  757  }
019b383d1132e4 Dexuan Cui         2023-08-10  758  

:::::: The code at line 729 was first introduced by commit
:::::: 019b383d1132e4051de0d2e43254454b86538cf4 x86/tdx: Retry partially-completed page conversion hypercalls

:::::: TO: Dexuan Cui <decui@microsoft.com>
:::::: CC: Dave Hansen <dave.hansen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
