Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9B626FA60
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 23:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765322958; cv=none; b=u3tjIPy+GiFz+jXY+GNWdFgIH40x86CWYCLSCXGd2bE9fJtI57cMq1vGSGlIybOOVT6at94Rj3wcI64CIx8vhwdAuxY8GF2ikbPMuDc6OalVf4WeI7amyOVDaPPqCQT6uYHG1T4vtj4JjEXUbfOZxnd/7iameGD8OVGZhqrmVVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765322958; c=relaxed/simple;
	bh=vgqPVXIjTM8rc1Y+7ZFbUeVzDkPyDhSBF6W/QuqMaQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FxytAg/WBCzyzM+WTjBdZj9uIADZkbJGQsbArUG18YmbdNSaWsEdiImR9z9AzAmCcsTK9D+wv0VjuhH0E+zOePixaAYNlZy29l+vM5bz3ueISZyWC2s1m6zVpTttuTpqLZD/lFqerDs7/0cHvO3veu9QbD8Re7CgLxjG6JeQHg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6Vu03PG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6Vu03PG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765322957; x=1796858957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vgqPVXIjTM8rc1Y+7ZFbUeVzDkPyDhSBF6W/QuqMaQs=;
  b=l6Vu03PGWRdFXU7zycmbu5Ic4FjDAK/taolnPV2uVi2NlA4lxOMCX97V
   8L1eqxrFS/CxCVcizpPMzY1qwklKndc4foVVs41RnU6IJQKLdBy0aLKKM
   6Zln3MYkQ2x5z0Ogj5dgJIfZwmjGQs3m5imRR5gP8VTvoXCxXhUOJ6/dr
   HCvR6vEhRbdWVvVFgGfroGP1lCI1Ydfi+dDBq1+slqqlclYKn2lFmAAQL
   K1aUzrf8Qw6Vi9okQbN2Q2vd5EvasJzCffV2xR5ErvOjv/joOR7X6e1dr
   d72khCuTpcxfVsynF7OMYZPqD+gLqzNDiN7FehrxTLgAcuau2ddpk323M
   g==;
X-CSE-ConnectionGUID: C4Xr7GaQTPCIlwOLnwv9Qw==
X-CSE-MsgGUID: ANHE1PPKR2CvIFG5P3Kk2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67015865"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="67015865"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 15:29:16 -0800
X-CSE-ConnectionGUID: kFEmRCq3QDmmjAWBNafOCw==
X-CSE-MsgGUID: x4wrGZ0GRNa05d4DaMgi0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="227015521"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 09 Dec 2025 15:29:16 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT78r-000000000Qb-0FVI;
	Tue, 09 Dec 2025 23:29:13 +0000
Date: Wed, 10 Dec 2025 00:28:13 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3399/3399] certs/system_keyring.c:42: warning:
 Function parameter or member 'dest_keyring' not described in
 'restrict_link_by_builtin_trusted'
