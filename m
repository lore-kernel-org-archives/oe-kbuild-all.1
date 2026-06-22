Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDF431326A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 17:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782147894; cv=none; b=jwHEELRF99mOtDOC7vTUtS1jiJBiym/VGJNu4jXnLna78acZHlF5ltfY9cXFq2/k5fIycS+fw8V/9C2slGvSMo0fDUpEutdP6PqllDDwXIZJD8nn07BaPnMnso6mZ2cqdeLXR9sp8vnHXCtJQyGhVf2CDFrZlBrBMMCFwIX/jRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782147894; c=relaxed/simple;
	bh=4RpnPoxJIpYtve0yeBKgTRFQhFXClQP7lqNQYPaQeBw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dmUdZ95naNs3LljP4uVykK51tla96Q9zMaKiEHMBipfkRjYxjdGROoltgKLgpyC6ihAGG6AqGaxOREBOn+hQCGiA6b3yByPwYvCDjOuqfJ/G49oNOnwozePd5o24tF/6dEYPkoDYZaKNNH1KAHIlGha9nTjPl5pAlVrTLcZ/8Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EknQ5omW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EknQ5omW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782147893; x=1813683893;
  h=date:from:to:cc:subject:message-id;
  bh=4RpnPoxJIpYtve0yeBKgTRFQhFXClQP7lqNQYPaQeBw=;
  b=EknQ5omW3Mual7GHCfpsG7VVydW3hJFW+zGDbmk9wRA6SjgWqG5owq0n
   q0PbHZz9wvU8kEQQ4H9wCKZ3zoEu/+gtYteEvwv1HF5YddN/ZKPEWcyyO
   QtaCLF23xdtTvTNGCAET0BVEpEC2dXkPY4Iyw1iLiD+4xNmcCft8xUgj8
   LinSmjbL1P6j3EkJ4veNuEwk/5HyaO0smJg64he4C8m2h2j6eVW1Y9ku4
   mdfncdI+FITUoBGyh2i2BHteEA3vQUIq1pUNIs2uPy7YM4zF/L/89qc09
   m1t370GIvUD80lrrVlQf/PizJSffuuA89H8/9Yvne7N9HUzJIYkKn/Y5j
   Q==;
X-CSE-ConnectionGUID: wa0kq5tVT6uWO5uiLzBhFw==
X-CSE-MsgGUID: fW05rVfRTBq2Zgirfjx7Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="94001383"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="94001383"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 10:04:52 -0700
X-CSE-ConnectionGUID: A2Hs/bY7R2yzg86j9LXuMQ==
X-CSE-MsgGUID: 6vAiBXcpSt+6+1vkn7u8ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="279466551"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Jun 2026 10:04:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbi4l-000000001aP-1Szb;
	Mon, 22 Jun 2026 17:04:47 +0000
