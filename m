Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601A61514F8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 18:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775844135; cv=none; b=lfr4dDPQJGApI7PZDQrfEW90piGIQCBst2Iu8c1y0GauzXHns1sw6OF5KqhUvYGsG+zDEunnWN+IkI2iswRMvRhs0Nqaor1GqOp8cB37OzFIEow0n5jfwaZ/h05POdYUjLUZ2bU1/kQbom37wvJMAhPl8qOOtROmFBYxfkzmczQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775844135; c=relaxed/simple;
	bh=qcD3a1tKqKyCWQe69EbRV1QXV4PxGiQq3s4ZYr2j9B8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=csdanUXmK0Q6hR9uQ7bEnHv7Mw+/H7/dg91Qn4v5N1is/oVmqA4c08SL9Nk8Fc1VPxra6GeLLwL43OInD3aRbdhNre06+bCrM7/rtpckmtpPhLV+KNPZAnFqTHJM4X4rtR6lbFcX4NAKrozx7I/0foiOtyyxEoiMg3xNOckmxFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lV6WcSG5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lV6WcSG5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775844133; x=1807380133;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qcD3a1tKqKyCWQe69EbRV1QXV4PxGiQq3s4ZYr2j9B8=;
  b=lV6WcSG5O84Pj+lWB1GFsRq1dc0NaA/5A5O16ctLhEMBqxmWtXWi+Rg3
   drmsypeBOxWSRZVg9ETLpl2MXNeNbiQwBdVI8MFMJRk/7OCU4GOoNM/R0
   +zj6Wdhx363y9wvIhTmIKGQY0qfBy6fi6WTX61Za5qEAhiKWmNjbw1TPH
   ST9dTeWUhnqZTtvu6Ohxgw/1mJAirAMxTyvxp36JBXaHJzo84tm28Z2rT
   1jx/v7OSHkhDfGvw+Dzw1i9tHydtwUiB4R+r8lvBjF0eM2KyO8NHzE6lu
   72pH4pdUZC7kwX7Q3sdNxf7oay3p/xdUgb5N7pGSC6p1eezTVq1tmC/F/
   A==;
X-CSE-ConnectionGUID: 2BSTFLd6Szm3bD8NJa8enQ==
X-CSE-MsgGUID: KFHFPkTtRaeWzupGT0VLQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="80758715"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="80758715"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 11:02:10 -0700
X-CSE-ConnectionGUID: pYy0pUZ/R7OUEmHemQT7IA==
X-CSE-MsgGUID: v0EGvAQgSzCsjGIXRpFkDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="224836215"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Apr 2026 11:02:09 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBGBC-0000000048X-3K2R;
	Fri, 10 Apr 2026 18:02:06 +0000
Date: Sat, 11 Apr 2026 02:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 221/221]
 mm/hmm.c:250:37: error: implicit declaration of function 'pte_to_swp_entry'
Message-ID: <202604110142.qJSSCn1t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jihan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   d1cc6d9121c037525efedd26b2383e4547dcceb8
commit: 2ea27b7efa3f6fd0b4fab6a748ab08322280f29b [221/221] ANDROID: GKI: Kc=
onfig.gki: enable CONFIG_HMM_MIRROR with HIDDEN GPU
config: arm-randconfig-001-20260411 (https://download.01.org/0day-ci/archiv=
e/20260411/202604110142.qJSSCn1t-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260411/202604110142.qJSSCn1t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110142.qJSSCn1t-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   mm/hmm.c: In function 'pmd_to_hmm_pfn_flags':
   mm/hmm.c:177:13: error: implicit declaration of function 'pmd_protnone' =
[-Werror=3Dimplicit-function-declaration]
     177 |         if (pmd_protnone(pmd))
         |             ^~~~~~~~~~~~
   mm/hmm.c:179:17: error: implicit declaration of function 'pmd_write'; di=
d you mean 'pgd_write'? [-Werror=3Dimplicit-function-declaration]
     179 |         return (pmd_write(pmd) ? (HMM_PFN_VALID | HMM_PFN_WRITE)=
 :
         |                 ^~~~~~~~~
         |                 pgd_write
   mm/hmm.c:181:36: error: 'PMD_SHIFT' undeclared (first use in this functi=
on); did you mean 'PUD_SHIFT'?
     181 |                hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT);
         |                                    ^~~~~~~~~
         |                                    PUD_SHIFT
   mm/hmm.c:181:36: note: each undeclared identifier is reported only once =
for each function it appears in
   mm/hmm.c: In function 'hmm_is_device_private_entry':
   mm/hmm.c:216:16: error: implicit declaration of function 'is_device_priv=
ate_entry'; did you mean 'hmm_is_device_private_entry'? [-Werror=3Dimplicit=
-function-declaration]
     216 |         return is_device_private_entry(entry) &&
         |                ^~~~~~~~~~~~~~~~~~~~~~~
         |                hmm_is_device_private_entry
   mm/hmm.c:217:17: error: implicit declaration of function 'device_private=
