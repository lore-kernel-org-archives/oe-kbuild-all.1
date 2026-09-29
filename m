Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82D93F6619
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 05:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661217; cv=none; b=qmCXMqTShZ68UdyZARAB/pmHm112RLLVYGsmCLpg4dV7f0jECB3eul9ghp47oBSs346MTbRTuhfc3HMgf2c/VVqHZQShF4LGCdben76fUb1+/WTDwBtnZ9TAHur30uYz6WR9R4bqTX8Jl9hEABl4xmhywtneYDwYoaNtekNG9mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661217; c=relaxed/simple;
	bh=hMGOfgMsEansUlRG5bFxArMQimr7X3xn7J5Ic3Rh5d8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RDMwcgmuWIOwGYSCkl9LZ3coTNyD/fmlFn49BfQGPx0X/8ww2slFKa9wRvhC7uyJl91kiPM9T4FXo1NmPi+v3dN+XnqEbo5HM08zpyXVSZayMK2NdhBB/lqfrBQXjjriYBeUqu1cMy7iZ4LXUddsEupDddymLYFkMsKBegl1/MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HgvFcPt2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HgvFcPt2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790661214; x=1822197214;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hMGOfgMsEansUlRG5bFxArMQimr7X3xn7J5Ic3Rh5d8=;
  b=HgvFcPt2Rks921juhE3VCTpjJZfTp/RWlSPKbsdCSPjTuzc38aiGNFTK
   K/bf1U5a9sbVCWvpPr9gjMzY+qB0xXm6JeO3WMMSwNjvsXXgDIvB50/4x
   a1nZpi1gA9MqyZFk0mgqn/GYfSn8qq5DyKDx5GG1kGhjSQl+GZdUM4Bob
   cY5UIwMKgA4b09VfH9RJeEK/WCiLGyAGvvLQZRDPeUkfIHNGwm504E9Mp
   tx4vklpL/FzQqhINLZOfQNTkY0yP3MVINmwFJNFors52qCJquEuICcDXQ
   uuem1Q856yBJQ+dNV/8nqnRo8l6wj1Ug2PiUJUKf7bB5G1Yy78rjwpmxg
   Q==;
X-CSE-ConnectionGUID: k9j1rW/rQ+Gwa9vHa8HNGQ==
X-CSE-MsgGUID: u1MwEoLcQBeF5xu8umXGtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90413645"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90413645"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 22:53:33 -0700
X-CSE-ConnectionGUID: AzqcecxVQlOPIGPTlThfzw==
X-CSE-MsgGUID: CYErKAWMSq2xjcPNnaH08A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="278483783"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Sep 2026 22:53:32 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBQmP-00000000OyF-2f5x;
	Tue, 29 Sep 2026 05:53:29 +0000
Date: Tue, 29 Sep 2026 13:53:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] mm/hmm.c:247:6: error:
 call to undeclared function 'pte_none_mostly'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202609291352.m2dqMolh-lkp@intel.com>
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
head:   4f02a973d94c2e1b76391568aaf9d316067b9322
commit: ad36ecd6081db9827f1ebaa41671b0b336fd83bf [1/1] ANDROID: GKI: Enable=
 HMM_MIRROR config for all arch
config: arm-randconfig-1001-20260929 (https://download.01.org/0day-ci/archi=
ve/20260929/202609291352.m2dqMolh-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f6=
09f950d2e80addf5566623013db68394334db)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260929/202609291352.m2dqMolh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609291352.m2dqMolh-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   mm/hmm.c:230:6: error: call to undeclared function 'pte_none'; ISO C99 a=
nd later do not support implicit function declarations [-Wimplicit-function=
-declaration]
     230 |         if (pte_none(pte) || !pte_present(pte) || pte_protnone(p=
te))
         |             ^
   mm/hmm.c:230:24: error: call to undeclared function 'pte_present'; ISO C=
99 and later do not support implicit function declarations [-Wimplicit-func=
tion-declaration]
     230 |         if (pte_none(pte) || !pte_present(pte) || pte_protnone(p=
te))
         |                               ^
   mm/hmm.c:230:44: error: call to undeclared function 'pte_protnone'; ISO =
C99 and later do not support implicit function declarations [-Wimplicit-fun=
ction-declaration]
     230 |         if (pte_none(pte) || !pte_present(pte) || pte_protnone(p=
te))
         |                                                   ^
   mm/hmm.c:232:9: error: call to undeclared function 'pte_write'; ISO C99 =
