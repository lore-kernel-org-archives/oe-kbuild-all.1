Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072E2F507
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Aug 2024 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723902644; cv=none; b=elx8Yi/MXE0k8VKwYpnox+QFPlplT+eqnd/yisZ99cJxHBmJaf96hPl09O8LOLvDTjjYb0yWmJsjjPXbh3vsopeRThywhRQoXX4o4L2ifamql9SRGAAcu/icLyzEQ/r+DwUIZQeLXRTMPeDXXuyW6SiNbxe90HK1OkIqIMKbCEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723902644; c=relaxed/simple;
	bh=Qn3h6SepPOorMuu2++BE8AqD/QBbNJEkrknC9J6FRb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oo6e1CaR0KEEKOjQR3eRHaE9v3o2V37DFuCTQkZsES6QC1NBkG4uvpXJWL/OPKATx0ncNfdaH7A5Xo68YH8jer4WZ1RVnjw/SFg2IxeT1dWdTEaV3OzjNldaY0s1PzasYF+fg2yPgcIZgj9JFInDcGF+4WzrSP1erCuLKnWvtnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=StI+BxNi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="StI+BxNi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723902642; x=1755438642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qn3h6SepPOorMuu2++BE8AqD/QBbNJEkrknC9J6FRb0=;
  b=StI+BxNi+yIXy0XJn6qJJII24xUFEnu1Hz8nocMirA/z4XpOpUYtrWeH
   BZ676FlpKivP8x8edbzVtctKzNlFPhHyjauMvoCZy+PapA3HQ18oPn93U
   VZo2wBH4OK0ymTUfwQnqu+3SUSHEqcCwtf+WkLhas1D0ISVhkV3ApeoUQ
   JGw9aKH9ye1Z0iM7Xl7KxGa8//Zcw1x/cEJe0cbfbc40wx19btt1Im8MV
   v23UAPwHKg1NsPn+AIvR+NKbcF9EBITkZIi3Fqse0+c+Aq1fZ53Cw+kFa
   lYxcb9U/dGd6GCeicCewT+PvV0g6nONI+fLVoeYYbVf+VaEk/84Y5Oytk
   g==;
X-CSE-ConnectionGUID: ps5yfWnQQeGOpd7W+bjeOw==
X-CSE-MsgGUID: FuY84NulRQiyQUqB+d+AyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="47587189"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="47587189"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 06:50:41 -0700
X-CSE-ConnectionGUID: ovLN7VEvSvaMZuPVIDUCRQ==
X-CSE-MsgGUID: h/EC8Uf4RnmOn5b+40HVfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="59782018"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Aug 2024 06:50:41 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfJpG-0007Ws-0i;
	Sat, 17 Aug 2024 13:50:38 +0000
Date: Sat, 17 Aug 2024 21:49:53 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:mm_id 12/12] fs/proc/task_mmu.c:33:13: warning:
 '__folio_page_mapped_exclusively' defined but not used
Message-ID: <202408172132.SijuIYe2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux mm_id
head:   3d79f5b8dd7c22fa4d00ea6de3e5d3517482dee4
commit: 3d79f5b8dd7c22fa4d00ea6de3e5d3517482dee4 [12/12] page_mapcount
config: i386-buildonly-randconfig-004-20240817 (https://download.01.org/0day-ci/archive/20240817/202408172132.SijuIYe2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408172132.SijuIYe2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408172132.SijuIYe2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/task_mmu.c:33:13: warning: '__folio_page_mapped_exclusively' defined but not used [-Wunused-function]
      33 | static bool __folio_page_mapped_exclusively(struct folio *folio, struct page *page)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__folio_page_mapped_exclusively +33 fs/proc/task_mmu.c

    31	
    32	#ifdef CONFIG_PAGE_MAPCOUNT
  > 33	static bool __folio_page_mapped_exclusively(struct folio *folio, struct page *page)
    34	{
    35		return folio_precise_page_mapcount(folio, page) == 1;
    36	}
    37	#else /* !CONFIG_PAGE_MAPCOUNT */
    38	static bool __folio_page_mapped_exclusively(struct folio *folio, struct page *page)
    39	{
    40		return !folio_likely_mapped_shared(folio);
    41	}
    42	#endif /* CONFIG_PAGE_MAPCOUNT */
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
