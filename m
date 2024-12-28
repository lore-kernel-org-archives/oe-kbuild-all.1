Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC32132117
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 09:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735379757; cv=none; b=GjOeA26K5lck8LwiOfLJnzniDW8yBoji0tn0eM/ws3U1N1QUzb+iRKMyNb+C3JYCDqV+GbVAV+8Ve/PZId1KSlTJVzM9mSpMmWu3qxTLQuKrXSaajtu+wYXFbP10NtnBtz8Q+E9GA6C5VX8oBQMRdtOgzXMd1vaZ5bj+cSwnn0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735379757; c=relaxed/simple;
	bh=z4YxKyBwRxCV3JSfn2Oiv3yKZIkxrlyDpMTNwPpE5RY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rd5JBmQOZI3fsS+9H1fLEzYSMlubBLa+5fjlaBX24Foe5PqPQW5RkUSr8FLqxRbMpFQyu9ncczNfTfYBaelBmm1eDVopCIaqqOv/2D6o7l1IbojOdZMjs/7nexzh16SCdukAmsWWcfBAwZH9bdgbT1oKg5cuWj863ZqKx8r7Y5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwZgaQbz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwZgaQbz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735379757; x=1766915757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z4YxKyBwRxCV3JSfn2Oiv3yKZIkxrlyDpMTNwPpE5RY=;
  b=FwZgaQbzD1b5ST/eA5LXQfOXIF6szhJZnRxfN5JObqdkWCNPz5ErN0GD
   vblhbUgzo2thjoNYEZ3t/n8peIzGtCfG8kAsQYv4be6AL1iDaW3oJIEcp
   g26epbMTgCQ9GOYiS1Pbdoz6TXom35DZ+efldKyZsz6l7aT264oCkIJsM
   WBqpAelwu7dJVLxeqMb0ESSU8ax6sgFgVmoT7cxIDmja5y/TbK7nJvdP1
   DKeCAHVLZQDRORHdXDMNIleWBe7pClWMmuWQhSBHz+aExiXUtyDA2OY68
   hDY2QHHx52Uozt2vPmEfu5DhQ64Tq+RRK1jaiHdHtZtHJotTfkx9JF984
   w==;
X-CSE-ConnectionGUID: cliTGC31QZG3TUN35vkryg==
X-CSE-MsgGUID: 0G+1sOQXR3qmv0U+Mc6xeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="39437945"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="39437945"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 01:55:54 -0800
X-CSE-ConnectionGUID: ImBI72ueRLaMZcnp/qo7kg==
X-CSE-MsgGUID: gdeb+hSbQz+spyTBTnHXjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="105185283"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Dec 2024 01:55:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRTXy-0003zD-0I;
	Sat, 28 Dec 2024 09:55:50 +0000
Date: Sat, 28 Dec 2024 17:55:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2589/2589] drivers/block/nbd.o: warning:
 objtool: nbd_alloc_and_init_config()+0x35: unreachable instruction
Message-ID: <202412281725.LnOuPqEI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   053a6b6f8e4c86200cdb20bc80c063c3bb119859
commit: d2cdad29e00e63ab3a32f5f0d90acc757ff5653a [2589/2589] nbd: fold nbd config initialization into nbd_alloc_config()
config: x86_64-buildonly-randconfig-002-20241218 (https://download.01.org/0day-ci/archive/20241228/202412281725.LnOuPqEI-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281725.LnOuPqEI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281725.LnOuPqEI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/nbd.o: warning: objtool: nbd_alloc_and_init_config()+0x35: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
