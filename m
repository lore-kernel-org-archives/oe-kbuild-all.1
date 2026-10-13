Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4FA4F96D9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 15:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903693; cv=none; b=oL9GiTqEd+4Le7RWi4EvIDRs15jx50HB7N5jgTtc5aGanx9BkEXa8VL9gadGdH2rxEPomT8C3p3XoEV27mOvU0wN/YoMjezeHtW0MzN8MI1B14iIAOHqx+oJewxOhuofpbne7Qyc/+3OwNHs0zuPxMCYrDYBAZjmNPXe0uu3oMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903693; c=relaxed/simple;
	bh=MG9QjIZpKaGJmgWq3QW6ucolrNDGbFQ49vOOcfwB/Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WMAFwNvw0pvfE0NFh8TtMyxTQNwseIbV4tyz6cGMoW2/AFRVXnPhh7gJsncH0TWB6YApvEJJv2y1FPHFQb63+OlAK5PvnjyJHU8nEAu6nPc7Fa6eFgglTv9760lleo0IA5H2R98hRJ9fO5zBvXBjdNFPqhhmnLS0otUWlRv35/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K7CRuQeq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K7CRuQeq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791903691; x=1823439691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MG9QjIZpKaGJmgWq3QW6ucolrNDGbFQ49vOOcfwB/Qo=;
  b=K7CRuQeqd7/wgP0vc/0lTnxZit0cRZXTwu5F1llGt+o+P73cXrcGRh0L
   DZX6R8f0U44O2BVqiX3dyVHOxmaqDjHUbQ8BQ7Q0kjA9bOKanGIsg0Ola
   445p9fSFXIH6TKX2j2W+vC9jE1Ov+pIFMmJJnTsf6LQ+4Pw3wFX9oCDfj
   VNFEpXZkNJlIOPLJnzTfqqKAd9JOeFV8oY8wDSmtShv7mIPBrw2ZiFJ8h
   0JXRgvAsCgBg4R1zCp4UJnRINRBlLo0OdH87App7WShuSta6D1etjEiUI
   Tcp+cWseuvpCN4uKIM+88N6WMvS/xTZ25Jrg3o7G0+3LyXSZl3/Arqe1o
   A==;
X-CSE-ConnectionGUID: YtjEHP7UQdK1mW/gP5d32g==
X-CSE-MsgGUID: RTPS32RpQv63y3VSFiLUUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="662489"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="662489"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 08:01:31 -0700
X-CSE-ConnectionGUID: BImv3xV1T0KG1+frLal4pg==
X-CSE-MsgGUID: sfI29eDnSw6AXNU5LyMjQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1219620"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 13 Oct 2026 08:01:29 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGe0M-00000000AWx-3deo;
	Tue, 13 Oct 2026 15:01:26 +0000
Date: Tue, 13 Oct 2026 17:01:07 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>, Nam Cao <namcao@linutronix.de>
Subject: arch/riscv/kernel/alternative.c:198:6: error: use of
 undeclared identifier '__vdso_alternatives_start_offset'; did you mean
 '__vdso_alternatives_start_cfi_offset'?
Message-ID: <202610131613.BpOi6VPp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
commit: 63aecaba41a4b2593697f208e91bf542248ec4f8 riscv: alternative: Use the statically extracted vDSO section offsets
date:   10 weeks ago
config: riscv-randconfig-r2104-20261013 (https://download.01.org/0day-ci/archive/20261013/202610131613.BpOi6VPp-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ce2a4984a3f43327a2b7c40baa74907bc10eb899)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131613.BpOi6VPp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 63aecaba41a4 ("riscv: alternative: Use the statically extracted vDSO section offsets")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610131613.BpOi6VPp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/alternative.c:198:6: error: use of undeclared identifier '__vdso_alternatives_start_offset'; did you mean '__vdso_alternatives_start_cfi_offset'?
     198 |                                         __vdso_alternatives_start_offset,
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         __vdso_alternatives_start_cfi_offset
   arch/riscv/include/asm/vdso.h:29:15: note: '__vdso_alternatives_start_cfi_offset' declared here
      29 | extern size_t __vdso_alternatives_start_cfi_offset, __vdso_alternatives_end_cfi_offset;
         |               ^
>> arch/riscv/kernel/alternative.c:199:6: error: use of undeclared identifier '__vdso_alternatives_end_offset'; did you mean '__vdso_alternatives_end_cfi_offset'?
     199 |                                         __vdso_alternatives_end_offset);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         __vdso_alternatives_end_cfi_offset
   arch/riscv/include/asm/vdso.h:29:53: note: '__vdso_alternatives_end_cfi_offset' declared here
      29 | extern size_t __vdso_alternatives_start_cfi_offset, __vdso_alternatives_end_cfi_offset;
         |                                                     ^
   2 errors generated.


vim +198 arch/riscv/kernel/alternative.c

   186	
   187	void __init apply_boot_alternatives(void)
   188	{
   189		/* If called on non-boot cpu things could go wrong */
   190		WARN_ON(smp_processor_id() != 0);
   191	
   192		_apply_alternatives((struct alt_entry *)__alt_start,
   193				    (struct alt_entry *)__alt_end,
   194				    RISCV_ALTERNATIVES_BOOT);
   195	
   196		if (IS_ENABLED(CONFIG_MMU))
   197			apply_vdso_alternatives(vdso_start,
 > 198						__vdso_alternatives_start_offset,
 > 199						__vdso_alternatives_end_offset);
   200	
   201		if (IS_ENABLED(CONFIG_RISCV_USER_CFI))
   202			apply_vdso_alternatives(vdso_cfi_start,
   203						__vdso_alternatives_start_cfi_offset,
   204						__vdso_alternatives_end_cfi_offset);
   205	}
   206	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
