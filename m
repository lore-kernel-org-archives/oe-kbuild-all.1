Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB513375F9A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534621; cv=none; b=dYhGUajnUtBzSRUVYzYQZd9cYNNI8WITfsBskXHkXm4EiLTh6c7kIg3HmtnKQ2jYOXuINKfy8MjjqBHB49ARQN7RPZfOjATZ+Utu7GvuyrUfoOViQIzVOy6la44+TlC+v8wCwC5e/6W7LSIk15l8TmCXxqFl5hFxR3yz3Bg8xT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534621; c=relaxed/simple;
	bh=tXNpaL/0VvcwHMdNOpUB4jxemH7mXXJ0Xg2FUtqzQeo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cwl+ncSJRxRgigSyjgWDgdPR0HEpH0mdePJ/R41l3AdBUsulyLISZEuEX2Uuk0uLgpbEwnMqNxpENALnIEnIxNL8VfoNvr/7bZV81gjPXHLf2Dz3+YRT2MumBnUjFU/0ZRaIRt1Q525ceuoujwIdnv+JwdAziM08sj+X0pMVxWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SH7+2Si7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SH7+2Si7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534619; x=1807070619;
  h=date:from:to:cc:subject:message-id;
  bh=tXNpaL/0VvcwHMdNOpUB4jxemH7mXXJ0Xg2FUtqzQeo=;
  b=SH7+2Si7SP+a7zKvmWLLz9S90Qg+Rcel2LHIIipRhjEFG2+A7yCMUPKU
   WyG0UlEgJeTjwh1m9iykQMUP7sPP0oYUwbuCJpaZtvfhp93yqzg6HrbAF
   4j4k7G9hKtZz3IXHKAoGuL8cdeqskxPWikvLZFEJfSPE7vGcu13okRx5M
   k1cwpKJkQ9yxqBuZyzewRW/yJNEeWClaS7AhW0SySN0pJfNIN2LxK4qKI
   /qKwheH8dAA5aEXCV7ZOjN6onbMmBOEvZpMJa07ogCQ58eROAxKNphPG3
   zHi3IIJ7HvdELS9hj0m69k2DRVzqYtDX2lRMRGwiedFmd643q6d4UhBxv
   A==;
X-CSE-ConnectionGUID: AL05OEN2QFirjuAeUwikzQ==
X-CSE-MsgGUID: byDmmV8XQoW9n/GPKL5j6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87114709"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87114709"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:03:37 -0700
X-CSE-ConnectionGUID: kC6PnjFvTESdRZgl2KLB6g==
X-CSE-MsgGUID: lIEt5FRARp6KziO8pnogbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="223261234"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Apr 2026 21:03:37 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xf4-0000000008t-0Xzi;
	Tue, 07 Apr 2026 04:03:34 +0000
Date: Tue, 07 Apr 2026 12:03:17 +0800
From: kernel test robot <lkp@intel.com>
To: Zach Brown <zab@zabbo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 41/51] fs/rpdfs/place.h:34:8:
 error: implicit declaration of function 'cpu_to_le64'
Message-ID: <202604071107.ObPMwRzw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   9a0627207ad856d2a5eb09f3458afb1e34ac10a3
commit: 7db9f9d6d7cd9f1130ec06063f679a26a17d9fc0 [41/51] rpdfs: add place details metadata
config: alpha-randconfig-r061-20260407 (https://download.01.org/0day-ci/archive/20260407/202604071107.ObPMwRzw-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071107.ObPMwRzw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071107.ObPMwRzw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/rpdfs/block.h:8,
                    from fs/rpdfs/txn.h:7,
                    from fs/rpdfs/balloc.h:10,
                    from fs/rpdfs/btree_txn.c:3:
   fs/rpdfs/place.h: In function 'rpdfs_place_split_le':
>> fs/rpdfs/place.h:34:8: error: implicit declaration of function 'cpu_to_le64' [-Werror=implicit-function-declaration]
     *lo = cpu_to_le64((u64)full);
           ^~~~~~~~~~~
   fs/rpdfs/place.h: In function 'rpdfs_place_combine_le':
   fs/rpdfs/place.h:40:16: error: implicit declaration of function 'le64_to_cpu' [-Werror=implicit-function-declaration]
     return ((u128)le64_to_cpu(hi) << 64) | le64_to_cpu(lo);
                   ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/cpu_to_le64 +34 fs/rpdfs/place.h

    31	
    32	static inline void rpdfs_place_split_le(__le64 *lo, __le64 *hi, u128 full)
    33	{
  > 34		*lo = cpu_to_le64((u64)full);
    35		*hi = cpu_to_le64(full >> 64);
    36	}
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
