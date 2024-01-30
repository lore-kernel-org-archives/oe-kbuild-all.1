Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E4857867
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706609132; cv=none; b=mDtp7KAAOgOgIzhauySCNz9Vd9ZqmFwnNZ/UCHEfMlvF+2uyW9do6IJqgiAX9MQh5Gtfsmb33QhetBFEf5oTl/cG0ytywZ1/X7vplDPmypECctrovSZ2UlV/Z5O4Ti47D7Mtj31RcpSNRiC+fH2oGordRhujRMaxYA09XrJ5YhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706609132; c=relaxed/simple;
	bh=4B1kxXWbaojJfYawdOz3EUMGFOUr4QFPmhlUq1wHfv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ee3hvKKz+I5It94l58DpZu0ldSkrz8LnQ+aD4sE9W303PVVeJGrTJQmSZXhIV82mxiQ4cgi8QvtPu4hTBtxcD6PiYuUNVeMJWUQYBaNgcwkdkF/UIaOkGMZxqKFxDNpCHiohmKN0tsZhwzD1/s3TgSWwvaV9mKkGiTL+e6VEYBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMyNoqzl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMyNoqzl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706609131; x=1738145131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4B1kxXWbaojJfYawdOz3EUMGFOUr4QFPmhlUq1wHfv0=;
  b=EMyNoqzlzCNkAQPKll41OCCz9ob/QotkKSL4Hj92hQcmNDblqzhsYs+m
   k1IjNLKsTIHcI4ShLaBgo1TyD+xsHu7yiUw9FAaZlzwzEzphZnKA+BWZN
   FRG2bTB0Rm0d4AZk/VSqRY74PqEpdxQc3/pvyifbzymmoed0xYPQSJODB
   rcqF/jpi2dCi5LlR3qHemFjEVA+QRpuoWMoJDPiLx4LZL6Qttc19gcWNx
   KTxuMyFQHiWwfj9JNCqbL0SUECrlrloGzIGKwwMD+2HJIEhXAWRg8t20z
   W9UhkjSlOPm2jeOOxOH5EHCOckgOsYT66FEPUMwtmWoEQn+s3L0qrwYpK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="9868535"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="9868535"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 02:05:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="788156412"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="788156412"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2024 02:05:27 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUkzc-0000BG-3D;
	Tue, 30 Jan 2024 10:05:24 +0000
Date: Tue, 30 Jan 2024 18:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-bdev-file-bd_inode 1/37] block/bdev.c:378:17:
 sparse: sparse: symbol 'blockdev_mnt' was not declared. Should it be static?
Message-ID: <202401301738.FaLNYN8K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-bdev-file-bd_inode
head:   92279a7f8c418cb71e6fb335e4af2c7565944a11
commit: ad63b0b9c7aad5e4c038f851f5f3d6257a08c667 [1/37] bdev: open block device as files
config: x86_64-randconfig-r123-20240130 (https://download.01.org/0day-ci/archive/20240130/202401301738.FaLNYN8K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401301738.FaLNYN8K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401301738.FaLNYN8K-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/bdev.c:378:17: sparse: sparse: symbol 'blockdev_mnt' was not declared. Should it be static?

vim +/blockdev_mnt +378 block/bdev.c

   376	
   377	struct super_block *blockdev_superblock __ro_after_init;
 > 378	struct vfsmount *blockdev_mnt __ro_after_init;
   379	EXPORT_SYMBOL_GPL(blockdev_superblock);
   380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
