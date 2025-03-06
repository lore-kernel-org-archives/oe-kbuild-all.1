Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE52920E32B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 11:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260887; cv=none; b=mnKiMnpCW3TMcZ5IdIIUeOXbhuQIFLKnlYCR78amHUwhH4wf/1UuJz4umpdjONzHsSsTB6xCk+Hoa5iElVMbDQwHm6eIwz9OZ3nWz5hOGAodUErn66O84BCOyOIAvoT1aGIuVYDJuN9t41iJR46XQWEquxUNu1GhbFxvw0pfZs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260887; c=relaxed/simple;
	bh=SS66zVFiBjYjq1312ogJ+VVXDalri2dAreyfqpAyyHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FAyEfSwd2HuJQ586M0ojl9ppOldtn66mmI72R8PGiLpq+oHKRsGxnSgpEp4DKs1nESqKEAn1SxyBFoIVGCMHmGnzOUh2pgvOVnljEpB/Qoh8t9+rW9Y5QzuHugcBYLfmT4/C1gPfuRrIA+U2lvJe/okeRw6PGZqFaOC5afysWKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YREWxZ3f; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YREWxZ3f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741260886; x=1772796886;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SS66zVFiBjYjq1312ogJ+VVXDalri2dAreyfqpAyyHM=;
  b=YREWxZ3fudsENAmtxhEjwMeH4MLHNSC2U/j2p/Tlt1GmVyg0OUzy2+se
   1KsCEpeFmBdTtg3pdWSng16QVpBHz6mfca5z9zBTREvC7kqvjj+FsAODY
   kbCYnJQULaM6gaPf4WJkGAkCub8dSEABBGOyJjZVOutY99uRsKtlRyX8b
   aGP4i4BLMKDRc36W17l4WTa2kY/c1uk1wfoLoSKEmvjSey2RDhG9TWROs
   oPRta0gAd0WdPcBhjnuOYkclpx/Ip78ycC49NnyQ52kgLs7jrluCh0su/
   WgU1biIumfAC6mrucif3fubzWqL6UA2M2CfUrscAicYENpQuXjoygIBC4
   g==;
X-CSE-ConnectionGUID: UIifkYvZT5unhOb8a5qVlw==
X-CSE-MsgGUID: vlclzEScT6GTEIT/EPWqBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41438719"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="41438719"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 03:34:44 -0800
X-CSE-ConnectionGUID: Jrmx/qU3Sh+gzS6592kmpw==
X-CSE-MsgGUID: Q/Qqo8nQSMmaGD7fKcw3YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="119192383"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2025 03:34:42 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq9Uu-000MzC-1X;
	Thu, 06 Mar 2025 11:34:40 +0000
Date: Thu, 6 Mar 2025 19:34:21 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, willy@infradead.org,
	michel@lespinasse.org, linux-mm@kvack.org,
	Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [PATCH 3/7] lib/rbtree: add random seed
Message-ID: <202503061924.hFdFosTG-lkp@intel.com>
References: <20250304011952.29182-4-richard.weiyang@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304011952.29182-4-richard.weiyang@gmail.com>

Hi Wei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.14-rc5 next-20250306]
[cannot apply to akpm-mm/mm-nonmm-unstable akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/lib-rbtree-enable-userland-test-suite-for-rbtree-related-data-structure/20250304-092345
base:   linus/master
patch link:    https://lore.kernel.org/r/20250304011952.29182-4-richard.weiyang%40gmail.com
patch subject: [PATCH 3/7] lib/rbtree: add random seed
config: csky-randconfig-002-20250305 (https://download.01.org/0day-ci/archive/20250306/202503061924.hFdFosTG-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061924.hFdFosTG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061924.hFdFosTG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/interval_tree_test.c:22:22: warning: conversion from 'long long unsigned int' to 'ulong' {aka 'long unsigned int'} changes value from '3141592653589793238' to '2721204694' [-Woverflow]
      22 | __param(ulong, seed, 3141592653589793238ULL, "Random seed");
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   lib/interval_tree_test.c:10:28: note: in definition of macro '__param'
      10 |         static type name = init;                \
         |                            ^~~~
--
>> lib/rbtree_test.c:17:22: warning: conversion from 'long long unsigned int' to 'ulong' {aka 'long unsigned int'} changes value from '3141592653589793238' to '2721204694' [-Woverflow]
      17 | __param(ulong, seed, 3141592653589793238ULL, "Random seed");
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   lib/rbtree_test.c:10:28: note: in definition of macro '__param'
      10 |         static type name = init;                \
         |                            ^~~~


vim +22 lib/interval_tree_test.c

    20	
    21	__param(uint, max_endpoint, ~0, "Largest value for the interval's endpoint");
  > 22	__param(ulong, seed, 3141592653589793238ULL, "Random seed");
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
