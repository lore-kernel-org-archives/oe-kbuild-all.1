Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB1D1111
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 02:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694139887; x=1725675887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+wzu8BfYSfg11uHqJVQ5NMhOnQJk1vFjJ8Z+3g/FyhE=;
  b=HCrIBR5pztEzN/7c7n+1kb+eatyNVdWExmlHpXQpGRf/Nhmi/gQK9QIm
   oM58fv4L6+lrSBv0y4Wgpc6UQiEPVjYFMhact3Onpm3iu2iTynOdWWzLv
   YzyjrPCT2fFIYJRTBNywEsYbY9SjAVpVnVPygOjShIDK/w++ZvgkIMonN
   65K2v7/PZ3LBrSfAXNbrTT0S1d0prGPj6mwm4yAHBtlOXCRwpp2VZW90/
   nLaGfpso2NzH1lUTwiyBomcVQCP3PRHaIinlcvSISUHmbtXjNGO8brisA
   63TUXpQyQq4SjNOYgBB3DZW9B8f7nk76AXOm9fkElX+SMwq1iQbJRAa9q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="362597255"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="362597255"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 19:24:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="807781843"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="807781843"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Sep 2023 19:24:45 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeRAo-0001pu-2T;
	Fri, 08 Sep 2023 02:24:42 +0000
Date: Fri, 8 Sep 2023 10:23:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 37/158] fs/eventfd.c:256: Error:
 unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
Message-ID: <202309081050.ka8LgFjY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   3670031ae40da69ea29430c1c142bac591685999
commit: 79ad75ccb7d41a8c8d894bae1d8433e58627810c [37/158] eventfd: Export eventfd_ctx_do_read()
config: riscv-randconfig-r003-20230907 (https://download.01.org/0day-ci/archive/20230908/202309081050.ka8LgFjY-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309081050.ka8LgFjY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309081050.ka8LgFjY-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required
>> fs/eventfd.c:256: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
>> fs/eventfd.c:256: Error: unrecognized opcode `csrc sstatus,a3', extension `zicsr' required


vim +256 fs/eventfd.c

cb289d6244a37c Davide Libenzi 2010-01-13  214  
b6364572d641c8 Eric Biggers   2018-01-06  215  static ssize_t eventfd_read(struct file *file, char __user *buf, size_t count,
b6364572d641c8 Eric Biggers   2018-01-06  216  			    loff_t *ppos)
e1ad7468c77ddb Davide Libenzi 2007-05-10  217  {
b6364572d641c8 Eric Biggers   2018-01-06  218  	struct eventfd_ctx *ctx = file->private_data;
e1ad7468c77ddb Davide Libenzi 2007-05-10  219  	ssize_t res;
b6364572d641c8 Eric Biggers   2018-01-06  220  	__u64 ucnt = 0;
e1ad7468c77ddb Davide Libenzi 2007-05-10  221  	DECLARE_WAITQUEUE(wait, current);
e1ad7468c77ddb Davide Libenzi 2007-05-10  222  
b6364572d641c8 Eric Biggers   2018-01-06  223  	if (count < sizeof(ucnt))
b6364572d641c8 Eric Biggers   2018-01-06  224  		return -EINVAL;
b6364572d641c8 Eric Biggers   2018-01-06  225  
d48eb233159522 Davide Libenzi 2007-05-18  226  	spin_lock_irq(&ctx->wqh.lock);
e1ad7468c77ddb Davide Libenzi 2007-05-10  227  	res = -EAGAIN;
bcd0b235bf3808 Davide Libenzi 2009-03-31  228  	if (ctx->count > 0)
b6364572d641c8 Eric Biggers   2018-01-06  229  		res = sizeof(ucnt);
b6364572d641c8 Eric Biggers   2018-01-06  230  	else if (!(file->f_flags & O_NONBLOCK)) {
e1ad7468c77ddb Davide Libenzi 2007-05-10  231  		__add_wait_queue(&ctx->wqh, &wait);
cb289d6244a37c Davide Libenzi 2010-01-13  232  		for (;;) {
e1ad7468c77ddb Davide Libenzi 2007-05-10  233  			set_current_state(TASK_INTERRUPTIBLE);
e1ad7468c77ddb Davide Libenzi 2007-05-10  234  			if (ctx->count > 0) {
b6364572d641c8 Eric Biggers   2018-01-06  235  				res = sizeof(ucnt);
e1ad7468c77ddb Davide Libenzi 2007-05-10  236  				break;
e1ad7468c77ddb Davide Libenzi 2007-05-10  237  			}
e1ad7468c77ddb Davide Libenzi 2007-05-10  238  			if (signal_pending(current)) {
e1ad7468c77ddb Davide Libenzi 2007-05-10  239  				res = -ERESTARTSYS;
e1ad7468c77ddb Davide Libenzi 2007-05-10  240  				break;
e1ad7468c77ddb Davide Libenzi 2007-05-10  241  			}
d48eb233159522 Davide Libenzi 2007-05-18  242  			spin_unlock_irq(&ctx->wqh.lock);
e1ad7468c77ddb Davide Libenzi 2007-05-10  243  			schedule();
d48eb233159522 Davide Libenzi 2007-05-18  244  			spin_lock_irq(&ctx->wqh.lock);
e1ad7468c77ddb Davide Libenzi 2007-05-10  245  		}
e1ad7468c77ddb Davide Libenzi 2007-05-10  246  		__remove_wait_queue(&ctx->wqh, &wait);
e1ad7468c77ddb Davide Libenzi 2007-05-10  247  		__set_current_state(TASK_RUNNING);
e1ad7468c77ddb Davide Libenzi 2007-05-10  248  	}
b6364572d641c8 Eric Biggers   2018-01-06  249  	if (likely(res > 0)) {
b6364572d641c8 Eric Biggers   2018-01-06  250  		eventfd_ctx_do_read(ctx, &ucnt);
e1ad7468c77ddb Davide Libenzi 2007-05-10  251  		if (waitqueue_active(&ctx->wqh))
a9a08845e9acbd Linus Torvalds 2018-02-11  252  			wake_up_locked_poll(&ctx->wqh, EPOLLOUT);
e1ad7468c77ddb Davide Libenzi 2007-05-10  253  	}
d48eb233159522 Davide Libenzi 2007-05-18  254  	spin_unlock_irq(&ctx->wqh.lock);
e1ad7468c77ddb Davide Libenzi 2007-05-10  255  
b6364572d641c8 Eric Biggers   2018-01-06 @256  	if (res > 0 && put_user(ucnt, (__u64 __user *)buf))
b6364572d641c8 Eric Biggers   2018-01-06  257  		return -EFAULT;
cb289d6244a37c Davide Libenzi 2010-01-13  258  
cb289d6244a37c Davide Libenzi 2010-01-13  259  	return res;
cb289d6244a37c Davide Libenzi 2010-01-13  260  }
e1ad7468c77ddb Davide Libenzi 2007-05-10  261  

:::::: The code at line 256 was first introduced by commit
:::::: b6364572d641c8eba9eab9bcc31d8962f96ddf15 eventfd: fold eventfd_ctx_read() into eventfd_read()

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
