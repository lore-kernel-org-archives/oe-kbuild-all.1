Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367145;
	b=ZFvueZ1eVCFfxmRKAwX9tMF9bJC6+CMb61u+33TpICDiRa7lhpTIJVFzbgqvolI0NHGE
	 NK97wiQifEb+G6irnqhcz9IyEoUrB99uRrm13SBC3aas/x41E7LfyfbF3qpjvZwqo77+W
	 vBK7g09AnisExWT6dYPzoDBIKw1RBG99xCBzTAzPyLqfxnzDUdzAtA9qORiBWfpYvMT35
	 G/gqpbHCViknBbLDKKviHKAtLoqXdS6Fr8c8lBm7qtVAkNTgp7a2CPozn7G5K3j0YFMes
	 iNyzYWAzPo/5nvKnEChLEbauuIRXORsJnOsEUlKIgldv23iKGQ6QjpI3Xnt0/Agw1QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367145;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Oajcfd7gL40HtbQPlq7GELUU7/AxMWPGrwqQ+//Yylc=;
	b=GhHKc1/bCSNKr56i9aCEk6nuU4seGHb4QlwNW3iQfXnMdZdFI5HCyQ1Sy8OUfZJNh6tj
	 6Y7VkUVaLcI6b1IpjZsIhiARsTKvI88dlmZjTnVYWpCw2D/SE4mBKSrp7QT0KM5tTTaXM
	 G9zNFKzGslg/T6Ol45Uze/GGAn8Nwh3egTD4gTlLcgSMb3RN1wP8/A4w9CM1VYLnd7B1J
	 FfDgwmkoLQ9sNd+7444ZEK4gDaGeuoXVC+ACr5E29iCuFJVYxFUGEXeKCx5KIBV0J69nd
	 3x4TJU+CODE15ZrL5PwKIQJDYG5QegQKQUO7FstOVWFzew+kZr0QAYe89ff6qbit4rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GRWn9Ocm;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A58606A31C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 03:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A58606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GRWn9Ocm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794367143; x=1825903143;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rCwB/dU1ertceB81UIG33YT+zntE6yQCNQ8WL2cJjlM=;
  b=GRWn9OcmjOr8EH0qCJw2SNZ2PkJc4mMyM9QL5ltGVmSJhpvKfnwKCcC7
   wQY6O99haVSRqWH5sgcs84+aY7+8cAbD0CaZZzq/34wUesdC2d8rzrqlo
   Ad0Ue5viy6T4Pa0x+r+Jt1uC16waCYS/IDNOCocbNlQlFcISFHhUjx3jj
   YWmL+kR7jYvp5pOOSGB3d+uqw4URMP9U3v2V8gr3u9DRnEXug1SOuXb3f
   95RmLVG/xnYzliDDALUfcRxmTpqSJGj80iGpANPLP7P4Wt0N1CX7hSz81
   TyzG/CFsfoU80vB7+hoOWWzfJu3xCkwVcZkysTUHLMu3aVBxTVMAJyhms
   w==;
X-CSE-ConnectionGUID: kF6w2E9RQfGjWG4SGD2gJg==
X-CSE-MsgGUID: KFvBQQYoS3OrW3gwSYg2zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3162066"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3162066"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 19:19:02 -0800
X-CSE-ConnectionGUID: lDAILT8qRxqe4fD5qzejbw==
X-CSE-MsgGUID: qI3wLG3CRxGD6kT+Q/TOsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="10105119"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 10 Nov 2026 19:19:00 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQyrR-000000000VL-3xKg;
	Wed, 11 Nov 2026 03:18:57 +0000
Date: Wed, 11 Nov 2026 04:18:03 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-06 1/1]
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:70:20: error: initializing 'struct
 amdgpu_bo *' with an expression of incompatible type 'void'
Message-ID: <202611110457.HebkMiWE-lkp@intel.com>
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

Hi Vamsidhar,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-=
06
head:   b81607b966ddcff8bff6e54967323da47a250f45
commit: ad36ecd6081db9827f1ebaa41671b0b336fd83bf [1/1] ANDROID: GKI: Enable=
 HMM_MIRROR config for all arch
