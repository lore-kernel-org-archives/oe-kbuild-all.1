Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50523218821
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 03:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764128034; cv=none; b=G1hsLBwR+Z1tDTS3GgLUT11FaANrOTyk4MGnhZ11uhaPDfF/uDgOCmGHW/9hU7l3OWjupDa0JeLrJUo4a7K0Z6ljAbkBoJ5d13JFOLiYhZBtZflSky+h4PJSAdioW+NRDn+W3CEw/jlzKB0ZL6drJpUsIPr15R16+m570JX4aj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764128034; c=relaxed/simple;
	bh=UehMYttTFUlS7MXguaf+N0VtQHpUbOgwMwSJbJjyyGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CPQU4OoTk4/14NtfnZ9uB97y9+9buRUG99BMGgnGScpc5jhtIGbc1NqPGNTzkfHI++5OmCDkgvQyms9PL+0+BJLvnHF6HQmuQbrKPxeMwnItl3TAdLONotgy49YEphTJSzIA3QV8US+NE0hwdEryKNTAU8O1QInTRLFhAH5LI74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IF8T6PCT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IF8T6PCT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764128031; x=1795664031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UehMYttTFUlS7MXguaf+N0VtQHpUbOgwMwSJbJjyyGU=;
  b=IF8T6PCT/uuEmjwdM2Eayys8YIyHcdQdn9itQ+z74FYuxCNrHcM3+9mS
   JHMPYpTiRNiQdUYG+ThUkQUAlX8dnZvgy+fklAQGhbTeTB4QRsEUKdnzs
   DuztF8Dc6ord4BV26isEOL12MNP9GhPbf6PhfCgWIipYpSq0XJKfNL4Y3
   TTcNWsUC2mrSNv3Z5wByEK4INr6sHq7Bn3kW7vQ1I4mpxnVZBgS4vC44Y
   SuRZ2K18bBADDoo8fzt2KwI8dsbpyL11rOteuDWwAltCFNQJBgpmiZEUR
   wrmE93bc0hfSJlsts2lZ6VvNWKmmRicqKsMoZFBm8ftGqn87D2esNRE2B
   A==;
X-CSE-ConnectionGUID: VrYZABtlTXK8Xr5JpvIAaQ==
X-CSE-MsgGUID: yELobuSYRcevBRJ6pRZxIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77523626"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="77523626"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 19:33:50 -0800
X-CSE-ConnectionGUID: pkyfh9ilTMuKqO0Ui92KfA==
X-CSE-MsgGUID: 3f2UXYmaTUafef8kmWwk+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="223794922"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 25 Nov 2025 19:33:48 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO6Hp-000000000cn-3rPz;
	Wed, 26 Nov 2025 03:33:45 +0000
Date: Wed, 26 Nov 2025 04:32:51 +0100
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:movable_gigantic 1/1] mm/hugetlb.c:505:30: error:
 invalid use of undefined type 'struct hugetlb_cgroup'
Message-ID: <202511260415.yLHSqEfP-lkp@intel.com>
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
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251126/202511260415.yLHSqEfP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260415.yLHSqEfP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511260415.yLHSqEfP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/hugetlb.c:497:56: warning: 'struct hugetlb_cgroup' declared inside parameter list will not be visible outside of this definition or declaration
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
>> mm/hugetlb.c:587:53: error: passing argument 1 of 'record_hugetlb_cgroup_uncharge_info' from incompatible pointer type [-Wincompatible-pointer-types]
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
>> mm/hugetlb.c:646:68: error: passing argument 6 of 'hugetlb_resv_map_add' from incompatible pointer type [-Wincompatible-pointer-types]
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
>> mm/hugetlb.c:776:52: error: passing argument 4 of 'add_reservation_in_range' from incompatible pointer type [-Wincompatible-pointer-types]
     776 |         add = add_reservation_in_range(resv, f, t, h_cg, h, NULL);
         |                                                    ^~~~
         |                                                    |
         |                                                    struct hugetlb_cgroup *
   mm/hugetlb.c:605:61: note: expected 'struct hugetlb_cgroup *' but argument is of type 'struct hugetlb_cgroup *'
     605 |                                      struct hugetlb_cgroup *h_cg,
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   mm/hugetlb.c: In function 'region_del':
>> mm/hugetlb.c:909:25: error: implicit declaration of function 'hugetlb_cgroup_uncharge_file_region' [-Wimplicit-function-declaration]
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
>> mm/hugetlb.c:1287:17: error: implicit declaration of function 'resv_map_put_hugetlb_cgroup_uncharge_info'; did you mean 'resv_map_set_hugetlb_cgroup_uncharge_info'? [-Wimplicit-function-declaration]
    1287 |                 resv_map_put_hugetlb_cgroup_uncharge_info(reservations);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 resv_map_set_hugetlb_cgroup_uncharge_info
   mm/hugetlb.c: At top level:
