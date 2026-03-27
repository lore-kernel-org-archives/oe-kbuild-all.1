Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9E4B67E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 00:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774569872; cv=none; b=Vq/CRYn1oFrvEPwXF8jsotkiH9jVNUbvZ9bR+5sbofRHyjol3ysXuDZj7KjZ0wJtVacVY/JD5m7PY8SKQpGR5tjDKJoykcZUN92eb4T63eQk8p03avGLNPojG8XGazupdzoGPRBFY1TRc1lRz+XzSUqQywj6msGXsz+40r+Onv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774569872; c=relaxed/simple;
	bh=2AyvIytSVRjqvBWpkEulAvVFBxvbYWCG3Y4DTDJ07Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eM7YVBhW6coLWnFhfhvU+tB8c75i2yhQct3hieikDcnUSEmhqZh13LORuy43g5vx+8qM3Cp6tGscSHhuiZVWnm9NsfR0RB7mTH/UePnwUkUfeboQz65f2iX9nY3Y62KPdMqLU1+vkJ+KfRxgQ2R3+AWGHQqFFNJgyIsI3pOLgeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7+CopGf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7+CopGf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774569870; x=1806105870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2AyvIytSVRjqvBWpkEulAvVFBxvbYWCG3Y4DTDJ07Jc=;
  b=W7+CopGf9FrfbHut6G6pLdAbZ693xSr+LxiaJLXqWkZl09hTUSwrFJ+I
   GufZlT9fvkeNq4fYiL2llNBOln63xjgSeVZ3teIu6ed6LgsNKIyxLllQg
   aylMTJDy0Hmy0v1rFELdBW6GwTGzyvh9g789eb1znXg8xFZmnHhytuDQP
   UxFReUCMkAl4AfUA4tIo+JbPPy7o4zWtprS9RNwFa41l5+rGvqL2C+mtz
   QBSG+YYT4dsDycrBCK+pJwP/VqoPb8PAHDLT4bdKtTIgQl2o+FRz6xM+q
   VnnQeaByf9o2UoccwIHUt1GOJ0aNq+SMY8kgE9HZRY8eoHFW2yIrt99QB
   Q==;
X-CSE-ConnectionGUID: Nl5YEvnpQPGemN1QPl+XGg==
X-CSE-MsgGUID: ok1YMPa7SIWmAsljFiAztg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75546428"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75546428"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 17:04:29 -0700
X-CSE-ConnectionGUID: ZAAwFxu4TeKc4mu/eQJRBQ==
X-CSE-MsgGUID: PUmUWbWBSSKRNrCHYmtx4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="220297696"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Mar 2026 17:04:28 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5ugb-000000009WL-1foo;
	Fri, 27 Mar 2026 00:04:25 +0000
Date: Fri, 27 Mar 2026 08:03:27 +0800
From: kernel test robot <lkp@intel.com>
To: Bharata B Rao <bharata@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v6 3/5] mm: Hot page tracking and promotion - pghot
Message-ID: <202603270724.CtFSyk22-lkp@intel.com>
References: <20260323095104.238982-4-bharata@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323095104.238982-4-bharata@amd.com>

Hi Bharata,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on a989fde763f4f24209e4702f50a45be572340e68]

url:    https://github.com/intel-lab-lkp/linux/commits/Bharata-B-Rao/mm-migrate-Allow-misplaced-migration-without-VMA/20260325-092849
base:   a989fde763f4f24209e4702f50a45be572340e68
patch link:    https://lore.kernel.org/r/20260323095104.238982-4-bharata%40amd.com
patch subject: [RFC PATCH v6 3/5] mm: Hot page tracking and promotion - pghot
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260327/202603270724.CtFSyk22-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270724.CtFSyk22-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270724.CtFSyk22-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/pghot-default.c:10:
   mm/pghot-default.c: In function 'pghot_access_latency':
>> include/linux/pghot.h:56:41: error: implicit declaration of function 'GENMASK' [-Wimplicit-function-declaration]
      56 | #define PGHOT_TIME_MASK                 GENMASK(PGHOT_TIME_WIDTH - 1, 0)
         |                                         ^~~~~~~
   include/linux/pghot.h:57:42: note: in expansion of macro 'PGHOT_TIME_MASK'
      57 | #define PGHOT_TIME_BUCKETS_MASK         (PGHOT_TIME_MASK << PGHOT_TIME_BUCKETS_SHIFT)
         |                                          ^~~~~~~~~~~~~~~
   mm/pghot-default.c:24:17: note: in expansion of macro 'PGHOT_TIME_BUCKETS_MASK'
      24 |         time &= PGHOT_TIME_BUCKETS_MASK;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   mm/pghot-default.c: In function 'pghot_update_record':
   mm/pghot-default.c:60:36: error: implicit declaration of function 'BIT' [-Wimplicit-function-declaration]
      60 |                         hotness |= BIT(PGHOT_MIGRATE_READY);
         |                                    ^~~
   In file included from include/linux/jump_label.h:77,
                    from include/linux/static_key.h:1,
                    from include/linux/pghot.h:13:
   mm/pghot-default.c:61:28: error: implicit declaration of function 'try_cmpxchg' [-Wimplicit-function-declaration]
      61 |         } while (unlikely(!try_cmpxchg(phi, &old_hotness, hotness)));
         |                            ^~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^


vim +/GENMASK +56 include/linux/pghot.h

    54	
    55	#define PGHOT_FREQ_MASK			GENMASK(PGHOT_FREQ_WIDTH - 1, 0)
  > 56	#define PGHOT_TIME_MASK			GENMASK(PGHOT_TIME_WIDTH - 1, 0)
    57	#define PGHOT_TIME_BUCKETS_MASK		(PGHOT_TIME_MASK << PGHOT_TIME_BUCKETS_SHIFT)
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