config: arm-randconfig-r2310-20261110 (https://download.01.org/0day-ci/arch=
ive/20261111/202611110457.HebkMiWE-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd7080=
29e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261111/202611110457.HebkMiWE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611110457.HebkMiWE-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:70:61: error: no member named 'n=
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:70:25: error: no member named 'n=
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
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:70:20: error: initializing 'stru=
ct amdgpu_bo *' with an expression of incompatible type 'void'
      70 |         struct amdgpu_bo *bo =3D container_of(mni, struct amdgpu=
_bo, notifier);
         |                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:107:20: error: initializing 'str=
uct amdgpu_bo *' with an expression of incompatible type 'void'
     107 |         struct amdgpu_bo *bo =3D container_of(mni, struct amdgpu=
_bo, notifier);
         |                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:164:2: error: call to undeclared=
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:242:6: error: call to undeclared=
 function 'mmu_interval_read_retry'; ISO C99 and later do not support impli=
cit function declarations [-Wimplicit-function-declaration]
     242 |         r =3D mmu_interval_read_retry(hmm_range->notifier,
         |             ^
   17 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for XFRM_OFFLOAD
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_XFRM_OFFLOAD_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=3Dy] && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=3Dn] && CAN_DEV [=3Dn] && CAN_NETLINK [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=3Dy] && SND [=3Dn] && SND_JACK [=3Dy]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=3Dn] && WIRELESS [=3Dn] && PROC_FS [=3Dy] && WEXT_=
CORE [=3Dy]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=3Dy] && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=3Dn] && WIRELESS [=3Dn]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=3Dn] && MEMORY_BALLOON [=3Dy]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=3Dy] && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=3Dn] && WIRELESS [=3Dn]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=3Dn] && WIRELESS [=3Dn] && (CFG80211_WEXT [=3Dn] |=
| WIRELESS_EXT [=3Dy])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=3Dy] && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=3Dy] && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=3Dy]


vim +70 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c

c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022=
-11-17  55 =20
1ed3d2567c800e drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2017-09-05  56  /**
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
 2022-11-09  57   * amdgpu_hmm_invalidate_gfx - callback to notify about mm=
 change
1ed3d2567c800e drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2017-09-05  58   *
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  59   * @mni: the range (mm) is about to update
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  60   * @range: details on the invalidation
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  61   * @cur_seq: Value to pass to mmu_interval_set_seq()
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  62   *
ad7f0b6334fe3c drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2018-06-05  63   * Block for operations on BOs to finish and mark pages as=
 accessed and
ad7f0b6334fe3c drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2018-06-05  64   * potentially dirty.
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  65   */
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
 2022-11-09  66  static bool amdgpu_hmm_invalidate_gfx(struct mmu_interval_=
notifier *mni,
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  67  				      const struct mmu_notifier_range *range,
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  68  				      unsigned long cur_seq)
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  69  {
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12 @70  	struct amdgpu_bo *bo =3D container_of(mni, struct amdgpu_bo, n=
otifier);
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  71  	struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->tbo.bdev);
7ab7e8a4096d2a drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jack Xiao       2015=
-04-27  72  	long r;
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  73 =20
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  74  	if (!mmu_notifier_range_blockable(range))
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  75  		return false;
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  76 =20
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  77  	mutex_lock(&adev->notifier_lock);
81fa1af31b5d79 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  78 =20
81fa1af31b5d79 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  79  	mmu_interval_set_seq(mni, cur_seq);
81fa1af31b5d79 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  80 =20
0cc848a75b742c drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2021-11-09  81  	r =3D dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_U=
SAGE_BOOKKEEP,
7bc80a5462c37e drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
 2021-11-09  82  				  false, MAX_SCHEDULE_TIMEOUT);
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  83  	mutex_unlock(&adev->notifier_lock);
7ab7e8a4096d2a drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jack Xiao       2015=
-04-27  84  	if (r <=3D 0)
7ab7e8a4096d2a drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jack Xiao       2015=
-04-27  85  		DRM_ERROR("(%ld) failed to wait for user bo\n", r);
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  86  	return true;
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015=
-04-20  87  }
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019=
-11-12  88 =20

:::::: The code at line 70 was first introduced by commit
:::::: 62914a99dee5ac51253a84e7d4a05c18f0c77535 drm/amdgpu: Use mmu_interva=
l_insert instead of hmm_mirror

:::::: TO: Jason Gunthorpe <jgg@mellanox.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
