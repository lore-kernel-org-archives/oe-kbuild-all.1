Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7875814F121
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 21:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735334147; cv=none; b=osObDlQtetaS/ZAhC1CmNZpBgwEplnGi4uim6JfEolWFGtWaF22bD9JoRlHfLidTaOqjWkdZvXABJajwB0Bt5rIi9EcgBkzkMeRC5O0IiolDKgpc0uvOT1SebzUwOtQrX/tgchwnE73c5TgQGYRMnEu/leU/+i1W+TnUNTYsyEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735334147; c=relaxed/simple;
	bh=xAEuPRSXF1EO9WUddXTgEw7mBbpvTyWKZ8vWkeV0FVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JWxG207ns16wbv81hHMEMfyWUKamEcrC07yzB88st10b++YU/kPgEYOPKwCTttW7MkSRbgf5XBBQEv1FEWwvxEdpOeeRiE+wnIDblHtzp9ffH9IlegRIABLaD5jBKmK27V7nn3d+x9UZihyG9FFSHq1sWgP2fuEnl0M6LGNx2io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z7wLg02a; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z7wLg02a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735334145; x=1766870145;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xAEuPRSXF1EO9WUddXTgEw7mBbpvTyWKZ8vWkeV0FVo=;
  b=Z7wLg02apT5FzK0CZsZDBBH6Jb6S2CpEBPPqhIDoJsscnr1NgOsi4HHZ
   pvcBe5PDeVHq/uH4Kz48Umi/hy2v6bQhdRzdbVUkjOJGeQ9YV8zfKouFw
   SPTKyIdU+JtiYVlreDLm2SDkcYBRpcR2Xg3786w+GDJabhegpiPp+dod6
   wFHwupAYS4I8qPlj2EfKh8i74yIOu6VadtBQBgZo7TXJCs7g79yIEMCKA
   omdhv9p8E1RljQ3tDBKJrtwDfpytQcazD7wNKUlQvHoP6CILVyqwHd1Bc
   FuZlxe5jrBKDZdGMnpXO5cYkyIHCyNvQFNBHVuU7gua9gkUOJRryi2yGh
   w==;
X-CSE-ConnectionGUID: +dBZNSDETX64TlROloug/A==
X-CSE-MsgGUID: fbXLjFYEQDyJY+XSS36x3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="47148583"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="47148583"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 13:15:45 -0800
X-CSE-ConnectionGUID: RcgA5RzlRKGLCP38i0sdAg==
X-CSE-MsgGUID: kmrsLoGaRCmamxgIzDmicw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="100079357"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Dec 2024 13:15:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRHgM-0003d0-0H;
	Fri, 27 Dec 2024 21:15:42 +0000
Date: Sat, 28 Dec 2024 05:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: mm/migrate.c:236:33: sparse: sparse: cast to non-scalar
Message-ID: <202412280419.RvjGqzaD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8379578b11d5e073792b5db2690faa12effce8e0
commit: dee081bf8f824cabeb7c7495367d5dad0a444eb1 READ_ONCE: Drop pointer qualifiers when reading from scalar types
date:   4 years, 8 months ago
config: alpha-randconfig-r121-20241225 (https://download.01.org/0day-ci/archive/20241228/202412280419.RvjGqzaD-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241228/202412280419.RvjGqzaD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280419.RvjGqzaD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/migrate.c:236:33: sparse: sparse: cast to non-scalar
>> mm/migrate.c:236:33: sparse: sparse: cast from non-scalar
   mm/migrate.c:824:9: sparse: sparse: context imbalance in '__buffer_migrate_page' - different lock contexts for basic block

vim +236 mm/migrate.c

616b8371539a6c Zi Yan             2017-09-08  234  
0697212a411c1d Christoph Lameter  2006-06-23  235  		get_page(new);
6d2329f8872f23 Andrea Arcangeli   2016-10-07 @236  		pte = pte_mkold(mk_pte(new, READ_ONCE(vma->vm_page_prot)));
3fe87967c536e8 Kirill A. Shutemov 2017-02-24  237  		if (pte_swp_soft_dirty(*pvmw.pte))
c3d16e16522fe3 Cyrill Gorcunov    2013-10-16  238  			pte = pte_mksoft_dirty(pte);
d3cb8bf6081b8b Mel Gorman         2014-10-02  239  
3fe87967c536e8 Kirill A. Shutemov 2017-02-24  240  		/*
3fe87967c536e8 Kirill A. Shutemov 2017-02-24  241  		 * Recheck VMA as permissions can change since migration started
3fe87967c536e8 Kirill A. Shutemov 2017-02-24  242  		 */
3fe87967c536e8 Kirill A. Shutemov 2017-02-24  243  		entry = pte_to_swp_entry(*pvmw.pte);
0697212a411c1d Christoph Lameter  2006-06-23  244  		if (is_write_migration_entry(entry))
d3cb8bf6081b8b Mel Gorman         2014-10-02  245  			pte = maybe_mkwrite(pte, vma);
f45ec5ff16a75f Peter Xu           2020-04-06  246  		else if (pte_swp_uffd_wp(*pvmw.pte))
f45ec5ff16a75f Peter Xu           2020-04-06  247  			pte = pte_mkuffd_wp(pte);
d3cb8bf6081b8b Mel Gorman         2014-10-02  248  
df6ad69838fc9d Jérôme Glisse      2017-09-08  249  		if (unlikely(is_zone_device_page(new))) {
df6ad69838fc9d Jérôme Glisse      2017-09-08  250  			if (is_device_private_page(new)) {
a5430dda8a3a1c Jérôme Glisse      2017-09-08  251  				entry = make_device_private_entry(new, pte_write(pte));
a5430dda8a3a1c Jérôme Glisse      2017-09-08  252  				pte = swp_entry_to_pte(entry);
f45ec5ff16a75f Peter Xu           2020-04-06  253  				if (pte_swp_uffd_wp(*pvmw.pte))
f45ec5ff16a75f Peter Xu           2020-04-06  254  					pte = pte_mkuffd_wp(pte);
df6ad69838fc9d Jérôme Glisse      2017-09-08  255  			}
d2b2c6dd227ba5 Lars Persson       2019-03-28  256  		}
a5430dda8a3a1c Jérôme Glisse      2017-09-08  257  

:::::: The code at line 236 was first introduced by commit
:::::: 6d2329f8872f23e46a19d240930571510ce525eb mm: vm_page_prot: update with WRITE_ONCE/READ_ONCE

:::::: TO: Andrea Arcangeli <aarcange@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
