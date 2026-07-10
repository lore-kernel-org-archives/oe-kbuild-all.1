Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198BB3CF211
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 08:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673891; cv=none; b=uf8Wl04SBOTS0rUTdofjKCce5z12kJQ+42sZ2j2GT3SVxeUFhQaoJjWKMrzLSGPpSGt0OIP9YaX/Ot1xO4Ic/aZiSm0vgPcRsGVhRHil2A53K/yB6OWVMk3zJwSHTt2U31Mkz+UIx2xNNFjUyQUaRAel3p5qI0RU5tUMArhrYfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673891; c=relaxed/simple;
	bh=0mrsE1+kNT0mDugG9R3kuttk8m6mu5qmEa0MpZSaqMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EApMXPoTfu9driDhyypc8U1qlW95gdOECyd3VzVdjh0qYx9YKwQzuN55ihLlLpRLcgw3nG+0EUvFIMjkxvNjpH/dPzQGleZxj7ZUy9sj3OhJh7JPWKNpgemZb4+nM2kpQM4sqWDayL41dlTrJZxaTgvz0vH95wDsAzazip1x7PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkL1keMf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkL1keMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783673888; x=1815209888;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0mrsE1+kNT0mDugG9R3kuttk8m6mu5qmEa0MpZSaqMI=;
  b=hkL1keMfLo6QYGjZC0mt18HTKdpvzsJ7lHsacpSc4TBcAglgl4PwHuGk
   hCtG55oCl16Er3iGYjyq9a3GjtuWTOEKePiajevHosilhCa10DQ+T8XFW
   u0Zd+AL7tk7Lz6ke5Gu8bX7q73bBVKBBKtvpuNtpZw78rnokc2HCECNF6
   IuMXXW9EFpup3pKEP2vWu7HtLo8lNGjrQ0egxBDp/BBFqawWWnd+HdNny
   urUJwwhSvDusyH5mLJDZtFbHnFt85cIqqSogvihWWhy7Av6EDRYnHbJ4X
   pToaFYbwl9aAYi+yQ0OKLMhNGaqTTXTDHT2oAsZm6GOVWLrxi+CjO8UQW
   w==;
X-CSE-ConnectionGUID: sIlRc81QSAGbEUIaBS5jAg==
X-CSE-MsgGUID: R1AbRw8RRbizeoQnKIHwjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88201268"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88201268"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 01:58:07 -0700
X-CSE-ConnectionGUID: Jzl2Ga4yTzi2kwk9JZTTGQ==
X-CSE-MsgGUID: yB6D98cnRDuu/PzPhFkkOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="293031613"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 10 Jul 2026 01:58:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wi73a-00000000IhT-1c1q;
	Fri, 10 Jul 2026 08:58:02 +0000
Date: Fri, 10 Jul 2026 16:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 1/1]
 mm/hmm.c:252:23: error: implicit declaration of function
 'pte_is_uffd_wp_marker'; did you mean 'pte_swp_uffd_wp_any'?
