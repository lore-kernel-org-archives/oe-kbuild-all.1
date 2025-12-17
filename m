Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37438255F57
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 18:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765997232; cv=none; b=udVxllVGlMyZUmJ2Qsbz+r+3oTZsGuMJ1b5O/NMbO0lglvuXvdAEgDI0NslBuiXHW5TieWgdZc4v8SVCEDvpgtbG5lHtZUIroqW1/cQnKRa26iRIO5G1asaWKr2a6ski8GVmkF1ZnlvMqzT9Ui+RwT+dV/j9ey+J4dDFiIuellQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765997232; c=relaxed/simple;
	bh=O1XS291rFsFh+5r8+NFb32yw2YDh1GpsircNS1LPw6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c7lipLMoOJl3xECX1iYOMSaqOiU3hMQIhJov7EYQVzU0NHB3aKxQBRUInsH3lTW8DxhaU8AM3negrFBPdZwKiJAJfksoTkiLxhEIDT0Q7+LuL/vELXNUMy3NaWrCmo+7z/mfUd+hFhagQJ3kJapgG/asl3ObCZjIOxWxEw60cFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ff77Kbh+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ff77Kbh+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765997231; x=1797533231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O1XS291rFsFh+5r8+NFb32yw2YDh1GpsircNS1LPw6s=;
  b=Ff77Kbh+qS02HFdLxMXaWzEFxL2qJtyK6HrtBemQc7hu5pkpAeEV3lAX
   RG3kYkJu4l2Yvnvx+iAgKHsLuPTbTtTCx+yeLQQW4OW003LccWxen3p7O
   6KUZAZ57+e2P4Ek4eAasBwcfrhGwFZYs+2iV1R48UPYDBsXVvdRQ+UX8T
   svecUn460s8zVmEwUUnsbnwwmZBx4G3482KT7TPnK/tEYKef9MvXv8fWG
   JFHZ/wH+4XmWCb8a+O6/sC36CgUgu5oQaEOLC1gzTLpxZVw/nhu0IIOaI
   AfcELBsUhNj4QSnPhdDVt186XD0VxaQSa01p5x2dYkc98no9E8RsNV5rJ
   Q==;
X-CSE-ConnectionGUID: bW4pwsnFR46tfNhDX01nqw==
X-CSE-MsgGUID: E/jjvrjZS1G2aZ3+eClUdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71573188"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="71573188"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 10:47:09 -0800
X-CSE-ConnectionGUID: 8CtbmsnLSKGf3q3BF4ZzAQ==
X-CSE-MsgGUID: 44ZeAGjZTY26G2GKgEzHtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="203277573"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Dec 2025 10:47:07 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVwYD-0000000018G-0sUQ;
	Wed, 17 Dec 2025 18:47:05 +0000
Date: Thu, 18 Dec 2025 02:46:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:nfs-delegation-lru 23/25] fs/nfs/delegation.c:624:6:
 warning: variable 'err' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202512180259.b931Bgq8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git nfs-delegation-lru
head:   fe452ee815ff75c7db64071f26ee3668584706c8
commit: c0d1199d9dc2091e7d9a1a83d39de4df6d65a332 [23/25] NFS: add a separate delegation return list
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251218/202512180259.b931Bgq8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512180259.b931Bgq8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180259.b931Bgq8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/delegation.c:624:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     624 |         if (test_bit(NFS_DELEGATION_RETURN_DELAYED, &delegation->flags) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     625 |             test_bit(NFS_DELEGATION_REVOKED, &delegation->flags) ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     626 |             test_and_set_bit(NFS_DELEGATION_RETURNING, &delegation->flags)) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:60:29: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^
   include/linux/bitops.h:43:2: note: expanded from macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |         ^
   fs/nfs/delegation.c:645:6: note: uninitialized use occurs here
     645 |         if (err)
         |             ^~~
   fs/nfs/delegation.c:624:2: note: remove the 'if' if its condition is always false
     624 |         if (test_bit(NFS_DELEGATION_RETURN_DELAYED, &delegation->flags) ||
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     625 |             test_bit(NFS_DELEGATION_REVOKED, &delegation->flags) ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     626 |             test_and_set_bit(NFS_DELEGATION_RETURNING, &delegation->flags)) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     627 |                 spin_unlock(&delegation->lock);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     628 |                 goto out_put_inode;
         |                 ~~~~~~~~~~~~~~~~~~~
     629 |         }
         |         ~
