Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10D6175A74
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Aug 2026 17:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788024320; cv=none; b=V3HhBQA5T03uBZFQSY9qTIo2WvmAgHWvuI2/yG+fdTeUbIvLPEhGHpElMAgFcAxBHLnseRa29eRjn9yS4wFFNTxuQz73/dhShQwF4QLxLucT6uYqqg8tUYOzb6ZzMTh1DokxjqT7S/9FymsghqU6n7ee8/ab4ExznbuPsXAlt24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788024320; c=relaxed/simple;
	bh=HI2B0A48B/NubwKNkDbYKCJ45vKSujKy+CY/khR3WeY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EYsBcZll6s45biDH/noik25CRZSDVHMCb/g2fWwmY7iP9vypxGfa8gRq05c7F8DcXPLayPCFDv9xn519uYcyzKW8fJSaGR+qf8TjpkEBbpypZCLX5KdH8uyIp35eb7RqdgoP4m/ngocBHSjMtj975PLcP+n7Q1RdSDLDffE2RqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHQfEkAL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHQfEkAL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788024318; x=1819560318;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HI2B0A48B/NubwKNkDbYKCJ45vKSujKy+CY/khR3WeY=;
  b=kHQfEkALCOcOr3XxZtEKyUPOtaFPp35THACo55/Sp8FK0skqrKLo2C87
   frNYCqyFWmDw3eZYZMBs39ItIMq2KFc+JaB8snvzHXjyZqRcxKjyl40nF
   wR3SpPcgUXaKWFHm+tZR779ich0sdytLZLcseT5PoEA7z5Dh/DpyetTR+
   ZmF/O9TYKDCqQlPjYQ+84wBgA8MeuC4pM5IZNzAAwVu2CuR70povrLfc0
   WsSa9dd5uXCVlTZK97tIl+M4AFPHWb/Saa9PKv7oXHWYcr75H8UCZj9zt
   MWkSdrZOQo5IDNXnnl5Nu6r2Bgl7xu4vyARj2xQHl/EBAGCpRQlrv0T6p
   Q==;
X-CSE-ConnectionGUID: C04QEnpNSFWuCef6mE9MrA==
X-CSE-MsgGUID: uR0nO1BDSjiBHvBcmMMQqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="91010174"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="91010174"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2026 10:25:17 -0700
X-CSE-ConnectionGUID: JSlyqx9sQgySsv03n3pL2g==
X-CSE-MsgGUID: bp33X4VxTiaIbTXqGquYCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="298349493"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Aug 2026 10:25:15 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0Mno-00000000D5o-3T4d;
	Sat, 29 Aug 2026 17:25:12 +0000
Date: Sun, 30 Aug 2026 01:25:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1]
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:70:61: error: no member named
 'notifier' in 'struct amdgpu_bo'
Message-ID: <202608300156.0KB1B2LG-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   62472d9b40cf9ab09e948d85ae63e14979b462c8
commit: ad36ecd6081db9827f1ebaa41671b0b336fd83bf [1/1] ANDROID: GKI: Enable=
 HMM_MIRROR config for all arch
config: arm64-randconfig-r073-20260829 (https://download.01.org/0day-ci/arc=
hive/20260830/202608300156.0KB1B2LG-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 527=
74473867e49b5891ab9381accf4e5a3ce0024)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260830/202608300156.0KB1B2LG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608300156.0KB1B2LG-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:70:61: error: no member named 'n=
otifier' in 'struct amdgpu_bo'
      70 |         struct amdgpu_bo *bo =3D container_of(mni, struct amdgpu=
_bo, notifier);
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~^~~~~~~~~
   include/linux/container_of.h:21:49: note: expanded from macro 'container=
_of'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) |=
|       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~=
~~~~~~~~~
      22 |                       __same_type(*(ptr), void),                =
        \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
      23 |                       "pointer type mismatch in container_of()")=
;       \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:537:74: note: expanded from macro '__same=
_type'
     537 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a)=
, typeof(b))
         |                                                                 =
         ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_asser=
t'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_ass=
ert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:70:25: error: no member named 'n=
otifier' in 'amdgpu_bo'
      70 |         struct amdgpu_bo *bo =3D container_of(mni, struct amdgpu=
_bo, notifier);
         |                                ^                                =
   ~~~~~~~~
   include/linux/container_of.h:24:21: note: expanded from macro 'container=
