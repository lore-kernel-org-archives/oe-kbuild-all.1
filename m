Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADD418EAB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 05:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735450734; cv=none; b=jVe0/HLGh77XZHsQ4EVVeYto1s3320IbW3kXRYskzC4Lt5Nm3ubIyskFpZW9v6sbhTAxD6x+ypG7f2RjMLcpj3VaIWwwkh14ojNNu0PM2Hkz3mrva+ewnnGFSLSd2Yza0yc604h8q3fsNgXM/CeDIibplIbnbHg0JqOr0rsWAv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735450734; c=relaxed/simple;
	bh=nqVxhwHbd3GVcxiFNA5hJUPPhI8V0wrA1RlSTQESRZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RaZDH71bHuff0tv5QjO8mcgq0NZmljFyRAy6EkiMJ5S/gSXjR4bg2LznGAoCCSwTtH74BKTppxhZnUN7j3nVS0mo9rl67LicYTqHbNxVZRqBuzD6RVg7bIuwgcBwuEKQ+cRVfYxgcpej6sF5/ygJ9m+J2E3Veg6fHBmlAotmmAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bEHt+YpS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bEHt+YpS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735450733; x=1766986733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nqVxhwHbd3GVcxiFNA5hJUPPhI8V0wrA1RlSTQESRZ0=;
  b=bEHt+YpSiChYa3g2r/FUSZ+FMrkQ4SCO2C61FHDA0L1nCzE72sRR3Z6e
   Ukzcfp/qHi3rXZsosXB9YWXyTe/2RNeAtogZhaCZ912SKZ+ugNi+GMT+1
   cV8p1B74ALnxOjEogzEz0eg8DE8a/4NQ6hvY/JnSrp4sTmEvxruQaLH9G
   XiALvQiZ5Iwo6jffypgwIBtr7pMysRS7MJ1f9KP2o+GucqfikaX6cbpkB
   bnumGU5j8MZ2nxoAxKlx91aQN2smhSQPC8gD/HTXayH1V0eVQMU9eLfI5
   RhOAW94+ThJMaVWBN7AJUEt80zcKJ3IRcDY4juJy7Ch/eg3z29a712rtG
   g==;
X-CSE-ConnectionGUID: rm4ukR72Qf+7nkn9WCPVxg==
X-CSE-MsgGUID: 5tXWuHnFTeqhMCq+S81AeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="46362031"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="46362031"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 21:38:52 -0800
X-CSE-ConnectionGUID: OAqNVw9FRgahgkWOYdwnwg==
X-CSE-MsgGUID: wl3Z2RLoTfSh4oC5rffJrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="100330071"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Dec 2024 21:38:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRm0m-0004VA-2f;
	Sun, 29 Dec 2024 05:38:48 +0000
Date: Sun, 29 Dec 2024 13:38:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1356/1356] mm/memory_hotplug.o:
 warning: objtool: __remove_pages()+0x149: unreachable instruction
Message-ID: <202412291322.70sEUMki-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   773f731853f1368508a0b112047bd9b5a4bb9a5e
commit: b9f9a54ea6ea41d0e00c19fadf6ff3f42ba32a86 [1356/1356] mm/memory_hotplug: make __remove_section() never fail
config: x86_64-buildonly-randconfig-002-20241228 (https://download.01.org/0day-ci/archive/20241229/202412291322.70sEUMki-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412291322.70sEUMki-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412291322.70sEUMki-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/memory_hotplug.c:12:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/memory_hotplug.c:31:
   include/linux/mm_inline.h:32:43: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      32 |         __mod_node_page_state(pgdat, NR_LRU_BASE + lru, nr_pages);
         |                                      ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:34:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      34 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   3 warnings generated.
>> mm/memory_hotplug.o: warning: objtool: __remove_pages()+0x149: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
