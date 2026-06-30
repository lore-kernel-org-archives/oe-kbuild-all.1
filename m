Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCE8392C56
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 08:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782808157; cv=none; b=H2yzI1+RxbQpA2UA5J7vaokax63imqj1c/2nbZ5z8y/ICJ1DqfxsnTSduMcCcTBzbf3bzPQs6ki1N+LF1VcDQYEVs9PFJH/QCcdVAIZgOhIWtUkstPCkCr8xI1meHE1B+dAi7H3p/dryWCXEh0dN6CJusmMD1Hoe/Uv486yWbXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782808157; c=relaxed/simple;
	bh=BJXNccmD5A6yjeHcLqcY15/MuD9SFIJENooGDOJHVpM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=W3RLxPzbnQUoInPo1e6I/xZfLl+30cd4+MDEcqD4NZzL1rW/aCNqX/vxdErplFSD/lXPnBh3Bx8VfXjCQniW3uhDycyiHwm/N+EvyLTzc2IaZYwrU8vR0dr7CngaX0IqaxHQIooaijpq/xlrv+yhlV5/Xq2Loci7QYty9dE/QwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QqsoUjbe; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QqsoUjbe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782808154; x=1814344154;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BJXNccmD5A6yjeHcLqcY15/MuD9SFIJENooGDOJHVpM=;
  b=QqsoUjben+1v7W3ph0mHBtl7jSP8LjRX4aKOktcQhBXFVyeQv+P+j+Lh
   c+HRF8LyS72yYJYRCRKvGwNmVNiqqvQg6CG46L5cu63ItESZguB0tw0UC
   IpxJuMyHctlIs/hKCbARcL7crXEk18YAJdYHBHywlYM0L2ExM4X8GUtSK
   OGVgojYuA7fwEBi/wDtuRdWlCdAcLjLNEpnzaXaaVaPYLELUIeFnIJPUg
   yX/gSadtOwMXMGukQ02NGzJmmog3bJrsiZYnFvM6d94xA+OZatJnuIQem
   Vao8goGjGiNlDCVTgVXXnWbvUjPoeHpbkzS15UtAmgkn3rnYbGJ2I+c58
   g==;
X-CSE-ConnectionGUID: ryDovsiKQpWg28lkOPffRA==
X-CSE-MsgGUID: WNFg2OzzQmGU3iCLQCxMXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106307892"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="106307892"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 01:29:14 -0700
X-CSE-ConnectionGUID: w3ufbJiSRYmAYyahxfZnkA==
X-CSE-MsgGUID: cinOxnaEQueu/1fEzk6zdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="248836375"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jun 2026 01:29:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weTpz-0000000088v-3fzp;
	Tue, 30 Jun 2026 08:29:02 +0000
Date: Tue, 30 Jun 2026 16:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1] mm/hmm.c:224:6: error:
 implicit declaration of function 'pte_none'; did you mean 'p4d_none'?
Message-ID: <202606301638.uVoWnByu-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   94b9cd1032259522cbe4fea9ac3b37637b2080b5
commit: 2ea27b7efa3f6fd0b4fab6a748ab08322280f29b [1/1] ANDROID: GKI: Kconfi=
g.gki: enable CONFIG_HMM_MIRROR with HIDDEN GPU
config: arm-randconfig-r064-20260630 (https://download.01.org/0day-ci/archi=
ve/20260630/202606301638.uVoWnByu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260630/202606301638.uVoWnByu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301638.uVoWnByu-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   mm/hmm.c: In function 'pmd_to_hmm_pfn_flags':
   mm/hmm.c:177:6: error: implicit declaration of function 'pmd_protnone' [=
-Werror=3Dimplicit-function-declaration]
     177 |  if (pmd_protnone(pmd))
         |      ^~~~~~~~~~~~
   mm/hmm.c:179:10: error: implicit declaration of function 'pmd_write'; di=
d you mean 'pgd_write'? [-Werror=3Dimplicit-function-declaration]
     179 |  return (pmd_write(pmd) ? (HMM_PFN_VALID | HMM_PFN_WRITE) :
         |          ^~~~~~~~~
         |          pgd_write
   mm/hmm.c:181:29: error: 'PMD_SHIFT' undeclared (first use in this functi=
on); did you mean 'PUD_SHIFT'?
     181 |         hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT);
         |                             ^~~~~~~~~
         |                             PUD_SHIFT
   mm/hmm.c:181:29: note: each undeclared identifier is reported only once =
for each function it appears in
   mm/hmm.c: In function 'hmm_is_device_private_entry':
   mm/hmm.c:216:9: error: implicit declaration of function 'is_device_priva=
te_entry'; did you mean 'hmm_is_device_private_entry'? [-Werror=3Dimplicit-=
function-declaration]
     216 |  return is_device_private_entry(entry) &&
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         hmm_is_device_private_entry
   mm/hmm.c:217:3: error: implicit declaration of function 'device_private_=
