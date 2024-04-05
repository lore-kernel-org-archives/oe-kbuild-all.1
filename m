Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2C123746
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 22:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712356328; cv=none; b=ddQdMYOlIHEiwgGuhkPyj3BuXchgdyBCTDY7XjGUksIGDoJi97cJDMkx8nY6dlpGmYxru7pM6VRwSzzZDwbYBwIqPwGYu1IaHRzKyzhmzoibRJkQKrgeXA2erEyGKPJyUCJLo02bGtjomWqoZpGatnSOcAIGSpvpBmXnlBdCwx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712356328; c=relaxed/simple;
	bh=rnLq6GWqc43unzxFe6qS3yEHqU2YIPafRZXUYF9d5P4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n42GsYskCvs0vO1vtM/ENwqoSAf0aTG8Ycxk3BbBk+HeoLqnQAc42IA51rANjBwUoQj51/ezo2nQobhAq4W1omDmbzqPqPVINKe8HQpk2oB13tE+GSixv6MeLDQZulk+o8oCoxceVbGTz0jdSSSeoV3rX3L0i8/0g7xdSPr0AP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xz7I9YVX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xz7I9YVX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712356327; x=1743892327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rnLq6GWqc43unzxFe6qS3yEHqU2YIPafRZXUYF9d5P4=;
  b=Xz7I9YVXnTxCPtwtZbVyaHYb2wrUNB6GvcbJg9Dk5u5IdGsI63drZjBo
   1amNGmhiZx160i/F++89ABWzC9IO8Dlrs0FSqoqf2TyUDkuawOuRXC0mc
   jaTxGmL+p0qfxqg60moLFsaWfG8ih5DH3JhYjc0nzsYQuNYJ+G5iVm34F
   ClBTTG36VSQx1dlfIoL1itpUZTixiaChmMlIfGWfutSPe/OtGOqfrr8dQ
   7V6zr0NcY5Q4jvmvVGLjF2aPo0cW6Dw44sdtqYgnr2rTRKd6uQjk1zq5F
   U6HPm1lr8WQD+4EngCRTajx1fhIPGdlfA8sPpuRs7/R1xokPKc88qqSdG
   A==;
X-CSE-ConnectionGUID: szAPyJvLR6WkrxZnjrVC8g==
X-CSE-MsgGUID: EsftxV29Q+qj+Z0dQGUrgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="18437341"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="18437341"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 15:32:06 -0700
X-CSE-ConnectionGUID: 6NeLNscPQOqfl7r1ixhpKA==
X-CSE-MsgGUID: Z6kzOEKGRp+k7zbe81O34g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19739545"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Apr 2024 15:32:05 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rss6M-0002mx-2D;
	Fri, 05 Apr 2024 22:32:02 +0000
Date: Sat, 6 Apr 2024 06:31:22 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:large_mapcount 24/27] fs/proc/page.c:73:44: error:
 'page' undeclared
Message-ID: <202404060652.slKQLiOg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux large_mapcount
head:   7e8a03fbcd6b8b5a7e2b6ea60f620c5d816cb44b
commit: efed85936fb7a152c58898dce59efa55105f78f9 [24/27] fs/proc/page: expose folio_mapcount() instead of page_mapcount()
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20240406/202404060652.slKQLiOg-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060652.slKQLiOg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060652.slKQLiOg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:23,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/memblock.h:12,
                    from fs/proc/page.c:2:
   fs/proc/page.c: In function 'kpagecount_read':
>> fs/proc/page.c:73:44: error: 'page' undeclared (first use in this function)
      73 |                         folio = page_folio(page);
         |                                            ^~~~
   include/linux/page-flags.h:267:44: note: in definition of macro 'page_folio'
     267 | #define page_folio(p)           (_Generic((p),                          \
         |                                            ^
   fs/proc/page.c:73:44: note: each undeclared identifier is reported only once for each function it appears in
      73 |                         folio = page_folio(page);
         |                                            ^~~~
   include/linux/page-flags.h:267:44: note: in definition of macro 'page_folio'
     267 | #define page_folio(p)           (_Generic((p),                          \
         |                                            ^