and later do not support implicit function declarations [-Wimplicit-functio=
n-declaration]
     232 |         return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) =
: HMM_PFN_VALID;
         |                ^
   mm/hmm.c:232:9: note: did you mean 'pgd_write'?
   include/linux/hugetlb.h:472:19: note: 'pgd_write' declared here
     472 | static inline int pgd_write(pgd_t pgd)
         |                   ^
   mm/hmm.c:243:14: error: call to undeclared function 'ptep_get'; ISO C99 =
and later do not support implicit function declarations [-Wimplicit-functio=
n-declaration]
     243 |         pte_t pte =3D ptep_get(ptep);
         |                     ^
>> mm/hmm.c:247:6: error: call to undeclared function 'pte_none_mostly'; IS=
O C99 and later do not support implicit function declarations [-Wimplicit-f=
unction-declaration]
     247 |         if (pte_none_mostly(pte)) {
         |             ^
   mm/hmm.c:255:7: error: call to undeclared function 'pte_present'; ISO C9=
9 and later do not support implicit function declarations [-Wimplicit-funct=
ion-declaration]
     255 |         if (!pte_present(pte)) {
         |              ^
   mm/hmm.c:256:23: error: call to undeclared function 'pte_to_swp_entry'; =
ISO C99 and later do not support implicit function declarations [-Wimplicit=
-function-declaration]
     256 |                 swp_entry_t entry =3D pte_to_swp_entry(pte);
         |                                     ^
   mm/hmm.c:256:15: error: initializing 'swp_entry_t' with an expression of=
 incompatible type 'int'
     256 |                 swp_entry_t entry =3D pte_to_swp_entry(pte);
         |                             ^       ~~~~~~~~~~~~~~~~~~~~~
>> mm/hmm.c:262:7: error: call to undeclared function 'is_device_private_en=
try'; ISO C99 and later do not support implicit function declarations [-Wim=
plicit-function-declaration]
     262 |                 if (is_device_private_entry(entry) &&
         |                     ^
   mm/hmm.c:262:7: note: did you mean 'is_device_private_page'?
   include/linux/memremap.h:167:20: note: 'is_device_private_page' declared=
 here
     167 | static inline bool is_device_private_page(const struct page *pag=
e)
         |                    ^
   mm/hmm.c:263:18: error: call to undeclared function 'pfn_swap_entry_to_p=
age'; ISO C99 and later do not support implicit function declarations [-Wim=
plicit-function-declaration]
     263 |                     page_pgmap(pfn_swap_entry_to_page(entry))->o=
wner =3D=3D
         |                                ^
   mm/hmm.c:263:18: error: incompatible integer to pointer conversion passi=
ng 'int' to parameter of type 'const struct page *' [-Wint-conversion]
     263 |                     page_pgmap(pfn_swap_entry_to_page(entry))->o=
wner =3D=3D
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:1245:65: note: passing argument to parameter 'pag=
e' here
    1245 | static inline struct dev_pagemap *page_pgmap(const struct page *=
page)
         |                                                                 ^
   mm/hmm.c:266:8: error: call to undeclared function 'is_writable_device_p=
rivate_entry'; ISO C99 and later do not support implicit function declarati=
ons [-Wimplicit-function-declaration]
     266 |                         if (is_writable_device_private_entry(ent=
ry))
         |                             ^
   mm/hmm.c:268:20: error: call to undeclared function 'swp_offset_pfn'; IS=
O C99 and later do not support implicit function declarations [-Wimplicit-f=
unction-declaration]
     268 |                         new_pfn_flags =3D swp_offset_pfn(entry) =
| cpu_flags;
         |                                         ^
   mm/hmm.c:277:8: error: call to undeclared function 'non_swap_entry'; ISO=
 C99 and later do not support implicit function declarations [-Wimplicit-fu=
nction-declaration]
     277 |                 if (!non_swap_entry(entry))
         |                      ^
   mm/hmm.c:277:8: note: did you mean 'page_swap_entry'?
   include/linux/swap.h:316:27: note: 'page_swap_entry' declared here
     316 | static inline swp_entry_t page_swap_entry(struct page *page)
         |                           ^
   mm/hmm.c:283:7: error: call to undeclared function 'is_device_exclusive_=
entry'; ISO C99 and later do not support implicit function declarations [-W=
implicit-function-declaration]
     283 |                 if (is_device_exclusive_entry(entry))
         |                     ^
   mm/hmm.c:286:7: error: call to undeclared function 'is_migration_entry';=
 ISO C99 and later do not support implicit function declarations [-Wimplici=
t-function-declaration]
     286 |                 if (is_migration_entry(entry)) {
         |                     ^
   mm/hmm.c:287:4: error: call to undeclared function 'pte_unmap'; ISO C99 =
and later do not support implicit function declarations [-Wimplicit-functio=
n-declaration]
     287 |                         pte_unmap(ptep);
         |                         ^
   mm/hmm.c:287:4: note: did you mean 'memunmap'?
   include/linux/io.h:159:6: note: 'memunmap' declared here
     159 | void memunmap(void *addr);
         |      ^
   mm/hmm.c:289:4: error: call to undeclared function 'migration_entry_wait=
'; ISO C99 and later do not support implicit function declarations [-Wimpli=
cit-function-declaration]
     289 |                         migration_entry_wait(walk->mm, pmdp, add=
r);
         |                         ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
   20 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=3Dn] && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=3Dn] && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=3Dy] && CAN_DEV [=3Dy] && CAN_NETLINK [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=3Dn] && SND [=3Dn] && SND_JACK [=3Dy]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=3Dy] && WIRELESS [=3Dn] && PROC_FS [=3Dy] && WEXT_=
