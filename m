Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B062F52F62
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 21:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727041937; cv=none; b=lKutTSgti3vTn8quJoFCIW/ReUL5pPFZ+25wBtJLCau3FrQQYQ6wUseEpP+GrErxROWwNUWIN/uceKowPknBUWeFGGUVAcEozw59up3YCS9jsvdirL3tG2w+doDaq7m4zT0C2ExiwFM/nLMbh2i1P8iT83iPYuHQZxMGnUvBrjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727041937; c=relaxed/simple;
	bh=mUlmnmjPDGr7wElWa9TaIEJaeHNqG1QTp0xOA3PI4K4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HtwQQIyneg/z2G6VlSn8VsGqwT/LKtaQoB61fmotBuYzmFU19ATOIkPyDGvc3UqrF1zZHmOI+smoRd4+6S/jHAS434zGqnMmrJ0/mvYpBGjf2ET8/7qKAjxoPAmh4FNgxwHla2YENVnFtqcEh+hfhMZOdQB8zOoIkdrQuMAvQtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JqwQAx47; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JqwQAx47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727041936; x=1758577936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mUlmnmjPDGr7wElWa9TaIEJaeHNqG1QTp0xOA3PI4K4=;
  b=JqwQAx47ZS8pR0r6+EtAeYi6ldf1rWYt0dfvIWcF8tgMX78+uz7AkgS6
   fabwjS3CGI1ar3oOZ1R9bd4+qBaySGlRO1sMMJV7qvFjoJ7v7wzSnZhoV
   xswR2PKNvT1avQyfjuiIFKmqz7hBmVwed0lzl0AFD0BXXz8IrmqtBzaYv
   kJgD6lcXGgWYwDQuY7KIbTfh/4vNwfQObI7Nz+k1oXmeQc+5KTXD8hrF8
   cLy0gfJQW2YZKTS3Giy4Tb8u6p6MCc/6EgaYOCAixeZ+Kal1mZN9rhMc4
   L/5UyHlVY0Slp1O3Ig2RkdkxcgAvDNxfC6Rxw+JmA2/KMigxdZ4Ez9+oj
   g==;
X-CSE-ConnectionGUID: BKIsUZb6QY2buqc58JqmGw==
X-CSE-MsgGUID: cZlsI0BUSyeSHdDR6mSf9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25804766"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="25804766"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 14:52:13 -0700
X-CSE-ConnectionGUID: qDUGG0dRRz2xT4wTWjsAfw==
X-CSE-MsgGUID: ICB39EkyT2WvEaXMkcVDfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="70876409"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Sep 2024 14:52:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssUUz-000GgY-1f;
	Sun, 22 Sep 2024 21:52:09 +0000
Date: Mon, 23 Sep 2024 05:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg_trace_v4_5c 69/99]
 drivers/net/ethernet/mellanox/mlx5/core/fpga/conn.c:385:9: sparse: sparse:
 Initializer entry defined twice
Message-ID: <202409230518.m18D5B7w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dyndbg_trace_v4_5c
head:   215f1e90281215ee6e5cddaa1a4fbe1dbb4e4c9b
commit: 523772afc85127a8125cbe2b14e99a4b9e0756a7 [69/99] dyndbg: move flags field to a new structure
config: i386-randconfig-061-20240923 (https://download.01.org/0day-ci/archive/20240923/202409230518.m18D5B7w-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240923/202409230518.m18D5B7w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409230518.m18D5B7w-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/mellanox/mlx5/core/fpga/conn.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>> drivers/net/ethernet/mellanox/mlx5/core/fpga/conn.c:385:9: sparse: sparse: Initializer entry defined twice
   drivers/net/ethernet/mellanox/mlx5/core/fpga/conn.c:385:9: sparse:   also defined here

vim +385 drivers/net/ethernet/mellanox/mlx5/core/fpga/conn.c

537a50574175a2 Ilan Tayari 2017-03-27  364  
537a50574175a2 Ilan Tayari 2017-03-27  365  static inline void mlx5_fpga_conn_cqes(struct mlx5_fpga_conn *conn,
537a50574175a2 Ilan Tayari 2017-03-27  366  				       unsigned int budget)
537a50574175a2 Ilan Tayari 2017-03-27  367  {
537a50574175a2 Ilan Tayari 2017-03-27  368  	struct mlx5_cqe64 *cqe;
537a50574175a2 Ilan Tayari 2017-03-27  369  
537a50574175a2 Ilan Tayari 2017-03-27  370  	while (budget) {
537a50574175a2 Ilan Tayari 2017-03-27  371  		cqe = mlx5_cqwq_get_cqe(&conn->cq.wq);
537a50574175a2 Ilan Tayari 2017-03-27  372  		if (!cqe)
537a50574175a2 Ilan Tayari 2017-03-27  373  			break;
537a50574175a2 Ilan Tayari 2017-03-27  374  
537a50574175a2 Ilan Tayari 2017-03-27  375  		budget--;
537a50574175a2 Ilan Tayari 2017-03-27  376  		mlx5_cqwq_pop(&conn->cq.wq);
537a50574175a2 Ilan Tayari 2017-03-27  377  		mlx5_fpga_conn_handle_cqe(conn, cqe);
537a50574175a2 Ilan Tayari 2017-03-27  378  		mlx5_cqwq_update_db_record(&conn->cq.wq);
537a50574175a2 Ilan Tayari 2017-03-27  379  	}
537a50574175a2 Ilan Tayari 2017-03-27  380  	if (!budget) {
537a50574175a2 Ilan Tayari 2017-03-27  381  		tasklet_schedule(&conn->cq.tasklet);
537a50574175a2 Ilan Tayari 2017-03-27  382  		return;
537a50574175a2 Ilan Tayari 2017-03-27  383  	}
537a50574175a2 Ilan Tayari 2017-03-27  384  
537a50574175a2 Ilan Tayari 2017-03-27 @385  	mlx5_fpga_dbg(conn->fdev, "Re-arming CQ with cc# %u\n", conn->cq.wq.cc);
537a50574175a2 Ilan Tayari 2017-03-27  386  	/* ensure cq space is freed before enabling more cqes */
537a50574175a2 Ilan Tayari 2017-03-27  387  	wmb();
537a50574175a2 Ilan Tayari 2017-03-27  388  	mlx5_fpga_conn_arm_cq(conn);
537a50574175a2 Ilan Tayari 2017-03-27  389  }
537a50574175a2 Ilan Tayari 2017-03-27  390  

:::::: The code at line 385 was first introduced by commit
:::::: 537a50574175a2b68b0612ffb48cb044a394c7b4 net/mlx5: FPGA, Add high-speed connection routines

:::::: TO: Ilan Tayari <ilant@mellanox.com>
:::::: CC: Saeed Mahameed <saeedm@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
