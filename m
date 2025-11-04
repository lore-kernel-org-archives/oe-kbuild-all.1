Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2E242A8B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 00:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762215393; cv=none; b=U+RoBSHsLAsEl5rVyMs4wzvjP4SqhPVvTmOKu6oHSArLioSYJNOqotanFeosAFWja6gjUrhWE4yPLPF5V1WHCcJIG/WA3oAerxu5H2uAN3qf/e0VJ847Pk5Ur1BHOhi8mHiJmfIcNO19r8G05a/Q0MPIcHvAIMZhOqi3tB67DDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762215393; c=relaxed/simple;
	bh=zxAXuaKryOZl71JI0V1lAw38LB1v6NuF6Mtj84GNJJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BWutnuT1zgynBpQ2S748p5VPB1n8wEOQLnCQSb/09rQ/7fEiyBvHonZ8eqtAGKnLj55gF3ofrxfdihTdVRcojeiYtQUlJJ96HX2XDKIJuQiE+BMmVOrao3K3DnyQHZHjZNUcq8wFBMzwlZ5p6MKkwCve8eg+4LlWeIsB9PvaiIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rl3eWjz9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rl3eWjz9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762215392; x=1793751392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zxAXuaKryOZl71JI0V1lAw38LB1v6NuF6Mtj84GNJJA=;
  b=Rl3eWjz9B0pvzgIIAipXVJRnwIpIia7k8UP24M+TC+HESw7cclPJssba
   9aE495JdZTpnyPstf1ZuOaXFys9cnGoMQ+9mXiNWGV6DKISFCR5wpA9Tk
   rRxaSrklEa7jgonC47+g0ziWA7B/TB0KkH491GJaZwyciqbJNohLHn+dn
   lIuaNP0haw0U41iXZTTlt0YAWfeiKqbBZ9/YZvMSGwtNVEPW2qrrEOdBg
   uYG8npNRzyA0Kjad6qVvbFfFO44Nt4CBPnc2HwbksuIwT86bwnjnrAau5
   sNF/yXhbOMPTJlDxDNTMt6fDXWQuFpDs/+nSYSPCtFYO9yWwGTQ98Gie7
   Q==;
X-CSE-ConnectionGUID: LAYYe8OWRSSE74QtFPP1DQ==
X-CSE-MsgGUID: 4KOWs7k4Sguz0/Lqx48sRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="51871462"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="51871462"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 16:16:31 -0800
X-CSE-ConnectionGUID: xWdJEXLTRK285TprlfyTVg==
X-CSE-MsgGUID: M2sTMn8SRQGukSTiZD9R6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="191352272"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 03 Nov 2025 16:16:24 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG4iD-000Qeu-2k;
	Tue, 04 Nov 2025 00:16:01 +0000
Date: Tue, 4 Nov 2025 08:15:00 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Arnd Bergmann <arnd@arndb.de>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH 10/16] mm: replace pmd_to_swp_entry() with
 leafent_from_pmd()
