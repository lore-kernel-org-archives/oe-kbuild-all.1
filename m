Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2554B12E59
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 01:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708566927; cv=none; b=q/4KaxqqY+5b7tvDUrD43zIIke9QdVq5orgvSrlbrJIhP3r8S6Z9QQe3GqYd8L1UW9uXTPG35Ybs9PhcxJVs/3GQ46TkZTOEIj6wNWnsfrZTgTSS9JGc9R/a579hQSiDxSVTFFozODYuSl8bReJu3xDf9NkW77zY+aW9vI3mkZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708566927; c=relaxed/simple;
	bh=ySbDfV9/yzCQ+btTLmKMelcRoRnqWwAGIvvcb/DRMUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1Rkcl1FDZpkUTmMeYtxSBApm9fXWaKl+13A4SN6gDEou5ZrobrF1ek+B4fUcoUgcP5GJUeaiCwjqpOeKKIJW/UT0edKtygx69Jhg5DQ7wWlPvtDzCD8qBkD/k2IO6TTqzdQsPZGsO1DLfYc/jWqcQ75mSOCZEsEBigJKvMlsPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nV35Kgj0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nV35Kgj0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708566922; x=1740102922;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ySbDfV9/yzCQ+btTLmKMelcRoRnqWwAGIvvcb/DRMUw=;
  b=nV35Kgj0B9RnFp1/KCO/pc2Vr7WGh6wRTTIw9vj3lovukadIRUUCW3qI
   M2r1Qhf1UfTLK+FjLVMyJxtU7U6DXfS5LFc6t+50KmFIzit1dxeiusHjg
   cHBM6gUJRq0GqmPEW3Zc7pMRd0YFiS1aubT0JVJvFCSnVNvoon6ipj7CV
   WZzlGvC8XnSOcMgyAlWO+0xdqtLHNXwY4yDRKhfcHDS+qhKBxJbjK14OS
   clGf/RIw7SQxwTDuUZwvmpQbtOTMXlWK5/QlVyKXWQ0xr3VTctSkunICp
   DFcXHerHNXlAVhQOeg6cIw//5awPjstnwu/Z0PC5LKeOxlWcOJM6c9mpd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2624882"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2624882"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 17:55:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="36130655"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Feb 2024 17:55:15 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcyIs-0005sm-0V;
	Thu, 22 Feb 2024 01:55:14 +0000
Date: Thu, 22 Feb 2024 09:54:48 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/3] mm, slab: use an enum to define SLAB_ cache creation
 flags
Message-ID: <202402220901.BkG3ubx4-lkp@intel.com>
References: <20240220-slab-cleanup-flags-v1-2-e657e373944a@suse.cz>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-slab-cleanup-flags-v1-2-e657e373944a@suse.cz>

Hi Vlastimil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6613476e225e090cc9aad49be7fa504e290dd33d]