Message-ID: <202512100037.0LOqY3GV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Salvatore,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ea8b5fbcdf7f5ce2d966ae6aa4e95e2ebde6cb03
commit: 68ee705da160d123656dcbf9ebd449fb77b54bc0 [3399/3399] scripts: kernel-doc: Fix syntax error due to undeclared args variable
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251210/202512100037.0LOqY3GV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512100037.0LOqY3GV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512100037.0LOqY3GV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> certs/system_keyring.c:42: warning: Function parameter or member 'dest_keyring' not described in 'restrict_link_by_builtin_trusted'
>> certs/system_keyring.c:42: warning: Function parameter or member 'type' not described in 'restrict_link_by_builtin_trusted'
>> certs/system_keyring.c:42: warning: Function parameter or member 'payload' not described in 'restrict_link_by_builtin_trusted'
>> certs/system_keyring.c:42: warning: Function parameter or member 'restriction_key' not described in 'restrict_link_by_builtin_trusted'
>> certs/system_keyring.c:61: warning: Function parameter or member 'dest_keyring' not described in 'restrict_link_by_builtin_and_secondary_trusted'
>> certs/system_keyring.c:61: warning: Function parameter or member 'type' not described in 'restrict_link_by_builtin_and_secondary_trusted'
>> certs/system_keyring.c:61: warning: Function parameter or member 'payload' not described in 'restrict_link_by_builtin_and_secondary_trusted'
>> certs/system_keyring.c:61: warning: Function parameter or member 'restrict_key' not described in 'restrict_link_by_builtin_and_secondary_trusted'
--
>> mm/filemap.c:823:14: warning: no previous prototype for '__add_to_page_cache_locked' [-Wmissing-prototypes]
     823 | noinline int __add_to_page_cache_locked(struct page *page,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> mm/truncate.c:543: warning: Function parameter or member 'mapping' not described in 'invalidate_mapping_pagevec'
>> mm/truncate.c:543: warning: Function parameter or member 'start' not described in 'invalidate_mapping_pagevec'
>> mm/truncate.c:543: warning: Function parameter or member 'end' not described in 'invalidate_mapping_pagevec'
>> mm/truncate.c:543: warning: Function parameter or member 'nr_pagevec' not described in 'invalidate_mapping_pagevec'
--
>> mm/oom_kill.c:316: warning: Function parameter or member 'task' not described in 'oom_next_task'
>> mm/oom_kill.c:316: warning: Function parameter or member 'oc' not described in 'oom_next_task'
>> mm/oom_kill.c:316: warning: Function parameter or member 'points' not described in 'oom_next_task'
--
>> mm/page_vma_mapped.c:86: warning: Function parameter or member 'pvmw' not described in 'check_pte'
--
>> mm/vmalloc.c:3666: warning: Function parameter or member 'pgoff' not described in 'remap_vmalloc_hugepage_range_partial'
>> mm/vmalloc.c:3795: warning: Function parameter or member 'align' not described in 'pvm_determine_end_from_reverse'
--
>> mm/page_alloc.c:3040:6: warning: no previous prototype for '__drain_all_pages' [-Wmissing-prototypes]
    3040 | void __drain_all_pages(struct zone *zone, bool force_all_cpus)
         |      ^~~~~~~~~~~~~~~~~
>> mm/page_alloc.c:3603:15: warning: no previous prototype for 'should_fail_alloc_page' [-Wmissing-prototypes]
    3603 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
         |               ^~~~~~~~~~~~~~~~~~~~~~
>> mm/page_alloc.c:6754:20: warning: no previous prototype for 'memmap_init' [-Wmissing-prototypes]
    6754 | void __init __weak memmap_init(void)
         |                    ^~~~~~~~~~~
>> mm/page_alloc.c:6792:23: warning: no previous prototype for 'arch_memmap_init' [-Wmissing-prototypes]
    6792 | void __meminit __weak arch_memmap_init(unsigned long size, int nid,
         |                       ^~~~~~~~~~~~~~~~
>> mm/page_alloc.c:6910:6: warning: no previous prototype for '__zone_set_pageset_high_and_batch' [-Wmissing-prototypes]
    6910 | void __zone_set_pageset_high_and_batch(struct zone *zone, unsigned long high,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> mm/khugepaged.c:102: warning: Function parameter or member 'nr_pte_mapped_thp' not described in 'mm_slot'
>> mm/khugepaged.c:102: warning: Function parameter or member 'pte_mapped_thp' not described in 'mm_slot'
>> mm/khugepaged.c:1453: warning: Function parameter or member 'mm' not described in 'collapse_pte_mapped_thp'
>> mm/khugepaged.c:1453: warning: Function parameter or member 'addr' not described in 'collapse_pte_mapped_thp'
>> mm/khugepaged.c:1691: warning: Function parameter or member 'mm' not described in 'collapse_file'
>> mm/khugepaged.c:1691: warning: Function parameter or member 'file' not described in 'collapse_file'
>> mm/khugepaged.c:1691: warning: Function parameter or member 'start' not described in 'collapse_file'
>> mm/khugepaged.c:1691: warning: Function parameter or member 'hpage' not described in 'collapse_file'
>> mm/khugepaged.c:1691: warning: Function parameter or member 'node' not described in 'collapse_file'
>> mm/khugepaged.c:1691: warning: Function parameter or member 'reliable' not described in 'collapse_file'
--
>> mm/early_ioremap.c:34:24: warning: no previous prototype for 'early_memremap_pgprot_adjust' [-Wmissing-prototypes]
      34 | pgprot_t __init __weak early_memremap_pgprot_adjust(resource_size_t phys_addr,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> mm/kasan/init.c:232: warning: Function parameter or member 'shadow_start' not described in 'kasan_populate_early_shadow'
>> mm/kasan/init.c:232: warning: Function parameter or member 'shadow_end' not described in 'kasan_populate_early_shadow'
--
>> fs/open.c:887: warning: Excess function parameter 'opened' description in 'finish_open'
>> fs/open.c:929: warning: Excess function parameter 'cred' description in 'vfs_open'
..


vim +42 certs/system_keyring.c

b56e5a17b6b9acd kernel/system_keyring.c David Howells 2013-08-30  31  
a511e1af8b12f44 certs/system_keyring.c  David Howells 2016-04-06  32  /**
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  33   * restrict_link_to_builtin_trusted - Restrict keyring addition by built in CA
a511e1af8b12f44 certs/system_keyring.c  David Howells 2016-04-06  34   *
a511e1af8b12f44 certs/system_keyring.c  David Howells 2016-04-06  35   * Restrict the addition of keys into a keyring based on the key-to-be-added
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  36   * being vouched for by a key in the built in system keyring.
a511e1af8b12f44 certs/system_keyring.c  David Howells 2016-04-06  37   */
aaf66c883813f00 certs/system_keyring.c  Mat Martineau 2016-08-30  38  int restrict_link_by_builtin_trusted(struct key *dest_keyring,
a511e1af8b12f44 certs/system_keyring.c  David Howells 2016-04-06  39  				     const struct key_type *type,
aaf66c883813f00 certs/system_keyring.c  Mat Martineau 2016-08-30  40  				     const union key_payload *payload,
aaf66c883813f00 certs/system_keyring.c  Mat Martineau 2016-08-30  41  				     struct key *restriction_key)
a511e1af8b12f44 certs/system_keyring.c  David Howells 2016-04-06 @42  {
aaf66c883813f00 certs/system_keyring.c  Mat Martineau 2016-08-30  43  	return restrict_link_by_signature(dest_keyring, type, payload,
aaf66c883813f00 certs/system_keyring.c  Mat Martineau 2016-08-30  44  					  builtin_trusted_keys);
a511e1af8b12f44 certs/system_keyring.c  David Howells 2016-04-06  45  }
a511e1af8b12f44 certs/system_keyring.c  David Howells 2016-04-06  46  
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  47  #ifdef CONFIG_SECONDARY_TRUSTED_KEYRING
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  48  /**
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  49   * restrict_link_by_builtin_and_secondary_trusted - Restrict keyring
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  50   *   addition by both builtin and secondary keyrings
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  51   *
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  52   * Restrict the addition of keys into a keyring based on the key-to-be-added
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  53   * being vouched for by a key in either the built-in or the secondary system
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  54   * keyrings.
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  55   */
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  56  int restrict_link_by_builtin_and_secondary_trusted(
aaf66c883813f00 certs/system_keyring.c  Mat Martineau 2016-08-30  57  	struct key *dest_keyring,
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  58  	const struct key_type *type,
aaf66c883813f00 certs/system_keyring.c  Mat Martineau 2016-08-30  59  	const union key_payload *payload,
aaf66c883813f00 certs/system_keyring.c  Mat Martineau 2016-08-30  60  	struct key *restrict_key)
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06 @61  {
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  62  	/* If we have a secondary trusted keyring, then that contains a link
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  63  	 * through to the builtin keyring and the search will follow that link.
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  64  	 */
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  65  	if (type == &key_type_keyring &&
aaf66c883813f00 certs/system_keyring.c  Mat Martineau 2016-08-30  66  	    dest_keyring == secondary_trusted_keys &&
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  67  	    payload == &builtin_trusted_keys->payload)
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  68  		/* Allow the builtin keyring to be added to the secondary */
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  69  		return 0;
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  70  
aaf66c883813f00 certs/system_keyring.c  Mat Martineau 2016-08-30  71  	return restrict_link_by_signature(dest_keyring, type, payload,
aaf66c883813f00 certs/system_keyring.c  Mat Martineau 2016-08-30  72  					  secondary_trusted_keys);
d3bfe84129f65e0 certs/system_keyring.c  David Howells 2016-04-06  73  }
2b6aa412ff23a02 certs/system_keyring.c  Mat Martineau 2016-08-31  74  

:::::: The code at line 42 was first introduced by commit
:::::: a511e1af8b12f44c6e55786c463c9f093c214fb6 KEYS: Move the point of trust determination to __key_link()

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
