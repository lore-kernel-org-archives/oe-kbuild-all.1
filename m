Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B211CDFD5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 15:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769354894; cv=none; b=fOzq2qyE+gVV+2Ugo91913b4iuHzJZd+sWTsdcqJrr7rlodqCqBZYY+Xfgamkji8FKwDuU0fUzc+mnCSNAgB4JYa+A7AgCkoirYOwY9Ep//qHkFUMsbkmt/fY+e1hbeCtRjgMDq2poLlqBXGsRD9y0HuVaAN8xHUQPR2H+PNLts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769354894; c=relaxed/simple;
	bh=qQBsL87eV/Nxothx/94TRqSjZpw4Kq1P1g+CV/36Vac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KSw72WgHsE0nKviM4kLNPz0etK7FArPyac6asxO7kdC7bMF1Uf4H37WzcHGHp5OalsckpjKJBmYyeh3jQBbdiVPU+I4ESHWUCkNZ5N0G9KwbjREiZOLUDGzXrCxNU0wff9QwHpnQjqyp+nMcVE0tBKVqmn6pIgINkb1NKG3kAKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQF+BDtn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQF+BDtn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769354892; x=1800890892;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qQBsL87eV/Nxothx/94TRqSjZpw4Kq1P1g+CV/36Vac=;
  b=DQF+BDtnjYDS8JhHEtes/8YatSvkuA9od3Iv6xagPe2hHhyFntdF32hh
   BrWOMy/0NaLt80/dR3iYSIcsOMnYO18U4s2AdZh3XH39tGpgzLjamf7Gy
   ZhhQq4OxtRn2+JfYYpHQxececIxfr5paXan4kTqV+cdcMM5xh2napQBoS
   fvM281/DgtfRnxpZ2UaMf3/wNrkN+a7V3J/vqX5FCUIu4lHkYi7wQxZ3w
   lKs1thFDEqdE4Nedj9W9dEJKCYdV5RKL5w6+BmZrJ3yG5mBXr0Ykjo8e8
   PL2TZhlGdWmtb8WToExby7g4w5xLZP4ZkbSWvQtBsinQ/rmeDn+tW6Hak
   w==;
X-CSE-ConnectionGUID: w+E0V8jXQKasjgKLpK3nKA==
X-CSE-MsgGUID: jVGoYwmxQXm6C3VgeNs97g==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="93212447"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="93212447"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 07:28:11 -0800
X-CSE-ConnectionGUID: HNkZwzj6QCWRgi4b54LQfA==
X-CSE-MsgGUID: ZwMRp0BJQKe7af/Qbv2gTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="230436136"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Jan 2026 07:28:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk222-00000000W6g-1Xuo;
	Sun, 25 Jan 2026 15:28:06 +0000
Date: Sun, 25 Jan 2026 23:27:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 4/4]
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:79:2: error: implicit declaration of
 function 'mmu_interval_set_seq'
Message-ID: <202601252302.Ey1rz8ko-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   c624c4db89acf5f5e2466e371f744a5b6c8261e2
commit: ad36ecd6081db9827f1ebaa41671b0b336fd83bf [4/4] ANDROID: GKI: Enable=
 HMM_MIRROR config for all arch
config: arm-randconfig-003-20260125 (https://download.01.org/0day-ci/archiv=
e/20260125/202601252302.Ey1rz8ko-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260125/202601252302.Ey1rz8ko-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601252302.Ey1rz8ko-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:30,
                    from include/linux/gfp_types.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/firmware.h:8,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:46:
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c: In function 'amdgpu_hmm_invalid=
ate_gfx':
   include/linux/container_of.h:21:47: error: 'struct amdgpu_bo' has no mem=
ber named 'notifier'
      21 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |                                               ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_=
assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:2: note: in expansion of macro 'static_a=
ssert'
      21 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |  ^~~~~~~~~~~~~
   include/linux/container_of.h:21:16: note: in expansion of macro '__same_=
type'
      21 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |                ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:70:25: note: in expansion of mac=
ro 'container_of'
      70 |  struct amdgpu_bo *bo =3D container_of(mni, struct amdgpu_bo, no=
tifier);
         |                         ^~~~~~~~~~~~
   include/linux/compiler_types.h:537:27: error: expression in static asser=
tion is not an integer
     537 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a)=
, typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_=
assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:2: note: in expansion of macro 'static_a=
ssert'
      21 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |  ^~~~~~~~~~~~~
   include/linux/container_of.h:21:16: note: in expansion of macro '__same_=
type'
      21 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |                ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:70:25: note: in expansion of mac=
ro 'container_of'
      70 |  struct amdgpu_bo *bo =3D container_of(mni, struct amdgpu_bo, no=
tifier);
         |                         ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/firmware.h:5,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:46:
   include/linux/stddef.h:16:32: error: 'struct amdgpu_bo' has no member na=
med 'notifier'
      16 | #define offsetof(TYPE, MEMBER) __builtin_offsetof(TYPE, MEMBER)
         |                                ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:21: note: in expansion of macro 'offseto=
f'
      24 |  ((type *)(__mptr - offsetof(type, member))); })
         |                     ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:70:25: note: in expansion of mac=
ro 'container_of'
      70 |  struct amdgpu_bo *bo =3D container_of(mni, struct amdgpu_bo, no=
tifier);
         |                         ^~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:79:2: error: implicit declaratio=
n of function 'mmu_interval_set_seq' [-Werror=3Dimplicit-function-declarati=
on]
      79 |  mmu_interval_set_seq(mni, cur_seq);
         |  ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bits.h:30,
                    from include/linux/gfp_types.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/firmware.h:8,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:46:
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c: In function 'amdgpu_hmm_invalid=
ate_hsa':
   include/linux/container_of.h:21:47: error: 'struct amdgpu_bo' has no mem=
ber named 'notifier'
      21 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |                                               ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_=
assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:2: note: in expansion of macro 'static_a=
ssert'
      21 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |  ^~~~~~~~~~~~~
   include/linux/container_of.h:21:16: note: in expansion of macro '__same_=
type'
      21 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |                ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:107:25: note: in expansion of ma=
cro 'container_of'
     107 |  struct amdgpu_bo *bo =3D container_of(mni, struct amdgpu_bo, no=
tifier);
         |                         ^~~~~~~~~~~~
   include/linux/compiler_types.h:537:27: error: expression in static asser=
tion is not an integer
     537 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a)=
, typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_=
assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:2: note: in expansion of macro 'static_a=
ssert'
      21 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |  ^~~~~~~~~~~~~
   include/linux/container_of.h:21:16: note: in expansion of macro '__same_=
type'
      21 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |                ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:107:25: note: in expansion of ma=
cro 'container_of'
     107 |  struct amdgpu_bo *bo =3D container_of(mni, struct amdgpu_bo, no=
tifier);
         |                         ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/firmware.h:5,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:46:
   include/linux/stddef.h:16:32: error: 'struct amdgpu_bo' has no member na=
med 'notifier'
      16 | #define offsetof(TYPE, MEMBER) __builtin_offsetof(TYPE, MEMBER)
         |                                ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:21: note: in expansion of macro 'offseto=
f'
      24 |  ((type *)(__mptr - offsetof(type, member))); })
         |                     ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:107:25: note: in expansion of ma=
cro 'container_of'
     107 |  struct amdgpu_bo *bo =3D container_of(mni, struct amdgpu_bo, no=
tifier);
         |                         ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c: In function 'amdgpu_hmm_registe=
