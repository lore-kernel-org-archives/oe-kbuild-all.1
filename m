Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BF5225A34
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 09:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744881108; cv=none; b=p/zhkdxIDEr6lZM3+2iaUKP3aBJBvdY18bEl0D0GVL788SQONT4zOKRBH0cNs/apdZnK7M6oM1uRhLwYMl0b+xcXbC0qNgdyWdkfGtOfZ3yFvKhwMUVhE4BeJUahmoCEcNO2Qw6qs6mHxoJB6b7v8cTqbtNffBOeCFg6xkePSzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744881108; c=relaxed/simple;
	bh=52R9LeDJblAfa8W8v6Ib4oG36bS70bSW8owEH0HDmOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIzKntoWafHaeNWMHlZu8mU6DJLd4tOsVdHxmd1CXFYvR+L4M6EItkR829iMUxaJ74qsAIW6nX02k3O24wpOv8d3wnbNeqU3Cp4y/d+rrIrfJE1bktiWtz8qLRDq2NqEEFCzU1IrybpcbMYS0g1+ZoIty1n80bz5WgQJC6WJzOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IDd2Qe6Z; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDd2Qe6Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744881107; x=1776417107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=52R9LeDJblAfa8W8v6Ib4oG36bS70bSW8owEH0HDmOk=;
  b=IDd2Qe6ZbsK+Wt/glQrZYkIO01fLzbQd+DwA9OjaoOv9Yh5/nhkCsFOL
   f26yAJBrXKkwRC5E+vYgfEJTIr7lvwCu/3a72jYFWyxMD3euJMKQdaak5
   rYnQd16mDxSi5Pgmm5/7kVZyeajoyG0i147Q2neoHIbxxUJVkWm9qh/Uj
   GU+taGO9qAwyS03+DInovm1idrnuDepX9cVKO4/EzaMSzJB2DFsbnc+5C
   J9+PLXwtR5PvKNvd1aT/gr0KFY3v9zeFuTftxm5xbyyuyRksGQxZMVhTW
   nU2kinJNCedtl5ORjUyrviDxagGUMi8/3BxBduWaVAYpyMjK2SM37odld
   g==;
X-CSE-ConnectionGUID: pHZunuiASuejsG8Qb46SMQ==
X-CSE-MsgGUID: NI9p9y60QdGK08GKkDNqxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46354890"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="46354890"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 02:11:45 -0700
X-CSE-ConnectionGUID: +4A0/zAERxyZMA69Oe/DWQ==
X-CSE-MsgGUID: C0O2szArQ0WSbspTjDd+Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="130504462"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Apr 2025 02:11:44 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5LHZ-000M7E-1N;
	Thu, 17 Apr 2025 09:11:41 +0000
Date: Thu, 17 Apr 2025 17:11:28 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 09/13] vt: support Unicode recomposition
Message-ID: <202504171730.edWXWP53-lkp@intel.com>
References: <20250415192212.33949-10-nico@fluxnic.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415192212.33949-10-nico@fluxnic.net>

Hi Nicolas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-linus]
[also build test WARNING on linus/master v6.15-rc2]
[cannot apply to tty/tty-testing tty/tty-next next-20250416]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolas-Pitre/vt-minor-cleanup-to-vc_translate_unicode/20250416-142136
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-linus
patch link:    https://lore.kernel.org/r/20250415192212.33949-10-nico%40fluxnic.net
patch subject: [PATCH v2 09/13] vt: support Unicode recomposition
config: arc-randconfig-002-20250417 (https://download.01.org/0day-ci/archive/20250417/202504171730.edWXWP53-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504171730.edWXWP53-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504171730.edWXWP53-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/vt/ucs.c:43: warning: Function parameter or struct member 'cp' not described in 'ucs_is_zero_width'
   drivers/tty/vt/ucs.c:43: warning: expecting prototype for Determine if a Unicode code point is zero(). Prototype was for ucs_is_zero_width() instead
   drivers/tty/vt/ucs.c:55: warning: Function parameter or struct member 'cp' not described in 'ucs_is_double_width'
   drivers/tty/vt/ucs.c:55: warning: expecting prototype for Determine if a Unicode code point is double(). Prototype was for ucs_is_double_width() instead
>> drivers/tty/vt/ucs.c:99: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Attempt to recompose two Unicode characters into a single character.


vim +99 drivers/tty/vt/ucs.c

    35	
    36	/**
    37	 * Determine if a Unicode code point is zero-width.
    38	 *
    39	 * @param cp: Unicode code point (UCS-4)
    40	 * Return: true if the character is zero-width, false otherwise
    41	 */
    42	bool ucs_is_zero_width(u32 cp)
  > 43	{
    44		return cp_in_range(cp, ucs_zero_width_ranges,
    45				   ARRAY_SIZE(ucs_zero_width_ranges));
    46	}
    47	
    48	/**
    49	 * Determine if a Unicode code point is double-width.
    50	 *
    51	 * @param cp: Unicode code point (UCS-4)
    52	 * Return: true if the character is double-width, false otherwise
    53	 */
    54	bool ucs_is_double_width(u32 cp)
    55	{
    56		return cp_in_range(cp, ucs_double_width_ranges,
    57				   ARRAY_SIZE(ucs_double_width_ranges));
    58	}
    59	
    60	/*
    61	 * Structure for base with combining mark pairs and resulting recompositions.
    62	 * Using u16 to save space since all values are within BMP range.
    63	 */
    64	struct ucs_recomposition {
    65		u16 base;	/* base character */
    66		u16 mark;	/* combining mark */
    67		u16 recomposed;	/* corresponding recomposed character */
    68	};
    69	
    70	#include "ucs_recompose_table.h"
    71	
    72	struct compare_key {
    73		u16 base;
    74		u16 mark;
    75	};
    76	
    77	static int recomposition_cmp(const void *key, const void *element)
    78	{
    79		const struct compare_key *search_key = key;
    80		const struct ucs_recomposition *entry = element;
    81	
    82		/* Compare base character first */
    83		if (search_key->base < entry->base)
    84			return -1;
    85		if (search_key->base > entry->base)
    86			return 1;
    87	
    88		/* Base characters match, now compare combining character */
    89		if (search_key->mark < entry->mark)
    90			return -1;
    91		if (search_key->mark > entry->mark)
    92			return 1;
    93	
    94		/* Both match */
    95		return 0;
    96	}
    97	
    98	/**
  > 99	 * Attempt to recompose two Unicode characters into a single character.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