_entry_to_page' [-Werror=3Dimplicit-function-declaration]
     217 |                 device_private_entry_to_page(entry)->pgmap->owne=
r =3D=3D
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:217:52: error: invalid type argument of '->' (have 'int')
     217 |                 device_private_entry_to_page(entry)->pgmap->owne=
r =3D=3D
         |                                                    ^~
   mm/hmm.c: In function 'pte_to_hmm_pfn_flags':
   mm/hmm.c:224:13: error: implicit declaration of function 'pte_none'; did=
 you mean 'p4d_none'? [-Werror=3Dimplicit-function-declaration]
     224 |         if (pte_none(pte) || !pte_present(pte) || pte_protnone(p=
te))
         |             ^~~~~~~~
         |             p4d_none
   mm/hmm.c:224:31: error: implicit declaration of function 'pte_present'; =
did you mean 'p4d_present'? [-Werror=3Dimplicit-function-declaration]
     224 |         if (pte_none(pte) || !pte_present(pte) || pte_protnone(p=
te))
         |                               ^~~~~~~~~~~
         |                               p4d_present
   mm/hmm.c:224:51: error: implicit declaration of function 'pte_protnone' =
[-Werror=3Dimplicit-function-declaration]
     224 |         if (pte_none(pte) || !pte_present(pte) || pte_protnone(p=
te))
         |                                                   ^~~~~~~~~~~~
   mm/hmm.c:226:16: error: implicit declaration of function 'pte_write'; di=
d you mean 'pgd_write'? [-Werror=3Dimplicit-function-declaration]
     226 |         return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) =
: HMM_PFN_VALID;
         |                ^~~~~~~~~
         |                pgd_write
   mm/hmm.c: In function 'hmm_vma_handle_pte':
>> mm/hmm.c:250:37: error: implicit declaration of function 'pte_to_swp_ent=
ry' [-Werror=3Dimplicit-function-declaration]
     250 |                 swp_entry_t entry =3D pte_to_swp_entry(pte);
         |                                     ^~~~~~~~~~~~~~~~
   mm/hmm.c:250:37: error: invalid initializer
   mm/hmm.c:258:29: error: implicit declaration of function 'is_write_devic=
e_private_entry'; did you mean 'hmm_is_device_private_entry'? [-Werror=3Dim=
plicit-function-declaration]
     258 |                         if (is_write_device_private_entry(entry))
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             hmm_is_device_private_entry
   mm/hmm.c:260:36: error: implicit declaration of function 'device_private=
_entry_to_pfn' [-Werror=3Dimplicit-function-declaration]
     260 |                         *hmm_pfn =3D device_private_entry_to_pfn=
(entry) |
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:272:22: error: implicit declaration of function 'non_swap_entry=
' [-Werror=3Dimplicit-function-declaration]
     272 |                 if (!non_swap_entry(entry))
         |                      ^~~~~~~~~~~~~~
   mm/hmm.c:275:21: error: implicit declaration of function 'is_migration_e=
