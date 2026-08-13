Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB672E2EEE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 01:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786586111; cv=none; b=ggzddwu6/zUlOirKMBinVR2FNQ3o2nSmVM891DbJXesxqlW68zT9y8pMaSF+bXC/MSJ/Y/GV5+lBhaG8UgFHmqwF59CbM82p981y8obClGyc3kUibnLqza9B821Z9mlZdAefI6QGsfn3851mzvq4NEB6qSatpjhZh6uR0kRqCGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786586111; c=relaxed/simple;
	bh=sgXTnGFwVWJAIVOgPg/LLpJHDlX+2rQqvaUzVWppjlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=e3UYWCxnsIv9HgTJYxaB2l5qnGH+9hln3dRBu/Pp17mmPt137kIznC6AZzmPxxggJ9pbFXLLqbmJEokm1rr8g0PKQofCyklx3s0BUAgkUm4E5LBXnnYQrGUSuT07BTm2FVGPZTQWBqSCIcxl7OJY3OtLac8uOYFuDoVYTThUgLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejA4zrBk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejA4zrBk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786586109; x=1818122109;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sgXTnGFwVWJAIVOgPg/LLpJHDlX+2rQqvaUzVWppjlM=;
  b=ejA4zrBk1EKLo5WjeU3aZnaaqdiq70ltZV8jaS4WsdklR+mLWbVH63Wp
   zNxRHjgX0aTRiabyTE6vZWrwTogUYDs0LTmYDgKTDQ9laxCHgHjaGFSRg
   kyR/Y3QC0EssV5ranIo5YdMuOoqCz8BjOrHyhGj79iwRECgyIlghxLNpB
   u7xShuTGgMKpW+YuAQN7qNMxrEe2VfmMpDl49tdlK9P3SEKmrh+KYnSvN
   +rZQ+u4msoDvmP+mdoLGmJcCWzG3u65n5/045d58sJ8vZHKnwOuC3PUci
   bfGN0bmX+OFo9DBdiWxqtWa2fSnFEmcnXLoP7gAFl8KV6sp6coBVtI5Wo
   Q==;
X-CSE-ConnectionGUID: i6bT3Zy4Q2eIcyWy+6iWeg==
X-CSE-MsgGUID: QmUcr/zaQFiTG1V3hbDbWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98669855"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="98669855"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 18:55:06 -0700
X-CSE-ConnectionGUID: 6sKNDrxTQSCbwiFUyOLv6A==
X-CSE-MsgGUID: 8WAF78dmQHeKOPewk0Ka0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="259981058"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Aug 2026 18:55:05 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuKes-00000000SRG-33ms;
	Thu, 13 Aug 2026 01:55:02 +0000
Date: Thu, 13 Aug 2026 09:54:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-kminext 1/1] mm/hmm.c:256:23:
 error: implicit declaration of function 'pte_to_swp_entry'; did you mean
 'page_swap_entry'?
Message-ID: <202608130925.rPdPazaf-lkp@intel.com>
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

First bad commit (maybe !=3D root cause):

tree:   https://android.googlesource.com/kernel/common android17-6.18-kmine=
xt
head:   10f6d538c651ab6dd44bb8679c8e2d6522f13a68
commit: ad36ecd6081db9827f1ebaa41671b0b336fd83bf [1/1] ANDROID: GKI: Enable=
 HMM_MIRROR config for all arch
config: arm-randconfig-003-20260813 (https://download.01.org/0day-ci/archiv=
e/20260813/202608130925.rPdPazaf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260813/202608130925.rPdPazaf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130925.rPdPazaf-lkp@i=
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
   mm/hmm.c:247:6: error: implicit declaration of function 'pte_none_mostly=
'; did you mean 'pte_soft_dirty'? [-Werror=3Dimplicit-function-declaration]
     if (pte_none_mostly(pte)) {
         ^~~~~~~~~~~~~~~
         pte_soft_dirty
>> mm/hmm.c:256:23: error: implicit declaration of function 'pte_to_swp_ent=
ry'; did you mean 'page_swap_entry'? [-Werror=3Dimplicit-function-declarati=
on]
      swp_entry_t entry =3D pte_to_swp_entry(pte);
                          ^~~~~~~~~~~~~~~~
                          page_swap_entry
   mm/hmm.c:256:23: error: invalid initializer
   mm/hmm.c:262:7: error: implicit declaration of function 'is_device_priva=
te_entry'; did you mean 'is_device_private_page'? [-Werror=3Dimplicit-funct=
ion-declaration]
      if (is_device_private_entry(entry) &&
          ^~~~~~~~~~~~~~~~~~~~~~~
          is_device_private_page
>> mm/hmm.c:263:18: error: implicit declaration of function 'pfn_swap_entry=
_to_page'; did you mean 'swap_entry_swapped'? [-Werror=3Dimplicit-function-=
declaration]
          page_pgmap(pfn_swap_entry_to_page(entry))->owner =3D=3D
                     ^~~~~~~~~~~~~~~~~~~~~~
                     swap_entry_swapped
   mm/hmm.c:263:18: warning: passing argument 1 of 'page_pgmap' makes point=