>> fs/nfs/delegation.c:624:6: warning: variable 'err' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     624 |         if (test_bit(NFS_DELEGATION_RETURN_DELAYED, &delegation->flags) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     625 |             test_bit(NFS_DELEGATION_REVOKED, &delegation->flags) ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:60:29: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^
   include/linux/bitops.h:43:2: note: expanded from macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |         ^
   fs/nfs/delegation.c:645:6: note: uninitialized use occurs here
     645 |         if (err)
         |             ^~~
   fs/nfs/delegation.c:624:6: note: remove the '||' if its condition is always false
     624 |         if (test_bit(NFS_DELEGATION_RETURN_DELAYED, &delegation->flags) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     625 |             test_bit(NFS_DELEGATION_REVOKED, &delegation->flags) ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:60:29: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^
   include/linux/bitops.h:43:2: note: expanded from macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |         ^
>> fs/nfs/delegation.c:624:6: warning: variable 'err' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     624 |         if (test_bit(NFS_DELEGATION_RETURN_DELAYED, &delegation->flags) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:60:29: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:43:2: note: expanded from macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      44 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      45 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      46 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      47 |          const##op(nr, addr) : op(nr, addr))
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/delegation.c:645:6: note: uninitialized use occurs here
     645 |         if (err)
         |             ^~~
   fs/nfs/delegation.c:624:6: note: remove the '||' if its condition is always false
     624 |         if (test_bit(NFS_DELEGATION_RETURN_DELAYED, &delegation->flags) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:60:29: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^
   include/linux/bitops.h:43:2: note: expanded from macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |         ^
   fs/nfs/delegation.c:620:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     620 |         if (!inode || !igrab(inode)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/delegation.c:645:6: note: uninitialized use occurs here
     645 |         if (err)
         |             ^~~
   fs/nfs/delegation.c:620:2: note: remove the 'if' if its condition is always false
     620 |         if (!inode || !igrab(inode)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     621 |                 spin_unlock(&delegation->lock);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     622 |                 goto out_put_delegation;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~
     623 |         }
         |         ~
   fs/nfs/delegation.c:620:6: warning: variable 'err' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     620 |         if (!inode || !igrab(inode)) {
         |             ^~~~~~
   fs/nfs/delegation.c:645:6: note: uninitialized use occurs here
     645 |         if (err)
         |             ^~~
   fs/nfs/delegation.c:620:6: note: remove the '||' if its condition is always false
     620 |         if (!inode || !igrab(inode)) {
         |             ^~~~~~~~~
   fs/nfs/delegation.c:606:9: note: initialize the variable 'err' to silence this warning
     606 |         int err;
         |                ^
         |                 = 0
   5 warnings generated.


vim +624 fs/nfs/delegation.c

   601	
   602	static int nfs_return_one_delegation(struct nfs_server *server)
   603	{
   604		struct nfs_delegation *delegation;
   605		struct inode *inode;
   606		int err;
   607	
   608		spin_lock(&server->delegations_lock);
   609		delegation = list_first_entry_or_null(&server->delegations_return,
   610				struct nfs_delegation, entry);
   611		if (!delegation) {
   612			spin_unlock(&server->delegations_lock);
   613			return 0; /* no more delegations */
   614		}
   615		list_del_init(&delegation->entry);
   616		spin_unlock(&server->delegations_lock);
   617	
   618		spin_lock(&delegation->lock);
   619		inode = delegation->inode;
   620		if (!inode || !igrab(inode)) {
   621			spin_unlock(&delegation->lock);
   622			goto out_put_delegation;
   623		}
 > 624		if (test_bit(NFS_DELEGATION_RETURN_DELAYED, &delegation->flags) ||
   625		    test_bit(NFS_DELEGATION_REVOKED, &delegation->flags) ||
   626		    test_and_set_bit(NFS_DELEGATION_RETURNING, &delegation->flags)) {
   627			spin_unlock(&delegation->lock);
   628			goto out_put_inode;
   629		}
   630		clear_bit(NFS_DELEGATION_RETURN_DELAYED, &delegation->flags);
   631		spin_unlock(&delegation->lock);
   632	
   633		nfs_clear_verifier_delegated(inode);
   634	
   635		err = nfs_end_delegation_return(inode, delegation, 0);
   636		if (err) {
   637			nfs_mark_return_delegation(server, delegation);
   638			goto out_put_inode;
   639		}
   640	
   641	out_put_inode:
   642		iput(inode);
   643	out_put_delegation:
   644		nfs_put_delegation(delegation);
   645		if (err)
   646			return err;
   647		return 1; /* keep going */
   648	}
   649	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
