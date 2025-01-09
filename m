Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3274A06
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 00:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736382017; cv=none; b=PiBPg/xAaH31reodhUuRVj/gGt6DcSd5JbFd3iuHTFw6W1CIhGq2W1u7J1QfJKZOoMLmg3cfvFzlcpAAtR9t+gitUNCZpeVOsUvtWPKtMPVvlyOxwHxRzTLufuZTn8DQxScLK8PdC8smO8NZfycDUq70sO/IVSoTIYiG5TYvqGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736382017; c=relaxed/simple;
	bh=6LKfl1lbkyOYXs1GcNtGlQnWT5y8adn1oZ2UfE80ZbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mg9d7gn4ATSb91qy7t0bZOgJwhErCVVxV/WIR5hUVcMIdCMDZam9azgWXXJiLSyAwzMUAwk0vnt8Fm5pHhwEIeJgfdpW4eAuQDJphyT8xUNfZATt6qyIKnXbyeLV01vcTvQmWgAWc5jNf31pHuWIpsnwbnGbIEnubGbHzNTkiQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dOc9nj7Z; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dOc9nj7Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736382014; x=1767918014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6LKfl1lbkyOYXs1GcNtGlQnWT5y8adn1oZ2UfE80ZbY=;
  b=dOc9nj7ZEshcA0yCmC79qg09m5v2g62FvovglG5APHlEiuC/cb3BfSWK
   CjsGS7akgdOkPx03tngl0r7u959DDZ2iR6+v+q14pSrXAzGMxz66X4mSU
   cW8Bh7+XiIiVKLFBQhcNhaxym3qO0RLH+KtjAdI1KNa8mo0XqRvv6MAi8
   ebqTDiCxo80wEik2icPIITI/AO7QW8TIVQwRDlQT19uXIrdvCWb42rG4b
   ByWr5OjEJWznUOcWDknGQ6xFaWzAcVDyNCJ+39FQSMfUF5xYi3lXITg5u
   GAuM7kwjkA/pA8pCcpM/rW33yxz7ai/FfunXHDYuO8HhO9B0av3QbCWxT
   A==;
X-CSE-ConnectionGUID: LtjyaHBcSJClAqAaXRxSHg==
X-CSE-MsgGUID: MuWOMjW3Qyat/xPsaIip5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40392956"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="40392956"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 16:20:14 -0800
X-CSE-ConnectionGUID: Dnf46OJAR6q5/zUXZhvsTg==
X-CSE-MsgGUID: yAJk0mtVRmSzCgP4jwkJng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140564346"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Jan 2025 16:20:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVgHR-000GqJ-2j;
	Thu, 09 Jan 2025 00:20:09 +0000
Date: Thu, 9 Jan 2025 08:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: Hao Ge <hao.ge@linux.dev>, akpm@linux-foundation.org, surenb@google.com,
	kent.overstreet@linux.dev
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, hao.ge@linux.dev, Hao Ge <gehao@kylinos.cn>
Subject: Re: [PATCH] tools/mm: Introduce a tool to handle entries in allocinfo
Message-ID: <202501090823.W7WjUFM1-lkp@intel.com>
References: <20250106112103.25401-1-hao.ge@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106112103.25401-1-hao.ge@linux.dev>

Hi Hao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.13-rc6 next-20250108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hao-Ge/tools-mm-Introduce-a-tool-to-handle-entries-in-allocinfo/20250106-192419
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250106112103.25401-1-hao.ge%40linux.dev
patch subject: [PATCH] tools/mm: Introduce a tool to handle entries in allocinfo
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501090823.W7WjUFM1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501090823.W7WjUFM1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> allocinfo_tool.c:126:1: warning: non-void function does not return a value in all control paths [-Wreturn-type]
     126 | }
         | ^
   1 warning generated.
   page-types.c:1003:28: warning: operator '?:' has lower precedence than '+'; '+' will be evaluated first [-Wparentheses]
    1003 |                         end = off + sigbus_addr ? sigbus_addr - ptr : 0;
         |                               ~~~~~~~~~~~~~~~~~ ^
   page-types.c:1003:28: note: place parentheses around the '+' expression to silence this warning
    1003 |                         end = off + sigbus_addr ? sigbus_addr - ptr : 0;
         |                                                 ^
         |                               (                )
   page-types.c:1003:28: note: place parentheses around the '?:' expression to evaluate it first
    1003 |                         end = off + sigbus_addr ? sigbus_addr - ptr : 0;
         |                                                 ^                      
         |                                     (                                  )
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
