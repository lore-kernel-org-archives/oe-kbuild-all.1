Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0B24D9E7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Feb 2024 04:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709008686; cv=none; b=R2T/p+Wnrya7iXe/a6bXsljg2I//nDL/rlKrFvTAxH8FxexWCZJWiadtibFniEnWVDmgd3w2oA6NbZ2DTGfqpnH5goYmG46VdIlnn44y6DnzBEbaM1nloxpChzh2FCdSOEwCakDXyMe9cYdy9JlyfGRkqdd+cL5ZiDnfTVRsDsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709008686; c=relaxed/simple;
	bh=T/5+WeVD+Ufjm2hsGyiY8XEZu/ksh/nzJifdg+cIOhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=InVu4Nv2NQ4n/0fXbUfpModmG8Ony7tcB/r1oXOaTZKPs4bA3cIjwBRaEVEts4WmvhQxFW7NrfrCvcXEHIP4G+dZo3weBNxxDk8tBbC7GVDMkMZKvMp/gUHDwRHcNLl8oCSYbNcioHWNt8c46I1cfP9KF+SugpYgEcMUU6S/8ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g43Ay+LY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g43Ay+LY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709008684; x=1740544684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T/5+WeVD+Ufjm2hsGyiY8XEZu/ksh/nzJifdg+cIOhA=;
  b=g43Ay+LYRXE5ERuyRCh7ky3ylmo7jWo9HcIFuLGWoTC98CiR7Ta6LMTg
   7B/FvcxkPN+bbs6+s1AC1iRUW8oAZmLgHJj1JKmEoxkOGaaGKGLXJtdMx
   lIBOw+iAaF07qfzTNduuUyAljXyKL1D8vwlMvCnBNOcbGNE2GTiOAnGhH
   N8Xd4WUw1lscBv6Ql0mgY65nosvCb4MVl4HFlohveITMMthbcbDb7WYr7
   9bjw/2oq0uvxcsgnXGgAwfJTf/FQnzBx/F6eVqqHSGJqZrVdGN1EwAgCc
   4HoiTDsv+gfQdpjewfzj1VcdRWCJCAaLAnUrYuezHk3Spzq7JBbNmXgLb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3492024"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3492024"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 20:38:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="6782677"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 26 Feb 2024 20:38:01 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1repE6-000AwN-29;
	Tue, 27 Feb 2024 04:37:58 +0000
Date: Tue, 27 Feb 2024 12:37:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Yuan Yao <yuan.yao@intel.com>,
	Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [intel-tdx:kvm-upstream 28/152] arch/x86/coco/tdx/tdx.c:757:28:
 error: 'TDVMCALL_STATUS_RETRY' undeclared; did you mean 'TDVMCALL_RETRY'?
