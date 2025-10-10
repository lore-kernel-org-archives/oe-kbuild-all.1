Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C638754654
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 11:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760095289; cv=none; b=jYkrckEyez8FfslLIFtVdjkiiwEod1QVA+Q0w9SXD0D+72f1b0f56iQXo+G8mLSgMgIWQj5l7C4BYRPFY6/AcjY6mF+HzWk8TLhOIu5xg0+2kllOpYhwTyVa9AWDqQ6hID4ossnpbP8OowhQGsTOE/DaO3UgdNuqWzn6IfpRGHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760095289; c=relaxed/simple;
	bh=1CQbzYXC+9NESPxQWSqTzS9UPib4iCDbQConbw5IDjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DAf8bYz6aY/fs72mTYCntO0sDEKRJL526nsgNMra6Q8B66jCeeeHmucBOR6Mgt6R4iNoqPD6kcP9ddZw2eLLFwf7W5j6+l4f8X8DwFURqDpiB0pdWv1/ChIhj6O/Gv+dzUfrDSz8pzoDqsvSaDTussl/BP0o5eidXFcHIicP1Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W9xEJypM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W9xEJypM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760095288; x=1791631288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1CQbzYXC+9NESPxQWSqTzS9UPib4iCDbQConbw5IDjA=;
  b=W9xEJypMI8AGcOtAFFoQqKzgrdBtwGEyHvtPCMaqPTWF0IsJUTyq1CQ8
   6tKVAGm26mu0ww3JzWjeHHySWRkrLEJe+GWuuAZ1RQzry+vMHyvSqZmkB
   KHS6a6Du95Pk1M0od5TDwT6ctlPcbUZvcTupmjdPS5Ua4q4opjsZUVsn0
   SKHctBEke1EZ+lgMU6S/Vg4PTfbmUANJooBpi+D/Aoe3Hko3FO+fCVRHY
   cQq5U9y+5qdbtolDNFuXyp6xml69w6AQW+qYLaFzUZNuMcMHd0la+PJMh
   TZF3rTLb15NESkAicjRS4iYkBYruiFSdF1IQi9Aux0j3VA60zy/a7pCMB
   g==;
X-CSE-ConnectionGUID: yQfxsv7fSi60IIcdKxQWyQ==
X-CSE-MsgGUID: ixuO7M9zSreFgawsEmKKOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72569857"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="72569857"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 04:21:27 -0700
X-CSE-ConnectionGUID: u1xD0q7CQ0eWzEndPchRhg==
X-CSE-MsgGUID: 0Tpb30eKQe6PCJuhzMF9wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="185342858"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Oct 2025 04:21:26 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7BBc-0002aU-0U;
	Fri, 10 Oct 2025 11:21:24 +0000
Date: Fri, 10 Oct 2025 19:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-10 0/1] mm/page_alloc.c:191:1:
 sparse: sparse: symbol 'restrict_cma_redirect' was not declared. Should it
 be static?
Message-ID: <202510101950.NuvvZ2QK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-10
head:   15458de798dc537e17aff3b97214cec56abd9418
commit: 50c9052328749b2f96f994fc83e0bfd5c2cacf19 [0/1] ANDROID: fix !CONFIG_CMA build
config: i386-randconfig-061-20251010 (https://download.01.org/0day-ci/archive/20251010/202510101950.NuvvZ2QK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101950.NuvvZ2QK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101950.NuvvZ2QK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/page_alloc.c:191:1: sparse: sparse: symbol 'restrict_cma_redirect' was not declared. Should it be static?
   mm/page_alloc.c:2530:9: sparse: sparse: context imbalance in 'free_unref_page' - different lock contexts for basic block
   mm/page_alloc.c:2617:17: sparse: sparse: context imbalance in 'free_unref_page_list' - unexpected unlock
   mm/page_alloc.c:2847:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:4523:9: sparse: sparse: context imbalance in '__alloc_pages_bulk' - different lock contexts for basic block

vim +/restrict_cma_redirect +191 mm/page_alloc.c

4518085e127dff Kemi Wang   2017-11-15  180  
1c8aebe4c072bf Heesub Shin 2024-02-12  181  /*
1c8aebe4c072bf Heesub Shin 2024-02-12  182   * By default, when restrict_cma_redirect is false, all movable allocations
1c8aebe4c072bf Heesub Shin 2024-02-12  183   * are eligible for redirection to CMA region (i.e movable allocations are
1c8aebe4c072bf Heesub Shin 2024-02-12  184   * not restricted from CMA region), when there is sufficient space there.
1c8aebe4c072bf Heesub Shin 2024-02-12  185   * (see __rmqueue()).
1c8aebe4c072bf Heesub Shin 2024-02-12  186   *
1c8aebe4c072bf Heesub Shin 2024-02-12  187   * If restrict_cma_redirect is set to true, only MOVABLE allocations marked
1c8aebe4c072bf Heesub Shin 2024-02-12  188   * __GFP_CMA are eligible to be redirected to CMA region. These allocations
1c8aebe4c072bf Heesub Shin 2024-02-12  189   * are redirected if *any* free space is available in the CMA region.
1c8aebe4c072bf Heesub Shin 2024-02-12  190   */
1c8aebe4c072bf Heesub Shin 2024-02-12 @191  DEFINE_STATIC_KEY_FALSE(restrict_cma_redirect);
1c8aebe4c072bf Heesub Shin 2024-02-12  192  

:::::: The code at line 191 was first introduced by commit
:::::: 1c8aebe4c072bf18409cc78fc84407e24a437302 ANDROID: cma: redirect page allocation to CMA

:::::: TO: Heesub Shin <heesub.shin@samsung.com>
:::::: CC: Carlos Llamas <cmllamas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
