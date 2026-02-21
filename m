Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B013E2FE044
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 08:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771661463; cv=none; b=hHaU2QvYF7FEfbNgs/qw2o9OSiSR+n854f13LNYRR5xDa0eGQcEh3yZdrco9wPMiko2wDfXep8x4blhM7vlQxcrWtLqjaqMo0VLJ0k+ku8djAKIm7UcRp2pLr9FsAP6yBjFhapShxIJppQ8fs39iZGBDPjMvEiwxMWe7AdcBWFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771661463; c=relaxed/simple;
	bh=BJG5xokfyy//iaMoWW5lsFRiso00rIS7x8O2Z+sMt6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=opSNzukrsFKHH0+DLe9ejsxauxoKx4o+7logiLT1aqh0ouUqeR6Nq3jjaYuSUrd2DbAifgREvj8PMZr21SC2I2GHcSLxdBdyLFGw1Suin/PB382InFMleXgnluM2nbCZ3eI+vjjCYp3qCul7PQ0EqTDZ3NslfqrFQAV/gbx8N4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdW7ALIO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdW7ALIO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771661460; x=1803197460;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BJG5xokfyy//iaMoWW5lsFRiso00rIS7x8O2Z+sMt6g=;
  b=fdW7ALIOruFMVXd7JftZaGgz4+OYbHeksXVGnuFvVV0X6ydsKBt6f5db
   hV52UhAzBuxl6RCBbFC2UEh6JVQFgUN/EoWBjNWrj15CkiwaTJM1/Xrmd
   fG5XfuH+h9JojCUQQc1M61Hhin/1IgP5SrK0FWSyCGRCXNUkKbS1NsiuM
   70KyCZCdKRruf4DK5Gw6PeFC9wSTUsBbKfAMtiHwzd1WHnI8Z/Ok40D61
   WAV6XpJq+qQtEtq5SVK6OKaxPdGJlQXGnlFJhmbY/6BtMFiMNkbCyu21j
   LKJwhaJpEl5ijZeybdyx2sjhH1/hjbD3TFqqw6S1vBFmU7qJlsoQ0a7U5
   w==;
X-CSE-ConnectionGUID: EuhR0bi/TQmnnGAKr3jayg==
X-CSE-MsgGUID: YPoMBNypR3ykuAggQ6GsPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="83060677"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="83060677"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 00:11:00 -0800
X-CSE-ConnectionGUID: UXPcArIMQ1+c1cR0whROfg==
X-CSE-MsgGUID: 2zAF8LSsRWaoPwIvumZJ/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="213568989"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Feb 2026 00:10:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vti4m-000000014nc-1t7o;
	Sat, 21 Feb 2026 08:10:56 +0000
Date: Sat, 21 Feb 2026 16:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 204/204] mm/hmm.c:379:7:
 warning: assignment makes pointer from integer without a cast
Message-ID: <202602211607.iJYYNIa6-lkp@intel.com>
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
head:   428f501f574bae8d1bb15211ccfdac399e4f4e7d
commit: 2ea27b7efa3f6fd0b4fab6a748ab08322280f29b [204/204] ANDROID: GKI: Kc=
onfig.gki: enable CONFIG_HMM_MIRROR with HIDDEN GPU
config: arm-randconfig-002-20260221 (https://download.01.org/0day-ci/archiv=
e/20260221/202602211607.iJYYNIa6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260221/202602211607.iJYYNIa6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602211607.iJYYNIa6-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   mm/hmm.c:181:29: note: each undeclared identifier is reported only once =
for each function it appears in
   mm/hmm.c: In function 'hmm_is_device_private_entry':
   mm/hmm.c:216:9: error: implicit declaration of function 'is_device_priva=
te_entry'; did you mean 'hmm_is_device_private_entry'? [-Werror=3Dimplicit-=
function-declaration]
     return is_device_private_entry(entry) &&
            ^~~~~~~~~~~~~~~~~~~~~~~
            hmm_is_device_private_entry
   mm/hmm.c:217:3: error: implicit declaration of function 'device_private_=
entry_to_page'; did you mean 'is_device_private_page'? [-Werror=3Dimplicit-=
function-declaration]
      device_private_entry_to_page(entry)->pgmap->owner =3D=3D
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      is_device_private_page
   mm/hmm.c:217:38: error: invalid type argument of '->' (have 'int')
      device_private_entry_to_page(entry)->pgmap->owner =3D=3D
                                         ^~
   mm/hmm.c: In function 'pte_to_hmm_pfn_flags':
   mm/hmm.c:224:6: error: implicit declaration of function 'pte_none'; did =
you mean 'p4d_none'? [-Werror=3Dimplicit-function-declaration]
     if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
         ^~~~~~~~
         p4d_none
   mm/hmm.c:224:24: error: implicit declaration of function 'pte_present'; =
