Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99A52E717B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 16:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231530; cv=none; b=WCZPmPDjpX1l8b8nfN/Z0hG90DpX9deCape/NtyGcFhXajD6hONG2GFTD+/5Kuhv5KvfZzzAj21OUxx3PJjFxoZiD70VXOuNafUpOhQ8NA7D65/o9v8+i/OWlp/Y6h8WHaAJl/Xxyp3rPIIBhZvY0lmdpmDN6DS5OsONF5UkFo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231530; c=relaxed/simple;
	bh=SFi46IF8yalXzd16nCzIQcS7FPO5l+ORfyWSuo3aTco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAqSAeibbaYMP6bVyTYyZcHL+SugRUF5iN8sB4Mm/yt9iTymoNy5DGG1VVUq5saZbFSee9Z1mbc4V28lQBgy+EbD3KMuaGcIzwP875+PXtSSVfXuoVXu0bNOiXddVkXd3pqLi3lQciAnHA5vz6ogHUX8t+p/idYs5yqJQi23IQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AGJP6Bb5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGJP6Bb5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782231528; x=1813767528;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SFi46IF8yalXzd16nCzIQcS7FPO5l+ORfyWSuo3aTco=;
  b=AGJP6Bb5WAQsXvRs6VqexWtJoloeIwMRFuLul9iLzMlVEy4RZQdVOozQ
   fXQTMrf1iUxmali22d5oI0He4h8FdfhwtkgdsaEsuNEAkDqMtBdGu3PsV
   QgAM+GzGhymX3Li3liAxUBHv5zNOMqeL6uB2dqr5saG8q63WINf6g6mLH
   laYrjiuwPN2iL4qiV8CaQr2fs+3qVpQyn6MuntlutSSJk8NxsOML5bw6T
   BMBuEXJb3RCqh9vRk3/4yjQ1NpWmP5dbmY0XZhI8TvewLYpc8CTn+7fMQ
   W2+sZMfaMMic+Tc0GPtFqkPRyAriM2292h2COgwudcNAKNSMA01+Kt92J
   A==;
X-CSE-ConnectionGUID: bsEadh3ATC23DmYtfSR2Ig==
X-CSE-MsgGUID: /lhWCqboTJyON8LuuPH43g==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94097748"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="94097748"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 09:18:43 -0700
X-CSE-ConnectionGUID: I16HtoYWTq+aZtMBuje4iw==
X-CSE-MsgGUID: LEQN8IzHT7+niBMXxLJabA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="249672676"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Jun 2026 09:18:40 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc3pc-000000002hV-1Zpf;
	Tue, 23 Jun 2026 16:18:36 +0000
Date: Wed, 24 Jun 2026 00:18:20 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
	david@kernel.org, ljs@kernel.org, riel@surriel.com,
	liam@infradead.org, vbabka@kernel.org, harry@kernel.org,
	jannh@google.com, sj@kernel.org, ziy@nvidia.com, balbirs@nvidia.com
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	Wei Yang <richard.weiyang@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] mm/page_vma_mapped: revalidate and do proper check
 before return device-private pmd
Message-ID: <202606240042.ffPsEXVc-lkp@intel.com>
References: <20260622130651.23359-1-richard.weiyang@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622130651.23359-1-richard.weiyang@gmail.com>

Hi Wei,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/mm-page_vma_mapped-revalidate-and-do-proper-check-before-return-device-private-pmd/20260623-012838
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260622130651.23359-1-richard.weiyang%40gmail.com
patch subject: [PATCH] mm/page_vma_mapped: revalidate and do proper check before return device-private pmd
config: parisc-randconfig-002-20260623 (https://download.01.org/0day-ci/archive/20260624/202606240042.ffPsEXVc-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240042.ffPsEXVc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240042.ffPsEXVc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'check_pmd.isra.24',
       inlined from 'page_vma_mapped_walk' at mm/page_vma_mapped.c:283:11:
>> include/linux/compiler_types.h:699:38: error: call to '__compiletime_assert_406' declared with attribute error: BUILD_BUG failed
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:680:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:699:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:60:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
    #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                        ^~~~~~~~~~~~~~~~
   include/linux/huge_mm.h:113:28: note: in expansion of macro 'BUILD_BUG'
    #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
                               ^~~~~~~~~
   include/linux/huge_mm.h:117:26: note: in expansion of macro 'HPAGE_PMD_SHIFT'
    #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
                             ^~~~~~~~~~~~~~~
   include/linux/huge_mm.h:118:26: note: in expansion of macro 'HPAGE_PMD_ORDER'
    #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
                             ^~~~~~~~~~~~~~~
   mm/page_vma_mapped.c:142:13: note: in expansion of macro 'HPAGE_PMD_NR'
     if ((pfn + HPAGE_PMD_NR - 1) < pvmw->pfn)
                ^~~~~~~~~~~~


vim +/__compiletime_assert_406 +699 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  685  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  686  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  687  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  689  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  690   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  691   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  692   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  693   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  694   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  695   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  696   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  697   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  698  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @699  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  700  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