CORE [=3Dy]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=3Dn] && SND [=3Dn]
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
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && MMU [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=3Dn] && SND [=3Dn]
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
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=3Dn] && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]


vim +/pte_none_mostly +247 mm/hmm.c

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
5c041f5d1f23d3 Peter Xu        2022-05-12 @247  	if (pte_none_mostly(pte)) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  248  		required_fault =3D
2733ea144dcce7 Jason Gunthorpe 2020-05-01  249  			hmm_pte_need_fault(hmm_v=
ma_walk, pfn_req_flags, 0);
a3eb13c1579ba9 Jason Gunthorpe 2020-03-27  250  		if (required_fault)
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  251  			goto fault;
285e871884ff3d Leon Romanovsky 2025-04-28  252  		goto out;
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  253  	}
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  254 =20
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  255  	if (!pte_present=
(pte)) {
8d63e4cd62b258 Ralph Campbell  2018-01-31  256  		swp_entry_t entry =3D pte=
_to_swp_entry(pte);
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  257 =20
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  258  		/*
8a295dbbaf7292 Ralph Campbell  2022-07-25  259  		 * Don't fault in device =
private pages owned by the caller,
8a295dbbaf7292 Ralph Campbell  2022-07-25  260  		 * just report the PFN.
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  261  		 */
8a295dbbaf7292 Ralph Campbell  2022-07-25 @262  		if (is_device_private_ent=
ry(entry) &&
82ba975e4c43d9 Alistair Popple 2025-02-28  263  		    page_pgmap(pfn_swap_e=
ntry_to_page(entry))->owner =3D=3D
8a295dbbaf7292 Ralph Campbell  2022-07-25  264  		    range->dev_private_ow=
ner) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  265  			cpu_flags =3D HMM_PFN_VA=
LID;
4dd845b5a3e57a Alistair Popple 2021-06-30  266  			if (is_writable_device_p=
rivate_entry(entry))
2733ea144dcce7 Jason Gunthorpe 2020-05-01  267  				cpu_flags |=3D HMM_PFN_=
WRITE;
285e871884ff3d Leon Romanovsky 2025-04-28  268  			new_pfn_flags =3D swp_of=
fset_pfn(entry) | cpu_flags;
285e871884ff3d Leon Romanovsky 2025-04-28  269  			goto out;
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  270  		}
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  271 =20
2733ea144dcce7 Jason Gunthorpe 2020-05-01  272  		required_fault =3D
2733ea144dcce7 Jason Gunthorpe 2020-05-01  273  			hmm_pte_need_fault(hmm_v=
ma_walk, pfn_req_flags, 0);
285e871884ff3d Leon Romanovsky 2025-04-28  274  		if (!required_fault)
285e871884ff3d Leon Romanovsky 2025-04-28  275  			goto out;
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  276 =20
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  277  		if (!non_swap_entry(entry=
))
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  278  			goto fault;
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  279 =20
8a295dbbaf7292 Ralph Campbell  2022-07-25  280  		if (is_device_private_ent=
ry(entry))
8a295dbbaf7292 Ralph Campbell  2022-07-25  281  			goto fault;
8a295dbbaf7292 Ralph Campbell  2022-07-25  282 =20
b756a3b5e7ead8 Alistair Popple 2021-06-30  283  		if (is_device_exclusive_e=
ntry(entry))
b756a3b5e7ead8 Alistair Popple 2021-06-30  284  			goto fault;
b756a3b5e7ead8 Alistair Popple 2021-06-30  285 =20
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  286  		if (is_migratio=
n_entry(entry)) {
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  287  			pte_unmap(ptep=
);
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  288  			hmm_vma_walk->=
last =3D addr;
d2e8d551165ccb Ralph Campbell  2019-07-25  289  			migration_entry_wait(wal=
k->mm, pmdp, addr);
73231612dc7c90 J=C3=A9r=C3=B4me Glisse   2019-05-13  290  			return -EBUSY;
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  291  		}
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  292 =20
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  293  		/* Report error=
 for everything else */
