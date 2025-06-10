Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7216D1442E8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 04:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749531322; cv=none; b=VAo3yRQqsA1rr+y9AwaOWgawGEHLXqDG8zh0ZeRkmcbVZAcm56E86TJcAi8LPQrG0ozyj1kCOwThy/l+QLuqWfTOqIddVjFkddW6wIz/KB8a35mhkpPj1vcZxg1aTwg9XPCnVgXd0aO13TOe2UedkqpJ6HJToolBSKFojNpc9zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749531322; c=relaxed/simple;
	bh=fM2AlIvuDJqZmoT0Q/b7VJTI1Y82nmQvLWR1P6i+qIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FESn8oZ5x9YP98J+Nhi6b00fKD5U19+7eg7jJ3oL+hlfhBna6POw3cBxf4vpsXuF56P7MvhTGbmJjpEjzQUSaxZ+SWx3awZG7TCLpT5KtGWPJFaPEM0DHR8GdIgtjqpo3+sW97+cBL+YQsquAwYk5El4TRDrT0IhsWQdBN55ByA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPFuwdC9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPFuwdC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749531320; x=1781067320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fM2AlIvuDJqZmoT0Q/b7VJTI1Y82nmQvLWR1P6i+qIs=;
  b=UPFuwdC93DbcvgyAoH2ztyS6Ua0tUm4fP8TVBe3A5qdE64WpVxIrhNAy
   iI8ssvHo6FJUvjQoiRz4ZuU9RTbQKH/wPxDOg0mvSv20klRRRvcW3lSuQ
   XyT94BhZwrxedMH5k3QAUCAPR9m+ERkReETLES1BzLeAtJh7Ib7b/hGEw
   hsRZSOWrYTwfAJYfb+PIMttkodjlfMRhMx5oMcUmMdHjc3X15eC3VpH9A
   6E/nsIdVBsMb7Udol/94o+VwJS2sA2Cup2LT96/oJkYWQUpEymeWul7f7
   fnPzWLTgGI8YSBfHChp5u/ZQEAPJC7IAFwO5SZf+Zkb1KthMWMNRHO+2N
   Q==;
X-CSE-ConnectionGUID: SdDVBJ0USn+FMiKKf2bs5Q==
X-CSE-MsgGUID: km5FIPUZQGyswnvAqsA0Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="62236845"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="62236845"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 21:55:20 -0700
X-CSE-ConnectionGUID: lf4VadeuQimSFG5X1U6Ebg==
X-CSE-MsgGUID: 8yyqKRKQQL2lLnOJTJ7gDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="150560287"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jun 2025 21:55:20 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOr13-0007mD-0B;
	Tue, 10 Jun 2025 04:55:17 +0000
Date: Tue, 10 Jun 2025 12:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build 42/62] crypto/xor.c:107: Error: bad or
 irreducible absolute expression
