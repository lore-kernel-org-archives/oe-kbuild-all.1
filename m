Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5819C260580
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jun 2026 22:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782427541; cv=none; b=DZMU+TtEfLgqIPFe1EIY9fof9EyH2pNe4sq6WN3dY06RJLqqD666O1SncV8RdkBQKHq/9nlR1sPin7UrALl45oTWIb/PRY29xgmLjjcjMJpar3LWEEoNynmGx6yWVdsUCNmML8WdbZ2B41GtQBSlnMcU/BcUeinMQEgM3hMtQ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782427541; c=relaxed/simple;
	bh=xMwjTwgK43GmMwZUaFuZ4BZSBE+9l8JYwfKhFCcuIAQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dqeQTC0Fteir8H/1QeDYxo2r3aXbzvT0BN563zt4s7wsYCovDxWpi3b4pxccsxVb1EPL2JsF/q9s+NGcd2doKUzYueNZe+WdPB9/A5wwiE0qseXXp4WBxMjNxyQWAlQmakkyBO6JQ1IU9KUn2QDJeNzLsHLfMOPJF0oFmnyO9r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVWiuag5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVWiuag5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782427539; x=1813963539;
  h=date:from:to:cc:subject:message-id;
  bh=xMwjTwgK43GmMwZUaFuZ4BZSBE+9l8JYwfKhFCcuIAQ=;
  b=BVWiuag55L2GB69EBMmvWVMrA5CVL2M5x1t1vPB0ngaQMc53brXLnv9y
   M0POEynpPmU8tsyA1gk1MrU43BCpw8u4dLxKgqqsxqD5caWqm+OYw0vgN
   L1JHPsXPERaN93wch53EOocagcKdP8KgaKODiRkCf3eAKDGTZBzscReRz
   sqyFC9GXR7AgdPFk3Tk5hYxFNp1BK00CYnR0JCpXX7QKfw7e1clxlbABd
   0etHORObwP5xh9/6nxktwi2HbYOHJE88KO/3uhYxQrqvXaXd7psdQwdoi
   Py42x/Ov2899O04Hj2cV2fsdI1l4G/AfhPflz0DuPIRdblcS5oPkf3K9R
   g==;
X-CSE-ConnectionGUID: ZlkT+l1uSOagmhtJO7X1OA==
X-CSE-MsgGUID: chWKUU2sTXyfUPO9NCrdNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="87068807"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="87068807"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 15:45:39 -0700
X-CSE-ConnectionGUID: JVRCkwvKQ/2pMKKueDiICQ==
X-CSE-MsgGUID: QXqL1yzTQYqwCWyVskNFxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="250699150"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Jun 2026 15:45:37 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcspC-000000004aN-1nrD;
	Thu, 25 Jun 2026 22:45:34 +0000
Date: Fri, 26 Jun 2026 06:45:07 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>
Subject: include/linux/jiffies.h:449:36: sparse: sparse: cast
 truncates bits from constant value (7fffffffffffffff becomes ffffffff)
Message-ID: <202606260626.jNiBO19z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4edcdefd4083ae04b1a5656f4be6cd83ae919ef4
commit: b777b5e09eabeefc6ba80f4296366a4742701103 time/jiffies: Inline jiffies_to_msecs() and jiffies_to_usecs()
date:   5 months ago
config: x86_64-randconfig-122-20260626 (https://download.01.org/0day-ci/archive/20260626/202606260626.jNiBO19z-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260626/202606260626.jNiBO19z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b777b5e09eab ("time/jiffies: Inline jiffies_to_msecs() and jiffies_to_usecs()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606260626.jNiBO19z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/i915/gt/intel_engine_cs.c: note: in included file (through include/linux/ktime.h, include/linux/timer.h, include/linux/uprobes.h, include/linux/mm_types.h, ...):
>> include/linux/jiffies.h:449:36: sparse: sparse: cast truncates bits from constant value (7fffffffffffffff becomes ffffffff)
>> include/linux/jiffies.h:449:36: sparse: sparse: cast truncates bits from constant value (7fffffffffffffff becomes ffffffff)
>> include/linux/jiffies.h:449:36: sparse: sparse: cast truncates bits from constant value (7fffffffffffffff becomes ffffffff)
>> include/linux/jiffies.h:449:36: sparse: sparse: cast truncates bits from constant value (7fffffffffffffff becomes ffffffff)

vim +449 include/linux/jiffies.h

   433	
   434	/*
   435	 * Convert various time units to each other:
   436	 */
   437	
   438	#if HZ <= MSEC_PER_SEC && !(MSEC_PER_SEC % HZ)
   439	/**
   440	 * jiffies_to_msecs - Convert jiffies to milliseconds
   441	 * @j: jiffies value
   442	 *
   443	 * This inline version takes care of HZ in {100,250,1000}.
   444	 *
   445	 * Return: milliseconds value
   446	 */
   447	static inline unsigned int jiffies_to_msecs(const unsigned long j)
   448	{
 > 449		return (MSEC_PER_SEC / HZ) * j;
   450	}
   451	#else
   452	unsigned int jiffies_to_msecs(const unsigned long j);
   453	#endif
   454	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
