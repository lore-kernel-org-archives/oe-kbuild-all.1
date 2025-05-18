Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED92211A3F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747583025; cv=none; b=YFz53tQfS6GJ+hvPEUyKVc1OC/IHV+a+QaoJzUiwdAZyV8SwxwnpsAqXsK/s01st2h8KmJE7r6apLej1SBrHs8Ek6FMS7wS0n85yVF2o3J7mH83t1wW8bw+IZe3XbJO6a9mbm8Tsgqvy9LXv3FBazNqPEjd6avzeSWDB/OIcQ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747583025; c=relaxed/simple;
	bh=Rk03/9wHJIqP0wHoJDoxL0a8mbsDz8A09+IGXBT7rZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3SKVut23UfJ6gc1+psJ4MeD4+Xtaj8rSeLOVGyh8N9Q9JBQUqv3jKSNl+78Lt5HYEPWoriFu3J+N58K2vkXHNz5FBbOiqL7Vw73YKjvkvmUsAEEdDKpcw54mcQodC+N3dhTRZUxQ3xQC61Wwrm8NciJT5CPSE73Gtkw27vPQJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fk2jkh3h; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fk2jkh3h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747583024; x=1779119024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rk03/9wHJIqP0wHoJDoxL0a8mbsDz8A09+IGXBT7rZQ=;
  b=Fk2jkh3hivLx2H9PDu41dSz4HI8/xgitsC9rBkaQsA2GBgyS9T4fWt1w
   0pvkiJZ5eYS3BtlwI4+MXdlP+eYxoUFESt5lW3rBD4KQOPGm/Hv1kTT0t
   nsIjceRPXVZqQr2C+QFd8UzmeInMPkmvg3ndHAA+mZKakJVyzzdPW8txr
   G3Fjue5/kunn9N/x4etBvfCI3M2THM01eMVA6+ig8OHH5CA7qeRRMBkro
   2SNclm1xE2xrFZBjElmExKYD+VEqfQ+PrwlxlROn7QWYMVh/ppRsS3Rvb
   gq8Jlxt+h0Dn+AxcgF/SJPloat50JzoUGTHcG0LskNlQy7lXdzk/wHZ88
   g==;
X-CSE-ConnectionGUID: jwNz/4aPTWKNM3cAloehxQ==
X-CSE-MsgGUID: J5YUFcA+SVK6OHvN0f439g==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="48599027"
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="48599027"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 08:43:43 -0700
X-CSE-ConnectionGUID: 97z6snPhRNCnsC0t5fWWlA==
X-CSE-MsgGUID: tdYPHyrlTyq1RBePtWnYUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="143933214"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 May 2025 08:43:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGgAs-000Kr5-1F;
	Sun, 18 May 2025 15:43:38 +0000
Date: Sun, 18 May 2025 23:42:44 +0800
From: kernel test robot <lkp@intel.com>
To: David Laight <david.laight.linux@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Laight <david.laight.linux@gmail.com>,
	u.kleine-koenig@baylibre.com, Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 next 2/4] lib: mul_u64_u64_div_u64() Use BUG_ON() for
 divide by zero
Message-ID: <202505182351.bPFZE1vO-lkp@intel.com>
References: <20250518133848.5811-3-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518133848.5811-3-david.laight.linux@gmail.com>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250516]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/lib-mul_u64_u64_div_u64-rename-parameter-c-to-d/20250518-214037
base:   next-20250516
patch link:    https://lore.kernel.org/r/20250518133848.5811-3-david.laight.linux%40gmail.com
patch subject: [PATCH v2 next 2/4] lib: mul_u64_u64_div_u64() Use BUG_ON() for divide by zero
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20250518/202505182351.bPFZE1vO-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505182351.bPFZE1vO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505182351.bPFZE1vO-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/math/div64.c: In function 'mul_u64_u64_div_u64':
>> lib/math/div64.c:190:9: error: implicit declaration of function 'BUG_ON' [-Wimplicit-function-declaration]
     190 |         BUG_ON(!d);
         |         ^~~~~~


vim +/BUG_ON +190 lib/math/div64.c

   185	
   186	#ifndef mul_u64_u64_div_u64
   187	u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
   188	{
   189		/* Trigger exception if divisor is zero */
 > 190		BUG_ON(!d);
   191	
   192		if (ilog2(a) + ilog2(b) <= 62)
   193			return div64_u64(a * b, d);
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