_of'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:79:2: error: call to undeclared =
function 'mmu_interval_set_seq'; ISO C99 and later do not support implicit =
function declarations [-Wimplicit-function-declaration]
      79 |         mmu_interval_set_seq(mni, cur_seq);
         |         ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:107:61: error: no member named '=
notifier' in 'struct amdgpu_bo'
     107 |         struct amdgpu_bo *bo =3D container_of(mni, struct amdgpu=
_bo, notifier);
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~^~~~~~~~~
   include/linux/container_of.h:21:49: note: expanded from macro 'container=
_of'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) |=
|       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~=
~~~~~~~~~
      22 |                       __same_type(*(ptr), void),                =
        \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
      23 |                       "pointer type mismatch in container_of()")=
;       \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:537:74: note: expanded from macro '__same=
_type'
     537 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a)=
, typeof(b))
         |                                                                 =
         ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_asser=
t'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_ass=
ert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:107:25: error: no member named '=
notifier' in 'amdgpu_bo'
     107 |         struct amdgpu_bo *bo =3D container_of(mni, struct amdgpu=
_bo, notifier);
         |                                ^                                =
   ~~~~~~~~
   include/linux/container_of.h:24:21: note: expanded from macro 'container=
_of'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:135:7: error: call to undeclared=
 function 'mmu_interval_notifier_insert'; ISO C99 and later do not support =