er from integer without a cast [-Wint-conversion]
          page_pgmap(pfn_swap_entry_to_page(entry))->owner =3D=3D
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/pagewalk.h:5,
                    from mm/hmm.c:11:
   include/linux/mmzone.h:1245:65: note: expected 'const struct page *' but=
 argument is of type 'int'
    static inline struct dev_pagemap *page_pgmap(const struct page *page)
                                                 ~~~~~~~~~~~~~~~~~~~^~~~
   mm/hmm.c:266:8: error: implicit declaration of function 'is_writable_dev=
ice_private_entry'; did you mean 'is_device_private_page'? [-Werror=3Dimpli=
cit-function-declaration]
       if (is_writable_device_private_entry(entry))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           is_device_private_page
   mm/hmm.c:268:20: error: implicit declaration of function 'swp_offset_pfn=
'; did you mean 'pte_offset_map'? [-Werror=3Dimplicit-function-declaration]
       new_pfn_flags =3D swp_offset_pfn(entry) | cpu_flags;
                       ^~~~~~~~~~~~~~
                       pte_offset_map
>> mm/hmm.c:277:8: error: implicit declaration of function 'non_swap_entry'=
; did you mean 'page_swap_entry'? [-Werror=3Dimplicit-function-declaration]
      if (!non_swap_entry(entry))
           ^~~~~~~~~~~~~~
           page_swap_entry
>> mm/hmm.c:283:7: error: implicit declaration of function 'is_device_exclu=
sive_entry'; did you mean 'wait_event_exclusive_cmd'? [-Werror=3Dimplicit-f=
unction-declaration]
      if (is_device_exclusive_entry(entry))
          ^~~~~~~~~~~~~~~~~~~~~~~~~
          wait_event_exclusive_cmd
   mm/hmm.c:286:7: error: implicit declaration of function 'is_migration_en=
try'; did you mean 'list_first_entry'? [-Werror=3Dimplicit-function-declara=
tion]
      if (is_migration_entry(entry)) {
          ^~~~~~~~~~~~~~~~~~
          list_first_entry
   mm/hmm.c:287:4: error: implicit declaration of function 'pte_unmap'; did=
 you mean 'memunmap'? [-Werror=3Dimplicit-function-declaration]
       pte_unmap(ptep);
       ^~~~~~~~~
       memunmap
   mm/hmm.c:289:4: error: implicit declaration of function 'migration_entry=
_wait'; did you mean 'memalloc_retry_wait'? [-Werror=3Dimplicit-function-de=
claration]
       migration_entry_wait(walk->mm, pmdp, addr);
       ^~~~~~~~~~~~~~~~~~~~
       memalloc_retry_wait
>> mm/hmm.c:309:19: error: implicit declaration of function 'pte_pfn'; did =
you mean 'pud_pfn'? [-Werror=3Dimplicit-function-declaration]
         !is_zero_pfn(pte_pfn(pte))) {
                      ^~~~~~~
                      pud_pfn
   mm/hmm.c: In function 'hmm_vma_walk_pmd':
   mm/hmm.c:406:8: error: implicit declaration of function 'pmdp_get_lockle=
ss'; did you mean 'pmd_offset_lockless'? [-Werror=3Dimplicit-function-decla=
ration]
     pmd =3D pmdp_get_lockless(pmdp);
           ^~~~~~~~~~~~~~~~~
           pmd_offset_lockless
>> mm/hmm.c:407:6: error: implicit declaration of function 'pmd_none'; did =
you mean 'p4d_none'? [-Werror=3Dimplicit-function-declaration]
     if (pmd_none(pmd))
         ^~~~~~~~
         p4d_none
   mm/hmm.c:410:35: error: implicit declaration of function 'is_pmd_migrati=
on_entry'; did you mean 'list_first_entry'? [-Werror=3Dimplicit-function-de=
claration]
     if (thp_migration_supported() && is_pmd_migration_entry(pmd)) {
                                      ^~~~~~~~~~~~~~~~~~~~~~
                                      list_first_entry
   mm/hmm.c:413:4: error: implicit declaration of function 'pmd_migration_e=
ntry_wait'; did you mean 'memalloc_retry_wait'? [-Werror=3Dimplicit-functio=
n-declaration]
       pmd_migration_entry_wait(walk->mm, pmdp);
       ^~~~~~~~~~~~~~~~~~~~~~~~
       memalloc_retry_wait
