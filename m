Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB32A2571C5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 13:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764162598; cv=none; b=G+81PHuwRPU7r3G4wXv2xsEXNsN09BPwO1gfeLOQYN2/hRui28sGG5cvT+/QKDCcQan9OuqVcmPUTxueHOG+VuA80mnlAIzVJLCsWmGvW1HWXWhuuyhaaqyrDhirYFgj99X49RqEAYbnPSLrXcAB5QQV3gImXWXefQ1HLzoM7mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764162598; c=relaxed/simple;
	bh=hXCxk/rSW+QLo6CyCo73jdvmfGj7rs/iSssi64vHa08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=irQszLvFnI/m+IINHJE3T2MRtHPJ+Ehi7sfWXjydDLU0bE5jo8kYHVHB6tKLOvW7G/lwyq5JgXdNbfCf0GgVBx8K8wkwXaZudP5CobmkF/xcHie04nps7yNS7Q8dkfJAybh8A29/OP9jyYxuoW7ojL9L3LmNeoABf+m6xPuJctQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B727DZ8V; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B727DZ8V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764162597; x=1795698597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hXCxk/rSW+QLo6CyCo73jdvmfGj7rs/iSssi64vHa08=;
  b=B727DZ8VweP7bn0CT4dETe/hVKbNSQ8J1FAJd83Zfy2Be1jBwFVysfWR
   0qJrbR2apxoNfsm5e44vCtxz175Fxi9v/hfiDEyB/QMx5m+X7x0eDkm00
   YvozQNz9AnCE2ieDLJoN6sm9xIuQyV5Dsz+HuYS0F7TY5JZa//VoKaUbd
   6Yn5Aj4TBtSDPIApzdit73HVWug5lWpvA9T4KX6y6sabr476xPhLo3uSy
   ++EYajNZhmsWQ6WvphijbLt78PC5RAxw9kAVtWf9KnCVlxWPvRyn3pwgO
   PooY2WopZ/DdUroyizviR+pQ2GtLyzn76H5rD6wv9zpYpa2LUYKwEh0Qt
   Q==;
X-CSE-ConnectionGUID: sf05eM5iQLGcolmfxdg3DQ==
X-CSE-MsgGUID: vnazXsXaRDqD+jzNTxk9wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76883865"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="76883865"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 05:09:54 -0800
X-CSE-ConnectionGUID: cZdwBFsiRY6Znmf0HO3Fng==
X-CSE-MsgGUID: HijVNkkdQCWMBfILrRLTqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="193171798"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Nov 2025 05:09:54 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOFHL-000000002t0-2Psf;
	Wed, 26 Nov 2025 13:09:51 +0000
Date: Wed, 26 Nov 2025 21:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:movable_gigantic 1/1] mm/hugetlb.c:505:30: error:
 invalid use of undefined type 'struct hugetlb_cgroup'
