Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2B31DF756
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 12:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739967259; cv=none; b=UGqK73u6kj3feRZbLgCzYZnL80P9lEY0aqG5wu6uydZRPl8A/FkC4NyJqBL8StqBJ8CGD3S2UrSkEifKqtLTySrLqF3cmgZbPe8P668fA3HBaRgn8ehTsFD4cyb6QmUAhtjTuyTECHMfbHMM1olu+OP1iCegZIfYEF3i4aAuLDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739967259; c=relaxed/simple;
	bh=wl6Bc0MSKvM2pumVwK7SnU0KWK2F9M71PUXlz3Pf4Fc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ELtkdsM43sMbutfMVyATyt2SQ2A14OTXRTUEcH8XLsY5pUWu8X7PCjAOjKSuclANy9sE92QixQjiuVIX/fKFe+J6sUdfNFyerYKpKxDiDzYOT+tjuB4Cqd80+7Uq4tsjXtdEvnNzb/EPJ+p6NYr1w4uHTRnsAp3q9M36eZaD6Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLgb+LEm; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLgb+LEm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739967258; x=1771503258;
  h=date:from:cc:subject:message-id:mime-version;
  bh=wl6Bc0MSKvM2pumVwK7SnU0KWK2F9M71PUXlz3Pf4Fc=;
  b=cLgb+LEmhkRvU3baFCi5JpOTTEB9ULxFaoiBk+CVlscWYWVh+NU2xbi4
   xLjNNpsO73UZEZ79TaEPQ3D7rZYsGE8jmNph/yyAyw5RcQkmtPhLMO4uc
   ZJ3kKHIoWB8Vd6OEHGmDh1C66iqJEKKdZJastrCXUvdDkZ2tKy0ctoJJI
   DX1LkuF+ywIJRF1TOvquUlgkN16mDyQ09fdirqvk5pFCmi6vM6crOmTcn
   bwDmROLB9Ialu8ZHubDbJsn1cHKdz4I6MEphSrvdh06ZNeptgB7iyIt+Z
   aHy8wsSIIOHrKI03VXbzJcwj9bTI3DZqnXkcmSS/cvhocFAKpYh7udZZ0
   A==;
X-CSE-ConnectionGUID: OgbSow+KR0qR9WV2gUe2XA==
X-CSE-MsgGUID: L0LD5UI8RXqvanjJ/Xy82w==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40558117"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="40558117"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 04:14:17 -0800
X-CSE-ConnectionGUID: ZOHkW4qFQUSInYn1fFXRDQ==
X-CSE-MsgGUID: 0CgiWrMWSFKvXNx/azaxeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="114676143"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Feb 2025 04:14:16 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkixx-0002u3-2I
	for oe-kbuild-all@lists.linux.dev;
	Wed, 19 Feb 2025 12:14:13 +0000
Date: Wed, 19 Feb 2025 20:13:37 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/59 1/1] drivers/misc/lkdtm_bugs.c:218:25: warning:
 variable 'byte' set but not used
Message-ID: <202502192005.4TD54Dbs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 7b25a85c9d9f796c5be7ad3fb8b9553d3e2ed958 [1/1] lkdtm: Test VMAP_STACK allocates leading/trailing guard pages
config: sh-randconfig-001-20250218 (https://download.01.org/0day-ci/archive/20250219/202502192005.4TD54Dbs-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502192005.4TD54Dbs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502192005.4TD54Dbs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/lkdtm_bugs.c: In function 'lkdtm_STACK_GUARD_PAGE_LEADING':
>> drivers/misc/lkdtm_bugs.c:218:25: warning: variable 'byte' set but not used [-Wunused-but-set-variable]
     volatile unsigned char byte;
                            ^~~~
   drivers/misc/lkdtm_bugs.c: In function 'lkdtm_STACK_GUARD_PAGE_TRAILING':
   drivers/misc/lkdtm_bugs.c:232:25: warning: variable 'byte' set but not used [-Wunused-but-set-variable]
     volatile unsigned char byte;
                            ^~~~


vim +/byte +218 drivers/misc/lkdtm_bugs.c

   212	
   213	/* Test that VMAP_STACK is actually allocating with a leading guard page */
   214	void lkdtm_STACK_GUARD_PAGE_LEADING(void)
   215	{
   216		const unsigned char *stack = task_stack_page(current);
   217		const unsigned char *ptr = stack - 1;
 > 218		volatile unsigned char byte;
   219	
   220		pr_info("attempting bad read from page below current stack\n");
   221	
   222		byte = *ptr;
   223	
   224		pr_err("FAIL: accessed page before stack!\n");
   225	}
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
