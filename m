Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E4C4A2052
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 17:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791306920; cv=none; b=e5oOJBx78wskDhri4xsnN3ukzw+H7qZzqfp4hQUc5c2cSkLL1LBQqmrFj6tZ3Jm67XGCpkmKHMZJvggwGzpdOUolFmWcvbdFySAxopNBhf/jHp0i7aZdY83KRhOYz7HfX51Uz9kKkchu8EcIW0cWK5arlB7MPk+0q7np2N9NyH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791306920; c=relaxed/simple;
	bh=JYkNKXcUtsgJ0OcqV8EAUO3TdP+wzZrwAVMa6aJ7u8U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nyKvCN4A48fIIbZW9aKCn2MGkyDRGmsoAIzkvTsETd/CeOEixM63Hjs6tX3bPZt1cEP1e55X9KPAU2vI40CqvK/unHqgczN1VMtP4MbAMzOezSIkNdNEdCHIYE8yIfnNsLh+IB/uogoX2zcpqgZDYknyP0YJzgOJd4nQV/4c5zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lV5mN++g; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lV5mN++g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791306917; x=1822842917;
  h=date:from:to:cc:subject:message-id;
  bh=JYkNKXcUtsgJ0OcqV8EAUO3TdP+wzZrwAVMa6aJ7u8U=;
  b=lV5mN++gVdLZ7eW1TWSBeGEg8/hh/Njqg26XtDTF+IvkvFIFMznZ1D0G
   Mm1yK/PWBBDbbIr9+ahOf1nZNxSWXsy0Zdiwp+MWB43I8NGD//1xBq+uk
   rd2XkHP9q7Ea2sZ+0hDru1J5LkY59eiPoARxalcFYCLFBSMIAnxcZTumb
   BWN2dbHPEqFXVDSRfjlbl5rrCPX0/a4s/UIFKrIIEJRogbp+kIx1v5icM
   q6mI55ITbIlJ0RNOJw1yQoX4lLBfQRzteCk0AyGr72mgJ49sKhVc+km5c
   xXIdZdyY4FefD5R5tBnEfp8i3/oxixouOLB5hICd5PdAiYybIWH7H4imb
   A==;
X-CSE-ConnectionGUID: eguljaW/T6OjoCrpc2zhxQ==
X-CSE-MsgGUID: VDgWCshDS+uNrUjHb96GCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="109497444"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="109497444"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 10:15:15 -0700
X-CSE-ConnectionGUID: z5k+y9dqQXCxiiwtjbyPMg==
X-CSE-MsgGUID: Am36WP0HStWdxUrZB+DSjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="1232408"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 06 Oct 2026 10:15:14 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE8ky-000000001Xj-1EvY;
	Tue, 06 Oct 2026 17:15:12 +0000
Date: Tue, 06 Oct 2026 19:14:31 +0200
From: kernel test robot <lkp@intel.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <kees@kernel.org>
Subject: [linux-next:master 6998/14724] fs/signalfd.c:53:40: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202610061907.TNooP59U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   eea3fef32a9cf36abcb5975a5a594e4135a6b026
commit: d72e0fb3b00c6a1146bcfd7186ad9f6f609ba236 [6998/14724] signalfd: don't dequeue the forced fatal signals
config: sh-randconfig-r2306-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061907.TNooP59U-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061907.TNooP59U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061907.TNooP59U-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/signalfd.c:53:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct k_sigaction *k @@     got struct k_sigaction [noderef] __rcu * @@
   fs/signalfd.c:53:40: sparse:     expected struct k_sigaction *k
   fs/signalfd.c:53:40: sparse:     got struct k_sigaction [noderef] __rcu *
   fs/signalfd.c:69:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct wait_queue_head [usertype] *wait_address @@     got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:69:33: sparse:     expected struct wait_queue_head [usertype] *wait_address
   fs/signalfd.c:69:33: sparse:     got struct wait_queue_head [noderef] __rcu *
   fs/signalfd.c:71:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:71:31: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:71:31: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:76:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:76:33: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:76:33: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:110:32: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:128:33: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:131:33: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:135:33: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:151:32: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:155:38: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:175:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:175:31: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:175:31: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:185:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:185:41: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:185:41: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:189:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:189:32: sparse:     expected struct wait_queue_head *wq_head
   fs/signalfd.c:189:32: sparse:     got struct wait_queue_head [noderef] __rcu *
   fs/signalfd.c:199:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:199:41: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:199:41: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:201:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:201:39: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:201:39: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:204:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:204:33: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:204:33: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:206:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:206:35: sparse:     expected struct wait_queue_head *wq_head
   fs/signalfd.c:206:35: sparse:     got struct wait_queue_head [noderef] __rcu *
   fs/signalfd.c:305:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:305:39: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:305:39: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:307:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:307:41: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:307:41: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:309:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:309:17: sparse:     expected struct wait_queue_head *wq_head
   fs/signalfd.c:309:17: sparse:     got struct wait_queue_head [noderef] __rcu *

vim +53 fs/signalfd.c

    50	
    51	static void refine_sigmask(struct signalfd_ctx *ctx, sigset_t *sigmask)
    52	{
  > 53		struct k_sigaction *k = current->sighand->action;
    54		int n;
    55	
    56		*sigmask = ctx->sigmask;
    57		for (n = 1; n <= _NSIG; ++n, ++k) {
    58			if (k->sa.sa_flags & SA_IMMUTABLE)
    59				sigaddset(sigmask, n);
    60		}
    61	}
    62	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
