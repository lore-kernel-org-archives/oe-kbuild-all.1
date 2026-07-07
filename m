Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2943B27FE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jul 2026 20:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783454931; cv=none; b=ShBP3hMRQybguKU6qjsVIxs+v0jqY7qzDR4a7nBGuy/wANmhHfovypXSgLe7dRg1ljFFKVpCk+E7FW5lA9ZrTglqnLVQle2S9XdoASzW35FuBPC/ZYKg5dycoNuYuaR9ORt7wtE1Xtk5K6AiaZp5LN3AuX3PTFUaVoW8aQDhsPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783454931; c=relaxed/simple;
	bh=InjwSRDG61IPwAp4qy1mkDJZJ8nFhcAhl9/MgFasMVA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UmDYv5nP9ou7Pgp1e2Y8GU5XsGht03oOYr9hzLLy+ptNmhUlDsTT7ze5OrdqK9cSimvskLOb9yWBqH/YzFvO8Fbmv+5PMNk5u1HTg1CmJP7Q6q8jhZfSDRCgUwykemZo4XTzcIHphZAsBuqOpsm2Evo8jnUE+1R2UzyS76X14vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsNnzpm3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsNnzpm3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783454930; x=1814990930;
  h=date:from:to:cc:subject:message-id;
  bh=InjwSRDG61IPwAp4qy1mkDJZJ8nFhcAhl9/MgFasMVA=;
  b=dsNnzpm37z8vR1+UBBA06l7SFvVlRnUb/cAZEqAxht2eouWaSSUzdvJi
   /cmLiwyIn+O2JiK+cTgUAKxEuCakjKfn328ypPz2srfHOAL/7XjQTWjxh
   rWkQVSTda4hM7Xs6xtCq5+dh+3z9hCKvPagGKdDkyhaS7HCT1tsBV4/ZP
   vxLlJU5kEYxusUxDOjwofaZNSM6PM++RWevvD8/+kz3DFWYH85UmH6jAF
   2BgVXKrMIzxY0+OjyudpIDxRDXy4WgdCk79EJwcEqyLb6dYi04eEqnCMI
   QUSE8CnPjGR4osVSMe7GMfzkC/sbhI0go2f0kRPqzSbA8F8xxFjQrmF5B
   w==;
X-CSE-ConnectionGUID: ciXqVqvUQsiO7XrIa+CGyg==
X-CSE-MsgGUID: 9/CY0p6xR3O+sLU+xVBRsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="88028370"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="88028370"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 13:08:49 -0700
X-CSE-ConnectionGUID: Ypw86tzAQa6yvZOemU3vJg==
X-CSE-MsgGUID: kgpHBobdQui7kOjTJUfWhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="258389182"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 07 Jul 2026 13:08:47 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whC61-000000002av-3A6g;
	Tue, 07 Jul 2026 20:08:45 +0000
Date: Tue, 07 Jul 2026 22:08:39 +0200
From: kernel test robot <lkp@intel.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "David Hildenbrand (Arm)" <david@kernel.org>
Subject: [davidhildenbrand:folded_pgtable 24/26]
 arch/x86/mm/pat/set_memory.c:1678:18: warning: variable 'pud_pgprot' set but
 not used
Message-ID: <202607072249.VVc9PJW0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux folded_pgtable
head:   710c0f29eb829f67c4c0d1c2a3f764b286282229
commit: edba052520a01b5da435b4a19c5345b29cacc6ca [24/26] x86: mm: skip pud setup when using folded pagetable
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260707/202607072249.VVc9PJW0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260707/202607072249.VVc9PJW0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607072249.VVc9PJW0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/mm/pat/set_memory.c: In function 'populate_pud':
>> arch/x86/mm/pat/set_memory.c:1678:18: warning: variable 'pud_pgprot' set but not used [-Wunused-but-set-variable]
    1678 |         pgprot_t pud_pgprot;
         |                  ^~~~~~~~~~


vim +/pud_pgprot +1678 arch/x86/mm/pat/set_memory.c

4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1671  
4547833602fdd3 arch/x86/mm/pageattr.c Kiryl Shutsemau 2017-03-17  1672  static int populate_pud(struct cpa_data *cpa, unsigned long start, p4d_t *p4d,
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1673  			pgprot_t pgprot)
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1674  {
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1675  	pud_t *pud;
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1676  	unsigned long end;
e535ec0899d1fe arch/x86/mm/pageattr.c Matt Fleming    2016-09-20  1677  	long cur_pages = 0;
f5b2831d654167 arch/x86/mm/pageattr.c Juergen Gross   2014-11-03 @1678  	pgprot_t pud_pgprot;
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1679  
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1680  	end = start + (cpa->numpages << PAGE_SHIFT);
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1681  
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1682  	/*
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1683  	 * Not on a Gb page boundary? => map everything up to it with
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1684  	 * smaller pages.
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1685  	 */
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1686  	if (start & (PUD_SIZE - 1)) {
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1687  		unsigned long pre_end;
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1688  		unsigned long next_page = (start + PUD_SIZE) & PUD_MASK;
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1689  
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1690  		pre_end   = min_t(unsigned long, end, next_page);
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1691  		cur_pages = (pre_end - start) >> PAGE_SHIFT;
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1692  		cur_pages = min_t(int, (int)cpa->numpages, cur_pages);
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1693  
4547833602fdd3 arch/x86/mm/pageattr.c Kiryl Shutsemau 2017-03-17  1694  		pud = pud_offset(p4d, start);
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1695  
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1696  		/*
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1697  		 * Need a PMD page?
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1698  		 */
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1699  		if (pud_none(*pud))
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1700  			if (alloc_pmd_page(pud))
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1701  				return -1;
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1702  
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1703  		cur_pages = populate_pmd(cpa, start, pre_end, cur_pages,
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1704  					 pud, pgprot);
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1705  		if (cur_pages < 0)
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1706  			return cur_pages;
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1707  
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1708  		start = pre_end;
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1709  	}
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1710  
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1711  	/* We mapped them all? */
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1712  	if (cpa->numpages == cur_pages)
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1713  		return cur_pages;
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1714  
4547833602fdd3 arch/x86/mm/pageattr.c Kiryl Shutsemau 2017-03-17  1715  	pud = pud_offset(p4d, start);
f5b2831d654167 arch/x86/mm/pageattr.c Juergen Gross   2014-11-03  1716  	pud_pgprot = pgprot_4k_2_large(pgprot);
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1717  

:::::: The code at line 1678 was first introduced by commit
:::::: f5b2831d654167d77da8afbef4d2584897b12d0c x86: Respect PAT bit when copying pte values between large and normal pages

:::::: TO: Juergen Gross <jgross@suse.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
