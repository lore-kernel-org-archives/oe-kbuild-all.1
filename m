Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C073C45000
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 23:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788824991; cv=none; b=V9XTBchiOy1qHNnq1bz4iMNda4+NGqKlzj6r7oUSwpPyxIAYOwLccL2x5aWpPegSSpJVMT2rt7p/aruWcpJDLmojfPdRmvA5TA5B8EL+dQ9fHfTJhgJK60SpEtpgS4pY/EL3KRkI0Bbp1TRoVtK/TxO1l8EzPHQHhcUmiQdVKW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788824991; c=relaxed/simple;
	bh=FAfXU5jmTheFnmiYV6pRZDakTVLyxHmrkCm6nd63lnU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HgD81Cqi/Xbk6/fM9q7JUNodNcG+PCFbSDhilOOYcfUfD8/JRZL/lvkK++n8fCC8/VHxBPJDYxgl4mn8KLi5MNVv1Ivx0GxCJ57z6QlQCVkngyBUsmQtcJB2MvVDEIPSEHqWgxaJRzpjkN2ygiyghfP0V3W9dS1JZth7P8ltExg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYWdPuoH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYWdPuoH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788824989; x=1820360989;
  h=date:from:to:cc:subject:message-id;
  bh=FAfXU5jmTheFnmiYV6pRZDakTVLyxHmrkCm6nd63lnU=;
  b=kYWdPuoHqgVLm2HR/UwQmkRV4W0XNDOjkhIO00iToDF6mhfRO0N2JFgW
   YoEE0KUawEC7P5mNGig1mPx3sezcuiKGML4qJAQaycI0PWOF/IsDZ4hBr
   NXpcia0Jx5AToSaIv29BVaaJIewAzSjYcygunQ/xSoybREZLJsr2TL/Pp
   Oqh5rmErLrLoTVMGcZANJ9ojFw3Mm3vFGEpYtW6UDxK14pGgk79ldKCmX
   BH0SF8XZRsxVfSach6pb++127M2yZvSBR58CkuA5Q7TnGnGC7S8QI652u
   ij7KQh34glOaFsPmc6iqBwVtOJfEVhzRymB3O/blkQc30KM+lbceC/GqW
   Q==;
X-CSE-ConnectionGUID: 8peNvIcMSDaaQvva9djwqg==
X-CSE-MsgGUID: MhhTntxbSKqu4bxngreimw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100743440"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="100743440"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 16:49:49 -0700
X-CSE-ConnectionGUID: 9DX5wen4QKG/mh9ToDWMBQ==
X-CSE-MsgGUID: /Ap4anW3R+Ox/8cIDvVjmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="271348300"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Sep 2026 16:49:47 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3j5s-000000001Pb-3rsK;
	Mon, 07 Sep 2026 23:49:44 +0000
Date: Tue, 08 Sep 2026 07:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:shstk-vmalloc 19/19]
 arch/x86/kernel/shstk_kunit.c:47:15: error: invalid operand for instruction
Message-ID: <202609080721.2rjzykGx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git shstk-vmalloc
head:   a820a994160883fea70750876fe26073766d831f
commit: a820a994160883fea70750876fe26073766d831f [19/19] kshstk-onoff-test
config: i386-randconfig-061-20260907 (https://download.01.org/0day-ci/archive/20260908/202609080721.2rjzykGx-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080721.2rjzykGx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080721.2rjzykGx-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/shstk_kunit.c:133:25: warning: variable 'old_msr' is uninitialized when used here [-Wuninitialized]
     133 |         wrmsrq(MSR_IA32_S_CET, old_msr);
         |                                ^~~~~~~
   arch/x86/kernel/shstk_kunit.c:93:13: note: initialize the variable 'old_msr' to silence this warning
      93 |         u64 old_msr;
         |                    ^
         |                     = 0
>> arch/x86/kernel/shstk_kunit.c:47:15: error: invalid operand for instruction
      47 |         asm volatile("rdsspq %0" : "=r" (current_ssp) : "0" (0UL));
         |                      ^
   <inline asm>:1:9: note: instantiated into assembly here
       1 |         rdsspq %esi
         |                ^~~~
   1 warning and 1 error generated.


vim +47 arch/x86/kernel/shstk_kunit.c

    37	
    38	/*
    39	 * Target function to call while S_CET is active.
    40	 * Marked noinline and notrace so compiler doesn't inline or instrument it.
    41	 */
    42	static noinline notrace void test_shstk_callee(unsigned long expected_ssp_base)
    43	{
    44		unsigned long current_ssp = 0;
    45	
    46		/* Read current SSP using RDSSPQ (returns 0 if shstk disabled) */
  > 47		asm volatile("rdsspq %0" : "=r" (current_ssp) : "0" (0UL));
    48	
    49		pr_info("CET Test: Inside callee, SSP = 0x%lx\n", current_ssp);
    50	
    51		if (current_ssp == 0)
    52			pr_err("CET Test: Error! SSP is zero (shadow stack inactive)\n");
    53	}
    54	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