r':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:135:7: error: implicit declarati=
on of function 'mmu_interval_notifier_insert'; did you mean 'vma_interval_t=
ree_insert'? [-Werror=3Dimplicit-function-declaration]
     135 |   r =3D mmu_interval_notifier_insert(&bo->notifier, current->mm,
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |       vma_interval_tree_insert
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:135:39: error: 'struct amdgpu_bo=
' has no member named 'notifier'
     135 |   r =3D mmu_interval_notifier_insert(&bo->notifier, current->mm,
         |                                       ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:139:39: error: 'struct amdgpu_bo=
' has no member named 'notifier'
     139 |   r =3D mmu_interval_notifier_insert(&bo->notifier, current->mm,=
 addr,
         |                                       ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:148:5: error: 'struct amdgpu_bo'=
 has no member named 'notifier'
     148 |   bo->notifier.mm =3D NULL;
         |     ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c: In function 'amdgpu_hmm_unregis=
ter':
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:162:9: error: 'struct amdgpu_bo'=
 has no member named 'notifier'
     162 |  if (!bo->notifier.mm)
         |         ^~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:164:2: error: implicit declarati=
on of function 'mmu_interval_notifier_remove'; did you mean 'vma_interval_t=
ree_remove'? [-Werror=3Dimplicit-function-declaration]
     164 |  mmu_interval_notifier_remove(&bo->notifier);
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |  vma_interval_tree_remove
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:164:34: error: 'struct amdgpu_bo=
' has no member named 'notifier'
     164 |  mmu_interval_notifier_remove(&bo->notifier);
         |                                  ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:165:4: error: 'struct amdgpu_bo'=
 has no member named 'notifier'
     165 |  bo->notifier.mm =3D NULL;
         |    ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c: In function 'amdgpu_hmm_range_g=
et_pages':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:207:29: error: implicit declarat=
ion of function 'mmu_interval_read_begin' [-Werror=3Dimplicit-function-decl=
aration]
     207 |   hmm_range->notifier_seq =3D mmu_interval_read_begin(notifier);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c: In function 'amdgpu_hmm_range_g=
et_pages_done':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:242:6: error: implicit declarati=
on of function 'mmu_interval_read_retry' [-Werror=3Dimplicit-function-decla=
ration]
     242 |  r =3D mmu_interval_read_retry(hmm_range->notifier,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=3Dn] && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=3Dn] && MEMORY_BALLOON [=3Dy]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=3Dn] && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=3Dn] && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=3Dn] && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=3Dn] && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=3Dn] && SND [=3Dn] && SND_JACK [=3Dy]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=3Dy] && WIRELESS [=3Dy] && PROC_FS [=3Dn] && WEXT_=
CORE [=3Dy]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]


vim +/mmu_interval_set_seq +79 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c

c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022=
-11-17   55 =20
1ed3d2567c800e drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2017-09-05   56  /**
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
 2022-11-09   57   * amdgpu_hmm_invalidate_gfx - callback to notify about m=
m change
1ed3d2567c800e drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2017-09-05   58   *
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12   59   * @mni: the range (mm) is about to update
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12   60   * @range: details on the invalidation
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12   61   * @cur_seq: Value to pass to mmu_interval_set_seq()
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20   62   *
ad7f0b6334fe3c drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2018-06-05   63   * Block for operations on BOs to finish and mark pages a=
s accessed and
ad7f0b6334fe3c drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2018-06-05   64   * potentially dirty.
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20   65   */
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
 2022-11-09   66  static bool amdgpu_hmm_invalidate_gfx(struct mmu_interval=
_notifier *mni,
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12   67  				      const struct mmu_notifier_range *range,
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12   68  				      unsigned long cur_seq)
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20   69  {
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  @70  	struct amdgpu_bo *bo =3D container_of(mni, struct amdgpu_bo, =
notifier);
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12   71  	struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->tbo.bdev);
7ab7e8a4096d2a drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jack Xiao       2015=
-04-27   72  	long r;
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20   73 =20
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12   74  	if (!mmu_notifier_range_blockable(range))
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12   75  		return false;
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20   76 =20
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12   77  	mutex_lock(&adev->notifier_lock);
81fa1af31b5d79 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12   78 =20
81fa1af31b5d79 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  @79  	mmu_interval_set_seq(mni, cur_seq);
81fa1af31b5d79 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12   80 =20
0cc848a75b742c drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2021-11-09   81  	r =3D dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_=
USAGE_BOOKKEEP,
7bc80a5462c37e drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2021-11-09   82  				  false, MAX_SCHEDULE_TIMEOUT);
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12   83  	mutex_unlock(&adev->notifier_lock);
7ab7e8a4096d2a drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jack Xiao       2015=
-04-27   84  	if (r <=3D 0)
7ab7e8a4096d2a drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jack Xiao       2015=
-04-27   85  		DRM_ERROR("(%ld) failed to wait for user bo\n", r);
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12   86  	return true;
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20   87  }
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12   88 =20
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
 2022-11-09   89  static const struct mmu_interval_notifier_ops amdgpu_hmm_=
