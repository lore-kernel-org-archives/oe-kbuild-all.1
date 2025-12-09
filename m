Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E6C2FD1A1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 09:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765274131; cv=none; b=ROu/JbM0sKhbUhC8i4I8tkU3OtdoYoQxCKR3okTYGZveHQ8H/nKHHtAz5404nqcZd0ANyJvrID166TQjH6I0xqRJMkCeADtOlXy7JUw0igvjkHIrdKFjA8C1LdkAmbxfuEFB8pm3FoQUKmD5B29nbQWbneSLtaYQkEJdxmHtn2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765274131; c=relaxed/simple;
	bh=WUs7r+J6bXFpDh7ayirRnSaKdkdL3HYKLS9fGPGyaRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ojc6HLbOvn8HMY7SX160VhvMhOyTtrpC3mRiqj0bIXZWs2WcwiXXEI1tXLAqvK6WMIhZZB5e7vbAmDC4Y95q0FHH5KPbe137SNDXvUL81KDXPaspjBeUx2vLBCd2Er/9ZWYyOEY8jcYuhC1VTg2ryrEqALpJR8uOV9OoQoml9lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=biUnudgq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="biUnudgq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765274130; x=1796810130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WUs7r+J6bXFpDh7ayirRnSaKdkdL3HYKLS9fGPGyaRc=;
  b=biUnudgq1CUbsZ5ldfjkwFF5iUDxN5ZL3vQHK2kRFOQ2Zw9TTbxqLMJ+
   d2G5lQ+ikflCm+uzGoDKA1BxlMkmyr3wZ4ZWLYWeHbcUd8b0fk9oYsfmP
   +QaGF0nVJimYE4KpYyrfgTEoKConqfk8kH6IBcuwEmUynvvv6zstuO1yR
   a1HmQBBVPNIFBjT0IZ8bAGzm04abG/fAQ4lDogC79FD9ZbTjXcRAgx6Be
   dVDLMD3zDUyijR4Ny95H7+E4wmcTf4lUWR9WMFxtm3QxsAV+yVfumvbzo
   OspGMtyLB+AV4Y+H9TWjizEIiV5FILQ9+LS/MhVNq13+0OGScaPQpwPFr
   g==;
X-CSE-ConnectionGUID: cXcg02/4RiOWSMa8cN6AEw==
X-CSE-MsgGUID: PxDT7dbvS5uJkn85mpl57Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="77549640"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="77549640"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 01:55:28 -0800
X-CSE-ConnectionGUID: BX5nu9W6SOm4T1F9M/xx6g==
X-CSE-MsgGUID: aRr+P5HxRSWqix/GB5gnoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="196476646"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Dec 2025 01:55:25 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSuRH-000000001cT-2A1y;
	Tue, 09 Dec 2025 09:55:23 +0000
Date: Tue, 9 Dec 2025 17:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH] resource: add WARN_ON_ONCE for resource_size() and
 document misusage
Message-ID: <202512091733.6IVBDnru-lkp@intel.com>
References: <20251208202921.16819-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208202921.16819-1-ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.18 next-20251209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/resource-add-WARN_ON_ONCE-for-resource_size-and-document-misusage/20251209-043037
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251208202921.16819-1-ansuelsmth%40gmail.com
patch subject: [PATCH] resource: add WARN_ON_ONCE for resource_size() and document misusage
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20251209/202512091733.6IVBDnru-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512091733.6IVBDnru-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091733.6IVBDnru-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/resource.c:15:
   include/linux/ioport.h: In function 'resource_size':
>> include/linux/ioport.h:302:9: error: implicit declaration of function 'WARN_ON_ONCE' [-Wimplicit-function-declaration]
     302 |         WARN_ON_ONCE(!res->flags);
         |         ^~~~~~~~~~~~


vim +/WARN_ON_ONCE +302 include/linux/ioport.h

   288	
   289	/**
   290	 * resource_size - Get the size of the resource
   291	 * @res: Resource descriptor
   292	 *
   293	 * This MUST be used ONLY with correctly inizialized resource descriptor.
   294	 * Passing a resource descriptor with zeroed flags will produce a WARN
   295	 * signaling a misusage of this helper and probably a BUG in the user
   296	 * of this helper.
   297	 *
   298	 * Return: Size of the resource calculated from resource end - start + 1.
   299	 */
   300	static inline resource_size_t resource_size(const struct resource *res)
   301	{
 > 302		WARN_ON_ONCE(!res->flags);
   303		return res->end - res->start + 1;
   304	}
   305	static inline unsigned long resource_type(const struct resource *res)
   306	{
   307		return res->flags & IORESOURCE_TYPE_BITS;
   308	}
   309	static inline unsigned long resource_ext_type(const struct resource *res)
   310	{
   311		return res->flags & IORESOURCE_EXT_TYPE_BITS;
   312	}
   313	/* True iff r1 completely contains r2 */
   314	static inline bool resource_contains(const struct resource *r1, const struct resource *r2)
   315	{
   316		if (resource_type(r1) != resource_type(r2))
   317			return false;
   318		if (r1->flags & IORESOURCE_UNSET || r2->flags & IORESOURCE_UNSET)
   319			return false;
   320		return r1->start <= r2->start && r1->end >= r2->end;
   321	}
   322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
