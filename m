Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661441F95D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 18:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689185168; x=1720721168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ICTF3122yooFLSSVAq21fieY1xSdagN6jQn1754SPA=;
  b=azqmLDEnw7nu+QuGq8tVYbCiHNY4LA4SIjsvuMd9aAdCu7hh+YHpgScF
   MPn/nm1+KrfEmUYviY7sAwCYo5drCai6Xb0Fh3J5oLi/2qtl/JRt0AVa1
   Mhe9fXG0MAstpbT8yfbg3u8Z/vpWgF4CWRQtJyhxVdgZnwMInqJLUjbFd
   bMzhWAC8/LJituMYcpWWG8md4skYdiUDVK6oIDX3Og3T3LCyhfOPezrP7
   Z62kAz+Dvd93Di2160zP1Yb1STuIj9lWqKWwo726un3WIi4oyaTfS53xw
   3hZfJ0q8puuWVRy254qGFdxRkxxUbbmBziA+Tm8rdKn6kPBijbujlYr5h
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="362431364"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="362431364"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 11:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="895717013"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="895717013"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Jul 2023 11:06:04 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJeDz-0005uA-2Z;
	Wed, 12 Jul 2023 18:06:03 +0000
Date: Thu, 13 Jul 2023 02:05:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:seamcall_test 30/30] arch/x86/virt/vmx/tdx/tdx.c:1345:34:
 error: storage size of 'out' isn't known
Message-ID: <202307130144.YTGiNLcL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git seamcall_test
head:   4bf79aee52c5debb946a3230f3d64dca3f33da85
commit: 4bf79aee52c5debb946a3230f3d64dca3f33da85 [30/30] x86/mce: Improve error log of kernel space TDX #MC due to erratum
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230713/202307130144.YTGiNLcL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130144.YTGiNLcL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130144.YTGiNLcL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/x86/virt/vmx/tdx/tdx.c: In function 'tdx_is_private_mem':
>> arch/x86/virt/vmx/tdx/tdx.c:1345:34: error: storage size of 'out' isn't known
    1345 |         struct tdx_module_output out;
         |                                  ^~~
>> arch/x86/virt/vmx/tdx/tdx.c:1352:54: warning: passing argument 2 of '__seamcall' makes pointer from integer without a cast [-Wint-conversion]
    1352 |         sret = __seamcall(TDH_PHYMEM_PAGE_RDMD, phys & PAGE_MASK,
   In file included from arch/x86/virt/vmx/tdx/tdx.c:34:
   arch/x86/include/asm/tdx.h:90:48: note: expected 'struct tdx_module_args *' but argument is of type 'long unsigned int'
      90 | u64 __seamcall(u64 fn, struct tdx_module_args *args);
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/x86/virt/vmx/tdx/tdx.c:1352:16: error: too many arguments to function '__seamcall'
    1352 |         sret = __seamcall(TDH_PHYMEM_PAGE_RDMD, phys & PAGE_MASK,
         |                ^~~~~~~~~~
   arch/x86/include/asm/tdx.h:90:5: note: declared here
      90 | u64 __seamcall(u64 fn, struct tdx_module_args *args);
         |     ^~~~~~~~~~
>> arch/x86/virt/vmx/tdx/tdx.c:1345:34: warning: unused variable 'out' [-Wunused-variable]
    1345 |         struct tdx_module_output out;
         |                                  ^~~
   arch/x86/virt/vmx/tdx/tdx.c:1402:1: error: control reaches end of non-void function [-Werror=return-type]
    1402 | }
         | ^
   cc1: some warnings being treated as errors


vim +1345 arch/x86/virt/vmx/tdx/tdx.c

  1333	
  1334	/*
  1335	 * Return whether the memory page at the given physical address is TDX
  1336	 * private memory or not.  Called from #MC handler do_machine_check().
  1337	 *
  1338	 * Note this function may not return an accurate result in rare cases.
  1339	 * This is fine as the #MC handler doesn't need a 100% accurate result,
  1340	 * because it cannot distinguish #MC between software bug and real
  1341	 * hardware error anyway.
  1342	 */
  1343	bool tdx_is_private_mem(unsigned long phys)
  1344	{
> 1345		struct tdx_module_output out;
  1346		u64 sret;
  1347	
  1348		if (!platform_tdx_enabled())
  1349			return false;
  1350	
  1351		/* Get page type from the TDX module */
> 1352		sret = __seamcall(TDH_PHYMEM_PAGE_RDMD, phys & PAGE_MASK,
  1353				0, 0, 0, &out);
  1354		/*
  1355		 * Handle the case that CPU isn't in VMX operation.
  1356		 *
  1357		 * KVM guarantees no VM is running (thus no TDX guest)
  1358		 * when there's any online CPU isn't in VMX operation.
  1359		 * This means there will be no TDX guest private memory
  1360		 * and Secure-EPT pages.  However the TDX module may have
  1361		 * been initialized and the memory page could be PAMT.
  1362		 */
  1363		if (sret == TDX_SEAMCALL_UD)
  1364			return is_pamt_page(phys);
  1365	
  1366		/*
  1367		 * Any other failure means:
  1368		 *
  1369		 * 1) TDX module not loaded; or
  1370		 * 2) Memory page isn't managed by the TDX module.
  1371		 *
  1372		 * In either case, the memory page cannot be a TDX
  1373		 * private page.
  1374		 */
  1375		if (sret)
  1376			return false;
  1377	
  1378		/*
  1379		 * SEAMCALL was successful -- read page type (via RCX):
  1380		 *
  1381		 *  - PT_NDA:	Page is not used by the TDX module
  1382		 *  - PT_RSVD:	Reserved for Non-TDX use
  1383		 *  - Others:	Page is used by the TDX module
  1384		 *
  1385		 * Note PAMT pages are marked as PT_RSVD but they are also TDX
  1386		 * private memory.
  1387		 *
  1388		 * Note: Even page type is PT_NDA, the memory page could still
  1389		 * be associated with TDX private KeyID if the kernel hasn't
  1390		 * explicitly used MOVDIR64B to clear the page.  Assume KVM
  1391		 * always does that after reclaiming any private page from TDX
  1392		 * gusets.
  1393		 */
  1394		switch (out.rcx) {
  1395		case PT_NDA:
  1396			return false;
  1397		case PT_RSVD:
  1398			return is_pamt_page(phys);
  1399		default:
  1400			return true;
  1401		}
  1402	}
  1403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
