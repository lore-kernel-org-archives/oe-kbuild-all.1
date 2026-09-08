Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4E13054C7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 01:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788831707; cv=none; b=tXcf3YrpJ5ZK2UWua8EOtaqWlsgKojmNUIGcH2JhyRr+yQOH7aDdmFXLtBkb55yi31hgiRvvNkScfwRvaJe1SZbTy/sB0aOFAWUo7CCpeL+23qGs5XowIEUf/TJzhZ/XGleCYHMTZ6/WM/afQ4G2ccF5m7ONV7KteZBu/1XqM/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788831707; c=relaxed/simple;
	bh=gb+EU+I3NL6Pnu5uFbA3MZY0XKpgVSoLoJ7pZvWs+y0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pRLeWqktzY9Q3hXrrxLOIryjqV/U5RWj8AAe737McbJ8Uv8AK3cpFdDqEBprQeHTohot9Zzri2o8JVwc2joqjs/emwmNXNnONLdDqJ3F2kxy5x/mzrfQqwcM1D3jagFcV5rFjOdVGvBGiNfWjfIfmjICqFX9v39kZwGcUKtu0AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbuPC1+W; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbuPC1+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788831704; x=1820367704;
  h=date:from:to:cc:subject:message-id;
  bh=gb+EU+I3NL6Pnu5uFbA3MZY0XKpgVSoLoJ7pZvWs+y0=;
  b=RbuPC1+WqgQ8Qp1ujJ7NKZvmgHXxJGoaMiMnDB4IhzJ9oQFA9Ox+nHAl
   a0wrZ+tJQb/qfMpZ6R/N50oPLfMHaNCFIFw/O2Xv3wy2CRSD1eceqsxxG
   wi4LGDiRJW4fLDggGWGOV5hGVg5ItNUZ0eaIm70ZbrXv/dosW/UxR/ZTw
   No/5zOrqadz09zMLVhsPCWqRUqCg9AKlSXi6iBSo0PhzP0ymwPZ/YaUer
   ZwQpfN01z9b8dGoAjhd89w9yz7z7M8k6/iDnsboxL73Xj/ejl3ib5U8n7
   uzc1ZNrTWTXQ79p8BkfGo15N9mMELcaQSRTzD04YJUUYBhVQVT5o4HQWR
   w==;
X-CSE-ConnectionGUID: 8sWxg7ZZS/mcyBb9xptXLw==
X-CSE-MsgGUID: kLwpaSAUSkyDULlAnma8dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89100351"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89100351"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 18:41:43 -0700
X-CSE-ConnectionGUID: p9s2PyWhQGmgQH8zsVkJrA==
X-CSE-MsgGUID: q4FzpVKeTpGs3miUkHedJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="295739485"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Sep 2026 18:41:42 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3kqC-000000001W5-1LMC;
	Tue, 08 Sep 2026 01:41:40 +0000
Date: Tue, 08 Sep 2026 09:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:shstk-vmalloc 19/19]
 arch/x86/kernel/shstk_kunit.c:47: Error: `rdsspq' is only supported in 64-bit
 mode
Message-ID: <202609080945.4fjnhYMA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git shstk-vmalloc
head:   a820a994160883fea70750876fe26073766d831f
commit: a820a994160883fea70750876fe26073766d831f [19/19] kshstk-onoff-test
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260908/202609080945.4fjnhYMA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080945.4fjnhYMA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080945.4fjnhYMA-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/shstk_kunit.c: In function 'enable_kernel_shstk_and_load_ssp':
   arch/x86/kernel/shstk_kunit.c:75:36: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      75 |         __wrmsrq(MSR_IA32_PL0_SSP, (u64)token_addr);
         |                                    ^
   arch/x86/kernel/shstk_kunit.c: Assembler messages:
>> arch/x86/kernel/shstk_kunit.c:47: Error: `rdsspq' is only supported in 64-bit mode


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
