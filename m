Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8EB3FF1B5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 21:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571405; cv=none; b=Zc8rzGW/p96r3lWP3o7Z0dTHbsxRKNR+Rpa658yIYbApDpZF/JyuuOjInJif01Fi5VO2FwxQPYn7xB8nc9zfXPExM4KuCfcS0bWYR9F0HCoCvD7B4YCb4liu1paGUSM3uSIMG16vNQNPxPZo4b7PtT62C0B7YsQM+f6AlOzQykI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571405; c=relaxed/simple;
	bh=NvFx+o+d6Omq+K83m43IR2X9hFA1gBnlYg7bYETFyLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Bw/cXvXqhOlSrtTv4BRPD3+t94NIGv+w611xTBuEJBo5YxTCAnRcrp6gwL3B7r00bXTp5kAJQASYXNCJlICnEsNJPCveClAQRf4g7Fm0t3eHN3vOw4K76fgXDx3tj7gQD0+RcNstidDRB8z6yZsgcHflg6mQdHX5P3NCcMDjlYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOF+YUKf; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOF+YUKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786571403; x=1818107403;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NvFx+o+d6Omq+K83m43IR2X9hFA1gBnlYg7bYETFyLk=;
  b=ZOF+YUKfAFRq3R16cULTMH+kii9XrFlYv26UAztPBE/026g49yPC6DRD
   tmVo70OCvSLMQ8+8IstIGpIts55oWcejZ/8+QU/QDTqFRUtHB4vFxt6XD
   0/rO9+Yi6fqL85szrEArt+w+lJerobuEt0GV7sRZriLF1i5xnGt6wgXXu
   sRsnqzbUu9rC8fxJEP6c9+T8BefzBIiG2kw9ZHen8x6MEWsUrnEb195TF
   62rS4LqNyia0/x1HHdlug5mXqqGhzjQJRjKVf/D4RkGkXkJkW9LXjSKoy
   P0hbE00po/2gFAf7KdyRsIy35QxPr7E/u3ZGhmDtyXqjdGngZ4qowizeV
   Q==;
X-CSE-ConnectionGUID: lL0fn3lbR2qsp1V5F8UapQ==
X-CSE-MsgGUID: 2WZ8zfQZQM6HOAM8HrFz+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87355221"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="87355221"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 14:50:02 -0700
X-CSE-ConnectionGUID: 3xLR6oOuSX6aOdUqxJhcjA==
X-CSE-MsgGUID: GRQrPsg7TaGOnwxN9qFUzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="267265744"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Aug 2026 14:50:02 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuGpi-00000000Rpi-2q3z;
	Wed, 12 Aug 2026 21:49:58 +0000
Date: Thu, 13 Aug 2026 05:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 1/1] mm/hmm.c:219:1: warning:
 control reaches end of non-void function
Message-ID: <202608130500.tIkJeQA5-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   1d929bc650954dfa344168039d30b1bc13a3e48e
commit: 2ea27b7efa3f6fd0b4fab6a748ab08322280f29b [1/1] ANDROID: GKI: Kconfi=
g.gki: enable CONFIG_HMM_MIRROR with HIDDEN GPU
config: arm-randconfig-003-20260813 (https://download.01.org/0day-ci/archiv=
e/20260813/202608130500.tIkJeQA5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260813/202608130500.tIkJeQA5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130500.tIkJeQA5-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

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
   mm/hmm.c:379:7: warning: assignment makes pointer from integer without a=
 cast [-Wint-conversion]
     ptep =3D pte_offset_map(pmdp, addr);
          ^
   mm/hmm.c: In function 'hmm_is_device_private_entry':
>> mm/hmm.c:219:1: warning: control reaches end of non-void function [-Wret=
urn-type]
    }
    ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=3Dm] && !UML && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=3Dy] && WIRELESS [=3Dn] && PROC_FS [=3Dn] && WEXT_=
CORE [=3Dy]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=3Dy] && WIRELESS [=3Dn]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=3Dn] && MEMORY_BALLOON [=3Dy]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=3Dy] && WIRELESS [=3Dn]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=3Dy] && WIRELESS [=3Dn]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=3Dy] && WIRELESS [=3Dn] && (CFG80211_WEXT [=3Dn] |=
| WIRELESS_EXT [=3Dy])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=3Dm] && !UML && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=3Dm] && !UML && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && MMU [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=3Dm] && !UML && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=3Dm] && !UML && SND [=3Dn] && SND_JACK [=3Dy]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for HMM_MIRROR
   Depends on [n]: MMU [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_GPU_CONFIGS [=3Dy]


vim +219 mm/hmm.c

da4c3c735ea4dc J=C3=A9r=C3=B4me Glisse     2017-09-08  212 =20
08ddddda667b3b Christoph Hellwig 2020-03-16  213  static inline bool hmm_is=
_device_private_entry(struct hmm_range *range,
08ddddda667b3b Christoph Hellwig 2020-03-16  214  		swp_entry_t entry)
08ddddda667b3b Christoph Hellwig 2020-03-16  215  {
08ddddda667b3b Christoph Hellwig 2020-03-16  216  	return is_device_private=
_entry(entry) &&
08ddddda667b3b Christoph Hellwig 2020-03-16  217  		device_private_entry_to=
_page(entry)->pgmap->owner =3D=3D
08ddddda667b3b Christoph Hellwig 2020-03-16  218  		range->dev_private_owne=
r;
08ddddda667b3b Christoph Hellwig 2020-03-16 @219  }
08ddddda667b3b Christoph Hellwig 2020-03-16  220 =20

:::::: The code at line 219 was first introduced by commit
:::::: 08ddddda667b3b7aaac10641418283f78118c5cd mm/hmm: check the device pr=
ivate page owner in hmm_range_fault()

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
