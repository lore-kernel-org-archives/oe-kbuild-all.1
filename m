Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7A31D130E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 03:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783136324; cv=none; b=cf54aF04tBvTN2a9WAvukQY8wkpleO5cZiWANz69x0g5kt5iMR/gUy9uTP1G1oPVkOwElJqLiKjhVazdugrptOulNW3CD3Eg6snUyEKQsy1P5fkFEra0NN2Khb1VBhaSDk3icJ2aq01hkBTc8ZKKa2dILUhVRstTkyLK5CK/RyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783136324; c=relaxed/simple;
	bh=W2PlMoUlcDmoUiA8f/nwIrTBNt7g+fPRzvKlsJnz7gU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LMOHDCcCrQJTsiOK861dKBB1ghv3Jji8U1++aIPh3V7+br6l4kMDqU2gyX/fAM3fwnCFLMd0nZsnsIfkbiV+G0pIqfUnAmFW4ZR0z/5adhgzy6vWCxWZqZvbs2fVlZnnL2TJUMNoTROIVqe+tpWSCttjuN21AjutPReyTF71Phk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMLJVy1Y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMLJVy1Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783136322; x=1814672322;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=W2PlMoUlcDmoUiA8f/nwIrTBNt7g+fPRzvKlsJnz7gU=;
  b=OMLJVy1You/d4CEzOUs9OroxTVIjH0CeC8+BEMCKt9PticlGQrbeoP+e
   oFYoTm/ORh4UmamsOou3CF0iHXZZFjfkoOtjY/bA+e67ilg1jZEvx3B5K
   z880OOcDpqphOWU3LjIyB+mtTFUvjtPBBtmFI+NV0A8ZG+/TrWOvdEMpz
   x/DTo3ZBPfd4OnFncr3qB1qpHKMd7Nvnt+GPk4+oItD86hIoy4x/JqH7J
   g3J3SctT7CEzmyZova4BqXz0U2cTiJWR7N/dTs9tEYzvm5ELqVB5WBvlL
   s0G+bVSwJf6+7eSodcLnxafDLRwLaVfF/xy/oaqxG/0KA758tp10+Ciuv
   Q==;
X-CSE-ConnectionGUID: +CdZDey/RdS/8MUIBHC8FQ==
X-CSE-MsgGUID: Pbssbg/OTv2ApxnA+JB4ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="95374673"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="95374673"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 20:38:41 -0700
X-CSE-ConnectionGUID: fGvXBfauTY+VMz40ijdN0w==
X-CSE-MsgGUID: u0i2EfTtSxOLrSoKcPx9Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="276443338"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 03 Jul 2026 20:38:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfrDB-00000000CoJ-1IE7;
	Sat, 04 Jul 2026 03:38:37 +0000
Date: Sat, 04 Jul 2026 11:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 0/1]
 kernel/power/snapshot.c:948: warning: Function parameter or member 'end_pfn'
 not described in 'register_nosave_region'
