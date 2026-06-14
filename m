Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBAE37CD28
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 22:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781477681; cv=none; b=YxHrNn2vUfh+nlEpXxUKY6OiMZQuSrnqqoOBVljNDTPNWLWU4oJF38vBD9TCguwp5ItCOrIKsIYmu0UavsO1l46eVKXVxLB3VszxB0fS1iChdfe9U7FJRXPktsFeQ1RwdwTqF9c4AJSTidbQqqkTMyHMXBaZrrR7ccLWJCurke0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781477681; c=relaxed/simple;
	bh=KEN0yfMnEIBD2DZ9zkQITrnSrcPTOUM6GIDZE4k24V4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A1ado/sOXfRg/ICIhT6WO3Q4mTag69YWPywC8D1CMUqwgqddegvrGMhLnNolSIm+sZ6Qv1eUIOkNMyIJEy6L0MMFuFAwbgRSAJGITyKkzPE7vlS/zGoVHzG1fe5+4BkVlLj1lRRUOctkh5skPU8gnwOGdkEvevWfhqKmjzctJBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJbBhT8s; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJbBhT8s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781477679; x=1813013679;
  h=date:from:to:cc:subject:message-id;
  bh=KEN0yfMnEIBD2DZ9zkQITrnSrcPTOUM6GIDZE4k24V4=;
  b=gJbBhT8sALwtGft+BKp6oD3rrbH5TUwApHpz88APTK9GXsFrZEEglhZr
   ivFqSHOa96xu6Z9eYbjSg6FQ2j28WnowG0YhhlAUUYJbAt0S8CXrb43lE
   w4fbGPsH+llyH6/cTv4kc0jP+pY7L8J592jTZdGNBnpSKuQllQQQ2umHi
   2+53kXMhpvPYJa9ZnaFUxevEo/EMbPyqG1lntfoU0gPt9n2/hDUajg7A9
   uOmplvXpftnaQ4eqAg9uhdjpxnfyPHp/9zg3g2fpg3hQgBbgLONW4yfUM
   JVr3oiHAzlgGLPYT5TUNifGc6/JjDG9G179VZ2ajFVaWoa7HH8AhlFcH0
   w==;
X-CSE-ConnectionGUID: vOlA3KRHQtCbYIuSrDsyvA==
X-CSE-MsgGUID: NHpIsTD2R3u0tOX66v2NGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82255106"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="82255106"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 15:54:39 -0700
X-CSE-ConnectionGUID: cYfnxKLmRgebj+MWSW//Ww==
X-CSE-MsgGUID: rfDUfTwWTXS0n/NbVYvOsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="251586440"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 14 Jun 2026 15:54:37 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYtit-000000004lx-0MPm;
	Sun, 14 Jun 2026 22:54:35 +0000
Date: Mon, 15 Jun 2026 00:54:26 +0200
From: kernel test robot <lkp@intel.com>
To: Ronan Marchal <ronanmarchal29@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: kernel/power/snapshot.c:2042:2: error: expected ';' before
 'static'
Message-ID: <202606150001.iZVIYm4s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ronan-Marchal/kernel-power-snapshot-Add-missing-kernel-doc-parameter-descriptions/20260614-224612
head:   3640842137db0e04106ba490ff1d1d6715de9a2b
commit: 3640842137db0e04106ba490ff1d1d6715de9a2b kernel/power/snapshot: Add missing kernel-doc parameter descriptions
date:   8 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260615/202606150001.iZVIYm4s-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150001.iZVIYm4s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150001.iZVIYm4s-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/power/snapshot.c:2042:2: error: expected ';' before 'static'
    2042 | c/**
         |  ^
         |  ;
   ......
    2050 | static int enough_free_mem(unsigned int nr_pages, unsigned int nr_highmem)
         | ~~~~~~


vim +2042 kernel/power/snapshot.c

  2041	
> 2042	c/**
  2043	 * enough_free_mem - Check if there is enough free memory for the image.
  2044	 * @nr_pages: Number of non-highmem pages to copy.
  2045	 * @nr_highmem: Number of highmem pages to copy.
  2046	 *
  2047	 * Check if there are enough free non-highmem pages available to save
  2048	 * the hibernation image.
  2049	 */
  2050	static int enough_free_mem(unsigned int nr_pages, unsigned int nr_highmem)
  2051	{
  2052		struct zone *zone;
  2053		unsigned int free = alloc_normal;
  2054	
  2055		for_each_populated_zone(zone)
  2056			if (!is_highmem(zone))
  2057				free += zone_page_state(zone, NR_FREE_PAGES);
  2058	
  2059		nr_pages += count_pages_for_highmem(nr_highmem);
  2060		pr_debug("Normal pages needed: %u + %u, available pages: %u\n",
  2061			 nr_pages, PAGES_FOR_IO, free);
  2062	
  2063		return free > nr_pages + PAGES_FOR_IO;
  2064	}
  2065	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
