Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B367413239
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 15:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769010288; cv=none; b=uKI7W9AQL5WETot1gyNiMIe6A9JT9GmOTd46nryJjSPnTzncPCoc9k/4ZEZzDql1VrTWOKSONWobY6mZ51rGbIEu/3akrVhY+YHsfBx3fi+vuLcOyDTJ0GYkhKjhhPFqDHnBrOeWm7r0RxyYSDyfHzv4gb1180TPIAD2J+IgdKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769010288; c=relaxed/simple;
	bh=pDy4BfSLAn84EDfUvOkKtsrCnZKTANceUixnr6zv7DY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I/h28HSVfXHWIOeT0Jn4vXZRBD5NYb/LjPEO1WFRoTY9vmXYSDXhrmIf1WUz/TURBL8f04nLebqpqNW8KEGIWZ//IoCp2wuHWmaoNydb7CidKbld1U6rFCZ4vZHPsqTEYZACSflAmuZ+D4exyBipF+fY0FNAoMdazb3PgiXEW4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1mjwzRA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1mjwzRA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769010286; x=1800546286;
  h=date:from:to:cc:subject:message-id;
  bh=pDy4BfSLAn84EDfUvOkKtsrCnZKTANceUixnr6zv7DY=;
  b=c1mjwzRAD7OOIulLkX5oobvnDg61CRxAIh06b/v4MSlqvPno+M84N9YA
   JLlW9iifyonUl+LnM80XUZJv4X7hlV9wrD2ZiffvohvetYJAFeK6SHWYD
   K+hHDYz+ll21PmJ2snhwIn0NLdKeNfWNf27GTaFBPRimD9cpCXieRU81E
   ZUKW6TA7jlpw/vzVI89gWgU4/i3BKtelSrz0dSbAEYiPrGJTui4cVsrCF
   cQtEWY/mllrBW97T/O90GpKm9GZjgKk53G3h2nIthKseUJnuvBR2N7us5
   CW6ssZvFYt/30jWDe2jtgyNMzv57jF11ecO+oq/JyBrC+qAWUD/BjeA26
   g==;
X-CSE-ConnectionGUID: xdK5F0DyQFCDQ8NK8b+WGQ==
X-CSE-MsgGUID: cFmS+SG8RDSP4Zi7BohCZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69435060"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="69435060"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 07:44:45 -0800
X-CSE-ConnectionGUID: TmcEmGjHQLWEAqixi+tXEw==
X-CSE-MsgGUID: 1QFVINlsT6iu7VK6AvHGrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="244055679"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Jan 2026 07:44:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viaNs-00000000RMV-460G;
	Wed, 21 Jan 2026 15:44:40 +0000
Date: Wed, 21 Jan 2026 23:44:07 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 414/422]
 include/linux/hugetlb_inline.h:16:16: sparse: sparse: dereference of noderef
 expression
Message-ID: <202601212341.LQmq1CzY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lorenzo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   74daaa378c853e693bf1822327648b98c7d491ec
commit: b9a7362d7bfd71c7db3c40aa82816ed3209c3967 [414/422] mm: update hugetlbfs to use VMA flags on mmap_prepare
config: x86_64-randconfig-122-20260121 (https://download.01.org/0day-ci/archive/20260121/202601212341.LQmq1CzY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601212341.LQmq1CzY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601212341.LQmq1CzY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/hugetlb.c:658:12: sparse: sparse: context imbalance in 'allocate_file_region_entries' - wrong count at exit
   mm/hugetlb.c:729:13: sparse: sparse: context imbalance in 'region_add' - wrong count at exit
   mm/hugetlb.c:796:13: sparse: sparse: context imbalance in 'region_chg' - wrong count at exit
   mm/hugetlb.c:1196:9: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c:1196:9: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c: note: in included file (through include/linux/pagemap.h):
>> include/linux/hugetlb_inline.h:16:16: sparse: sparse: dereference of noderef expression
>> include/linux/hugetlb_inline.h:16:16: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c: note: in included file:
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c: note: in included file (through include/linux/pagemap.h):
>> include/linux/hugetlb_inline.h:16:16: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c: note: in included file:
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c:1197:9: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:36: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:53: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:36: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:53: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c:1204:9: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c:1204:9: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c: note: in included file (through include/linux/pagemap.h):
>> include/linux/hugetlb_inline.h:16:16: sparse: sparse: dereference of noderef expression
>> include/linux/hugetlb_inline.h:16:16: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c: note: in included file:
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c: note: in included file (through include/linux/pagemap.h):
>> include/linux/hugetlb_inline.h:16:16: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c: note: in included file:
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c:1205:9: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:36: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:53: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:36: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:53: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c:1219:9: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c:1219:9: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c: note: in included file (through include/linux/pagemap.h):
>> include/linux/hugetlb_inline.h:16:16: sparse: sparse: dereference of noderef expression
>> include/linux/hugetlb_inline.h:16:16: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c: note: in included file:
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c: note: in included file (through include/linux/pagemap.h):
>> include/linux/hugetlb_inline.h:16:16: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c: note: in included file:
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c:5098:20: sparse: sparse: context imbalance in 'move_huge_pte' - different lock contexts for basic block
   include/linux/mm.h:1772:22: sparse: sparse: context imbalance in 'hugetlb_wp' - unexpected unlock
   mm/hugetlb.c:6588:13: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c:6588:13: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c:6588:13: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c:6597:22: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:36: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:53: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:36: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:53: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c:6631:22: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:36: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:53: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:36: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:53: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c:6668:22: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:36: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:53: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:36: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:53: sparse: sparse: dereference of noderef expression
   mm/hugetlb.c:6732:22: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:36: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:53: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:36: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1181:53: sparse: sparse: dereference of noderef expression

vim +16 include/linux/hugetlb_inline.h

    13	
    14	static inline bool is_vma_hugetlb_flags(vma_flags_t flags)
    15	{
  > 16		return vma_flags_test(flags, VMA_HUGETLB_BIT);
    17	}
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
