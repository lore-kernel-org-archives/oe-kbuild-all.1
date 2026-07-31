Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC1230C158
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 09:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489686; cv=none; b=UG5Lx+b0Up8D1IHlR34w2T5GCKY8y7HRx+uWtSkjC74xJgvf5kAoRrM+YQ1U8zKm8/4FPaVFsNqwQCAqPAb6CXPmhXB9MJvTWqwKZytXklV0/z4QiqD3plODRbzebaSzv+aftPXkS0sqXCURhRe0JBsE+7detGAW8kejgcVrjK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489686; c=relaxed/simple;
	bh=Nb1QcRDly/lPGzcjYyuI6KUrRV0w5iUw2fFLSqEQIR4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pNfqwsN/gnX/PXS8ld1//flS7U+klzX47U21NB0/dHypaL64ivF6WKA0DRsQDU7eW+a4ySp9XV9oLEq3ADh4THK92P9p4FdP3zu7yGg9O4FmM+o5f5xQsR2LDCwGc+3uJIdJg+YA4m2UY4UncF9PVr/bt8V9W7048OPHZ2kd/bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jv6WKpMT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jv6WKpMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785489684; x=1817025684;
  h=date:from:to:cc:subject:message-id;
  bh=Nb1QcRDly/lPGzcjYyuI6KUrRV0w5iUw2fFLSqEQIR4=;
  b=Jv6WKpMTjn/BHme6xmvSJg+Yl2MQ3uQ5OT0C35jQlKbSdHu2gdYclQnx
   9UovEFy8XgycALeFkK6IPzFX+Bb3d7mx2gxsHRAsVjicAReU791SElIu5
   ItqBa/rY+RZQnyDSmokiSqMQU+58jVk8FjA3KEPqzXCP+B+VuQu2t+LPp
   3aD07yT2ML8G4ZmjHz7zPCaQL0IsttluzXSLCM+LfaC5+DO7QHx8vf8jl
   9BPbXdJJsznaA0obl0x229NnIuUTC4ZmQ4I2gUHX10kPO6Kx4ClWyFvwH
   /Pt34dtyz7PHk+rUpRCnp4bNLzG2AsPn4J6HtML4hH5O6cb9s7FEbd/yi
   g==;
X-CSE-ConnectionGUID: P38gobyRTOqUEl4NUGtkug==
X-CSE-MsgGUID: 4jpmWVJTTOyO6pSymrhK1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="97629150"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="97629150"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 02:21:24 -0700
X-CSE-ConnectionGUID: d6osuJdUT6uzm/XXIfZYCA==
X-CSE-MsgGUID: w/zEcsweRtq2+yth6oUQoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="264348242"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Jul 2026 02:21:23 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpjQe-000000000Qj-2Hye;
	Fri, 31 Jul 2026 09:21:20 +0000
Date: Fri, 31 Jul 2026 17:20:51 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/node_features_v6
 18/37] mm/gup.c:2418:21: error: implicit declaration of function
 'folio_longterm_pin_forbidden'
Message-ID: <202607311759.lyVHf7cr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/node_features_v6
head:   2a91be748ebcfd653985fa1c6c41371d45953e93
commit: b44aca34818ebf7e2ef962e85b23c05bb7882c05 [18/37] mm: add N_MEMORY_LTPIN node state for longterm-pin eligible nodes
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260731/202607311759.lyVHf7cr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311759.lyVHf7cr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311759.lyVHf7cr-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/gup.c: In function 'pofs_has_ltpin_forbidden':
>> mm/gup.c:2418:21: error: implicit declaration of function 'folio_longterm_pin_forbidden' [-Wimplicit-function-declaration]
    2418 |                 if (folio_longterm_pin_forbidden(folio))
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/folio_longterm_pin_forbidden +2418 mm/gup.c

  2409	
  2410	/* True if any folio sits on a node that doesn't support longterm pinning */
  2411	static bool pofs_has_ltpin_forbidden(struct pages_or_folios *pofs)
  2412	{
  2413		struct folio *folio;
  2414		long i = 0;
  2415	
  2416		for (folio = pofs_get_folio(pofs, i); folio;
  2417		     folio = pofs_next_folio(folio, pofs, &i)) {
> 2418			if (folio_longterm_pin_forbidden(folio))
  2419				return true;
  2420		}
  2421		return false;
  2422	}
  2423	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
