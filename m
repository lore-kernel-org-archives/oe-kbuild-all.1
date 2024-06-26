Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979F6191489
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 21:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719437656; cv=none; b=Z6cpZ8hbHYL2Lacq1qLldqYUPslsDPerrb0k473m0UxZ+8u5U7QIi3OG5ZBunqEtuLswdGendMFIclPiDuBMgXrn+naXDgPM5Rdc9Shxl2t3G6weqZJdry2mK1ANiEza8aCzFOtEdUSWFan9wa21+tmqj1EZY4Lbhx6FT3LhR6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719437656; c=relaxed/simple;
	bh=DnE4RuTC39431HmQk9SjHDiqCT33hcMw0XmQaR3mzQw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wu0ppeuRn45vSygarcVNzEGGa8eJBU9xM98b6L5U74SvnQg+hRjoO05zOBBBsJ1/7FNWDN0TDEBBcTE8Tlh93RyZZXUfzVY2diq9FDnPDGsgfL8M5RMXEbXOJsVXw5AuR4x9yqTi+rG9FJaHOH743MCFHrAThJbSePZYrjJMHBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KII3J5G3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KII3J5G3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719437654; x=1750973654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DnE4RuTC39431HmQk9SjHDiqCT33hcMw0XmQaR3mzQw=;
  b=KII3J5G3elPXpGmvxb1iRBw3bH/dlS3kc7klfbNaMT/7kUf+HLM9g4I2
   23ZwgqimDMQxXgedU/vAX/RIQVNzz1e87nYuPmT0FDEyEVtGidhj3zvJY
   ZfpPgagURyfvL73wwriWWxtjHjmJkwFe6txeLkDnxiv9kcqdsoptV5IgA
   ymARknGEfL+gYN9CJmJfrLz2Q1q5EA0NknK+wmyauj4DBDFX5Sggq+Eo7
   zmPzQ9068Wtt7Qe+/5MeQzb3/vjLNyRtKkKHL2DMLnflLKQ+kx1ejMC/R
   3Q7MPyAY8jbzpqXTAAWa15AGL4TiwUlWrSf969PQWZ0BZaP1dGSDASMU+
   A==;
X-CSE-ConnectionGUID: xu+Z4k4WSjKvg+OidSbNgQ==
X-CSE-MsgGUID: mzCqHMBsS6WFCxb7gr6Lgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="34068630"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="34068630"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 14:34:06 -0700
X-CSE-ConnectionGUID: JFtNQuZgQPKhm5282BK7uw==
X-CSE-MsgGUID: a0kMJQiGTJ++ZIPOHWSq1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="44263167"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Jun 2024 14:34:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMaHC-000FZg-0A;
	Wed, 26 Jun 2024 21:34:02 +0000
Date: Thu, 27 Jun 2024 05:33:07 +0800
From: kernel test robot <lkp@intel.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Anuj Gupta <anuj20.g@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>, Christoph Hellwig <hch@lst.de>
Subject: [axboe-block:for-next 94/104] include/linux/blk-integrity.h:151:16:
 error: incompatible types when returning type 'struct bio_vec' but 'struct
 bio_vec *' was expected
Message-ID: <202406270554.XMlaJCcq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
head:   c1440ed442a58eb4060a58f7c1f85775b6bb72ae
commit: cf546dd289e0f6d2594c25e2fb4e19ee67c6d988 [94/104] block: change rq_integrity_vec to respect the iterator
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240627/202406270554.XMlaJCcq-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406270554.XMlaJCcq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406270554.XMlaJCcq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from block/bdev.c:15:
   include/linux/blk-integrity.h: In function 'rq_integrity_vec':
>> include/linux/blk-integrity.h:151:16: error: incompatible types when returning type 'struct bio_vec' but 'struct bio_vec *' was expected
     151 |         return (struct bio_vec){ };
         |                ^


vim +151 include/linux/blk-integrity.h

   147	
   148	static inline struct bio_vec *rq_integrity_vec(struct request *rq)
   149	{
   150		/* the optimizer will remove all calls to this function */
 > 151		return (struct bio_vec){ };
   152	}
   153	#endif /* CONFIG_BLK_DEV_INTEGRITY */
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
