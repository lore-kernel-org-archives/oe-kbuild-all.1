Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D16742DA5B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 12:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600694; cv=none; b=SdMo3LmQ4dCEswMdtZ5Fp19NYdzYb1nwwQOywToBpz9rxP+K6rhm0uysV430PFGonaPmt8AnLj0/q3K+jum6ma3ggGPto7seLQH6LsOxnJ9uTq68b876RYW4wRHjfaiMc22cedc7wI7hmfs+E/g0Rx1nmFEoXDzIfsXFRb5aziE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600694; c=relaxed/simple;
	bh=7ilJLQ63BNhtdcJrXQO4T9xd9Ofr50mrI2qpx5gMKhE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c7hKk6OTdSSaIetvjhJiiRwGk+N6YCK47Bf5y2tbK5aUile/IAUi4GV4GUel3+rPwkPqWmdoJpUPAEyVbt5DorJssNIOljtehqx/m5GI3U/XiF7GVF+1xauCCj+AHS6AdTpwQtHZLQfAvrmamsxWcNlzLl68doUd+ECMv2rQeds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WYfeVrq6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYfeVrq6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783600692; x=1815136692;
  h=date:from:to:cc:subject:message-id;
  bh=7ilJLQ63BNhtdcJrXQO4T9xd9Ofr50mrI2qpx5gMKhE=;
  b=WYfeVrq6N+mB0KW5HhfTnM3QrraJBXDFzykeHWmftHtlWe2qhuWBxen0
   HwuEUMYedJe2ekNuHxNJdWr4e6LeJ6LJB6XJE0TyyaDgP5gp0DqWRRZ4e
   fizaRnBs3CwQnfSrLBI9RmProJfPtA+9wEQyX5EB/1aH8XydTpJX6QKaW
   xBcckmv8Jf6jYRXDY9lioZW8vXBDkYf5rqx2fU++MVrUdltSlzmZSMX5i
   BTOfXsKiFljVTZr706V9yn+6WRw10K6vKZkk4mlLMVw0rca9fBJ79n405
   hQathp1hqyoKQY0NWBVQc/NNgbHqSnvQULpNcaPI6LU7Cm2E0tmABCxVS
   w==;
X-CSE-ConnectionGUID: VmDWxR7uQRyjrP1hIIhXKw==
X-CSE-MsgGUID: 3QlVRSnyQvW4hvt+tUv8gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109826257"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="109826257"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 05:38:09 -0700
X-CSE-ConnectionGUID: A7d3cc1dQeqG9uwWwuTYZQ==
X-CSE-MsgGUID: fUPNJDeERQyOannbCmGrnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253480712"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 09 Jul 2026 05:38:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1who0z-00000000HgV-4Byn;
	Thu, 09 Jul 2026 12:38:06 +0000
Date: Thu, 09 Jul 2026 20:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:folded_pgtable 29/32]
 arch/x86/mm/pgtable.c:250:23: warning: variable 'pudp_s' set but not used
Message-ID: <202607092000.jvTf3jGx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux folded_pgtable
head:   0551ca68b7552b7d71f1d2882635809a573d6c79
commit: 0963570e536ad72776105fbd404b09e35b19927a [29/32] mm/pgtable: disallow calling folded (pgd|p4d|pud)_page, pgd_page_vaddr() and (p4d|pud)_pgtable
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260709/202607092000.jvTf3jGx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607092000.jvTf3jGx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607092000.jvTf3jGx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/mm/pgtable.c: In function 'pgd_prepopulate_pmd':
>> arch/x86/mm/pgtable.c:250:23: warning: variable 'pudp_s' set but not used [-Wunused-but-set-variable]
     250 |         pud_t *pudp, *pudp_s;
         |                       ^~~~~~


vim +/pudp_s +250 arch/x86/mm/pgtable.c

4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  246  
0a3c7e279b112f Yeoreum Yun         2026-07-08  247  static void pgd_prepopulate_pmd(struct mm_struct *mm, pgd_t *pgdp, pmd_t *pmds[])
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  248  {
0a3c7e279b112f Yeoreum Yun         2026-07-08  249  	p4d_t *p4dp, *p4dp_s;
0a3c7e279b112f Yeoreum Yun         2026-07-08 @250  	pud_t *pudp, *pudp_s;
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  251  	int i;
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  252  
0a3c7e279b112f Yeoreum Yun         2026-07-08  253  	p4dp = p4d_offset(pgdp, 0);
0a3c7e279b112f Yeoreum Yun         2026-07-08  254  	pudp = pud_offset(p4dp, 0);
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  255  
0a3c7e279b112f Yeoreum Yun         2026-07-08  256  	for (i = 0; i < PREALLOCATED_PMDS; i++, pudp++) {
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  257  		pmd_t *pmd = pmds[i];
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  258  
0a3c7e279b112f Yeoreum Yun         2026-07-08  259  		if (i >= KERNEL_PGD_BOUNDARY) {
0a3c7e279b112f Yeoreum Yun         2026-07-08  260  			p4dp_s = p4d_offset(&swapper_pg_dir[i], 0);
0a3c7e279b112f Yeoreum Yun         2026-07-08  261  			pudp_s = pud_offset(p4dp_s, 0);
0a3c7e279b112f Yeoreum Yun         2026-07-08  262  
0a3c7e279b112f Yeoreum Yun         2026-07-08  263  			memcpy(pmd, (pmd_t *)pud_pgtable(pudp_get(pudp_s)),
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  264  			       sizeof(pmd_t) * PTRS_PER_PMD);
0a3c7e279b112f Yeoreum Yun         2026-07-08  265  		}
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  266  
0a3c7e279b112f Yeoreum Yun         2026-07-08  267  		pud_populate(mm, pudp, pmd);
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  268  	}
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  269  }
1ec1fe73dfb711 Ingo Molnar         2008-03-19  270  

:::::: The code at line 250 was first introduced by commit
:::::: 0a3c7e279b112f82e4a7a2a24e499fe971b871a3 x86: mm: remove usage of pgd_page_vaddr() for CONFIG_x86_PAE

:::::: TO: Yeoreum Yun <yeoreum.yun@arm.com>
:::::: CC: David Hildenbrand (Arm) <david@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