dfdc22078f3f06 Jason Gunthorpe 2020-02-28  294  		pte_unmap(ptep);
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  295  		return -EFAULT;
da4c3c735ea4dc J=C3=A9r=C3=B4me Glisse   2017-09-08  296  	}
da4c3c735ea4dc J=C3=A9r=C3=B4me Glisse   2017-09-08  297 =20
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  298  	cpu_flags =3D pte_to_hmm_p=
fn_flags(range, pte);
2733ea144dcce7 Jason Gunthorpe 2020-05-01  299  	required_fault =3D
2733ea144dcce7 Jason Gunthorpe 2020-05-01  300  		hmm_pte_need_fault(hmm_vm=
a_walk, pfn_req_flags, cpu_flags);
a3eb13c1579ba9 Jason Gunthorpe 2020-03-27  301  	if (required_fault)
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  302  		goto fault;
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  303 =20
ac541f25037229 Ralph Campbell  2019-10-23  304  	/*
40550627492291 Jason Gunthorpe 2020-03-05  305  	 * Since each architecture=
 defines a struct page for the zero page, just
40550627492291 Jason Gunthorpe 2020-03-05  306  	 * fall through and treat =
it like a normal page.
ac541f25037229 Ralph Campbell  2019-10-23  307  	 */
87c01d57fa23de Alistair Popple 2022-01-14  308  	if (!vm_normal_page(walk->=
vma, addr, pte) &&
4b42fb213678d2 Li Zhijian      2021-09-08  309  	    !is_zero_pfn(pte_pfn(p=
te))) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  310  		if (hmm_pte_need_fault(hm=
m_vma_walk, pfn_req_flags, 0)) {
40550627492291 Jason Gunthorpe 2020-03-05  311  			pte_unmap(ptep);
40550627492291 Jason Gunthorpe 2020-03-05  312  			return -EFAULT;
40550627492291 Jason Gunthorpe 2020-03-05  313  		}
285e871884ff3d Leon Romanovsky 2025-04-28  314  		new_pfn_flags =3D HMM_PFN=
_ERROR;
285e871884ff3d Leon Romanovsky 2025-04-28  315  		goto out;
ac541f25037229 Ralph Campbell  2019-10-23  316  	}
992de9a8b75116 J=C3=A9r=C3=B4me Glisse   2019-05-13  317 =20
285e871884ff3d Leon Romanovsky 2025-04-28  318  	new_pfn_flags =3D pte_pfn(=
pte) | cpu_flags;
285e871884ff3d Leon Romanovsky 2025-04-28  319  out:
285e871884ff3d Leon Romanovsky 2025-04-28  320  	*hmm_pfn =3D (*hmm_pfn & H=
MM_PFN_INOUT_FLAGS) | new_pfn_flags;
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  321  	return 0;
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  322 =20
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  323  fault:
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  324  	pte_unmap(ptep);
5504ed29692faa J=C3=A9r=C3=B4me Glisse   2018-04-10  325  	/* Fault any vir=
tual address we were asked to fault */
a3eb13c1579ba9 Jason Gunthorpe 2020-03-27  326  	return hmm_vma_fault(addr,=
 end, required_fault, walk);
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  327  }
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  328 =20

:::::: The code at line 247 was first introduced by commit
:::::: 5c041f5d1f23d3a172dd0db3215634c484b4acd6 mm: teach core mm about pte=
 markers

:::::: TO: Peter Xu <peterx@redhat.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
