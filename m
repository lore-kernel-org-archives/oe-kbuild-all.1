Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FED31326A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 01:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791335105; cv=none; b=aBkBr6OK6/iopqKA/d41JyAFk2E/Hyg2/paEqONnRo+p+hZJEVoboU+vLCn+fuP3s76xSDA7ThnCkQuizURZhY3ah9svsjQskgmjMbuTnfbCvPu/Py7W0Jnf6yYJL02n3ViJdV4Xyt5yaxTvqHQOOHE7nd8wF35cwp4Ic+j2Vro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791335105; c=relaxed/simple;
	bh=ONgcDDgfFZmgKYPLUM+GwAb6UCuoqLtY5VmJDKqf7iE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=io952JpoN/bTvbdFf8NXnJhSW64P4vwJFdhrsiBChb7QPNiW0J2+4ZlcwnDjRJH+8LYQaejNLEuPdTnIBPSqOu8fH+PJGS38exxgkXbFF0o5n7Z4J3ekU0wBd1MPazqdeOIWTIFLoI9DwcvzU1clzJR/IkseCWnonMTFTL9/2YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LxvquJdm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LxvquJdm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791335103; x=1822871103;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ONgcDDgfFZmgKYPLUM+GwAb6UCuoqLtY5VmJDKqf7iE=;
  b=LxvquJdmj/9laPQwO1HqWH0zzKtQLeL1Y1fFH9dX08lhx31aIKjEneom
   u3e0QgELETYWgyFvLxzQVUAcwh8XgmTWdL/GbW2ZhyMqbmpx14lSDh0a4
   gXCwBPtVOTOeI+RSHdu86u05u9g4m49kQ2TA3BXHcP/0AhKH/LNCX3RUF
   50JKfCnE96gfrYrvq4BWUAOLLTrBzVBrT7e7hqt+zmBrqMhgvdpoYZSSm
   qzKreoZ0QpB0BV8knh77bGKVR5lsdyef+aNmbvmPJXX9IcGsHkRmgTZge
   3CWinDEKk+2EsaeiuDqXkJUXtXUYXSdl9qoyChKSKfDQQyCN0LvkCzSus
   g==;
X-CSE-ConnectionGUID: wUJR4ccORQq/xoQehXpS5w==
X-CSE-MsgGUID: xI6izckUSTGA59fWjwnjmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="191238"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="191238"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 18:05:02 -0700
X-CSE-ConnectionGUID: ejmy9cwBSF2LQ70gaBW/Lg==
X-CSE-MsgGUID: 5TtytRsERLqdOXZY/CMz2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="315329615"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 06 Oct 2026 18:05:00 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEG5a-000000002BH-0EbK;
	Wed, 07 Oct 2026 01:04:58 +0000
Date: Wed, 07 Oct 2026 03:03:59 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 15/15] mm/hmm.c:230:51:
 error: implicit declaration of function 'pte_protnone'
Message-ID: <202610070241.FCGPaAeu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Vamsidhar,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   efe665b77332621017fded6de1496bfff20ae5c6
commit: ad36ecd6081db9827f1ebaa41671b0b336fd83bf [15/15] ANDROID: GKI: Enab=
le HMM_MIRROR config for all arch
config: arm-randconfig-r2309-20261006 (https://download.01.org/0day-ci/arch=
ive/20261007/202610070241.FCGPaAeu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261007/202610070241.FCGPaAeu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610070241.FCGPaAeu-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   mm/hmm.c: In function 'pte_to_hmm_pfn_flags':
   mm/hmm.c:230:13: error: implicit declaration of function 'pte_none'; did=
 you mean 'p4d_none'? [-Wimplicit-function-declaration]
     230 |         if (pte_none(pte) || !pte_present(pte) || pte_protnone(p=
te))
         |             ^~~~~~~~
         |             p4d_none
   mm/hmm.c:230:31: error: implicit declaration of function 'pte_present'; =
did you mean 'p4d_present'? [-Wimplicit-function-declaration]
     230 |         if (pte_none(pte) || !pte_present(pte) || pte_protnone(p=
te))
         |                               ^~~~~~~~~~~
         |                               p4d_present
>> mm/hmm.c:230:51: error: implicit declaration of function 'pte_protnone' =
[-Wimplicit-function-declaration]
     230 |         if (pte_none(pte) || !pte_present(pte) || pte_protnone(p=
te))
         |                                                   ^~~~~~~~~~~~
   mm/hmm.c:232:16: error: implicit declaration of function 'pte_write'; di=
d you mean 'pgd_write'? [-Wimplicit-function-declaration]
     232 |         return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) =
