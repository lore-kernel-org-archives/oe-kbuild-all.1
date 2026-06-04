Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E1130CD9E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 16:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590051; cv=none; b=DNzJ1foYPRgPOsXnNUkAQSUwILAP8r9DJcQx8fex3Q5fuqSw9F7MRiTTdsNwsNABuPOayg6P+rFGeUr+Op8N6ImdJ4Ai8VT/Po/WzhZ6pa8ZxMVW3gNABS0bPa3wv0nXhdD0QAguLSrpHJloRiMharK2Cg1oxtxZSKhtnhmP16g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590051; c=relaxed/simple;
	bh=80oawnhU9h7Vu3NFHCIRvTG2i467nz8ZX34BIjckmIg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XnjnY7UH5m26mu8Fm7ek5VH8tvrDA9/7SRjdT2YhOwdXRgR+ODWOHymcKEUEE6OvPMtkqWF8FlznJiqe1v91yCwLaac9w50zB8KdDw0uHMw/D1+Kmcw5Mxooc1O1ZvMl5CLTKBqWVEows33+SF263VTz7el5QBsntYF3GYXgb34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/pkHPDe; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/pkHPDe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780590050; x=1812126050;
  h=date:from:to:cc:subject:message-id;
  bh=80oawnhU9h7Vu3NFHCIRvTG2i467nz8ZX34BIjckmIg=;
  b=f/pkHPDekQ5/rUFv9DugQv8tQkSzfVhQBOzTycCggURCgXpafyaWrqZj
   a4XC5CDYTIO13CjfFjwzti4HQc3f4Pqp0ppqG+O9yhQigWsurm88OikpC
   UorLqa9xCgXuDyX0fs5XWXwfoEw3RIJIWU33UvbZuCqVi+TuZ5i8mPcd7
   N7a9T81+NZxPsMB6qmw52+H3/fOJ46IlEdpumsX75oUpL0UYYOkfSbdId
   w+UfOyTfQmpNKCIQBdNiOXuWZL0UsuhOqHhtROpUb2yTAxDP09lfA9igx
   nCAPVdvYak6m9pGdBfPTpIiKwjmMtt1Nqv5iW61K63G78PG/mcRzflXHJ
   A==;
X-CSE-ConnectionGUID: V3XKfVwUQ56aaKIdiA1B5w==
X-CSE-MsgGUID: UA4gBOF5T7GypyxVneieSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="98838935"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="98838935"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 09:20:49 -0700
X-CSE-ConnectionGUID: Jk8a3aZeQcqSfWyylB91MA==
X-CSE-MsgGUID: MMHioWLmR6WQ1lu1KAOIlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="240121683"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Jun 2026 09:20:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVAoH-00000000ExA-3D3n;
	Thu, 04 Jun 2026 16:20:45 +0000
Date: Fri, 05 Jun 2026 00:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:block-error-injection 7/9]
 block/blk-core.c:142:32: sparse: sparse: incorrect type in return expression
 (different base types)
Message-ID: <202606050043.es7jWhMn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git block-error-injection
head:   d7e2b41137c45870f6c51cb6fd921bd704918a38
commit: 4de356a6c0d655ba75b2cdedf6d7c8d1b602154d [7/9] block: add a str_to_blk_op helper
config: i386-randconfig-r133-20260604 (https://download.01.org/0day-ci/archive/20260605/202606050043.es7jWhMn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050043.es7jWhMn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050043.es7jWhMn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   block/blk-core.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/block.h):
   include/trace/events/block.h:244:1: sparse: sparse: restricted blk_mq_req_flags_t degrades to integer
   block/blk-core.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, include/trace/events/block.h):
   include/trace/events/block.h:244:1: sparse: sparse: restricted blk_mq_req_flags_t degrades to integer
>> block/blk-core.c:142:32: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted blk_opf_t enum req_op @@     got int [assigned] i @@
   block/blk-core.c:142:32: sparse:     expected restricted blk_opf_t enum req_op
   block/blk-core.c:142:32: sparse:     got int [assigned] i

vim +142 block/blk-core.c

   134	
   135	enum req_op str_to_blk_op(const char *op)
   136	{
   137		int i;
   138	
   139		for (i = 0; i < ARRAY_SIZE(blk_op_name); i++) {
   140			if (blk_op_name[i] &&
   141			    !strcmp(blk_op_name[i], op))
 > 142				return i;
   143		}
   144	
   145		return REQ_OP_LAST;
   146	}
   147	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
