Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A60190665
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Dec 2024 15:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734278156; cv=none; b=D75EX3P+TKwfSPFOAS0/PZO7jduhQhsjudtCOssaKCg4NmdzvxWc/zP74BNI+i55p7clWyV+gShqBF14c2LmQV8r8GDJgB9t2zvWLIeE+bA4CKAT5zzsFcVDmf+K3H/B6MiDe67zig1bCBWr4pnreEWityqyYVh6Xw4Y+WqNguI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734278156; c=relaxed/simple;
	bh=Qz4GxuHx0HUtnpMwrAIMdUDEwkfTZkYYHeFBjWbGREw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SahQQiRosiYn0yIcySfRvmLcuLvzvodyUhH1X3ZxW+tC0nUCfe2vppyICcFZhXXKJxdASzePR43zGyjXq+XT7kPX/rVuxeA2n1aumVQOb00b9CPI4NkFLdWVZQkJ/bC0jt+ArxuGla1ClmgYa7vyJJ1dPwkFsWHIL7AfBV9J74Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+mziYb4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+mziYb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734278155; x=1765814155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qz4GxuHx0HUtnpMwrAIMdUDEwkfTZkYYHeFBjWbGREw=;
  b=f+mziYb46djQ3spFyNbLx66EIlicv5p+gIlaBeT0l9aNlOIqu3bd1AsJ
   27fC2W7FQ55DWArX81mTzAePBBNraS4JaY0S9Cgfg6vUHOc2vA//aZuOn
   oaB+y6Z9A60EAJlJABxys9fCykuVqmAe+p4jQ/yFY82UfoXhtuFFCC1ET
   tWIQ4cMXlnzJCwPF5nxq0PHa1BTU+BZkmfOoAvGRn9hoI76eQumD/+JHm
   3ujES/RICtZnQIn/k9yRWV6Ep2BAcgVyvfQZZTPLehUxWEzmKN6hXLf2N
   kVgcB53uXd09QXU7F4zt+JsmauYijlKVof1626d3kgZ5GOuwp919q8f/9
   Q==;
X-CSE-ConnectionGUID: 0huxrhW8Rby9DuDMMOzLLQ==
X-CSE-MsgGUID: emcKx83MRwmUZLed8rFB+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45673705"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45673705"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 07:55:53 -0800
X-CSE-ConnectionGUID: gYiVvnnfT0GFDuZqi72joA==
X-CSE-MsgGUID: J7AhWPP9R8CIOVJNlHBmmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97780348"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Dec 2024 07:55:51 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMqyC-000DhC-2z;
	Sun, 15 Dec 2024 15:55:48 +0000
Date: Sun, 15 Dec 2024 23:55:33 +0800
From: kernel test robot <lkp@intel.com>
To: Anand Jain <anand.jain@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
Subject: [kdave-btrfs-devel:misc-next 46/71] ERROR: modpost: "__moddi3"
 [fs/btrfs/btrfs.ko] undefined!
Message-ID: <202412152328.xCRSkxBJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Anand,

First bad commit (maybe != root cause):

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   9f01557aff0e022286507dc84b26a8094764e713
commit: 185fa5c7ac5add0f1a109a22a972ca99780ee49e [46/71] btrfs: introduce RAID1 round-robin read balancing
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241215/202412152328.xCRSkxBJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412152328.xCRSkxBJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412152328.xCRSkxBJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__moddi3" [fs/btrfs/btrfs.ko] undefined!
ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "inb_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
ERROR: modpost: "inw_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
ERROR: modpost: "nec7210_locking_ioport_write_byte" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
ERROR: modpost: "nec7210_locking_ioport_read_byte" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
ERROR: modpost: "outb_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
WARNING: modpost: suppressed 1 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
