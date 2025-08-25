Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547ED4F5E0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 15:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756134266; cv=none; b=iatvlrpBJN5VTqTbQrbTBnaxpMyZoyr1yBWGPC9/IxJNFczpcITMqG7XjBYnaZP/IZFuGMxIQlEb5L401QayIOAvpak6RBkOq5XXFp/466MMm4NwQshLF5M+71z4d7cD/D/QLMMNgRx9odbF7/jFTX2bk6iUR3jx9Q8QwimeY+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756134266; c=relaxed/simple;
	bh=TCyAMjd6GnVDrkAU/VAGiPdgi5sHy2TBXk6Z9+QJOmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dcG7fy0u6t3xARfktkt4foF2G/MFUrbT1LY8kL3FfDgnrKd2QS4WosRSn1WPF5CavkxKVIEgwGyReKMzTGW7kmQClkK5crJyVf0heGwTtYhFcDlzje1JLfgB4J3s6D0XOq/0+NFSMfNvHriyo6d4+klTPX3bs4QWrK4V0UHq42Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RucAGr1O; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RucAGr1O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756134263; x=1787670263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TCyAMjd6GnVDrkAU/VAGiPdgi5sHy2TBXk6Z9+QJOmY=;
  b=RucAGr1OkUmS7LnSvKeN57/Ok+Vfreuig1e3WlTLUgOQYrum2HQ98zc5
   y2cexpCqmMyfhTChkojfqPhIALdu8mAN4ibmKm1HPFzeg0EwDQU9cTBpf
   A9YPfuC0aeHGHA0kDurKMrsK5dTDoZX3YK4on6tqfVYFrDtPXoGd07bwZ
   AlhTDZ/nn1LGaFSkYEOWzftbv9qGAvkk+1qykzL/85l6d1O9U8sqJGs9c
   k3lFeh2vKlBaSqF39LOruRnbhHCPK5Z7kHySleBIACfTXzSJgQ1M+DKC4
   +x6HF9EjPp4xBjTGtRcXDyCSgVpuD85oZSGK71N+7SUy3ippr2eR4jh9p
   A==;
X-CSE-ConnectionGUID: 3p7pX4v8QV2iN57BS1r+rw==
X-CSE-MsgGUID: xdF301daRNWB/5DYhWowNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="61991930"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="61991930"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 08:04:23 -0700
X-CSE-ConnectionGUID: Qg6IRvE5QoO65tD8iKhTwg==
X-CSE-MsgGUID: XTcFU2+ZQg2ib3P/cnq4nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="169255270"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 25 Aug 2025 08:04:21 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqYk7-000Nn9-1H;
	Mon, 25 Aug 2025 15:04:19 +0000
Date: Mon, 25 Aug 2025 23:03:49 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-GNR-perf-uncore-ANBZ24140 0/2]
 mm/memory_hotplug.c:982:6: warning: no previous prototype for function
 '__adjust_present_page_count'
Message-ID: <202508252230.JgQLDkPC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yang,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-GNR-perf-uncore-ANBZ24140
head:   5b97140220e2f9196fa5de48f6be468691f8b43b
commit: 66756394812b1ce3d99fd553b8d496da6a755dce [0/2] anolis: mm/memory_hotplug: refactor adjust_present_page_count()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250825/202508252230.JgQLDkPC-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508252230.JgQLDkPC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508252230.JgQLDkPC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory_hotplug.c:982:6: warning: no previous prototype for function '__adjust_present_page_count' [-Wmissing-prototypes]
     982 | void __adjust_present_page_count(struct page *page, struct memory_group *group,
         |      ^
   mm/memory_hotplug.c:982:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     982 | void __adjust_present_page_count(struct page *page, struct memory_group *group,
         | ^
         | static 
   1 warning generated.


vim +/__adjust_present_page_count +982 mm/memory_hotplug.c

   981	
 > 982	void __adjust_present_page_count(struct page *page, struct memory_group *group,
   983				       long nr_pages, struct zone *zone, int phase)
   984	{
   985		const bool movable = zone_idx(zone) == ZONE_MOVABLE;
   986		unsigned long flags;
   987	
   988		if (phase == MHP_PHASE_DEFAULT || phase == MHP_PHASE_DEFERRED) {
   989			/*
   990			 * We only support onlining/offlining/adding/removing of complete
   991			 * memory blocks; therefore, either all is either early or hotplugged.
   992			 */
   993			if (early_section(__pfn_to_section(page_to_pfn(page))))
   994				zone->present_early_pages += nr_pages;
   995			zone->present_pages += nr_pages;
   996			pgdat_resize_lock(zone->zone_pgdat, &flags);
   997			zone->zone_pgdat->node_present_pages += nr_pages;
   998			pgdat_resize_unlock(zone->zone_pgdat, &flags);
   999		}
  1000	
  1001		if (phase == MHP_PHASE_DEFAULT || phase == MHP_PHASE_PREPARE) {
  1002			if (group && movable)
  1003				group->present_movable_pages += nr_pages;
  1004			else if (group && !movable)
  1005				group->present_kernel_pages += nr_pages;
  1006		}
  1007	}
  1008	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
