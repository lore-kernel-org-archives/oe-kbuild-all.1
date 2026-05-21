Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77CD311C27
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 01:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327960; cv=none; b=n4LuB+3ygCEx30ys/wiIP77Huq4boQ92f2vu5Lu32py4rt9WcFmfiC6XZDxWb0ygi4P2iI+FzkcBZigs83SQRKoZv3yZo1P/lyf5Oxgmqmv+F/f0Elj6uEjYLktiP4VrB32RR3N2SumSTc0Ua7qEzIcVtAoO7ZjH5IpGqNKe3Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327960; c=relaxed/simple;
	bh=orruTuQd5svMVTxNS+DYeCqqRPBVTzvYEEmDkpHi6YE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ovOp6H2T5uFRUhiAu1yO8UfRrFaxaobJ4V4E9qulS1Sv56xd97lJ30JphPHEYo88XKF0O7TXnccfz52MlAh4Fb+9RPTRP3KhrJf1OTYpsd8Zux9kIcA0ipoKWbXBgGy/YU23GjUC60Y3iNiLQ6dlFU5arTWeytfypXQgYubLw4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e24ckdI6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e24ckdI6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779327954; x=1810863954;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=orruTuQd5svMVTxNS+DYeCqqRPBVTzvYEEmDkpHi6YE=;
  b=e24ckdI6jDpe4LKdtHHas8bxuqGT3CklpVZjwKRGcJk1LrsenIQJZP7k
   Yvkd7aKMo2VqnSJ/uDyfDD8fU3B+9/2C0KCdcGl1ncVNUp7CICEDyhY6F
   PzxAhZyhWSvQldQKRm/qiip1Hm3OfEOofJ5j2BRbYv+n/prQ/lglLJPlO
   JPfTQBtcysW7w5n6nflim1dIJABQDnzZUGOFhwp5o5IAMF7Jjf5bFkiyF
   2KLT4Fb523OufSlaDuE978Yse0XucsSBHDtP4VRGjmkzqZlrTJcGR5f7X
   eKOCxad6BZjSR6FPKRhMFDrtkW37pQ/EPPB12XLLim55GjUciodZST7f1
   w==;
X-CSE-ConnectionGUID: UzPP0xgVRhet0WXvDPNhaA==
X-CSE-MsgGUID: qO+UXYfQSVOQS3fo1GaWMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90539644"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="90539644"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 18:45:50 -0700
X-CSE-ConnectionGUID: 2Qc9rkOkTvOBMQhtTFV8HQ==
X-CSE-MsgGUID: 3BizmbeWT52sxNhHiQcF2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="237777948"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 20 May 2026 18:45:48 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPsTq-00000000AjR-0uiR;
	Thu, 21 May 2026 01:45:46 +0000
Date: Thu, 21 May 2026 03:44:46 +0200
From: kernel test robot <lkp@intel.com>
To: Rik van Riel <riel@surriel.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ./include/linux/mmzone.h:989:34: error: 'PUD_SHIFT'
 undeclared; did you mean 'NMI_SHIFT'?
Message-ID: <202605210338.kB3yXcHx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/intel-lab-lkp/linux/commits/Rik-van-Riel/mm-page=
_alloc-replace-pageblock_flags-bitmap-with-struct-pageblock_data/20260520-2=
31340
head:   f078b5654577f53b34108d1196286629a290924b
commit: 6dd49b692f34be7327766397947db75edebd0d89 mm: page_alloc: superpageb=
lock metadata for 1GB anti-fragmentation
date:   10 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260=
521/202605210338.kB3yXcHx-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260521/202605210338.kB3yXcHx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210338.kB3yXcHx-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/gfp.h:7,
                    from ./include/linux/xarray.h:16,
                    from ./include/linux/radix-tree.h:21,
                    from ./arch/s390/include/asm/pgtable.h:20,
                    from ./include/linux/pgtable.h:6,
                    from arch/s390/kernel/asm-offsets.c:12:
   ./include/linux/mmzone.h: In function 'pfn_to_superpageblock':
>> ./include/linux/mmzone.h:989:34: error: 'PUD_SHIFT' undeclared (first us=
e in this function); did you mean 'NMI_SHIFT'?
     989 | #define SUPERPAGEBLOCK_ORDER    (PUD_SHIFT - PAGE_SHIFT)
         |                                  ^~~~~~~~~
   ./include/linux/mmzone.h:1212:56: note: in expansion of macro 'SUPERPAGE=
BLOCK_ORDER'
    1212 |         idx =3D (pfn - zone->superpageblock_base_pfn) >> SUPERPA=
GEBLOCK_ORDER;
         |                                                        ^~~~~~~~~=
~~~~~~~~~~~
   ./include/linux/mmzone.h:989:34: note: each undeclared identifier is rep=
orted only once for each function it appears in
     989 | #define SUPERPAGEBLOCK_ORDER    (PUD_SHIFT - PAGE_SHIFT)
         |                                  ^~~~~~~~~
   ./include/linux/mmzone.h:1212:56: note: in expansion of macro 'SUPERPAGE=
BLOCK_ORDER'
    1212 |         idx =3D (pfn - zone->superpageblock_base_pfn) >> SUPERPA=
GEBLOCK_ORDER;
         |                                                        ^~~~~~~~~=
~~~~~~~~~~~


vim +989 ./include/linux/mmzone.h

   976=09
   977	/*
   978	 * Superpageblock: 1GB (PUD-sized) region for anti-fragmentation tra=
cking.
   979	 *
   980	 * Groups pageblocks to steer unmovable/reclaimable allocations into
   981	 * already-tainted superpageblocks, preserving clean superpageblocks=
 for 1GB
   982	 * hugepage allocation.
   983	 *
   984	 * SUPERPAGEBLOCK_ORDER derived from PUD geometry:
   985	 *   x86_64: PUD_SHIFT=3D30, PAGE_SHIFT=3D12 =E2=86=92 order 18 =E2=
=86=92 1GB
   986	 *   Each superpageblock contains SUPERPAGEBLOCK_NR_PAGEBLOCKS pageb=
locks
   987	 *   (512 on x86_64 with 2MB pageblocks).
   988	 */
 > 989	#define SUPERPAGEBLOCK_ORDER	(PUD_SHIFT - PAGE_SHIFT)
   990	#define SUPERPAGEBLOCK_NR_PAGES	(1UL << SUPERPAGEBLOCK_ORDER)
   991=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
