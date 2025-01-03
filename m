Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A3D15573A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 20:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735934767; cv=none; b=ST6WENvFwT7EYbZxaYrpM3PyRb5TyeVT1iVgL3k/ZAoi74cwFSA6HJsWlt9o8Y6IqPZNt2cEq0jqVQ3jTCW+z/gcnKguIR1wSM3eTNah01wi7cFvxsNkulYiZH/w2EZqCe3LpB3F5e3/aS1QQiwK29FoXe5LhiJaQyllnqC2A8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735934767; c=relaxed/simple;
	bh=HHQyoiApxje9tVkqv5G9AI2GRiUVHF21MsH8/Rtv8eE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sf7mb/6sMycuCpm7MGSZPjs9CP0v9JHO1PCRCrtTbqMFOAIED1vXo01lDg7Qcj+ILkj/WhIwK2D8SbDvxaZRgUAxtHcLu26NLuX0ErZwJgn+wEG4Pp3BL8xhKHmNQWNR0UkCwNW36qgPlckqduxSRTsFyHPr8s789VpUxd4qZ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2mSkc02; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2mSkc02"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735934766; x=1767470766;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HHQyoiApxje9tVkqv5G9AI2GRiUVHF21MsH8/Rtv8eE=;
  b=l2mSkc02C1KxZpZpF378umecgvoSS7E4MvJsZZE6qaDXWuteXVFd66Lb
   ttntGh6+/uoxk26LEaoXxbqtfY3wKRIF0Ax7fQmLgnqC14akxeyUO3xtD
   g5hkrgjZUKrigyQByDTHsiSCrlmX6TBUAmq/2BajX++fj0gVlgCCMqRAw
   9MvC1cuzy+0J6Fjg+sBVoCoRGTqnZVuft4YRUlC/rSRs/HGsQCBv2Gj7u
   2DEO2pHD+v5xmNQyN2aObSejNJ52E4h7j8pL+B1lS0pIITJJK+esXqFfq
   kbzj+9SRWGz7/o5amzSPwujwWHiSzlXGizvvxhtleTyGOCnD92msT0w3l
   w==;
X-CSE-ConnectionGUID: 3YP75k5pSpmmuf8nn6/qbA==
X-CSE-MsgGUID: FQu/f2UVT3SxGLEcaq0+iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="39950907"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="39950907"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 12:06:05 -0800
X-CSE-ConnectionGUID: CVzmhMWCQFKBVv20K/ELQg==
X-CSE-MsgGUID: OIraSmQkSm2ixc3hgQUydA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101670827"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jan 2025 12:06:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTnvm-000AFf-2O;
	Fri, 03 Jan 2025 20:06:02 +0000
Date: Sat, 4 Jan 2025 04:05:53 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: mm/migrate.c:236:33: sparse: sparse: cast to non-scalar
Message-ID: <202501040330.ObpSNF7x-lkp@intel.com>
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
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: dee081bf8f824cabeb7c7495367d5dad0a444eb1 READ_ONCE: Drop pointer qualifiers when reading from scalar types
date:   4 years, 9 months ago
config: alpha-randconfig-r121-20241225 (https://download.01.org/0day-ci/archive/20250104/202501040330.ObpSNF7x-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250104/202501040330.ObpSNF7x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501040330.ObpSNF7x-lkp@intel.com/

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
