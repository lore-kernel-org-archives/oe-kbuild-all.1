Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FF517F2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 02:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VC2s86m7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697338347; x=1728874347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T38iPn4QowIZj38APxQ7C2rVzgNZ91IRvo6l8Sg5hUo=;
  b=VC2s86m74fSHMm/dKm4FSY3axIIxKZZLH/EnSRD0COZfKes9coaqoXe7
   klNtD59dW7qobD+JXJWe/RRES12vgb3gQFMn8pISRd9BGSSg9lFr29hhf
   Rxd1Ndb1CrvulAiWisgAEtlLBBKQN1fViUUCYy3tCWuvVRT6QazGbzeOz
   j/PxexVwn+Cubk1EYZ9zCythM0jPRag9QbGqM2XK5/mZXiOcMBkiOX329
   QYHqrYuJ5kosYudkg1Q+OCZMClBbgzKyCkmUvqg7vcdQd1E7eg5dVft8U
   e92nOL7MZD/vw27ModShZhBCcs3lUUudZzznq72gNe8xjh/VO0uS40wno
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389220937"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="389220937"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 19:52:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="705144334"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="705144334"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Oct 2023 19:52:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrrEn-0006xM-1G;
	Sun, 15 Oct 2023 02:52:17 +0000
Date: Sun, 15 Oct 2023 10:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: arch/um/kernel/skas/uaccess.c:269: warning: Function parameter or
 member 'op' not described in 'arch_futex_atomic_op_inuser'
Message-ID: <202310151047.a07DrQNV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc9b2e683bcba017588b9aaad80f442ad004a48f
commit: dd3035a21ba7ccaa883d7107d357ad06320d78fc um: add a UML specific futex implementation
date:   2 years, 4 months ago
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231015/202310151047.a07DrQNV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151047.a07DrQNV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151047.a07DrQNV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/um/kernel/skas/uaccess.c:269: warning: Function parameter or member 'op' not described in 'arch_futex_atomic_op_inuser'
>> arch/um/kernel/skas/uaccess.c:269: warning: Function parameter or member 'oparg' not described in 'arch_futex_atomic_op_inuser'
>> arch/um/kernel/skas/uaccess.c:269: warning: Function parameter or member 'oval' not described in 'arch_futex_atomic_op_inuser'
>> arch/um/kernel/skas/uaccess.c:269: warning: Excess function parameter 'encoded_op' description in 'arch_futex_atomic_op_inuser'


vim +269 arch/um/kernel/skas/uaccess.c

   252	
   253	/**
   254	 * arch_futex_atomic_op_inuser() - Atomic arithmetic operation with constant
   255	 *			  argument and comparison of the previous
   256	 *			  futex value with another constant.
   257	 *
   258	 * @encoded_op:	encoded operation to execute
   259	 * @uaddr:	pointer to user space address
   260	 *
   261	 * Return:
   262	 * 0 - On success
   263	 * -EFAULT - User access resulted in a page fault
   264	 * -EAGAIN - Atomic operation was unable to complete due to contention
   265	 * -ENOSYS - Operation not supported
   266	 */
   267	
   268	int arch_futex_atomic_op_inuser(int op, u32 oparg, int *oval, u32 __user *uaddr)
 > 269	{
   270		int oldval, ret;
   271		struct page *page;
   272		unsigned long addr = (unsigned long) uaddr;
   273		pte_t *pte;
   274	
   275		ret = -EFAULT;
   276		if (!access_ok(uaddr, sizeof(*uaddr)))
   277			return -EFAULT;
   278		preempt_disable();
   279		pte = maybe_map(addr, 1);
   280		if (pte == NULL)
   281			goto out_inuser;
   282	
   283		page = pte_page(*pte);
   284	#ifdef CONFIG_64BIT
   285		pagefault_disable();
   286		addr = (unsigned long) page_address(page) +
   287				(((unsigned long) addr) & ~PAGE_MASK);
   288	#else
   289		addr = (unsigned long) kmap_atomic(page) +
   290			((unsigned long) addr & ~PAGE_MASK);
   291	#endif
   292		uaddr = (u32 *) addr;
   293		oldval = *uaddr;
   294	
   295		ret = 0;
   296	
   297		switch (op) {
   298		case FUTEX_OP_SET:
   299			*uaddr = oparg;
   300			break;
   301		case FUTEX_OP_ADD:
   302			*uaddr += oparg;
   303			break;
   304		case FUTEX_OP_OR:
   305			*uaddr |= oparg;
   306			break;
   307		case FUTEX_OP_ANDN:
   308			*uaddr &= ~oparg;
   309			break;
   310		case FUTEX_OP_XOR:
   311			*uaddr ^= oparg;
   312			break;
   313		default:
   314			ret = -ENOSYS;
   315		}
   316	#ifdef CONFIG_64BIT
   317		pagefault_enable();
   318	#else
   319		kunmap_atomic((void *)addr);
   320	#endif
   321	
   322	out_inuser:
   323		preempt_enable();
   324	
   325		if (ret == 0)
   326			*oval = oldval;
   327	
   328		return ret;
   329	}
   330	EXPORT_SYMBOL(arch_futex_atomic_op_inuser);
   331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
