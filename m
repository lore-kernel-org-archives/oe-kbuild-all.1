Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3243A7F4E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 23:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782256375; cv=none; b=FQQ4PuGbjlRNFrYPXbTX/fu5Y35CYRf0kmiVGz3zwtgIHQLKaq9IU+gJ1JCX+PMtIQaRB7xB/0UL/hHyfz7MnZY2PlRU9HcXi72s7jbDvoZltRHDOt94rETMC5ZuP6UCbPaDLkjXb9eSHaqx0lrTFJBXr5P3PIK2vIn9fIyehX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782256375; c=relaxed/simple;
	bh=z1fs8rOFEMbixgaxDDi/XIh+0Sz2bhbzQ+UFZXDED8U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C3O95COxqVo0N4ejyj8dlE5sDK+Rxqw8DrKbtQMKeeLv4JmDIrNhefnNt/Glqt8AtVQI/343IZwoNtdxvNlp/1Q8vMtR8/SAoap+DYbSif0lWRNpsrVaVFS6UFNi7olWoCXnGy106Zak5nu72siJXR+00qcmeUXXdTa285e/REM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mtTv/0Qu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mtTv/0Qu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782256374; x=1813792374;
  h=date:from:to:cc:subject:message-id;
  bh=z1fs8rOFEMbixgaxDDi/XIh+0Sz2bhbzQ+UFZXDED8U=;
  b=mtTv/0QuqlBYEEVIt6kTFzPQopEQ5me7GSTEs+rhFlr7g96FHOeksmhO
   p6ME8uFMvjapWIKF2mzbdMq/joC7zhnMlPvMXfjOTHJY3Org06nYPzIRB
   Pf91bmppetVhZpuqqqZMK/vcgPLkvHbDCdzTBTM2YqWai58tJYzcuHUgm
   4hjmnzdkm9vDhBiKIYJH3TdeAaq7/Y4FuWI1amD56lLN23i6NTVyxunkn
   9YrED1CNDzt7YoKgrOx00dOTAfoBBKJWX0zbQXgP7LjTw2WbKUt+ZTsY2
   sVJFyjCeW6I+7UOqd4+g+divRP/hm/ayYdHnBP8iS2qfAlIANhRDCQSm3
   A==;
X-CSE-ConnectionGUID: 0vKsi+Q2RhepHtjvMvv7eg==
X-CSE-MsgGUID: A+p8rHzaSkqYyCa9zWF5mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86847340"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="86847340"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 16:12:51 -0700
X-CSE-ConnectionGUID: Xb7AVBALQy+EJn5a1WNrzg==
X-CSE-MsgGUID: uJXLbq9JRbmQdN2wis7qhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="279815492"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Jun 2026 16:12:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcAIQ-000000002wz-3GSz;
	Tue, 23 Jun 2026 23:12:46 +0000
Date: Wed, 24 Jun 2026 07:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Mason <chris.mason@fusionio.com>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <cel@kernel.org>
Subject: [cel:nfsd-testing 166/231] include/linux/rcupdate.h:525:36:
 error: dereferencing pointer to incomplete type 'struct nfsd_file'
Message-ID: <202606240755.8PVHHD1Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   2bb83225da8ee0383d17783b5c903589696faf90
commit: f2be51ec3aba541721c2baa65d272553d0fe961c [166/231] NFS/localio: fix ref leak on nfs_uuid_add_file failure
config: sparc-randconfig-002-20260624 (https://download.01.org/0day-ci/archive/20260624/202606240755.8PVHHD1Q-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240755.8PVHHD1Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240755.8PVHHD1Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/rbtree.h:24,
                    from include/linux/mm_types.h:11,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from fs/nfs_common/nfslocalio.c:7:
   fs/nfs_common/nfslocalio.c: In function 'nfs_open_local_fh':
>> include/linux/rcupdate.h:525:36: error: dereferencing pointer to incomplete type 'struct nfsd_file'
    #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
                                       ^~~~
   fs/nfs_common/nfslocalio.c:305:33: note: in expansion of macro 'RCU_INITIALIZER'
      struct nfsd_file __rcu *tmp = RCU_INITIALIZER(localio);
                                    ^~~~~~~~~~~~~~~


vim +525 include/linux/rcupdate.h

ca5ecddfa8fcbd Paul E. McKenney 2010-04-28  520  
462225ae47d717 Paul E. McKenney 2013-11-11  521  /**
462225ae47d717 Paul E. McKenney 2013-11-11  522   * RCU_INITIALIZER() - statically initialize an RCU-protected global variable
462225ae47d717 Paul E. McKenney 2013-11-11  523   * @v: The value to statically initialize with.
462225ae47d717 Paul E. McKenney 2013-11-11  524   */
462225ae47d717 Paul E. McKenney 2013-11-11 @525  #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
462225ae47d717 Paul E. McKenney 2013-11-11  526  

:::::: The code at line 525 was first introduced by commit
:::::: 462225ae47d7175f886281d8a91708550cd5178c rcu: Add an RCU_INITIALIZER for global RCU-protected pointers

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
