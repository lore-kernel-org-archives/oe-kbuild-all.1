Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887A1139D01
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 10:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713348130; cv=none; b=bPGGPIZXDw0Y5kLkfC8O6wyIIBhXwrQs/cDAvpbCFxhx40aVFCwQUV0ouG/vDZ53rcR4QfGXjbHOCoLXRTJurTNjLqqlqsHNCdc/Fg8g/M6XHBpXiLZEFeceFtKwDDMfQ1RmBLq4ZrLt2/B4BXTvkCUyDSIulKElGlp/vss8WRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713348130; c=relaxed/simple;
	bh=zEXz69KDbxzLQPos8x9p32DewEcR8dMUo33XRNBZzDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SEJa9lzKod1Y67jYaLM/11qIIfamW/5KF/2Cx+Wz4B4NKcbW07yIU1rMl5pX6fo/5gEJLSSMag0YCPcNbZFMIvFC2NZ+KnREVovZDsSIvgy4sFBotr0yyPxo4aJGlZKkEwazb3CQRHoMR52MUpWuXA2mJdzostkuHzTo7rTVFuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FGWvf6Vi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FGWvf6Vi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713348125; x=1744884125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zEXz69KDbxzLQPos8x9p32DewEcR8dMUo33XRNBZzDc=;
  b=FGWvf6VilQy1mfHpN8790h9un+aaaw0W7z37upmR9Vsn+rAtO3PNTnQw
   r83iPlbVzMIBCEqOfrYWCI4bCWQoRMYkCQZpzIMaB1m0MOyWBWc26cxmv
   JGaH/PaR2ISgAxl43E6Qz/SFSR0zI2iC4ZML7e0KzuSA3HivPp7IZ4361
   TjepcMBVvSFA5bXsnKtag/7ZZtnhO7rjUuDHEXhX6xgkPxHrRcpTPeWPG
   /20iCf2h+hSemf+Vthr9Aawn1yoUDbUhYNlhJP+W/JO+gPwsPAyrWxC/m
   4XEsIpTm+wueyJQNhpxksl8PBy0p7xlm2MY62/Mvvp9ldapcr+893jGeV
   w==;
X-CSE-ConnectionGUID: nKcYen4DQEqgXiJDcKqhgQ==
X-CSE-MsgGUID: p0sJ2xkgShuVWjXnRQXOGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8991419"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="8991419"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 03:02:03 -0700
X-CSE-ConnectionGUID: RnrZWO91QFO6elnvFuwNqg==
X-CSE-MsgGUID: YWfEKCCUTp28/F1dgOUmwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="23171170"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 17 Apr 2024 03:02:02 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx275-0006SU-11;
	Wed, 17 Apr 2024 10:01:59 +0000
Date: Wed, 17 Apr 2024 18:01:49 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 6398/6705] mm/page_table_check.c:194:1: warning:
 control reaches end of non-void function
Message-ID: <202404171745.Zd13ydca-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4eab358930711bbeb85bf5ee267d0d42d3394c2c
commit: 62754e4df9e04c4576e989f5ea2b909e824d8164 [6398/6705] mm/page_table_check: support userfault wr-protect entries
config: riscv-randconfig-r001-20230105 (https://download.01.org/0day-ci/archive/20240417/202404171745.Zd13ydca-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404171745.Zd13ydca-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404171745.Zd13ydca-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/page_table_check.c: In function 'swap_cached_writable':
   mm/page_table_check.c:192:24: error: 'SWP_DEVICE_EXCLUSIVE_WRITE' undeclared (first use in this function)
     192 |         return type == SWP_DEVICE_EXCLUSIVE_WRITE ||
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_table_check.c:192:24: note: each undeclared identifier is reported only once for each function it appears in
>> mm/page_table_check.c:194:1: warning: control reaches end of non-void function [-Wreturn-type]
     194 | }
         | ^


vim +194 mm/page_table_check.c

   186	
   187	/* Whether the swap entry cached writable information */
   188	static inline bool swap_cached_writable(swp_entry_t entry)
   189	{
   190		unsigned type = swp_type(entry);
   191	
   192		return type == SWP_DEVICE_EXCLUSIVE_WRITE ||
   193		    type == SWP_MIGRATION_WRITE;
 > 194	}
   195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
