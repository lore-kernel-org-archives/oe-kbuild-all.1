Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E70468C1B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 11:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786619660; cv=none; b=d+HqAraD4CJ0xgXt8y7JzxMAGL8ObZut9TzzeAD/yzUVLE8An/YL49mjd8pwaMcZQpgd0W7WkogSnA1tdXzMB2w30W3hS/kAKHcl2oYcfjdmXT5a+JHaRNFgT8BbKgpb++jdK7Uz6CSvbYdZeqNdZ5zhGu3UnqGcatvQi88Muig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786619660; c=relaxed/simple;
	bh=yS9LHmIJuNSVDc5u+XagqzT5942WDu5XKFdk+ZP830U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DE8L2AP3rN/c4l8AsOil0NbjS3NOukNXFFpnni8dhndVS5ysqDMfL+HDgrt0MfHZE7ZoBWFhJyAz/5Fxc4dWOWMM8SID7R/+ZP13kCrUWLG5chJgjS7bldJDa6ZTmKX3TsXpsqeC7mn5f7ubqJkcI9kOxk2GUm7Vkj9rsNcgYmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i4Hh89Wd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i4Hh89Wd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786619653; x=1818155653;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yS9LHmIJuNSVDc5u+XagqzT5942WDu5XKFdk+ZP830U=;
  b=i4Hh89Wd50axJ/LGC0sLJzRlHC4IXeqqaRIsHhCY5JCpvF3KmlSgnpRx
   Bj+UdlHXUUHo4cQZf91U9AYxVLmx52o7VD1a6LwLtDYvl9Wv1NMFWBPQ4
   Oj3wHySVZTJNm9fc3JJ+FBQAcTCPxVBd7pNayr+bbYWtUHaYVbfPKMkhR
   1gh8gEqdcKvNHJBoYjif5l9nMdWg7hug62fdoYxEFLvBhRDuQQwfV66t+
   jw/GgP7HFKn+qcXKfiF7L6PXs9YYUDlGxKp3o8/HxIkGRj3ntB86F1Hgy
   mYJjET5lo1mgqIxqGTPyB9s87fkt45hBBFdFAu65A+8jQnGSqMnJ7BKvp
   g==;
X-CSE-ConnectionGUID: vRKboAVoRF2iBFdcCHaYuA==
X-CSE-MsgGUID: GT4rixhaRIWcbq2dnHmUPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="109976330"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="109976330"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 04:14:10 -0700
X-CSE-ConnectionGUID: 8pzQgyHqQYiE4xfNWO3t0Q==
X-CSE-MsgGUID: JYX0XQywQ7WEjahtRdirQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="268184615"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Aug 2026 04:14:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuTNt-00000000Tna-3nWq;
	Thu, 13 Aug 2026 11:14:05 +0000
Date: Thu, 13 Aug 2026 19:14:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 1/1]
 mm/hmm.c:271:8: error: implicit declaration of function
 'softleaf_is_device_private_write'; did you mean 'folio_is_device_private'?
Message-ID: <202608131916.i8TzotHY-lkp@intel.com>
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
head:   7c6a4d07be4f08cc4ce6cdad429c9f390e7e47a2
commit: 82d9be76e213a0fb22f8f20586b020b6a91a5c01 [1/1] Merge 7203ca412fc8 (=
"Merge tag 'mm-stable-2025-12-03-21-26' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/akpm/mm") into android-mainline
config: arm-randconfig-003-20260813 (https://download.01.org/0day-ci/archiv=
e/20260813/202608131916.i8TzotHY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260813/202608131916.i8TzotHY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131916.i8TzotHY-lkp@i=
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
   mm/hmm.c:252:23: error: implicit declaration of function 'pte_is_uffd_wp=
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
   mm/hmm.c:267:7: error: implicit declaration of function 'softleaf_is_dev=
ice_private'; did you mean 'folio_is_device_private'? [-Werror=3Dimplicit-f=
unction-declaration]
      if (softleaf_is_device_private(entry) &&
          ^~~~~~~~~~~~~~~~~~~~~~~~~~
          folio_is_device_private
   mm/hmm.c:268:18: error: implicit declaration of function 'softleaf_to_pa=
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
>> mm/hmm.c:271:8: error: implicit declaration of function 'softleaf_is_dev=
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
   mm/hmm.c:282:7: error: implicit declaration of function 'softleaf_is_swa=
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
>> mm/hmm.c:291:7: error: implicit declaration of function 'softleaf_is_mig=
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
   mm/hmm.c:415:35: error: implicit declaration of function 'pmd_is_migrati=
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
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=3Dn] && CAN [=3Dy]
   Selected by [y]:
   - CAN [=3Dy] && NET [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=3Dy] && WIRELESS [=3Dn] && (CFG80211_WEXT [=3Dn] |=
| WIRELESS_EXT [=3Dy])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=3Dm] && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=3Dm] && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=3Dm] && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=3Dn] && CAN_DEV [=3Dy] && CAN_NETLINK [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=3Dm] && SND [=3Dn] && SND_JACK [=3Dy]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=3Dy] && WIRELESS [=3Dn] && PROC_FS [=3Dn] && WEXT_=
CORE [=3Dy]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=3Dm] && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=3Dy] && WIRELESS [=3Dn]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for HMM_MIRROR
   Depends on [n]: MMU [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=3Dy] && DRM [=3Dy]
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && MMU [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=3Dy] && DRM [=3Dy]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=3Dn] && MEMORY_BALLOON [=3Dy]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && MMU [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=3Dm] && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=3Dy] && WIRELESS [=3Dn]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]