entry_to_page' [-Werror=3Dimplicit-function-declaration]
     217 |   device_private_entry_to_page(entry)->pgmap->owner =3D=3D
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:217:38: error: invalid type argument of '->' (have 'int')
     217 |   device_private_entry_to_page(entry)->pgmap->owner =3D=3D
         |                                      ^~
   mm/hmm.c: In function 'pte_to_hmm_pfn_flags':
>> mm/hmm.c:224:6: error: implicit declaration of function 'pte_none'; did =
you mean 'p4d_none'? [-Werror=3Dimplicit-function-declaration]
     224 |  if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
         |      ^~~~~~~~
         |      p4d_none
   mm/hmm.c:224:24: error: implicit declaration of function 'pte_present'; =
did you mean 'p4d_present'? [-Werror=3Dimplicit-function-declaration]
     224 |  if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
         |                        ^~~~~~~~~~~
         |                        p4d_present
   mm/hmm.c:224:44: error: implicit declaration of function 'pte_protnone' =
[-Werror=3Dimplicit-function-declaration]
     224 |  if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
         |                                            ^~~~~~~~~~~~
   mm/hmm.c:226:9: error: implicit declaration of function 'pte_write'; did=
 you mean 'pgd_write'? [-Werror=3Dimplicit-function-declaration]
     226 |  return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_P=
FN_VALID;
         |         ^~~~~~~~~
         |         pgd_write
   mm/hmm.c: In function 'hmm_vma_handle_pte':
   mm/hmm.c:250:23: error: implicit declaration of function 'pte_to_swp_ent=
ry' [-Werror=3Dimplicit-function-declaration]
     250 |   swp_entry_t entry =3D pte_to_swp_entry(pte);
         |                       ^~~~~~~~~~~~~~~~
   mm/hmm.c:250:23: error: invalid initializer
>> mm/hmm.c:258:8: error: implicit declaration of function 'is_write_device=
_private_entry'; did you mean 'hmm_is_device_private_entry'? [-Werror=3Dimp=
licit-function-declaration]
     258 |    if (is_write_device_private_entry(entry))
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |        hmm_is_device_private_entry
   mm/hmm.c:260:15: error: implicit declaration of function 'device_private=
_entry_to_pfn' [-Werror=3Dimplicit-function-declaration]
     260 |    *hmm_pfn =3D device_private_entry_to_pfn(entry) |
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:272:8: error: implicit declaration of function 'non_swap_entry'=
 [-Werror=3Dimplicit-function-declaration]
     272 |   if (!non_swap_entry(entry))
         |        ^~~~~~~~~~~~~~
   mm/hmm.c:275:7: error: implicit declaration of function 'is_migration_en=