Message-ID: <202402271232.mchzwbkx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream
head:   f1ccffc2bc17cc3feca6d575db7ea93c29a49453
commit: ae0b961d80ab90e43c6eff4a675e00ff80ab3b9f [28/152] KVM: TDX: Add TDX "architectural" error codes
config: x86_64-buildonly-randconfig-005-20240226 (https://download.01.org/0day-ci/archive/20240227/202402271232.mchzwbkx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240227/202402271232.mchzwbkx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402271232.mchzwbkx-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/coco/tdx/tdx.c: In function 'tdx_map_gpa':
>> arch/x86/coco/tdx/tdx.c:757:28: error: 'TDVMCALL_STATUS_RETRY' undeclared (first use in this function); did you mean 'TDVMCALL_RETRY'?
     757 |                 if (ret != TDVMCALL_STATUS_RETRY)
         |                            ^~~~~~~~~~~~~~~~~~~~~
         |                            TDVMCALL_RETRY
   arch/x86/coco/tdx/tdx.c:757:28: note: each undeclared identifier is reported only once for each function it appears in


vim +757 arch/x86/coco/tdx/tdx.c

7dbde763162989 Kirill A. Shutemov 2022-04-06  729  
7dbde763162989 Kirill A. Shutemov 2022-04-06  730  /*
019b383d1132e4 Dexuan Cui         2023-08-10  731   * Notify the VMM about page mapping conversion. More info about ABI
019b383d1132e4 Dexuan Cui         2023-08-10  732   * can be found in TDX Guest-Host-Communication Interface (GHCI),
019b383d1132e4 Dexuan Cui         2023-08-10  733   * section "TDG.VP.VMCALL<MapGPA>".
7dbde763162989 Kirill A. Shutemov 2022-04-06  734   */
019b383d1132e4 Dexuan Cui         2023-08-10  735  static bool tdx_map_gpa(phys_addr_t start, phys_addr_t end, bool enc)
7dbde763162989 Kirill A. Shutemov 2022-04-06  736  {
019b383d1132e4 Dexuan Cui         2023-08-10  737  	/* Retrying the hypercall a second time should succeed; use 3 just in case */
019b383d1132e4 Dexuan Cui         2023-08-10  738  	const int max_retries_per_page = 3;
019b383d1132e4 Dexuan Cui         2023-08-10  739  	int retry_count = 0;
7dbde763162989 Kirill A. Shutemov 2022-04-06  740  
7dbde763162989 Kirill A. Shutemov 2022-04-06  741  	if (!enc) {
7dbde763162989 Kirill A. Shutemov 2022-04-06  742  		/* Set the shared (decrypted) bits: */
7dbde763162989 Kirill A. Shutemov 2022-04-06  743  		start |= cc_mkdec(0);
7dbde763162989 Kirill A. Shutemov 2022-04-06  744  		end   |= cc_mkdec(0);
7dbde763162989 Kirill A. Shutemov 2022-04-06  745  	}
7dbde763162989 Kirill A. Shutemov 2022-04-06  746  
019b383d1132e4 Dexuan Cui         2023-08-10  747  	while (retry_count < max_retries_per_page) {
8a8544bde858e5 Kai Huang          2023-08-15  748  		struct tdx_module_args args = {
019b383d1132e4 Dexuan Cui         2023-08-10  749  			.r10 = TDX_HYPERCALL_STANDARD,
019b383d1132e4 Dexuan Cui         2023-08-10  750  			.r11 = TDVMCALL_MAP_GPA,
019b383d1132e4 Dexuan Cui         2023-08-10  751  			.r12 = start,
019b383d1132e4 Dexuan Cui         2023-08-10  752  			.r13 = end - start };
019b383d1132e4 Dexuan Cui         2023-08-10  753  
019b383d1132e4 Dexuan Cui         2023-08-10  754  		u64 map_fail_paddr;
c641cfb5c157b6 Kai Huang          2023-08-15  755  		u64 ret = __tdx_hypercall(&args);
019b383d1132e4 Dexuan Cui         2023-08-10  756  
019b383d1132e4 Dexuan Cui         2023-08-10 @757  		if (ret != TDVMCALL_STATUS_RETRY)
019b383d1132e4 Dexuan Cui         2023-08-10  758  			return !ret;
7dbde763162989 Kirill A. Shutemov 2022-04-06  759  		/*
019b383d1132e4 Dexuan Cui         2023-08-10  760  		 * The guest must retry the operation for the pages in the
019b383d1132e4 Dexuan Cui         2023-08-10  761  		 * region starting at the GPA specified in R11. R11 comes
019b383d1132e4 Dexuan Cui         2023-08-10  762  		 * from the untrusted VMM. Sanity check it.
7dbde763162989 Kirill A. Shutemov 2022-04-06  763  		 */
019b383d1132e4 Dexuan Cui         2023-08-10  764  		map_fail_paddr = args.r11;
019b383d1132e4 Dexuan Cui         2023-08-10  765  		if (map_fail_paddr < start || map_fail_paddr >= end)
019b383d1132e4 Dexuan Cui         2023-08-10  766  			return false;
019b383d1132e4 Dexuan Cui         2023-08-10  767  
019b383d1132e4 Dexuan Cui         2023-08-10  768  		/* "Consume" a retry without forward progress */
019b383d1132e4 Dexuan Cui         2023-08-10  769  		if (map_fail_paddr == start) {
019b383d1132e4 Dexuan Cui         2023-08-10  770  			retry_count++;
019b383d1132e4 Dexuan Cui         2023-08-10  771  			continue;
019b383d1132e4 Dexuan Cui         2023-08-10  772  		}
019b383d1132e4 Dexuan Cui         2023-08-10  773  
019b383d1132e4 Dexuan Cui         2023-08-10  774  		start = map_fail_paddr;
019b383d1132e4 Dexuan Cui         2023-08-10  775  		retry_count = 0;
019b383d1132e4 Dexuan Cui         2023-08-10  776  	}
019b383d1132e4 Dexuan Cui         2023-08-10  777  
019b383d1132e4 Dexuan Cui         2023-08-10  778  	return false;
019b383d1132e4 Dexuan Cui         2023-08-10  779  }
019b383d1132e4 Dexuan Cui         2023-08-10  780  

:::::: The code at line 757 was first introduced by commit
:::::: 019b383d1132e4051de0d2e43254454b86538cf4 x86/tdx: Retry partially-completed page conversion hypercalls

:::::: TO: Dexuan Cui <decui@microsoft.com>
:::::: CC: Dave Hansen <dave.hansen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
