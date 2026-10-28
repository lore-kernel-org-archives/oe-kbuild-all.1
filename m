Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189454;
	b=kUnILXLHsZqBY5FrZngWej+BA6rBPF7Ol0mhymlgPY2tUhCvj8IPODAHeTZ1lWbGUAcV
	 1HguTeha03kqlm9HedzbKSVc8mhj+kKgo7ZnRc9l3SJ0nbtd8VjcteDdr5FsTLmznsjjZ
	 U6wb9uT0/vnMKMDYoM6R0p9jZ3eZ6uL5skuVy9zw3vV85QHQLhJrVdnyWxPn/b6pjsUgk
	 LGLk6vi2siajaM5CgqjMpIXDowl3c2YVvA/4LZ/vH0JABovU/ojnQlpKYf8EQNUOYUHAa
	 qbfg73CJ7YYXVHpU9M20DL+V1yVyXh0fUm2CEZDCjrypXFHYSnoI+eXjUL+0Pi3qK+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189454;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=SEDQ4wbHh2SuAIX+vVsMZt0nvULByD3JCW/DwbZSdTY=;
	b=2hU4Thl/l/4bQBO3nKnPESzh+LxwDz+jU7w1u2IAUdU1fqqZ1qiK5pxqot43NEufyiST
	 bwdibVeIvoliZ05MkI2/S6yLNJUevgoPNQTqOfK4PcsgmDjZ010GLVv9XA8vZwRl13QRT
	 AaA3aiNjVRxs6CntVGWKQe++h90vja7iFV2N/mW+MXC+jMnRb2afJudPT5cUHDfyZShSr
	 z93SVPuU0Xfvjg1VSVsHcLvqaBmTHUDsrMtLgP4tfjMfx1pcQMY4+0TaUGSkLSRvP115v
	 lgHh5LCJpwbEXN6pPC4eF0X3lSk/yq1V0j5p+BZ32UgHVN+YaBrtGxB6mDmQ2uio+fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k3HzwD0K;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFFB606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 12:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFFFB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k3HzwD0K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793189453; x=1824725453;
  h=date:from:to:cc:subject:message-id;
  bh=q7PgZwWzS+tByCZivflOo2w0lqEAYPLi1gj2IvMHZXU=;
  b=k3HzwD0KXleQxuxhbQwBO0uc272gvR6G8k6P1bQl2Xjem7rJb9/tONPV
   YLOgVo/cMBFwDrKmDw/DR6wHmvKjGxs4NwJD5QN8XN3Xgevtw65PcK3Qs
   ynwhlTE4a4L+JL1qMzfD7Ks+xcn7GDzOXFJ5EXWkkJTlMjrW1TxYDR05H
   ofl0MlmAl8E3rC8MwtH5URMLP9TuS3BSXHmSJxsE8iMZOa5INp30LXLmS
   T7YDwOsGnN4M6uCBk5vmSLwHjVV9GhO0Z0hWQ1QzrOL5UJniCvBx6C2tg
   DczeNGMBWZrpr1Tib4mQqhzBNPE7PbZEUhgnya6HQrb2067Uxp9J8rJ5a
   Q==;
X-CSE-ConnectionGUID: STVeRacsQX+edU9/qBjAmg==
X-CSE-MsgGUID: VyXqNggxQgqPfwTWhbmbrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1799901"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1799901"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 05:10:52 -0700
X-CSE-ConnectionGUID: 3wAFeXXXRPy8iB7zvaXPiQ==
X-CSE-MsgGUID: TbYi2ZGASm6y2qtZeFVg+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6641827"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 28 Oct 2026 05:10:51 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM2UT-000000004rL-1ATv;
	Wed, 28 Oct 2026 12:10:49 +0000
Date: Wed, 28 Oct 2026 13:10:27 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2] ld.lld: error: undefined
 symbol: swiotlb_update_mem_attributes
Message-ID: <202610281351.WLyuenvq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   15827c4bafdc766e79e2aba39e39404baabc4673
commit: 81f530a28fb33cd66ad4af454b01c788f14e3619 [2/2] ANDROID: x86/pkvm: Add pkvm guest memory share support
config: i386-randconfig-r2308-20261027 (https://download.01.org/0day-ci/archive/20261028/202610281351.WLyuenvq-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281351.WLyuenvq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281351.WLyuenvq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: swiotlb_update_mem_attributes
   >>> referenced by mem_encrypt.c:95 (arch/x86/mm/mem_encrypt.c:95)
   >>>               arch/x86/mm/mem_encrypt.o:(mem_encrypt_init) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