ntry' [-Werror=3Dimplicit-function-declaration]
     275 |                 if (is_migration_entry(entry)) {
         |                     ^~~~~~~~~~~~~~~~~~
   mm/hmm.c:276:25: error: implicit declaration of function 'pte_unmap'; di=
d you mean 'memunmap'? [-Werror=3Dimplicit-function-declaration]
     276 |                         pte_unmap(ptep);
         |                         ^~~~~~~~~
         |                         memunmap
   mm/hmm.c:278:25: error: implicit declaration of function 'migration_entr=
y_wait' [-Werror=3Dimplicit-function-declaration]
     278 |                         migration_entry_wait(walk->mm, pmdp, add=
r);
         |                         ^~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:297:46: error: implicit declaration of function 'pte_pfn' [-Wer=
ror=3Dimplicit-function-declaration]
     297 |         if (pte_special(pte) && !is_zero_pfn(pte_pfn(pte))) {
         |                                              ^~~~~~~
   mm/hmm.c: In function 'hmm_vma_walk_pmd':
   mm/hmm.c:331:13: error: implicit declaration of function 'pmd_none'; did=
 you mean 'p4d_none'? [-Werror=3Dimplicit-function-declaration]
     331 |         if (pmd_none(pmd))
         |             ^~~~~~~~
         |             p4d_none
   mm/hmm.c:334:42: error: implicit declaration of function 'is_pmd_migrati=
on_entry' [-Werror=3Dimplicit-function-declaration]
     334 |         if (thp_migration_supported() && is_pmd_migration_entry(=
pmd)) {
         |                                          ^~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:337:25: error: implicit declaration of function 'pmd_migration_=
entry_wait' [-Werror=3Dimplicit-function-declaration]
     337 |                         pmd_migration_entry_wait(walk->mm, pmdp);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:343:14: error: implicit declaration of function 'pmd_present'; =
did you mean 'p4d_present'? [-Werror=3Dimplicit-function-declaration]
     343 |         if (!pmd_present(pmd)) {
         |              ^~~~~~~~~~~
         |              p4d_present
   mm/hmm.c:349:13: error: implicit declaration of function 'pmd_devmap'; d=
id you mean 'pte_devmap'? [-Werror=3Dimplicit-function-declaration]
     349 |         if (pmd_devmap(pmd) || pmd_trans_huge(pmd)) {
         |             ^~~~~~~~~~
         |             pte_devmap
   mm/hmm.c:349:32: error: implicit declaration of function 'pmd_trans_huge=
'; did you mean 'pmd_trans_huge_lock'? [-Werror=3Dimplicit-function-declara=
tion]
     349 |         if (pmd_devmap(pmd) || pmd_trans_huge(pmd)) {
         |                                ^~~~~~~~~~~~~~
         |                                pmd_trans_huge_lock
   mm/hmm.c:359:23: error: implicit declaration of function 'pmd_read_atomi=
c' [-Werror=3Dimplicit-function-declaration]
     359 |                 pmd =3D pmd_read_atomic(pmdp);
         |                       ^~~~~~~~~~~~~~~
   mm/hmm.c:373:13: error: implicit declaration of function 'pmd_bad'; did =
you mean 'p4d_bad'? [-Werror=3Dimplicit-function-declaration]
     373 |         if (pmd_bad(pmd)) {
         |             ^~~~~~~
         |             p4d_bad
   mm/hmm.c:379:16: error: implicit declaration of function 'pte_offset_map=
'; did you mean 'pte_offset_map_lock'? [-Werror=3Dimplicit-function-declara=
tion]
     379 |         ptep =3D pte_offset_map(pmdp, addr);
         |                ^~~~~~~~~~~~~~
         |                pte_offset_map_lock
   mm/hmm.c:379:14: warning: assignment to 'pte_t *' {aka 'long unsigned in=
t *'} from 'int' makes pointer from integer without a cast [-Wint-conversio=
n]
     379 |         ptep =3D pte_offset_map(pmdp, addr);
         |              ^
   mm/hmm.c: In function 'hmm_is_device_private_entry':
   mm/hmm.c:219:1: warning: control reaches end of non-void function [-Wret=
urn-type]
     219 | }
         | ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=3Dn] && WIRELESS [=3Dn]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=3Dn] && MEMORY_BALLOON [=3Dy]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=3Dn] && WIRELESS [=3Dn]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=3Dn] && WIRELESS [=3Dn]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=3Dn] && WIRELESS [=3Dn] && (CFG80211_WEXT [=3Dn] |=
| WIRELESS_EXT [=3Dy])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for HMM_MIRROR
   Depends on [n]: MMU [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_GPU_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=3Dn] && WIRELESS [=3Dn] && PROC_FS [=3Dn] && WEXT_=
CORE [=3Dy]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]


vim +/pte_to_swp_entry +250 mm/hmm.c

