Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95299313528
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 09:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765789520; cv=none; b=WJvZoeei7U8ooT1SlTqKDpNxNk6WtcgQKW/rDMJ8uI2yDyP3oaj0Rf3D0BwO+cesf4sjxkk0XUm0nEUwJjiHEf320Aeidnwg52pf/BAlCINzzACLmJbWCD3DrgCNeF1b5u/pNulxelLVQykg61kyCywQGgAqc0SrkJf8mw5Z9l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765789520; c=relaxed/simple;
	bh=fL9iG5i41E4V84+zxeHaTTC5jf7hLeyLahoqUcJdCa4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KMetUka3gvIo8pJb7ofBVU+kzCsF6rxM5SYrrjU4VHXk8EAEE5fMfYo74kcxnIGBM58cwnrbSZ763r4A2S7h0wNSSxpq9s8F/v43NbwdFoF7ac1euKwiBfrWsCdalf0QnOZw230daddJiaGq5hPD6AEvw8ug91XGUSWMIPQUZ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YxdwyMzG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YxdwyMzG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765789519; x=1797325519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fL9iG5i41E4V84+zxeHaTTC5jf7hLeyLahoqUcJdCa4=;
  b=YxdwyMzGZKZClyGAAN2tsPM9O3ehy8OTECsNBmFVDTplaPx96iC/WiUN
   zhlrSKTpPiSs01NGU2jUKQ06BrNHBlUGq5mY76SyRpsSFzZWyehKcB8C+
   FOtce3ZaJjWkRfeYsChRS1WBf7lmHFELC5W80ybMlmrguCzz0xI55vm8Q
   1w5tvrpnBrEFToJ+RgkPW4TcU2KlCbTSs9kGwbuyU4mGxG/v4O4AsNKLy
   839w3w37410vMTcC5igRp5iLu5VMCz8EnJEfx+2M79bvAOuOkvwTteq/m
   EeoL5qjnNERnOqV2LbO9rr+5DYP0XawdRaF1xsxPeUhNc++2Wu7O9VcKB
   A==;
X-CSE-ConnectionGUID: oQpsmepfSoyCk5K991NAcQ==
X-CSE-MsgGUID: WTGsoTgiQGiO8eHyZBm2Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67623916"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67623916"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 01:05:16 -0800
X-CSE-ConnectionGUID: Tw1ew6XaQ3uFr9cpfwKT2Q==
X-CSE-MsgGUID: FZP7225uQImlItV00WxuLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197288993"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 15 Dec 2025 01:05:14 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV4W0-0000000007D-26n6;
	Mon, 15 Dec 2025 09:05:12 +0000
Date: Mon, 15 Dec 2025 17:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:ptdesc 1/1] include/asm-generic/memory_model.h:19:57:
 error: invalid operands to binary - (have 'pgtable_t' {aka 'struct ptdesc
 *'} and 'struct page *')
Message-ID: <202512151705.x0rObEOs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git ptdesc
head:   70d5b71dd5496fcb74a973de41e3f18249c1f37f
commit: 70d5b71dd5496fcb74a973de41e3f18249c1f37f [1/1] convert pgtable_t to ptdesc pointer
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20251215/202512151705.x0rObEOs-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151705.x0rObEOs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151705.x0rObEOs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/alpha/include/asm/page.h:85,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from kernel/fork.c:16:
   arch/alpha/include/asm/pgalloc.h: In function 'pmd_populate':
>> include/asm-generic/memory_model.h:19:57: error: invalid operands to binary - (have 'pgtable_t' {aka 'struct ptdesc *'} and 'struct page *')
      19 | #define __page_to_pfn(page)     ((unsigned long)((page) - mem_map) + \
         |                                                         ^
   include/asm-generic/memory_model.h:73:21: note: in expansion of macro '__page_to_pfn'
      73 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   arch/alpha/include/asm/pgtable.h:167:34: note: in expansion of macro 'page_to_pfn'
     167 | #define page_to_pa(page)        (page_to_pfn(page) << PAGE_SHIFT)
         |                                  ^~~~~~~~~~~
   arch/alpha/include/asm/pgalloc.h:19:32: note: in expansion of macro 'page_to_pa'
      19 |         pmd_set(pmd, (pte_t *)(page_to_pa(pte) + PAGE_OFFSET));
         |                                ^~~~~~~~~~


vim +19 include/asm-generic/memory_model.h

a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  17  
67de648211fa04 Andy Whitcroft    2006-06-23  18  #define __pfn_to_page(pfn)	(mem_map + ((pfn) - ARCH_PFN_OFFSET))
67de648211fa04 Andy Whitcroft    2006-06-23 @19  #define __page_to_pfn(page)	((unsigned long)((page) - mem_map) + \
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  20  				 ARCH_PFN_OFFSET)
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  21  

:::::: The code at line 19 was first introduced by commit
:::::: 67de648211fa041fe08a0c25241a4980bbb90698 [PATCH] squash duplicate page_to_pfn and pfn_to_page

:::::: TO: Andy Whitcroft <apw@shadowen.org>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
