Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281873;
	b=HJPlbUi0ZCTlrcreDp2vmP6iLA064I5CvL03bWOXBHNyl4q50d8j4H5pBucmedlxUJIJ
	 6lIpD8TeOyqB6inMsFd6ggShhcyOxjYAH/mYWFmKQYMmCqHqT/08ZbtVgR33ji4AsiDEs
	 0GWxtahj1Ee5ML29eCQ7zRqZPPGwwFdAcvKwg6/BYcRrK+B8wGUGupzLxXXYKwn04yImY
	 Zk8iSr4+N/M44E3t/tHBz2DCY6EAAqhS2AVuTRYdcCDl/BemgFyVGyvdNR1dfX0eyjHaX
	 TnvtrTIm8l6TcZeONK52VYN7im8UNVPgcC2XvhTxnj1ITnqK6yZBrM37YYLp/aX+MJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281873;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=oJOZiiKTiRLI4vWbEMA8vakKrxZv/vUfC3Lb985e0ME=;
	b=cEZdlWE7Ikj2ATjsZPfnB/TdrhWr6HFNVblumfc0DMX/afcGS2ilIY5VRkhPdpbo3hpN
	 07wLE+Zcp20E5WF7NQI/wOC81v5P2eRsU5mKSbfEz1NQAtRWhJoqfp3odAigtbWlAC2XX
	 XmXOjayASzmkgglxpD7lAnNy+o/hf2NgnI83OFBBsDGNPVZ8fw5CGnKPkfx9a1H8iO3o/
	 zGMgiV6MVPocCFIuUECcjDOYHEJXuGDahh7sXo56dTsujcCP4r0D6JL2raSZaUcL59C2X
	 ML73fImmpQ7S5fooFhmhDlb+fSSqzZb3nN5bsCWtV4uPV/HtFhmG2eO+aqSWmr5A8oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rle4RTUJ;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04308606A31F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 13:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04308606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rle4RTUJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793281873; x=1824817873;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Kc9fiX6+sAeOc01k07AA3r9LrGk5aYHF4QkN0Ie61dI=;
  b=Rle4RTUJek0zIno5H05RGfMzaCkPwUMubl4vfjD2b0fe5wefmTKapO+a
   vMpBUaNFUL/TnscmW6pUjoQXVqESvHvSnvDxp4ZCoS16GM92fsqlS5jXJ
   fQBmp6iVY6tnL68aqA+y+10KD88+zKm+ctIEubX94qEg7fKrIUBsSPmEU
   w3TsEw7HoTtWF7w6j2kCpfrnmZ7OlMnNxTAvaFevuUelBqCnnZ6+QQZEp
   1APCLM4H5ZaKcucg+Y1BXiq83odqAUrzWhY+13KV4ehBebZfYipMtRgR1
   1Xm94Eol+lPSs5ZjLQur1oGK8SuSvojg3qPOJmnvXnCW6mscL1jdOhLxo
   g==;
X-CSE-ConnectionGUID: t+iIHkO2RlOzsicTy+6eww==
X-CSE-MsgGUID: QA6h+Q2uQU+wJZwcEMsUSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2029388"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2029388"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 06:51:12 -0700
X-CSE-ConnectionGUID: QqXUJrorS/O1L0zQhSxV8w==
X-CSE-MsgGUID: gkmBUPxNS0+LYi7Z2KGTig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="6916084"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 29 Oct 2026 06:51:09 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMQX3-00000000aBe-3ga7;
	Thu, 29 Oct 2026 13:51:05 +0000
Date: Thu, 29 Oct 2026 21:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android18-7.3 1/1] mm/hmm.c:252:23: error:
 call to undeclared function 'pte_is_uffd_wp_marker'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202610292133.OGTTdTui-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Carlos,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android18-7.3
