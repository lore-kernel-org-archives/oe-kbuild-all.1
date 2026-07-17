Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A45C42E8E0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 15:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784301921; cv=none; b=NYsUCzKAbmYcYUHx4U9zY51lzKe+fE8GnhbW0t7WLlMRP1A3zyQxRyeDdqxQ6tdlWanyuq0GKXMXcdTr/eKaGK39RsXjSpgq/9yBk4sNlF8cWTsXcn2lOjD/LFCeGMrwJseryZIVo7dzL6o+tjvkWbJuM6I9wNobbRA9Z7zHPNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784301921; c=relaxed/simple;
	bh=z+YWDXIGPujDw4Q2Q/usa1Byy6OArWai6eg3HgI6YlU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lfjplHVvEyJQlgpmNxE/uO4frRjXXkXjJmubJmRq+oSkWzKDDSXGE9VrDuOcwhRJRHbMaPH8jeZjfmAD5pOYT/MQDnywp2aRxmgGhDkzplfT67ZBvUCzCxheBTEvuK/ll3JyYRRW01CaVlQlEm8iQZ8OxG859jtaSkkpE9NPhxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WiO9rt2O; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WiO9rt2O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784301916; x=1815837916;
  h=date:from:to:cc:subject:message-id;
  bh=z+YWDXIGPujDw4Q2Q/usa1Byy6OArWai6eg3HgI6YlU=;
  b=WiO9rt2OTP+EyfJTwU6awbqrAL+wKBhZEZHaT5DK2BXrGPDIVTRqMw6M
   GTB+OsoidHiV+QE1ab62944dW6DEyNcBZGVbJvZg+e5d8eY5+Es+T1mlG
   oTI2E2Dqt6Rvtuy4gFSW4pzKC5SvUiUi2vsq/EpjqYcuQ9P5L+kF0oSm4
   aX/Es29BYzXl2z5NEgcXc8ZGVHgA0HoMr6XNrtFaojgny1VRrQD3XfQLT
   fH0OIXZ9qZVdhz4uBpAAhA6v7PIoHnHW+KlirZChMAryo7XHllCw7c2wz
   niXi97OtvsKaZ0YPKRgHt05vFnuzdcj4xqpuOt6WQcJyUcdVg/+Bign5u
   w==;
X-CSE-ConnectionGUID: H0Q8wenJTyiJ0Z0TVGz02g==
X-CSE-MsgGUID: 7U88HE03REqHEMDbQwCj4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85175194"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="85175194"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 08:25:10 -0700
X-CSE-ConnectionGUID: 0wGYh3JGTz6un9FQj6Nbbw==
X-CSE-MsgGUID: W3x+rs42Thmn3Qgp6pjIvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="256894347"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 17 Jul 2026 08:25:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkkQz-00000000SsM-2kNF;
	Fri, 17 Jul 2026 15:25:05 +0000
Date: Fri, 17 Jul 2026 23:24:16 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 "Harry Yoo (Oracle)" <harry@kernel.org>
Subject: fs/namei.c:142:16: sparse: sparse: cast truncates bits from
 constant value (123456789abcdef becomes 89abcdef)
Message-ID: <202607172359.RRXiDyop-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fce2dfa773ced15f27dd27cd0b482a7473cdcf2a
commit: feb662d9168b63e1d4c02671ec96005410c6f3ce slab: support for compiler-assisted type-based slab cache partitioning
date:   9 weeks ago
config: i386-randconfig-r123-20260717 (https://download.01.org/0day-ci/archive/20260717/202607172359.RRXiDyop-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607172359.RRXiDyop-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: feb662d9168b ("slab: support for compiler-assisted type-based slab cache partitioning")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607172359.RRXiDyop-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/namei.c:159:33: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   fs/namei.c:159:33: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   fs/namei.c:159:33: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   fs/namei.c:793:12: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   fs/namei.c:793:12: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   fs/namei.c:793:12: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
>> fs/namei.c:142:16: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
>> fs/namei.c:142:16: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   fs/namei.c:147:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)

vim +142 fs/namei.c

c3a3577cdb351e Al Viro       2025-11-19  139  
c3a3577cdb351e Al Viro       2025-11-19  140  static inline struct filename *alloc_filename(void)
c3a3577cdb351e Al Viro       2025-11-19  141  {
7ca83f8ebe8670 Mateusz Guzik 2025-12-01 @142  	return kmem_cache_alloc(names_cache, GFP_KERNEL);
c3a3577cdb351e Al Viro       2025-11-19  143  }
91a27b2a756784 Jeff Layton   2012-10-10  144  

:::::: The code at line 142 was first introduced by commit
:::::: 7ca83f8ebe86706c4164ac21871f4a5adb86a430 fs: hide names_cache behind runtime const machinery

:::::: TO: Mateusz Guzik <mjguzik@gmail.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