Message-ID: <202607101616.9KVdFRh3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Carlos,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline-ris=
cv64
head:   c8bd194f277ae6d43833ef16baa205e4c67629b4
commit: 82d9be76e213a0fb22f8f20586b020b6a91a5c01 [1/1] Merge 7203ca412fc8 (=
"Merge tag 'mm-stable-2025-12-03-21-26' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/akpm/mm") into android-mainline
config: arm-randconfig-001-20260710 (https://download.01.org/0day-ci/archiv=
e/20260710/202607101616.9KVdFRh3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260710/202607101616.9KVdFRh3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607101616.9KVdFRh3-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   mm/hmm.c: In function 'pte_to_hmm_pfn_flags':
   mm/hmm.c:230:6: error: implicit declaration of function 'pte_none'; did =
you mean 'p4d_none'? [-Werror=3Dimplicit-function-declaration]
     if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
         ^~~~~~~~
         p4d_none
   mm/hmm.c:230:24: error: implicit declaration of function 'pte_present'; =
did you mean 'p4d_present'? [-Werror=3Dimplicit-function-declaration]
     if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
                           ^~~~~~~~~~~
                           p4d_present
   mm/hmm.c:230:44: error: implicit declaration of function 'pte_protnone';=
 did you mean 'p4d_none'? [-Werror=3Dimplicit-function-declaration]
     if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
                                               ^~~~~~~~~~~~
                                               p4d_none
   mm/hmm.c:232:9: error: implicit declaration of function 'pte_write'; did=
 you mean 'pgd_write'? [-Werror=3Dimplicit-function-declaration]
     return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALI=
D;
            ^~~~~~~~~
            pgd_write
   mm/hmm.c: In function 'hmm_vma_handle_pte':
   mm/hmm.c:243:14: error: implicit declaration of function 'ptep_get'; did=
 you mean 'kset_get'? [-Werror=3Dimplicit-function-declaration]
     pte_t pte =3D ptep_get(ptep);
                 ^~~~~~~~
                 kset_get
>> mm/hmm.c:252:23: error: implicit declaration of function 'pte_is_uffd_wp=
_marker'; did you mean 'pte_swp_uffd_wp_any'? [-Werror=3Dimplicit-function-=
declaration]
     if (pte_none(pte) || pte_is_uffd_wp_marker(pte)) {
                          ^~~~~~~~~~~~~~~~~~~~~
                          pte_swp_uffd_wp_any
   mm/hmm.c:261:28: error: implicit declaration of function 'softleaf_from_=
pte' [-Werror=3Dimplicit-function-declaration]
      const softleaf_t entry =3D softleaf_from_pte(pte);
                               ^~~~~~~~~~~~~~~~~
   mm/hmm.c:261:28: error: invalid initializer
>> mm/hmm.c:267:7: error: implicit declaration of function 'softleaf_is_dev=
ice_private'; did you mean 'folio_is_device_private'? [-Werror=3Dimplicit-f=
unction-declaration]
      if (softleaf_is_device_private(entry) &&
          ^~~~~~~~~~~~~~~~~~~~~~~~~~
          folio_is_device_private
>> mm/hmm.c:268:18: error: implicit declaration of function 'softleaf_to_pa=
ge'; did you mean 'kmap_to_page'? [-Werror=3Dimplicit-function-declaration]
          page_pgmap(softleaf_to_page(entry))->owner =3D=3D
                     ^~~~~~~~~~~~~~~~
                     kmap_to_page
   mm/hmm.c:268:18: warning: passing argument 1 of 'page_pgmap' makes point=
er from integer without a cast [-Wint-conversion]
          page_pgmap(softleaf_to_page(entry))->owner =3D=3D
                     ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/pagewalk.h:5,
                    from mm/hmm.c:11:
   include/linux/mmzone.h:1241:65: note: expected 'const struct page *' but=
 argument is of type 'int'
    static inline struct dev_pagemap *page_pgmap(const struct page *page)
                                                 ~~~~~~~~~~~~~~~~~~~^~~~
   mm/hmm.c:271:8: error: implicit declaration of function 'softleaf_is_dev=
ice_private_write'; did you mean 'folio_is_device_private'? [-Werror=3Dimpl=
icit-function-declaration]
       if (softleaf_is_device_private_write(entry))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           folio_is_device_private
   mm/hmm.c:273:20: error: implicit declaration of function 'softleaf_to_pf=
n'; did you mean 'vmalloc_to_pfn'? [-Werror=3Dimplicit-function-declaration]
       new_pfn_flags =3D softleaf_to_pfn(entry) | cpu_flags;
                       ^~~~~~~~~~~~~~~
                       vmalloc_to_pfn
>> mm/hmm.c:282:7: error: implicit declaration of function 'softleaf_is_swa=
p'; did you mean 'folio_swap'? [-Werror=3Dimplicit-function-declaration]
      if (softleaf_is_swap(entry))
          ^~~~~~~~~~~~~~~~
          folio_swap
   mm/hmm.c:288:7: error: implicit declaration of function 'softleaf_is_dev=
ice_exclusive'; did you mean 'swait_event_exclusive'? [-Werror=3Dimplicit-f=
unction-declaration]
      if (softleaf_is_device_exclusive(entry))
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
          swait_event_exclusive
   mm/hmm.c:291:7: error: implicit declaration of function 'softleaf_is_mig=
ration' [-Werror=3Dimplicit-function-declaration]
      if (softleaf_is_migration(entry)) {
          ^~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:292:4: error: implicit declaration of function 'pte_unmap'; did=
 you mean 'memunmap'? [-Werror=3Dimplicit-function-declaration]
       pte_unmap(ptep);
       ^~~~~~~~~
       memunmap
   mm/hmm.c:294:4: error: implicit declaration of function 'migration_entry=
_wait'; did you mean 'memalloc_retry_wait'? [-Werror=3Dimplicit-function-de=
claration]
       migration_entry_wait(walk->mm, pmdp, addr);
       ^~~~~~~~~~~~~~~~~~~~
       memalloc_retry_wait
   mm/hmm.c:314:19: error: implicit declaration of function 'pte_pfn'; did =