>> mm/hugetlb.c:1474:6: warning: no previous prototype for 'remove_hugetlb_folio' [-Wmissing-prototypes]
    1474 | void remove_hugetlb_folio(struct hstate *h, struct folio *folio,
         |      ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from mm/hugetlb.c:6:
   mm/hugetlb.c: In function 'remove_hugetlb_folio':
>> mm/hugetlb.c:1479:25: error: implicit declaration of function 'hugetlb_cgroup_from_folio'; did you mean 'get_obj_cgroup_from_folio'? [-Wimplicit-function-declaration]
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
>> mm/hugetlb.c:1480:25: error: implicit declaration of function 'hugetlb_cgroup_from_folio_rsvd'; did you mean 'get_obj_cgroup_from_folio'? [-Wimplicit-function-declaration]
    1480 |         VM_BUG_ON_FOLIO(hugetlb_cgroup_from_folio_rsvd(folio), folio);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   include/linux/mmdebug.h:120:38: note: in expansion of macro 'VM_BUG_ON'
     120 | #define VM_BUG_ON_FOLIO(cond, folio) VM_BUG_ON(cond)
         |                                      ^~~~~~~~~
   mm/hugetlb.c:1480:9: note: in expansion of macro 'VM_BUG_ON_FOLIO'
    1480 |         VM_BUG_ON_FOLIO(hugetlb_cgroup_from_folio_rsvd(folio), folio);
         |         ^~~~~~~~~~~~~~~
>> mm/hugetlb.c:1483:13: error: implicit declaration of function 'hstate_is_gigantic_no_runtime' [-Wimplicit-function-declaration]
    1483 |         if (hstate_is_gigantic_no_runtime(h))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c: At top level:
>> mm/hugetlb.c:1510:6: warning: no previous prototype for 'add_hugetlb_folio' [-Wmissing-prototypes]
    1510 | void add_hugetlb_folio(struct hstate *h, struct folio *folio,
         |      ^~~~~~~~~~~~~~~~~
   mm/hugetlb.c: In function 'free_huge_folio':
>> mm/hugetlb.c:1807:9: error: implicit declaration of function 'hugetlb_cgroup_uncharge_folio'; did you mean 'mem_cgroup_uncharge_folios'? [-Wimplicit-function-declaration]
    1807 |         hugetlb_cgroup_uncharge_folio(hstate_index(h),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         mem_cgroup_uncharge_folios
>> mm/hugetlb.c:1809:9: error: implicit declaration of function 'hugetlb_cgroup_uncharge_folio_rsvd'; did you mean 'mem_cgroup_uncharge_folios'? [-Wimplicit-function-declaration]
    1809 |         hugetlb_cgroup_uncharge_folio_rsvd(hstate_index(h),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         mem_cgroup_uncharge_folios
   mm/hugetlb.c: At top level:
>> mm/hugetlb.c:1842:6: warning: no previous prototype for 'init_new_hugetlb_folio' [-Wmissing-prototypes]
    1842 | void init_new_hugetlb_folio(struct folio *folio)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c: In function 'init_new_hugetlb_folio':
>> mm/hugetlb.c:1847:9: error: implicit declaration of function 'set_hugetlb_cgroup' [-Wimplicit-function-declaration]
    1847 |         set_hugetlb_cgroup(folio, NULL);
         |         ^~~~~~~~~~~~~~~~~~
>> mm/hugetlb.c:1848:9: error: implicit declaration of function 'set_hugetlb_cgroup_rsvd' [-Wimplicit-function-declaration]
    1848 |         set_hugetlb_cgroup_rsvd(folio, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c: At top level:
>> mm/hugetlb.c:1954:6: warning: no previous prototype for 'prep_and_add_allocated_folios' [-Wmissing-prototypes]
    1954 | void prep_and_add_allocated_folios(struct hstate *h,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c: In function 'alloc_pool_huge_folio':
>> mm/hugetlb.c:1984:9: error: implicit declaration of function 'for_each_node_mask_to_alloc'; did you mean 'for_each_node_mask'? [-Wimplicit-function-declaration]
    1984 |         for_each_node_mask_to_alloc(next_node, nr_nodes, node, nodes_allowed) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         for_each_node_mask
>> mm/hugetlb.c:1984:78: error: expected ';' before '{' token
    1984 |         for_each_node_mask_to_alloc(next_node, nr_nodes, node, nodes_allowed) {
         |                                                                              ^~
         |                                                                              ;
   mm/hugetlb.c:1981:15: warning: unused variable 'gfp_mask' [-Wunused-variable]
    1981 |         gfp_t gfp_mask = htlb_alloc_mask(h) | __GFP_THISNODE;
         |               ^~~~~~~~
   mm/hugetlb.c:1994:1: warning: no return statement in function returning non-void [-Wreturn-type]
    1994 | }
         | ^
   mm/hugetlb.c: In function 'remove_pool_hugetlb_folio':
   mm/hugetlb.c:2010:9: error: implicit declaration of function 'for_each_node_mask_to_free'; did you mean 'for_each_node_mask'? [-Wimplicit-function-declaration]
    2010 |         for_each_node_mask_to_free(h, nr_nodes, node, nodes_allowed) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         for_each_node_mask
   mm/hugetlb.c:2010:69: error: expected ';' before '{' token
    2010 |         for_each_node_mask_to_free(h, nr_nodes, node, nodes_allowed) {
         |                                                                     ^~
         |                                                                     ;
   mm/hugetlb.c:2007:23: warning: unused variable 'folio' [-Wunused-variable]
    2007 |         struct folio *folio = NULL;
         |                       ^~~~~
   mm/hugetlb.c:2025:1: warning: no return statement in function returning non-void [-Wreturn-type]
    2025 | }
         | ^
   mm/hugetlb.c: In function 'alloc_hugetlb_folio':
   mm/hugetlb.c:2953:23: error: implicit declaration of function 'hugetlb_cgroup_charge_cgroup_rsvd' [-Wimplicit-function-declaration]
    2953 |                 ret = hugetlb_cgroup_charge_cgroup_rsvd(
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c:2959:15: error: implicit declaration of function 'hugetlb_cgroup_charge_cgroup' [-Wimplicit-function-declaration]
    2959 |         ret = hugetlb_cgroup_charge_cgroup(idx, pages_per_huge_page(h), &h_cg);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c:2990:9: error: implicit declaration of function 'hugetlb_cgroup_commit_charge' [-Wimplicit-function-declaration]
    2990 |         hugetlb_cgroup_commit_charge(idx, pages_per_huge_page(h), h_cg, folio);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c:2995:17: error: implicit declaration of function 'hugetlb_cgroup_commit_charge_rsvd' [-Wimplicit-function-declaration]
    2995 |                 hugetlb_cgroup_commit_charge_rsvd(idx, pages_per_huge_page(h),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c:3047:9: error: implicit declaration of function 'hugetlb_cgroup_uncharge_cgroup'; did you mean 'copy_hugetlb_cgroup_uncharge_info'? [-Wimplicit-function-declaration]
    3047 |         hugetlb_cgroup_uncharge_cgroup(idx, pages_per_huge_page(h), h_cg);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         copy_hugetlb_cgroup_uncharge_info
   mm/hugetlb.c:3050:17: error: implicit declaration of function 'hugetlb_cgroup_uncharge_cgroup_rsvd' [-Wimplicit-function-declaration]
    3050 |                 hugetlb_cgroup_uncharge_cgroup_rsvd(idx, pages_per_huge_page(h),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c: In function '__alloc_bootmem_huge_page':
   mm/hugetlb.c:3136:60: error: expected ';' before '{' token
    3136 |                                     &hugetlb_bootmem_nodes) {
         |                                                            ^~
         |                                                            ;
   mm/hugetlb.c:3131:17: error: label 'found' used but not defined
    3131 |                 goto found;
         |                 ^~~~
   mm/hugetlb.c: In function 'adjust_pool_surplus':
   mm/hugetlb.c:3742:98: error: expected ';' before '{' token
    3742 |                 for_each_node_mask_to_alloc(&h->next_nid_to_alloc, nr_nodes, node, nodes_allowed) {
         |                                                                                                  ^~
         |                                                                                                  ;
   mm/hugetlb.c:3747:77: error: expected ';' before '{' token
    3747 |                 for_each_node_mask_to_free(h, nr_nodes, node, nodes_allowed) {
         |                                                                             ^~
         |                                                                             ;
   mm/hugetlb.c:3755:1: warning: label 'found' defined but not used [-Wunused-label]
    3755 | found:
         | ^~~~~
   mm/hugetlb.c: At top level:
   mm/hugetlb.c:4010:6: warning: no previous prototype for 'demote_pool_huge_page' [-Wmissing-prototypes]
    4010 | long demote_pool_huge_page(struct hstate *src, nodemask_t *nodes_allowed,
         |      ^~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c: In function 'demote_pool_huge_page':
   mm/hugetlb.c:4028:71: error: expected ';' before '{' token
    4028 |         for_each_node_mask_to_free(src, nr_nodes, node, nodes_allowed) {
         |                                                                       ^~
         |                                                                       ;
   mm/hugetlb.c: At top level:
   mm/hugetlb.c:4079:9: warning: no previous prototype for '__nr_hugepages_store_common' [-Wmissing-prototypes]
    4079 | ssize_t __nr_hugepages_store_common(bool obey_mempolicy,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c: In function 'hugetlb_init':
   mm/hugetlb.c:4166:9: error: implicit declaration of function 'hugetlb_sysfs_init'; did you mean 'hugetlb_count_init'? [-Wimplicit-function-declaration]
    4166 |         hugetlb_sysfs_init();
         |         ^~~~~~~~~~~~~~~~~~
         |         hugetlb_count_init
   mm/hugetlb.c:4167:9: error: implicit declaration of function 'hugetlb_cgroup_file_init'; did you mean 'hugetlb_count_init'? [-Wimplicit-function-declaration]
    4167 |         hugetlb_cgroup_file_init();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         hugetlb_count_init
   mm/hugetlb.c:4168:9: error: implicit declaration of function 'hugetlb_sysctl_init'; did you mean 'hugetlb_count_init'? [-Wimplicit-function-declaration]
    4168 |         hugetlb_sysctl_init();
         |         ^~~~~~~~~~~~~~~~~~~
         |         hugetlb_count_init
   mm/hugetlb.c: In function 'hugetlb_vm_op_open':
   mm/hugetlb.c:4687:17: error: implicit declaration of function 'resv_map_dup_hugetlb_cgroup_uncharge_info'; did you mean 'resv_map_set_hugetlb_cgroup_uncharge_info'? [-Wimplicit-function-declaration]
    4687 |                 resv_map_dup_hugetlb_cgroup_uncharge_info(resv);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 resv_map_set_hugetlb_cgroup_uncharge_info
   mm/hugetlb.c: In function 'hugetlb_vm_op_close':
   mm/hugetlb.c:4729:9: error: implicit declaration of function 'hugetlb_cgroup_uncharge_counter'; did you mean 'copy_hugetlb_cgroup_uncharge_info'? [-Wimplicit-function-declaration]
    4729 |         hugetlb_cgroup_uncharge_counter(resv, start, end);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         copy_hugetlb_cgroup_uncharge_info


vim +505 mm/hugetlb.c

075a61d07a8eca Mina Almasry  2020-04-01  495  
075a61d07a8eca Mina Almasry  2020-04-01  496  /* Helper that records hugetlb_cgroup uncharge info. */
075a61d07a8eca Mina Almasry  2020-04-01 @497  static void record_hugetlb_cgroup_uncharge_info(struct hugetlb_cgroup *h_cg,
075a61d07a8eca Mina Almasry  2020-04-01  498  						struct hstate *h,
075a61d07a8eca Mina Almasry  2020-04-01  499  						struct resv_map *resv,
075a61d07a8eca Mina Almasry  2020-04-01  500  						struct file_region *nrg)
075a61d07a8eca Mina Almasry  2020-04-01  501  {
075a61d07a8eca Mina Almasry  2020-04-01  502  #ifdef CONFIG_CGROUP_HUGETLB
075a61d07a8eca Mina Almasry  2020-04-01  503  	if (h_cg) {
075a61d07a8eca Mina Almasry  2020-04-01  504  		nrg->reservation_counter =
075a61d07a8eca Mina Almasry  2020-04-01 @505  			&h_cg->rsvd_hugepage[hstate_index(h)];
075a61d07a8eca Mina Almasry  2020-04-01  506  		nrg->css = &h_cg->css;
d85aecf2844ff0 Miaohe Lin    2021-03-24  507  		/*
d85aecf2844ff0 Miaohe Lin    2021-03-24  508  		 * The caller will hold exactly one h_cg->css reference for the
d85aecf2844ff0 Miaohe Lin    2021-03-24  509  		 * whole contiguous reservation region. But this area might be
d85aecf2844ff0 Miaohe Lin    2021-03-24  510  		 * scattered when there are already some file_regions reside in
d85aecf2844ff0 Miaohe Lin    2021-03-24  511  		 * it. As a result, many file_regions may share only one css
d85aecf2844ff0 Miaohe Lin    2021-03-24  512  		 * reference. In order to ensure that one file_region must hold
d85aecf2844ff0 Miaohe Lin    2021-03-24  513  		 * exactly one h_cg->css reference, we should do css_get for
d85aecf2844ff0 Miaohe Lin    2021-03-24  514  		 * each file_region and leave the reference held by caller
d85aecf2844ff0 Miaohe Lin    2021-03-24  515  		 * untouched.
d85aecf2844ff0 Miaohe Lin    2021-03-24  516  		 */
d85aecf2844ff0 Miaohe Lin    2021-03-24  517  		css_get(&h_cg->css);
075a61d07a8eca Mina Almasry  2020-04-01  518  		if (!resv->pages_per_hpage)
075a61d07a8eca Mina Almasry  2020-04-01  519  			resv->pages_per_hpage = pages_per_huge_page(h);
075a61d07a8eca Mina Almasry  2020-04-01  520  		/* pages_per_hpage should be the same for all entries in
075a61d07a8eca Mina Almasry  2020-04-01  521  		 * a resv_map.
075a61d07a8eca Mina Almasry  2020-04-01  522  		 */
075a61d07a8eca Mina Almasry  2020-04-01  523  		VM_BUG_ON(resv->pages_per_hpage != pages_per_huge_page(h));
075a61d07a8eca Mina Almasry  2020-04-01  524  	} else {
075a61d07a8eca Mina Almasry  2020-04-01  525  		nrg->reservation_counter = NULL;
075a61d07a8eca Mina Almasry  2020-04-01  526  		nrg->css = NULL;
075a61d07a8eca Mina Almasry  2020-04-01  527  	}
075a61d07a8eca Mina Almasry  2020-04-01  528  #endif
075a61d07a8eca Mina Almasry  2020-04-01  529  }
075a61d07a8eca Mina Almasry  2020-04-01  530  
d85aecf2844ff0 Miaohe Lin    2021-03-24  531  static void put_uncharge_info(struct file_region *rg)
d85aecf2844ff0 Miaohe Lin    2021-03-24  532  {
d85aecf2844ff0 Miaohe Lin    2021-03-24  533  #ifdef CONFIG_CGROUP_HUGETLB
d85aecf2844ff0 Miaohe Lin    2021-03-24  534  	if (rg->css)
d85aecf2844ff0 Miaohe Lin    2021-03-24  535  		css_put(rg->css);
d85aecf2844ff0 Miaohe Lin    2021-03-24  536  #endif
d85aecf2844ff0 Miaohe Lin    2021-03-24  537  }
d85aecf2844ff0 Miaohe Lin    2021-03-24  538  
a9b3f867404b35 Mina Almasry  2020-04-01  539  static bool has_same_uncharge_info(struct file_region *rg,
a9b3f867404b35 Mina Almasry  2020-04-01  540  				   struct file_region *org)
a9b3f867404b35 Mina Almasry  2020-04-01  541  {
a9b3f867404b35 Mina Almasry  2020-04-01  542  #ifdef CONFIG_CGROUP_HUGETLB
0739eb437f3d39 Baolin Wang   2021-11-05  543  	return rg->reservation_counter == org->reservation_counter &&
a9b3f867404b35 Mina Almasry  2020-04-01  544  	       rg->css == org->css;
a9b3f867404b35 Mina Almasry  2020-04-01  545  
a9b3f867404b35 Mina Almasry  2020-04-01  546  #else
a9b3f867404b35 Mina Almasry  2020-04-01  547  	return true;
a9b3f867404b35 Mina Almasry  2020-04-01  548  #endif
a9b3f867404b35 Mina Almasry  2020-04-01  549  }
a9b3f867404b35 Mina Almasry  2020-04-01  550  
a9b3f867404b35 Mina Almasry  2020-04-01  551  static void coalesce_file_region(struct resv_map *resv, struct file_region *rg)
a9b3f867404b35 Mina Almasry  2020-04-01  552  {
3259914f8cab1b XU pengfei    2022-09-14  553  	struct file_region *nrg, *prg;
a9b3f867404b35 Mina Almasry  2020-04-01  554  
a9b3f867404b35 Mina Almasry  2020-04-01  555  	prg = list_prev_entry(rg, link);
a9b3f867404b35 Mina Almasry  2020-04-01  556  	if (&prg->link != &resv->regions && prg->to == rg->from &&
a9b3f867404b35 Mina Almasry  2020-04-01  557  	    has_same_uncharge_info(prg, rg)) {
a9b3f867404b35 Mina Almasry  2020-04-01  558  		prg->to = rg->to;
a9b3f867404b35 Mina Almasry  2020-04-01  559  
a9b3f867404b35 Mina Almasry  2020-04-01  560  		list_del(&rg->link);
d85aecf2844ff0 Miaohe Lin    2021-03-24  561  		put_uncharge_info(rg);
a9b3f867404b35 Mina Almasry  2020-04-01  562  		kfree(rg);
a9b3f867404b35 Mina Almasry  2020-04-01  563  
7db5e7b67e3e8d Wei Yang      2020-10-13  564  		rg = prg;
a9b3f867404b35 Mina Almasry  2020-04-01  565  	}
a9b3f867404b35 Mina Almasry  2020-04-01  566  
a9b3f867404b35 Mina Almasry  2020-04-01  567  	nrg = list_next_entry(rg, link);
a9b3f867404b35 Mina Almasry  2020-04-01  568  	if (&nrg->link != &resv->regions && nrg->from == rg->to &&
a9b3f867404b35 Mina Almasry  2020-04-01  569  	    has_same_uncharge_info(nrg, rg)) {
a9b3f867404b35 Mina Almasry  2020-04-01  570  		nrg->from = rg->from;
a9b3f867404b35 Mina Almasry  2020-04-01  571  
a9b3f867404b35 Mina Almasry  2020-04-01  572  		list_del(&rg->link);
d85aecf2844ff0 Miaohe Lin    2021-03-24  573  		put_uncharge_info(rg);
a9b3f867404b35 Mina Almasry  2020-04-01  574  		kfree(rg);
a9b3f867404b35 Mina Almasry  2020-04-01  575  	}
a9b3f867404b35 Mina Almasry  2020-04-01  576  }
a9b3f867404b35 Mina Almasry  2020-04-01  577  
2103cf9c3f3ba0 Peter Xu      2021-03-12  578  static inline long
84448c8ecd9a13 Jakob Koschel 2022-04-28  579  hugetlb_resv_map_add(struct resv_map *map, struct list_head *rg, long from,
2103cf9c3f3ba0 Peter Xu      2021-03-12  580  		     long to, struct hstate *h, struct hugetlb_cgroup *cg,
2103cf9c3f3ba0 Peter Xu      2021-03-12  581  		     long *regions_needed)
2103cf9c3f3ba0 Peter Xu      2021-03-12  582  {
2103cf9c3f3ba0 Peter Xu      2021-03-12  583  	struct file_region *nrg;
2103cf9c3f3ba0 Peter Xu      2021-03-12  584  
2103cf9c3f3ba0 Peter Xu      2021-03-12  585  	if (!regions_needed) {
2103cf9c3f3ba0 Peter Xu      2021-03-12  586  		nrg = get_file_region_entry_from_cache(map, from, to);
2103cf9c3f3ba0 Peter Xu      2021-03-12 @587  		record_hugetlb_cgroup_uncharge_info(cg, h, map, nrg);
84448c8ecd9a13 Jakob Koschel 2022-04-28  588  		list_add(&nrg->link, rg);
2103cf9c3f3ba0 Peter Xu      2021-03-12  589  		coalesce_file_region(map, nrg);
2103cf9c3f3ba0 Peter Xu      2021-03-12  590  	} else
2103cf9c3f3ba0 Peter Xu      2021-03-12  591  		*regions_needed += 1;
2103cf9c3f3ba0 Peter Xu      2021-03-12  592  
2103cf9c3f3ba0 Peter Xu      2021-03-12  593  	return to - from;
2103cf9c3f3ba0 Peter Xu      2021-03-12  594  }
2103cf9c3f3ba0 Peter Xu      2021-03-12  595  
972a3da355c947 Wei Yang      2020-10-13  596  /*
972a3da355c947 Wei Yang      2020-10-13  597   * Must be called with resv->lock held.
972a3da355c947 Wei Yang      2020-10-13  598   *
972a3da355c947 Wei Yang      2020-10-13  599   * Calling this with regions_needed != NULL will count the number of pages
972a3da355c947 Wei Yang      2020-10-13  600   * to be added but will not modify the linked list. And regions_needed will
972a3da355c947 Wei Yang      2020-10-13  601   * indicate the number of file_regions needed in the cache to carry out to add
972a3da355c947 Wei Yang      2020-10-13  602   * the regions for this range.
d75c6af9c89ac1 Mina Almasry  2019-11-30  603   */
d75c6af9c89ac1 Mina Almasry  2019-11-30  604  static long add_reservation_in_range(struct resv_map *resv, long f, long t,
075a61d07a8eca Mina Almasry  2020-04-01  605  				     struct hugetlb_cgroup *h_cg,
972a3da355c947 Wei Yang      2020-10-13  606  				     struct hstate *h, long *regions_needed)
d75c6af9c89ac1 Mina Almasry  2019-11-30  607  {
0db9d74ed8845a Mina Almasry  2020-04-01  608  	long add = 0;
d75c6af9c89ac1 Mina Almasry  2019-11-30  609  	struct list_head *head = &resv->regions;
0db9d74ed8845a Mina Almasry  2020-04-01  610  	long last_accounted_offset = f;
84448c8ecd9a13 Jakob Koschel 2022-04-28  611  	struct file_region *iter, *trg = NULL;
84448c8ecd9a13 Jakob Koschel 2022-04-28  612  	struct list_head *rg = NULL;
d75c6af9c89ac1 Mina Almasry  2019-11-30  613  
0db9d74ed8845a Mina Almasry  2020-04-01  614  	if (regions_needed)
0db9d74ed8845a Mina Almasry  2020-04-01  615  		*regions_needed = 0;
d75c6af9c89ac1 Mina Almasry  2019-11-30  616  
0db9d74ed8845a Mina Almasry  2020-04-01  617  	/* In this loop, we essentially handle an entry for the range
84448c8ecd9a13 Jakob Koschel 2022-04-28  618  	 * [last_accounted_offset, iter->from), at every iteration, with some
0db9d74ed8845a Mina Almasry  2020-04-01  619  	 * bounds checking.
0db9d74ed8845a Mina Almasry  2020-04-01  620  	 */
84448c8ecd9a13 Jakob Koschel 2022-04-28  621  	list_for_each_entry_safe(iter, trg, head, link) {
0db9d74ed8845a Mina Almasry  2020-04-01  622  		/* Skip irrelevant regions that start before our range. */
84448c8ecd9a13 Jakob Koschel 2022-04-28  623  		if (iter->from < f) {
0db9d74ed8845a Mina Almasry  2020-04-01  624  			/* If this region ends after the last accounted offset,
0db9d74ed8845a Mina Almasry  2020-04-01  625  			 * then we need to update last_accounted_offset.
0db9d74ed8845a Mina Almasry  2020-04-01  626  			 */
84448c8ecd9a13 Jakob Koschel 2022-04-28  627  			if (iter->to > last_accounted_offset)
84448c8ecd9a13 Jakob Koschel 2022-04-28  628  				last_accounted_offset = iter->to;
0db9d74ed8845a Mina Almasry  2020-04-01  629  			continue;
0db9d74ed8845a Mina Almasry  2020-04-01  630  		}
d75c6af9c89ac1 Mina Almasry  2019-11-30  631  
0db9d74ed8845a Mina Almasry  2020-04-01  632  		/* When we find a region that starts beyond our range, we've
0db9d74ed8845a Mina Almasry  2020-04-01  633  		 * finished.
0db9d74ed8845a Mina Almasry  2020-04-01  634  		 */
84448c8ecd9a13 Jakob Koschel 2022-04-28  635  		if (iter->from >= t) {
84448c8ecd9a13 Jakob Koschel 2022-04-28  636  			rg = iter->link.prev;
d75c6af9c89ac1 Mina Almasry  2019-11-30  637  			break;
84448c8ecd9a13 Jakob Koschel 2022-04-28  638  		}
d75c6af9c89ac1 Mina Almasry  2019-11-30  639  
84448c8ecd9a13 Jakob Koschel 2022-04-28  640  		/* Add an entry for last_accounted_offset -> iter->from, and
0db9d74ed8845a Mina Almasry  2020-04-01  641  		 * update last_accounted_offset.
d75c6af9c89ac1 Mina Almasry  2019-11-30  642  		 */
84448c8ecd9a13 Jakob Koschel 2022-04-28  643  		if (iter->from > last_accounted_offset)
84448c8ecd9a13 Jakob Koschel 2022-04-28  644  			add += hugetlb_resv_map_add(resv, iter->link.prev,
2103cf9c3f3ba0 Peter Xu      2021-03-12  645  						    last_accounted_offset,
84448c8ecd9a13 Jakob Koschel 2022-04-28 @646  						    iter->from, h, h_cg,
2103cf9c3f3ba0 Peter Xu      2021-03-12  647  						    regions_needed);
d75c6af9c89ac1 Mina Almasry  2019-11-30  648  
84448c8ecd9a13 Jakob Koschel 2022-04-28  649  		last_accounted_offset = iter->to;
d75c6af9c89ac1 Mina Almasry  2019-11-30  650  	}
d75c6af9c89ac1 Mina Almasry  2019-11-30  651  
0db9d74ed8845a Mina Almasry  2020-04-01  652  	/* Handle the case where our range extends beyond
0db9d74ed8845a Mina Almasry  2020-04-01  653  	 * last_accounted_offset.
0db9d74ed8845a Mina Almasry  2020-04-01  654  	 */
84448c8ecd9a13 Jakob Koschel 2022-04-28  655  	if (!rg)
84448c8ecd9a13 Jakob Koschel 2022-04-28  656  		rg = head->prev;
2103cf9c3f3ba0 Peter Xu      2021-03-12  657  	if (last_accounted_offset < t)
2103cf9c3f3ba0 Peter Xu      2021-03-12  658  		add += hugetlb_resv_map_add(resv, rg, last_accounted_offset,
2103cf9c3f3ba0 Peter Xu      2021-03-12  659  					    t, h, h_cg, regions_needed);
d75c6af9c89ac1 Mina Almasry  2019-11-30  660  
0db9d74ed8845a Mina Almasry  2020-04-01  661  	return add;
0db9d74ed8845a Mina Almasry  2020-04-01  662  }
0db9d74ed8845a Mina Almasry  2020-04-01  663  

:::::: The code at line 505 was first introduced by commit
:::::: 075a61d07a8eca2fe980acd94105ed5d6429c55d hugetlb_cgroup: add accounting for shared mappings

:::::: TO: Mina Almasry <almasrymina@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