vim +271 mm/hmm.c

2aee09d8c11642 J=C3=A9r=C3=B4me Glisse   2018-04-10  234 =20
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  235  static int hmm_vm=
a_handle_pte(struct mm_walk *walk, unsigned long addr,
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  236  			      unsigned=
 long end, pmd_t *pmdp, pte_t *ptep,
2733ea144dcce7 Jason Gunthorpe 2020-05-01  237  			      unsigned long *hmm=
_pfn)
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  238  {
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  239  	struct hmm_vma_w=
alk *hmm_vma_walk =3D walk->private;
f88a1e90c66540 J=C3=A9r=C3=B4me Glisse   2018-04-10  240  	struct hmm_range=
 *range =3D hmm_vma_walk->range;
a3eb13c1579ba9 Jason Gunthorpe 2020-03-27  241  	unsigned int required_faul=
t;
2733ea144dcce7 Jason Gunthorpe 2020-05-01  242  	unsigned long cpu_flags;
c33c794828f212 Ryan Roberts    2023-06-12  243  	pte_t pte =3D ptep_get(pte=
p);
2733ea144dcce7 Jason Gunthorpe 2020-05-01  244  	uint64_t pfn_req_flags =3D =
*hmm_pfn;
285e871884ff3d Leon Romanovsky 2025-04-28  245  	uint64_t new_pfn_flags =3D =
0;
da4c3c735ea4dc J=C3=A9r=C3=B4me Glisse   2017-09-08  246 =20
c093cf451094a9 Lorenzo Stoakes 2025-11-10  247  	/*
c093cf451094a9 Lorenzo Stoakes 2025-11-10  248  	 * Any other marker than a=
 UFFD WP marker will result in a fault error
c093cf451094a9 Lorenzo Stoakes 2025-11-10  249  	 * that will be correctly =
handled, so we need only check for UFFD WP
c093cf451094a9 Lorenzo Stoakes 2025-11-10  250  	 * here.
c093cf451094a9 Lorenzo Stoakes 2025-11-10  251  	 */
68aa2fdbf57f76 Lorenzo Stoakes 2025-11-10  252  	if (pte_none(pte) || pte_i=
s_uffd_wp_marker(pte)) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  253  		required_fault =3D
2733ea144dcce7 Jason Gunthorpe 2020-05-01  254  			hmm_pte_need_fault(hmm_v=
ma_walk, pfn_req_flags, 0);
a3eb13c1579ba9 Jason Gunthorpe 2020-03-27  255  		if (required_fault)
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  256  			goto fault;
285e871884ff3d Leon Romanovsky 2025-04-28  257  		goto out;
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  258  	}
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  259 =20
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  260  	if (!pte_present=
(pte)) {
9ff30bb9ab40b3 Lorenzo Stoakes 2025-11-10  261  		const softleaf_t entry =
=3D softleaf_from_pte(pte);
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  262 =20
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  263  		/*
8a295dbbaf7292 Ralph Campbell  2022-07-25  264  		 * Don't fault in device =
private pages owned by the caller,
8a295dbbaf7292 Ralph Campbell  2022-07-25  265  		 * just report the PFN.
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  266  		 */
9ff30bb9ab40b3 Lorenzo Stoakes 2025-11-10  267  		if (softleaf_is_device_pr=
ivate(entry) &&
9ff30bb9ab40b3 Lorenzo Stoakes 2025-11-10  268  		    page_pgmap(softleaf_t=
o_page(entry))->owner =3D=3D
8a295dbbaf7292 Ralph Campbell  2022-07-25  269  		    range->dev_private_ow=
ner) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  270  			cpu_flags =3D HMM_PFN_VA=
LID;
9ff30bb9ab40b3 Lorenzo Stoakes 2025-11-10 @271  			if (softleaf_is_device_p=
rivate_write(entry))
2733ea144dcce7 Jason Gunthorpe 2020-05-01  272  				cpu_flags |=3D HMM_PFN_=
WRITE;
93976a20345b4a Lorenzo Stoakes 2025-11-10  273  			new_pfn_flags =3D softle=
af_to_pfn(entry) | cpu_flags;
285e871884ff3d Leon Romanovsky 2025-04-28  274  			goto out;
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  275  		}
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  276 =20
2733ea144dcce7 Jason Gunthorpe 2020-05-01  277  		required_fault =3D
2733ea144dcce7 Jason Gunthorpe 2020-05-01  278  			hmm_pte_need_fault(hmm_v=
ma_walk, pfn_req_flags, 0);
285e871884ff3d Leon Romanovsky 2025-04-28  279  		if (!required_fault)
285e871884ff3d Leon Romanovsky 2025-04-28  280  			goto out;
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  281 =20
9ff30bb9ab40b3 Lorenzo Stoakes 2025-11-10  282  		if (softleaf_is_swap(entr=
y))
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  283  			goto fault;
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  284 =20
9ff30bb9ab40b3 Lorenzo Stoakes 2025-11-10  285  		if (softleaf_is_device_pr=
ivate(entry))
8a295dbbaf7292 Ralph Campbell  2022-07-25  286  			goto fault;
8a295dbbaf7292 Ralph Campbell  2022-07-25  287 =20
9ff30bb9ab40b3 Lorenzo Stoakes 2025-11-10  288  		if (softleaf_is_device_ex=
clusive(entry))
b756a3b5e7ead8 Alistair Popple 2021-06-30  289  			goto fault;
b756a3b5e7ead8 Alistair Popple 2021-06-30  290 =20
9ff30bb9ab40b3 Lorenzo Stoakes 2025-11-10 @291  		if (softleaf_is_migration=
(entry)) {
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  292  			pte_unmap(ptep=
);
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  293  			hmm_vma_walk->=
last =3D addr;
d2e8d551165ccb Ralph Campbell  2019-07-25  294  			migration_entry_wait(wal=
k->mm, pmdp, addr);
73231612dc7c90 J=C3=A9r=C3=B4me Glisse   2019-05-13  295  			return -EBUSY;
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  296  		}
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  297 =20
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  298  		/* Report error=
 for everything else */
