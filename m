Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B02C2EF652
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 15:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116658; cv=none; b=N8QRkfJFrJH9H4tSDWrJWJLxEsm6Oa0etXkPpdYxeudLejTa0/hzhcOD2x/MbrNHyTI+ZvmiENWT2q45YLsO8ahuZUJOW7wxmnAvo+LpqoRx8kcEca+oQrvkTHgS5O4sqySs6QD3LmVZrt7RVEhn5dYbN0owX/G/6ROxtj56QpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116658; c=relaxed/simple;
	bh=F351eYTkI4YGx4wBOOuHnkh9v8fIup5jw1/76NYmDnM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=muJ74Ih8eD/xPfNP5LVvsMWtFfgvNndVURruSRuAy1+GbptAMO06M3YUcVpXzfL7QxEzsJEyy2RrHFIWAIhuwAGgCiXy3QO4OEI7hqkFSea2UvZ0xRPrkmLC+TdLOBWvCFFFLICzIFVntMmIDHGdIGyKlY5xmk4A24AFmJzqKTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYQXpBai; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYQXpBai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779116657; x=1810652657;
  h=date:from:to:cc:subject:message-id;
  bh=F351eYTkI4YGx4wBOOuHnkh9v8fIup5jw1/76NYmDnM=;
  b=JYQXpBaiHw96K//vq09evx8VWtJCGH2BOX4XRmlrkSv7SF3Ea5+/mAE1
   cQQ/cYLnQNf3XTdr/5gUnyRLYvf4haUmfAK77CrPOjhnp5JdBUwuKtSNA
   r3TcM6JPM3/dtyyg8KfAA1deG1LYEdpcVc2dRnNEaT5C/MQXTl6x0euis
   O7/XWPbW49dYL8f4bOJOTvSxVuWdA877jXLyIodd+onaxBXVQRma/Xwgn
   eEO0fPkTqiM+zJjY/TBKlPZKqaLcIaAFv2JFvROza7KecxLerZ+gyAkLF
   ekK9UQ8gxyP8epMKrBOL7Fh466dAiBw8uu6F/TLMJ2rudjqmeCZsJVwuW
   g==;
X-CSE-ConnectionGUID: 1QCfejIjQS6JVSoLqL8xzg==
X-CSE-MsgGUID: F6abVx1URRCOEkTT6m7CTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91428849"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="91428849"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 08:04:17 -0700
X-CSE-ConnectionGUID: z7ITh0wSROauEb9nLKxcIA==
X-CSE-MsgGUID: BA/UJoUcSt+zj9Jnu4YCcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="262967976"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 May 2026 08:04:15 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOzVs-000000002ww-2lmY;
	Mon, 18 May 2026 15:04:12 +0000
Date: Mon, 18 May 2026 23:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:swap_ops 3/6] Warning: mm/shmem.c:1594 function
 parameter 'ctx' not described in 'shmem_writeout'
Message-ID: <202605182249.d0pRxbgi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git swap_ops
head:   29fe8b22306087b6c9442e16eeb58e147f56afc7
commit: 3e9d9ceb9ee0a2bdbb7c82abda8f4b864488cfe8 [3/6] mm/swap: intoduce struct swap_io_ctx
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260518/202605182249.d0pRxbgi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605182249.d0pRxbgi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605182249.d0pRxbgi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/shmem.c:1594 function parameter 'ctx' not described in 'shmem_writeout'
>> Warning: mm/shmem.c:1594 function parameter 'ctx' not described in 'shmem_writeout'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
