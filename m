Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4442C859
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Sep 2025 18:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757354734; cv=none; b=EKnjyjAJWPnl0LcCoquuxhOaL7JhPn/XK2TxQ016VZYiQtlUOedPKuJioiDp65m01a6kedOkDL1Ctr8XjtZ+6ybtfI7G7ribad6OGPx4aIBegoXRIStBGEQQcAikUM5m3f7k2BSAJyfr3HtzhxnDyMV7bj4s48mTC/T6X2bK8kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757354734; c=relaxed/simple;
	bh=URHjR8aVtHHJhW0/E6Nq+HThzNyY8OmF88pmXVN5WO4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uCUDGC7i4ZH4l6zZdqA2ooS0gi0V/1Z+BsQo45HAdYGsLDgt06PvpOXcGhaw1U39SlySbuDdAbPcSJKl5ti141o4Id+WMZT0bneN0EWHSGjM+hzjHptgb9qjPgj00S5dE5Vd2TpA07/+BlCxloYD3bs6GJeggSRKRRFtie+oKnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKi8+UH7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKi8+UH7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757354733; x=1788890733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=URHjR8aVtHHJhW0/E6Nq+HThzNyY8OmF88pmXVN5WO4=;
  b=GKi8+UH7pixyhC7Uxy9UbaCh5QcNkwbWgoRHfZ2C0tItuEYuw965h1zh
   umt6dXZjk2o94zejfCP523o6l3k72xcDe/VfFerxWcnEiVHvqgF+fK4Fa
   hSPAqgh//kNqJjI3A1rudJegdNjOQnpehHi6MUxzMvAs4St6EoUs5AKOi
   2tWYJdbKZWl61gnjiZizm+nC+WCFnPc1Xxixp9WOQhImeypyccvESyQSN
   4seltVnrQpHKvzoUo54PgNrb4Trm+yJE3unflcHX5gp+g9JxVtN0W3M4a
   2TwzzJzLQmwED4g8bqT697i4ZutdZ4S+TMZQXRnewCzbjwMwP7/SJ+I37
   g==;
X-CSE-ConnectionGUID: FAiM/qSbS0uVmEiGwY6PJA==
X-CSE-MsgGUID: sGhkj3v4TIip93lwhndB1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82213199"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="82213199"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 11:05:32 -0700
X-CSE-ConnectionGUID: 8yOomfhJR3KQBgJ5rLRMsA==
X-CSE-MsgGUID: EWvjrflaRSKqJe4ZI0HwIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="177170942"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Sep 2025 11:05:30 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvgF5-00043T-1u;
	Mon, 08 Sep 2025 18:05:27 +0000
Date: Tue, 9 Sep 2025 02:05:08 +0800
From: kernel test robot <lkp@intel.com>
To: Yishai Hadas <yishaih@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
	Or Har-Toov <ohartoov@nvidia.com>,
	Michael Guralnik <michaelgur@nvidia.com>,
	Edward Srouji <edwards@nvidia.com>
Subject: [leon-rdma:rdma-next 63/63] include/linux/kern_levels.h:5:25:
 warning: format '%lu' expects argument of type 'long unsigned int', but
 argument 3 has type 'unsigned int'
Message-ID: <202509090116.E6ioDqw9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   1d254c5fc86b6938f7faf09af56cc4cc3d92c8be
commit: 1d254c5fc86b6938f7faf09af56cc4cc3d92c8be [63/63] IB/mlx5: Reduce IMR KSM size when 5-level paging is enabled
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20250909/202509090116.E6ioDqw9-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509090116.E6ioDqw9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509090116.E6ioDqw9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from ./arch/microblaze/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/scatterlist.h:7,
                    from include/rdma/ib_umem.h:11,
                    from include/rdma/ib_umem_odp.h:9,
                    from drivers/infiniband/hw/mlx5/odp.c:33:
   drivers/infiniband/hw/mlx5/odp.c: In function 'mlx5_ib_odp_init':
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:486:25: note: in definition of macro 'printk_index_wrap'
     486 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:567:9: note: in expansion of macro 'printk'
     567 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:567:16: note: in expansion of macro 'KERN_WARNING'
     567 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/odp.c:1934:17: note: in expansion of macro 'pr_warn'
    1934 |                 pr_warn("%s: implicit ODP is not supported for task size=%lu\n",
         |                 ^~~~~~~
--
   In file included from include/asm-generic/bug.h:22,
                    from arch/microblaze/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/scatterlist.h:7,
                    from include/rdma/ib_umem.h:11,
                    from include/rdma/ib_umem_odp.h:9,
                    from odp.c:33:
   odp.c: In function 'mlx5_ib_odp_init':
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:486:25: note: in definition of macro 'printk_index_wrap'
     486 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:567:9: note: in expansion of macro 'printk'
     567 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:567:16: note: in expansion of macro 'KERN_WARNING'
     567 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   odp.c:1934:17: note: in expansion of macro 'pr_warn'
    1934 |                 pr_warn("%s: implicit ODP is not supported for task size=%lu\n",
         |                 ^~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a7 Joe Perches 2012-07-30  4  
04d2c8c83d0e3ac Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3ac Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3ac Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