Message-ID: <202607041115.GMJoZ6W2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Amadeusz,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   a00af2707c1d0a67daa8f91db74300f65d84db3b
commit: 4607218fde84a76973d3941999360360ff6e333a [0/1] PM: hibernate: Remov=
e register_nosave_region_late()
config: i386-randconfig-012-20260702 (https://download.01.org/0day-ci/archi=
ve/20260704/202607041115.GMJoZ6W2-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260704/202607041115.GMJoZ6W2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041115.GMJoZ6W2-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   kernel/power/snapshot.c:404: warning: Function parameter or member 'gfp_=
mask' not described in 'alloc_rtree_node'
   kernel/power/snapshot.c:404: warning: Function parameter or member 'safe=
_needed' not described in 'alloc_rtree_node'
   kernel/power/snapshot.c:404: warning: Function parameter or member 'ca' =
not described in 'alloc_rtree_node'
   kernel/power/snapshot.c:404: warning: Function parameter or member 'list=
' not described in 'alloc_rtree_node'
   kernel/power/snapshot.c:429: warning: Function parameter or member 'zone=
' not described in 'add_rtree_block'
   kernel/power/snapshot.c:429: warning: Function parameter or member 'gfp_=
mask' not described in 'add_rtree_block'
   kernel/power/snapshot.c:429: warning: Function parameter or member 'safe=
_needed' not described in 'add_rtree_block'
   kernel/power/snapshot.c:429: warning: Function parameter or member 'ca' =
not described in 'add_rtree_block'
   kernel/power/snapshot.c:502: warning: Function parameter or member 'gfp_=
mask' not described in 'create_zone_bm_rtree'
   kernel/power/snapshot.c:502: warning: Function parameter or member 'safe=
_needed' not described in 'create_zone_bm_rtree'
   kernel/power/snapshot.c:502: warning: Function parameter or member 'ca' =
not described in 'create_zone_bm_rtree'
   kernel/power/snapshot.c:502: warning: Function parameter or member 'star=
t' not described in 'create_zone_bm_rtree'
   kernel/power/snapshot.c:502: warning: Function parameter or member 'end'=
 not described in 'create_zone_bm_rtree'
   kernel/power/snapshot.c:537: warning: Function parameter or member 'zone=
' not described in 'free_zone_bm_rtree'
   kernel/power/snapshot.c:537: warning: Function parameter or member 'clea=
r_nosave_free' not described in 'free_zone_bm_rtree'
   kernel/power/snapshot.c:644: warning: Function parameter or member 'bm' =
not described in 'memory_bm_create'
   kernel/power/snapshot.c:644: warning: Function parameter or member 'gfp_=
mask' not described in 'memory_bm_create'
   kernel/power/snapshot.c:644: warning: Function parameter or member 'safe=
_needed' not described in 'memory_bm_create'
   kernel/power/snapshot.c:686: warning: Function parameter or member 'clea=
r_nosave_free' not described in 'memory_bm_free'
   kernel/power/snapshot.c:708: warning: Function parameter or member 'bm' =
not described in 'memory_bm_find_bit'
   kernel/power/snapshot.c:708: warning: Function parameter or member 'pfn'=
 not described in 'memory_bm_find_bit'
   kernel/power/snapshot.c:708: warning: Function parameter or member 'addr=
' not described in 'memory_bm_find_bit'
   kernel/power/snapshot.c:708: warning: Function parameter or member 'bit_=
nr' not described in 'memory_bm_find_bit'
   kernel/power/snapshot.c:948: warning: Function parameter or member 'star=
t_pfn' not described in 'register_nosave_region'
>> kernel/power/snapshot.c:948: warning: Function parameter or member 'end_=
pfn' not described in 'register_nosave_region'
   kernel/power/snapshot.c:1212: warning: Function parameter or member 'zon=
e' not described in 'saveable_highmem_page'
   kernel/power/snapshot.c:1212: warning: Function parameter or member 'pfn=
' not described in 'saveable_highmem_page'
   kernel/power/snapshot.c:1276: warning: Function parameter or member 'zon=
e' not described in 'saveable_page'
   kernel/power/snapshot.c:1276: warning: Function parameter or member 'pfn=
' not described in 'saveable_page'
   kernel/power/snapshot.c:1347: warning: Function parameter or member 'dst=
' not described in 'safe_copy_page'
   kernel/power/snapshot.c:1347: warning: Function parameter or member 's_p=
age' not described in 'safe_copy_page'
   kernel/power/snapshot.c:1560: warning: Function parameter or member 'x' =
not described in '__fraction'
   kernel/power/snapshot.c:1560: warning: Function parameter or member 'mul=
tiplier' not described in '__fraction'
   kernel/power/snapshot.c:1560: warning: Function parameter or member 'bas=
e' not described in '__fraction'
   kernel/power/snapshot.c:1851: warning: Function parameter or member 'nr_=
highmem' not described in 'count_pages_for_highmem'
   kernel/power/snapshot.c:1869: warning: Function parameter or member 'nr_=
pages' not described in 'enough_free_mem'
   kernel/power/snapshot.c:1869: warning: Function parameter or member 'nr_=
highmem' not described in 'enough_free_mem'
   kernel/power/snapshot.c:1892: warning: Function parameter or member 'saf=
e_needed' not described in 'get_highmem_buffer'
   kernel/power/snapshot.c:1905: warning: Function parameter or member 'bm'=
 not described in 'alloc_highmem_pages'
   kernel/power/snapshot.c:1905: warning: Function parameter or member 'nr_=
highmem' not described in 'alloc_highmem_pages'
   kernel/power/snapshot.c:1940: warning: Function parameter or member 'cop=
y_bm' not described in 'swsusp_alloc'
   kernel/power/snapshot.c:1940: warning: Function parameter or member 'nr_=
pages' not described in 'swsusp_alloc'
   kernel/power/snapshot.c:1940: warning: Function parameter or member 'nr_=
highmem' not described in 'swsusp_alloc'
   kernel/power/snapshot.c:2153: warning: Function parameter or member 'bm'=
 not described in 'mark_unsafe_pages'
   kernel/power/snapshot.c:2188: warning: Function parameter or member 'inf=
o' not described in 'load_header'
   kernel/power/snapshot.c:2342: warning: Function parameter or member 'pag=
e' not described in 'get_highmem_page_buffer'
   kernel/power/snapshot.c:2342: warning: Function parameter or member 'ca'=
 not described in 'get_highmem_page_buffer'
   kernel/power/snapshot.c:2527: warning: Function parameter or member 'bm'=
 not described in 'get_buffer'
   kernel/power/snapshot.c:2527: warning: Function parameter or member 'ca'=
 not described in 'get_buffer'
   kernel/power/snapshot.c:2651: warning: Function parameter or member 'han=
dle' not described in 'snapshot_write_finalize'


vim +948 kernel/power/snapshot.c

307c5971c972ef2 Rafael J. Wysocki  2016-06-29  940 =20
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  941  /**
ef96f639ea66347 Rafael J. Wysocki  2016-07-06  942   * register_nosave_regi=
on - Register a region of unsaveable memory.
ef96f639ea66347 Rafael J. Wysocki  2016-07-06  943   *
ef96f639ea66347 Rafael J. Wysocki  2016-07-06  944   * Register a range of =
page frames the contents of which should not be saved
ef96f639ea66347 Rafael J. Wysocki  2016-07-06  945   * during hibernation (=
to be used in the early initialization code).
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  946   */
4607218fde84a76 Amadeusz S=C5=82awi=C5=84ski 2022-01-19  947  void __init r=
egister_nosave_region(unsigned long start_pfn, unsigned long end_pfn)
74dfd666de861c9 Rafael J. Wysocki  2007-05-06 @948  {
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  949  	struct nosave_region *=
region;
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  950 =20
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  951  	if (start_pfn >=3D end=
_pfn)
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  952  		return;
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  953 =20
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  954  	if (!list_empty(&nosav=
e_regions)) {
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  955  		/* Try to extend the =
previous region (they should be sorted) */
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  956  		region =3D list_entry=
(nosave_regions.prev,
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  957  					struct nosave_regi=
on, list);
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  958  		if (region->end_pfn =
=3D=3D start_pfn) {
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  959  			region->end_pfn =3D =
end_pfn;
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  960  			goto Report;
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  961  		}
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  962  	}
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  963  	/* This allocation can=
not fail */
7e1c4e27928e5f8 Mike Rapoport      2018-10-30  964  	region =3D memblock_al=
loc(sizeof(struct nosave_region),
7e1c4e27928e5f8 Mike Rapoport      2018-10-30  965  				SMP_CACHE_BYTES);
8a7f97b902f4fb0 Mike Rapoport      2019-03-11  966  	if (!region)
8a7f97b902f4fb0 Mike Rapoport      2019-03-11  967  		panic("%s: Failed to =
allocate %zu bytes\n", __func__,
8a7f97b902f4fb0 Mike Rapoport      2019-03-11  968  		      sizeof(struct n=
osave_region));
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  969  	region->start_pfn =3D =
start_pfn;
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  970  	region->end_pfn =3D en=
d_pfn;
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  971  	list_add_tail(&region-=
>list, &nosave_regions);
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  972   Report:
64ec72a1ece37d9 Joe Perches        2017-09-27  973  	pr_info("Registered no=
save memory: [mem %#010llx-%#010llx]\n",
cd38ca854de15b2 Bjorn Helgaas      2013-06-03  974  		(unsigned long long) =
start_pfn << PAGE_SHIFT,
cd38ca854de15b2 Bjorn Helgaas      2013-06-03  975  		((unsigned long long)=
 end_pfn << PAGE_SHIFT) - 1);
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  976  }
74dfd666de861c9 Rafael J. Wysocki  2007-05-06  977 =20

:::::: The code at line 948 was first introduced by commit
:::::: 74dfd666de861c97d47bdbd892f6d21b801d0247 swsusp: do not use page fla=
gs

:::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