Message-ID: <202511262101.2MvDnJCF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux movable_gigantic
head:   ba138827f6a776a1b329ebd87f3510e2d45302bd
commit: ba138827f6a776a1b329ebd87f3510e2d45302bd [1/1] mm, hugetlb: implement movable_gigantic_pages sysctl
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251126/202511262101.2MvDnJCF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511262101.2MvDnJCF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511262101.2MvDnJCF-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/hugetlb.c:497:56: warning: 'struct hugetlb_cgroup' declared inside parameter list will not be visible outside of this definition or declaration
     497 | static void record_hugetlb_cgroup_uncharge_info(struct hugetlb_cgroup *h_cg,
         |                                                        ^~~~~~~~~~~~~~
   mm/hugetlb.c: In function 'record_hugetlb_cgroup_uncharge_info':
>> mm/hugetlb.c:505:30: error: invalid use of undefined type 'struct hugetlb_cgroup'
     505 |                         &h_cg->rsvd_hugepage[hstate_index(h)];
         |                              ^~
   mm/hugetlb.c:506:33: error: invalid use of undefined type 'struct hugetlb_cgroup'
     506 |                 nrg->css = &h_cg->css;
         |                                 ^~
   mm/hugetlb.c:517:30: error: invalid use of undefined type 'struct hugetlb_cgroup'
     517 |                 css_get(&h_cg->css);
         |                              ^~
   mm/hugetlb.c: At top level:
   mm/hugetlb.c:580:56: warning: 'struct hugetlb_cgroup' declared inside parameter list will not be visible outside of this definition or declaration
     580 |                      long to, struct hstate *h, struct hugetlb_cgroup *cg,
         |                                                        ^~~~~~~~~~~~~~
   mm/hugetlb.c: In function 'hugetlb_resv_map_add':
   mm/hugetlb.c:587:53: error: passing argument 1 of 'record_hugetlb_cgroup_uncharge_info' from incompatible pointer type [-Wincompatible-pointer-types]
     587 |                 record_hugetlb_cgroup_uncharge_info(cg, h, map, nrg);
         |                                                     ^~
         |                                                     |
         |                                                     struct hugetlb_cgroup *
   mm/hugetlb.c:497:72: note: expected 'struct hugetlb_cgroup *' but argument is of type 'struct hugetlb_cgroup *'
     497 | static void record_hugetlb_cgroup_uncharge_info(struct hugetlb_cgroup *h_cg,
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   mm/hugetlb.c: At top level:
   mm/hugetlb.c:605:45: warning: 'struct hugetlb_cgroup' declared inside parameter list will not be visible outside of this definition or declaration
     605 |                                      struct hugetlb_cgroup *h_cg,
         |                                             ^~~~~~~~~~~~~~
   mm/hugetlb.c: In function 'add_reservation_in_range':
   mm/hugetlb.c:646:68: error: passing argument 6 of 'hugetlb_resv_map_add' from incompatible pointer type [-Wincompatible-pointer-types]
     646 |                                                     iter->from, h, h_cg,
         |                                                                    ^~~~
         |                                                                    |
         |                                                                    struct hugetlb_cgroup *
   mm/hugetlb.c:580:72: note: expected 'struct hugetlb_cgroup *' but argument is of type 'struct hugetlb_cgroup *'
     580 |                      long to, struct hstate *h, struct hugetlb_cgroup *cg,
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~^~
   mm/hugetlb.c:659:51: error: passing argument 6 of 'hugetlb_resv_map_add' from incompatible pointer type [-Wincompatible-pointer-types]
     659 |                                             t, h, h_cg, regions_needed);
         |                                                   ^~~~
         |                                                   |
         |                                                   struct hugetlb_cgroup *
   mm/hugetlb.c:580:72: note: expected 'struct hugetlb_cgroup *' but argument is of type 'struct hugetlb_cgroup *'
     580 |                      long to, struct hstate *h, struct hugetlb_cgroup *cg,
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~^~
   mm/hugetlb.c: At top level:
   mm/hugetlb.c:739:31: warning: 'struct hugetlb_cgroup' declared inside parameter list will not be visible outside of this definition or declaration
     739 |                        struct hugetlb_cgroup *h_cg)
         |                               ^~~~~~~~~~~~~~
   mm/hugetlb.c: In function 'region_add':
   mm/hugetlb.c:776:52: error: passing argument 4 of 'add_reservation_in_range' from incompatible pointer type [-Wincompatible-pointer-types]
     776 |         add = add_reservation_in_range(resv, f, t, h_cg, h, NULL);
         |                                                    ^~~~
         |                                                    |
         |                                                    struct hugetlb_cgroup *
   mm/hugetlb.c:605:61: note: expected 'struct hugetlb_cgroup *' but argument is of type 'struct hugetlb_cgroup *'
     605 |                                      struct hugetlb_cgroup *h_cg,
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   mm/hugetlb.c: In function 'region_del':
   mm/hugetlb.c:909:25: error: implicit declaration of function 'hugetlb_cgroup_uncharge_file_region' [-Wimplicit-function-declaration]
     909 |                         hugetlb_cgroup_uncharge_file_region(
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c: At top level:
   mm/hugetlb.c:1097:50: warning: 'struct hugetlb_cgroup' declared inside parameter list will not be visible outside of this definition or declaration
    1097 |                                           struct hugetlb_cgroup *h_cg,
         |                                                  ^~~~~~~~~~~~~~
   mm/hugetlb.c: In function 'resv_map_set_hugetlb_cgroup_uncharge_info':
   mm/hugetlb.c:1107:30: error: invalid use of undefined type 'struct hugetlb_cgroup'
    1107 |                         &h_cg->rsvd_hugepage[hstate_index(h)];
         |                              ^~
   mm/hugetlb.c:1109:38: error: invalid use of undefined type 'struct hugetlb_cgroup'
    1109 |                 resv_map->css = &h_cg->css;
         |                                      ^~
   mm/hugetlb.c: In function 'clear_vma_resv_huge_pages':
   mm/hugetlb.c:1287:17: error: implicit declaration of function 'resv_map_put_hugetlb_cgroup_uncharge_info'; did you mean 'resv_map_set_hugetlb_cgroup_uncharge_info'? [-Wimplicit-function-declaration]
    1287 |                 resv_map_put_hugetlb_cgroup_uncharge_info(reservations);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 resv_map_set_hugetlb_cgroup_uncharge_info
   mm/hugetlb.c: At top level:
   mm/hugetlb.c:1474:6: warning: no previous prototype for 'remove_hugetlb_folio' [-Wmissing-prototypes]
    1474 | void remove_hugetlb_folio(struct hstate *h, struct folio *folio,
         |      ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from mm/hugetlb.c:6:
   mm/hugetlb.c: In function 'remove_hugetlb_folio':
   mm/hugetlb.c:1479:25: error: implicit declaration of function 'hugetlb_cgroup_from_folio'; did you mean 'get_obj_cgroup_from_folio'? [-Wimplicit-function-declaration]
    1479 |         VM_BUG_ON_FOLIO(hugetlb_cgroup_from_folio(folio), folio);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   include/linux/mmdebug.h:120:38: note: in expansion of macro 'VM_BUG_ON'
     120 | #define VM_BUG_ON_FOLIO(cond, folio) VM_BUG_ON(cond)
         |                                      ^~~~~~~~~
   mm/hugetlb.c:1479:9: note: in expansion of macro 'VM_BUG_ON_FOLIO'
    1479 |         VM_BUG_ON_FOLIO(hugetlb_cgroup_from_folio(folio), folio);
         |         ^~~~~~~~~~~~~~~
   mm/hugetlb.c:1480:25: error: implicit declaration of function 'hugetlb_cgroup_from_folio_rsvd'; did you mean 'get_obj_cgroup_from_folio'? [-Wimplicit-function-declaration]
    1480 |         VM_BUG_ON_FOLIO(hugetlb_cgroup_from_folio_rsvd(folio), folio);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))