: HMM_PFN_VALID;
         |                ^~~~~~~~~
         |                pgd_write
   mm/hmm.c: In function 'hmm_vma_handle_pte':
>> mm/hmm.c:243:21: error: implicit declaration of function 'ptep_get' [-Wi=
mplicit-function-declaration]
     243 |         pte_t pte =3D ptep_get(ptep);
         |                     ^~~~~~~~
   mm/hmm.c:247:13: error: implicit declaration of function 'pte_none_mostl=
y' [-Wimplicit-function-declaration]
     247 |         if (pte_none_mostly(pte)) {
         |             ^~~~~~~~~~~~~~~
   mm/hmm.c:256:37: error: implicit declaration of function 'pte_to_swp_ent=
ry' [-Wimplicit-function-declaration]
     256 |                 swp_entry_t entry =3D pte_to_swp_entry(pte);
         |                                     ^~~~~~~~~~~~~~~~
>> mm/hmm.c:256:37: error: invalid initializer
   mm/hmm.c:262:21: error: implicit declaration of function 'is_device_priv=
ate_entry'; did you mean 'is_device_private_page'? [-Wimplicit-function-dec=
laration]
     262 |                 if (is_device_private_entry(entry) &&
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
         |                     is_device_private_page
   mm/hmm.c:263:32: error: implicit declaration of function 'pfn_swap_entry=
_to_page' [-Wimplicit-function-declaration]
     263 |                     page_pgmap(pfn_swap_entry_to_page(entry))->o=
wner =3D=3D
         |                                ^~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:263:32: error: passing argument 1 of 'page_pgmap' makes pointer=
 from integer without a cast [-Wint-conversion]
     263 |                     page_pgmap(pfn_swap_entry_to_page(entry))->o=
wner =3D=3D
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                |
         |                                int
   In file included from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/pagewalk.h:5,
                    from mm/hmm.c:11:
   include/linux/mmzone.h:1245:65: note: expected 'const struct page *' but=
 argument is of type 'int'
    1245 | static inline struct dev_pagemap *page_pgmap(const struct page *=
page)
         |                                              ~~~~~~~~~~~~~~~~~~~=
^~~~
   mm/hmm.c:266:29: error: implicit declaration of function 'is_writable_de=
vice_private_entry' [-Wimplicit-function-declaration]
     266 |                         if (is_writable_device_private_entry(ent=
ry))
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:268:41: error: implicit declaration of function 'swp_offset_pfn=
' [-Wimplicit-function-declaration]
     268 |                         new_pfn_flags =3D swp_offset_pfn(entry) =
| cpu_flags;
         |                                         ^~~~~~~~~~~~~~
   mm/hmm.c:277:22: error: implicit declaration of function 'non_swap_entry=
'; did you mean 'page_swap_entry'? [-Wimplicit-function-declaration]
     277 |                 if (!non_swap_entry(entry))
         |                      ^~~~~~~~~~~~~~
         |                      page_swap_entry
   mm/hmm.c:283:21: error: implicit declaration of function 'is_device_excl=
usive_entry' [-Wimplicit-function-declaration]
     283 |                 if (is_device_exclusive_entry(entry))
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:286:21: error: implicit declaration of function 'is_migration_e=
ntry' [-Wimplicit-function-declaration]
     286 |                 if (is_migration_entry(entry)) {
         |                     ^~~~~~~~~~~~~~~~~~
>> mm/hmm.c:287:25: error: implicit declaration of function 'pte_unmap'; di=
d you mean 'memunmap'? [-Wimplicit-function-declaration]
     287 |                         pte_unmap(ptep);
         |                         ^~~~~~~~~
         |                         memunmap
>> mm/hmm.c:289:25: error: implicit declaration of function 'migration_entr=
y_wait' [-Wimplicit-function-declaration]
     289 |                         migration_entry_wait(walk->mm, pmdp, add=
r);
         |                         ^~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:309:26: error: implicit declaration of function 'pte_pfn'; did =
you mean 'pud_pfn'? [-Wimplicit-function-declaration]
     309 |             !is_zero_pfn(pte_pfn(pte))) {
         |                          ^~~~~~~
         |                          pud_pfn
   mm/hmm.c: In function 'hmm_vma_walk_pmd':
>> mm/hmm.c:406:15: error: implicit declaration of function 'pmdp_get_lockl=
ess'; did you mean 'pmd_offset_lockless'? [-Wimplicit-function-declaration]
     406 |         pmd =3D pmdp_get_lockless(pmdp);
         |               ^~~~~~~~~~~~~~~~~
         |               pmd_offset_lockless
   mm/hmm.c:407:13: error: implicit declaration of function 'pmd_none'; did=
 you mean 'p4d_none'? [-Wimplicit-function-declaration]
     407 |         if (pmd_none(pmd))
         |             ^~~~~~~~
         |             p4d_none
   mm/hmm.c:410:42: error: implicit declaration of function 'is_pmd_migrati=
on_entry' [-Wimplicit-function-declaration]
     410 |         if (thp_migration_supported() && is_pmd_migration_entry(=
pmd)) {
         |                                          ^~~~~~~~~~~~~~~~~~~~~~
>> mm/hmm.c:413:25: error: implicit declaration of function 'pmd_migration_=
entry_wait' [-Wimplicit-function-declaration]
     413 |                         pmd_migration_entry_wait(walk->mm, pmdp);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:419:14: error: implicit declaration of function 'pmd_present'; =
did you mean 'p4d_present'? [-Wimplicit-function-declaration]
     419 |         if (!pmd_present(pmd))
         |              ^~~~~~~~~~~
         |              p4d_present
>> mm/hmm.c:423:13: error: implicit declaration of function 'pmd_trans_huge=
'; did you mean 'pmd_trans_huge_lock'? [-Wimplicit-function-declaration]
     423 |         if (pmd_trans_huge(pmd)) {
         |             ^~~~~~~~~~~~~~
         |             pmd_trans_huge_lock
   mm/hmm.c:446:13: error: implicit declaration of function 'pmd_bad'; did =
you mean 'p4d_bad'? [-Wimplicit-function-declaration]
     446 |         if (pmd_bad(pmd)) {
         |             ^~~~~~~
         |             p4d_bad
   mm/hmm.c: In function 'hmm_range_fault':
   mm/hmm.c:667:21: error: implicit declaration of function 'mmu_interval_c=
heck_retry' [-Wimplicit-function-declaration]
     667 |                 if (mmu_interval_check_retry(range->notifier,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && MMU [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=3Dy] && DRM [=3Dy]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && MMU [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=3Dy] && WIRELESS [=3Dy] && PROC_FS [=3Dn] && WEXT_=
CORE [=3Dy]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for HMM_MIRROR
   Depends on [n]: MMU [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=3Dy] && DRM [=3Dy]


vim +/pte_protnone +230 mm/hmm.c

da4c3c735ea4dcc J=C3=A9r=C3=B4me Glisse   2017-09-08  226 =20
2733ea144dcce78 Jason Gunthorpe 2020-05-01  227  static inline unsigned lon=
g pte_to_hmm_pfn_flags(struct hmm_range *range,
2733ea144dcce78 Jason Gunthorpe 2020-05-01  228  						 pte_t pte)
2aee09d8c116421 J=C3=A9r=C3=B4me Glisse   2018-04-10  229  {
789c2af88f24d1d Philip Yang     2019-05-23 @230  	if (pte_none(pte) || !pte=
_present(pte) || pte_protnone(pte))
2aee09d8c116421 J=C3=A9r=C3=B4me Glisse   2018-04-10  231  		return 0;
2733ea144dcce78 Jason Gunthorpe 2020-05-01  232  	return pte_write(pte) ? (=
HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALID;
2aee09d8c116421 J=C3=A9r=C3=B4me Glisse   2018-04-10  233  }
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
c33c794828f2121 Ryan Roberts    2023-06-12 @243  	pte_t pte =3D ptep_get(pt=
ep);
2733ea144dcce78 Jason Gunthorpe 2020-05-01  244  	uint64_t pfn_req_flags =
=3D *hmm_pfn;
285e871884ff3dc Leon Romanovsky 2025-04-28  245  	uint64_t new_pfn_flags =
=3D 0;
da4c3c735ea4dcc J=C3=A9r=C3=B4me Glisse   2017-09-08  246 =20
5c041f5d1f23d3a Peter Xu        2022-05-12  247  	if (pte_none_mostly(pte))=
 {
2733ea144dcce78 Jason Gunthorpe 2020-05-01  248  		required_fault =3D
2733ea144dcce78 Jason Gunthorpe 2020-05-01  249  			hmm_pte_need_fault(hmm_=
vma_walk, pfn_req_flags, 0);
a3eb13c1579ba97 Jason Gunthorpe 2020-03-27  250  		if (required_fault)
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  251  			goto fault;
285e871884ff3dc Leon Romanovsky 2025-04-28  252  		goto out;
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  253  	}
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  254 =20
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  255  	if (!pte_presen=
t(pte)) {
8d63e4cd62b2583 Ralph Campbell  2018-01-31 @256  		swp_entry_t entry =3D pt=
e_to_swp_entry(pte);
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  257 =20
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  258  		/*
8a295dbbaf7292c Ralph Campbell  2022-07-25  259  		 * Don't fault in device=
 private pages owned by the caller,
8a295dbbaf7292c Ralph Campbell  2022-07-25  260  		 * just report the PFN.
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  261  		 */
8a295dbbaf7292c Ralph Campbell  2022-07-25  262  		if (is_device_private_en=
try(entry) &&
82ba975e4c43d98 Alistair Popple 2025-02-28  263  		    page_pgmap(pfn_swap_=
entry_to_page(entry))->owner =3D=3D
8a295dbbaf7292c Ralph Campbell  2022-07-25  264  		    range->dev_private_o=
wner) {
2733ea144dcce78 Jason Gunthorpe 2020-05-01  265  			cpu_flags =3D HMM_PFN_V=
ALID;
4dd845b5a3e57ad Alistair Popple 2021-06-30  266  			if (is_writable_device_=
private_entry(entry))
2733ea144dcce78 Jason Gunthorpe 2020-05-01  267  				cpu_flags |=3D HMM_PFN=
_WRITE;
285e871884ff3dc Leon Romanovsky 2025-04-28  268  			new_pfn_flags =3D swp_o=
ffset_pfn(entry) | cpu_flags;
285e871884ff3dc Leon Romanovsky 2025-04-28  269  			goto out;
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  270  		}
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  271 =20
2733ea144dcce78 Jason Gunthorpe 2020-05-01  272  		required_fault =3D
2733ea144dcce78 Jason Gunthorpe 2020-05-01  273  			hmm_pte_need_fault(hmm_=
vma_walk, pfn_req_flags, 0);
285e871884ff3dc Leon Romanovsky 2025-04-28  274  		if (!required_fault)
285e871884ff3dc Leon Romanovsky 2025-04-28  275  			goto out;
76612d6ce4ccd21 Jason Gunthorpe 2020-02-28  276 =20
76612d6ce4ccd21 Jason Gunthorpe 2020-02-28  277  		if (!non_swap_entry(entr=
y))
76612d6ce4ccd21 Jason Gunthorpe 2020-02-28  278  			goto fault;
76612d6ce4ccd21 Jason Gunthorpe 2020-02-28  279 =20
8a295dbbaf7292c Ralph Campbell  2022-07-25  280  		if (is_device_private_en=
try(entry))
8a295dbbaf7292c Ralph Campbell  2022-07-25  281  			goto fault;
8a295dbbaf7292c Ralph Campbell  2022-07-25  282 =20
b756a3b5e7ead8f Alistair Popple 2021-06-30  283  		if (is_device_exclusive_=
entry(entry))
b756a3b5e7ead8f Alistair Popple 2021-06-30  284  			goto fault;
b756a3b5e7ead8f Alistair Popple 2021-06-30  285 =20
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  286  		if (is_migrati=
on_entry(entry)) {
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08 @287  			pte_unmap(pte=
p);
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  288  			hmm_vma_walk-=
>last =3D addr;
d2e8d551165ccb6 Ralph Campbell  2019-07-25 @289  			migration_entry_wait(wa=
lk->mm, pmdp, addr);
73231612dc7c907 J=C3=A9r=C3=B4me Glisse   2019-05-13  290  			return -EBUSY;
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  291  		}
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  292 =20
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  293  		/* Report erro=
r for everything else */
dfdc22078f3f064 Jason Gunthorpe 2020-02-28  294  		pte_unmap(ptep);
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  295  		return -EFAULT;
da4c3c735ea4dcc J=C3=A9r=C3=B4me Glisse   2017-09-08  296  	}
da4c3c735ea4dcc J=C3=A9r=C3=B4me Glisse   2017-09-08  297 =20
76612d6ce4ccd21 Jason Gunthorpe 2020-02-28  298  	cpu_flags =3D pte_to_hmm_=
pfn_flags(range, pte);
2733ea144dcce78 Jason Gunthorpe 2020-05-01  299  	required_fault =3D
2733ea144dcce78 Jason Gunthorpe 2020-05-01  300  		hmm_pte_need_fault(hmm_v=
ma_walk, pfn_req_flags, cpu_flags);
a3eb13c1579ba97 Jason Gunthorpe 2020-03-27  301  	if (required_fault)
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  302  		goto fault;
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  303 =20
ac541f250372294 Ralph Campbell  2019-10-23  304  	/*
405506274922910 Jason Gunthorpe 2020-03-05  305  	 * Since each architectur=
e defines a struct page for the zero page, just
405506274922910 Jason Gunthorpe 2020-03-05  306  	 * fall through and treat=
 it like a normal page.
ac541f250372294 Ralph Campbell  2019-10-23  307  	 */
87c01d57fa23de8 Alistair Popple 2022-01-14  308  	if (!vm_normal_page(walk-=
>vma, addr, pte) &&
4b42fb213678d2b Li Zhijian      2021-09-08  309  	    !is_zero_pfn(pte_pfn(=
pte))) {
2733ea144dcce78 Jason Gunthorpe 2020-05-01  310  		if (hmm_pte_need_fault(h=
mm_vma_walk, pfn_req_flags, 0)) {
405506274922910 Jason Gunthorpe 2020-03-05  311  			pte_unmap(ptep);
405506274922910 Jason Gunthorpe 2020-03-05  312  			return -EFAULT;
405506274922910 Jason Gunthorpe 2020-03-05  313  		}
285e871884ff3dc Leon Romanovsky 2025-04-28  314  		new_pfn_flags =3D HMM_PF=
N_ERROR;
285e871884ff3dc Leon Romanovsky 2025-04-28  315  		goto out;
ac541f250372294 Ralph Campbell  2019-10-23  316  	}
992de9a8b751167 J=C3=A9r=C3=B4me Glisse   2019-05-13  317 =20
285e871884ff3dc Leon Romanovsky 2025-04-28  318  	new_pfn_flags =3D pte_pfn=
(pte) | cpu_flags;
285e871884ff3dc Leon Romanovsky 2025-04-28  319  out:
285e871884ff3dc Leon Romanovsky 2025-04-28  320  	*hmm_pfn =3D (*hmm_pfn & =
HMM_PFN_INOUT_FLAGS) | new_pfn_flags;
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  321  	return 0;
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  322 =20
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  323  fault:
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  324  	pte_unmap(ptep);
5504ed29692faad J=C3=A9r=C3=B4me Glisse   2018-04-10  325  	/* Fault any vi=
rtual address we were asked to fault */
a3eb13c1579ba97 Jason Gunthorpe 2020-03-27  326  	return hmm_vma_fault(addr=
, end, required_fault, walk);
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  327  }
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  328 =20
10b9feee2d0dc81 Francois Dugast 2025-09-08  329  #ifdef CONFIG_ARCH_ENABLE_=
THP_MIGRATION
10b9feee2d0dc81 Francois Dugast 2025-09-08  330  static int hmm_vma_handle_=
absent_pmd(struct mm_walk *walk, unsigned long start,
10b9feee2d0dc81 Francois Dugast 2025-09-08  331  				     unsigned long end=
, unsigned long *hmm_pfns,
10b9feee2d0dc81 Francois Dugast 2025-09-08  332  				     pmd_t pmd)
10b9feee2d0dc81 Francois Dugast 2025-09-08  333  {
10b9feee2d0dc81 Francois Dugast 2025-09-08  334  	struct hmm_vma_walk *hmm_=
vma_walk =3D walk->private;
10b9feee2d0dc81 Francois Dugast 2025-09-08  335  	struct hmm_range *range =
=3D hmm_vma_walk->range;
10b9feee2d0dc81 Francois Dugast 2025-09-08  336  	unsigned long npages =3D =
(end - start) >> PAGE_SHIFT;
10b9feee2d0dc81 Francois Dugast 2025-09-08  337  	unsigned long addr =3D st=
art;
10b9feee2d0dc81 Francois Dugast 2025-09-08  338  	swp_entry_t entry =3D pmd=
_to_swp_entry(pmd);
10b9feee2d0dc81 Francois Dugast 2025-09-08  339  	unsigned int required_fau=
lt;
10b9feee2d0dc81 Francois Dugast 2025-09-08  340 =20
10b9feee2d0dc81 Francois Dugast 2025-09-08  341  	if (is_device_private_ent=
ry(entry) &&
10b9feee2d0dc81 Francois Dugast 2025-09-08  342  	    pfn_swap_entry_folio(=
entry)->pgmap->owner =3D=3D
10b9feee2d0dc81 Francois Dugast 2025-09-08  343  	    range->dev_private_ow=
ner) {
10b9feee2d0dc81 Francois Dugast 2025-09-08  344  		unsigned long cpu_flags =
=3D HMM_PFN_VALID |
10b9feee2d0dc81 Francois Dugast 2025-09-08  345  			hmm_pfn_flags_order(PMD=
_SHIFT - PAGE_SHIFT);
10b9feee2d0dc81 Francois Dugast 2025-09-08  346  		unsigned long pfn =3D sw=
p_offset_pfn(entry);
10b9feee2d0dc81 Francois Dugast 2025-09-08  347  		unsigned long i;
10b9feee2d0dc81 Francois Dugast 2025-09-08  348 =20
10b9feee2d0dc81 Francois Dugast 2025-09-08  349  		if (is_writable_device_p=
rivate_entry(entry))
10b9feee2d0dc81 Francois Dugast 2025-09-08  350  			cpu_flags |=3D HMM_PFN_=
WRITE;
10b9feee2d0dc81 Francois Dugast 2025-09-08  351 =20
10b9feee2d0dc81 Francois Dugast 2025-09-08  352  		/*
10b9feee2d0dc81 Francois Dugast 2025-09-08  353  		 * Fully populate the PF=
N list though subsequent PFNs could be
10b9feee2d0dc81 Francois Dugast 2025-09-08  354  		 * inferred, because dri=
vers which are not yet aware of large
10b9feee2d0dc81 Francois Dugast 2025-09-08  355  		 * folios probably do no=
t support sparsely populated PFN lists.
10b9feee2d0dc81 Francois Dugast 2025-09-08  356  		 */
10b9feee2d0dc81 Francois Dugast 2025-09-08  357  		for (i =3D 0; addr < end=
; addr +=3D PAGE_SIZE, i++, pfn++) {
10b9feee2d0dc81 Francois Dugast 2025-09-08  358  			hmm_pfns[i] &=3D HMM_PF=
N_INOUT_FLAGS;
10b9feee2d0dc81 Francois Dugast 2025-09-08  359  			hmm_pfns[i] |=3D pfn | =
cpu_flags;
10b9feee2d0dc81 Francois Dugast 2025-09-08  360  		}
10b9feee2d0dc81 Francois Dugast 2025-09-08  361 =20
10b9feee2d0dc81 Francois Dugast 2025-09-08  362  		return 0;
10b9feee2d0dc81 Francois Dugast 2025-09-08  363  	}
10b9feee2d0dc81 Francois Dugast 2025-09-08  364 =20
10b9feee2d0dc81 Francois Dugast 2025-09-08  365  	required_fault =3D hmm_ra=
nge_need_fault(hmm_vma_walk, hmm_pfns,
10b9feee2d0dc81 Francois Dugast 2025-09-08  366  					      npages, 0);
10b9feee2d0dc81 Francois Dugast 2025-09-08  367  	if (required_fault) {
10b9feee2d0dc81 Francois Dugast 2025-09-08  368  		if (is_device_private_en=
try(entry))
10b9feee2d0dc81 Francois Dugast 2025-09-08  369  			return hmm_vma_fault(ad=
dr, end, required_fault, walk);
10b9feee2d0dc81 Francois Dugast 2025-09-08  370  		else
10b9feee2d0dc81 Francois Dugast 2025-09-08  371  			return -EFAULT;
10b9feee2d0dc81 Francois Dugast 2025-09-08  372  	}
10b9feee2d0dc81 Francois Dugast 2025-09-08  373 =20
10b9feee2d0dc81 Francois Dugast 2025-09-08  374  	return hmm_pfns_fill(star=
t, end, range, HMM_PFN_ERROR);
10b9feee2d0dc81 Francois Dugast 2025-09-08  375  }
10b9feee2d0dc81 Francois Dugast 2025-09-08  376  #else
10b9feee2d0dc81 Francois Dugast 2025-09-08  377  static int hmm_vma_handle_=
absent_pmd(struct mm_walk *walk, unsigned long start,
10b9feee2d0dc81 Francois Dugast 2025-09-08  378  				     unsigned long end=
, unsigned long *hmm_pfns,
10b9feee2d0dc81 Francois Dugast 2025-09-08  379  				     pmd_t pmd)
10b9feee2d0dc81 Francois Dugast 2025-09-08  380  {
10b9feee2d0dc81 Francois Dugast 2025-09-08  381  	struct hmm_vma_walk *hmm_=
vma_walk =3D walk->private;
10b9feee2d0dc81 Francois Dugast 2025-09-08  382  	struct hmm_range *range =
=3D hmm_vma_walk->range;
10b9feee2d0dc81 Francois Dugast 2025-09-08  383  	unsigned long npages =3D =
(end - start) >> PAGE_SHIFT;
10b9feee2d0dc81 Francois Dugast 2025-09-08  384 =20
10b9feee2d0dc81 Francois Dugast 2025-09-08  385  	if (hmm_range_need_fault(=
hmm_vma_walk, hmm_pfns, npages, 0))
10b9feee2d0dc81 Francois Dugast 2025-09-08  386  		return -EFAULT;
10b9feee2d0dc81 Francois Dugast 2025-09-08  387  	return hmm_pfns_fill(star=
t, end, range, HMM_PFN_ERROR);
10b9feee2d0dc81 Francois Dugast 2025-09-08  388  }
10b9feee2d0dc81 Francois Dugast 2025-09-08  389  #endif  /* CONFIG_ARCH_ENA=
BLE_THP_MIGRATION */
10b9feee2d0dc81 Francois Dugast 2025-09-08  390 =20
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  391  static int hmm_v=
ma_walk_pmd(pmd_t *pmdp,
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  392  			    unsigned =
long start,
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  393  			    unsigned =
long end,
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  394  			    struct mm=
_walk *walk)
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  395  {
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  396  	struct hmm_vma_=
walk *hmm_vma_walk =3D walk->private;
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  397  	struct hmm_rang=
e *range =3D hmm_vma_walk->range;
2733ea144dcce78 Jason Gunthorpe 2020-05-01  398  	unsigned long *hmm_pfns =
=3D
2733ea144dcce78 Jason Gunthorpe 2020-05-01  399  		&range->hmm_pfns[(start =
- range->start) >> PAGE_SHIFT];
2288a9a68175cec Jason Gunthorpe 2020-03-05  400  	unsigned long npages =3D =
(end - start) >> PAGE_SHIFT;
2288a9a68175cec Jason Gunthorpe 2020-03-05  401  	unsigned long addr =3D st=
art;
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  402  	pte_t *ptep;
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  403  	pmd_t pmd;
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  404 =20
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  405  again:
26e1a0c3277d7f4 Hugh Dickins    2023-06-08 @406  	pmd =3D pmdp_get_lockless=
(pmdp);
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  407  	if (pmd_none(pm=
d))
b7a16c7ad790d0e Steven Price    2020-02-03  408  		return hmm_vma_walk_hole=
(start, end, -1, walk);
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  409 =20
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  410  	if (thp_migrati=
on_supported() && is_pmd_migration_entry(pmd)) {
2733ea144dcce78 Jason Gunthorpe 2020-05-01  411  		if (hmm_range_need_fault=
(hmm_vma_walk, hmm_pfns, npages, 0)) {
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  412  			hmm_vma_walk-=
>last =3D addr;
d2e8d551165ccb6 Ralph Campbell  2019-07-25 @413  			pmd_migration_entry_wai=
t(walk->mm, pmdp);
73231612dc7c907 J=C3=A9r=C3=B4me Glisse   2019-05-13  414  			return -EBUSY;
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  415  		}
2733ea144dcce78 Jason Gunthorpe 2020-05-01  416  		return hmm_pfns_fill(sta=
rt, end, range, 0);
2288a9a68175cec Jason Gunthorpe 2020-03-05  417  	}
2288a9a68175cec Jason Gunthorpe 2020-03-05  418 =20
10b9feee2d0dc81 Francois Dugast 2025-09-08  419  	if (!pmd_present(pmd))
10b9feee2d0dc81 Francois Dugast 2025-09-08  420  		return hmm_vma_handle_ab=
sent_pmd(walk, start, end, hmm_pfns,
10b9feee2d0dc81 Francois Dugast 2025-09-08  421  						 pmd);
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  422 =20
8a6a984c2e0ea40 Alistair Popple 2025-06-19 @423  	if (pmd_trans_huge(pmd)) {
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  424  		/*
d2e8d551165ccb6 Ralph Campbell  2019-07-25  425  		 * No need to take pmd_l=
ock here, even if some other thread
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  426  		 * is splittin=
g the huge pmd we will get that event through
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  427  		 * mmu_notifie=
r callback.
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  428  		 *
d2e8d551165ccb6 Ralph Campbell  2019-07-25  429  		 * So just read pmd valu=
e and check again it's a transparent
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  430  		 * huge or dev=
ice mapping one and compute corresponding pfn
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  431  		 * values.
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  432  		 */
dab6e717429e5ec Peter Zijlstra  2020-11-26  433  		pmd =3D pmdp_get_lockles=
s(pmdp);
8a6a984c2e0ea40 Alistair Popple 2025-06-19  434  		if (!pmd_trans_huge(pmd))
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  435  			goto again;
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  436 =20
2733ea144dcce78 Jason Gunthorpe 2020-05-01  437  		return hmm_vma_handle_pm=
d(walk, addr, end, hmm_pfns, pmd);
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  438  	}
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  439 =20
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  440  	/*
d2e8d551165ccb6 Ralph Campbell  2019-07-25  441  	 * We have handled all th=
e valid cases above ie either none, migration,
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  442  	 * huge or tran=
sparent huge. At this point either it is a valid pmd
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  443  	 * entry pointi=
ng to pte directory or it is a bad pmd that will not
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  444  	 * recover.
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  445  	 */
2288a9a68175cec Jason Gunthorpe 2020-03-05  446  	if (pmd_bad(pmd)) {
2733ea144dcce78 Jason Gunthorpe 2020-05-01  447  		if (hmm_range_need_fault=
(hmm_vma_walk, hmm_pfns, npages, 0))
2288a9a68175cec Jason Gunthorpe 2020-03-05  448  			return -EFAULT;
d28c2c9a487708b Ralph Campbell  2019-11-04  449  		return hmm_pfns_fill(sta=
rt, end, range, HMM_PFN_ERROR);
2288a9a68175cec Jason Gunthorpe 2020-03-05  450  	}
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  451 =20
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  452  	ptep =3D pte_of=
fset_map(pmdp, addr);
6ec1905f6ec7f9f Hugh Dickins    2023-06-08  453  	if (!ptep)
6ec1905f6ec7f9f Hugh Dickins    2023-06-08  454  		goto again;
2733ea144dcce78 Jason Gunthorpe 2020-05-01  455  	for (; addr < end; addr +=
=3D PAGE_SIZE, ptep++, hmm_pfns++) {
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  456  		int r;
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  457 =20
2733ea144dcce78 Jason Gunthorpe 2020-05-01  458  		r =3D hmm_vma_handle_pte=
(walk, addr, end, pmdp, ptep, hmm_pfns);
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  459  		if (r) {
dfdc22078f3f064 Jason Gunthorpe 2020-02-28  460  			/* hmm_vma_handle_pte()=
 did pte_unmap() */
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  461  			return r;
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  462  		}
da4c3c735ea4dcc J=C3=A9r=C3=B4me Glisse   2017-09-08  463  	}
da4c3c735ea4dcc J=C3=A9r=C3=B4me Glisse   2017-09-08  464  	pte_unmap(ptep =
- 1);
da4c3c735ea4dcc J=C3=A9r=C3=B4me Glisse   2017-09-08  465  	return 0;
da4c3c735ea4dcc J=C3=A9r=C3=B4me Glisse   2017-09-08  466  }
da4c3c735ea4dcc J=C3=A9r=C3=B4me Glisse   2017-09-08  467 =20

:::::: The code at line 230 was first introduced by commit
:::::: 789c2af88f24d1db983aae49b5c4561e6e02ff5b mm/hmm: support automatic N=
UMA balancing

:::::: TO: Philip Yang <Philip.Yang@amd.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
