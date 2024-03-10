Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5049D3B1A4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 22:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710108011; cv=none; b=cTsAz4NEwwmo3Jb/z6smvnr9ZblePyFbxSsxfPX5Ay78XUcGXudTka4YYQ1gvtXYhgW+ch4Xs7jMzvlJVLlrn1sxEXu3vKbPfP1ksqCaLchsF32mADit3iWdlS31XfeXiZxFFTC6MsUCOJxgEOQeG6kIs3bRwpqjctH8dMGtJfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710108011; c=relaxed/simple;
	bh=ah6ArFkXb+1eGmgxc3KvBh996/vjgLqd6lzUPowWOSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ksoLZBpm3jgquHlnBz7GMYa9Oy0UFGrJmvBa4VLEryDDEJmIE39gcvRnMWsB+m1b+eAlCr7ixskWLwGQcmF6edU1LkGzel63HdQzEihOVa/txpvXSbem3ZZ7dqq3uUC/6D0fwJ1R5Wzh6VLuW5IAtGAHjvMxymo7hcjnfvk0k3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXOW3dJ0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXOW3dJ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710108009; x=1741644009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ah6ArFkXb+1eGmgxc3KvBh996/vjgLqd6lzUPowWOSY=;
  b=bXOW3dJ0ALX4rqzFErcQpWT3OAt2eIZjSeXcyTDYfOpHtS1LBB0lIQw8
   FFVE/GWqIWP6aHo29DcXEuNy0ZYdXQwVN0v1KcuHF0HOLnpDLaq5HGV1w
   kyHAltkTooTraqlUlhT813GZMLBPo0vquk3hndpIFALcKPWZ1u/UZPl4g
   HwWDpEabM5R/ALLEVJD8qOx+VIm59G0NPPs5C3izDrDyfh6GS79FY6lCr
   yN9NOVYn0eVy1cKL/0P4koMxEkpz8q8Cj2u8ifMzm+46SSndlxGARTVCO
   c/RzXXh/OKSUz7HaNhBi6n9WpYpuNMHBvWjWR7wsEgii0f+of/+OQYYki
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="30205203"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="30205203"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 15:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="41906576"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Mar 2024 15:00:07 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjRDA-0008ct-2T;
	Sun, 10 Mar 2024 22:00:04 +0000
Date: Mon, 11 Mar 2024 05:59:16 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip-rt-rebase 86/29558] lib/radix-tree.c:90:30:
 warning: unused variable 'radix_tree_preloads_lock'
Message-ID: <202403110521.2TD4eXm7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   dce1701e767e33da39db64fe691cd4783ec7dbbf
commit: 8da459ecce3fedab60289672129639f0bea640b9 [86/29558] radix-tree: use local locks
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240311/202403110521.2TD4eXm7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110521.2TD4eXm7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110521.2TD4eXm7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/radix-tree.c:90:30: warning: unused variable 'radix_tree_preloads_lock' [-Wunused-const-variable]
      90 | static DEFINE_LOCAL_IRQ_LOCK(radix_tree_preloads_lock);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/locallock.h:243:60: note: expanded from macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~
   1 warning generated.
   lib/radix-tree.c:235: warning: Function parameter or member 'node' not described in 'radix_tree_find_next_bit'
   lib/radix-tree.c:235: warning: Function parameter or member 'tag' not described in 'radix_tree_find_next_bit'
   lib/radix-tree.c:235: warning: Excess function parameter 'addr' description in 'radix_tree_find_next_bit'
   lib/radix-tree.c:235: warning: Excess function parameter 'size' description in 'radix_tree_find_next_bit'
   lib/radix-tree.c:690: warning: Function parameter or member 'root' not described in 'radix_tree_shrink'
   lib/radix-tree.c:690: warning: Function parameter or member 'update_node' not described in 'radix_tree_shrink'
   lib/radix-tree.c:1251: warning: Function parameter or member 'iter' not described in 'radix_tree_iter_replace'
   lib/radix-tree.o: warning: objtool: missing symbol for section .init.text


vim +/radix_tree_preloads_lock +90 lib/radix-tree.c

    80	
    81	/*
    82	 * Per-cpu pool of preloaded nodes
    83	 */
    84	struct radix_tree_preload {
    85		unsigned nr;
    86		/* nodes->parent points to next preallocated node */
    87		struct radix_tree_node *nodes;
    88	};
    89	static DEFINE_PER_CPU(struct radix_tree_preload, radix_tree_preloads) = { 0, };
  > 90	static DEFINE_LOCAL_IRQ_LOCK(radix_tree_preloads_lock);
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
