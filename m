Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA2E189BA8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720084; cv=none; b=B0U8otfAri7aBX4+xPmRmKZHNX9YXap0XrTkfWmuUGwnEPZhLxR4q7xJgld6haiUGPsgEFGcdsOUI8M+BeG+k3o4f/ijK8o/i2uUl9t1/yRj6JayucMRvc1YoB3agiPBGlm0Fba7ONY8eBk12iN678gP/J9PxaSNw/xLhJdwk6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720084; c=relaxed/simple;
	bh=10vjRbIyGuOt3akUY9HVmZQkF5VXE6KQZ4r6X1aeSUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AkrYH/e+2d1GLAy/hxgr4IjM9NZSODynQ7vZP3UuAhkSJ9OASB5Vs2wOVef5XS6qCwkIGso0MVZJeHScFzSHtH0FW/cxPbk+gZ/ZdQjjySTvzjln3b7V4k9Fkce+zW8Q1WKuNxHzcWN9X3UxBhGb3m+xjtDEvQuJagprwZfoBME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzEK4nmU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzEK4nmU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720083; x=1765256083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=10vjRbIyGuOt3akUY9HVmZQkF5VXE6KQZ4r6X1aeSUM=;
  b=KzEK4nmUdU1z/cFuDf95v2DFiQf5S3SA0Gbv0DcOeErH9yYSvGl2G4s2
   17pDHRIO0xVfTQgzQPzU3yvtu32LiOnUl7+d7BJdupYYxH6l1nN6OwMFs
   ev+J9kEl2wN5VZwh0Y8gwCYwPcNyXlT8XmIf5CNl/fwYFQ6krI5WCyOwP
   wWdapHIsyIpf4tr+BJqy1y02Iu3qWqmdtxguBgRdT/S6jnDuNy3RSiag8
   E9z2XRaFYEtYuT7zwIawziASQDcnVNVVMIp3t9NUkqziUF1z/xDo/ZTIB
   ZgXRPH97stfQiLQY6v3V0JlpYxEbxN8Tqfwov5uG34+sqejSGLuOdtMHI
   A==;
X-CSE-ConnectionGUID: tNpff+QHSI689ikgrCxHgw==
X-CSE-MsgGUID: IsTQVfoWSOi6k8j1WxvLpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="51416634"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="51416634"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:54:41 -0800
X-CSE-ConnectionGUID: ialcBvR3RZSd09hHWiU9tA==
X-CSE-MsgGUID: maiey5FwRoOaXSXhhzJsGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94802484"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Dec 2024 20:54:40 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVn3-0003wF-33;
	Mon, 09 Dec 2024 04:54:37 +0000
Date: Mon, 9 Dec 2024 12:53:54 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <yunshenglin0825@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:pcp_prototype_241208 1/1] mm/page_pcp.c:991
 setup_zone_pageset() warn: unsigned '0' is never less than zero.
Message-ID: <202412090351.9bNV9bSR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git pcp_prototype_241208
head:   bb0461da06e9c2a5e9fe31362a5cc15077568de4
commit: bb0461da06e9c2a5e9fe31362a5cc15077568de4 [1/1] mm: split out per cpu page
config: i386-randconfig-141-20241208 (https://download.01.org/0day-ci/archive/20241209/202412090351.9bNV9bSR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412090351.9bNV9bSR-lkp@intel.com/

smatch warnings:
mm/page_pcp.c:991 setup_zone_pageset() warn: unsigned '0' is never less than zero.

vim +/0 +991 mm/page_pcp.c

   985	
   986	void __meminit setup_zone_pageset(struct zone *zone)
   987	{
   988		int cpu;
   989	
   990		/* Size may be 0 on !SMP && !NUMA */
 > 991		if (sizeof(struct per_cpu_zonestat) > 0)
   992			zone->per_cpu_zonestats = alloc_percpu(struct per_cpu_zonestat);
   993	
   994		zone->per_cpu_pageset = alloc_percpu(struct per_cpu_pages);
   995		for_each_possible_cpu(cpu) {
   996			struct per_cpu_pages *pcp;
   997			struct per_cpu_zonestat *pzstats;
   998	
   999			pcp = per_cpu_ptr(zone->per_cpu_pageset, cpu);
  1000			pzstats = per_cpu_ptr(zone->per_cpu_zonestats, cpu);
  1001			per_cpu_pages_init(pcp, pzstats);
  1002		}
  1003	
  1004		zone_set_pageset_high_and_batch(zone, 0);
  1005	}
  1006	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
