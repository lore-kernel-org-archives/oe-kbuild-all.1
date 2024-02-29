Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144EF47F6F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 09:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198149; cv=none; b=CgrxYkjMki78BuKuc83NhZd4zolErRXMKITDGoudEWQnF8APGt2uQwK2ElvvkaIrYzQY70O4CLo/qyQwgvgzXhwlp3hOP763N5goO15Sbs5D0aSpjjQHKOYaU8Z8cpm9VKlpRW6/W2rB9+bXk9UN/iyZre4CQBm9Z6qqMSqXHTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198149; c=relaxed/simple;
	bh=s7qmVoKp4GQ9e1uUNoZFNaaxvpqqu61i+9Hqa1PRaHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K/mUQn540U61pd5p2JtVCersTXOWNih5bGP3DWRSYT9uGlQkYmgdumArdwb1+l+lYweRga+ad8F99DEjCpX2ESHXULrfdRu4t2g4N3FZytCf9vd3BfU3dhFilsVNiuQlne6vSsKJZdX5D+m7I1Y9pyPubkr8xatQ9pNNAkzBQRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IxP009Kp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxP009Kp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709198148; x=1740734148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s7qmVoKp4GQ9e1uUNoZFNaaxvpqqu61i+9Hqa1PRaHY=;
  b=IxP009KpREkmlDzXaXoi4Fr2pYARorsPZudJDmyklrCeU7nHWql8rVIe
   UFuPLxz0kDm5PNyUpC4Kes+jBFZEanQ6l8kMc2P+JFogjaJI0qsJ49cpY
   VKKHIQGJTM2Hf5VTx3l79A1508Ha9xr7E0GdLhONUAWBoZadTbBa6/QgZ
   rmpRnlN0rKJ5auE03WdOPms9peoSJi1JCJbVkj/P4oa/cqwMBje3UOpFW
   sCJzrAW5ppZDC+KFyhVDcirTZgvGw/lb1icvMFNKbaZDnBLsDfhhU6s6t
   bdi0T9z8P4GXtkIiw3R6XouU9AOydXlU01NT1rZBQt3sXkIP8Ka06Vssl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="26119190"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="26119190"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 01:15:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="38592746"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 Feb 2024 01:15:45 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfcVk-000CoJ-24;
	Thu, 29 Feb 2024 09:15:37 +0000
Date: Thu, 29 Feb 2024 17:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-v4 896/922] dev.c:undefined reference to
 `gen_pool_for_each_chunk'
Message-ID: <202402291731.rKyq9zIp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-v4
head:   c13f97bb45f13d99fc22c4452f9926dd4a53d6ce
commit: 97ebf80b3d6202c352319049101721960920f73e [896/922] netdev: support binding dma-buf to netdevice
config: loongarch-randconfig-001-20240229 (https://download.01.org/0day-ci/archive/20240229/202402291731.rKyq9zIp-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402291731.rKyq9zIp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402291731.rKyq9zIp-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: net/core/dev.o: in function `__netdev_dmabuf_binding_free':
>> dev.c:(.text+0x11028): undefined reference to `gen_pool_for_each_chunk'
>> loongarch64-linux-ld: dev.c:(.text+0x11038): undefined reference to `gen_pool_size'
>> loongarch64-linux-ld: dev.c:(.text+0x1104c): undefined reference to `gen_pool_avail'
>> loongarch64-linux-ld: dev.c:(.text+0x11060): undefined reference to `gen_pool_destroy'
   loongarch64-linux-ld: net/core/dev.o: in function `netdev_bind_dmabuf':
>> dev.c:(.text+0x11628): undefined reference to `gen_pool_create'
>> loongarch64-linux-ld: dev.c:(.text+0x11744): undefined reference to `gen_pool_add_owner'
>> loongarch64-linux-ld: dev.c:(.text+0x11848): undefined reference to `gen_pool_for_each_chunk'
   loongarch64-linux-ld: dev.c:(.text+0x11858): undefined reference to `gen_pool_destroy'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