did you mean 'p4d_present'? [-Werror=3Dimplicit-function-declaration]
     if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
                           ^~~~~~~~~~~
                           p4d_present
   mm/hmm.c:224:44: error: implicit declaration of function 'pte_protnone';=
 did you mean 'p4d_none'? [-Werror=3Dimplicit-function-declaration]
     if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
                                               ^~~~~~~~~~~~
                                               p4d_none
   mm/hmm.c:226:9: error: implicit declaration of function 'pte_write'; did=
 you mean 'pgd_write'? [-Werror=3Dimplicit-function-declaration]
     return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALI=
D;
            ^~~~~~~~~
            pgd_write
   mm/hmm.c: In function 'hmm_vma_handle_pte':
   mm/hmm.c:250:23: error: implicit declaration of function 'pte_to_swp_ent=
ry'; did you mean 'pte_lockptr'? [-Werror=3Dimplicit-function-declaration]
      swp_entry_t entry =3D pte_to_swp_entry(pte);
                          ^~~~~~~~~~~~~~~~
                          pte_lockptr
   mm/hmm.c:250:23: error: invalid initializer
   mm/hmm.c:258:8: error: implicit declaration of function 'is_write_device=
_private_entry'; did you mean 'hmm_is_device_private_entry'? [-Werror=3Dimp=
licit-function-declaration]
       if (is_write_device_private_entry(entry))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           hmm_is_device_private_entry
   mm/hmm.c:260:15: error: implicit declaration of function 'device_private=
_entry_to_pfn'; did you mean 'device_create_with_groups'? [-Werror=3Dimplic=
it-function-declaration]
       *hmm_pfn =3D device_private_entry_to_pfn(entry) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
                  device_create_with_groups
   mm/hmm.c:272:8: error: implicit declaration of function 'non_swap_entry'=
; did you mean 'init_wait_entry'? [-Werror=3Dimplicit-function-declaration]
      if (!non_swap_entry(entry))
           ^~~~~~~~~~~~~~
           init_wait_entry
   mm/hmm.c:275:7: error: implicit declaration of function 'is_migration_en=
try'; did you mean 'list_first_entry'? [-Werror=3Dimplicit-function-declara=
tion]
      if (is_migration_entry(entry)) {
          ^~~~~~~~~~~~~~~~~~
          list_first_entry
   mm/hmm.c:276:4: error: implicit declaration of function 'pte_unmap'; did=
 you mean 'memunmap'? [-Werror=3Dimplicit-function-declaration]
       pte_unmap(ptep);
       ^~~~~~~~~
       memunmap
   mm/hmm.c:278:4: error: implicit declaration of function 'migration_entry=
_wait'; did you mean 'in_entry_text'? [-Werror=3Dimplicit-function-declarat=
ion]
       migration_entry_wait(walk->mm, pmdp, addr);
       ^~~~~~~~~~~~~~~~~~~~
       in_entry_text
   mm/hmm.c:297:39: error: implicit declaration of function 'pte_pfn'; did =