you mean 'pud_pfn'? [-Werror=3Dimplicit-function-declaration]
         !is_zero_pfn(pte_pfn(pte))) {
                      ^~~~~~~
                      pud_pfn
   mm/hmm.c: In function 'hmm_vma_walk_pmd':
   mm/hmm.c:411:8: error: implicit declaration of function 'pmdp_get_lockle=
ss'; did you mean 'pmd_offset_lockless'? [-Werror=3Dimplicit-function-decla=
ration]
     pmd =3D pmdp_get_lockless(pmdp);
           ^~~~~~~~~~~~~~~~~
           pmd_offset_lockless
   mm/hmm.c:412:6: error: implicit declaration of function 'pmd_none'; did =
you mean 'p4d_none'? [-Werror=3Dimplicit-function-declaration]
     if (pmd_none(pmd))
         ^~~~~~~~
         p4d_none
>> mm/hmm.c:415:35: error: implicit declaration of function 'pmd_is_migrati=
on_entry'; did you mean 'list_first_entry'? [-Werror=3Dimplicit-function-de=
claration]
     if (thp_migration_supported() && pmd_is_migration_entry(pmd)) {
                                      ^~~~~~~~~~~~~~~~~~~~~~
                                      list_first_entry
   mm/hmm.c:418:4: error: implicit declaration of function 'pmd_migration_e=
ntry_wait'; did you mean 'memalloc_retry_wait'? [-Werror=3Dimplicit-functio=
n-declaration]
       pmd_migration_entry_wait(walk->mm, pmdp);
       ^~~~~~~~~~~~~~~~~~~~~~~~
       memalloc_retry_wait
   mm/hmm.c:424:7: error: implicit declaration of function 'pmd_present'; d=
id you mean 'p4d_present'? [-Werror=3Dimplicit-function-declaration]
     if (!pmd_present(pmd))
          ^~~~~~~~~~~
          p4d_present
   mm/hmm.c:428:6: error: implicit declaration of function 'pmd_trans_huge'=