08ddddda667b3b Christoph Hellwig 2020-03-16  220 =20
2733ea144dcce7 Jason Gunthorpe   2020-05-01  221  static inline unsigned lo=
ng pte_to_hmm_pfn_flags(struct hmm_range *range,
2733ea144dcce7 Jason Gunthorpe   2020-05-01  222  						 pte_t pte)
2aee09d8c11642 J=C3=A9r=C3=B4me Glisse     2018-04-10  223  {
789c2af88f24d1 Philip Yang       2019-05-23 @224  	if (pte_none(pte) || !pt=
e_present(pte) || pte_protnone(pte))
2aee09d8c11642 J=C3=A9r=C3=B4me Glisse     2018-04-10  225  		return 0;
2733ea144dcce7 Jason Gunthorpe   2020-05-01  226  	return pte_write(pte) ? =
(HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALID;
2aee09d8c11642 J=C3=A9r=C3=B4me Glisse     2018-04-10  227  }
2aee09d8c11642 J=C3=A9r=C3=B4me Glisse     2018-04-10  228 =20
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  229  static int hmm_=
vma_handle_pte(struct mm_walk *walk, unsigned long addr,
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  230  			      unsign=
ed long end, pmd_t *pmdp, pte_t *ptep,
2733ea144dcce7 Jason Gunthorpe   2020-05-01  231  			      unsigned long *h=
mm_pfn)
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  232  {
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  233  	struct hmm_vma=
_walk *hmm_vma_walk =3D walk->private;
f88a1e90c66540 J=C3=A9r=C3=B4me Glisse     2018-04-10  234  	struct hmm_ran=
ge *range =3D hmm_vma_walk->range;
a3eb13c1579ba9 Jason Gunthorpe   2020-03-27  235  	unsigned int required_fa=
ult;
2733ea144dcce7 Jason Gunthorpe   2020-05-01  236  	unsigned long cpu_flags;
da4c3c735ea4dc J=C3=A9r=C3=B4me Glisse     2017-09-08  237  	pte_t pte =3D =
*ptep;
2733ea144dcce7 Jason Gunthorpe   2020-05-01  238  	uint64_t pfn_req_flags =
=3D *hmm_pfn;
da4c3c735ea4dc J=C3=A9r=C3=B4me Glisse     2017-09-08  239 =20
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  240  	if (pte_none(p=
te)) {
2733ea144dcce7 Jason Gunthorpe   2020-05-01  241  		required_fault =3D
2733ea144dcce7 Jason Gunthorpe   2020-05-01  242  			hmm_pte_need_fault(hmm=
_vma_walk, pfn_req_flags, 0);
a3eb13c1579ba9 Jason Gunthorpe   2020-03-27  243  		if (required_fault)
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  244  			goto fault;
2733ea144dcce7 Jason Gunthorpe   2020-05-01  245  		*hmm_pfn =3D 0;
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  246  		return 0;
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  247  	}
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  248 =20
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  249  	if (!pte_prese=
nt(pte)) {
8d63e4cd62b258 Ralph Campbell    2018-01-31 @250  		swp_entry_t entry =3D p=
te_to_swp_entry(pte);
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  251 =20
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  252  		/*
0cb80a2fb5bcd1 Randy Dunlap      2020-08-11  253  		 * Never fault in devic=
e private pages, but just report
17ffdc482982af Christoph Hellwig 2020-03-16  254  		 * the PFN even if not =
present.
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  255  		 */
08ddddda667b3b Christoph Hellwig 2020-03-16  256  		if (hmm_is_device_priva=
te_entry(range, entry)) {
2733ea144dcce7 Jason Gunthorpe   2020-05-01  257  			cpu_flags =3D HMM_PFN_=
VALID;
17ffdc482982af Christoph Hellwig 2020-03-16  258  			if (is_write_device_pr=
ivate_entry(entry))
2733ea144dcce7 Jason Gunthorpe   2020-05-01  259  				cpu_flags |=3D HMM_PF=
N_WRITE;
2733ea144dcce7 Jason Gunthorpe   2020-05-01  260  			*hmm_pfn =3D device_pr=
ivate_entry_to_pfn(entry) |
2733ea144dcce7 Jason Gunthorpe   2020-05-01  261  					cpu_flags;
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  262  			return 0;
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  263  		}
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  264 =20
2733ea144dcce7 Jason Gunthorpe   2020-05-01  265  		required_fault =3D
2733ea144dcce7 Jason Gunthorpe   2020-05-01  266  			hmm_pte_need_fault(hmm=
_vma_walk, pfn_req_flags, 0);
846babe85efdda Jason Gunthorpe   2020-03-27  267  		if (!required_fault) {
2733ea144dcce7 Jason Gunthorpe   2020-05-01  268  			*hmm_pfn =3D 0;
76612d6ce4ccd2 Jason Gunthorpe   2020-02-28  269  			return 0;
846babe85efdda Jason Gunthorpe   2020-03-27  270  		}
76612d6ce4ccd2 Jason Gunthorpe   2020-02-28  271 =20
76612d6ce4ccd2 Jason Gunthorpe   2020-02-28  272  		if (!non_swap_entry(ent=
ry))
76612d6ce4ccd2 Jason Gunthorpe   2020-02-28  273  			goto fault;
76612d6ce4ccd2 Jason Gunthorpe   2020-02-28  274 =20
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  275  		if (is_migrat=
ion_entry(entry)) {
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  276  			pte_unmap(pt=
ep);
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  277  			hmm_vma_walk=
->last =3D addr;
d2e8d551165ccb Ralph Campbell    2019-07-25  278  			migration_entry_wait(w=
alk->mm, pmdp, addr);
73231612dc7c90 J=C3=A9r=C3=B4me Glisse     2019-05-13  279  			return -EBUS=
Y;
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  280  		}
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  281 =20
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  282  		/* Report err=
or for everything else */
dfdc22078f3f06 Jason Gunthorpe   2020-02-28  283  		pte_unmap(ptep);
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  284  		return -EFAUL=
T;
da4c3c735ea4dc J=C3=A9r=C3=B4me Glisse     2017-09-08  285  	}
da4c3c735ea4dc J=C3=A9r=C3=B4me Glisse     2017-09-08  286 =20
76612d6ce4ccd2 Jason Gunthorpe   2020-02-28  287  	cpu_flags =3D pte_to_hmm=
_pfn_flags(range, pte);
2733ea144dcce7 Jason Gunthorpe   2020-05-01  288  	required_fault =3D
2733ea144dcce7 Jason Gunthorpe   2020-05-01  289  		hmm_pte_need_fault(hmm_=
vma_walk, pfn_req_flags, cpu_flags);
a3eb13c1579ba9 Jason Gunthorpe   2020-03-27  290  	if (required_fault)
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  291  		goto fault;
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  292 =20
ac541f25037229 Ralph Campbell    2019-10-23  293  	/*
40550627492291 Jason Gunthorpe   2020-03-05  294  	 * Since each architectu=
re defines a struct page for the zero page, just
40550627492291 Jason Gunthorpe   2020-03-05  295  	 * fall through and trea=
t it like a normal page.
ac541f25037229 Ralph Campbell    2019-10-23  296  	 */
40550627492291 Jason Gunthorpe   2020-03-05  297  	if (pte_special(pte) && =
!is_zero_pfn(pte_pfn(pte))) {
2733ea144dcce7 Jason Gunthorpe   2020-05-01  298  		if (hmm_pte_need_fault(=
hmm_vma_walk, pfn_req_flags, 0)) {
40550627492291 Jason Gunthorpe   2020-03-05  299  			pte_unmap(ptep);
40550627492291 Jason Gunthorpe   2020-03-05  300  			return -EFAULT;
40550627492291 Jason Gunthorpe   2020-03-05  301  		}
2733ea144dcce7 Jason Gunthorpe   2020-05-01  302  		*hmm_pfn =3D HMM_PFN_ER=
ROR;
40550627492291 Jason Gunthorpe   2020-03-05  303  		return 0;
ac541f25037229 Ralph Campbell    2019-10-23  304  	}
992de9a8b75116 J=C3=A9r=C3=B4me Glisse     2019-05-13  305 =20
2733ea144dcce7 Jason Gunthorpe   2020-05-01  306  	*hmm_pfn =3D pte_pfn(pte=
) | cpu_flags;
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  307  	return 0;
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  308 =20
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  309  fault:
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  310  	pte_unmap(ptep=
);
5504ed29692faa J=C3=A9r=C3=B4me Glisse     2018-04-10  311  	/* Fault any v=
irtual address we were asked to fault */
a3eb13c1579ba9 Jason Gunthorpe   2020-03-27  312  	return hmm_vma_fault(add=
r, end, required_fault, walk);
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  313  }
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  314 =20

:::::: The code at line 250 was first introduced by commit
:::::: 8d63e4cd62b2583c7efe64f2ede406b3f44983f6 mm/hmm: fix uninitialized u=
se of 'entry' in hmm_vma_walk_pmd()

:::::: TO: Ralph Campbell <rcampbell@nvidia.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
