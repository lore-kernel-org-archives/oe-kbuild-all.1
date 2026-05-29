Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61294222565
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 12:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780058901; cv=none; b=s7WBaj5lLTQ5C/04J8RnV+vUa+pDUDdtgSjW5UX6qkPj/ILvzFJQ6rbofhB6j0M/fp/FATfjeQMynGW2DPuk3KZJVWUrz0F5IwdS9IjkhAk8WH2aN8VpEIAX8h9blr5HgNOdQm45wQE3P+0Skpz1FTUe16ZZlVx+OWTOAzxchs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780058901; c=relaxed/simple;
	bh=HO1WR6twZag3h0xFdgAKX/czudAafCz+VLFaYqj8tHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBkHUJyfeq4/9YyPy6gb/u3KkkySSSwwQmgK4GfeOZgqIjve/C933+qsxHCPyRiJsxEEWqk2pPkeUTNy6TJVFxtNekGl0URPZ58hvWcLjp3JAhFPecjSp95MA6Nd+EVgYJQFN+63bmAYYCpSf7VsXbJRutcFMdLO8fV/T8K+FpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MnAxgju4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MnAxgju4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780058900; x=1811594900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HO1WR6twZag3h0xFdgAKX/czudAafCz+VLFaYqj8tHY=;
  b=MnAxgju4SCIuknyv+nS0O+Sc04AmSZ7Wibfj1Z7gu2oCJAVyTX62voiK
   Szq2kE1Yck9pGMYJJbWotQWzq5fBKBg9df/SxBsmJm9N0sbRxqsPg2N/h
   K5nL9SrjBaSZgADNXeM3NmTb5slpqql0HBLFErw1uwd/xR++NYd3yZL7Z
   L3JD4EFo5ew/CWVDEEihpr8p8XqiY+yU+aMvY8qQMM38JFthgtdGF5+e6
   yBRwa6I0lwQXE7+8Gw5US3tA7su6RYwcjjMWWZ3z369P5PMS7pdRCbQfd
   qUiDiym8+yUmI0GWiy651v4RbdiN4d24oQ9fJi57f1twtMpP1cjhMPSGj
   Q==;
X-CSE-ConnectionGUID: ZZAuQJcjTKesxPaC3tvSAQ==
X-CSE-MsgGUID: ZcJ578RrRkKdMWqHLZFlgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="98481909"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="98481909"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 05:48:19 -0700
X-CSE-ConnectionGUID: U45MxQSeSeayqC7nDdmzOw==
X-CSE-MsgGUID: lttKo//4TxeWrxIwEzQrzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="240294353"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 May 2026 05:48:16 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSwdI-000000007EM-3wbN;
	Fri, 29 May 2026 12:48:12 +0000
Date: Fri, 29 May 2026 20:47:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <ynorov@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Yury Norov <ynorov@nvidia.com>,
	Farhad Alemi <farhad.alemi@berkeley.edu>,
	Waiman Long <longman@redhat.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	cgroups@vger.kernel.org
Subject: Re: [PATCH] mm: don't allow empty relative nodemask in
 mpol_relative_nodemask()
Message-ID: <202605292049.eaIv99hr-lkp@intel.com>
References: <20260528190337.878027-1-ynorov@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528190337.878027-1-ynorov@nvidia.com>

Hi Yury,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Yury-Norov/mm-don-t-allow-empty-relative-nodemask-in-mpol_relative_nodemask/20260529-030835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260528190337.878027-1-ynorov%40nvidia.com
patch subject: [PATCH] mm: don't allow empty relative nodemask in mpol_relative_nodemask()
config: sparc64-randconfig-002-20260529 (https://download.01.org/0day-ci/archive/20260529/202605292049.eaIv99hr-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605292049.eaIv99hr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605292049.eaIv99hr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mempolicy.c: In function 'mpol_relative_nodemask':
>> mm/mempolicy.c:377:10: warning: 'return' with a value, in function returning void
      return -EINVAL;
             ^
   mm/mempolicy.c:370:13: note: declared here
    static void mpol_relative_nodemask(nodemask_t *ret, const nodemask_t *orig,
                ^~~~~~~~~~~~~~~~~~~~~~


vim +/return +377 mm/mempolicy.c

   369	
   370	static void mpol_relative_nodemask(nodemask_t *ret, const nodemask_t *orig,
   371					   const nodemask_t *rel)
   372	{
   373		unsigned int w = nodes_weight(*rel);
   374		nodemask_t tmp;
   375	
   376		if (w == 0)
 > 377			return -EINVAL;
   378	
   379		nodes_fold(tmp, *orig, w);
   380		nodes_onto(*ret, tmp, *rel);
   381	}
   382	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
