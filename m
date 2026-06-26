Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4671C695
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 21:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782509949; cv=none; b=EKUOei87Ca1guST6o29t61+UmsWHQerR5yM2h2f9w7wG3uxZ+j5Flr6BrKVgHsGfDwpuIIBVju8TS8ZsNpFH3RkmMnfl2knEmTiQxev3NlwueI1iW8H90DprEp4NAAK4x7VkDUqczvCJBgIcBd0w169oijjOMZDF2BNOido3OTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782509949; c=relaxed/simple;
	bh=4u6fQWAY1rJmNZRStnWqvy9kB7rHp0iVeg6ZQL77Kzw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FTM4BxwyozndKQ4SUj7gl/xDsCO29aXrrl7HW+wB1jdL1ZcVII20gLOjapWW8mKPujsi8rNvXwHqvLjg+R/SPc7AQc2mhylXctWB3HiAOp2dwVMxFGuzyS3/l9SHoevyFbaNZ7y01hHkAaJu9QC8VaedhGM4ts7GlVp0eF9fayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CUvoU773; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CUvoU773"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782509948; x=1814045948;
  h=date:from:to:cc:subject:message-id;
  bh=4u6fQWAY1rJmNZRStnWqvy9kB7rHp0iVeg6ZQL77Kzw=;
  b=CUvoU773Ca4gIb/UsDGg8d5d5yY7oDk/1/Z5nxltmWHe8nNNsdLNWXou
   WRSyfArJfHFcAGFhmGfHObahf4s/sKJejSRNcuK7v6IOxQ/szF14dTUkq
   HoRauMl3KlzBwI9Xw4m7aaXMaUbogUSPmewo+xonFaBOmqtRC5RxdgtlC
   2HDlDPmIeqhqsX41STpTbOJbR8bOGpGmGGIssoRSb7HYkPnHg9zlBXGiV
   mp85qYEnvvsh6TDWmdcPRwhZ9wyLQgcaIj3H5Ff99hmPNC2eDVyR/+zPG
   UjFbplEoaiyWmR++S64+nEO5iCair/ZtP2Y6bUsY/7auAXDdwj/Lk+kql
   g==;
X-CSE-ConnectionGUID: qqrUqWnZR6SfdhclYjtgzw==
X-CSE-MsgGUID: i8uy8N+fQaucRc8oQrJsKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="83180671"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="83180671"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 14:39:04 -0700
X-CSE-ConnectionGUID: Cut2AAnBSIGZH8W1CnG7Ig==
X-CSE-MsgGUID: RckpbFKISMiluSRtTHMZMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="274624343"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 26 Jun 2026 14:39:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdEGI-000000005Rt-27b9;
	Fri, 26 Jun 2026 21:38:58 +0000
Date: Sat, 27 Jun 2026 05:38:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Liam R. Howlett (Oracle)" <liam@infradead.org>
Subject: [liam:maple_marks_v7.2 3/31] lib/maple_tree.c:1158:21:
 warning: no previous prototype for function 'mas_lockdep_map'
Message-ID: <202606270553.g1bOF8H8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git maple_marks_v7.2
head:   be119ad50e9c87a4a975871d84614f7c6aeaf0de
commit: 3e341aa5972e499ffef5881c5dad0f9aa3488053 [3/31] maple_tree: Add write lock checking with lockdep sequence numbers
config: i386-randconfig-141-20260627 (https://download.01.org/0day-ci/archive/20260627/202606270553.g1bOF8H8-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606270553.g1bOF8H8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606270553.g1bOF8H8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/maple_tree.c:1158:21: warning: no previous prototype for function 'mas_lockdep_map' [-Wmissing-prototypes]
    1158 | struct lockdep_map *mas_lockdep_map(struct ma_state *mas)
         |                     ^
   lib/maple_tree.c:1158:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1158 | struct lockdep_map *mas_lockdep_map(struct ma_state *mas)
         | ^
         | static 
   1 warning generated.


vim +/mas_lockdep_map +1158 lib/maple_tree.c

  1155	
  1156	
  1157	#ifdef CONFIG_LOCKDEP
> 1158	struct lockdep_map *mas_lockdep_map(struct ma_state *mas)
  1159	{
  1160		struct maple_tree *mt = mas->tree;
  1161	
  1162		if (mt_external_lock(mt))
  1163			return mt->ma_external_lock;
  1164	
  1165		return &(mt->ma_lock).dep_map;
  1166	}
  1167	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
