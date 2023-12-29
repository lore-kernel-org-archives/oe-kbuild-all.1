Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCF15245
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 03:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h6/Iy63k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703818931; x=1735354931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tCwcsTPHpP1F0YbC9S3zkJuY1QXF1MSXCG3jDnkmt/A=;
  b=h6/Iy63kUMmbqmqQJvtZSxozAsQjcoAbGCTz0BkXGftW8ZwfmVQKgPoP
   9pg31E6OhVeRHICeuR91MRGT9TtVnhek1rwEw3jASaJTuHB11QyHsC3TU
   szBwXdJ/Q/6qfkjFUr/BlFBukFpjCaif5hO3wp6upYeTYib4oX8RM4uiH
   DZ3zsg2obs5BEAeZT4xv5sns9oLycDuf/IhnifX5WOu7Iao8Q95rcmvKj
   usSiEioRFNhF4nKVBq5yN6aMTXltDdoflfInfel5MjGY9RwxUZO+G0qg2
   7FzskK6fcUTHKsy4cmL79ShWoHKoP+JAWdZATtttPVkQSrNRbOAth/u8Z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="396335033"
X-IronPort-AV: E=Sophos;i="6.04,313,1695711600"; 
   d="scan'208";a="396335033"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 19:02:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="844587264"
X-IronPort-AV: E=Sophos;i="6.04,313,1695711600"; 
   d="scan'208";a="844587264"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Dec 2023 19:02:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJ37e-000H2X-11;
	Fri, 29 Dec 2023 03:01:47 +0000
Date: Fri, 29 Dec 2023 11:00:20 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:blk-limits 42/45] drivers/block/ublk_drv.c:553:24:
 warning: 'return' with a value, in function returning void
Message-ID: <202312291001.fynQKQTU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git blk-limits
head:   337f45dec9ea74309924c682e15eeef50d86b1d9
commit: fa418d7e2366114b7f36e185c96b015b387003aa [42/45] ublk: pass queue_limits to blk_mq_alloc_disk
config: arc-randconfig-002-20231229 (https://download.01.org/0day-ci/archive/20231229/202312291001.fynQKQTU-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231229/202312291001.fynQKQTU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312291001.fynQKQTU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/block/ublk_drv.c: In function 'ublk_apply_params':
>> drivers/block/ublk_drv.c:553:24: warning: 'return' with a value, in function returning void [-Wreturn-type]
     553 |                 return ublk_dev_param_zoned_apply(ub);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/ublk_drv.c:548:13: note: declared here
     548 | static void ublk_apply_params(struct ublk_device *ub)
         |             ^~~~~~~~~~~~~~~~~


vim +/return +553 drivers/block/ublk_drv.c

0aa73170eba5ea Ming Lei          2022-07-30  547  
fa418d7e236611 Christoph Hellwig 2023-12-24  548  static void ublk_apply_params(struct ublk_device *ub)
0aa73170eba5ea Ming Lei          2022-07-30  549  {
0aa73170eba5ea Ming Lei          2022-07-30  550  	ublk_dev_param_basic_apply(ub);
0aa73170eba5ea Ming Lei          2022-07-30  551  
29802d7ca33bc0 Andreas Hindborg  2023-08-04  552  	if (ub->params.types & UBLK_PARAM_TYPE_ZONED)
29802d7ca33bc0 Andreas Hindborg  2023-08-04 @553  		return ublk_dev_param_zoned_apply(ub);
0aa73170eba5ea Ming Lei          2022-07-30  554  }
0aa73170eba5ea Ming Lei          2022-07-30  555  

:::::: The code at line 553 was first introduced by commit
:::::: 29802d7ca33bc0a75c9da2a143eeed4f9e99fca4 ublk: enable zoned storage support

:::::: TO: Andreas Hindborg <a.hindborg@samsung.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
