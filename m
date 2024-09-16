Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B57C15956C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 18:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726510585; cv=none; b=kra5sehtQWgc/7XqznI/YDqD1fUmz24UeKhJnmKo2DHDBcHX4ljH6JLOtmMDmH0aXK8hf55NvwK7FQsPh/VZ1d0NLzy8JGXjpXvrvMlHOp9c8RjGDvuDfvCv3l4ZSksHyFIPFc+fXI76jQFvMfg7e0OKuHJ+08e1dsr1V8wzaq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726510585; c=relaxed/simple;
	bh=Lb5K8IPEgK2Kix4LPVCJQ+pGwUoDs9Ssj7maO7LBcBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sl/L6nxbQNdhsbwcgsS1r6jnyuThgKJmXrVN1z3nSqFXyO9QV91KhdOzAMknJoibyl9psBE39fD1TcCKEZY22mLJ2Yu2uro75JI/EFkGOIBsPRFlhNz0/YDXB3nIip/mUi2yDRctAjSA4cyngJ9zHjDJE5HIvt29zm1JOB41IlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MTr1Gjd1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MTr1Gjd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726510584; x=1758046584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lb5K8IPEgK2Kix4LPVCJQ+pGwUoDs9Ssj7maO7LBcBk=;
  b=MTr1Gjd1Ukvsrqw64o5ka6CZLo66DM9eUTRMxAJZHt8KSzfB1KyNNbte
   vbb06tGMijwbjKb3MqyKtOtIqwz85KgK9Dc3HPPdEqZ3GlWq2cNmMtn5S
   UrLwqTzLtHJtNy37DLp8qafaYNGUcDZIoN40ALefsB2XBBjIeS1Bo3peh
   +6BHVhV5DjAu08YdIXJAqJgX4Pq9njliGbdOuxr5awHvpKfEmwxvpqSjo
   BxzbJN8NdekjpVCVmHzl/GvsEuETR5fWwaZd/fR/MIhaS53MLWMF/SQgA
   g6TR7gcKJ1btZmfxyufVFpA3qdepyLcgkSTpPtBgLRq4GPxHICfDSrPc8
   A==;
X-CSE-ConnectionGUID: OgKAXl6aRf+Eerur2DPFuA==
X-CSE-MsgGUID: +EJpWrjRQUSZqRHl0NzNTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25226656"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="25226656"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 11:16:24 -0700
X-CSE-ConnectionGUID: 9f/OQFsJQnWhLiXKLFfwJw==
X-CSE-MsgGUID: jygUy3nlRaSEB33anRfKQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="106405515"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Sep 2024 11:16:23 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqGGp-000AO6-36;
	Mon, 16 Sep 2024 18:16:19 +0000
Date: Tue, 17 Sep 2024 02:15:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20295/23714]
 drivers/net/bonding/bond_sysctl.c:9:25: sparse: sparse: symbol
 'bond_broadcast_arp_or_nd_table_header' was not declared. Should it be
 static?
Message-ID: <202409170243.8clAJD1d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: 0397c33121652647d544d4bcdceb9f2d868146af [20295/23714] anolis: bond: broadcast ARP or ND messages to all slaves
config: x86_64-randconfig-123-20240915 (https://download.01.org/0day-ci/archive/20240917/202409170243.8clAJD1d-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409170243.8clAJD1d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409170243.8clAJD1d-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/bonding/bond_sysctl.c:9:25: sparse: sparse: symbol 'bond_broadcast_arp_or_nd_table_header' was not declared. Should it be static?

vim +/bond_broadcast_arp_or_nd_table_header +9 drivers/net/bonding/bond_sysctl.c

     8	
   > 9	struct ctl_table_header *bond_broadcast_arp_or_nd_table_header;
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
