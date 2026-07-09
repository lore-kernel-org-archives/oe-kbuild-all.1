Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6429715B998
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 02:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783563726; cv=none; b=R7AP56Y/OtS4WgOPwMx1i3ye/LDXEnTyFxkNq9H9+RmWBOkhy2mOqVEfvnIm/pW06zKq5P5JnkumWaq7vsAso6dDG6cOaPsaq0kOH27F6SqhMEbb+37PXL/3opK3FetYYM0IDiEJo3JMDyK13eucHbkfqCZ/LxRtDbO80YAV/cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783563726; c=relaxed/simple;
	bh=/K4lQH4a07AlBu5XP97+ux+9dmpq0SN+m00v226EYpc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KrsU0fIB9av2nPrKUKvtOjw6Km2VOM98EEQH3TlMZbzBAB2nOkz/nzKMpRSk3hE4yBNLozQe045RmEcxn9757yFoQStEh2TJGDBa943C1z6gCQXdgG5I3RT5QtPNEd1sl7ezT6V49MPPXyD3rlVGR+WAZOyrySaUm6TE+/26SMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELsqvQJN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELsqvQJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783563724; x=1815099724;
  h=date:from:to:cc:subject:message-id;
  bh=/K4lQH4a07AlBu5XP97+ux+9dmpq0SN+m00v226EYpc=;
  b=ELsqvQJNU49CYi7fP/dzZ2ruYHD62Vqfw09l/n3mKexaRa3II2V84d0g
   Kq758tEET69xx48VuJiQz4ABK0hqiPj97KNqjhT4/QsO7wXRXQmIDbiFj
   twKcgOl1SUzuToZaUrS+M1ilTwmdnG+ot0oKOdlvr9ym13F4Y26NdiJjS
   9Z7ojlLk1fM3CYdk6IVvbomqtoJtsPtRokX40TCjjVS3PYFXtiwlVtSp7
   eZjtNbKABC4uSMRNuYnF258ip/Pg/YYfHf3zAMBtC5/bhaeA9Ca6q7mEw
   4lWijM9HsJy3weh+4fwuEEbtZXTKNoOLC1gaJu7GIQTycU+9s8qYUt7q9
   A==;
X-CSE-ConnectionGUID: ka3VhGyGTh+nApZVXvPnXA==
X-CSE-MsgGUID: 1yvpN8vySzOD1dxSp5+iZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84094100"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84094100"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 19:22:04 -0700
X-CSE-ConnectionGUID: xGod3+fzRt6Roven3oJFAw==
X-CSE-MsgGUID: nYisfddyRc2BGPxIV7iXcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250032203"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 08 Jul 2026 19:22:02 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wheOm-000000002sP-2oUk;
	Thu, 09 Jul 2026 02:22:00 +0000
Date: Thu, 09 Jul 2026 04:21:50 +0200
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:folded_pgtable 29/32]
 arch/x86/mm/pgtable.c:250:23: warning: variable 'pudp_s' set but not used
Message-ID: <202607090449.nuF7ILjx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux folded_pgtable
head:   0551ca68b7552b7d71f1d2882635809a573d6c79
commit: 0963570e536ad72776105fbd404b09e35b19927a [29/32] mm/pgtable: disallow calling folded (pgd|p4d|pud)_page, pgd_page_vaddr() and (p4d|pud)_pgtable
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260709/202607090449.nuF7ILjx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090449.nuF7ILjx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090449.nuF7ILjx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/mm/pgtable.c: In function 'pgd_prepopulate_pmd':
>> arch/x86/mm/pgtable.c:250:23: warning: variable 'pudp_s' set but not used [-Wunused-but-set-variable]
     250 |         pud_t *pudp, *pudp_s;
         |                       ^~~~~~
   In file included from <command-line>:
   arch/x86/mm/pgtable.c: In function 'pudp_set_access_flags':
   ././include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_484' declared with attribute error: BUILD_BUG failed
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   ././include/linux/compiler_types.h:683:25: note: in definition of macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   ././include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:60:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      60 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   ./include/asm-generic/pgtable-nopmd.h:41:49: note: in expansion of macro 'BUILD_BUG'
      41 | #define set_pud(pudptr, pudval)                 BUILD_BUG()
         |                                                 ^~~~~~~~~
   arch/x86/mm/pgtable.c:434:17: note: in expansion of macro 'set_pud'
     434 |                 set_pud(pudp, entry);
         |                 ^~~~~~~


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
