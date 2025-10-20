Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BC52AD22
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Oct 2025 20:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760990435; cv=none; b=leJ6kqdzQWsYM5HohKUxB1DzSPOk6I/rb5I1plKWCDtJs9u9pRrk165Cvep23dsGLB+75x2RWAa1GSckDJGfKTN3YAjtveRO8MQl0RbwbHMH/dCHsbVSJI4Yq/I0f70eN+1VPVzmihavKhhs897UV5BjWFh8kBQPl6D/GBpT3Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760990435; c=relaxed/simple;
	bh=VfhI1jeUJwsmM56w/jQwg96JXIzNYKpHkIgTwkv5kBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K4TCkgieq+1i6rR+v3Cf/xeMLrwKPawrNom+bniNdvb19LlxZxcygihe6eAvI30IFE3om9fbDpbJcy7v2L8+6OR3rZCRgqvK043WqXky9y6XJGXPTw8/cutlARM+6zb8ChfZtmHbn4ngmKsQTgD9GegmAeG4iG8m4owokUIlCwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYYBxiAp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYYBxiAp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760990433; x=1792526433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VfhI1jeUJwsmM56w/jQwg96JXIzNYKpHkIgTwkv5kBU=;
  b=ZYYBxiApRJsRcSRE05+y+77bQKsLEwdBqObFq4c2XfWxEDWjum4trjw9
   dJYPRViR1Fpe0CBQKXjyUeelORc32S4h958gOuVSoQte+3feVMZMg3eTs
   Se95zDz4nxsAm47LNg+lSc/6GjuSGO/AKXhvvutF63+Cu9jaWG6nB9Ayf
   FdNUdB/eI2EQq7RNJpjHcOwJEAWQojvdDReTNTkaEp2RYXHj2fThjpJgW
   57RK4xaCoY2EIJ+HT15Me4mhw/WTwflSZ4fwOiwCHPMSvCKhTkqM4cTfe
   OkpqLbjipUhIZnbJ6vyuMUuqqkX0zdsxsCZoafnh4NxPA2OxDYb70UcGg
   A==;
X-CSE-ConnectionGUID: 5Kg/2tZWTKyc2O6ImQ4zWQ==
X-CSE-MsgGUID: kIVgejl/RnyLDcfNMjppSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66752055"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="66752055"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 13:00:33 -0700
X-CSE-ConnectionGUID: uK9dsj5mTy2ic3BRKMRatg==
X-CSE-MsgGUID: EZnQpwl2SeWDarl30ZkKjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="182558750"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 20 Oct 2025 13:00:31 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAw3R-000A7V-0z;
	Mon, 20 Oct 2025 20:00:29 +0000
Date: Tue, 21 Oct 2025 03:59:54 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:movable_gigantic 4/4] mm/page_alloc.c:6998:30: error:
 'CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION' undeclared
Message-ID: <202510210310.5Rhu12Bf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux movable_gigantic
head:   cf3e52163565dce5fff0f9f15a92cbbd452fc470
commit: cf3e52163565dce5fff0f9f15a92cbbd452fc470 [4/4] page_alloc: allow migration of smaller hugepages during contig alloc.
config: csky-randconfig-001-20251021 (https://download.01.org/0day-ci/archive/20251021/202510210310.5Rhu12Bf-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210310.5Rhu12Bf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510210310.5Rhu12Bf-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page_alloc.c: In function 'pfn_range_valid_contig':
>> mm/page_alloc.c:6998:30: error: 'CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION' undeclared (first use in this function)
    6998 |                         if (!CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION ||
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:6998:30: note: each undeclared identifier is reported only once for each function it appears in


vim +/CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION +6998 mm/page_alloc.c

  6978	
  6979	static bool pfn_range_valid_contig(struct zone *z, unsigned long start_pfn,
  6980					   unsigned long nr_pages)
  6981	{
  6982		unsigned long i, end_pfn = start_pfn + nr_pages;
  6983		struct page *page;
  6984	
  6985		for (i = start_pfn; i < end_pfn; i++) {
  6986			page = pfn_to_online_page(i);
  6987			if (!page)
  6988				return false;
  6989	
  6990			if (page_zone(page) != z)
  6991				return false;
  6992	
  6993			if (PageReserved(page))
  6994				return false;
  6995	
  6996			if (PageHuge(page)) {
  6997				/* Don't consider moving same size/larger pages */
> 6998				if (!CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION ||
  6999				    ((1 << compound_order(page)) >= nr_pages))
  7000					return false;
  7001			}
  7002		}
  7003		return true;
  7004	}
  7005	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