dfdc22078f3f06 Jason Gunthorpe 2020-02-28  299  		pte_unmap(ptep);
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  300  		return -EFAULT;
da4c3c735ea4dc J=C3=A9r=C3=B4me Glisse   2017-09-08  301  	}
da4c3c735ea4dc J=C3=A9r=C3=B4me Glisse   2017-09-08  302 =20
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  303  	cpu_flags =3D pte_to_hmm_p=
fn_flags(range, pte);
2733ea144dcce7 Jason Gunthorpe 2020-05-01  304  	required_fault =3D
2733ea144dcce7 Jason Gunthorpe 2020-05-01  305  		hmm_pte_need_fault(hmm_vm=
a_walk, pfn_req_flags, cpu_flags);
a3eb13c1579ba9 Jason Gunthorpe 2020-03-27  306  	if (required_fault)
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  307  		goto fault;
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  308 =20
ac541f25037229 Ralph Campbell  2019-10-23  309  	/*
40550627492291 Jason Gunthorpe 2020-03-05  310  	 * Since each architecture=
 defines a struct page for the zero page, just
40550627492291 Jason Gunthorpe 2020-03-05  311  	 * fall through and treat =
it like a normal page.
ac541f25037229 Ralph Campbell  2019-10-23  312  	 */
87c01d57fa23de Alistair Popple 2022-01-14  313  	if (!vm_normal_page(walk->=
vma, addr, pte) &&
4b42fb213678d2 Li Zhijian      2021-09-08  314  	    !is_zero_pfn(pte_pfn(p=
te))) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  315  		if (hmm_pte_need_fault(hm=
m_vma_walk, pfn_req_flags, 0)) {
40550627492291 Jason Gunthorpe 2020-03-05  316  			pte_unmap(ptep);
40550627492291 Jason Gunthorpe 2020-03-05  317  			return -EFAULT;
40550627492291 Jason Gunthorpe 2020-03-05  318  		}
285e871884ff3d Leon Romanovsky 2025-04-28  319  		new_pfn_flags =3D HMM_PFN=
_ERROR;
285e871884ff3d Leon Romanovsky 2025-04-28  320  		goto out;
ac541f25037229 Ralph Campbell  2019-10-23  321  	}
992de9a8b75116 J=C3=A9r=C3=B4me Glisse   2019-05-13  322 =20
285e871884ff3d Leon Romanovsky 2025-04-28  323  	new_pfn_flags =3D pte_pfn(=
pte) | cpu_flags;
285e871884ff3d Leon Romanovsky 2025-04-28  324  out:
285e871884ff3d Leon Romanovsky 2025-04-28  325  	*hmm_pfn =3D (*hmm_pfn & H=
MM_PFN_INOUT_FLAGS) | new_pfn_flags;
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  326  	return 0;
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  327 =20
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  328  fault:
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  329  	pte_unmap(ptep);
5504ed29692faa J=C3=A9r=C3=B4me Glisse   2018-04-10  330  	/* Fault any vir=
tual address we were asked to fault */
a3eb13c1579ba9 Jason Gunthorpe 2020-03-27  331  	return hmm_vma_fault(addr,=
 end, required_fault, walk);
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  332  }
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  333 =20

:::::: The code at line 271 was first introduced by commit
:::::: 9ff30bb9ab40b34908eefd661f12f99aa00d04c3 mm: remove non_swap_entry()=
 and use softleaf helpers instead

:::::: TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
