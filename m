Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C163328F1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 18:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766426852; cv=none; b=Rw9qaV6aw030M/IJZn92A2tp39EU6A67WU1p7GlPHcXxzvvNB9AT4IFzZmsds8yvaSO7sv2eHvApvGYDJDwtvvrfbTLxXRcvOqJQ8ZHE5fwr+x7Ah42gMi9wnFOvBawyo0wiZTgr9qlYud8QJ29bBa4Kq8HGzVzZUifTbxLA190=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766426852; c=relaxed/simple;
	bh=Tad8xJomDjr9PzEesm/2YjnYnTB/6EmDoZ5Vc12UDP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFE8uItc8dLriu/WmKN/LyjA2VlW5P5Q7X/Csl3A+mgc50KODsNXk8j0oVeTQGLv58pi+RzqUYrLKabI4ayyaQWYFMd2/kEdijL+akvfMQeqV6RresZzu0XltVN7ZvXthYmC92m1Ggfj76/GO2bdSmuSuiCIvZGl4WaMlqvmwqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eLalgujU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLalgujU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766426851; x=1797962851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tad8xJomDjr9PzEesm/2YjnYnTB/6EmDoZ5Vc12UDP4=;
  b=eLalgujUmcZxrH+OiTyjL30ueeSuv2++AjJ5Bsf/fnuPEHZZh5CDTjG2
   hf/llF1ZRizY9SkubOWfL0m7EwVHhN/PyfFVY5nnWXjT0lWGKGiXhe3yo
   vPiAWASYQDLhd8o4lW+uXiHammztWB76c+f0ZQfVTP3syHTYHukK3D/Bz
   pVGx12JLCon1/GXIx/Kb9wR7u9ltuObPl0vJ8yBV1eJDR+JSMzyWEeXT0
   iMLj/VGSWpsvUdobBVtdLEQ4K9DKDjDJtt2FLsXW939SyBlJRx1VvOqXa
   zyW9DCY6IvKtzWjhWVAeCpiqN1egXcZZ8fSbcsP97w6mXYmBo9eqsih3g
   A==;
X-CSE-ConnectionGUID: JeKuE/4+TUewj/YBI2xLWA==
X-CSE-MsgGUID: nOEdg9lvR9WiHr7IN2WSWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79738455"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="79738455"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 10:07:30 -0800
X-CSE-ConnectionGUID: +K4DxN1TTe6UKd3K7oRbqw==
X-CSE-MsgGUID: RMyYK3frQay9Dy25TbH2tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="199494213"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Dec 2025 10:07:28 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXkJa-000000000xd-1EwS;
	Mon, 22 Dec 2025 18:07:26 +0000
Date: Tue, 23 Dec 2025 02:07:07 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4] mm, hugetlb: implement movable_gigantic_pages sysctl
Message-ID: <202512230203.paEsVKn0-lkp@intel.com>
References: <20251218151211.1237411-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218151211.1237411-1-gourry@gourry.net>