Date: Tue, 23 Jun 2026 01:04:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andi Shyti <andi@smida.it>
Subject: drivers/i2c/busses/i2c-xgene-slimpro.c:159:21: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202606230049.4DXY47BY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ef0c9f75a19532d7675384708fc8621e10850104
commit: 7b174126124560f15e392fe5767face99e61ddb1 i2c: xgene-slimpro: Simplify PCC shared memory region handling
date:   1 year, 1 month ago
config: arm64-randconfig-r123-20260622 (https://download.01.org/0day-ci/archive/20260623/202606230049.4DXY47BY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230049.4DXY47BY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7b1741261245 ("i2c: xgene-slimpro: Simplify PCC shared memory region handling")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230049.4DXY47BY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/i2c/busses/i2c-xgene-slimpro.c:121:15: sparse: sparse: cast to restricted __le16
   drivers/i2c/busses/i2c-xgene-slimpro.c:124:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:124:9: sparse:     expected unsigned short volatile
   drivers/i2c/busses/i2c-xgene-slimpro.c:124:9: sparse:     got restricted __le16 [usertype]
   drivers/i2c/busses/i2c-xgene-slimpro.c:153:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short [usertype] *addr @@     got unsigned short [noderef] __iomem * @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:153:38: sparse:     expected unsigned short [usertype] *addr
   drivers/i2c/busses/i2c-xgene-slimpro.c:153:38: sparse:     got unsigned short [noderef] __iomem *
   drivers/i2c/busses/i2c-xgene-slimpro.c:157:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short [usertype] *addr @@     got unsigned short [noderef] __iomem * @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:157:37: sparse:     expected unsigned short [usertype] *addr
   drivers/i2c/busses/i2c-xgene-slimpro.c:157:37: sparse:     got unsigned short [noderef] __iomem *
>> drivers/i2c/busses/i2c-xgene-slimpro.c:159:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *msg @@     got struct acpi_pcct_shared_memory [noderef] __iomem * @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:159:21: sparse:     expected void *msg
   drivers/i2c/busses/i2c-xgene-slimpro.c:159:21: sparse:     got struct acpi_pcct_shared_memory [noderef] __iomem *
   drivers/i2c/busses/i2c-xgene-slimpro.c:173:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/i2c/busses/i2c-xgene-slimpro.c:177:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/i2c/busses/i2c-xgene-slimpro.c:177:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile @@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:177:9: sparse:     expected unsigned int volatile
   drivers/i2c/busses/i2c-xgene-slimpro.c:177:9: sparse:     got restricted __le32 [usertype]
   drivers/i2c/busses/i2c-xgene-slimpro.c:180:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/i2c/busses/i2c-xgene-slimpro.c:180:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:180:9: sparse:     expected unsigned short volatile
   drivers/i2c/busses/i2c-xgene-slimpro.c:180:9: sparse:     got restricted __le16 [usertype]
   drivers/i2c/busses/i2c-xgene-slimpro.c:183:18: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/i2c/busses/i2c-xgene-slimpro.c:183:18: sparse: sparse: cast to restricted __le16
   drivers/i2c/busses/i2c-xgene-slimpro.c:185:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/i2c/busses/i2c-xgene-slimpro.c:185:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:185:9: sparse:     expected unsigned short volatile
   drivers/i2c/busses/i2c-xgene-slimpro.c:185:9: sparse:     got restricted __le16 [usertype]
   drivers/i2c/busses/i2c-xgene-slimpro.c:189:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile @@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:189:17: sparse:     expected unsigned int volatile
   drivers/i2c/busses/i2c-xgene-slimpro.c:189:17: sparse:     got restricted __le32 [usertype]

vim +159 drivers/i2c/busses/i2c-xgene-slimpro.c

f6505fbabc426b9 Feng Kan     2015-04-24  145  
df5da47fe722e36 Hoan Tran    2017-04-24  146  static void slimpro_i2c_pcc_rx_cb(struct mbox_client *cl, void *msg)
df5da47fe722e36 Hoan Tran    2017-04-24  147  {
df5da47fe722e36 Hoan Tran    2017-04-24  148  	struct slimpro_i2c_dev *ctx = to_slimpro_i2c_dev(cl);
7b174126124560f Sudeep Holla 2025-04-11  149  	struct acpi_pcct_shared_memory __iomem *generic_comm_base =
7b174126124560f Sudeep Holla 2025-04-11  150  							ctx->pcc_chan->shmem;
df5da47fe722e36 Hoan Tran    2017-04-24  151  
df5da47fe722e36 Hoan Tran    2017-04-24  152  	/* Check if platform sends interrupt */
df5da47fe722e36 Hoan Tran    2017-04-24  153  	if (!xgene_word_tst_and_clr(&generic_comm_base->status,
89a4ad1f437c049 Sudeep Holla 2023-09-27  154  				    PCC_STATUS_SCI_DOORBELL))
df5da47fe722e36 Hoan Tran    2017-04-24  155  		return;
df5da47fe722e36 Hoan Tran    2017-04-24  156  
df5da47fe722e36 Hoan Tran    2017-04-24  157  	if (xgene_word_tst_and_clr(&generic_comm_base->status,
89a4ad1f437c049 Sudeep Holla 2023-09-27  158  				   PCC_STATUS_CMD_COMPLETE)) {
df5da47fe722e36 Hoan Tran    2017-04-24 @159  		msg = generic_comm_base + 1;
df5da47fe722e36 Hoan Tran    2017-04-24  160  
df5da47fe722e36 Hoan Tran    2017-04-24  161  		/* Response message msg[1] contains the return value. */
df5da47fe722e36 Hoan Tran    2017-04-24  162  		if (ctx->resp_msg)
df5da47fe722e36 Hoan Tran    2017-04-24  163  			*ctx->resp_msg = ((u32 *)msg)[1];
df5da47fe722e36 Hoan Tran    2017-04-24  164  
df5da47fe722e36 Hoan Tran    2017-04-24  165  		complete(&ctx->rd_complete);
df5da47fe722e36 Hoan Tran    2017-04-24  166  	}
df5da47fe722e36 Hoan Tran    2017-04-24  167  }
df5da47fe722e36 Hoan Tran    2017-04-24  168  

:::::: The code at line 159 was first introduced by commit
:::::: df5da47fe722e36055b97134e6bb9df58c12495c i2c: xgene-slimpro: Add ACPI support by using PCC mailbox

:::::: TO: Hoan Tran <hotran@apm.com>
:::::: CC: Wolfram Sang <wsa@the-dreams.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