gfx_ops =3D {
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
 2022-11-09   90  	.invalidate =3D amdgpu_hmm_invalidate_gfx,
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12   91  };
0d2b42b0bdba45 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2016-03-18   92 =20
ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2016-03-18   93  /**
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
 2022-11-09   94   * amdgpu_hmm_invalidate_hsa - callback to notify about m=
m change
ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2016-03-18   95   *
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12   96   * @mni: the range (mm) is about to update
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12   97   * @range: details on the invalidation
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12   98   * @cur_seq: Value to pass to mmu_interval_set_seq()
ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2016-03-18   99   *
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  100   * We temporarily evict the BO attached to this range. This ne=
cessitates
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  101   * evicting all user-mode queues of the process.
ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2016-03-18  102   */
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
 2022-11-09  103  static bool amdgpu_hmm_invalidate_hsa(struct mmu_interval=
_notifier *mni,
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  104  				      const struct mmu_notifier_range *range,
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  105  				      unsigned long cur_seq)
ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2016-03-18  106  {
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12 @107  	struct amdgpu_bo *bo =3D container_of(mni, struct amdgpu_bo, =
notifier);
ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2016-03-18  108 =20
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  109  	if (!mmu_notifier_range_blockable(range))
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  110  		return false;
ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2016-03-18  111 =20
f95f51a4c3357e drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Felix Kuehling  2021=
-04-21  112  	amdgpu_amdkfd_evict_userptr(mni, cur_seq, bo->kfd_bo);
ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2016-03-18  113 =20
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  114  	return true;
ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2016-03-18  115  }
93065ac753e444 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Michal Hocko    2018=
-08-21  116 =20
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
 2022-11-09  117  static const struct mmu_interval_notifier_ops amdgpu_hmm_=
