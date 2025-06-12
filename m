Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932F12E1723
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 23:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749772095; cv=none; b=MHr2cyWyr+3nhH3BBIW0CU3XHtkMaLcZw0cpfKhEc4wae4JnIb/bctJ0O+yLoz/a3x2KxeJ7+RfHc3N6QrKSz73TRvwMvTYI/NcHuhQOxEHPQhFk7MaxWaT01+2+qHarlJnW6Khm+cWhn0MkewpxSOevx43nil/mFLjldmVvUQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749772095; c=relaxed/simple;
	bh=KUX9l8VWrXjmpPz/FwupoI5o6Lant+Mgykmp40HBbpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QuPzq5mB8a224DrNSDLo3YLb+GUy9KOIxe+m16O9tqTEk4jhfMAVVWUDETfzrL0368Yvy5kYrgHe9cWe3gFotqb0wHiZb2alufwYKKKe+PbnepsoYG1JaDewp2sl/0n9itHmVfAjsB7XFHjW8a5Qx9PY38NEh8JW4S2y9aKLxiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvJUgdd/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvJUgdd/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749772094; x=1781308094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KUX9l8VWrXjmpPz/FwupoI5o6Lant+Mgykmp40HBbpE=;
  b=JvJUgdd/2dr3cwPagacL6kW5QOZFfJoY31EC4YX7eoxpNNnaPy9jj21R
   Cc9y3uRs2QhNme2y5x1xHp3260BWUaxnaDehSaFGCV5cEFvHL6sns5oQB
   qEJb8gLouijh3QehQ+A59BGyu8yLxT6Ggh7pBjD2X9w+dvvKRCCRsFabV
   J8op+geuYdInsOLoj/140idIybds+wrr7Tu1m7xnGYB9+uGo8k6FzrBLf
   NywzA3fcB2/cn90nhZMXtBLSJudvy/gKotnmDCphfLvE2ker9mCD3xzLf
   Z3aj/T07itd+fk/vk30DSovY0JCQ8E1O39b1SQt8ogqqjahK80qslOZSi
   A==;
X-CSE-ConnectionGUID: tyQpnryPSFqwhhofEpl+ag==
X-CSE-MsgGUID: tbF2y6VCQLyGmriBEk4KIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51691297"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="51691297"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 16:48:14 -0700
X-CSE-ConnectionGUID: ZudGs++7TQOTvWHMcGUi9Q==
X-CSE-MsgGUID: 4Hcmdhw/RKGPUeyjMtLBew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="170848381"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jun 2025 16:48:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPreT-000C2Q-2U;
	Thu, 12 Jun 2025 23:48:09 +0000
Date: Fri, 13 Jun 2025 07:47:19 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:testme 7/9] arch/x86/mm/tlb.c:311:53: error:
 'MAX_GLOBAL_ASID' undeclared; did you mean 'NR_GLOBAL_ASIDS'?
Message-ID: <202506130715.wK1WG6vG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git testme
head:   733c4f3de1b68afd5fad839dbcd1806a3d29e1e0
commit: bb1b4a810e5639c9d98aabc03375eeb1d8a88b57 [7/9] NR_GLOBAL_ASIDS
config: x86_64-buildonly-randconfig-004-20250613 (https://download.01.org/0day-ci/archive/20250613/202506130715.wK1WG6vG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506130715.wK1WG6vG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506130715.wK1WG6vG-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/mm/tlb.c: In function 'allocate_global_asid':
>> arch/x86/mm/tlb.c:311:53: error: 'MAX_GLOBAL_ASID' undeclared (first use in this function); did you mean 'NR_GLOBAL_ASIDS'?
     311 |         asid = find_next_zero_bit(global_asid_used, MAX_GLOBAL_ASID, last_global_asid);
         |                                                     ^~~~~~~~~~~~~~~
         |                                                     NR_GLOBAL_ASIDS
   arch/x86/mm/tlb.c:311:53: note: each undeclared identifier is reported only once for each function it appears in


vim +311 arch/x86/mm/tlb.c

   300	
   301	static u16 allocate_global_asid(void)
   302	{
   303		u16 asid;
   304	
   305		lockdep_assert_held(&global_asid_lock);
   306	
   307		/* The previous allocation hit the edge of available address space */
   308		if (last_global_asid >= HIGHEST_GLOBAL_ASID)
   309			reset_global_asid_space();
   310	
 > 311		asid = find_next_zero_bit(global_asid_used, MAX_GLOBAL_ASID, last_global_asid);
   312	
   313		if (asid >= MAX_GLOBAL_ASID & !global_asid_available) {
   314			/* This should never happen. */
   315			VM_WARN_ONCE(1, "Unable to allocate global ASID despite %d available\n",
   316					global_asid_available);
   317			return 0;
   318		}
   319	
   320		/* Claim this global ASID. */
   321		__set_bit(asid, global_asid_used);
   322		last_global_asid = asid;
   323		global_asid_available--;
   324		return asid;
   325	}
   326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
