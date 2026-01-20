Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5863D7D7D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 09:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901635; cv=none; b=IdZIGYlyE0hS81FIaouMM7JSL7RcFDWMWgkhyYzKfgSEb/YOaKq5sxopkgeuA+aOc73PJGzJQv0w1NrbkGGb16rw4c8pgM96UO+iqc9euXL7sIOUH5vaKDqcIQOSfw41lQp79guBmgF8le9+AEriFSmoq1FOTSZPAx+dVjokWoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901635; c=relaxed/simple;
	bh=tpFU4oo4vjqoWS/NoX4LYAK/xZJKhAwm9JFyEux1eI8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dl6JIyIyAEkPwKO7V3tzBdQ4DQj8ErPyNpJmMU3mpUR3qUZ5I8rbamySMg/R5WwZGV8L4xroqbLd2Nb/BDJEONXDVzGoT+IQ+l7ynLvJiX3cLcNmo0MRz8WrLY8ZEM/pXAM7xC+FZr20dO1xKX6XuPqcnUtxwWOaE1OFq6BVq3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fSKp1FR6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fSKp1FR6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768901635; x=1800437635;
  h=date:from:to:cc:subject:message-id;
  bh=tpFU4oo4vjqoWS/NoX4LYAK/xZJKhAwm9JFyEux1eI8=;
  b=fSKp1FR6I4XSogvRonByw2o8Eb+wMhH9DB8HLzhJpA33POTGAPSnkgu7
   GH2ZeE7AvalCQaqVKx9NaaccR8l6sK7duKu3S78uzLNupg+liNyAanvf2
   EqBVMM8jt3Gdjapt46SV7wM1jNPUSPcW4+Z7tCxS2q3/dqS6SZwkFmIPw
   DRxBd55Z5Say0UJPxTne7kJrN4acEI0NZF5sRXmxdKl91TgPL1zy/+LyV
   Fi+pnkCO/oeBQ0pOBmEt0uzvgzote0c/l9Qh5m/MyrWlz9imikZdp9vvW
   szj1aSLSBe8ATAfEeRvL9oSbKFEnyGiliXIQ3KpBRk0dTSWR2GENh4C5c
   A==;
X-CSE-ConnectionGUID: 0xhKpegfTuSQTiXwPY/8aw==
X-CSE-MsgGUID: veUp41HzQ4usMpxkx1KTpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70077054"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70077054"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 01:33:53 -0800
X-CSE-ConnectionGUID: U07pzMKFSISdo/X3iVTPZw==
X-CSE-MsgGUID: dpXu9l9pRV6d5wRNUrydLQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Jan 2026 01:33:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi87P-00000000Olt-3qZt;
	Tue, 20 Jan 2026 09:33:47 +0000
Date: Tue, 20 Jan 2026 17:33:18 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Al Viro <viro@zeniv.linux.org.uk>
Subject: [linux-next:master 5495/7987] fs/namei.c:142:16: sparse:
 sparse: cast truncates bits from constant value (123456789abcdef becomes
 89abcdef)
Message-ID: <202601201710.IdchKtgV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
commit: 7ca83f8ebe86706c4164ac21871f4a5adb86a430 [5495/7987] fs: hide names_cache behind runtime const machinery
config: i386-randconfig-r132-20260120 (https://download.01.org/0day-ci/archive/20260120/202601201710.IdchKtgV-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201710.IdchKtgV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201710.IdchKtgV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/namei.c:142:16: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
>> fs/namei.c:142:16: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   fs/namei.c:147:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   fs/namei.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'leave_rcu' - unexpected unlock
   fs/namei.c:2616:19: sparse: sparse: context imbalance in 'path_init' - different lock contexts for basic block

vim +142 fs/namei.c

   139	
   140	static inline struct filename *alloc_filename(void)
   141	{
 > 142		return kmem_cache_alloc(names_cache, GFP_KERNEL);
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