>> mm/hmm.c:419:7: error: implicit declaration of function 'pmd_present'; d=
id you mean 'p4d_present'? [-Werror=3Dimplicit-function-declaration]
     if (!pmd_present(pmd))
          ^~~~~~~~~~~
          p4d_present
   mm/hmm.c:423:6: error: implicit declaration of function 'pmd_trans_huge'=
; did you mean 'pmd_trans_huge_lock'? [-Werror=3Dimplicit-function-declarat=
ion]
     if (pmd_trans_huge(pmd)) {
         ^~~~~~~~~~~~~~
         pmd_trans_huge_lock
   mm/hmm.c:446:6: error: implicit declaration of function 'pmd_bad'; did y=
ou mean 'p4d_bad'? [-Werror=3Dimplicit-function-declaration]
     if (pmd_bad(pmd)) {
         ^~~~~~~
         p4d_bad
   mm/hmm.c: In function 'hmm_range_fault':
   mm/hmm.c:667:7: error: implicit declaration of function 'mmu_interval_ch=
eck_retry'; did you mean 'vma_interval_tree_remove'? [-Werror=3Dimplicit-fu=
nction-declaration]
      if (mmu_interval_check_retry(range->notifier,
          ^~~~~~~~~~~~~~~~~~~~~~~~
          vma_interval_tree_remove
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=3Dy]
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
   Depends on [n]: NETDEVICES [=3Dn] && CAN_DEV [=3Dn] && CAN_NETLINK [=3Dn]
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
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=3Dy] && WIRELESS [=3Dn] && (CFG80211_WEXT [=3Dn] |=
| WIRELESS_EXT [=3Dy])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]


vim +256 mm/hmm.c

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
82ba975e4c43d98 Alistair Popple 2025-02-28 @263  		    page_pgmap(pfn_swap_=
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
76612d6ce4ccd21 Jason Gunthorpe 2020-02-28 @277  		if (!non_swap_entry(entr=
y))
76612d6ce4ccd21 Jason Gunthorpe 2020-02-28  278  			goto fault;
76612d6ce4ccd21 Jason Gunthorpe 2020-02-28  279 =20
8a295dbbaf7292c Ralph Campbell  2022-07-25  280  		if (is_device_private_en=
try(entry))
8a295dbbaf7292c Ralph Campbell  2022-07-25  281  			goto fault;
8a295dbbaf7292c Ralph Campbell  2022-07-25  282 =20
b756a3b5e7ead8f Alistair Popple 2021-06-30 @283  		if (is_device_exclusive_=
entry(entry))
b756a3b5e7ead8f Alistair Popple 2021-06-30  284  			goto fault;
b756a3b5e7ead8f Alistair Popple 2021-06-30  285 =20
53f5c3f489ecddc J=C3=A9r=C3=B4me Glisse   2018-04-10  286  		if (is_migrati=
on_entry(entry)) {
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  287  			pte_unmap(pte=
p);
74eee180b935fcb J=C3=A9r=C3=B4me Glisse   2017-09-08  288  			hmm_vma_walk-=
>last =3D addr;
d2e8d551165ccb6 Ralph Campbell  2019-07-25  289  			migration_entry_wait(wa=
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
4b42fb213678d2b Li Zhijian      2021-09-08 @309  	    !is_zero_pfn(pte_pfn(=
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
26e1a0c3277d7f4 Hugh Dickins    2023-06-08  406  	pmd =3D pmdp_get_lockless=
(pmdp);
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30 @407  	if (pmd_none(pm=
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
d2e8d551165ccb6 Ralph Campbell  2019-07-25  413  			pmd_migration_entry_wai=
t(walk->mm, pmdp);
73231612dc7c907 J=C3=A9r=C3=B4me Glisse   2019-05-13  414  			return -EBUSY;
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  415  		}
2733ea144dcce78 Jason Gunthorpe 2020-05-01  416  		return hmm_pfns_fill(sta=
rt, end, range, 0);
2288a9a68175cec Jason Gunthorpe 2020-03-05  417  	}
2288a9a68175cec Jason Gunthorpe 2020-03-05  418 =20
10b9feee2d0dc81 Francois Dugast 2025-09-08 @419  	if (!pmd_present(pmd))
10b9feee2d0dc81 Francois Dugast 2025-09-08  420  		return hmm_vma_handle_ab=
sent_pmd(walk, start, end, hmm_pfns,
10b9feee2d0dc81 Francois Dugast 2025-09-08  421  						 pmd);
d08faca018c4618 J=C3=A9r=C3=B4me Glisse   2018-10-30  422 =20
8a6a984c2e0ea40 Alistair Popple 2025-06-19  423  	if (pmd_trans_huge(pmd)) {
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

:::::: The code at line 256 was first introduced by commit
:::::: 8d63e4cd62b2583c7efe64f2ede406b3f44983f6 mm/hmm: fix uninitialized u=
se of 'entry' in hmm_vma_walk_pmd()

:::::: TO: Ralph Campbell <rcampbell@nvidia.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