hsa_ops =3D {
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
 2022-11-09  118  	.invalidate =3D amdgpu_hmm_invalidate_hsa,
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  119  };
ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2016-03-18  120 =20
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  121  /**
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
 2022-11-09  122   * amdgpu_hmm_register - register a BO for notifier updat=
es
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  123   *
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  124   * @bo: amdgpu buffer object
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  125   * @addr: userptr addr we should monitor
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  126   *
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  127   * Registers a mmu_notifier for the given BO at the specified =
address.
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  128   * Returns 0 on success, -ERRNO if anything goes wrong.
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  129   */
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
 2022-11-09  130  int amdgpu_hmm_register(struct amdgpu_bo *bo, unsigned lo=
ng addr)
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  131  {
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024=
-03-06  132  	int r;
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024=
-03-06  133 =20
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  134  	if (bo->kfd_bo)
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024=
-03-06 @135  		r =3D mmu_interval_notifier_insert(&bo->notifier, current->m=
m,
81fa1af31b5d79 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  136  						    addr, amdgpu_bo_size(bo),
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
 2022-11-09  137  						    &amdgpu_hmm_hsa_ops);
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024=
-03-06  138  	else
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024=
-03-06  139  		r =3D mmu_interval_notifier_insert(&bo->notifier, current->m=
m, addr,
81fa1af31b5d79 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  140  							amdgpu_bo_size(bo),
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
 2022-11-09  141  							&amdgpu_hmm_gfx_ops);
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024=
-03-06  142  	if (r)
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024=
-03-06  143  		/*
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024=
-03-06  144  		 * Make sure amdgpu_hmm_unregister() doesn't call
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024=
-03-06  145  		 * mmu_interval_notifier_remove() when the notifier isn't pr=
operly
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024=
-03-06  146  		 * initialized.
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024=
-03-06  147  		 */
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024=
-03-06 @148  		bo->notifier.mm =3D NULL;
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024=
-03-06  149 =20
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024=
-03-06  150  	return r;
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  151  }
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  152 =20
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  153  /**
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
 2022-11-09  154   * amdgpu_hmm_unregister - unregister a BO for notifier u=
pdates
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  155   *
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  156   * @bo: amdgpu buffer object
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  157   *
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  158   * Remove any registration of mmu notifier updates from the bu=
ffer object.
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  159   */
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
 2022-11-09  160  void amdgpu_hmm_unregister(struct amdgpu_bo *bo)
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  161  {
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  162  	if (!bo->notifier.mm)
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  163  		return;
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12 @164  	mmu_interval_notifier_remove(&bo->notifier);
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12 @165  	bo->notifier.mm =3D NULL;
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  166  }
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  167 =20
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  168  int amdgpu_hmm_range_get_pages(struct mmu_interval_notifier *n=
otifier,
d4cbff464d2932 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
 2022-11-09  169  			       uint64_t start, uint64_t npages, bool readonly,
c5b3cc417b0260 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri    2025=
-09-17  170  			       void *owner,
d4cbff464d2932 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
 2022-11-09  171  			       struct hmm_range **phmm_range)
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  172  {
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  173  	struct hmm_range *hmm_range;
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022=
-11-17  174  	unsigned long end;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  175  	unsigned long timeout;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  176  	unsigned long *pfns;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  177  	int r =3D 0;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  178 =20
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  179  	hmm_range =3D kzalloc(sizeof(*hmm_range), GFP_KERNEL);
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  180  	if (unlikely(!hmm_range))
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  181  		return -ENOMEM;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  182 =20
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  183  	pfns =3D kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  184  	if (unlikely(!pfns)) {
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  185  		r =3D -ENOMEM;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  186  		goto out_free_range;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  187  	}
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  188 =20
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  189  	hmm_range->notifier =3D notifier;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  190  	hmm_range->default_flags =3D HMM_PFN_REQ_FAULT;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  191  	if (!readonly)
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  192  		hmm_range->default_flags |=3D HMM_PFN_REQ_WRITE;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  193  	hmm_range->hmm_pfns =3D pfns;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  194  	hmm_range->start =3D start;
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022=
-11-17  195  	end =3D start + npages * PAGE_SIZE;
8c21fc49a8e637 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Sierra     2021=
-05-06  196  	hmm_range->dev_private_owner =3D owner;
d8a3c1c80ceb65 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2021=
-03-30  197 =20
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022=
-11-17  198  	do {
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022=
-11-17  199  		hmm_range->end =3D min(hmm_range->start + MAX_WALK_BYTE, end=
);
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022=
-11-17  200 =20
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022=
-11-17  201  		pr_debug("hmm range: start =3D 0x%lx, end =3D 0x%lx",
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022=
-11-17  202  			hmm_range->start, hmm_range->end);
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022=
-11-17  203 =20
9095e5544061b1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Philip Yang     2024=
-04-30  204  		timeout =3D jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIM=
EOUT);
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  205 =20
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  206  retry:
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24 @207  		hmm_range->notifier_seq =3D mmu_interval_read_begin(notifier=
);
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  208  		r =3D hmm_range_fault(hmm_range);
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  209  		if (unlikely(r)) {
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  210  			if (r =3D=3D -EBUSY && !time_after(jiffies, timeout))
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  211  				goto retry;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  212  			goto out_free_pfns;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  213  		}
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  214 =20
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022=
-11-17  215  		if (hmm_range->end =3D=3D end)
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022=
-11-17  216  			break;
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022=
-11-17  217  		hmm_range->hmm_pfns +=3D MAX_WALK_BYTE >> PAGE_SHIFT;
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022=
-11-17  218  		hmm_range->start =3D hmm_range->end;
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022=
-11-17  219  	} while (hmm_range->end < end);
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022=
-11-17  220 =20
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022=
-11-17  221  	hmm_range->start =3D start;
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022=
-11-17  222  	hmm_range->hmm_pfns =3D pfns;
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022=
-11-17  223 =20
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  224  	*phmm_range =3D hmm_range;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  225 =20
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  226  	return 0;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  227 =20
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  228  out_free_pfns:
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  229  	kvfree(pfns);
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  230  out_free_range:
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  231  	kfree(hmm_range);
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  232 =20
9095e5544061b1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Philip Yang     2024=
-04-30  233  	if (r =3D=3D -EBUSY)
9095e5544061b1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Philip Yang     2024=
-04-30  234  		r =3D -EAGAIN;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  235  	return r;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  236  }
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  237 =20
f95f51a4c3357e drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Felix Kuehling  2021=
-04-21  238  bool amdgpu_hmm_range_get_pages_done(struct hmm_range *hmm_ran=
ge)
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  239  {
f95f51a4c3357e drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Felix Kuehling  2021=
-04-21  240  	bool r;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24  241 =20
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020=
-02-24 @242  	r =3D mmu_interval_read_retry(hmm_range->notifier,

:::::: The code at line 79 was first introduced by commit
:::::: 81fa1af31b5d79047821def6abdcb97a735d8a52 drm/amdgpu: Use mmu_interva=
l_notifier instead of hmm_mirror

:::::: TO: Jason Gunthorpe <jgg@mellanox.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
