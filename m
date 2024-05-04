Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2737A8289C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 20:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714853450; cv=none; b=IH0WTVPE99/HEpnt+YPZE4Q7MY+S2BibkBKI/53fxvPOGDax6/JuktVXrT4M4VL3uAyCw/CFuQXgSfSf38P/lSWSo4kM0TJpMqNUJQZhzGzBYMsbniPNVLUORkmATpG3hZM0KmHCOrA2a/0YpJ4TPq0roVSj+9Xi8/ay10m2RPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714853450; c=relaxed/simple;
	bh=sGdk/hIFtXSsMX5zhVTUNQA1QLL1kwKeQxKRdE6x/Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ASoCuPqq3EjjDcUlQtBmLCDKFZGNsitmL29fH6UhL6se+0kUntX5VIOu7QcBSXV6mDAuW0Qv0GQLfaLCwopSlGsU/eVp9fi74me0JTilNcyMehkC60gGMK1TnxM6PzuK3mRrKhWpJdTsjg4kiYK1rmrl0K8qzGhNZndO4CU9IK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0YqhQYA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0YqhQYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714853449; x=1746389449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sGdk/hIFtXSsMX5zhVTUNQA1QLL1kwKeQxKRdE6x/Qo=;
  b=a0YqhQYAiI1LEmXn3O6u3W6szwWPz6SGcV3FB1/XcgMKGGrKtx+IJRrU
   HHx+AMueex9k6qr7szkWxEISMzZ4QGIHcrPS1KzjQnjDhieBBHZ+qgeGY
   CbAYfVlrj1aze9yb3eFzzQsVuzhD1KrrIavs3Fuyg155VXk1jOgZ/grGD
   gTjyLivKFyC/OOoCNFQPOKNrPRbrzZWtwdAa8ueg4wIdBhqIo6ldmr8VJ
   /9yzRO+1aV2H6a0zRrVUVVhzj9LAky9AizVEkW7xQeW2Cdyq1VHXlJKCR
   v7x6ozXsxzAlTVLwNBM2C1TfolsevkISNFLGhUs+JJim2vryUHRz+c3MK
   g==;
X-CSE-ConnectionGUID: aORDO+L3T+2YIgmomzO1Eg==
X-CSE-MsgGUID: MaNYFVjRS3yKP42PGsqBgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10801088"
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="10801088"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 13:10:48 -0700
X-CSE-ConnectionGUID: DxU01WuuTLa/aPn4R/CqjQ==
X-CSE-MsgGUID: mdxrEgayQf6iGD/vz5UJEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="28348931"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 May 2024 13:10:47 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3LiX-000D92-08;
	Sat, 04 May 2024 20:10:45 +0000
Date: Sun, 5 May 2024 04:09:59 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm-ppc@vger.kernel.org
Subject: [agraf-2.6:kvm-kho-gmem-test 2/27] mm/memblock.c:2196:61: error:
 'MIGRATE_CMA' undeclared; did you mean 'MIGRATE_SYNC'?
Message-ID: <202405050442.pqgxGsYG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/agraf/linux-2.6.git kvm-kho-gmem-test
head:   9a58862a298a63bad21d05191e28b857063bb9dc
commit: 81ee2fbdd7aa2d3bdbef8e22556cef1e9bfb99c0 [2/27] memblock: Declare scratch memory as CMA
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240505/202405050442.pqgxGsYG-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405050442.pqgxGsYG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405050442.pqgxGsYG-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memblock.c: In function 'mark_phys_as_cma':
>> mm/memblock.c:2196:61: error: 'MIGRATE_CMA' undeclared (first use in this function); did you mean 'MIGRATE_SYNC'?
    2196 |                 set_pageblock_migratetype(pfn_to_page(pfn), MIGRATE_CMA);
         |                                                             ^~~~~~~~~~~
         |                                                             MIGRATE_SYNC
   mm/memblock.c:2196:61: note: each undeclared identifier is reported only once for each function it appears in


vim +2196 mm/memblock.c

  2188	
  2189	static void mark_phys_as_cma(phys_addr_t start, phys_addr_t end)
  2190	{
  2191		ulong start_pfn = pageblock_start_pfn(PFN_DOWN(start));
  2192		ulong end_pfn = pageblock_align(PFN_UP(end));
  2193		ulong pfn;
  2194	
  2195		for (pfn = start_pfn; pfn < end_pfn; pfn += pageblock_nr_pages)
> 2196			set_pageblock_migratetype(pfn_to_page(pfn), MIGRATE_CMA);
  2197	}
  2198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