; did you mean 'pmd_is_huge'? [-Werror=3Dimplicit-function-declaration]
     if (pmd_trans_huge(pmd)) {
         ^~~~~~~~~~~~~~
         pmd_is_huge
   mm/hmm.c:451:6: error: implicit declaration of function 'pmd_bad'; did y=
ou mean 'p4d_bad'? [-Werror=3Dimplicit-function-declaration]
     if (pmd_bad(pmd)) {
         ^~~~~~~
         p4d_bad
   mm/hmm.c: In function 'hmm_range_fault':
   mm/hmm.c:672:7: error: implicit declaration of function 'mmu_interval_ch=
eck_retry'; did you mean 'vma_interval_tree_remove'? [-Werror=3Dimplicit-fu=
nction-declaration]
      if (mmu_interval_check_retry(range->notifier,
          ^~~~~~~~~~~~~~~~~~~~~~~~
          vma_interval_tree_remove
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && MMU [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=3Dy] && DRM [=3Dy]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && MMU [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=3Dn] && CAN_DEV [=3Dn] && CAN_NETLINK [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for HMM_MIRROR
   Depends on [n]: MMU [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=3Dy] && DRM [=3Dy]


vim +252 mm/hmm.c

2aee09d8c116421 J=C3=A9r=C3=B4me Glisse   2018-04-10  234 =20
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  235  static int hmm_v=
ma_handle_pte(struct mm_walk *walk, unsigned long addr,
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  236  			      unsigne=
d long end, pmd_t *pmdp, pte_t *ptep,
2733ea144dcce78 Jason Gunthorpe 2020-05-01  237  			      unsigned long *hm=
m_pfn)
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  238  {
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  239  	struct hmm_vma_=
walk *hmm_vma_walk =3D walk->private;
f88a1e90c665408 J=C3=A9r=C3=B4me Glisse   2018-04-10  240  	struct hmm_rang=
e *range =3D hmm_vma_walk->range;
a3eb13c1579ba97 Jason Gunthorpe 2020-03-27  241  	unsigned int required_fau=
lt;
2733ea144dcce78 Jason Gunthorpe 2020-05-01  242  	unsigned long cpu_flags;
c33c794828f2121 Ryan Roberts    2023-06-12  243  	pte_t pte =3D ptep_get(pt=
ep);
2733ea144dcce78 Jason Gunthorpe 2020-05-01  244  	uint64_t pfn_req_flags =
=3D *hmm_pfn;
285e871884ff3dc Leon Romanovsky 2025-04-28  245  	uint64_t new_pfn_flags =
=3D 0;
da4c3c735ea4dcc J=C3=A9r=C3=B4me Glisse   2017-09-08  246 =20
c093cf451094a9a Lorenzo Stoakes 2025-11-10  247  	/*
c093cf451094a9a Lorenzo Stoakes 2025-11-10  248  	 * Any other marker than =
a UFFD WP marker will result in a fault error
c093cf451094a9a Lorenzo Stoakes 2025-11-10  249  	 * that will be correctly=
 handled, so we need only check for UFFD WP
c093cf451094a9a Lorenzo Stoakes 2025-11-10  250  	 * here.
c093cf451094a9a Lorenzo Stoakes 2025-11-10  251  	 */
68aa2fdbf57f769 Lorenzo Stoakes 2025-11-10 @252  	if (pte_none(pte) || pte_=
is_uffd_wp_marker(pte)) {
2733ea144dcce78 Jason Gunthorpe 2020-05-01  253  		required_fault =3D
2733ea144dcce78 Jason Gunthorpe 2020-05-01  254  			hmm_pte_need_fault(hmm_=
vma_walk, pfn_req_flags, 0);
a3eb13c1579ba97 Jason Gunthorpe 2020-03-27  255  		if (required_fault)
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  256  			goto fault;
285e871884ff3dc Leon Romanovsky 2025-04-28  257  		goto out;
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  258  	}
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  259 =20
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  260  	if (!pte_presen=
t(pte)) {
9ff30bb9ab40b34 Lorenzo Stoakes 2025-11-10  261  		const softleaf_t entry =
=3D softleaf_from_pte(pte);
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  262 =20
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  263  		/*
8a295dbbaf7292c Ralph Campbell  2022-07-25  264  		 * Don't fault in device=
 private pages owned by the caller,
8a295dbbaf7292c Ralph Campbell  2022-07-25  265  		 * just report the PFN.
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  266  		 */
9ff30bb9ab40b34 Lorenzo Stoakes 2025-11-10 @267  		if (softleaf_is_device_p=
rivate(entry) &&
9ff30bb9ab40b34 Lorenzo Stoakes 2025-11-10 @268  		    page_pgmap(softleaf_=
to_page(entry))->owner =3D=3D
8a295dbbaf7292c Ralph Campbell  2022-07-25  269  		    range->dev_private_o=
wner) {
2733ea144dcce78 Jason Gunthorpe 2020-05-01  270  			cpu_flags =3D HMM_PFN_V=
ALID;
9ff30bb9ab40b34 Lorenzo Stoakes 2025-11-10  271  			if (softleaf_is_device_=
private_write(entry))
2733ea144dcce78 Jason Gunthorpe 2020-05-01  272  				cpu_flags |=3D HMM_PFN=
_WRITE;
93976a20345b4af Lorenzo Stoakes 2025-11-10  273  			new_pfn_flags =3D softl=
eaf_to_pfn(entry) | cpu_flags;
285e871884ff3dc Leon Romanovsky 2025-04-28  274  			goto out;
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  275  		}
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  276 =20
2733ea144dcce78 Jason Gunthorpe 2020-05-01  277  		required_fault =3D
2733ea144dcce78 Jason Gunthorpe 2020-05-01  278  			hmm_pte_need_fault(hmm_=
vma_walk, pfn_req_flags, 0);
285e871884ff3dc Leon Romanovsky 2025-04-28  279  		if (!required_fault)
285e871884ff3dc Leon Romanovsky 2025-04-28  280  			goto out;
76612d6ce4ccd21 Jason Gunthorpe 2020-02-28  281 =20
9ff30bb9ab40b34 Lorenzo Stoakes 2025-11-10 @282  		if (softleaf_is_swap(ent=
ry))
76612d6ce4ccd21 Jason Gunthorpe 2020-02-28  283  			goto fault;
76612d6ce4ccd21 Jason Gunthorpe 2020-02-28  284 =20
9ff30bb9ab40b34 Lorenzo Stoakes 2025-11-10  285  		if (softleaf_is_device_p=
rivate(entry))
8a295dbbaf7292c Ralph Campbell  2022-07-25  286  			goto fault;
8a295dbbaf7292c Ralph Campbell  2022-07-25  287 =20
9ff30bb9ab40b34 Lorenzo Stoakes 2025-11-10  288  		if (softleaf_is_device_e=
xclusive(entry))
b756a3b5e7ead8f Alistair Popple 2021-06-30  289  			goto fault;
b756a3b5e7ead8f Alistair Popple 2021-06-30  290 =20
9ff30bb9ab40b34 Lorenzo Stoakes 2025-11-10  291  		if (softleaf_is_migratio=
n(entry)) {
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  292  			pte_unmap(pte=
p);
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  293  			hmm_vma_walk-=
>last =3D addr;
d2e8d551165ccb6 Ralph Campbell  2019-07-25  294  			migration_entry_wait(wa=
lk->mm, pmdp, addr);
73231612dc7c907 J=C3=A9r=C3=B4me Glisse   2019-05-13  295  			return -EBUSY;
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  296  		}
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  297 =20
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  298  		/* Report erro=
r for everything else */
dfdc22078f3f064 Jason Gunthorpe 2020-02-28  299  		pte_unmap(ptep);
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  300  		return -EFAULT;
da4c3c735ea4dcc J=C3=A9r=C3=B4me Glisse   2017-09-08  301  	}
da4c3c735ea4dcc J=C3=A9r=C3=B4me Glisse   2017-09-08  302 =20
76612d6ce4ccd21 Jason Gunthorpe 2020-02-28  303  	cpu_flags =3D pte_to_hmm_=
pfn_flags(range, pte);
2733ea144dcce78 Jason Gunthorpe 2020-05-01  304  	required_fault =3D
2733ea144dcce78 Jason Gunthorpe 2020-05-01  305  		hmm_pte_need_fault(hmm_v=
ma_walk, pfn_req_flags, cpu_flags);
a3eb13c1579ba97 Jason Gunthorpe 2020-03-27  306  	if (required_fault)
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  307  		goto fault;
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  308 =20
ac541f250372294 Ralph Campbell  2019-10-23  309  	/*
405506274922910 Jason Gunthorpe 2020-03-05  310  	 * Since each architectur=
e defines a struct page for the zero page, just
405506274922910 Jason Gunthorpe 2020-03-05  311  	 * fall through and treat=
 it like a normal page.
ac541f250372294 Ralph Campbell  2019-10-23  312  	 */
87c01d57fa23de8 Alistair Popple 2022-01-14  313  	if (!vm_normal_page(walk-=
>vma, addr, pte) &&
4b42fb213678d2b Li Zhijian      2021-09-08  314  	    !is_zero_pfn(pte_pfn(=
pte))) {
2733ea144dcce78 Jason Gunthorpe 2020-05-01  315  		if (hmm_pte_need_fault(h=
mm_vma_walk, pfn_req_flags, 0)) {
405506274922910 Jason Gunthorpe 2020-03-05  316  			pte_unmap(ptep);
405506274922910 Jason Gunthorpe 2020-03-05  317  			return -EFAULT;
405506274922910 Jason Gunthorpe 2020-03-05  318  		}
285e871884ff3dc Leon Romanovsky 2025-04-28  319  		new_pfn_flags =3D HMM_PF=
N_ERROR;
285e871884ff3dc Leon Romanovsky 2025-04-28  320  		goto out;
ac541f250372294 Ralph Campbell  2019-10-23  321  	}
992de9a8b751167 J=C3=A9r=C3=B4me Glisse   2019-05-13  322 =20
285e871884ff3dc Leon Romanovsky 2025-04-28  323  	new_pfn_flags =3D pte_pfn=
(pte) | cpu_flags;
285e871884ff3dc Leon Romanovsky 2025-04-28  324  out:
285e871884ff3dc Leon Romanovsky 2025-04-28  325  	*hmm_pfn =3D (*hmm_pfn & =
HMM_PFN_INOUT_FLAGS) | new_pfn_flags;
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  326  	return 0;
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  327 =20
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  328  fault:
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  329  	pte_unmap(ptep);
5504ed29692faad J=C3=A9r=C3=B4me Glisse   2018-04-10  330  	/* Fault any vi=
rtual address we were asked to fault */
a3eb13c1579ba97 Jason Gunthorpe 2020-03-27  331  	return hmm_vma_fault(addr=
, end, required_fault, walk);
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  332  }
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  333 =20
10b9feee2d0dc81 Francois Dugast 2025-09-08  334  #ifdef CONFIG_ARCH_ENABLE_=
THP_MIGRATION
10b9feee2d0dc81 Francois Dugast 2025-09-08  335  static int hmm_vma_handle_=
absent_pmd(struct mm_walk *walk, unsigned long start,
10b9feee2d0dc81 Francois Dugast 2025-09-08  336  				     unsigned long end=
, unsigned long *hmm_pfns,
10b9feee2d0dc81 Francois Dugast 2025-09-08  337  				     pmd_t pmd)
10b9feee2d0dc81 Francois Dugast 2025-09-08  338  {
10b9feee2d0dc81 Francois Dugast 2025-09-08  339  	struct hmm_vma_walk *hmm_=
vma_walk =3D walk->private;
10b9feee2d0dc81 Francois Dugast 2025-09-08  340  	struct hmm_range *range =
=3D hmm_vma_walk->range;
10b9feee2d0dc81 Francois Dugast 2025-09-08  341  	unsigned long npages =3D =
(end - start) >> PAGE_SHIFT;
0ac881efe164685 Lorenzo Stoakes 2025-11-10  342  	const softleaf_t entry =
=3D softleaf_from_pmd(pmd);
10b9feee2d0dc81 Francois Dugast 2025-09-08  343  	unsigned long addr =3D st=
art;
10b9feee2d0dc81 Francois Dugast 2025-09-08  344  	unsigned int required_fau=
lt;
10b9feee2d0dc81 Francois Dugast 2025-09-08  345 =20
0ac881efe164685 Lorenzo Stoakes 2025-11-10  346  	if (softleaf_is_device_pr=
ivate(entry) &&
0ac881efe164685 Lorenzo Stoakes 2025-11-10  347  	    softleaf_to_folio(ent=
ry)->pgmap->owner =3D=3D
10b9feee2d0dc81 Francois Dugast 2025-09-08  348  	    range->dev_private_ow=
ner) {
10b9feee2d0dc81 Francois Dugast 2025-09-08  349  		unsigned long cpu_flags =
=3D HMM_PFN_VALID |
10b9feee2d0dc81 Francois Dugast 2025-09-08  350  			hmm_pfn_flags_order(PMD=
_SHIFT - PAGE_SHIFT);
0ac881efe164685 Lorenzo Stoakes 2025-11-10  351  		unsigned long pfn =3D so=
ftleaf_to_pfn(entry);
10b9feee2d0dc81 Francois Dugast 2025-09-08  352  		unsigned long i;
10b9feee2d0dc81 Francois Dugast 2025-09-08  353 =20
0ac881efe164685 Lorenzo Stoakes 2025-11-10  354  		if (softleaf_is_device_p=
rivate_write(entry))
10b9feee2d0dc81 Francois Dugast 2025-09-08  355  			cpu_flags |=3D HMM_PFN_=
WRITE;
10b9feee2d0dc81 Francois Dugast 2025-09-08  356 =20
10b9feee2d0dc81 Francois Dugast 2025-09-08  357  		/*
10b9feee2d0dc81 Francois Dugast 2025-09-08  358  		 * Fully populate the PF=
N list though subsequent PFNs could be
10b9feee2d0dc81 Francois Dugast 2025-09-08  359  		 * inferred, because dri=
vers which are not yet aware of large
10b9feee2d0dc81 Francois Dugast 2025-09-08  360  		 * folios probably do no=
t support sparsely populated PFN lists.
10b9feee2d0dc81 Francois Dugast 2025-09-08  361  		 */
10b9feee2d0dc81 Francois Dugast 2025-09-08  362  		for (i =3D 0; addr < end=
; addr +=3D PAGE_SIZE, i++, pfn++) {
10b9feee2d0dc81 Francois Dugast 2025-09-08  363  			hmm_pfns[i] &=3D HMM_PF=
N_INOUT_FLAGS;
10b9feee2d0dc81 Francois Dugast 2025-09-08  364  			hmm_pfns[i] |=3D pfn | =
cpu_flags;
10b9feee2d0dc81 Francois Dugast 2025-09-08  365  		}
10b9feee2d0dc81 Francois Dugast 2025-09-08  366 =20
10b9feee2d0dc81 Francois Dugast 2025-09-08  367  		return 0;
10b9feee2d0dc81 Francois Dugast 2025-09-08  368  	}
10b9feee2d0dc81 Francois Dugast 2025-09-08  369 =20
10b9feee2d0dc81 Francois Dugast 2025-09-08  370  	required_fault =3D hmm_ra=
nge_need_fault(hmm_vma_walk, hmm_pfns,
10b9feee2d0dc81 Francois Dugast 2025-09-08  371  					      npages, 0);
10b9feee2d0dc81 Francois Dugast 2025-09-08  372  	if (required_fault) {
0ac881efe164685 Lorenzo Stoakes 2025-11-10  373  		if (softleaf_is_device_p=
rivate(entry))
10b9feee2d0dc81 Francois Dugast 2025-09-08  374  			return hmm_vma_fault(ad=
dr, end, required_fault, walk);
10b9feee2d0dc81 Francois Dugast 2025-09-08  375  		else
10b9feee2d0dc81 Francois Dugast 2025-09-08  376  			return -EFAULT;
10b9feee2d0dc81 Francois Dugast 2025-09-08  377  	}
10b9feee2d0dc81 Francois Dugast 2025-09-08  378 =20
10b9feee2d0dc81 Francois Dugast 2025-09-08  379  	return hmm_pfns_fill(star=
t, end, range, HMM_PFN_ERROR);
10b9feee2d0dc81 Francois Dugast 2025-09-08  380  }
10b9feee2d0dc81 Francois Dugast 2025-09-08  381  #else
10b9feee2d0dc81 Francois Dugast 2025-09-08  382  static int hmm_vma_handle_=
absent_pmd(struct mm_walk *walk, unsigned long start,
10b9feee2d0dc81 Francois Dugast 2025-09-08  383  				     unsigned long end=
, unsigned long *hmm_pfns,
10b9feee2d0dc81 Francois Dugast 2025-09-08  384  				     pmd_t pmd)
10b9feee2d0dc81 Francois Dugast 2025-09-08  385  {
10b9feee2d0dc81 Francois Dugast 2025-09-08  386  	struct hmm_vma_walk *hmm_=
vma_walk =3D walk->private;
10b9feee2d0dc81 Francois Dugast 2025-09-08  387  	struct hmm_range *range =
=3D hmm_vma_walk->range;
10b9feee2d0dc81 Francois Dugast 2025-09-08  388  	unsigned long npages =3D =
(end - start) >> PAGE_SHIFT;
10b9feee2d0dc81 Francois Dugast 2025-09-08  389 =20
10b9feee2d0dc81 Francois Dugast 2025-09-08  390  	if (hmm_range_need_fault(=
hmm_vma_walk, hmm_pfns, npages, 0))
10b9feee2d0dc81 Francois Dugast 2025-09-08  391  		return -EFAULT;
10b9feee2d0dc81 Francois Dugast 2025-09-08  392  	return hmm_pfns_fill(star=
t, end, range, HMM_PFN_ERROR);
10b9feee2d0dc81 Francois Dugast 2025-09-08  393  }
10b9feee2d0dc81 Francois Dugast 2025-09-08  394  #endif  /* CONFIG_ARCH_ENA=
BLE_THP_MIGRATION */
10b9feee2d0dc81 Francois Dugast 2025-09-08  395 =20
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  396  static int hmm_v=
ma_walk_pmd(pmd_t *pmdp,
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  397  			    unsigned =
long start,
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  398  			    unsigned =
long end,
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  399  			    struct mm=
_walk *walk)
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  400  {
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  401  	struct hmm_vma_=
walk *hmm_vma_walk =3D walk->private;
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  402  	struct hmm_rang=
e *range =3D hmm_vma_walk->range;
2733ea144dcce78 Jason Gunthorpe 2020-05-01  403  	unsigned long *hmm_pfns =
=3D
2733ea144dcce78 Jason Gunthorpe 2020-05-01  404  		&range->hmm_pfns[(start =
- range->start) >> PAGE_SHIFT];
2288a9a68175cec Jason Gunthorpe 2020-03-05  405  	unsigned long npages =3D =
(end - start) >> PAGE_SHIFT;
2288a9a68175cec Jason Gunthorpe 2020-03-05  406  	unsigned long addr =3D st=
art;
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  407  	pte_t *ptep;
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  408  	pmd_t pmd;
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  409 =20
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  410  again:
26e1a0c3277d7f4 Hugh Dickins    2023-06-08  411  	pmd =3D pmdp_get_lockless=
(pmdp);
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  412  	if (pmd_none(pm=
d))
b7a16c7ad790d0e Steven Price    2020-02-03  413  		return hmm_vma_walk_hole=
(start, end, -1, walk);
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  414 =20
0ac881efe164685 Lorenzo Stoakes 2025-11-10 @415  	if (thp_migration_support=
ed() && pmd_is_migration_entry(pmd)) {
2733ea144dcce78 Jason Gunthorpe 2020-05-01  416  		if (hmm_range_need_fault=
(hmm_vma_walk, hmm_pfns, npages, 0)) {
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  417  			hmm_vma_walk-=
>last =3D addr;
d2e8d551165ccb6 Ralph Campbell  2019-07-25  418  			pmd_migration_entry_wai=
t(walk->mm, pmdp);
73231612dc7c907 J=C3=A9r=C3=B4me Glisse   2019-05-13  419  			return -EBUSY;
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  420  		}
2733ea144dcce78 Jason Gunthorpe 2020-05-01  421  		return hmm_pfns_fill(sta=
rt, end, range, 0);
2288a9a68175cec Jason Gunthorpe 2020-03-05  422  	}
2288a9a68175cec Jason Gunthorpe 2020-03-05  423 =20
10b9feee2d0dc81 Francois Dugast 2025-09-08  424  	if (!pmd_present(pmd))
10b9feee2d0dc81 Francois Dugast 2025-09-08  425  		return hmm_vma_handle_ab=
sent_pmd(walk, start, end, hmm_pfns,
10b9feee2d0dc81 Francois Dugast 2025-09-08  426  						 pmd);
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  427 =20
8a6a984c2e0ea40 Alistair Popple 2025-06-19  428  	if (pmd_trans_huge(pmd)) {
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  429  		/*
d2e8d551165ccb6 Ralph Campbell  2019-07-25  430  		 * No need to take pmd_l=
ock here, even if some other thread
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  431  		 * is splittin=
g the huge pmd we will get that event through
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  432  		 * mmu_notifie=
r callback.
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  433  		 *
d2e8d551165ccb6 Ralph Campbell  2019-07-25  434  		 * So just read pmd valu=
e and check again it's a transparent
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  435  		 * huge or dev=
ice mapping one and compute corresponding pfn
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  436  		 * values.
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  437  		 */
dab6e717429e5ec Peter Zijlstra  2020-11-26  438  		pmd =3D pmdp_get_lockles=
s(pmdp);
8a6a984c2e0ea40 Alistair Popple 2025-06-19  439  		if (!pmd_trans_huge(pmd))
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  440  			goto again;
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  441 =20
2733ea144dcce78 Jason Gunthorpe 2020-05-01  442  		return hmm_vma_handle_pm=
d(walk, addr, end, hmm_pfns, pmd);
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  443  	}
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  444 =20
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  445  	/*
d2e8d551165ccb6 Ralph Campbell  2019-07-25  446  	 * We have handled all th=
e valid cases above ie either none, migration,
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  447  	 * huge or tran=
sparent huge. At this point either it is a valid pmd
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  448  	 * entry pointi=
ng to pte directory or it is a bad pmd that will not
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  449  	 * recover.
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  450  	 */
2288a9a68175cec Jason Gunthorpe 2020-03-05  451  	if (pmd_bad(pmd)) {
2733ea144dcce78 Jason Gunthorpe 2020-05-01  452  		if (hmm_range_need_fault=
(hmm_vma_walk, hmm_pfns, npages, 0))
2288a9a68175cec Jason Gunthorpe 2020-03-05  453  			return -EFAULT;
d28c2c9a487708b Ralph Campbell  2019-11-04  454  		return hmm_pfns_fill(sta=
rt, end, range, HMM_PFN_ERROR);
2288a9a68175cec Jason Gunthorpe 2020-03-05  455  	}
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  456 =20
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  457  	ptep =3D pte_of=
fset_map(pmdp, addr);
6ec1905f6ec7f9f Hugh Dickins    2023-06-08  458  	if (!ptep)
6ec1905f6ec7f9f Hugh Dickins    2023-06-08  459  		goto again;
2733ea144dcce78 Jason Gunthorpe 2020-05-01  460  	for (; addr < end; addr +=
=3D PAGE_SIZE, ptep++, hmm_pfns++) {
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  461  		int r;
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  462 =20
2733ea144dcce78 Jason Gunthorpe 2020-05-01  463  		r =3D hmm_vma_handle_pte=
(walk, addr, end, pmdp, ptep, hmm_pfns);
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  464  		if (r) {
dfdc22078f3f064 Jason Gunthorpe 2020-02-28  465  			/* hmm_vma_handle_pte()=
 did pte_unmap() */
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  466  			return r;
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  467  		}
da4c3c735ea4dcc J=C3=A9r=C3=B4me Glisse   2017-09-08  468  	}
da4c3c735ea4dcc J=C3=A9r=C3=B4me Glisse   2017-09-08  469  	pte_unmap(ptep =
- 1);
da4c3c735ea4dcc J=C3=A9r=C3=B4me Glisse   2017-09-08  470  	return 0;
da4c3c735ea4dcc J=C3=A9r=C3=B4me Glisse   2017-09-08  471  }
da4c3c735ea4dcc J=C3=A9r=C3=B4me Glisse   2017-09-08  472 =20

:::::: The code at line 252 was first introduced by commit
:::::: 68aa2fdbf57f769e552f472ddb762aba028a207e mm: introduce leaf entry ty=
pe and use to simplify leaf entry logic

:::::: TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
