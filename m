Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757851C36
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Jul 2025 00:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753575403; cv=none; b=qHACM4nzMMfnsldxWuikACPYBuSFeY3/ZFHoMsCJi2Ymanrr9SZCH2ySJN5oliVnhY+GIvNCaUnqf8+RMFDTxZzW3si48J6QxrXGshaih7FlC0e6/IXjjT8IUd+Ek4qCIyMyIAaQIxEnPErQ5FjirhRx6Riuq65xGVkttr5X3p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753575403; c=relaxed/simple;
	bh=3iXcRW+m4ngKlFcE7dG80ekUYd2ZrQtMc6N8qtacU38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OJqZEGv39NZ7fZbuCdnxiJ89yoZ6ZF0B3fq1H5Ng6i4hjZaomPmutgpFgxDwM+LWs64uIaMYPR9vt7LFq7MpiuU/Ku8MRgRFcIpFpH/FE7ytGm6ohnF0/YA8P2V7Gy0PeY2KkfI0JIN6qgWUKCZhvgY3RCzpBicvM7p04FT2IcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJFZVSjh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJFZVSjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753575402; x=1785111402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3iXcRW+m4ngKlFcE7dG80ekUYd2ZrQtMc6N8qtacU38=;
  b=bJFZVSjhFZm5BMS5lTkEn7HeftwC+t0rvhpDxPUJBAIR0Lue5Fqm7BL9
   UY8q5LL/RV0r1T5koqt92w1hTYB/V5URkmiXiQi3XDuaa9eEMpg0dBcUj
   RNhURfTSk44p7zkMwmOUm8dA44GQvV3/Slzj9sH/vNING4hfs6HkSUKAn
   Q9ivd5JVOJhV2rCscULKfnwQr8Opt3Oi3pRLed4ONsFf9wJOVeUTlpsQ7
   P3CUdveYe8fG6GRf66/YUbpg2HIGAkVpG/sWygECgaePP0opZrp5iNll7
   UEOCRK6bCeojPr1pW6SBsVYemjuLxQmw4UNGsb4OIKa1+CyQF68OO0nLd
   A==;
X-CSE-ConnectionGUID: XvR0Dd2OQwalkWgMR6jGCQ==
X-CSE-MsgGUID: shXxUOEVSIqHs1s0oqr1ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="81313637"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="81313637"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 17:16:41 -0700
X-CSE-ConnectionGUID: xTptc6FxTjyskFiGKDiDPA==
X-CSE-MsgGUID: NMqrV4gvSR6swdTVfHc87Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162112868"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jul 2025 17:16:39 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufp49-000MMd-2K;
	Sun, 27 Jul 2025 00:16:37 +0000
Date: Sun, 27 Jul 2025 08:16:01 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 34/101] mm/mprotect.c:726:13: error: 'PAGE_NONE'
 undeclared; did you mean 'PAGE_U_NONE'?
Message-ID: <202507270855.YvsYlfrv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   de1df744d5c68470ace629863436a2b0b7360254
commit: af1d8aa70d3ae773ee9c7b9782ccfef1876bb027 [34/101] mm/mprotect: use PAGE_NONE for change_protection(..., MM_CP_PROT_DAMON)
config: arc-randconfig-001-20250727 (https://download.01.org/0day-ci/archive/20250727/202507270855.YvsYlfrv-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507270855.YvsYlfrv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507270855.YvsYlfrv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pagewalk.h:5,
                    from mm/mprotect.c:12:
   include/linux/mm.h:78: warning: "PAGES_TO_MB" redefined
    #define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
    
   In file included from arch/arc/include/asm/irqflags-compact.h:16,
                    from arch/arc/include/asm/irqflags.h:11,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/pagewalk.h:5,
                    from mm/mprotect.c:12:
   arch/arc/include/asm/arcregs.h:155: note: this is the location of the previous definition
    #define PAGES_TO_MB(n_pages) (PAGES_TO_KB(n_pages) >> 10)
    
   mm/mprotect.c: In function 'change_protection':
>> mm/mprotect.c:726:13: error: 'PAGE_NONE' undeclared (first use in this function); did you mean 'PAGE_U_NONE'?
      newprot = PAGE_NONE;
                ^~~~~~~~~
                PAGE_U_NONE
   mm/mprotect.c:726:13: note: each undeclared identifier is reported only once for each function it appears in


vim +726 mm/mprotect.c

   723	
   724	#ifdef CONFIG_DAMON
   725		if (cp_flags & MM_CP_PROT_DAMON)
 > 726			newprot = PAGE_NONE;
   727	#endif
   728	
   729		if (is_vm_hugetlb_page(vma))
   730			pages = hugetlb_change_protection(vma, start, end, newprot,
   731							  cp_flags);
   732		else
   733			pages = change_protection_range(tlb, vma, start, end, newprot,
   734							cp_flags);
   735	
   736		return pages;
   737	}
   738	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