>> fs/proc/page.c:74:49: error: 'dolio' undeclared (first use in this function); did you mean 'folio'?
      74 |                         pcount = folio_mapcount(dolio);
         |                                                 ^~~~~
         |                                                 folio
>> fs/proc/page.c:50:23: warning: variable 'folio' set but not used [-Wunused-but-set-variable]
      50 |         struct folio *folio;
         |                       ^~~~~


vim +/page +73 fs/proc/page.c

   > 2	#include <linux/memblock.h>
     3	#include <linux/compiler.h>
     4	#include <linux/fs.h>
     5	#include <linux/init.h>
     6	#include <linux/ksm.h>
     7	#include <linux/mm.h>
     8	#include <linux/mmzone.h>
     9	#include <linux/huge_mm.h>
    10	#include <linux/proc_fs.h>
    11	#include <linux/seq_file.h>
    12	#include <linux/hugetlb.h>
    13	#include <linux/memremap.h>
    14	#include <linux/memcontrol.h>
    15	#include <linux/mmu_notifier.h>
    16	#include <linux/page_idle.h>
    17	#include <linux/kernel-page-flags.h>
    18	#include <linux/uaccess.h>
    19	#include "internal.h"
    20	
    21	#define KPMSIZE sizeof(u64)
    22	#define KPMMASK (KPMSIZE - 1)
    23	#define KPMBITS (KPMSIZE * BITS_PER_BYTE)
    24	
    25	static inline unsigned long get_max_dump_pfn(void)
    26	{
    27	#ifdef CONFIG_SPARSEMEM
    28		/*
    29		 * The memmap of early sections is completely populated and marked
    30		 * online even if max_pfn does not fall on a section boundary -
    31		 * pfn_to_online_page() will succeed on all pages. Allow inspecting
    32		 * these memmaps.
    33		 */
    34		return round_up(max_pfn, PAGES_PER_SECTION);
    35	#else
    36		return max_pfn;
    37	#endif
    38	}
    39	
    40	/* /proc/kpagecount - an array exposing page counts
    41	 *
    42	 * Each entry is a u64 representing the corresponding
    43	 * physical page count.
    44	 */
    45	static ssize_t kpagecount_read(struct file *file, char __user *buf,
    46				     size_t count, loff_t *ppos)
    47	{
    48		const unsigned long max_dump_pfn = get_max_dump_pfn();
    49		u64 __user *out = (u64 __user *)buf;
  > 50		struct folio *folio;
    51		struct page *ppage;
    52		unsigned long src = *ppos;
    53		unsigned long pfn;
    54		ssize_t ret = 0;
    55		u64 pcount;
    56	
    57		pfn = src / KPMSIZE;
    58		if (src & KPMMASK || count & KPMMASK)
    59			return -EINVAL;
    60		if (src >= max_dump_pfn * KPMSIZE)
    61			return 0;
    62		count = min_t(unsigned long, count, (max_dump_pfn * KPMSIZE) - src);
    63	
    64		while (count > 0) {
    65			/*
    66			 * TODO: ZONE_DEVICE support requires to identify
    67			 * memmaps that were actually initialized.
    68			 */
    69			ppage = pfn_to_online_page(pfn);
    70	
    71			pcount = 0;
    72			if (ppage) {
  > 73				folio = page_folio(page);
  > 74				pcount = folio_mapcount(dolio);
    75			}
    76	
    77			if (put_user(pcount, out)) {
    78				ret = -EFAULT;
    79				break;
    80			}
    81	
    82			pfn++;
    83			out++;
    84			count -= KPMSIZE;
    85	
    86			cond_resched();
    87		}
    88	
    89		*ppos += (char __user *)out - buf;
    90		if (!ret)
    91			ret = (char __user *)out - buf;
    92		return ret;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
