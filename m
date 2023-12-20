Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4307A47787
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Dec 2023 17:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0L5/lHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703092198; x=1734628198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AB8tRSsSntZOfFuHhAnREH4omEhUB+CB+CuhrGfJiIw=;
  b=c0L5/lHLyEVdwxZl1oAFC/M1IB2QZ8kmHJs4v3HTZwRi7gyxr50fsCLo
   3nsmltSLmtyROE4mLNgcPrIVA0LxdMG/zhEg9orW3vj4KyIwb3hcAZxKy
   3ONepFmhVCKHyjhlDBHqH3pySvnwq68QyYLdHQj6pjAA6NnHznM+pLqAw
   fkOVbd9N482ojhO6A2hqk/9swU6I6kqIXxHNLE13BqYSlrgb0JhCP41Z7
   Bq60WBakK5yopzl0mvZe8JFJAYHtQYPiz3G13j113YAXKro6dEuREzoff
   pkS2RnnZH6hCdzibLRZCIGBN2apRWsfxunSv1ExMB31kaEyly3EGV4LrC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="3079188"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="3079188"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 09:09:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="810668831"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="810668831"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 20 Dec 2023 09:09:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rG04N-0007DV-2n;
	Wed, 20 Dec 2023 17:09:19 +0000
Date: Thu, 21 Dec 2023 01:08:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8994/9550] io_uring/register.c:553:1: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202312210144.vItcGK51-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20d857259d7d10cd0d5e8b60608455986167cfad
commit: c43203154d8ac579537aa0c7802b77d463b1f53a [8994/9550] io_uring/register: move io_uring_register(2) related code to register.c
config: s390-randconfig-r123-20231220 (https://download.01.org/0day-ci/archive/20231221/202312210144.vItcGK51-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231221/202312210144.vItcGK51-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312210144.vItcGK51-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/register.c: note: in included file:
   include/linux/io_uring_types.h:341:48: sparse: sparse: array of flexible structures
>> io_uring/register.c:553:1: sparse: sparse: Using plain integer as NULL pointer
>> io_uring/register.c:553:1: sparse: sparse: Using plain integer as NULL pointer

vim +553 io_uring/register.c

   552	
 > 553	SYSCALL_DEFINE4(io_uring_register, unsigned int, fd, unsigned int, opcode,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
