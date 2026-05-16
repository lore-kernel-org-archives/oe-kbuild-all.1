Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E275439E176
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 10:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778928818; cv=none; b=DC6nDtDiRwXOftm2mbqvl4XZgzILTu7YZwLfFk9lYZhEKZQ2qMm19BHBoJwZgGtljKp5S2aZIugD/Znyl1Bte4ZyV9WH+Z3oOM4alRdczTDLR/sN2eJ6lf9KeAXeckbks+H8R7XMBa2lDPsZrKbFtaJ79xObiZNb+KgMuS2yTZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778928818; c=relaxed/simple;
	bh=1EVMUQvHEmOKMliKKVi9qL+TAUbD3MckB/Bwzsb7asY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gq1IgpvmrJv0faEy5/kLEwhJeo42K8NZ7rnu+UUaqCl812GNjKZDq8B9XAqDINOqO7wzwyXUfuZT8e3eMYgPTuNBHkcskJwr4PJqNZ8dHqI0YJqVhwsvJsQrOZmaewbc/CVwyAmtjXgNfyD6KFjR38+QgYxadWiWZvDkwOcb1Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lKUv+WlJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lKUv+WlJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778928816; x=1810464816;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1EVMUQvHEmOKMliKKVi9qL+TAUbD3MckB/Bwzsb7asY=;
  b=lKUv+WlJgF3nC59tqXPHxy4sJT9E7Jn4Uif4WvB40YojWqNcSzDbU+vC
   I2Ix3nM4zfIqn6+TCXIEhhnmdL0+QPFhyI2EVjXBaRFi6aG94GSJzFxki
   ysBliPSSb3KPsSwp6r0iU8f86wwDi3d9dZSBqNE1vA9TWnTf9h5FOTAVA
   IIrE2z3YYyGcJe7HgfjrIEw76SdewQj6buHG9JtckmD+qh31f6YQ7hcWl
   hKi5YRqTC/AdUfuTqInrVH6usrepP6DOy8vZjCzZuouPjgxuuYhsUIeCy
   ZEpFu3JKBeG490pouyqh9M9jTcxKbqBJPNXQ340vZpL16BNL1s5r6n60d
   Q==;
X-CSE-ConnectionGUID: 0zbvy7IgSAq/XXl73SQS3Q==
X-CSE-MsgGUID: 9mNYr2SNTemwEPH1c8AadQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="97294902"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="97294902"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 03:53:35 -0700
X-CSE-ConnectionGUID: 25Ic0zokTXOhgYQifrB34g==
X-CSE-MsgGUID: P6qRv43jTM2guWcXcUsQpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="238076187"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 May 2026 03:53:33 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOCeA-000000000jt-300D;
	Sat, 16 May 2026 10:53:30 +0000
Date: Sat, 16 May 2026 18:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 214/214]
 drivers/gpu/drm/drm_gem_shmem_helper.c:584:24: error: use of undeclared
 identifier 'PMD_SHIFT'
Message-ID: <202605161857.dxGE4AQU-lkp@intel.com>
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

First bad commit (maybe !=3D root cause):

tree:   https://android.googlesource.com/kernel/common android-mainline-des=
ktop
head:   25ad575177d0d2370faad841ed596e791ba30711
commit: 0cc6f52b2aab23f59b9b92188194b0847105ceee [214/214] Merge 0bcb517f0a=
70 ("Merge tag 'mm-hotfixes-stable-2026-03-28-10-45' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/akpm/mm") into android-mainline
config: arm-randconfig-r123-20260516 (https://download.01.org/0day-ci/archi=
ve/20260516/202605161857.dxGE4AQU-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260516/202605161857.dxGE4AQU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161857.dxGE4AQU-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gem_shmem_helper.c:584:24: error: use of undeclared =
identifier 'PMD_SHIFT'
     584 |         if (order && order !=3D PMD_ORDER)
         |                               ^~~~~~~~~
   include/linux/pgtable.h:8:20: note: expanded from macro 'PMD_ORDER'
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                          ^~~~~~~~~
   1 error generated.

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
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=3Dy]


vim +/PMD_SHIFT +584 drivers/gpu/drm/drm_gem_shmem_helper.c

