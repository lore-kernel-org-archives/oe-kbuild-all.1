Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697AE2F5E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 00:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740875320; cv=none; b=sOkd3IgfZ5zPuVT86vuD0wWHnTahTWVKzspGuXSgHzT4AcBy+TRmG4/fTeAPnbl4LpXukDdY6N3bxIpjdbPfa+2S9M96t0To1WAX1PvLt9Kf2nWn0hNgkT3MNms3w2pycWCMHWjQUGEP5lQOvZvqGE3GAoDMmKXKHD2Zyf4Qj3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740875320; c=relaxed/simple;
	bh=7vZwj35QFra0RPLpXA0mlMG/BnwsXWStgQC6dVZIZbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QjC2Y9WseU5pR5Ida7fo1lqTcROgjUEa0eR1vkrB2H+muur28a/wNNpetj9crOEZKJsruzqdC5bN93BqEas5Drh8/lPm7Jz9Ti1PXtG1dX9Iob1cwWflkugCxBew9nOgj7GEoKtQOjxc5HkOjGlZD6zc+H5JSzP9mneVlmYvru8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mtAPLc2a; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mtAPLc2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740875318; x=1772411318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7vZwj35QFra0RPLpXA0mlMG/BnwsXWStgQC6dVZIZbI=;
  b=mtAPLc2aUUCmdtQcEBSVUUqAceo+5fNhV3NyEPnm2Fag3pC/QB6ko0+D
   eefEs0s05bSy7SrrKL/madW7nR/FUFWtHqlmNJ7TpLJQg4WSh09mVtuSy
   tJPdZ5Dh5OkpGNpUL5ABggnCP7aWX4dSFNZcmC7zl1EyDLhC6/rMqJDTs
   rvQD7GSONAKRMArR22u1xc6mj7a7grt3xPsXsYfIYc1tqq+b9Y4YsRANH
   scbX9JgrtmWoEOn8Ej7UVXNyWupZTwxTY9SitB7g4FD23AXthxXaVbpHe
   fiofn+dTkExhkfgvQFwl63iEHJHJT43JD7aHLO2vAjXTrTLX6iF9pI3dm
   Q==;
X-CSE-ConnectionGUID: iIR/TCD0Tq+gKH3Bu8PFWg==
X-CSE-MsgGUID: CxMdpMY1Qv6hTsKd+rJ7kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="51979796"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="51979796"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 16:28:38 -0800
X-CSE-ConnectionGUID: dadTO6cbRdO2cEmpUpup7g==
X-CSE-MsgGUID: JOOfu4/PS8SqxXAiPsudWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="148470670"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Mar 2025 16:28:37 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toXC6-000GtC-2E;
	Sun, 02 Mar 2025 00:28:34 +0000
Date: Sun, 2 Mar 2025 08:28:09 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/futex 21/21] kernel/futex/core.c:328:19:
 error: 'struct vm_area_struct' has no member named 'vm_policy'
Message-ID: <202503020836.CZ3LaPLw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/futex
head:   49fd6b8f5d595592bab59b1fd2bfa57d1bd8c767
commit: 49fd6b8f5d595592bab59b1fd2bfa57d1bd8c767 [21/21] futex: Implement FUTEX2_MPOL
config: x86_64-buildonly-randconfig-004-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020836.CZ3LaPLw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020836.CZ3LaPLw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020836.CZ3LaPLw-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/futex/core.c: In function '__futex_key_to_node':
>> kernel/futex/core.c:328:19: error: 'struct vm_area_struct' has no member named 'vm_policy'
     328 |         mpol = vma->vm_policy;
         |                   ^~
>> kernel/futex/core.c:332:21: error: 'struct mempolicy' has no member named 'mode'
     332 |         switch (mpol->mode) {
         |                     ^~
   In file included from include/linux/list_lru.h:12,
                    from include/linux/fs.h:13,
                    from include/linux/compat.h:17,
                    from kernel/futex/core.c:34:
>> kernel/futex/core.c:334:39: error: 'struct mempolicy' has no member named 'nodes'
     334 |                 node = first_node(mpol->nodes);
         |                                       ^~
   include/linux/nodemask.h:263:40: note: in definition of macro 'first_node'
     263 | #define first_node(src) __first_node(&(src))
         |                                        ^~~
>> kernel/futex/core.c:338:25: error: 'struct mempolicy' has no member named 'home_node'
     338 |                 if (mpol->home_node != NUMA_NO_NODE)
         |                         ^~
   kernel/futex/core.c:339:36: error: 'struct mempolicy' has no member named 'home_node'
     339 |                         node = mpol->home_node;
         |                                    ^~


vim +328 kernel/futex/core.c

   318	
   319	static int __futex_key_to_node(struct mm_struct *mm, unsigned long addr)
   320	{
   321		struct vm_area_struct *vma = vma_lookup(mm, addr);
   322		struct mempolicy *mpol;
   323		int node = FUTEX_NO_NODE;
   324	
   325		if (!vma)
   326			return FUTEX_NO_NODE;
   327	
 > 328		mpol = vma->vm_policy;
   329		if (!mpol)
   330			return FUTEX_NO_NODE;
   331	
 > 332		switch (mpol->mode) {
   333		case MPOL_PREFERRED:
 > 334			node = first_node(mpol->nodes);
   335			break;
   336		case MPOL_PREFERRED_MANY:
   337		case MPOL_BIND:
 > 338			if (mpol->home_node != NUMA_NO_NODE)
   339				node = mpol->home_node;
   340			break;
   341		default:
   342			break;
   343		}
   344	
   345		return node;
   346	}
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
