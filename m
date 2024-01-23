Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E577FBCE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jan 2024 17:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706031215; cv=none; b=jH88KfcCooVWsvsIRbemA91W/GzwIeTB5y3I9VEqZmaz7PpPs36lWxfN8ymMMoVv1zG9wmCmLPmmOf5J8IFDT7DcgSfVv24RFxZHA/FL68R9IGILEUK7rfim8bz7UKtENMK9qx5I/xAraf/S2miEz4kQqzXOrKKM8idKrPz/Mks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706031215; c=relaxed/simple;
	bh=JWEgU8sctND2NtAFTcsFQdJQBTO1chByQQQe2YrIWE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L2N3GVUd1HM18MAqRC81yQTua1GCuO+xnqAZvctsf1/CyLmuEs95LWcFekYzc/QavC9CvpExpe1wBjHPNJhqULRFpT4XXRAzy5jCvC3gP1iY3r/XHpju3pj5vNa/gNtQE/2iaaXg3tMdEXAWWDMtp/3HP5tqwk4A7md4yyjS9pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRSLJaTx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRSLJaTx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706031213; x=1737567213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JWEgU8sctND2NtAFTcsFQdJQBTO1chByQQQe2YrIWE4=;
  b=GRSLJaTxVIdd3vW2VxXUNvhj/sVHHw8vtH+ZEvaAEz9LlvjrZcnH4P84
   0zFDY7wjg9TIxjdF6AotHsN0F4XBE0kVqUl73R9wmloEaTlkd7pw22GLN
   fm/GJ8oDrE/kFwTf1dYzp++0IN6IvpKAdu/lnDamsmLZOR36yooacxs9J
   mD+4gpHh3xoh02kzrzf2W3baW7RPaslzt9AEFdmoVtmUXfnwLpvgULt2i
   BIq4eCgGfCFTnJ+xNTT7wX3UB5XEjRBbTMuu5cVjJDtdaXzC6D+MNWXl3
   +YYEAt+1jWSzYZ1h8hMkUHRfl3vMpnAVY9EYKmvlTKI09vHZ/KRnkyxkX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8961527"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="8961527"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 09:33:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="735644683"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="735644683"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Jan 2024 09:33:31 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSKeP-0007aV-0l;
	Tue, 23 Jan 2024 17:33:29 +0000
Date: Wed, 24 Jan 2024 01:32:47 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 73/73] xfs_mount.c:undefined reference to
 `xfs_zone_gc_stop'
Message-ID: <202401240146.nxpiQ6xE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   a636d92a908d42463557fd856bc52ddf62c5693c
commit: a636d92a908d42463557fd856bc52ddf62c5693c [73/73] xfs: add proactive gc and write throtteling
config: arm-randconfig-004-20240123 (https://download.01.org/0day-ci/archive/20240124/202401240146.nxpiQ6xE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401240146.nxpiQ6xE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401240146.nxpiQ6xE-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/xfs/xfs_mount.o: in function `xfs_unmountfs':
>> xfs_mount.c:(.text+0xd38): undefined reference to `xfs_zone_gc_stop'
   arm-linux-gnueabi-ld: fs/xfs/xfs_mount.o: in function `xfs_mountfs':
>> xfs_mount.c:(.text+0x16c0): undefined reference to `xfs_zone_gc_start'
   arm-linux-gnueabi-ld: fs/xfs/xfs_super.o: in function `xfs_fs_reconfigure':
>> xfs_super.c:(.text+0x26b0): undefined reference to `xfs_zone_gc_start'
>> arm-linux-gnueabi-ld: xfs_super.c:(.text+0x274c): undefined reference to `xfs_zone_gc_stop'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