Message-ID: <202511040851.UAHe93ix-lkp@intel.com>
References: <38c26e75ed00263e9ecbebb0c045dd6d8183ec67.1762171281.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38c26e75ed00263e9ecbebb0c045dd6d8183ec67.1762171281.git.lorenzo.stoakes@oracle.com>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-correctly-handle-UFFD-PTE-markers/20251103-204118
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/38c26e75ed00263e9ecbebb0c045dd6d8183ec67.1762171281.git.lorenzo.stoakes%40oracle.com
patch subject: [PATCH 10/16] mm: replace pmd_to_swp_entry() with leafent_from_pmd()
config: sh-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251104/202511040851.UAHe93ix-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040851.UAHe93ix-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040851.UAHe93ix-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/leafops.h:6,
                    from include/linux/migrate.h:9,
                    from mm/damon/ops-common.c:8:
   include/linux/swapops.h: In function 'swp_entry':
   include/linux/swapops.h:27:46: error: 'MAX_SWAPFILES_SHIFT' undeclared (first use in this function)
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:90:28: note: in expansion of macro 'SWP_TYPE_SHIFT'
      90 |         ret.val = (type << SWP_TYPE_SHIFT) | (offset & SWP_OFFSET_MASK);
         |                            ^~~~~~~~~~~~~~
   include/linux/swapops.h:27:46: note: each undeclared identifier is reported only once for each function it appears in
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:90:28: note: in expansion of macro 'SWP_TYPE_SHIFT'
      90 |         ret.val = (type << SWP_TYPE_SHIFT) | (offset & SWP_OFFSET_MASK);
         |                            ^~~~~~~~~~~~~~
   include/linux/swapops.h: In function 'swp_type':
   include/linux/swapops.h:27:46: error: 'MAX_SWAPFILES_SHIFT' undeclared (first use in this function)
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:100:30: note: in expansion of macro 'SWP_TYPE_SHIFT'
     100 |         return (entry.val >> SWP_TYPE_SHIFT);
         |                              ^~~~~~~~~~~~~~
   include/linux/swapops.h: In function 'swp_offset':
   include/linux/swapops.h:27:46: error: 'MAX_SWAPFILES_SHIFT' undeclared (first use in this function)
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:28:34: note: in expansion of macro 'SWP_TYPE_SHIFT'
      28 | #define SWP_OFFSET_MASK ((1UL << SWP_TYPE_SHIFT) - 1)
         |                                  ^~~~~~~~~~~~~~
   include/linux/swapops.h:109:28: note: in expansion of macro 'SWP_OFFSET_MASK'
     109 |         return entry.val & SWP_OFFSET_MASK;
         |                            ^~~~~~~~~~~~~~~
   include/linux/swapops.h: In function 'make_pte_marker_entry':
   include/linux/swapops.h:395:26: error: 'SWP_PTE_MARKER' undeclared (first use in this function)
     395 |         return swp_entry(SWP_PTE_MARKER, marker);
         |                          ^~~~~~~~~~~~~~
   In file included from <command-line>:
   include/linux/swapops.h: In function 'is_pfn_swap_entry':
   include/linux/swapops.h:27:46: error: 'MAX_SWAPFILES_SHIFT' undeclared (first use in this function)
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:577:23: note: in definition of macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:597:9: note: in expansion of macro '_compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/swapops.h:448:9: note: in expansion of macro 'BUILD_BUG_ON'
     448 |         BUILD_BUG_ON(SWP_TYPE_SHIFT < SWP_PFN_BITS);
         |         ^~~~~~~~~~~~
   include/linux/swapops.h:448:22: note: in expansion of macro 'SWP_TYPE_SHIFT'
     448 |         BUILD_BUG_ON(SWP_TYPE_SHIFT < SWP_PFN_BITS);
         |                      ^~~~~~~~~~~~~~
   include/linux/swapops.h: In function 'non_swap_entry':
   include/linux/swapops.h:491:35: error: 'MAX_SWAPFILES' undeclared (first use in this function); did you mean 'S_SWAPFILE'?
     491 |         return swp_type(entry) >= MAX_SWAPFILES;
         |                                   ^~~~~~~~~~~~~
         |                                   S_SWAPFILE
   include/linux/leafops.h: In function 'leafent_from_pmd':
   include/linux/leafops.h:111:22: error: implicit declaration of function '__pmd_to_swp_entry'; did you mean 'pte_to_swp_entry'? [-Werror=implicit-function-declaration]
     111 |         arch_entry = __pmd_to_swp_entry(pmd);
         |                      ^~~~~~~~~~~~~~~~~~
         |                      pte_to_swp_entry
   include/linux/leafops.h:111:22: error: incompatible types when assigning to type 'leaf_entry_t' {aka 'swp_entry_t'} from type 'int'
   include/linux/swapops.h: In function 'swp_offset':
>> include/linux/swapops.h:110:1: warning: control reaches end of non-void function [-Wreturn-type]
     110 | }
         | ^
   cc1: some warnings being treated as errors


vim +110 include/linux/swapops.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  102  
^1da177e4c3f41 Linus Torvalds 2005-04-16  103  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16  104   * Extract the `offset' field from a swp_entry_t.  The swp_entry_t is in
^1da177e4c3f41 Linus Torvalds 2005-04-16  105   * arch-independent format
^1da177e4c3f41 Linus Torvalds 2005-04-16  106   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  107  static inline pgoff_t swp_offset(swp_entry_t entry)
^1da177e4c3f41 Linus Torvalds 2005-04-16  108  {
3159f943aafdba Matthew Wilcox 2017-11-03  109  	return entry.val & SWP_OFFSET_MASK;
^1da177e4c3f41 Linus Torvalds 2005-04-16 @110  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  111  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
