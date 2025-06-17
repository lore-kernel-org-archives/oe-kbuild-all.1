Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4601A2DFF00
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 15:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175908; cv=none; b=kQY+FR+l9ApJ+H4nOY63fvyzFEhXRqL2rHWCCuiPcKSrJNL6K2WZzx0h81Oy0W5A8Acwjzn5B+06J3oUHeoEt0BTbH7dwFFGHwGNalZyJPB3wiwPpCKDAYjocCUgV8LJG+xVBAaeII/rJqsrnA22obgnnyhnD1vPjF5t3SUmBko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175908; c=relaxed/simple;
	bh=PLvIfRbI0GikMhhy6ezaN63iSCNqR8BtnargKRyIAxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jJA36nQSGhqsOFXBxxo41f34rPiEjuvLbAxnegFlhn2mJWhdSuyWpfoFWNHyZV0wyE3ju9sBHlLhRKsDqxmApBQTvy5AieofBwtNKq9g5ECL0kd6i7hLz2ZRUwSQgVqtlrDoGonelVzHDaVVnk35jY4TQJj4HYTbTeZ4srKv09k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lyup3KyY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lyup3KyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750175907; x=1781711907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PLvIfRbI0GikMhhy6ezaN63iSCNqR8BtnargKRyIAxM=;
  b=Lyup3KyYI8Jrkgrlfh/GiOOJTvIZmxfTO73oaIw6i0kJArhrKfCmwyqP
   WCqvNt77meaLxLKEKJfSyLhA6yu3aFqT4Y6oKy4MQnVaerNyYZsnMGEDr
   9anxEcOM0twH2PT5gQ8iz/dSi8zfDw3sBEy1g8jY0x7LgsoYBZmcaGGmJ
   yyjcx4V4t6s9nCDpcUy3xJ6gw0/b49UNwEmLJkObx73KdqkLd8+Yv3em/
   t71WN5N6NChoKOSIT5lvFZlmaM4trXZ8BBOBNIMqD1lERfEJM0oUgr+7T
   dyifeI7yd2+9/GS0oISncMs9n2P48k5LQi8pEoXN82NZOmGvaqffbQeGe
   w==;
X-CSE-ConnectionGUID: I+zOexmKTtSrfUWk0dKbGw==
X-CSE-MsgGUID: cWqeM5/1SFCFNGWwCxaW/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="69807955"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="69807955"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 08:58:05 -0700
X-CSE-ConnectionGUID: pRlEGTKZTUOOs0FDbiw5ZQ==
X-CSE-MsgGUID: T1Hw3yOoTgO4B3DVFjp29A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="153716930"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jun 2025 08:58:01 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRYhC-000GZq-2n;
	Tue, 17 Jun 2025 15:57:58 +0000
Date: Tue, 17 Jun 2025 23:57:49 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/25] mm/shrinker.c:688:6: warning: no
 previous prototype for function 'register_shrinker_prepared'
Message-ID: <202506172331.8xkgsN4G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   52f058371994dd007ac842b38bab3e576e84ab5a
commit: 504ef1c9f57c863225587809ba9e1c29029c34c4 [0/25] mm: shrinker: remove old APIs
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250617/202506172331.8xkgsN4G-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506172331.8xkgsN4G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506172331.8xkgsN4G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shrinker.c:688:6: warning: no previous prototype for function 'register_shrinker_prepared' [-Wmissing-prototypes]
     688 | void register_shrinker_prepared(struct shrinker *shrinker)
         |      ^
   mm/shrinker.c:688:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     688 | void register_shrinker_prepared(struct shrinker *shrinker)
         | ^
         | static 
   1 warning generated.


vim +/register_shrinker_prepared +688 mm/shrinker.c

af7c9c99bd63fc Qi Zheng 2023-09-11  687  
af7c9c99bd63fc Qi Zheng 2023-09-11 @688  void register_shrinker_prepared(struct shrinker *shrinker)
af7c9c99bd63fc Qi Zheng 2023-09-11  689  {
af7c9c99bd63fc Qi Zheng 2023-09-11  690  	down_write(&shrinker_rwsem);
af7c9c99bd63fc Qi Zheng 2023-09-11  691  	list_add_tail(&shrinker->list, &shrinker_list);
af7c9c99bd63fc Qi Zheng 2023-09-11  692  	shrinker->flags |= SHRINKER_REGISTERED;
af7c9c99bd63fc Qi Zheng 2023-09-11  693  	shrinker_debugfs_add(shrinker);
af7c9c99bd63fc Qi Zheng 2023-09-11  694  	up_write(&shrinker_rwsem);
af7c9c99bd63fc Qi Zheng 2023-09-11  695  }
af7c9c99bd63fc Qi Zheng 2023-09-11  696  

:::::: The code at line 688 was first introduced by commit
:::::: af7c9c99bd63fc40bba758503e56287d483c09a9 mm: vmscan: move shrinker-related code into a separate file

:::::: TO: Qi Zheng <zhengqi.arch@bytedance.com>
:::::: CC: Qinyun Tan <qinyuntan@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