try' [-Werror=3Dimplicit-function-declaration]
     275 |   if (is_migration_entry(entry)) {
         |       ^~~~~~~~~~~~~~~~~~
   mm/hmm.c:276:4: error: implicit declaration of function 'pte_unmap'; did=
 you mean 'memunmap'? [-Werror=3Dimplicit-function-declaration]
     276 |    pte_unmap(ptep);
         |    ^~~~~~~~~
         |    memunmap
   mm/hmm.c:278:4: error: implicit declaration of function 'migration_entry=
_wait' [-Werror=3Dimplicit-function-declaration]
     278 |    migration_entry_wait(walk->mm, pmdp, addr);
         |    ^~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:297:39: error: implicit declaration of function 'pte_pfn' [-Wer=
ror=3Dimplicit-function-declaration]
     297 |  if (pte_special(pte) && !is_zero_pfn(pte_pfn(pte))) {
         |                                       ^~~~~~~
   mm/hmm.c: In function 'hmm_vma_walk_pmd':
   mm/hmm.c:331:6: error: implicit declaration of function 'pmd_none'; did =
you mean 'p4d_none'? [-Werror=3Dimplicit-function-declaration]
     331 |  if (pmd_none(pmd))
         |      ^~~~~~~~
         |      p4d_none
   mm/hmm.c:334:35: error: implicit declaration of function 'is_pmd_migrati=
on_entry' [-Werror=3Dimplicit-function-declaration]
     334 |  if (thp_migration_supported() && is_pmd_migration_entry(pmd)) {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:337:4: error: implicit declaration of function 'pmd_migration_e=
ntry_wait' [-Werror=3Dimplicit-function-declaration]
     337 |    pmd_migration_entry_wait(walk->mm, pmdp);
         |    ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:343:7: error: implicit declaration of function 'pmd_present'; d=
id you mean 'p4d_present'? [-Werror=3Dimplicit-function-declaration]
     343 |  if (!pmd_present(pmd)) {
         |       ^~~~~~~~~~~
         |       p4d_present
>> mm/hmm.c:349:6: error: implicit declaration of function 'pmd_devmap'; di=
d you mean 'pte_devmap'? [-Werror=3Dimplicit-function-declaration]
     349 |  if (pmd_devmap(pmd) || pmd_trans_huge(pmd)) {
         |      ^~~~~~~~~~
         |      pte_devmap
   mm/hmm.c:349:25: error: implicit declaration of function 'pmd_trans_huge=
'; did you mean 'pmd_trans_huge_lock'? [-Werror=3Dimplicit-function-declara=
tion]
     349 |  if (pmd_devmap(pmd) || pmd_trans_huge(pmd)) {
         |                         ^~~~~~~~~~~~~~
         |                         pmd_trans_huge_lock
>> mm/hmm.c:359:9: error: implicit declaration of function 'pmd_read_atomic=
' [-Werror=3Dimplicit-function-declaration]
     359 |   pmd =3D pmd_read_atomic(pmdp);
         |         ^~~~~~~~~~~~~~~
   mm/hmm.c:373:6: error: implicit declaration of function 'pmd_bad'; did y=
ou mean 'p4d_bad'? [-Werror=3Dimplicit-function-declaration]
     373 |  if (pmd_bad(pmd)) {
         |      ^~~~~~~
         |      p4d_bad
   mm/hmm.c:379:9: error: implicit declaration of function 'pte_offset_map'=
; did you mean 'pte_offset_map_lock'? [-Werror=3Dimplicit-function-declarat=
ion]
     379 |  ptep =3D pte_offset_map(pmdp, addr);
         |         ^~~~~~~~~~~~~~
         |         pte_offset_map_lock
   mm/hmm.c:379:7: warning: assignment to 'pte_t *' {aka 'long unsigned int=
 *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     379 |  ptep =3D pte_offset_map(pmdp, addr);
         |       ^
   mm/hmm.c: In function 'hmm_is_device_private_entry':
   mm/hmm.c:219:1: warning: control reaches end of non-void function [-Wret=
urn-type]
     219 | }
         | ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for HMM_MIRROR
   Depends on [n]: MMU [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_GPU_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=3Dn] && !UML && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=3Dn] && WIRELESS [=3Dn] && PROC_FS [=3Dy] && WEXT_=
CORE [=3Dy]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
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
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=3Dn] && !UML && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=3Dn] && !UML && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && MMU [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=3Dn] && !UML && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=3Dn] && !UML && SND [=3Dn] && SND_JACK [=3Dy]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]


vim +224 mm/hmm.c

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
8d63e4cd62b258 Ralph Campbell    2018-01-31  250  		swp_entry_t entry =3D p=
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
17ffdc482982af Christoph Hellwig 2020-03-16 @258  			if (is_write_device_pr=
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
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  315  static int hmm_=
vma_walk_pmd(pmd_t *pmdp,
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  316  			    unsigned=
 long start,
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  317  			    unsigned=
 long end,
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  318  			    struct m=
m_walk *walk)
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  319  {
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  320  	struct hmm_vma=
_walk *hmm_vma_walk =3D walk->private;
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  321  	struct hmm_ran=
ge *range =3D hmm_vma_walk->range;
2733ea144dcce7 Jason Gunthorpe   2020-05-01  322  	unsigned long *hmm_pfns =
=3D
2733ea144dcce7 Jason Gunthorpe   2020-05-01  323  		&range->hmm_pfns[(start=
 - range->start) >> PAGE_SHIFT];
2288a9a68175ce Jason Gunthorpe   2020-03-05  324  	unsigned long npages =3D =
(end - start) >> PAGE_SHIFT;
2288a9a68175ce Jason Gunthorpe   2020-03-05  325  	unsigned long addr =3D s=
tart;
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  326  	pte_t *ptep;
d08faca018c461 J=C3=A9r=C3=B4me Glisse     2018-10-30  327  	pmd_t pmd;
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  328 =20
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  329  again:
d08faca018c461 J=C3=A9r=C3=B4me Glisse     2018-10-30  330  	pmd =3D READ_O=
NCE(*pmdp);
d08faca018c461 J=C3=A9r=C3=B4me Glisse     2018-10-30  331  	if (pmd_none(p=
md))
b7a16c7ad790d0 Steven Price      2020-02-03  332  		return hmm_vma_walk_hol=
e(start, end, -1, walk);
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  333 =20
d08faca018c461 J=C3=A9r=C3=B4me Glisse     2018-10-30  334  	if (thp_migrat=
ion_supported() && is_pmd_migration_entry(pmd)) {
2733ea144dcce7 Jason Gunthorpe   2020-05-01  335  		if (hmm_range_need_faul=
t(hmm_vma_walk, hmm_pfns, npages, 0)) {
d08faca018c461 J=C3=A9r=C3=B4me Glisse     2018-10-30  336  			hmm_vma_walk=
->last =3D addr;
d2e8d551165ccb Ralph Campbell    2019-07-25  337  			pmd_migration_entry_wa=
it(walk->mm, pmdp);
73231612dc7c90 J=C3=A9r=C3=B4me Glisse     2019-05-13  338  			return -EBUS=
Y;
d08faca018c461 J=C3=A9r=C3=B4me Glisse     2018-10-30  339  		}
2733ea144dcce7 Jason Gunthorpe   2020-05-01  340  		return hmm_pfns_fill(st=
art, end, range, 0);
2288a9a68175ce Jason Gunthorpe   2020-03-05  341  	}
2288a9a68175ce Jason Gunthorpe   2020-03-05  342 =20
2288a9a68175ce Jason Gunthorpe   2020-03-05  343  	if (!pmd_present(pmd)) {
2733ea144dcce7 Jason Gunthorpe   2020-05-01  344  		if (hmm_range_need_faul=
t(hmm_vma_walk, hmm_pfns, npages, 0))
2288a9a68175ce Jason Gunthorpe   2020-03-05  345  			return -EFAULT;
d28c2c9a487708 Ralph Campbell    2019-11-04  346  		return hmm_pfns_fill(st=
art, end, range, HMM_PFN_ERROR);
2288a9a68175ce Jason Gunthorpe   2020-03-05  347  	}
d08faca018c461 J=C3=A9r=C3=B4me Glisse     2018-10-30  348 =20
d08faca018c461 J=C3=A9r=C3=B4me Glisse     2018-10-30 @349  	if (pmd_devmap=
(pmd) || pmd_trans_huge(pmd)) {
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  350  		/*
d2e8d551165ccb Ralph Campbell    2019-07-25  351  		 * No need to take pmd_=
lock here, even if some other thread
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  352  		 * is splitti=
ng the huge pmd we will get that event through
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  353  		 * mmu_notifi=
er callback.
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  354  		 *
d2e8d551165ccb Ralph Campbell    2019-07-25  355  		 * So just read pmd val=
ue and check again it's a transparent
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  356  		 * huge or de=
vice mapping one and compute corresponding pfn
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  357  		 * values.
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  358  		 */
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10 @359  		pmd =3D pmd_r=
ead_atomic(pmdp);
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  360  		barrier();
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  361  		if (!pmd_devm=
ap(pmd) && !pmd_trans_huge(pmd))
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  362  			goto again;
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  363 =20
2733ea144dcce7 Jason Gunthorpe   2020-05-01  364  		return hmm_vma_handle_p=
md(walk, addr, end, hmm_pfns, pmd);
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  365  	}
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  366 =20
d08faca018c461 J=C3=A9r=C3=B4me Glisse     2018-10-30  367  	/*
d2e8d551165ccb Ralph Campbell    2019-07-25  368  	 * We have handled all t=
he valid cases above ie either none, migration,
d08faca018c461 J=C3=A9r=C3=B4me Glisse     2018-10-30  369  	 * huge or tra=
nsparent huge. At this point either it is a valid pmd
d08faca018c461 J=C3=A9r=C3=B4me Glisse     2018-10-30  370  	 * entry point=
ing to pte directory or it is a bad pmd that will not
d08faca018c461 J=C3=A9r=C3=B4me Glisse     2018-10-30  371  	 * recover.
d08faca018c461 J=C3=A9r=C3=B4me Glisse     2018-10-30  372  	 */
2288a9a68175ce Jason Gunthorpe   2020-03-05  373  	if (pmd_bad(pmd)) {
2733ea144dcce7 Jason Gunthorpe   2020-05-01  374  		if (hmm_range_need_faul=
t(hmm_vma_walk, hmm_pfns, npages, 0))
2288a9a68175ce Jason Gunthorpe   2020-03-05  375  			return -EFAULT;
d28c2c9a487708 Ralph Campbell    2019-11-04  376  		return hmm_pfns_fill(st=
art, end, range, HMM_PFN_ERROR);
2288a9a68175ce Jason Gunthorpe   2020-03-05  377  	}
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  378 =20
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  379  	ptep =3D pte_o=
ffset_map(pmdp, addr);
2733ea144dcce7 Jason Gunthorpe   2020-05-01  380  	for (; addr < end; addr =
+=3D PAGE_SIZE, ptep++, hmm_pfns++) {
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  381  		int r;
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  382 =20
2733ea144dcce7 Jason Gunthorpe   2020-05-01  383  		r =3D hmm_vma_handle_pt=
e(walk, addr, end, pmdp, ptep, hmm_pfns);
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  384  		if (r) {
dfdc22078f3f06 Jason Gunthorpe   2020-02-28  385  			/* hmm_vma_handle_pte(=
) did pte_unmap() */
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  386  			return r;
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse     2018-04-10  387  		}
da4c3c735ea4dc J=C3=A9r=C3=B4me Glisse     2017-09-08  388  	}
da4c3c735ea4dc J=C3=A9r=C3=B4me Glisse     2017-09-08  389  	pte_unmap(ptep=
 - 1);
da4c3c735ea4dc J=C3=A9r=C3=B4me Glisse     2017-09-08  390  	return 0;
da4c3c735ea4dc J=C3=A9r=C3=B4me Glisse     2017-09-08  391  }
da4c3c735ea4dc J=C3=A9r=C3=B4me Glisse     2017-09-08  392 =20

:::::: The code at line 224 was first introduced by commit
:::::: 789c2af88f24d1db983aae49b5c4561e6e02ff5b mm/hmm: support automatic N=
UMA balancing

:::::: TO: Philip Yang <Philip.Yang@amd.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
