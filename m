Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FBC1A9FB6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 20:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756066329; cv=none; b=XKz9Md4Yx6BdVhAQWUCsm1YNQnHbgvkc624O5ZfKZ3acNYjdpNzI2zcM9YJV+mRw+UOtpyAoDARtOpcVgAuFdNNgET/6yE+NteHTm/n46jpbirR0eJVY40VAdvoFa8UiOrtQhzyvp8z6fdMLPlMThOzLYVKkJjBHUxqlTbbviHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756066329; c=relaxed/simple;
	bh=x2cEs+FNvIqGxHrowKJq1taUXUtWyGXfpqi6uwPM2Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ALFPEA1n+hkb8hHGYO/MH9fQ0q74DN/+Y3f2nA3FYm1PYyuigNyqd6SO/0kV7/t4xQ0om9p5CEBVIB414xLzzjCTEiPqvU2Ylz52W0ch6eM96IPaCB/beGoy8yYZAILZC9DK3puEFbLq7up/n9TfRspeqC9+wk4vAsxWfki0zMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mx+/kJ2T; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mx+/kJ2T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756066327; x=1787602327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x2cEs+FNvIqGxHrowKJq1taUXUtWyGXfpqi6uwPM2Rw=;
  b=mx+/kJ2T0YuqrTC0GjICfG9di7eqG/OnWtEgZz+A+7y+unBXQcjiZELY
   lcNb5mitGOZRtF7D9K7Pcpd9XJtc1awOgK0FizKJICYD2EqbV5DYo6btX
   xhHOueke3kseEcALCaA6a+LtnvRp47v0XPzaZ+GNut5MsTxmhRW031slk
   NPVjOU43JR9KucFPpAnnousi9s+zitHLU6fHexkCnW92CPHLeh/mhzdBH
   CRAUIlSbIw4ZqzqyO0xovUcSrVARAwc7gD6LxAwCT9K5L3qezKYoU2/jW
   //6vqmjHMr5xkZDxoOWqmMtND8sSxjyR6ssZg8KCSmRmUk8JUJS56YjGk
   A==;
X-CSE-ConnectionGUID: BD4EV6EKTBuXfFqJhodTBQ==
X-CSE-MsgGUID: sUyml9XESW2M48Zg05JfTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="75879143"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="75879143"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 13:12:06 -0700
X-CSE-ConnectionGUID: YtpgVaGjT1WQ+5K8F5umEQ==
X-CSE-MsgGUID: h/Okl1s7QAKSbyjZbimjjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173320280"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 Aug 2025 13:12:04 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqH3m-000NCF-19;
	Sun, 24 Aug 2025 20:11:46 +0000
Date: Mon, 25 Aug 2025 04:10:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: [akpm-mm:mm-unstable 102/221] include/linux/pgtable.h:2000:17:
 error: implicit declaration of function 'VM_WARN_ON_ONCE'; did you mean
 'WARN_ON_ONCE'?
Message-ID: <202508250425.yEOYgcC5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   3c3393d4b766eebdc475ea5bd6bbd3a221e2526e
commit: d2e502b0fe1166f68c7ca5815e73ad12bf87e74d [102/221] mm/memory: convert print_bad_pte() to print_bad_page_map()
config: xtensa-nommu_kc705_defconfig (https://download.01.org/0day-ci/archive/20250825/202508250425.yEOYgcC5-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508250425.yEOYgcC5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508250425.yEOYgcC5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/xtensa/include/asm/io.h:19,
                    from include/linux/io.h:12,
                    from lib/iomem_copy.c:8:
   include/linux/pgtable.h: In function 'pgtable_level_to_str':
>> include/linux/pgtable.h:2000:17: error: implicit declaration of function 'VM_WARN_ON_ONCE'; did you mean 'WARN_ON_ONCE'? [-Wimplicit-function-declaration]
    2000 |                 VM_WARN_ON_ONCE(1);
         |                 ^~~~~~~~~~~~~~~
         |                 WARN_ON_ONCE


vim +2000 include/linux/pgtable.h

  1985	
  1986	static inline const char *pgtable_level_to_str(enum pgtable_level level)
  1987	{
  1988		switch (level) {
  1989		case PGTABLE_LEVEL_PTE:
  1990			return "pte";
  1991		case PGTABLE_LEVEL_PMD:
  1992			return "pmd";
  1993		case PGTABLE_LEVEL_PUD:
  1994			return "pud";
  1995		case PGTABLE_LEVEL_P4D:
  1996			return "p4d";
  1997		case PGTABLE_LEVEL_PGD:
  1998			return "pgd";
  1999		default:
> 2000			VM_WARN_ON_ONCE(1);
  2001			return "unknown";
  2002		}
  2003	}
  2004	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
