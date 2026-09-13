Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7444D1F3B85
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 02:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789265738; cv=none; b=olIwHLJyT/DcWoXrJkpHDxtfcfakxtH9NvbZ459oq6X9N0jOp1M+CM/rSbYzMkMPWjqsV3wQr4bYJW1xwkgNz5kYBCZQcliypinD6abvBPLDwzk9GI+SIA+E/FweOc+v7pKZ0SCgQa/UEABFvdZkbvBjtHsvvMbBLIW3GxI+zlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789265738; c=relaxed/simple;
	bh=CQDPRX4jmHNs1gootddgqR+pMB4QNry2cypLKVNDjkE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tU8UOJ09WPwJJQ7umw/f5HmPjjYtnDBE4iL+z5FbZGvy5U59LqeyU7VRF16sN+FogE2Gbu2pWKJtM/aygzXahM7wXUB6z4oyigaN+tRR94Zj+NZXltCdetpngGF+Dm16MOtpsPKuKiHs8Fg/1tSpTC0kw9tfbDzJIKepzspZPdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOmJDR8k; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOmJDR8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789265736; x=1820801736;
  h=date:from:to:cc:subject:message-id;
  bh=CQDPRX4jmHNs1gootddgqR+pMB4QNry2cypLKVNDjkE=;
  b=fOmJDR8kXniDgvPpuzXpXqfYWx5jUD7SHRMUxBb3WCYg0eh0+RUZygDO
   5PD9FPXLJawO628Qi64z4A1gUBK7JT7m94Ze98UygkJQSa6Nt5MmeuKoZ
   jtaRStztACvIqIa32M9W/cGj0YU3L6TX+Eg8rWfogJvqIxsdnqS9nynja
   1fyT97a0A/ez7xl7aCengy+H7wI/TKOgsLz9f/Wg/CfDa6AfB86fl7tOu
   21pMkR5WUiHNw3aKxoUG7ZXFS2legTGw/B1+ecrpCq9vVwsFZIwuLwS3Q
   HcZT6MkAqS6v4XjIalteOecj1DJ/lJ6jTqFhOftjbnucXBMMATmmOY5R/
   g==;
X-CSE-ConnectionGUID: 9e8Ndab3QWSPnhId3qLv8A==
X-CSE-MsgGUID: 8GHiHxM7QFqchz9cy6YUMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="100834652"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="100834652"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 19:15:36 -0700
X-CSE-ConnectionGUID: ofPqPoT0RAGdYVQKHVwyRg==
X-CSE-MsgGUID: zv4HdZOBTii4bRyH6VOT+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="269672144"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 12 Sep 2026 19:15:35 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5Zki-000000001U7-12gX;
	Sun, 13 Sep 2026 02:15:32 +0000
Date: Sun, 13 Sep 2026 04:15:03 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 928/1155]
 fs/bcachefs/data/compress.c:91:13: warning: 'bio_phys_contig' defined but not
 used
Message-ID: <202609130406.w2xMgCHM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: 9d8c0abd05770eb55042839e565e3cf44302af44 [928/1155] bcachefs: kill off bvec.bv_page uses
config: xtensa-randconfig-r073-20260913 (https://download.01.org/0day-ci/archive/20260913/202609130406.w2xMgCHM-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260913/202609130406.w2xMgCHM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609130406.w2xMgCHM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/data/compress.c:91:13: warning: 'bio_phys_contig' defined but not used [-Wunused-function]
      91 | static bool bio_phys_contig(struct bio *bio, struct bvec_iter start)
         |             ^~~~~~~~~~~~~~~


vim +/bio_phys_contig +91 fs/bcachefs/data/compress.c

2fa23a10a54b61 fs/bcachefs/data/compress.c Kent Overstreet 2025-10-30   90  
c4dd7871ef71a7 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  @91  static bool bio_phys_contig(struct bio *bio, struct bvec_iter start)
c4dd7871ef71a7 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06   92  {
c4dd7871ef71a7 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06   93  	struct bio_vec bv;
c4dd7871ef71a7 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06   94  	struct bvec_iter iter;
c4dd7871ef71a7 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06   95  	void *expected_start = NULL;
c4dd7871ef71a7 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06   96  
c4dd7871ef71a7 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06   97  	__bio_for_each_bvec(bv, bio, iter, start) {
9d8c0abd05770e fs/bcachefs/data/compress.c Kent Overstreet 2025-11-17   98  		void *bv_addr = bvec_virt(&bv);
9d8c0abd05770e fs/bcachefs/data/compress.c Kent Overstreet 2025-11-17   99  
9d8c0abd05770e fs/bcachefs/data/compress.c Kent Overstreet 2025-11-17  100  		if (expected_start && expected_start != bv_addr)
c4dd7871ef71a7 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  101  			return false;
c4dd7871ef71a7 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  102  
9d8c0abd05770e fs/bcachefs/data/compress.c Kent Overstreet 2025-11-17  103  		expected_start = bv_addr + bv.bv_len;
c4dd7871ef71a7 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  104  	}
c4dd7871ef71a7 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  105  
c4dd7871ef71a7 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  106  	return true;
c4dd7871ef71a7 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  107  }
c4dd7871ef71a7 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  108  

:::::: The code at line 91 was first introduced by commit
:::::: c4dd7871ef71a7327b6b3834e2cdf6777e03eb0a bcachefs: Some compression improvements

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
