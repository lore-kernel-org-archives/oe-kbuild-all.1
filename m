Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7A74C62
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 01:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717896938; cv=none; b=nUCkOB8iqNxdJUCK85hh3DgPyH0YgMTbcs13Wk6RA4WcX8vMl8XNOstixJnzyoshQ/M9FPJq9cEGD99icn2AYgBVZMx3pRgjE01hUCCjCv3ArUdxJyWqjuTJvV5XK/iAvm7Ueu4UOBHG75/U8DJDvOdAYbooP4z9eIMx/luK8KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717896938; c=relaxed/simple;
	bh=cIqscODymelffO147eJR4x4LoiLGaFOpZDcrV37OE2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mi2FDXPPmlJEw0PYuesFVz5dAe3j3AajiNqBNapzAmgEeCyo/GvY/98lOIs4ftri3gUAMtqjxbtH4gwtnEG68PDYkENX4oy6q3Y1Oc3A024mJ1GU38GdPYlJW218FV3IZ7WRlEQajIspxluN17k9cCG0VpP+hzrWZNYL+EheLZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJm6Qseh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJm6Qseh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717896936; x=1749432936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cIqscODymelffO147eJR4x4LoiLGaFOpZDcrV37OE2Q=;
  b=aJm6QsehGeHt5Rob2zl2/4pR1vGi/eejRwcfr1b6GQ62CpENmYyTt5HN
   e0glLOg+AZ0tzGlS/UOSOZ54+O71261vzeVBJifqzgmLgVrs/as1ghGYn
   MID/nx/+57VTgVZWL0OcY+s2JKesXiylrt/ENhajRZAd1YWGfdxu8lzyN
   7fQ8/j6BtTo1gurrFq7OaJ3UnxWwwyMBbfhJOYjhsr5FXWkaBa0kY+H0S
   LuI92KLfc7ITQ6088wXSx+e0ePfMJhmWL2e3lU6tF8q+mkhJlpoZra+3x
   VPG26z8+S6GgdHOrgL0Jbt4w3i85GXrsupdI0UhnGx8hECMraWmLFjIXb
   Q==;
X-CSE-ConnectionGUID: F8GAys0HSFunjkDEGIIQwg==
X-CSE-MsgGUID: TOdUpX6KRai3Vr1WMLtBkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="25162523"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="25162523"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 18:35:36 -0700
X-CSE-ConnectionGUID: JmWZmPGeT1+e81U81LcxOw==
X-CSE-MsgGUID: 9cbQ6SeORRqzmEDxlC8tsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="43129198"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jun 2024 18:35:35 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG7T3-0000jO-0p;
	Sun, 09 Jun 2024 01:35:33 +0000
Date: Sun, 9 Jun 2024 09:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:block-limit-flags 40/52] drivers/block/ublk_drv.c:487:24:
 warning: unused variable 'q'
Message-ID: <202406090944.vxH0A08t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git block-limit-flags
head:   b8da03a6bf6868bc22e344df8b888a805a34d7fa
commit: fd5fca92ead0799574d86663e35d70566aaf95e2 [40/52] block: move the nonrot flag to queue_limits
config: x86_64-buildonly-randconfig-002-20240609 (https://download.01.org/0day-ci/archive/20240609/202406090944.vxH0A08t-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406090944.vxH0A08t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406090944.vxH0A08t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/ublk_drv.c:487:24: warning: unused variable 'q' [-Wunused-variable]
     487 |         struct request_queue *q = ub->ub_disk->queue;
         |                               ^
   1 warning generated.


vim +/q +487 drivers/block/ublk_drv.c

62fe99cef94a590 Ming Lei 2023-05-19  484  
0aa73170eba5eae Ming Lei 2022-07-30  485  static void ublk_dev_param_basic_apply(struct ublk_device *ub)
0aa73170eba5eae Ming Lei 2022-07-30  486  {
0aa73170eba5eae Ming Lei 2022-07-30 @487  	struct request_queue *q = ub->ub_disk->queue;
0aa73170eba5eae Ming Lei 2022-07-30  488  	const struct ublk_param_basic *p = &ub->params.basic;
0aa73170eba5eae Ming Lei 2022-07-30  489  
0aa73170eba5eae Ming Lei 2022-07-30  490  	if (p->attrs & UBLK_ATTR_READ_ONLY)
0aa73170eba5eae Ming Lei 2022-07-30  491  		set_disk_ro(ub->ub_disk, true);
0aa73170eba5eae Ming Lei 2022-07-30  492  
0aa73170eba5eae Ming Lei 2022-07-30  493  	set_capacity(ub->ub_disk, p->dev_sectors);
0aa73170eba5eae Ming Lei 2022-07-30  494  }
0aa73170eba5eae Ming Lei 2022-07-30  495  

:::::: The code at line 487 was first introduced by commit
:::::: 0aa73170eba5eae638c1b96a05eba533f030b5cb ublk_drv: add SET_PARAMS/GET_PARAMS control command

:::::: TO: Ming Lei <ming.lei@redhat.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