vim +505 mm/hugetlb.c

075a61d07a8eca Mina Almasry 2020-04-01  495  
075a61d07a8eca Mina Almasry 2020-04-01  496  /* Helper that records hugetlb_cgroup uncharge info. */
075a61d07a8eca Mina Almasry 2020-04-01  497  static void record_hugetlb_cgroup_uncharge_info(struct hugetlb_cgroup *h_cg,
075a61d07a8eca Mina Almasry 2020-04-01  498  						struct hstate *h,
075a61d07a8eca Mina Almasry 2020-04-01  499  						struct resv_map *resv,
075a61d07a8eca Mina Almasry 2020-04-01  500  						struct file_region *nrg)
075a61d07a8eca Mina Almasry 2020-04-01  501  {
075a61d07a8eca Mina Almasry 2020-04-01  502  #ifdef CONFIG_CGROUP_HUGETLB
075a61d07a8eca Mina Almasry 2020-04-01  503  	if (h_cg) {
075a61d07a8eca Mina Almasry 2020-04-01  504  		nrg->reservation_counter =
075a61d07a8eca Mina Almasry 2020-04-01 @505  			&h_cg->rsvd_hugepage[hstate_index(h)];
075a61d07a8eca Mina Almasry 2020-04-01  506  		nrg->css = &h_cg->css;
d85aecf2844ff0 Miaohe Lin   2021-03-24  507  		/*
d85aecf2844ff0 Miaohe Lin   2021-03-24  508  		 * The caller will hold exactly one h_cg->css reference for the
d85aecf2844ff0 Miaohe Lin   2021-03-24  509  		 * whole contiguous reservation region. But this area might be
d85aecf2844ff0 Miaohe Lin   2021-03-24  510  		 * scattered when there are already some file_regions reside in
d85aecf2844ff0 Miaohe Lin   2021-03-24  511  		 * it. As a result, many file_regions may share only one css
d85aecf2844ff0 Miaohe Lin   2021-03-24  512  		 * reference. In order to ensure that one file_region must hold
d85aecf2844ff0 Miaohe Lin   2021-03-24  513  		 * exactly one h_cg->css reference, we should do css_get for
d85aecf2844ff0 Miaohe Lin   2021-03-24  514  		 * each file_region and leave the reference held by caller
d85aecf2844ff0 Miaohe Lin   2021-03-24  515  		 * untouched.
d85aecf2844ff0 Miaohe Lin   2021-03-24  516  		 */
d85aecf2844ff0 Miaohe Lin   2021-03-24  517  		css_get(&h_cg->css);
075a61d07a8eca Mina Almasry 2020-04-01  518  		if (!resv->pages_per_hpage)
075a61d07a8eca Mina Almasry 2020-04-01  519  			resv->pages_per_hpage = pages_per_huge_page(h);
075a61d07a8eca Mina Almasry 2020-04-01  520  		/* pages_per_hpage should be the same for all entries in
075a61d07a8eca Mina Almasry 2020-04-01  521  		 * a resv_map.
075a61d07a8eca Mina Almasry 2020-04-01  522  		 */
075a61d07a8eca Mina Almasry 2020-04-01  523  		VM_BUG_ON(resv->pages_per_hpage != pages_per_huge_page(h));
075a61d07a8eca Mina Almasry 2020-04-01  524  	} else {
075a61d07a8eca Mina Almasry 2020-04-01  525  		nrg->reservation_counter = NULL;
075a61d07a8eca Mina Almasry 2020-04-01  526  		nrg->css = NULL;
075a61d07a8eca Mina Almasry 2020-04-01  527  	}
075a61d07a8eca Mina Almasry 2020-04-01  528  #endif
075a61d07a8eca Mina Almasry 2020-04-01  529  }
075a61d07a8eca Mina Almasry 2020-04-01  530  

:::::: The code at line 505 was first introduced by commit
:::::: 075a61d07a8eca2fe980acd94105ed5d6429c55d hugetlb_cgroup: add accounting for shared mappings

:::::: TO: Mina Almasry <almasrymina@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
