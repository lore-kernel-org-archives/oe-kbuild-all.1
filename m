Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BF11097C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 16:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0gtCae7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698509612; x=1730045612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yzSdaThkta88C3+C1lSf5fTozkN5YDI25gCaVvYL6IA=;
  b=m0gtCae7pORRmNbmo2u0wMNv6KajIK0mnzZBh91Ta/Kl7kYXlr3DdjDT
   9q2G7SMtNfOaY7jqA1t53yhsIx0Dm8nbQNd4RxhfDAjfURpQQbOJpjw5W
   hiDflP1xNmPgPWoRiV33rFenmI8c8JoZmTVjOrfA7xgQLRiClK1qG2Fhh
   2ule+rh+HVNimCK9kn6hnuBrTVe5mRrPqVv4QiaTaAAExiTtI0i5R4D0D
   7qDToKAiRFD/crO0faaVuuOx4lNNaFfeNrAOc/wFkQdkolmx9TCU5wGle
   cYOQQqHG/SOHVFduXmNzBzYGK3caSvl2Dpt8EyIuHrnbTOXe+Jbjp1gxp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="386797628"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="386797628"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 09:13:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="759878585"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="759878585"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Oct 2023 09:13:29 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwlwF-000BtX-0n;
	Sat, 28 Oct 2023 16:13:27 +0000