you mean 'pte_val'? [-Werror=3Dimplicit-function-declaration]
     if (pte_special(pte) && !is_zero_pfn(pte_pfn(pte))) {
                                          ^~~~~~~
                                          pte_val
   mm/hmm.c: In function 'hmm_vma_walk_pmd':
   mm/hmm.c:331:6: error: implicit declaration of function 'pmd_none'; did =
you mean 'p4d_none'? [-Werror=3Dimplicit-function-declaration]
     if (pmd_none(pmd))
         ^~~~~~~~
         p4d_none
   mm/hmm.c:334:35: error: implicit declaration of function 'is_pmd_migrati=
on_entry'; did you mean 'list_first_entry'? [-Werror=3Dimplicit-function-de=
claration]
     if (thp_migration_supported() && is_pmd_migration_entry(pmd)) {
                                      ^~~~~~~~~~~~~~~~~~~~~~
                                      list_first_entry
   mm/hmm.c:337:4: error: implicit declaration of function 'pmd_migration_e=
ntry_wait' [-Werror=3Dimplicit-function-declaration]
       pmd_migration_entry_wait(walk->mm, pmdp);
       ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:343:7: error: implicit declaration of function 'pmd_present'; d=
id you mean 'p4d_present'? [-Werror=3Dimplicit-function-declaration]
     if (!pmd_present(pmd)) {
          ^~~~~~~~~~~
          p4d_present
   mm/hmm.c:349:6: error: implicit declaration of function 'pmd_devmap'; di=
d you mean 'pte_devmap'? [-Werror=3Dimplicit-function-declaration]
     if (pmd_devmap(pmd) || pmd_trans_huge(pmd)) {
         ^~~~~~~~~~
         pte_devmap
   mm/hmm.c:349:25: error: implicit declaration of function 'pmd_trans_huge=
'; did you mean 'pmd_trans_huge_lock'? [-Werror=3Dimplicit-function-declara=
tion]
     if (pmd_devmap(pmd) || pmd_trans_huge(pmd)) {
                            ^~~~~~~~~~~~~~
                            pmd_trans_huge_lock
   mm/hmm.c:359:9: error: implicit declaration of function 'pmd_read_atomic=
'; did you mean 'kmap_atomic'? [-Werror=3Dimplicit-function-declaration]
      pmd =3D pmd_read_atomic(pmdp);
            ^~~~~~~~~~~~~~~
            kmap_atomic
   mm/hmm.c:373:6: error: implicit declaration of function 'pmd_bad'; did y=
ou mean 'p4d_bad'? [-Werror=3Dimplicit-function-declaration]
     if (pmd_bad(pmd)) {
         ^~~~~~~
         p4d_bad
   mm/hmm.c:379:9: error: implicit declaration of function 'pte_offset_map'=
; did you mean 'pte_offset_map_lock'? [-Werror=3Dimplicit-function-declarat=
ion]
     ptep =3D pte_offset_map(pmdp, addr);
            ^~~~~~~~~~~~~~
            pte_offset_map_lock
>> mm/hmm.c:379:7: warning: assignment makes pointer from integer without a=
 cast [-Wint-conversion]
     ptep =3D pte_offset_map(pmdp, addr);
          ^
   mm/hmm.c: In function 'hmm_is_device_private_entry':
   mm/hmm.c:219:1: warning: control reaches end of non-void function [-Wret=
urn-type]
    }
    ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
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
   WARNING: unmet direct dependencies detected for HMM_MIRROR
   Depends on [n]: MMU [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_GPU_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=3Dn] && !UML && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=3Dn] && MEMORY_BALLOON [=3Dy]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=3Dy]


vim +379 mm/hmm.c

53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  314 =20
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  315  static int hmm_vm=
a_walk_pmd(pmd_t *pmdp,
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  316  			    unsigned l=
ong start,
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  317  			    unsigned l=
ong end,
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  318  			    struct mm_=
walk *walk)
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  319  {
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  320  	struct hmm_vma_w=
alk *hmm_vma_walk =3D walk->private;
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  321  	struct hmm_range=
 *range =3D hmm_vma_walk->range;
2733ea144dcce7 Jason Gunthorpe 2020-05-01  322  	unsigned long *hmm_pfns =
=3D
2733ea144dcce7 Jason Gunthorpe 2020-05-01  323  		&range->hmm_pfns[(start -=
 range->start) >> PAGE_SHIFT];
2288a9a68175ce Jason Gunthorpe 2020-03-05  324  	unsigned long npages =3D (=
end - start) >> PAGE_SHIFT;
2288a9a68175ce Jason Gunthorpe 2020-03-05  325  	unsigned long addr =3D sta=
rt;
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  326  	pte_t *ptep;
d08faca018c461 J=C3=A9r=C3=B4me Glisse   2018-10-30  327  	pmd_t pmd;
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  328 =20
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  329  again:
d08faca018c461 J=C3=A9r=C3=B4me Glisse   2018-10-30  330  	pmd =3D READ_ONC=
E(*pmdp);
d08faca018c461 J=C3=A9r=C3=B4me Glisse   2018-10-30  331  	if (pmd_none(pmd=
))
b7a16c7ad790d0 Steven Price    2020-02-03  332  		return hmm_vma_walk_hole(=
start, end, -1, walk);
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  333 =20
d08faca018c461 J=C3=A9r=C3=B4me Glisse   2018-10-30  334  	if (thp_migratio=
n_supported() && is_pmd_migration_entry(pmd)) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  335  		if (hmm_range_need_fault(=
hmm_vma_walk, hmm_pfns, npages, 0)) {
d08faca018c461 J=C3=A9r=C3=B4me Glisse   2018-10-30  336  			hmm_vma_walk->=
last =3D addr;
d2e8d551165ccb Ralph Campbell  2019-07-25  337  			pmd_migration_entry_wait=
(walk->mm, pmdp);
73231612dc7c90 J=C3=A9r=C3=B4me Glisse   2019-05-13  338  			return -EBUSY;
d08faca018c461 J=C3=A9r=C3=B4me Glisse   2018-10-30  339  		}
2733ea144dcce7 Jason Gunthorpe 2020-05-01  340  		return hmm_pfns_fill(star=
t, end, range, 0);
2288a9a68175ce Jason Gunthorpe 2020-03-05  341  	}
2288a9a68175ce Jason Gunthorpe 2020-03-05  342 =20
2288a9a68175ce Jason Gunthorpe 2020-03-05  343  	if (!pmd_present(pmd)) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  344  		if (hmm_range_need_fault(=
hmm_vma_walk, hmm_pfns, npages, 0))
2288a9a68175ce Jason Gunthorpe 2020-03-05  345  			return -EFAULT;
d28c2c9a487708 Ralph Campbell  2019-11-04  346  		return hmm_pfns_fill(star=
t, end, range, HMM_PFN_ERROR);
2288a9a68175ce Jason Gunthorpe 2020-03-05  347  	}
d08faca018c461 J=C3=A9r=C3=B4me Glisse   2018-10-30  348 =20
d08faca018c461 J=C3=A9r=C3=B4me Glisse   2018-10-30  349  	if (pmd_devmap(p=
md) || pmd_trans_huge(pmd)) {
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  350  		/*
d2e8d551165ccb Ralph Campbell  2019-07-25  351  		 * No need to take pmd_lo=
ck here, even if some other thread
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  352  		 * is splitting=
 the huge pmd we will get that event through
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  353  		 * mmu_notifier=
 callback.
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  354  		 *
d2e8d551165ccb Ralph Campbell  2019-07-25  355  		 * So just read pmd value=
 and check again it's a transparent
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  356  		 * huge or devi=
ce mapping one and compute corresponding pfn
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  357  		 * values.
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  358  		 */
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  359  		pmd =3D pmd_rea=
d_atomic(pmdp);
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  360  		barrier();
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  361  		if (!pmd_devmap=
(pmd) && !pmd_trans_huge(pmd))
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  362  			goto again;
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  363 =20
2733ea144dcce7 Jason Gunthorpe 2020-05-01  364  		return hmm_vma_handle_pmd=
(walk, addr, end, hmm_pfns, pmd);
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  365  	}
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  366 =20
d08faca018c461 J=C3=A9r=C3=B4me Glisse   2018-10-30  367  	/*
d2e8d551165ccb Ralph Campbell  2019-07-25  368  	 * We have handled all the=
 valid cases above ie either none, migration,
d08faca018c461 J=C3=A9r=C3=B4me Glisse   2018-10-30  369  	 * huge or trans=
parent huge. At this point either it is a valid pmd
d08faca018c461 J=C3=A9r=C3=B4me Glisse   2018-10-30  370  	 * entry pointin=
g to pte directory or it is a bad pmd that will not
d08faca018c461 J=C3=A9r=C3=B4me Glisse   2018-10-30  371  	 * recover.
d08faca018c461 J=C3=A9r=C3=B4me Glisse   2018-10-30  372  	 */
2288a9a68175ce Jason Gunthorpe 2020-03-05  373  	if (pmd_bad(pmd)) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  374  		if (hmm_range_need_fault(=
hmm_vma_walk, hmm_pfns, npages, 0))
2288a9a68175ce Jason Gunthorpe 2020-03-05  375  			return -EFAULT;
d28c2c9a487708 Ralph Campbell  2019-11-04  376  		return hmm_pfns_fill(star=
t, end, range, HMM_PFN_ERROR);
2288a9a68175ce Jason Gunthorpe 2020-03-05  377  	}
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  378 =20
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10 @379  	ptep =3D pte_off=
set_map(pmdp, addr);
2733ea144dcce7 Jason Gunthorpe 2020-05-01  380  	for (; addr < end; addr +=
=3D PAGE_SIZE, ptep++, hmm_pfns++) {
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  381  		int r;
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  382 =20
2733ea144dcce7 Jason Gunthorpe 2020-05-01  383  		r =3D hmm_vma_handle_pte(=
walk, addr, end, pmdp, ptep, hmm_pfns);
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  384  		if (r) {
dfdc22078f3f06 Jason Gunthorpe 2020-02-28  385  			/* hmm_vma_handle_pte() =
did pte_unmap() */
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  386  			return r;
53f5c3f489ecdd J=C3=A9r=C3=B4me Glisse   2018-04-10  387  		}
da4c3c735ea4dc J=C3=A9r=C3=B4me Glisse   2017-09-08  388  	}
da4c3c735ea4dc J=C3=A9r=C3=B4me Glisse   2017-09-08  389  	pte_unmap(ptep -=
 1);
da4c3c735ea4dc J=C3=A9r=C3=B4me Glisse   2017-09-08  390  	return 0;
da4c3c735ea4dc J=C3=A9r=C3=B4me Glisse   2017-09-08  391  }
da4c3c735ea4dc J=C3=A9r=C3=B4me Glisse   2017-09-08  392 =20

:::::: The code at line 379 was first introduced by commit
:::::: 53f5c3f489ecddc7570a2e2422a6fc5b25007b9d mm/hmm: factor out pte and =
pmd handling to simplify hmm_vma_walk_pmd()

:::::: TO: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
