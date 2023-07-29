Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC33811C8B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 12:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690634430; x=1722170430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V3HCgxqs9zQj9Mhe0ykje9elnfHchRiBf0CpfvvRJdE=;
  b=fGWyHVpIghCpNKKezjrJEv7zLeBxK6ttJI7brWpCLra2N0yhes8qLM0s
   EEOSBC0tDTY+CHw/OyCjEMUWoJNYdQnWnO3Yv3cgUcpmoMQmY7aB5Q2bC
   HBE8NjTa6Lke6pZm4s4vhnbYsAqrcQgiYeopDD4c1F5VIjZlG051r0HNN
   luT8mTlMzRzyoDEdb77k4nyizxYPQSKmr6ljedaT/P78WbgmhhMzLow7/
   UZ2Lp3Una9pY5NL9K5AGZvppTCdPMD1lFBabw9V/MQOC2lU4hqASCNy/t
   D5oxGETZLIcZ40vLLSnJ+TuUAadjQq0vSrrjVnGFlXzC91HItYI7iLZUP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="367644607"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="367644607"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 05:40:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="793191623"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="793191623"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Jul 2023 05:40:28 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPjFD-00042B-1K;
	Sat, 29 Jul 2023 12:40:27 +0000
Date: Sat, 29 Jul 2023 20:40:21 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-4.19.y 1137/6360] fs/aio.c:2066: Error: unrecognized
 opcode `csrs sstatus,s7', extension `zicsr' required
Message-ID: <202307292015.ZxoI7Cx5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   767049cead76cf699707290d5aeefb3e4d0d5b43
commit: 321fba81ec034f88aea4898993c1bf15605c023f [1137/6360] aio: fix use-after-free due to missing POLLFREE handling
config: riscv-randconfig-r042-20230728 (https://download.01.org/0day-ci/archive/20230729/202307292015.ZxoI7Cx5-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307292015.ZxoI7Cx5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307292015.ZxoI7Cx5-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   fs/aio.c:1048: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   fs/aio.c:1048: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   fs/aio.c:1960: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   fs/aio.c:1960: Error: unrecognized opcode `csrc sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   fs/aio.c:1311: Error: unrecognized opcode `csrs sstatus,s4', extension `zicsr' required
   fs/aio.c:1311: Error: unrecognized opcode `csrc sstatus,s4', extension `zicsr' required
   fs/aio.c:1325: Error: unrecognized opcode `csrs sstatus,s4', extension `zicsr' required
   fs/aio.c:1325: Error: unrecognized opcode `csrc sstatus,s4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
>> fs/aio.c:2066: Error: unrecognized opcode `csrs sstatus,s7', extension `zicsr' required
>> fs/aio.c:2066: Error: unrecognized opcode `csrc sstatus,s7', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   fs/aio.c:2141: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   fs/aio.c:2141: Error: unrecognized opcode `csrc sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required


vim +2066 fs/aio.c

d384f8b855a573 Jens Axboe      2018-11-24  2029  
67ba049f94ebe4 Al Viro         2018-05-26  2030  /* sys_io_submit:
67ba049f94ebe4 Al Viro         2018-05-26  2031   *	Queue the nr iocbs pointed to by iocbpp for processing.  Returns
67ba049f94ebe4 Al Viro         2018-05-26  2032   *	the number of iocbs queued.  May return -EINVAL if the aio_context
67ba049f94ebe4 Al Viro         2018-05-26  2033   *	specified by ctx_id is invalid, if nr is < 0, if the iocb at
67ba049f94ebe4 Al Viro         2018-05-26  2034   *	*iocbpp[0] is not properly initialized, if the operation specified
67ba049f94ebe4 Al Viro         2018-05-26  2035   *	is invalid for the file descriptor in the iocb.  May fail with
67ba049f94ebe4 Al Viro         2018-05-26  2036   *	-EFAULT if any of the data structures point to invalid data.  May
67ba049f94ebe4 Al Viro         2018-05-26  2037   *	fail with -EBADF if the file descriptor specified in the first
67ba049f94ebe4 Al Viro         2018-05-26  2038   *	iocb is invalid.  May fail with -EAGAIN if insufficient resources
67ba049f94ebe4 Al Viro         2018-05-26  2039   *	are available to queue any iocbs.  Will return 0 if nr is 0.  Will
67ba049f94ebe4 Al Viro         2018-05-26  2040   *	fail with -ENOSYS if not implemented.
67ba049f94ebe4 Al Viro         2018-05-26  2041   */
67ba049f94ebe4 Al Viro         2018-05-26  2042  SYSCALL_DEFINE3(io_submit, aio_context_t, ctx_id, long, nr,
67ba049f94ebe4 Al Viro         2018-05-26  2043  		struct iocb __user * __user *, iocbpp)
^1da177e4c3f41 Linus Torvalds  2005-04-16  2044  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  2045  	struct kioctx *ctx;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2046  	long ret = 0;
080d676de095a1 Jeff Moyer      2011-11-02  2047  	int i = 0;
9f5b9425468c85 Shaohua Li      2010-07-01  2048  	struct blk_plug plug;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2049  
^1da177e4c3f41 Linus Torvalds  2005-04-16  2050  	if (unlikely(nr < 0))
^1da177e4c3f41 Linus Torvalds  2005-04-16  2051  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2052  
^1da177e4c3f41 Linus Torvalds  2005-04-16  2053  	ctx = lookup_ioctx(ctx_id);
^1da177e4c3f41 Linus Torvalds  2005-04-16  2054  	if (unlikely(!ctx)) {
caf4167aa73bef Kent Overstreet 2013-05-07  2055  		pr_debug("EINVAL: invalid context id\n");
^1da177e4c3f41 Linus Torvalds  2005-04-16  2056  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2057  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  2058  
1da92779e2e8f3 Al Viro         2018-05-26  2059  	if (nr > ctx->nr_events)
1da92779e2e8f3 Al Viro         2018-05-26  2060  		nr = ctx->nr_events;
1da92779e2e8f3 Al Viro         2018-05-26  2061  
9f5b9425468c85 Shaohua Li      2010-07-01  2062  	blk_start_plug(&plug);
^1da177e4c3f41 Linus Torvalds  2005-04-16  2063  	for (i = 0; i < nr; i++) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  2064  		struct iocb __user *user_iocb;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2065  
67ba049f94ebe4 Al Viro         2018-05-26 @2066  		if (unlikely(get_user(user_iocb, iocbpp + i))) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  2067  			ret = -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2068  			break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2069  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  2070  
67ba049f94ebe4 Al Viro         2018-05-26  2071  		ret = io_submit_one(ctx, user_iocb, false);
^1da177e4c3f41 Linus Torvalds  2005-04-16  2072  		if (ret)
^1da177e4c3f41 Linus Torvalds  2005-04-16  2073  			break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2074  	}
9f5b9425468c85 Shaohua Li      2010-07-01  2075  	blk_finish_plug(&plug);
^1da177e4c3f41 Linus Torvalds  2005-04-16  2076  
723be6e39d1425 Kent Overstreet 2013-05-28  2077  	percpu_ref_put(&ctx->users);
^1da177e4c3f41 Linus Torvalds  2005-04-16  2078  	return i ? i : ret;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2079  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  2080  

:::::: The code at line 2066 was first introduced by commit
:::::: 67ba049f94ebe49ed557e590dd243b6db45c9aff aio: fold do_io_submit() into callers

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
