Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5D4BE71
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 22:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719441831; cv=none; b=OiOgn32/wl/IJK7+VJzPjTvTluWIocM/kYNvSpUN5pyfkN36H508bpjYYRmw0RvtF2torD+wIWn6U5Gq/Sg52hK29+Q8UPN8Xb8vgZdXdDQNgfPi8TqzusbirlHgUbH4V0t4mF5wWh8se7Z3F2EYRNhLiZ5X5NSWm9PmmMkwaxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719441831; c=relaxed/simple;
	bh=P6e1SPahKSII/ogsWGYvNHjTIPpnf+ED56tOcaw4BNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQuj7q4fEUEl+3CXCEhnl5JTeC3xVfPEC/YetJ/mOX6oUasJ0VM2/8eo+QTC264gs+YabfAx8VCBEMqlRubBCVk/F5QvSOalm1SJZN/1VzktvvEz+r1zqUxqdqYubbKyUTKVPqyeqvFkydZeiS5SOAAn/saTM5ixtB03pZbQeGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUiJq1/K; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUiJq1/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719441830; x=1750977830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P6e1SPahKSII/ogsWGYvNHjTIPpnf+ED56tOcaw4BNU=;
  b=lUiJq1/KdfvxCtI7nglDqJaqhcJ6rIX7ayG36TycwtzO+yBPyeKh7Vz8
   Dgdf/Gt41A7DtDsPJnqmiMAKoIq4w9XmBkVYtHRePk97riqB58T5Zn0lZ
   os46aAI0IVUUtzJWvsTzPKX6FBHe1xt5RCV+SLHF2bCKCugNxWHxBXGL8
   V5yifYNUE4zoMWDT4h/XFlk5L0Y1/p63PgxbpQXSJOsw4mlYLj0WfnS+w
   noBdmBF2YyMb5X49BT62ISB+uBl5Q+3j+kPSU8EQzlMij/fyT99xYsBPT
   JqxWKbiLhD+Pn1QNH2o8qdERu2HM5MBuFw1AnOHH9nJSrs2TUX4HDXGpU
   A==;
X-CSE-ConnectionGUID: hTr02AHBSNKWQSGP4LBqBg==
X-CSE-MsgGUID: lPqBklD+Sxqlhc7wzhrxmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="33995968"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="33995968"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 15:43:49 -0700
X-CSE-ConnectionGUID: F4dFk+K7S4SGjIjG+jal9Q==
X-CSE-MsgGUID: CaIrL00/TwCULMLnT92Ccw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="44578762"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Jun 2024 15:43:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMbMg-000FdO-0Y;
	Wed, 26 Jun 2024 22:43:46 +0000
Date: Thu, 27 Jun 2024 06:43:15 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Kagan <rkagan@amazon.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/3] mm/secretmem: implement mm-local kernel
 allocations
Message-ID: <202406270637.kuvejkNW-lkp@intel.com>
References: <20240621201501.1059948-3-rkagan@amazon.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621201501.1059948-3-rkagan@amazon.de>

Hi Roman,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus shuah-kselftest/next shuah-kselftest/fixes linus/master v6.10-rc5 next-20240626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Roman-Kagan/mseal-expose-interface-to-seal-unseal-user-memory-ranges/20240625-174709
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240621201501.1059948-3-rkagan%40amazon.de
patch subject: [PATCH RFC 2/3] mm/secretmem: implement mm-local kernel allocations
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240627/202406270637.kuvejkNW-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406270637.kuvejkNW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406270637.kuvejkNW-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/gup.c: In function 'follow_page':
>> mm/gup.c:1175:14: error: implicit declaration of function 'can_access_secretmem_vma' [-Werror=implicit-function-declaration]
    1175 |         if (!can_access_secretmem_vma(vma))
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/can_access_secretmem_vma +1175 mm/gup.c

  1168	
  1169	struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
  1170				 unsigned int foll_flags)
  1171	{
  1172		struct follow_page_context ctx = { NULL };
  1173		struct page *page;
  1174	
> 1175		if (!can_access_secretmem_vma(vma))
  1176			return NULL;
  1177	
  1178		if (WARN_ON_ONCE(foll_flags & FOLL_PIN))
  1179			return NULL;
  1180	
  1181		/*
  1182		 * We never set FOLL_HONOR_NUMA_FAULT because callers don't expect
  1183		 * to fail on PROT_NONE-mapped pages.
  1184		 */
  1185		page = follow_page_mask(vma, address, foll_flags, &ctx);
  1186		if (ctx.pgmap)
  1187			put_dev_pagemap(ctx.pgmap);
  1188		return page;
  1189	}
  1190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
