Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105821A0BE0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 00:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778633185; cv=none; b=kBUOc4KiCQejJzgE9E+c1AU+QhPt1Ty5zxk/AR319gRDqBqBFFfYjdehanC/6zFZ2Z+VjghbnpSvMrqXirl5M2pcvgVxPNdtju6D2VVgAKbhXkzxNJQS8TDAjGHCcvWnsPNz8A0dXsw0hxcRNfKVAxMM5pokY0TIyI6hhouPE6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778633185; c=relaxed/simple;
	bh=CydcOnLENkOj3SBEyHQByEaA3M8tdhBPLk8NE8T3PuM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rKe3n2kEClZ2JI7LLW2bIL+8GEAqIvJsKl5mx8J6pCLoXsIdZWrBfzekUmouOkE36jWxJuQk6aiuhncpcTRnVUsF3TNjuaXPHCkO9LEMV22LbWUN+D8fdW/OnxW1cZ/OBdMxk1UwDFgUJlAkfkqItt4PLhOQK8rMX3yK8R/2paI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RcP6WMdh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RcP6WMdh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778633184; x=1810169184;
  h=date:from:to:cc:subject:message-id;
  bh=CydcOnLENkOj3SBEyHQByEaA3M8tdhBPLk8NE8T3PuM=;
  b=RcP6WMdhpHCRebROHNuEFX0QcO5e7FzUjP30d5jPmuAPODz8A/qORN8U
   +I6FFAXI5MD0mNhI1RK91YZNiImGa8eHqgfYIccAD6ENlR8U2ahnYOm9p
   bMNsfME8CPWf+/630YEMnj6F5cemwKUite5HwrKk8D7xbo7ylV97WXp4C
   IXcBf0Jnte0x3gX6QFUOhTswogMNzJbIr2i8GLeOgMsQSPEx+QSH6CBEe
   C1pv1bj421cHhhhHFY6/tu5VV4XWYk6TcNO0/pGbO5g2jYxh0hGeVQW0z
   6I6DOXRT7QvCDy0JjTe0PGDX4fqH5510T6IREY1hqjEwZfFiZVhx22ZIO
   g==;
X-CSE-ConnectionGUID: qpFKLv4vSOuvjecpOa0GJg==
X-CSE-MsgGUID: gPM5DqU4RnylERvVd7Eq8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79575378"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79575378"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 17:46:24 -0700
X-CSE-ConnectionGUID: 4xL9aoSDQQ6u3qmd72vVYw==
X-CSE-MsgGUID: iBezAICWRYGKk1x/zLIOrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="235256388"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 May 2026 17:46:21 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMxjv-0000000034L-1qBP;
	Wed, 13 May 2026 00:46:19 +0000
Date: Wed, 13 May 2026 08:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse:
 sparse: incorrect type in return expression (different base types)
Message-ID: <202605130836.yFqJDKvE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1d5dcaa3bd65f2e8c9baa14a393d3a2dc5db7524
commit: 814ef095f12c9fa142043ee689500f3a41bb6dab powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces
date:   8 months ago
config: powerpc64-randconfig-r122-20260512 (https://download.01.org/0day-ci/archive/20260513/202605130836.yFqJDKvE-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130836.yFqJDKvE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 814ef095f12c ("powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130836.yFqJDKvE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse:     expected restricted __poll_t
   arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse:     got int

vim +121 arch/powerpc/platforms/pseries/papr-hvpipe.c

   108	
   109	/*
   110	 * The user space waits for the payload to receive.
   111	 * The hypervisor sends HVPIPE event message to the partition
   112	 * when the payload is available. The event handler wakeup FD
   113	 * depends on the source ID in the message event.
   114	 */
   115	static __poll_t papr_hvpipe_handle_poll(struct file *filp,
   116			struct poll_table_struct *wait)
   117	{
   118		struct hvpipe_source_info *src_info = filp->private_data;
   119	
   120		if (!src_info)
 > 121			return POLLNVAL;
   122	
   123		return 0;
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