Message-ID: <202506101208.3SlGYjET-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   9936d838805eed652db144cfa0f44ba3ec967dbe
commit: adee8c9238d58cd7c6e5dcd4dca255ef72da4cac [42/62] x86/alternative: Define ELF section entry size for alternatives
config: um-randconfig-001-20250610 (https://download.01.org/0day-ci/archive/20250610/202506101208.3SlGYjET-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506101208.3SlGYjET-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101208.3SlGYjET-lkp@intel.com/

All errors (new ones prefixed by >>):

   crypto/xor.c: Assembler messages:
>> crypto/xor.c:107: Error: bad or irreducible absolute expression
   crypto/xor.c:109: Error: bad or irreducible absolute expression
--
   lib/klist.c: Assembler messages:
>> lib/klist.c:204: Error: bad or irreducible absolute expression
--
   include/linux/virtio_ring.h: Assembler messages:
>> include/linux/virtio_ring.h:35: Error: bad or irreducible absolute expression
   include/linux/virtio_ring.h:37: Error: bad or irreducible absolute expression
   include/linux/virtio_ring.h:43: Error: bad or irreducible absolute expression
   include/linux/virtio_ring.h:45: Error: bad or irreducible absolute expression
   include/linux/virtio_ring.h:51: Error: bad or irreducible absolute expression
   include/linux/virtio_ring.h:53: Error: bad or irreducible absolute expression
>> drivers/virtio/virtio_ring.c:955: Error: bad or irreducible absolute expression
>> drivers/virtio/virtio_ring.c:955: Error: bad or irreducible absolute expression
   drivers/virtio/virtio_ring.c:866: Error: bad or irreducible absolute expression
   drivers/virtio/virtio_ring.c:866: Error: bad or irreducible absolute expression
   drivers/virtio/virtio_ring.c:1793: Error: bad or irreducible absolute expression
   drivers/virtio/virtio_ring.c:1793: Error: bad or irreducible absolute expression
--
   drivers/scsi/scsi.c: Assembler messages:
>> drivers/scsi/scsi.c:230: Error: bad or irreducible absolute expression
--
   net/dsa/conduit.c: Assembler messages:
>> net/dsa/conduit.c:413: Error: bad or irreducible absolute expression
   net/dsa/conduit.c:449: Error: bad or irreducible absolute expression
--
   net/dsa/user.c: Assembler messages:
>> net/dsa/user.c:3447: Error: bad or irreducible absolute expression
--
   drivers/hwspinlock/hwspinlock_core.c: Assembler messages:
>> drivers/hwspinlock/hwspinlock_core.c:292: Error: bad or irreducible absolute expression
   drivers/hwspinlock/hwspinlock_core.c:173: Error: bad or irreducible absolute expression
--
   net/mac80211/util.c: Assembler messages:
>> net/mac80211/util.c:2218: Error: bad or irreducible absolute expression
--
   net/mac80211/pm.c: Assembler messages:
>> net/mac80211/pm.c:38: Error: bad or irreducible absolute expression
   net/mac80211/pm.c:74: Error: bad or irreducible absolute expression
--
   drivers/tty/hvc/hvc_console.c: Assembler messages:
>> drivers/tty/hvc/hvc_console.c:807: Error: bad or irreducible absolute expression
--
   net/sunrpc/svcsock.c: Assembler messages:
>> net/sunrpc/svcsock.c:399: Error: bad or irreducible absolute expression
   net/sunrpc/svcsock.c:859: Error: bad or irreducible absolute expression
   net/sunrpc/svcsock.c:380: Error: bad or irreducible absolute expression
   net/sunrpc/svcsock.c:1421: Error: bad or irreducible absolute expression
   net/sunrpc/svcsock.c:875: Error: bad or irreducible absolute expression
..


vim +107 crypto/xor.c

^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16   81  
af7cf25dd15b74 crypto/xor.c     Jan Beulich       2012-10-11   82  static void __init
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16   83  do_xor_speed(struct xor_block_template *tmpl, void *b1, void *b2)
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16   84  {
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16   85  	int speed;
ab9a244c396aae crypto/xor.c     Helge Deller      2024-07-08   86  	unsigned long reps;
ab9a244c396aae crypto/xor.c     Helge Deller      2024-07-08   87  	ktime_t min, start, t0;
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16   88  
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16   89  	tmpl->next = template_list;
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16   90  	template_list = tmpl;
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16   91  
56a519913eeba2 crypto/xor.c     Jim Kukunas       2012-05-22   92  	preempt_disable();
56a519913eeba2 crypto/xor.c     Jim Kukunas       2012-05-22   93  
ab9a244c396aae crypto/xor.c     Helge Deller      2024-07-08   94  	reps = 0;
ab9a244c396aae crypto/xor.c     Helge Deller      2024-07-08   95  	t0 = ktime_get();
ab9a244c396aae crypto/xor.c     Helge Deller      2024-07-08   96  	/* delay start until time has advanced */
ab9a244c396aae crypto/xor.c     Helge Deller      2024-07-08   97  	while ((start = ktime_get()) == t0)
ab9a244c396aae crypto/xor.c     Helge Deller      2024-07-08   98  		cpu_relax();
ab9a244c396aae crypto/xor.c     Helge Deller      2024-07-08   99  	do {
cfb28fde083761 crypto/xor.c     Bhaskar Chowdhury 2021-02-03  100  		mb(); /* prevent loop optimization */
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16  101  		tmpl->do_2(BENCH_SIZE, b1, b2);
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16  102  		mb();
ab9a244c396aae crypto/xor.c     Helge Deller      2024-07-08  103  	} while (reps++ < REPS || (t0 = ktime_get()) == start);
ab9a244c396aae crypto/xor.c     Helge Deller      2024-07-08  104  	min = ktime_sub(t0, start);
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16  105  
56a519913eeba2 crypto/xor.c     Jim Kukunas       2012-05-22  106  	preempt_enable();
56a519913eeba2 crypto/xor.c     Jim Kukunas       2012-05-22 @107  
c055e3eae0f133 crypto/xor.c     Ard Biesheuvel    2020-09-26  108  	// bytes/ns == GB/s, multiply by 1000 to get MB/s [not MiB/s]
ab9a244c396aae crypto/xor.c     Helge Deller      2024-07-08  109  	speed = (1000 * reps * BENCH_SIZE) / (unsigned int)ktime_to_ns(min);
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16  110  	tmpl->speed = speed;
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16  111  
c055e3eae0f133 crypto/xor.c     Ard Biesheuvel    2020-09-26  112  	pr_info("   %-16s: %5d MB/sec\n", tmpl->name, speed);
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16  113  }
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16  114  

:::::: The code at line 107 was first introduced by commit
:::::: 56a519913eeba2bdae4d7ee39e80fab442c3836c crypto: disable preemption while benchmarking RAID5 xor checksumming

:::::: TO: Jim Kukunas <james.t.kukunas@linux.intel.com>
:::::: CC: NeilBrown <neilb@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