implicit function declarations [-Wimplicit-function-declaration]
     135 |                 r =3D mmu_interval_notifier_insert(&bo->notifier=
, current->mm,
         |                     ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:135:7: note: did you mean 'vma_i=
nterval_tree_insert'?
   include/linux/mm.h:3372:6: note: 'vma_interval_tree_insert' declared here
    3372 | void vma_interval_tree_insert(struct vm_area_struct *node,
         |      ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:135:41: error: no member named '=
notifier' in 'struct amdgpu_bo'
     135 |                 r =3D mmu_interval_notifier_insert(&bo->notifier=
, current->mm,
         |                                                   ~~  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:139:41: error: no member named '=
notifier' in 'struct amdgpu_bo'
     139 |                 r =3D mmu_interval_notifier_insert(&bo->notifier=
, current->mm, addr,
         |                                                   ~~  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:148:7: error: no member named 'n=
otifier' in 'struct amdgpu_bo'
     148 |                 bo->notifier.mm =3D NULL;
         |                 ~~  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:162:11: error: no member named '=
notifier' in 'struct amdgpu_bo'
     162 |         if (!bo->notifier.mm)
         |              ~~  ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:164:2: error: call to undeclared=
 function 'mmu_interval_notifier_remove'; ISO C99 and later do not support =
implicit function declarations [-Wimplicit-function-declaration]
     164 |         mmu_interval_notifier_remove(&bo->notifier);
         |         ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:164:2: note: did you mean 'vma_i=
nterval_tree_remove'?
   include/linux/mm.h:3377:6: note: 'vma_interval_tree_remove' declared here
    3377 | void vma_interval_tree_remove(struct vm_area_struct *node,
         |      ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:164:36: error: no member named '=
notifier' in 'struct amdgpu_bo'
     164 |         mmu_interval_notifier_remove(&bo->notifier);
         |                                       ~~  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:165:6: error: no member named 'n=
otifier' in 'struct amdgpu_bo'
     165 |         bo->notifier.mm =3D NULL;
         |         ~~  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:207:29: error: call to undeclare=
d function 'mmu_interval_read_begin'; ISO C99 and later do not support impl=
icit function declarations [-Wimplicit-function-declaration]
     207 |                 hmm_range->notifier_seq =3D mmu_interval_read_be=
gin(notifier);
         |                                           ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:242:6: error: call to undeclared=
 function 'mmu_interval_read_retry'; ISO C99 and later do not support impli=
cit function declarations [-Wimplicit-function-declaration]
     242 |         r =3D mmu_interval_read_retry(hmm_range->notifier,
         |             ^
   15 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for XFRM_OFFLOAD
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_XFRM_OFFLOAD_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=3Dn] && WIRELESS [=3Dn]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=3Dn] && WIRELESS [=3Dn]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=3Dn] && WIRELESS [=3Dn] && (CFG80211_WEXT [=3Dn] |=
| WIRELESS_EXT [=3Dy])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=3Dn] && CAN_DEV [=3Dn] && CAN_NETLINK [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=3Dn] && WIRELESS [=3Dn] && PROC_FS [=3Dn] && WEXT_=
CORE [=3Dy]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]


vim +70 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c

c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       202=
2-11-17   55 =20
1ed3d2567c800ec drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6ni=
g 2017-09-05   56  /**
d9483ecd327b753 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g 2022-11-09   57   * amdgpu_hmm_invalidate_gfx - callback to notify about =
mm change
1ed3d2567c800ec drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6ni=
g 2017-09-05   58   *
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12   59   * @mni: the range (mm) is about to update
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12   60   * @range: details on the invalidation
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12   61   * @cur_seq: Value to pass to mmu_interval_set_seq()
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20   62   *
ad7f0b6334fe3cf drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6ni=
g 2018-06-05   63   * Block for operations on BOs to finish and mark pages =
as accessed and
ad7f0b6334fe3cf drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6ni=
g 2018-06-05   64   * potentially dirty.
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20   65   */
d9483ecd327b753 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g 2022-11-09   66  static bool amdgpu_hmm_invalidate_gfx(struct mmu_interva=
l_notifier *mni,
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12   67  				      const struct mmu_notifier_range *range,
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12   68  				      unsigned long cur_seq)
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20   69  {
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12  @70  	struct amdgpu_bo *bo =3D container_of(mni, struct amdgpu_bo,=
 notifier);
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12   71  	struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->tbo.bdev);
7ab7e8a4096d2af drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jack Xiao       201=
5-04-27   72  	long r;
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20   73 =20
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12   74  	if (!mmu_notifier_range_blockable(range))
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12   75  		return false;
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20   76 =20
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12   77  	mutex_lock(&adev->notifier_lock);
81fa1af31b5d790 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12   78 =20
81fa1af31b5d790 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12   79  	mmu_interval_set_seq(mni, cur_seq);
81fa1af31b5d790 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12   80 =20
0cc848a75b742c3 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6ni=
g 2021-11-09   81  	r =3D dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV=
_USAGE_BOOKKEEP,
7bc80a5462c37ea drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6ni=
g 2021-11-09   82  				  false, MAX_SCHEDULE_TIMEOUT);
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12   83  	mutex_unlock(&adev->notifier_lock);
7ab7e8a4096d2af drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jack Xiao       201=
5-04-27   84  	if (r <=3D 0)
7ab7e8a4096d2af drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jack Xiao       201=
5-04-27   85  		DRM_ERROR("(%ld) failed to wait for user bo\n", r);
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12   86  	return true;
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20   87  }
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12   88 =20
d9483ecd327b753 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g 2022-11-09   89  static const struct mmu_interval_notifier_ops amdgpu_hmm=
_gfx_ops =3D {
d9483ecd327b753 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g 2022-11-09   90  	.invalidate =3D amdgpu_hmm_invalidate_gfx,
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12   91  };
0d2b42b0bdba45c drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6ni=
g 2016-03-18   92 =20
ae20f12d2de6629 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6ni=
g 2016-03-18   93  /**
d9483ecd327b753 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g 2022-11-09   94   * amdgpu_hmm_invalidate_hsa - callback to notify about =
mm change
ae20f12d2de6629 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6ni=
g 2016-03-18   95   *
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12   96   * @mni: the range (mm) is about to update
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12   97   * @range: details on the invalidation
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12   98   * @cur_seq: Value to pass to mmu_interval_set_seq()
ae20f12d2de6629 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6ni=
g 2016-03-18   99   *
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12  100   * We temporarily evict the BO attached to this range. This n=
ecessitates
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12  101   * evicting all user-mode queues of the process.
ae20f12d2de6629 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6ni=
g 2016-03-18  102   */
d9483ecd327b753 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g 2022-11-09  103  static bool amdgpu_hmm_invalidate_hsa(struct mmu_interva=
l_notifier *mni,
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12  104  				      const struct mmu_notifier_range *range,
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12  105  				      unsigned long cur_seq)
ae20f12d2de6629 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6ni=
g 2016-03-18  106  {
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12  107  	struct amdgpu_bo *bo =3D container_of(mni, struct amdgpu_bo,=
 notifier);
ae20f12d2de6629 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6ni=
g 2016-03-18  108 =20
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12  109  	if (!mmu_notifier_range_blockable(range))
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12  110  		return false;
ae20f12d2de6629 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6ni=
g 2016-03-18  111 =20
f95f51a4c3357ea drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Felix Kuehling  202=
1-04-21  112  	amdgpu_amdkfd_evict_userptr(mni, cur_seq, bo->kfd_bo);
ae20f12d2de6629 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6ni=
g 2016-03-18  113 =20
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12  114  	return true;
ae20f12d2de6629 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6ni=
g 2016-03-18  115  }
93065ac753e4443 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Michal Hocko    201=
8-08-21  116 =20
d9483ecd327b753 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g 2022-11-09  117  static const struct mmu_interval_notifier_ops amdgpu_hmm=
_hsa_ops =3D {
d9483ecd327b753 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g 2022-11-09  118  	.invalidate =3D amdgpu_hmm_invalidate_hsa,
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12  119  };
ae20f12d2de6629 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6ni=
g 2016-03-18  120 =20
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20  121  /**
d9483ecd327b753 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g 2022-11-09  122   * amdgpu_hmm_register - register a BO for notifier upda=
tes
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20  123   *
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20  124   * @bo: amdgpu buffer object
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20  125   * @addr: userptr addr we should monitor
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20  126   *
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12  127   * Registers a mmu_notifier for the given BO at the specified=
 address.
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20  128   * Returns 0 on success, -ERRNO if anything goes wrong.
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20  129   */
d9483ecd327b753 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g 2022-11-09  130  int amdgpu_hmm_register(struct amdgpu_bo *bo, unsigned l=
ong addr)
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20  131  {
22207fd5c80177b drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  202=
4-03-06  132  	int r;
22207fd5c80177b drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  202=
4-03-06  133 =20
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12  134  	if (bo->kfd_bo)
22207fd5c80177b drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  202=
4-03-06  135  		r =3D mmu_interval_notifier_insert(&bo->notifier, current->=
mm,
81fa1af31b5d790 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12  136  						    addr, amdgpu_bo_size(bo),
d9483ecd327b753 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g 2022-11-09  137  						    &amdgpu_hmm_hsa_ops);
22207fd5c80177b drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  202=
4-03-06  138  	else
22207fd5c80177b drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  202=
4-03-06  139  		r =3D mmu_interval_notifier_insert(&bo->notifier, current->=
mm, addr,
81fa1af31b5d790 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12  140  							amdgpu_bo_size(bo),
d9483ecd327b753 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g 2022-11-09  141  							&amdgpu_hmm_gfx_ops);
22207fd5c80177b drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  202=
4-03-06  142  	if (r)
22207fd5c80177b drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  202=
4-03-06  143  		/*
22207fd5c80177b drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  202=
4-03-06  144  		 * Make sure amdgpu_hmm_unregister() doesn't call
22207fd5c80177b drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  202=
4-03-06  145  		 * mmu_interval_notifier_remove() when the notifier isn't p=
roperly
22207fd5c80177b drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  202=
4-03-06  146  		 * initialized.
22207fd5c80177b drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  202=
4-03-06  147  		 */
22207fd5c80177b drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  202=
4-03-06  148  		bo->notifier.mm =3D NULL;
22207fd5c80177b drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  202=
4-03-06  149 =20
22207fd5c80177b drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  202=
4-03-06  150  	return r;
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20  151  }
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20  152 =20
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20  153  /**
d9483ecd327b753 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g 2022-11-09  154   * amdgpu_hmm_unregister - unregister a BO for notifier =
updates
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20  155   *
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20  156   * @bo: amdgpu buffer object
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20  157   *
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12  158   * Remove any registration of mmu notifier updates from the b=
uffer object.
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20  159   */
d9483ecd327b753 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g 2022-11-09  160  void amdgpu_hmm_unregister(struct amdgpu_bo *bo)
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20  161  {
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12  162  	if (!bo->notifier.mm)
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20  163  		return;
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12 @164  	mmu_interval_notifier_remove(&bo->notifier);
62914a99dee5ac5 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 201=
9-11-12  165  	bo->notifier.mm =3D NULL;
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    201=
5-04-20  166  }
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  167 =20
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  168  int amdgpu_hmm_range_get_pages(struct mmu_interval_notifier *=
notifier,
d4cbff464d2932a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g 2022-11-09  169  			       uint64_t start, uint64_t npages, bool readonly,
c5b3cc417b0260a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri    202=
5-09-17  170  			       void *owner,
d4cbff464d2932a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g 2022-11-09  171  			       struct hmm_range **phmm_range)
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  172  {
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  173  	struct hmm_range *hmm_range;
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       202=
2-11-17  174  	unsigned long end;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  175  	unsigned long timeout;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  176  	unsigned long *pfns;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  177  	int r =3D 0;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  178 =20
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  179  	hmm_range =3D kzalloc(sizeof(*hmm_range), GFP_KERNEL);
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  180  	if (unlikely(!hmm_range))
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  181  		return -ENOMEM;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  182 =20
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  183  	pfns =3D kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  184  	if (unlikely(!pfns)) {
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  185  		r =3D -ENOMEM;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  186  		goto out_free_range;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  187  	}
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  188 =20
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  189  	hmm_range->notifier =3D notifier;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  190  	hmm_range->default_flags =3D HMM_PFN_REQ_FAULT;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  191  	if (!readonly)
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  192  		hmm_range->default_flags |=3D HMM_PFN_REQ_WRITE;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  193  	hmm_range->hmm_pfns =3D pfns;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  194  	hmm_range->start =3D start;
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       202=
2-11-17  195  	end =3D start + npages * PAGE_SIZE;
8c21fc49a8e637b drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Sierra     202=
1-05-06  196  	hmm_range->dev_private_owner =3D owner;
d8a3c1c80ceb656 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
1-03-30  197 =20
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       202=
2-11-17  198  	do {
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       202=
2-11-17  199  		hmm_range->end =3D min(hmm_range->start + MAX_WALK_BYTE, en=
d);
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       202=
2-11-17  200 =20
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       202=
2-11-17  201  		pr_debug("hmm range: start =3D 0x%lx, end =3D 0x%lx",
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       202=
2-11-17  202  			hmm_range->start, hmm_range->end);
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       202=
2-11-17  203 =20
9095e5544061b16 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Philip Yang     202=
4-04-30  204  		timeout =3D jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TI=
MEOUT);
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  205 =20
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  206  retry:
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  207  		hmm_range->notifier_seq =3D mmu_interval_read_begin(notifie=
r);
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  208  		r =3D hmm_range_fault(hmm_range);
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  209  		if (unlikely(r)) {
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  210  			if (r =3D=3D -EBUSY && !time_after(jiffies, timeout))
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  211  				goto retry;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  212  			goto out_free_pfns;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  213  		}
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  214 =20
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       202=
2-11-17  215  		if (hmm_range->end =3D=3D end)
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       202=
2-11-17  216  			break;
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       202=
2-11-17  217  		hmm_range->hmm_pfns +=3D MAX_WALK_BYTE >> PAGE_SHIFT;
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       202=
2-11-17  218  		hmm_range->start =3D hmm_range->end;
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       202=
2-11-17  219  	} while (hmm_range->end < end);
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       202=
2-11-17  220 =20
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       202=
2-11-17  221  	hmm_range->start =3D start;
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       202=
2-11-17  222  	hmm_range->hmm_pfns =3D pfns;
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       202=
2-11-17  223 =20
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  224  	*phmm_range =3D hmm_range;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  225 =20
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  226  	return 0;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  227 =20
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  228  out_free_pfns:
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  229  	kvfree(pfns);
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  230  out_free_range:
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  231  	kfree(hmm_range);
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  232 =20
9095e5544061b16 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Philip Yang     202=
4-04-30  233  	if (r =3D=3D -EBUSY)
9095e5544061b16 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Philip Yang     202=
4-04-30  234  		r =3D -EAGAIN;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  235  	return r;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  236  }
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  237 =20
f95f51a4c3357ea drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Felix Kuehling  202=
1-04-21  238  bool amdgpu_hmm_range_get_pages_done(struct hmm_range *hmm_ra=
nge)
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  239  {
f95f51a4c3357ea drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Felix Kuehling  202=
1-04-21  240  	bool r;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24  241 =20
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     202=
0-02-24 @242  	r =3D mmu_interval_read_retry(hmm_range->notifier,

:::::: The code at line 70 was first introduced by commit
:::::: 62914a99dee5ac51253a84e7d4a05c18f0c77535 drm/amdgpu: Use mmu_interva=
l_insert instead of hmm_mirror

:::::: TO: Jason Gunthorpe <jgg@mellanox.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
