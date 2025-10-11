Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45957524D1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 20:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760215539; cv=none; b=KMMCq3gHTVTxJrlupWV3SAjv+e2uiKl5g5LZ1W8uw98FSwloXPu+UrIKXNbIxSO9dKxle9ZhofTV2Sml8EwB1IrLa3C/n2+bSwtiDYwcy/Coq9R49uIo7g9wajoXiIM+lidjkocZj2XQDeiT+DJfFEOfpmYpCdmeTkTn82qE4bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760215539; c=relaxed/simple;
	bh=+EZDHLX+jXHaVPDuh39qXsqEU1NcxfapBxnx8UnMJQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kpjLz1Y18MGXxiJdKZtQdKTRwPNUdMWS/Hig2KKQ+cHkq2Or9hFmxXiNDKHw+w2m3UVBsVA3y1etuOvkrioTr9cbR0tAkqDVNUMvpLU+Gc5VD5vvT9C3NFPAs/P59FxksZZv2lQilTe2Dq203mU/CizHzGvLYhcqG5lHwRpcQOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6XFVJms; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6XFVJms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760215536; x=1791751536;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+EZDHLX+jXHaVPDuh39qXsqEU1NcxfapBxnx8UnMJQI=;
  b=B6XFVJmsDxnJCe0iPrjNkQ9zTJHbi4cHaaSFvXeQuYD4UtVxyzqt8A4o
   aRd6U4zNj36h1w6i204cqftBhVUSwdhESTk+UntLTQvZAwpLmtT7ktfoF
   OHraTwqkihmvpjoxZUaK6TPWlUhQSGdep6GL8aathCSp5VpnqhhN7ynpv
   hGz6DI/+d8swiLRu0pPkD8urrCQJ/YMDlfgYy5BCc7HtEzjk88GgyweZX
   Tx6hXhuJ19nOjAEn15tq3Ig1H9s1//ekW1kSxaxQcguQllnay0UVI7hm6
   4bGdf0F3cDC4M1Od3ryADaLK0RHby+OYVGUn9X2Vfh7RRmLaAex9h8/J/
   A==;
X-CSE-ConnectionGUID: IJ4Riwt8RcqczfjkP+kyrg==
X-CSE-MsgGUID: VbLbDlkeS1GnXhAJ4SFH0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="73011064"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="73011064"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 13:45:35 -0700
X-CSE-ConnectionGUID: l3RXPPrnQH2puA+IW1Seog==
X-CSE-MsgGUID: TTsSoK8gRDSRzaKMrBoMfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="181668638"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Oct 2025 13:45:32 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7gT4-0003z5-1b;
	Sat, 11 Oct 2025 20:45:30 +0000
Date: Sun, 12 Oct 2025 04:45:07 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	chrisl@kernel.org, kasong@tencent.com, youngjun.park@lge.com,
	baohua@kernel.org, shikemeng@huaweicloud.com, nphamcs@gmail.com,
	Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v4 mm-new 1/2] mm/swap: do not choose swap device
 according to numa node
Message-ID: <202510120456.vTSygUXV-lkp@intel.com>
References: <20251011081624.224202-2-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011081624.224202-2-bhe@redhat.com>

