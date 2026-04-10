Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1A17E0FF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 18:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775847134; cv=none; b=Zh+Ff20iTFu+ES+sXSXnNsS+hvqg12MHUNdRo0vXp+XCxjQEnLtHmG674XUjKZrhMF4hHhCf/qgEB94tbbWtcDBbd195rkwHQ8CY/8sFKZ88todpVf2gfLxFP99Mz91JZr4vvXLyeBs6OYmABx9y5pHmw5wyqK5z0VFYEUQ4kno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775847134; c=relaxed/simple;
	bh=AggaG91wPRDSvgzemCE+3J4O4j8lwUk/ndumHp7ZJ/4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qIq23xhFMuow02KpeSAbwNesvwCiPnl0iascqqsHXBiebck4AlbBvndeTU8AdzVknTKji+53zu8UB0+iItQWeE36/xFvKBV1S32VNHHiPFihzvco/ZvcsmofT0Quc6pcHWr6ixg+0b7siYbsX0oaLXo4dzbCQSh4fUXw4BcAgaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HvCiEkgX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HvCiEkgX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775847133; x=1807383133;
  h=date:from:to:cc:subject:message-id;
  bh=AggaG91wPRDSvgzemCE+3J4O4j8lwUk/ndumHp7ZJ/4=;
  b=HvCiEkgXVjmQantqAEmallARWUXL9R+6xrfJW6N6oGMk3gmKlw86Ei1f
   5UOG+EQmIjve68hyfhP1qq4j68+fTJREkebKbibLTjgwPiWJEQPEbxVuk
   dZrFxbIK+BGbZPewC1QAWlvf31kH8W36cqGQ/w0ta/Q1N1JlGuwFnlPGe
   9rK5dJYjVZMlWnopWhVr6QKgzCwQkkET7bfM7UnPyxu9PIMwhAk14ktCZ
   bDnLSwZpZfrDeyikIfMjovzUWWVU/ap4QHhcxvzC/AkJwUiU3pBrrTqFW
   liQJ8RncF+VOMbNEzF9fmcrgxPk/DSTZbYUN4hqdOfbrQ4srwBoj95ttt
   Q==;
X-CSE-ConnectionGUID: qRoqKBgzTX2KD7d1EEDuUA==
X-CSE-MsgGUID: VyxNL0VOSMe7PFPRH06rvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76782350"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76782350"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 11:52:13 -0700
X-CSE-ConnectionGUID: JGHjNxRTSB2OE70uoL8n3Q==
X-CSE-MsgGUID: SWJW15XFRB+hdZAhf9LTjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="228303675"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 10 Apr 2026 11:52:12 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBGxd-00000000Avz-2ocs;
	Fri, 10 Apr 2026 18:52:09 +0000
Date: Fri, 10 Apr 2026 20:51:33 +0200
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:alloc-token 1/1] Warning: mm/slub.c:5289 function
 parameter 'DECL_TOKEN_PARAM(token' not described in '_kmalloc_nolock'
Message-ID: <202604102036.4mqZTaYY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git alloc-token
head:   7914486e5e0321d516984b5816163611a86ba838
commit: 7914486e5e0321d516984b5816163611a86ba838 [1/1] slab: support for compiler-assisted type-based slab cache partitioning
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260410/202604102036.4mqZTaYY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102036.4mqZTaYY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604102036.4mqZTaYY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/slub.c:5289 function parameter 'DECL_TOKEN_PARAM(token' not described in '_kmalloc_nolock'
   Warning: mm/slub.c:5289 expecting prototype for kmalloc_nolock(). Prototype was for _kmalloc_nolock() instead
>> Warning: mm/slub.c:6683 function parameter 'DECL_TOKEN_PARAM(token' not described in 'krealloc_node_align'
>> Warning: mm/slub.c:6855 function parameter 'DECL_TOKEN_PARAM(token' not described in 'kvrealloc_node_align'
>> Warning: mm/slub.c:6683 function parameter 'DECL_TOKEN_PARAM(token' not described in 'krealloc_node_align'
>> Warning: mm/slub.c:6855 function parameter 'DECL_TOKEN_PARAM(token' not described in 'kvrealloc_node_align'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
