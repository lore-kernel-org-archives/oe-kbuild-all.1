Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7773A2E0902
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Sep 2025 17:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758993325; cv=none; b=Ljp9e8HVv4lQT1pL0VmDeG98U9zD/fsi7dIuTVTGzw/f01Qmkd4Yq6sT0Irc9OexniAmLzeSaZAuQv8otr164X5VvYVI2bP4NkJwngm4VU0JFhAP5Ja7ikkwR3YKdlxxHZdBR3xtyacunVylSpuXvmlrGylKRkSVr1e5v3CM948=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758993325; c=relaxed/simple;
	bh=l3z7WmQKQxNWz8k5q+sA98HFf5uJz31lFUvbYbHWsG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0F7YFoFhGNZZakj2Wfp6szfsy2oL5K4unj3rMXKWXDLyAPMMRHuTyemqQkHNALq2GVVeYT1VKr/1K8r+DRV0D1HpDo7/msRDe9P4fmpGjcc2svSG7MIP3nIvQjxJFhqA2pFVED2EtC1ZrkK0yCW+1RjDNYuruJppvoz9WNRjWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zr7KNIp+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zr7KNIp+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758993324; x=1790529324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l3z7WmQKQxNWz8k5q+sA98HFf5uJz31lFUvbYbHWsG0=;
  b=Zr7KNIp+BJqJQw21niVMqkeE3f6UEUcircBI0ychDuwbCj/3Yms7n1Bk
   3mnBrQ10i3izR/hF/2BhS8q3c+xNyNxwI7PNGau2ek+m1R7C7D/OdcYco
   kNzb1Lq4swPs3GXtiN2vMHBcGp5Kvp6u4/H4oheirRQZIjkpwe7aQNFRd
   P7SVykeuxWJyQpHh+WLI4O9pZv6geaDuKmzGf2yA8ehKWPJ1rz9LQQNKN
   ao0xfVFFefoDdu3yhKCCn6Xdw9C5YbRUr9AZYFWOrAIUbLK/E5g24VdLT
   nWZp2os9y06FUsQoaLgjlmziqomJ6E/V7PBKZC2e0LdxjtGMivQZWuwBP
   g==;
X-CSE-ConnectionGUID: Am7/WttcSBeyv+4v0riSsQ==
X-CSE-MsgGUID: VDkXfGYvQuio8zC3LMio1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61208282"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61208282"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 10:15:23 -0700
X-CSE-ConnectionGUID: poz5PeyOTuOPYykHgftmhg==
X-CSE-MsgGUID: grlmEzsmTlKzFA4tdYdAwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="177447736"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 27 Sep 2025 10:15:20 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2YVt-0007EL-1V;
	Sat, 27 Sep 2025 17:15:15 +0000
Date: Sun, 28 Sep 2025 01:14:59 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	chrisl@kernel.org, kasong@tencent.com, youngjun.park@lge.com,
	aaron.lu@intel.com, baohua@kernel.org, shikemeng@huaweicloud.com,
	nphamcs@gmail.com, Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v2 1/1] mm/swapfile.c: select the swap device with
 default priority round robin
Message-ID: <202509280002.NWLixh90-lkp@intel.com>
References: <20250926155504.5122-2-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926155504.5122-2-bhe@redhat.com>

Hi Baoquan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.17-rc7 next-20250926]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/mm-swapfile-c-select-the-swap-device-with-default-priority-round-robin/20250926-235740
base:   linus/master
patch link:    https://lore.kernel.org/r/20250926155504.5122-2-bhe%40redhat.com
patch subject: [PATCH v2 1/1] mm/swapfile.c: select the swap device with default priority round robin
config: sparc-randconfig-001-20250927 (https://download.01.org/0day-ci/archive/20250928/202509280002.NWLixh90-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509280002.NWLixh90-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509280002.NWLixh90-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/swapfile.c: In function '_enable_swap_info':
   mm/swapfile.c:2550:31: error: 'swap_active_head' undeclared (first use in this function); did you mean 'swap_avail_head'?
    2550 |         plist_add(&si->list, &swap_active_head);
         |                               ^~~~~~~~~~~~~~~~
         |                               swap_avail_head
   mm/swapfile.c:2550:31: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/list.h:5,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from mm/swapfile.c:9:
   mm/swapfile.c: In function '__do_sys_swapoff':
   mm/swapfile.c:2655:34: error: 'swap_active_head' undeclared (first use in this function); did you mean 'swap_avail_head'?
    2655 |         plist_for_each_entry(p, &swap_active_head, list) {
         |                                  ^~~~~~~~~~~~~~~~
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   include/linux/plist.h:173:10: note: in expansion of macro 'list_for_each_entry'
     173 |          list_for_each_entry(pos, &(head)->node_list, mem.node_list)
         |          ^~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:2655:9: note: in expansion of macro 'plist_for_each_entry'
    2655 |         plist_for_each_entry(p, &swap_active_head, list) {
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/sparc/include/asm/bug.h:25,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from mm/swapfile.c:9:
   include/linux/compiler_types.h:507:27: error: expression in static assertion is not an integer
     507 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   include/linux/plist.h:173:10: note: in expansion of macro 'list_for_each_entry'
     173 |          list_for_each_entry(pos, &(head)->node_list, mem.node_list)
         |          ^~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:2655:9: note: in expansion of macro 'plist_for_each_entry'
    2655 |         plist_for_each_entry(p, &swap_active_head, list) {
         |         ^~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c: In function '__has_usable_swap':
   mm/swapfile.c:3835:35: error: 'swap_active_head' undeclared (first use in this function); did you mean 'swap_avail_head'?
    3835 |         return !plist_head_empty(&swap_active_head);
         |                                   ^~~~~~~~~~~~~~~~
         |                                   swap_avail_head
>> mm/swapfile.c:3836:1: warning: control reaches end of non-void function [-Wreturn-type]
    3836 | }
         | ^


vim +3836 mm/swapfile.c

a2468cc9bfdff6 Aaron Lu    2017-09-06  3831  
2cf855837b89d9 Tejun Heo   2018-07-03  3832  #if defined(CONFIG_MEMCG) && defined(CONFIG_BLK_CGROUP)
0ff67f990bd457 Kairui Song 2025-03-14  3833  static bool __has_usable_swap(void)
0ff67f990bd457 Kairui Song 2025-03-14  3834  {
0ff67f990bd457 Kairui Song 2025-03-14  3835  	return !plist_head_empty(&swap_active_head);
0ff67f990bd457 Kairui Song 2025-03-14 @3836  }
0ff67f990bd457 Kairui Song 2025-03-14  3837  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