Date: Sun, 29 Oct 2023 00:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christoph Lameter <cl@linux-foundation.org>
Subject: kernel/fork.c:1647:9: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202310290053.ZTpFnLZn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   56567a20b22bdbf85c3e55eee3bf2bd23fa2f108
commit: e240e53ae0abb0896e0f399bdfef41c69cec3123 mm, slub: add CONFIG_SLUB_TINY
date:   11 months ago
config: x86_64-randconfig-123-20231016 (https://download.01.org/0day-ci/archive/20231029/202310290053.ZTpFnLZn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310290053.ZTpFnLZn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310290053.ZTpFnLZn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/fork.c:1310:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file [noderef] __rcu *__ret @@     got struct file *new_exe_file @@
   kernel/fork.c:1310:24: sparse:     expected struct file [noderef] __rcu *__ret
   kernel/fork.c:1310:24: sparse:     got struct file *new_exe_file
   kernel/fork.c:1310:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *[assigned] old_exe_file @@     got struct file [noderef] __rcu *[assigned] __ret @@
   kernel/fork.c:1310:22: sparse:     expected struct file *[assigned] old_exe_file
   kernel/fork.c:1310:22: sparse:     got struct file [noderef] __rcu *[assigned] __ret
   kernel/fork.c:1637:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1637:38: sparse:     expected struct refcount_struct [usertype] *r
   kernel/fork.c:1637:38: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1646:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1646:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1646:31: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/fork.c:1647:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1647:9: sparse:     expected void const *
   kernel/fork.c:1647:9: sparse:     got struct k_sigaction [noderef] __rcu *
>> kernel/fork.c:1647:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1647:9: sparse:     expected void const *
   kernel/fork.c:1647:9: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1647:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1647:9: sparse:     expected void const *
   kernel/fork.c:1647:9: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1648:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1648:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1648:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2074:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2074:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2074:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2078:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2078:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2078:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2398:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *real_parent @@     got struct task_struct * @@
   kernel/fork.c:2398:32: sparse:     expected struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:2398:32: sparse:     got struct task_struct *
   kernel/fork.c:2407:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2407:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2407:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2454:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct list_head *head @@     got struct list_head [noderef] __rcu * @@
   kernel/fork.c:2454:54: sparse:     expected struct list_head *head
   kernel/fork.c:2454:54: sparse:     got struct list_head [noderef] __rcu *
   kernel/fork.c:2476:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2476:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2476:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2497:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2497:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2497:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2524:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2524:28: sparse:     expected struct sighand_struct *sighand
   kernel/fork.c:2524:28: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/fork.c:2553:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2553:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2553:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2555:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2555:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2555:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2998:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *[assigned] parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:2998:24: sparse:     expected struct task_struct *[assigned] parent
   kernel/fork.c:2998:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:3079:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct const [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:3079:43: sparse:     expected struct refcount_struct const [usertype] *r
   kernel/fork.c:3079:43: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:2119:22: sparse: sparse: dereference of noderef expression
   kernel/fork.c: note: in included file (through include/uapi/asm-generic/bpf_perf_event.h, arch/x86/include/generated/uapi/asm/bpf_perf_event.h, ...):
   include/linux/ptrace.h:210:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:210:45: sparse:     expected struct task_struct *new_parent
   include/linux/ptrace.h:210:45: sparse:     got struct task_struct [noderef] __rcu *parent
   include/linux/ptrace.h:210:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct cred const *ptracer_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   include/linux/ptrace.h:210:62: sparse:     expected struct cred const *ptracer_cred
   include/linux/ptrace.h:210:62: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/fork.c:2452:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2453:59: sparse: sparse: dereference of noderef expression
--
>> drivers/video/fbdev/hgafb.c:496:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __iomem *[assigned] dest @@
   drivers/video/fbdev/hgafb.c:496:25: sparse:     expected void const *
   drivers/video/fbdev/hgafb.c:496:25: sparse:     got unsigned char [noderef] [usertype] __iomem *[assigned] dest
>> drivers/video/fbdev/hgafb.c:496:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __iomem *[assigned] src @@
   drivers/video/fbdev/hgafb.c:496:25: sparse:     expected void const *
   drivers/video/fbdev/hgafb.c:496:25: sparse:     got unsigned char [noderef] [usertype] __iomem *[assigned] src
>> drivers/video/fbdev/hgafb.c:496:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __iomem *[assigned] dest @@
   drivers/video/fbdev/hgafb.c:496:25: sparse:     expected void const *
   drivers/video/fbdev/hgafb.c:496:25: sparse:     got unsigned char [noderef] [usertype] __iomem *[assigned] dest
>> drivers/video/fbdev/hgafb.c:496:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __iomem *[assigned] src @@
   drivers/video/fbdev/hgafb.c:496:25: sparse:     expected void const *
   drivers/video/fbdev/hgafb.c:496:25: sparse:     got unsigned char [noderef] [usertype] __iomem *[assigned] src
>> drivers/video/fbdev/hgafb.c:496:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __iomem *[assigned] dest @@
   drivers/video/fbdev/hgafb.c:496:25: sparse:     expected void const *
   drivers/video/fbdev/hgafb.c:496:25: sparse:     got unsigned char [noderef] [usertype] __iomem *[assigned] dest
>> drivers/video/fbdev/hgafb.c:496:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got unsigned char [noderef] [usertype] __iomem *[assigned] dest @@
   drivers/video/fbdev/hgafb.c:496:25: sparse:     expected void *
   drivers/video/fbdev/hgafb.c:496:25: sparse:     got unsigned char [noderef] [usertype] __iomem *[assigned] dest
   drivers/video/fbdev/hgafb.c:496:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __iomem *[assigned] src @@
   drivers/video/fbdev/hgafb.c:496:25: sparse:     expected void const *
   drivers/video/fbdev/hgafb.c:496:25: sparse:     got unsigned char [noderef] [usertype] __iomem *[assigned] src
   drivers/video/fbdev/hgafb.c:507:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __iomem *[assigned] dest @@
   drivers/video/fbdev/hgafb.c:507:25: sparse:     expected void const *
   drivers/video/fbdev/hgafb.c:507:25: sparse:     got unsigned char [noderef] [usertype] __iomem *[assigned] dest
   drivers/video/fbdev/hgafb.c:507:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __iomem *[assigned] src @@
   drivers/video/fbdev/hgafb.c:507:25: sparse:     expected void const *
   drivers/video/fbdev/hgafb.c:507:25: sparse:     got unsigned char [noderef] [usertype] __iomem *[assigned] src
   drivers/video/fbdev/hgafb.c:507:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __iomem *[assigned] dest @@
   drivers/video/fbdev/hgafb.c:507:25: sparse:     expected void const *
   drivers/video/fbdev/hgafb.c:507:25: sparse:     got unsigned char [noderef] [usertype] __iomem *[assigned] dest
   drivers/video/fbdev/hgafb.c:507:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __iomem *[assigned] src @@
   drivers/video/fbdev/hgafb.c:507:25: sparse:     expected void const *
   drivers/video/fbdev/hgafb.c:507:25: sparse:     got unsigned char [noderef] [usertype] __iomem *[assigned] src
   drivers/video/fbdev/hgafb.c:507:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __iomem *[assigned] dest @@
   drivers/video/fbdev/hgafb.c:507:25: sparse:     expected void const *
   drivers/video/fbdev/hgafb.c:507:25: sparse:     got unsigned char [noderef] [usertype] __iomem *[assigned] dest
   drivers/video/fbdev/hgafb.c:507:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got unsigned char [noderef] [usertype] __iomem *[assigned] dest @@
   drivers/video/fbdev/hgafb.c:507:25: sparse:     expected void *
   drivers/video/fbdev/hgafb.c:507:25: sparse:     got unsigned char [noderef] [usertype] __iomem *[assigned] dest
   drivers/video/fbdev/hgafb.c:507:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __iomem *[assigned] src @@
   drivers/video/fbdev/hgafb.c:507:25: sparse:     expected void const *
   drivers/video/fbdev/hgafb.c:507:25: sparse:     got unsigned char [noderef] [usertype] __iomem *[assigned] src
--
>> drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse:     expected void const *
   drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse:     got void [noderef] __iomem *
>> drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse:     expected void const *
   drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse:     expected void const *
   drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse:     expected void const *
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse:     expected void const *
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse:     expected void const *
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse:     expected void const *
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse:     expected void const *
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse:     expected void const *
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse:     got void [noderef] __iomem *
>> drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse:     expected void *
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse:     got void [noderef] __iomem *

vim +1647 kernel/fork.c

a016f3389c0660 JANAK DESAI        2006-02-07  1631  
a39bc51691a0c8 Alexey Dobriyan    2007-10-18  1632  static int copy_sighand(unsigned long clone_flags, struct task_struct *tsk)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1633  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1634  	struct sighand_struct *sig;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1635  
60348802e9cb13 Zhaolei            2009-01-06  1636  	if (clone_flags & CLONE_SIGHAND) {
d036bda7d0e726 Elena Reshetova    2019-01-18  1637  		refcount_inc(&current->sighand->count);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1638  		return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1639  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1640  	sig = kmem_cache_alloc(sighand_cachep, GFP_KERNEL);
0c282b068eb26d Madhuparna Bhowmik 2020-01-27  1641  	RCU_INIT_POINTER(tsk->sighand, sig);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1642  	if (!sig)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1643  		return -ENOMEM;
9d7fb04276481c Peter Zijlstra     2015-06-30  1644  
d036bda7d0e726 Elena Reshetova    2019-01-18  1645  	refcount_set(&sig->count, 1);
06e62a46bbba20 Jann Horn          2018-08-21  1646  	spin_lock_irq(&current->sighand->siglock);
^1da177e4c3f41 Linus Torvalds     2005-04-16 @1647  	memcpy(sig->action, current->sighand->action, sizeof(sig->action));
06e62a46bbba20 Jann Horn          2018-08-21  1648  	spin_unlock_irq(&current->sighand->siglock);
b612e5df4587c9 Christian Brauner  2019-10-14  1649  
b612e5df4587c9 Christian Brauner  2019-10-14  1650  	/* Reset all signal handler not set to SIG_IGN to SIG_DFL. */
b612e5df4587c9 Christian Brauner  2019-10-14  1651  	if (clone_flags & CLONE_CLEAR_SIGHAND)
b612e5df4587c9 Christian Brauner  2019-10-14  1652  		flush_signal_handlers(tsk, 0);
b612e5df4587c9 Christian Brauner  2019-10-14  1653  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1654  	return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1655  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  1656  

:::::: The code at line 1647 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
