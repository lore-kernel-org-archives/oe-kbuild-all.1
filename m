Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6867214290
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 22:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709677987; cv=none; b=NdF/NAg2Se8to8T3KdvvK6FeKbr9SVAcnNbNg/2lLSFTnPrDlulg9Tdt8ETRV820cGF+x/J5AsX++2KJ6jyDtizETldIy10u8/4DWOpXYV0Pn6Auh2/eimvxs123kjb8Qm8dRjiu5a6gp5mbITRYFLENDNYiGV8DJdvPX9qylnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709677987; c=relaxed/simple;
	bh=rEq6iCdg1Oy6dk++mbLO60T8BTax+ZxhyhVzmc7mEzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EzLOlV8ckSoisJgQ/SIyCd8wBMYuQws84Zv/8bS3ip2ID3VVplcG3iE/47gtwpmCp9IFy2/rB7LTir7aAzKn6yRLPXGZBadyDLFBqwRqBAGjhYe2JDMozga+o0ZzUz/MJlJjwFwoOYhrRuDiJVDDvPI/IpCigeukpTfs91TJV50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgOIDma9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgOIDma9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709677986; x=1741213986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rEq6iCdg1Oy6dk++mbLO60T8BTax+ZxhyhVzmc7mEzE=;
  b=bgOIDma9l1xVfi5cLxFu9Tha3+8cNVk/L+/c5PK/NqtIpaEJ1N83m4UB
   ZF1pRBpcaKx2ME+zSIi1ILEfYimQ2QpnIUzWIpervyfv6o2J1L+uyIkFa
   rorlhCzlCqwItZkZ+Qk6FZYklAEh1+l5lQbcOVg370mXsNVnxo3mpwZcb
   XrhecuEPmUuf4AYa6ll1Z+IUWg8r1ZMJkbecvDga+yAsoASkrfahpozI+
   aB01E/u9TwMQJckNXJaT2L8e0t/T8UD5N24Gcaf4VvrWIaG/wVcz5KH0J
   UCpCLS3ZZ12QjPZYr8m1ZbPTXcGNnWgoAyjo9bxRSefUVaXlx39KUpUPF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4383225"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="4383225"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 14:33:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="14105474"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Mar 2024 14:33:02 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhdLI-0003iP-0Z;
	Tue, 05 Mar 2024 22:33:00 +0000
Date: Wed, 6 Mar 2024 06:32:23 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] s390: supplement for ptdesc conversion
Message-ID: <202403060651.ld11yLEn-lkp@intel.com>
References: <04beaf3255056ffe131a5ea595736066c1e84756.1709541697.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04beaf3255056ffe131a5ea595736066c1e84756.1709541697.git.zhengqi.arch@bytedance.com>

Hi Qi,

kernel test robot noticed the following build errors:

[auto build test ERROR on s390/features]
[also build test ERROR on kvms390/next linus/master v6.8-rc7]
[cannot apply to akpm-mm/mm-everything next-20240305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qi-Zheng/mm-pgtable-correct-the-wrong-comment-about-ptdesc-__page_flags/20240304-191006
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
patch link:    https://lore.kernel.org/r/04beaf3255056ffe131a5ea595736066c1e84756.1709541697.git.zhengqi.arch%40bytedance.com
patch subject: [PATCH 3/3] s390: supplement for ptdesc conversion
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240306/202403060651.ld11yLEn-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403060651.ld11yLEn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403060651.ld11yLEn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/smp.h:12,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/pagewalk.h:5,
                    from arch/s390/mm/gmap.c:12:
   arch/s390/mm/gmap.c: In function 'gmap_free':
>> include/linux/list.h:866:19: error: assignment to 'struct page *' from incompatible pointer type 'struct ptdesc *' [-Werror=incompatible-pointer-types]
     866 |                 n = list_next_entry(pos, member);                       \
         |                   ^
   arch/s390/mm/gmap.c:212:17: note: in expansion of macro 'list_for_each_entry_safe'
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:868:18: error: assignment to 'struct ptdesc *' from incompatible pointer type 'struct page *' [-Werror=incompatible-pointer-types]
     868 |              pos = n, n = list_next_entry(n, member))
         |                  ^
   arch/s390/mm/gmap.c:212:17: note: in expansion of macro 'list_for_each_entry_safe'
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:22,
                    from arch/s390/mm/gmap.c:11:
