Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498204A2D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Sep 2025 23:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758237678; cv=none; b=m1bSk5sVytxsn8wNmvLxeOMRQedq0IoT4phTSvUtmythRvC71dQUWx+ix2AmrTlt3yb8SwXGKy63vbWrt1OLnHxPzlYv4SZ1WQFzWgNw9VTD911ezCdUg5u/F26a7wE2KGgKx453k3Avg+XY9WX7XjGLvxheeiMl/d2LZLoTHaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758237678; c=relaxed/simple;
	bh=Yp4ZJmEEIgkwBZSVoQchOj96/ngDTJYkov2UFF4xPl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QPcr89x0L/e1b6rU8wrfRjJX7xt+N8giPgmdnLXWAoWZtM27I5kssM+hmkEvmOPBfiGuCBLnFatYPTFWTnccH7WCNDO1iXXrLKs+800eHajRtMx73tpGOsJOu2QvQRPSCgvlgQlLcfPqAnUuGo6F3/L2jgLETxBoOHHUaZ/OonU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z5/Gir9x; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z5/Gir9x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758237676; x=1789773676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yp4ZJmEEIgkwBZSVoQchOj96/ngDTJYkov2UFF4xPl0=;
  b=Z5/Gir9xDO4FLat19/5298hplkqpHhRbtMEpav4dWNL+t4zSb2jCA6f4
   YvRad8tS2kJ141EqRfE6cGlPswQc6dLRuGi45sZgeoxRhqYioPUTPyphV
   CWd5n9xQxgrmi4VLVHfm2B0ZnOW7pcj6EXHp9u4e9i0be2crPovpGAior
   vBA1hObAMBVv46LAFSBn2rboBcaO325WdkQ/1gavllibIabcFURT7L931
   1RuiTrRvQhUYceMioMdR/n+2Tzk43yqc+OtJON09BhHjrzdBLJWzJK9wz
   7rsdkIXF8aYSpWBvHE9Ap2dGDhst3nKBqPBjUm6T1hwNjymBKWE8FKcYi
   Q==;
X-CSE-ConnectionGUID: iMMFfkt5R0uD1CvUECWufQ==
X-CSE-MsgGUID: 6j+6bBxvQsqUV3H0hprVUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64387759"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64387759"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 16:21:16 -0700
X-CSE-ConnectionGUID: lfsXJC7RSku0ngq4eLHjzw==
X-CSE-MsgGUID: aq/q+AzyRyapBhWcQLo3Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="179952937"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Sep 2025 16:21:14 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzNw8-0003ot-01;
	Thu, 18 Sep 2025 23:21:12 +0000
Date: Fri, 19 Sep 2025 07:20:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Subject: [rppt:kho/vmalloc/v5 3/4] kernel/kexec_handover.c:288:14: warning:
 no previous prototype for 'kho_restore_pages'
Message-ID: <202509190738.rjRZy4Cs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git kho/vmalloc/v5
head:   b7563dcdc9ebcdb17a5fb038c8e6ca2c004370b0
commit: 435d4abbd1a981777f508bf46a3a162bb6b26d84 [3/4] kho: add support for preserving vmalloc allocations
config: x86_64-buildonly-randconfig-003-20250919 (https://download.01.org/0day-ci/archive/20250919/202509190738.rjRZy4Cs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509190738.rjRZy4Cs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509190738.rjRZy4Cs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/kexec_handover.c:288:14: warning: no previous prototype for 'kho_restore_pages' [-Wmissing-prototypes]
     288 | struct page *kho_restore_pages(phys_addr_t phys, unsigned int nr_pages)
         |              ^~~~~~~~~~~~~~~~~


vim +/kho_restore_pages +288 kernel/kexec_handover.c

   277	
   278	/**
   279	 * kho_restore_pages - restore list of contiguous order 0 pages.
   280	 * @phys: physical address of the first page.
   281	 * @nr_pages: number of pages.
   282	 *
   283	 * Restore a contiguous list of order 0 pages that was preserved with
   284	 * kho_preserve_pages().
   285	 *
   286	 * Return: 0 on success, error code on failure
   287	 */
 > 288	struct page *kho_restore_pages(phys_addr_t phys, unsigned int nr_pages)
   289	{
   290		const unsigned long start_pfn = PHYS_PFN(phys);
   291		const unsigned long end_pfn = start_pfn + nr_pages;
   292		unsigned long pfn = start_pfn;
   293	
   294		while (pfn < end_pfn) {
   295			const unsigned int order =
   296				min(count_trailing_zeros(pfn), ilog2(end_pfn - pfn));
   297			struct page *page = kho_restore_page(PFN_PHYS(pfn));
   298	
   299			if (!page)
   300				return NULL;
   301			split_page(page, order);
   302			pfn += 1 << order;
   303		}
   304	
   305		return pfn_to_page(start_pfn);
   306	}
   307	EXPORT_SYMBOL_GPL(kho_restore_pages);
   308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