head:   f10481be4b057d0d5c830ae6c352d780a27bf753
commit: 82d9be76e213a0fb22f8f20586b020b6a91a5c01 [1/1] Merge 7203ca412fc8 (=
"Merge tag 'mm-stable-2025-12-03-21-26' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/akpm/mm") into android-mainline
config: arm-randconfig-1001-20261029 (https://download.01.org/0day-ci/archi=
ve/20261029/202610292133.OGTTdTui-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c=
1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261029/202610292133.OGTTdTui-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610292133.OGTTdTui-lkp@i=
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
   include/linux/hugetlb.h:475:19: note: 'pgd_write' declared here
     475 | static inline int pgd_write(pgd_t pgd)
         |                   ^
   mm/hmm.c:243:14: error: call to undeclared function 'ptep_get'; ISO C99 =
and later do not support implicit function declarations [-Wimplicit-functio=
n-declaration]
     243 |         pte_t pte =3D ptep_get(ptep);
         |                     ^
   mm/hmm.c:252:6: error: call to undeclared function 'pte_none'; ISO C99 a=
nd later do not support implicit function declarations [-Wimplicit-function=
-declaration]
     252 |         if (pte_none(pte) || pte_is_uffd_wp_marker(pte)) {
         |             ^
>> mm/hmm.c:252:23: error: call to undeclared function 'pte_is_uffd_wp_mark=
er'; ISO C99 and later do not support implicit function declarations [-Wimp=
licit-function-declaration]
     252 |         if (pte_none(pte) || pte_is_uffd_wp_marker(pte)) {
         |                              ^
   mm/hmm.c:260:7: error: call to undeclared function 'pte_present'; ISO C9=
9 and later do not support implicit function declarations [-Wimplicit-funct=
ion-declaration]
     260 |         if (!pte_present(pte)) {
         |              ^
>> mm/hmm.c:261:28: error: call to undeclared function 'softleaf_from_pte';=
 ISO C99 and later do not support implicit function declarations [-Wimplici=
t-function-declaration]
     261 |                 const softleaf_t entry =3D softleaf_from_pte(pte=
);
         |                                          ^
>> mm/hmm.c:261:20: error: initializing 'const softleaf_t' (aka 'const swp_=
entry_t') with an expression of incompatible type 'int'
     261 |                 const softleaf_t entry =3D softleaf_from_pte(pte=
);
         |                                  ^       ~~~~~~~~~~~~~~~~~~~~~~
>> mm/hmm.c:267:7: error: call to undeclared function 'softleaf_is_device_p=
rivate'; ISO C99 and later do not support implicit function declarations [-=
Wimplicit-function-declaration]
     267 |                 if (softleaf_is_device_private(entry) &&
         |                     ^
   mm/hmm.c:267:7: note: did you mean 'folio_is_device_private'?
   include/linux/memremap.h:166:20: note: 'folio_is_device_private' declare=
d here
     166 | static inline bool folio_is_device_private(const struct folio *f=
olio)
         |                    ^
>> mm/hmm.c:268:18: error: call to undeclared function 'softleaf_to_page'; =
ISO C99 and later do not support implicit function declarations [-Wimplicit=
-function-declaration]
     268 |                     page_pgmap(softleaf_to_page(entry))->owner =
=3D=3D
         |                                ^
   mm/hmm.c:268:18: error: incompatible integer to pointer conversion passi=
ng 'int' to parameter of type 'const struct page *' [-Wint-conversion]
     268 |                     page_pgmap(softleaf_to_page(entry))->owner =
=3D=3D
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:1241:65: note: passing argument to parameter 'pag=
e' here
    1241 | static inline struct dev_pagemap *page_pgmap(const struct page *=
page)
         |                                                                 ^
>> mm/hmm.c:271:8: error: call to undeclared function 'softleaf_is_device_p=
rivate_write'; ISO C99 and later do not support implicit function declarati=
ons [-Wimplicit-function-declaration]
     271 |                         if (softleaf_is_device_private_write(ent=
ry))
         |                             ^
>> mm/hmm.c:273:20: error: call to undeclared function 'softleaf_to_pfn'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]
     273 |                         new_pfn_flags =3D softleaf_to_pfn(entry)=
 | cpu_flags;
         |                                         ^
>> mm/hmm.c:282:7: error: call to undeclared function 'softleaf_is_swap'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]
     282 |                 if (softleaf_is_swap(entry))
         |                     ^
>> mm/hmm.c:288:7: error: call to undeclared function 'softleaf_is_device_e=
xclusive'; ISO C99 and later do not support implicit function declarations =
[-Wimplicit-function-declaration]
     288 |                 if (softleaf_is_device_exclusive(entry))
         |                     ^
>> mm/hmm.c:291:7: error: call to undeclared function 'softleaf_is_migratio=
n'; ISO C99 and later do not support implicit function declarations [-Wimpl=
icit-function-declaration]
     291 |                 if (softleaf_is_migration(entry)) {
         |                     ^
   mm/hmm.c:292:4: error: call to undeclared function 'pte_unmap'; ISO C99 =
and later do not support implicit function declarations [-Wimplicit-functio=
n-declaration]
     292 |                         pte_unmap(ptep);
         |                         ^
   mm/hmm.c:292:4: note: did you mean 'memunmap'?
   include/linux/io.h:159:6: note: 'memunmap' declared here
     159 | void memunmap(void *addr);
         |      ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
   20 errors generated.

Kconfig warnings: (for reference only)
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
   WARNING: unmet direct dependencies detected for HMM_MIRROR
   Depends on [n]: MMU [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=3Dy] && DRM [=3Dy]


vim +/pte_is_uffd_wp_marker +252 mm/hmm.c

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
c33c794828f212 Ryan Roberts    2023-06-12 @243  	pte_t pte =3D ptep_get(pte=
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
68aa2fdbf57f76 Lorenzo Stoakes 2025-11-10 @252  	if (pte_none(pte) || pte_i=
s_uffd_wp_marker(pte)) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  253  		required_fault =3D
2733ea144dcce7 Jason Gunthorpe 2020-05-01  254  			hmm_pte_need_fault(hmm_v=
ma_walk, pfn_req_flags, 0);
a3eb13c1579ba9 Jason Gunthorpe 2020-03-27  255  		if (required_fault)
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  256  			goto fault;
285e871884ff3d Leon Romanovsky 2025-04-28  257  		goto out;
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  258  	}
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  259 =20
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08 @260  	if (!pte_present=
(pte)) {
9ff30bb9ab40b3 Lorenzo Stoakes 2025-11-10 @261  		const softleaf_t entry =
=3D softleaf_from_pte(pte);
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  262 =20
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  263  		/*
8a295dbbaf7292 Ralph Campbell  2022-07-25  264  		 * Don't fault in device =
private pages owned by the caller,
8a295dbbaf7292 Ralph Campbell  2022-07-25  265  		 * just report the PFN.
74eee180b935fc J=C3=A9r=C3=B4me Glisse   2017-09-08  266  		 */
9ff30bb9ab40b3 Lorenzo Stoakes 2025-11-10 @267  		if (softleaf_is_device_pr=
ivate(entry) &&
9ff30bb9ab40b3 Lorenzo Stoakes 2025-11-10 @268  		    page_pgmap(softleaf_t=
o_page(entry))->owner =3D=3D
8a295dbbaf7292 Ralph Campbell  2022-07-25  269  		    range->dev_private_ow=
ner) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  270  			cpu_flags =3D HMM_PFN_VA=
LID;
9ff30bb9ab40b3 Lorenzo Stoakes 2025-11-10 @271  			if (softleaf_is_device_p=
rivate_write(entry))
2733ea144dcce7 Jason Gunthorpe 2020-05-01  272  				cpu_flags |=3D HMM_PFN_=
WRITE;
93976a20345b4a Lorenzo Stoakes 2025-11-10 @273  			new_pfn_flags =3D softle=
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
9ff30bb9ab40b3 Lorenzo Stoakes 2025-11-10 @282  		if (softleaf_is_swap(entr=
y))
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  283  			goto fault;
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  284 =20
9ff30bb9ab40b3 Lorenzo Stoakes 2025-11-10  285  		if (softleaf_is_device_pr=
ivate(entry))
8a295dbbaf7292 Ralph Campbell  2022-07-25  286  			goto fault;
8a295dbbaf7292 Ralph Campbell  2022-07-25  287 =20
9ff30bb9ab40b3 Lorenzo Stoakes 2025-11-10 @288  		if (softleaf_is_device_ex=
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

:::::: The code at line 252 was first introduced by commit
:::::: 68aa2fdbf57f769e552f472ddb762aba028a207e mm: introduce leaf entry ty=
pe and use to simplify leaf entry logic

:::::: TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