>> arch/s390/mm/gmap.c:212:72: error: 'struct page' has no member named 'pt_list'; did you mean 'pcp_list'?
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                                                                        ^~~~~~~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:868:27: note: in expansion of macro 'list_next_entry'
     868 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   arch/s390/mm/gmap.c:212:17: note: in expansion of macro 'list_for_each_entry_safe'
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5:
>> arch/s390/mm/gmap.c:212:72: error: 'struct page' has no member named 'pt_list'; did you mean 'pcp_list'?
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                                                                        ^~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:868:27: note: in expansion of macro 'list_next_entry'
     868 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   arch/s390/mm/gmap.c:212:17: note: in expansion of macro 'list_for_each_entry_safe'
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/s390/mm/gmap.c:212:72: error: 'struct page' has no member named 'pt_list'; did you mean 'pcp_list'?
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                                                                        ^~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:868:27: note: in expansion of macro 'list_next_entry'
     868 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   arch/s390/mm/gmap.c:212:17: note: in expansion of macro 'list_for_each_entry_safe'
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/s390/mm/gmap.c:212:72: error: 'struct page' has no member named 'pt_list'; did you mean 'pcp_list'?
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                                                                        ^~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:868:27: note: in expansion of macro 'list_next_entry'
     868 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   arch/s390/mm/gmap.c:212:17: note: in expansion of macro 'list_for_each_entry_safe'
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:376:27: error: expression in static assertion is not an integer
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:868:27: note: in expansion of macro 'list_next_entry'
     868 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   arch/s390/mm/gmap.c:212:17: note: in expansion of macro 'list_for_each_entry_safe'
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from arch/s390/include/asm/rwonce.h:29,
                    from include/linux/compiler.h:251,
                    from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16:
>> arch/s390/mm/gmap.c:212:72: error: 'struct page' has no member named 'pt_list'; did you mean 'pcp_list'?
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                                                                        ^~~~~~~
   include/linux/stddef.h:16:58: note: in definition of macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                                          ^~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:868:27: note: in expansion of macro 'list_next_entry'
     868 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   arch/s390/mm/gmap.c:212:17: note: in expansion of macro 'list_for_each_entry_safe'
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +212 arch/s390/mm/gmap.c

   187	
   188	/**
   189	 * gmap_free - free a guest address space
   190	 * @gmap: pointer to the guest address space structure
   191	 *
   192	 * No locks required. There are no references to this gmap anymore.
   193	 */
   194	static void gmap_free(struct gmap *gmap)
   195	{
   196		struct page *page, *next;
   197	
   198		/* Flush tlb of all gmaps (if not already done for shadows) */
   199		if (!(gmap_is_shadow(gmap) && gmap->removed))
   200			gmap_flush_tlb(gmap);
   201		/* Free all segment & region tables. */
   202		list_for_each_entry_safe(page, next, &gmap->crst_list, lru)
   203			__free_pages(page, CRST_ALLOC_ORDER);
   204		gmap_radix_tree_free(&gmap->guest_to_host);
   205		gmap_radix_tree_free(&gmap->host_to_guest);
   206	
   207		/* Free additional data for a shadow gmap */
   208		if (gmap_is_shadow(gmap)) {
   209			struct ptdesc *ptdesc;
   210	
   211			/* Free all page tables. */
 > 212			list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
   213				page_table_free_pgste(ptdesc);
   214			gmap_rmap_radix_tree_free(&gmap->host_to_rmap);
   215			/* Release reference to the parent */
   216			gmap_put(gmap->parent);
   217		}
   218	
   219		kfree(gmap);
   220	}
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