url:    https://github.com/intel-lab-lkp/linux/commits/Vlastimil-Babka/mm-slab-deprecate-SLAB_MEM_SPREAD-flag/20240221-005936
base:   6613476e225e090cc9aad49be7fa504e290dd33d
patch link:    https://lore.kernel.org/r/20240220-slab-cleanup-flags-v1-2-e657e373944a%40suse.cz
patch subject: [PATCH 2/3] mm, slab: use an enum to define SLAB_ cache creation flags
config: i386-randconfig-062-20240222 (https://download.01.org/0day-ci/archive/20240222/202402220901.BkG3ubx4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402220901.BkG3ubx4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402220901.BkG3ubx4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/adfs/super.c:252:64: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted slab_flags_t [usertype] flags @@     got int @@
   fs/adfs/super.c:252:64: sparse:     expected restricted slab_flags_t [usertype] flags
   fs/adfs/super.c:252:64: sparse:     got int
--
>> fs/affs/super.c:134:64: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted slab_flags_t [usertype] flags @@     got int @@
   fs/affs/super.c:134:64: sparse:     expected restricted slab_flags_t [usertype] flags
   fs/affs/super.c:134:64: sparse:     got int
--
>> fs/btrfs/transaction.c:2725:40: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted slab_flags_t [usertype] flags @@     got int @@
   fs/btrfs/transaction.c:2725:40: sparse:     expected restricted slab_flags_t [usertype] flags
   fs/btrfs/transaction.c:2725:40: sparse:     got int
   fs/btrfs/transaction.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   fs/btrfs/transaction.c: note: in included file (through arch/x86/include/generated/asm/unaligned.h, fs/btrfs/accessors.h, fs/btrfs/ctree.h):
   include/asm-generic/unaligned.h:37:16: sparse: sparse: self-comparison always evaluates to true
   fs/btrfs/transaction.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
>> fs/btrfs/inode.c:8664:64: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted slab_flags_t [usertype] flags @@     got int @@
   fs/btrfs/inode.c:8664:64: sparse:     expected restricted slab_flags_t [usertype] flags
   fs/btrfs/inode.c:8664:64: sparse:     got int
   fs/btrfs/inode.c: note: in included file (through include/linux/swait.h, include/linux/completion.h, include/linux/crypto.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   fs/btrfs/inode.c: note: in included file (through include/linux/string.h, arch/x86/include/asm/page_32.h, arch/x86/include/asm/page.h, ...):
   include/linux/err.h:41:17: sparse: sparse: self-comparison always evaluates to false
   fs/btrfs/inode.c: note: in included file (through include/linux/swait.h, include/linux/completion.h, include/linux/crypto.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
>> fs/efs/super.c:94:69: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted slab_flags_t [usertype] flags @@     got int @@
   fs/efs/super.c:94:69: sparse:     expected restricted slab_flags_t [usertype] flags
   fs/efs/super.c:94:69: sparse:     got int
--
>> fs/freevxfs/vxfs_super.c:310:45: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted slab_flags_t [usertype] flags @@     got int @@
   fs/freevxfs/vxfs_super.c:310:45: sparse:     expected restricted slab_flags_t [usertype] flags
   fs/freevxfs/vxfs_super.c:310:45: sparse:     got int
--
>> fs/jffs2/super.c:390:64: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted slab_flags_t [usertype] flags @@     got int @@
   fs/jffs2/super.c:390:64: sparse:     expected restricted slab_flags_t [usertype] flags
   fs/jffs2/super.c:390:64: sparse:     got int
--
>> fs/minix/inode.c:90:64: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted slab_flags_t [usertype] flags @@     got int @@
   fs/minix/inode.c:90:64: sparse:     expected restricted slab_flags_t [usertype] flags
   fs/minix/inode.c:90:64: sparse:     got int
--
>> fs/nilfs2/super.c:1404:45: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted slab_flags_t [usertype] flags @@     got int @@
   fs/nilfs2/super.c:1404:45: sparse:     expected restricted slab_flags_t [usertype] flags
   fs/nilfs2/super.c:1404:45: sparse:     got int
--
>> fs/qnx6/inode.c:618:64: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted slab_flags_t [usertype] flags @@     got int @@
   fs/qnx6/inode.c:618:64: sparse:     expected restricted slab_flags_t [usertype] flags
   fs/qnx6/inode.c:618:64: sparse:     got int
--
>> fs/romfs/super.c:633:74: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted slab_flags_t [usertype] flags @@     got int @@
   fs/romfs/super.c:633:74: sparse:     expected restricted slab_flags_t [usertype] flags
   fs/romfs/super.c:633:74: sparse:     got int
--
>> fs/sysv/inode.c:339:61: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted slab_flags_t [usertype] flags @@     got int @@
   fs/sysv/inode.c:339:61: sparse:     expected restricted slab_flags_t [usertype] flags
   fs/sysv/inode.c:339:61: sparse:     got int
--
>> fs/ufs/super.c:1473:70: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted slab_flags_t [usertype] flags @@     got int @@
   fs/ufs/super.c:1473:70: sparse:     expected restricted slab_flags_t [usertype] flags
   fs/ufs/super.c:1473:70: sparse:     got int

vim +252 fs/adfs/super.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  246  
894122db491350 Fabian Frederick 2014-04-07  247  static int __init init_inodecache(void)
^1da177e4c3f41 Linus Torvalds   2005-04-16  248  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  249  	adfs_inode_cachep = kmem_cache_create("adfs_inode_cache",
^1da177e4c3f41 Linus Torvalds   2005-04-16  250  					     sizeof(struct adfs_inode_info),
fffb60f93ce588 Paul Jackson     2006-03-24  251  					     0, (SLAB_RECLAIM_ACCOUNT|
5d097056c9a017 Vladimir Davydov 2016-01-14 @252  						SLAB_MEM_SPREAD|SLAB_ACCOUNT),
20c2df83d25c6a Paul Mundt       2007-07-20  253  					     init_once);
^1da177e4c3f41 Linus Torvalds   2005-04-16  254  	if (adfs_inode_cachep == NULL)
^1da177e4c3f41 Linus Torvalds   2005-04-16  255  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds   2005-04-16  256  	return 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  257  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  258  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