211b9a39f2619b Lo=C3=AFc Molinari        2025-12-05  572 =20
fc3bbf34e643fa Pedro Demarchi Gomes 2026-03-18  573  static vm_fault_t drm_=
gem_shmem_any_fault(struct vm_fault *vmf, unsigned int order)
2194a63a818db7 Noralf Tr=C3=B8nnes       2019-03-12  574  {
2194a63a818db7 Noralf Tr=C3=B8nnes       2019-03-12  575  	struct vm_area_s=
truct *vma =3D vmf->vma;
2194a63a818db7 Noralf Tr=C3=B8nnes       2019-03-12  576  	struct drm_gem_o=
bject *obj =3D vma->vm_private_data;
2194a63a818db7 Noralf Tr=C3=B8nnes       2019-03-12  577  	struct drm_gem_s=
hmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
2194a63a818db7 Noralf Tr=C3=B8nnes       2019-03-12  578  	loff_t num_pages=
 =3D obj->size >> PAGE_SHIFT;
d611b4a0907cec Neil Roberts         2021-02-23  579  	vm_fault_t ret;
211b9a39f2619b Lo=C3=AFc Molinari        2025-12-05  580  	struct page **pa=
ges =3D shmem->pages;
11d5a4745e00e7 Neil Roberts         2021-02-23  581  	pgoff_t page_offset;
211b9a39f2619b Lo=C3=AFc Molinari        2025-12-05  582  	unsigned long pf=
n;
11d5a4745e00e7 Neil Roberts         2021-02-23  583 =20
fc3bbf34e643fa Pedro Demarchi Gomes 2026-03-18 @584  	if (order && order !=
=3D PMD_ORDER)
fc3bbf34e643fa Pedro Demarchi Gomes 2026-03-18  585  		return VM_FAULT_FALL=
BACK;
fc3bbf34e643fa Pedro Demarchi Gomes 2026-03-18  586 =20
9d2d49027c3a96 Lo=C3=AFc Molinari        2025-12-05  587  	/* Offset to fau=
lty address in the VMA. */
9d2d49027c3a96 Lo=C3=AFc Molinari        2025-12-05  588  	page_offset =3D =
vmf->pgoff - vma->vm_pgoff;
2194a63a818db7 Noralf Tr=C3=B8nnes       2019-03-12  589 =20
21aa27ddc58269 Dmitry Osipenko      2023-05-30  590  	dma_resv_lock(shmem->=
base.resv, NULL);
2194a63a818db7 Noralf Tr=C3=B8nnes       2019-03-12  591 =20
11d5a4745e00e7 Neil Roberts         2021-02-23  592  	if (page_offset >=3D =
num_pages ||
3f6a1e22fae95a Dmitry Osipenko      2022-11-16  593  	    drm_WARN_ON_ONCE(=
obj->dev, !shmem->pages) ||
d611b4a0907cec Neil Roberts         2021-02-23  594  	    shmem->madv < 0) {
d611b4a0907cec Neil Roberts         2021-02-23  595  		ret =3D VM_FAULT_SIG=
BUS;
211b9a39f2619b Lo=C3=AFc Molinari        2025-12-05  596  		goto out;
211b9a39f2619b Lo=C3=AFc Molinari        2025-12-05  597  	}
2194a63a818db7 Noralf Tr=C3=B8nnes       2019-03-12  598 =20
211b9a39f2619b Lo=C3=AFc Molinari        2025-12-05  599  	pfn =3D page_to_=
pfn(pages[page_offset]);
fc3bbf34e643fa Pedro Demarchi Gomes 2026-03-18  600  	ret =3D try_insert_pf=
n(vmf, order, pfn);
211b9a39f2619b Lo=C3=AFc Molinari        2025-12-05  601 =20
211b9a39f2619b Lo=C3=AFc Molinari        2025-12-05  602   out:
21aa27ddc58269 Dmitry Osipenko      2023-05-30  603  	dma_resv_unlock(shmem=
->base.resv);
d611b4a0907cec Neil Roberts         2021-02-23  604 =20
d611b4a0907cec Neil Roberts         2021-02-23  605  	return ret;
2194a63a818db7 Noralf Tr=C3=B8nnes       2019-03-12  606  }
2194a63a818db7 Noralf Tr=C3=B8nnes       2019-03-12  607 =20

:::::: The code at line 584 was first introduced by commit
:::::: fc3bbf34e643faa8678aabdc3810c60109f3435a drm/shmem-helper: Fix huge =
page mapping in fault handler

:::::: TO: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>
:::::: CC: Boris Brezillon <boris.brezillon@collabora.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
