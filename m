Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF5F11181
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 12:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxNfzeVo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703854082; x=1735390082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hqtiSRuYdCLF7HG7FmPkHk3WkSHvG39tuT4z0Z2W0WA=;
  b=AxNfzeVoXnV6NdHKqSUXrC6HDxfx7wcQIreAOL/muFpKptG8A4RtAyoU
   gwmPJzpWOCOk4nDe6YDz+Q5JUqgSgKRSzR6DLbFJPuTtl3Tcfa07yjp+4
   7SqwiLX/XxNHhtfp/2KlQGgwy8+RXO38/yR4un36sBxAx54e7mUHPKHV+
   EaM9hf5+kacFGIqwekVeroMU+KNBEah0fNxuz4tIt5cEtsPeBte3/9yn1
   rZQSfv7Rz6CoXAJ8ifurT/o06+lEzsWwOldwu1nUu7crnaWHz0I6RVFEe
   +cFCn0nFiotr4Hgj/iAOFWLLQFAdaOI6ZcWITfaBg6BrySHZh5TPM7//f
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="381618968"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="381618968"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 04:48:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="728595100"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="728595100"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 29 Dec 2023 04:48:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJCHO-000HSQ-29;
	Fri, 29 Dec 2023 12:47:58 +0000
Date: Fri, 29 Dec 2023 20:47:23 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:blk-limits 42/45] drivers/block/ublk_drv.c:553:3:
 warning: void function 'ublk_apply_params' should not return a value
Message-ID: <202312292013.Q0hjKYNi-lkp@intel.com>
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
config: arm-randconfig-003-20231229 (https://download.01.org/0day-ci/archive/20231229/202312292013.Q0hjKYNi-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 8a4266a626914765c0c69839e8a51be383013c1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231229/202312292013.Q0hjKYNi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312292013.Q0hjKYNi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/ublk_drv.c:553:3: warning: void function 'ublk_apply_params' should not return a value [-Wreturn-type]
     553 |                 return ublk_dev_param_zoned_apply(ub);
         |                 ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/ublk_apply_params +553 drivers/block/ublk_drv.c

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
