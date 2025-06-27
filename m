Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5444B1DF980
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 10:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019407; cv=none; b=Pc+JifB4o5MuB83bAOMn4jbgOyilPSD6JNLLvnUxXX3cMbNSE5Uns9EmKBZHrSSueW1/uNLYfNKuehpDwYMADNIwXxcRpR9n8md6C62x/BRpyYjOc7g5cli1r9n2Ug5jqKHMwnABAeeTf0EUEzeEYn00iycjrh9QFSf5LHb9qeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019407; c=relaxed/simple;
	bh=J7yxUB5mS6G3gXQpt9j1RQHNumqJYn2BfwC2MoJPnBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q+pe1U8RCuMq1Cp4wOJzkUvEzP0vzXAIVtmH9M6Cgzc/0tbJn5ICpyYP9og5myun230V+4nr5rQjF7MgLg/jGR5rOVIJW1ZLBCH6Ah9ar89/5nJG5mGpEgvnOHyx4xBGbq9Hyx7FfMsmSyO/A/wJU28kSm8DAkKvBhD3NFcy0W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MDAPcghW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MDAPcghW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751019405; x=1782555405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J7yxUB5mS6G3gXQpt9j1RQHNumqJYn2BfwC2MoJPnBg=;
  b=MDAPcghWMY7lOKVIO70ppH7B1S5qtXUUuKjpskdBvDfiNq7dLAFAtlVn
   BUM6Zt9w3m/xL3A22htFEVIAWEvpS9Vw560LKO4M3Alt1aJHD26C3eAjR
   ucHZRGdc4yQ9XgZ/S5Mc4Vr72Rp2q5a2Tjor4XHSf574nVeylh9aNB+vX
   lczUrXw65DXn+ea1miXakNx7+yyPr6iArsN2UUOy9ETIzWX+DfrA+bW7P
   DD0VwW/p/45q1Dixr1IdINVNi10318k70tOJZICuPP+eqFpd74NsHdb0p
   y8eRthfHYevnabLxPYnFDvhONoozOg0hOJhHwoisn43zopqLbrSvF80jP
   A==;
X-CSE-ConnectionGUID: UrPBcRSLQMKMVhqWI+I67Q==
X-CSE-MsgGUID: SXsbQOXDRr+ms4KnJg6aYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="63587287"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="63587287"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 03:16:44 -0700
X-CSE-ConnectionGUID: ciLfsJ9fQDeKYYPlP7p2WQ==
X-CSE-MsgGUID: xMb+99V8S46Ft+9CQi74kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="152293001"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Jun 2025 03:16:43 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV68P-000W3y-1l;
	Fri, 27 Jun 2025 10:16:41 +0000
Date: Fri, 27 Jun 2025 18:16:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-12 2/2] mm/page_alloc.c:191:1:
 sparse: sparse: symbol 'restrict_cma_redirect' was not declared. Should it
 be static?
Message-ID: <202506271813.yFPBWR4E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-12
head:   d33dd6975897a0d6d405b6dd0adfe215e9ae889a
commit: 50c9052328749b2f96f994fc83e0bfd5c2cacf19 [2/2] ANDROID: fix !CONFIG_CMA build
config: i386-randconfig-r122-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271813.yFPBWR4E-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271813.yFPBWR4E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271813.yFPBWR4E-lkp@intel.com/

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