Hi Gregory,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-hugetlb-implement-movable_gigantic_pages-sysctl/20251218-231524
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251218151211.1237411-1-gourry%40gourry.net
patch subject: [PATCH v4] mm, hugetlb: implement movable_gigantic_pages sysctl
config: x86_64-randconfig-101-20251222 (https://download.01.org/0day-ci/archive/20251223/202512230203.paEsVKn0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230203.paEsVKn0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230203.paEsVKn0-lkp@intel.com/

All errors (new ones prefixed by >>):

         |         mem_cgroup_uncharge_folios
   mm/hugetlb.c: At top level:
   mm/hugetlb.c:1842:6: warning: no previous prototype for 'init_new_hugetlb_folio' [-Wmissing-prototypes]
    1842 | void init_new_hugetlb_folio(struct folio *folio)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c: In function 'init_new_hugetlb_folio':
   mm/hugetlb.c:1847:9: error: implicit declaration of function 'set_hugetlb_cgroup' [-Wimplicit-function-declaration]
    1847 |         set_hugetlb_cgroup(folio, NULL);
         |         ^~~~~~~~~~~~~~~~~~
   mm/hugetlb.c:1848:9: error: implicit declaration of function 'set_hugetlb_cgroup_rsvd' [-Wimplicit-function-declaration]
    1848 |         set_hugetlb_cgroup_rsvd(folio, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c: At top level:
   mm/hugetlb.c:1954:6: warning: no previous prototype for 'prep_and_add_allocated_folios' [-Wmissing-prototypes]
    1954 | void prep_and_add_allocated_folios(struct hstate *h,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c: In function 'alloc_pool_huge_folio':
   mm/hugetlb.c:1984:9: error: implicit declaration of function 'for_each_node_mask_to_alloc'; did you mean 'for_each_node_mask'? [-Wimplicit-function-declaration]
    1984 |         for_each_node_mask_to_alloc(next_node, nr_nodes, node, nodes_allowed) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         for_each_node_mask
   mm/hugetlb.c:1984:78: error: expected ';' before '{' token
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
>> mm/hugetlb.c:4166:9: error: implicit declaration of function 'hugetlb_sysfs_init'; did you mean 'hugetlb_count_init'? [-Wimplicit-function-declaration]
    4166 |         hugetlb_sysfs_init();
         |         ^~~~~~~~~~~~~~~~~~
         |         hugetlb_count_init
>> mm/hugetlb.c:4167:9: error: implicit declaration of function 'hugetlb_cgroup_file_init'; did you mean 'hugetlb_count_init'? [-Wimplicit-function-declaration]
    4167 |         hugetlb_cgroup_file_init();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         hugetlb_count_init
>> mm/hugetlb.c:4168:9: error: implicit declaration of function 'hugetlb_sysctl_init'; did you mean 'hugetlb_count_init'? [-Wimplicit-function-declaration]
    4168 |         hugetlb_sysctl_init();
         |         ^~~~~~~~~~~~~~~~~~~
         |         hugetlb_count_init
   mm/hugetlb.c: In function 'hugetlb_vm_op_open':
>> mm/hugetlb.c:4687:17: error: implicit declaration of function 'resv_map_dup_hugetlb_cgroup_uncharge_info'; did you mean 'resv_map_set_hugetlb_cgroup_uncharge_info'? [-Wimplicit-function-declaration]
    4687 |                 resv_map_dup_hugetlb_cgroup_uncharge_info(resv);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 resv_map_set_hugetlb_cgroup_uncharge_info
   mm/hugetlb.c: In function 'hugetlb_vm_op_close':
>> mm/hugetlb.c:4729:9: error: implicit declaration of function 'hugetlb_cgroup_uncharge_counter'; did you mean 'copy_hugetlb_cgroup_uncharge_info'? [-Wimplicit-function-declaration]
    4729 |         hugetlb_cgroup_uncharge_counter(resv, start, end);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         copy_hugetlb_cgroup_uncharge_info
   mm/hugetlb.c: In function 'hugetlb_reserve_pages':
>> mm/hugetlb.c:6616:69: error: passing argument 2 of 'resv_map_set_hugetlb_cgroup_uncharge_info' from incompatible pointer type [-Wincompatible-pointer-types]
    6616 |                 resv_map_set_hugetlb_cgroup_uncharge_info(resv_map, h_cg, h);
         |                                                                     ^~~~
         |                                                                     |
         |                                                                     struct hugetlb_cgroup *
   mm/hugetlb.c:1097:66: note: expected 'struct hugetlb_cgroup *' but argument is of type 'struct hugetlb_cgroup *'
    1097 |                                           struct hugetlb_cgroup *h_cg,
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> mm/hugetlb.c:6650:73: error: passing argument 6 of 'region_add' from incompatible pointer type [-Wincompatible-pointer-types]
    6650 |                 add = region_add(resv_map, from, to, regions_needed, h, h_cg);
         |                                                                         ^~~~
         |                                                                         |
         |                                                                         struct hugetlb_cgroup *
   mm/hugetlb.c:739:47: note: expected 'struct hugetlb_cgroup *' but argument is of type 'struct hugetlb_cgroup *'
     739 |                        struct hugetlb_cgroup *h_cg)
         |                        ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> mm/hugetlb.c:6684:25: error: implicit declaration of function 'hugetlb_cgroup_put_rsvd_cgroup' [-Wimplicit-function-declaration]
    6684 |                         hugetlb_cgroup_put_rsvd_cgroup(h_cg);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c: In function 'move_hugetlb_state':
>> mm/hugetlb.c:7174:9: error: implicit declaration of function 'hugetlb_cgroup_migrate'; did you mean 'mem_cgroup_migrate'? [-Wimplicit-function-declaration]
    7174 |         hugetlb_cgroup_migrate(old_folio, new_folio);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         mem_cgroup_migrate
   mm/hugetlb.c: At top level:
   mm/hugetlb.c:3951:13: warning: 'demote_free_hugetlb_folios' defined but not used [-Wunused-function]
    3951 | static long demote_free_hugetlb_folios(struct hstate *src, struct hstate *dst,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +4166 mm/hugetlb.c

06808b0827e1cd Lee Schermerhorn       2009-12-14  4111  
a3437870160cf2 Nishanth Aravamudan    2008-07-23  4112  static int __init hugetlb_init(void)
a3437870160cf2 Nishanth Aravamudan    2008-07-23  4113  {
8382d914ebf720 Davidlohr Bueso        2014-04-03  4114  	int i;
8382d914ebf720 Davidlohr Bueso        2014-04-03  4115  
d6995da311221a Mike Kravetz           2021-02-24  4116  	BUILD_BUG_ON(sizeof_field(struct page, private) * BITS_PER_BYTE <
d6995da311221a Mike Kravetz           2021-02-24  4117  			__NR_HPAGEFLAGS);
7b4f21f5e0386d David Hildenbrand      2025-09-01  4118  	BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
d6995da311221a Mike Kravetz           2021-02-24  4119  
c2833a5bf75b36 Mike Kravetz           2020-06-03  4120  	if (!hugepages_supported()) {
c2833a5bf75b36 Mike Kravetz           2020-06-03  4121  		if (hugetlb_max_hstate || default_hstate_max_huge_pages)
c2833a5bf75b36 Mike Kravetz           2020-06-03  4122  			pr_warn("HugeTLB: huge pages not supported, ignoring associated command-line parameters\n");
0ef89d25d3e390 Benjamin Herrenschmidt 2008-07-31  4123  		return 0;
d715cf804a0318 Liam R. Howlett        2017-07-10  4124  	}
d715cf804a0318 Liam R. Howlett        2017-07-10  4125  
282f4214384ee2 Mike Kravetz           2020-06-03  4126  	/*
282f4214384ee2 Mike Kravetz           2020-06-03  4127  	 * Make sure HPAGE_SIZE (HUGETLB_PAGE_ORDER) hstate exists.  Some
282f4214384ee2 Mike Kravetz           2020-06-03  4128  	 * architectures depend on setup being done here.
282f4214384ee2 Mike Kravetz           2020-06-03  4129  	 */
a3437870160cf2 Nishanth Aravamudan    2008-07-23  4130  	hugetlb_add_hstate(HUGETLB_PAGE_ORDER);
282f4214384ee2 Mike Kravetz           2020-06-03  4131  	if (!parsed_default_hugepagesz) {
282f4214384ee2 Mike Kravetz           2020-06-03  4132  		/*
282f4214384ee2 Mike Kravetz           2020-06-03  4133  		 * If we did not parse a default huge page size, set
282f4214384ee2 Mike Kravetz           2020-06-03  4134  		 * default_hstate_idx to HPAGE_SIZE hstate. And, if the
282f4214384ee2 Mike Kravetz           2020-06-03  4135  		 * number of huge pages for this default size was implicitly
282f4214384ee2 Mike Kravetz           2020-06-03  4136  		 * specified, set that here as well.
282f4214384ee2 Mike Kravetz           2020-06-03  4137  		 * Note that the implicit setting will overwrite an explicit
282f4214384ee2 Mike Kravetz           2020-06-03  4138  		 * setting.  A warning will be printed in this case.
282f4214384ee2 Mike Kravetz           2020-06-03  4139  		 */
282f4214384ee2 Mike Kravetz           2020-06-03  4140  		default_hstate_idx = hstate_index(size_to_hstate(HPAGE_SIZE));
f8b74815a452ff Vaishali Thakkar       2016-02-17  4141  		if (default_hstate_max_huge_pages) {
282f4214384ee2 Mike Kravetz           2020-06-03  4142  			if (default_hstate.max_huge_pages) {
282f4214384ee2 Mike Kravetz           2020-06-03  4143  				char buf[32];
282f4214384ee2 Mike Kravetz           2020-06-03  4144  
282f4214384ee2 Mike Kravetz           2020-06-03  4145  				string_get_size(huge_page_size(&default_hstate),
282f4214384ee2 Mike Kravetz           2020-06-03  4146  					1, STRING_UNITS_2, buf, 32);
282f4214384ee2 Mike Kravetz           2020-06-03  4147  				pr_warn("HugeTLB: Ignoring hugepages=%lu associated with %s page size\n",
282f4214384ee2 Mike Kravetz           2020-06-03  4148  					default_hstate.max_huge_pages, buf);
282f4214384ee2 Mike Kravetz           2020-06-03  4149  				pr_warn("HugeTLB: Using hugepages=%lu for number of default huge pages\n",
282f4214384ee2 Mike Kravetz           2020-06-03  4150  					default_hstate_max_huge_pages);
282f4214384ee2 Mike Kravetz           2020-06-03  4151  			}
282f4214384ee2 Mike Kravetz           2020-06-03  4152  			default_hstate.max_huge_pages =
282f4214384ee2 Mike Kravetz           2020-06-03  4153  				default_hstate_max_huge_pages;
b5389086ad7be0 Zhenguo Yao            2021-11-05  4154  
0a7a0f6f7f3679 Peng Liu               2022-04-29  4155  			for_each_online_node(i)
b5389086ad7be0 Zhenguo Yao            2021-11-05  4156  				default_hstate.max_huge_pages_node[i] =
b5389086ad7be0 Zhenguo Yao            2021-11-05  4157  					default_hugepages_in_node[i];
282f4214384ee2 Mike Kravetz           2020-06-03  4158  		}
f8b74815a452ff Vaishali Thakkar       2016-02-17  4159  	}
a3437870160cf2 Nishanth Aravamudan    2008-07-23  4160  
cf11e85fc08cc6 Roman Gushchin         2020-04-10  4161  	hugetlb_cma_check();
a3437870160cf2 Nishanth Aravamudan    2008-07-23  4162  	hugetlb_init_hstates();
aa888a74977a8f Andi Kleen             2008-07-23  4163  	gather_bootmem_prealloc();
a3437870160cf2 Nishanth Aravamudan    2008-07-23  4164  	report_hugepages();
a3437870160cf2 Nishanth Aravamudan    2008-07-23  4165  
a3437870160cf2 Nishanth Aravamudan    2008-07-23 @4166  	hugetlb_sysfs_init();
7179e7bf4592ac Jianguo Wu             2012-12-18 @4167  	hugetlb_cgroup_file_init();
962de54828c5bb Kefeng Wang            2023-03-09 @4168  	hugetlb_sysctl_init();
9a30523066cde7 Lee Schermerhorn       2009-12-14  4169  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