Hi Baoquan,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/mm-swap-do-not-choose-swap-device-according-to-numa-node/20251011-161743
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251011081624.224202-2-bhe%40redhat.com
patch subject: [PATCH v4 mm-new 1/2] mm/swap: do not choose swap device according to numa node
config: i386-buildonly-randconfig-003-20251012 (https://download.01.org/0day-ci/archive/20251012/202510120456.vTSygUXV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510120456.vTSygUXV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510120456.vTSygUXV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/list.h:5,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from mm/swapfile.c:9:
   mm/swapfile.c: In function 'swap_sync_discard':
>> mm/swapfile.c:1395:46: error: 'swap_avail_heads' undeclared (first use in this function); did you mean 'swap_avail_head'?
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |                                              ^~~~~~~~~~~~~~~~
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   include/linux/plist.h:197:9: note: in expansion of macro 'list_for_each_entry_safe'
     197 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1395:9: note: in expansion of macro 'plist_for_each_entry_safe'
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1395:46: note: each undeclared identifier is reported only once for each function it appears in
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |                                              ^~~~~~~~~~~~~~~~
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   include/linux/plist.h:197:9: note: in expansion of macro 'list_for_each_entry_safe'
     197 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1395:9: note: in expansion of macro 'plist_for_each_entry_safe'
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:103,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5:
>> mm/swapfile.c:1395:69: error: 'struct swap_info_struct' has no member named 'avail_lists'; did you mean 'avail_list'?
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |                                                                     ^~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   include/linux/plist.h:197:9: note: in expansion of macro 'list_for_each_entry_safe'
     197 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1395:9: note: in expansion of macro 'plist_for_each_entry_safe'
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:530:27: error: expression in static assertion is not an integer
     530 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   include/linux/plist.h:197:9: note: in expansion of macro 'list_for_each_entry_safe'
     197 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1395:9: note: in expansion of macro 'plist_for_each_entry_safe'
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/blkdev.h:8:
>> mm/swapfile.c:1395:69: error: 'struct swap_info_struct' has no member named 'avail_lists'; did you mean 'avail_list'?
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |                                                                     ^~~~~~~~~~~
   include/linux/stddef.h:16:58: note: in definition of macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                                          ^~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   include/linux/plist.h:197:9: note: in expansion of macro 'list_for_each_entry_safe'
     197 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1395:9: note: in expansion of macro 'plist_for_each_entry_safe'
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/swapfile.c:1395:69: error: 'struct swap_info_struct' has no member named 'avail_lists'; did you mean 'avail_list'?
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |                                                                     ^~~~~~~~~~~
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   include/linux/plist.h:197:9: note: in expansion of macro 'list_for_each_entry_safe'
     197 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1395:9: note: in expansion of macro 'plist_for_each_entry_safe'
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/swapfile.c:1395:69: error: 'struct swap_info_struct' has no member named 'avail_lists'; did you mean 'avail_list'?
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |                                                                     ^~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   include/linux/plist.h:197:9: note: in expansion of macro 'list_for_each_entry_safe'
     197 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1395:9: note: in expansion of macro 'plist_for_each_entry_safe'
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/swapfile.c:1395:69: error: 'struct swap_info_struct' has no member named 'avail_lists'; did you mean 'avail_list'?
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |                                                                     ^~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   include/linux/plist.h:197:9: note: in expansion of macro 'list_for_each_entry_safe'
     197 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1395:9: note: in expansion of macro 'plist_for_each_entry_safe'
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/swapfile.c:1395:69: error: 'struct swap_info_struct' has no member named 'avail_lists'; did you mean 'avail_list'?
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |                                                                     ^~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   include/linux/plist.h:197:9: note: in expansion of macro 'list_for_each_entry_safe'
     197 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1395:9: note: in expansion of macro 'plist_for_each_entry_safe'
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:530:27: error: expression in static assertion is not an integer
     530 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   include/linux/plist.h:197:9: note: in expansion of macro 'list_for_each_entry_safe'
     197 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1395:9: note: in expansion of macro 'plist_for_each_entry_safe'
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/swapfile.c:1395:69: error: 'struct swap_info_struct' has no member named 'avail_lists'; did you mean 'avail_list'?
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |                                                                     ^~~~~~~~~~~
   include/linux/stddef.h:16:58: note: in definition of macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                                          ^~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   include/linux/plist.h:197:9: note: in expansion of macro 'list_for_each_entry_safe'
     197 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1395:9: note: in expansion of macro 'plist_for_each_entry_safe'
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:869:64: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                                                ^
   include/linux/plist.h:197:9: note: in expansion of macro 'list_for_each_entry_safe'
     197 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1395:9: note: in expansion of macro 'plist_for_each_entry_safe'
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/swapfile.c:1395:69: error: 'struct swap_info_struct' has no member named 'avail_lists'; did you mean 'avail_list'?
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |                                                                     ^~~~~~~~~~~
   include/linux/list.h:773:28: note: in definition of macro 'list_entry_is_head'
     773 |         list_is_head(&pos->member, (head))
         |                            ^~~~~~
   include/linux/plist.h:197:9: note: in expansion of macro 'list_for_each_entry_safe'
     197 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1395:9: note: in expansion of macro 'plist_for_each_entry_safe'
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/swapfile.c:1395:69: error: 'struct swap_info_struct' has no member named 'avail_lists'; did you mean 'avail_list'?
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |                                                                     ^~~~~~~~~~~
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   include/linux/plist.h:197:9: note: in expansion of macro 'list_for_each_entry_safe'
     197 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1395:9: note: in expansion of macro 'plist_for_each_entry_safe'
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/swapfile.c:1395:69: error: 'struct swap_info_struct' has no member named 'avail_lists'; did you mean 'avail_list'?
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |                                                                     ^~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   include/linux/plist.h:197:9: note: in expansion of macro 'list_for_each_entry_safe'
     197 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1395:9: note: in expansion of macro 'plist_for_each_entry_safe'
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/swapfile.c:1395:69: error: 'struct swap_info_struct' has no member named 'avail_lists'; did you mean 'avail_list'?
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |                                                                     ^~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   include/linux/plist.h:197:9: note: in expansion of macro 'list_for_each_entry_safe'
     197 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1395:9: note: in expansion of macro 'plist_for_each_entry_safe'
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/swapfile.c:1395:69: error: 'struct swap_info_struct' has no member named 'avail_lists'; did you mean 'avail_list'?
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |                                                                     ^~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   include/linux/plist.h:197:9: note: in expansion of macro 'list_for_each_entry_safe'
     197 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1395:9: note: in expansion of macro 'plist_for_each_entry_safe'
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:530:27: error: expression in static assertion is not an integer
     530 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   include/linux/plist.h:197:9: note: in expansion of macro 'list_for_each_entry_safe'
     197 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1395:9: note: in expansion of macro 'plist_for_each_entry_safe'
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/swapfile.c:1395:69: error: 'struct swap_info_struct' has no member named 'avail_lists'; did you mean 'avail_list'?
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |                                                                     ^~~~~~~~~~~
   include/linux/stddef.h:16:58: note: in definition of macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                                          ^~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   include/linux/plist.h:197:9: note: in expansion of macro 'list_for_each_entry_safe'
     197 |         list_for_each_entry_safe(pos, n, &(head)->node_list, m.node_list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1395:9: note: in expansion of macro 'plist_for_each_entry_safe'
    1395 |         plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/swapfile.c:1391:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1391 |         int nid = numa_node_id();
         |             ^~~
   mm/swapfile.c: In function '__do_sys_swapoff':
   mm/swapfile.c:2893:21: warning: unused variable 'nid' [-Wunused-variable]
    2893 |                 int nid;
         |                     ^~~


vim +1395 mm/swapfile.c

b487a2da3575b6 Kairui Song 2025-03-14  1383  
74cdc690138b65 Kairui Song 2025-10-07  1384  /*
74cdc690138b65 Kairui Song 2025-10-07  1385   * Discard pending clusters in a synchronized way when under high pressure.
74cdc690138b65 Kairui Song 2025-10-07  1386   * Return: true if any cluster is discarded.
74cdc690138b65 Kairui Song 2025-10-07  1387   */
74cdc690138b65 Kairui Song 2025-10-07  1388  static bool swap_sync_discard(void)
74cdc690138b65 Kairui Song 2025-10-07  1389  {
74cdc690138b65 Kairui Song 2025-10-07  1390  	bool ret = false;
74cdc690138b65 Kairui Song 2025-10-07 @1391  	int nid = numa_node_id();
74cdc690138b65 Kairui Song 2025-10-07  1392  	struct swap_info_struct *si, *next;
74cdc690138b65 Kairui Song 2025-10-07  1393  
74cdc690138b65 Kairui Song 2025-10-07  1394  	spin_lock(&swap_avail_lock);
74cdc690138b65 Kairui Song 2025-10-07 @1395  	plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
74cdc690138b65 Kairui Song 2025-10-07  1396  		spin_unlock(&swap_avail_lock);
74cdc690138b65 Kairui Song 2025-10-07  1397  		if (get_swap_device_info(si)) {
74cdc690138b65 Kairui Song 2025-10-07  1398  			if (si->flags & SWP_PAGE_DISCARD)
74cdc690138b65 Kairui Song 2025-10-07  1399  				ret = swap_do_scheduled_discard(si);
74cdc690138b65 Kairui Song 2025-10-07  1400  			put_swap_device(si);
74cdc690138b65 Kairui Song 2025-10-07  1401  		}
74cdc690138b65 Kairui Song 2025-10-07  1402  		if (ret)
74cdc690138b65 Kairui Song 2025-10-07  1403  			break;
74cdc690138b65 Kairui Song 2025-10-07  1404  		spin_lock(&swap_avail_lock);
74cdc690138b65 Kairui Song 2025-10-07  1405  	}
74cdc690138b65 Kairui Song 2025-10-07  1406  	spin_unlock(&swap_avail_lock);
74cdc690138b65 Kairui Song 2025-10-07  1407  
74cdc690138b65 Kairui Song 2025-10-07  1408  	return ret;
74cdc690138b65 Kairui Song 2025-10-07  1409  }
74cdc690138b65 Kairui Song 2025-10-07  1410  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
