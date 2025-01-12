Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BF51E4B2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736692738; cv=none; b=EgHBbkYg8OstmpVXZ5h5C7eel0y/wCJ6W+mbAR4OEq+KPVCSP9MDq6kC5Lfp/5qrMRwptw7W7xrJ764ZZPC5bMvlt7pMlyAl5EP2DO9OR3D7iP3Yh1/WP5V4q3AdpkeJc8Cu21uw6THoCuatvPQqcH26FoYJIflJ+eKoXHfVHn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736692738; c=relaxed/simple;
	bh=Wtw82ugLQf8t2/9vA4n9bX2ossXN2pf0pWBe64ecD+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lo9rPodm2ctQB6+vEsucERcSPqNiOulPqTl5tZyv95J2JYSWbcBIo4ehKNGeZ/Yt6u7VeA2P+/gf5f4B0euw4vHE9dZttXrScF8V3nRbaqZziFPKNUZWual4BoNJtpA1pmXZiBU5TJLR6nBOGlotfvtsCwYG5rbVVYLum4qt+cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L58mQlK1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L58mQlK1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736692737; x=1768228737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wtw82ugLQf8t2/9vA4n9bX2ossXN2pf0pWBe64ecD+M=;
  b=L58mQlK18N4npQtRLlHqotwr85xSmhzPnJZoidOrDarVWSUWSXsg9qwe
   hnSXwJWC9jWZsln+RbQ5l8wNMfCTmfP7dlMAr93KYg0aLLehm8kpBt47v
   JTOnmxDTVBa0XBWZdBeHdz1ZUBE6aL+3czhPxMGC+WOrBI1P1W2FQnFRd
   jDoAUywFO4QOWB1ylP/M9Uu5T6baDkOf4/W+PL9xpuuGEEjcCyiVApgRQ
   0t9WkaP7r2xtS1OJQ6owoHp6hrUR+GBy6zix/NJDRbwmULHk60K4Lrol5
   85ZRVm0Pkq0VUMljCpICXJCX24j/4h8KBN+kcCAqoQpWlIAFeSIq5XWKw
   A==;
X-CSE-ConnectionGUID: adFdw0PGQHuqBuP/EkCFZg==
X-CSE-MsgGUID: X5uR23f0QBWtLxNeXgBPOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="40604055"
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="40604055"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 06:38:56 -0800
X-CSE-ConnectionGUID: BARbluybQ0GcY7k1tutxGA==
X-CSE-MsgGUID: ccUeTvceRw20g9nx0kBbgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="104249845"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jan 2025 06:38:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWz76-000M2X-1e;
	Sun, 12 Jan 2025 14:38:52 +0000
Date: Sun, 12 Jan 2025 22:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 171/173] kernel/kthread.c:913: warning:
 expecting prototype for kthread_create_worker_on_node(). Prototype was for
 kthread_create_worker() instead
Message-ID: <202501122249.upmy4970-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   dfbe2aeb5ed491cb9f0a2de5a7ad9a9d4d477a8f
commit: 1bc3c5db9becd0171108c2dcfaf7ef5ef10c1e03 [171/173] kthread: modify kernel-doc function name to match code
config: i386-buildonly-randconfig-001-20250112 (https://download.01.org/0day-ci/archive/20250112/202501122249.upmy4970-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501122249.upmy4970-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501122249.upmy4970-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/kthread.c:913: warning: expecting prototype for kthread_create_worker_on_node(). Prototype was for kthread_create_worker() instead


vim +913 kernel/kthread.c

fbae2d44aa1df7 Petr Mladek  2016-10-11  901  
fbae2d44aa1df7 Petr Mladek  2016-10-11  902  /**
1bc3c5db9becd0 Randy Dunlap 2025-01-10  903   * kthread_create_worker_on_node - create a kthread worker
dbf52682cb0286 Petr Mladek  2016-10-11  904   * @flags: flags modifying the default behavior of the worker
fbae2d44aa1df7 Petr Mladek  2016-10-11  905   * @namefmt: printf-style name for the kthread worker (task).
fbae2d44aa1df7 Petr Mladek  2016-10-11  906   *
fbae2d44aa1df7 Petr Mladek  2016-10-11  907   * Returns a pointer to the allocated worker on success, ERR_PTR(-ENOMEM)
fbae2d44aa1df7 Petr Mladek  2016-10-11  908   * when the needed structures could not get allocated, and ERR_PTR(-EINTR)
d25c83c6606ffc Petr Mladek  2022-03-15  909   * when the caller was killed by a fatal signal.
fbae2d44aa1df7 Petr Mladek  2016-10-11  910   */
fbae2d44aa1df7 Petr Mladek  2016-10-11  911  struct kthread_worker *
dbf52682cb0286 Petr Mladek  2016-10-11  912  kthread_create_worker(unsigned int flags, const char namefmt[], ...)
fbae2d44aa1df7 Petr Mladek  2016-10-11 @913  {
fbae2d44aa1df7 Petr Mladek  2016-10-11  914  	struct kthread_worker *worker;
fbae2d44aa1df7 Petr Mladek  2016-10-11  915  	va_list args;
fbae2d44aa1df7 Petr Mladek  2016-10-11  916  
fbae2d44aa1df7 Petr Mladek  2016-10-11  917  	va_start(args, namefmt);
dbf52682cb0286 Petr Mladek  2016-10-11  918  	worker = __kthread_create_worker(-1, flags, namefmt, args);
fbae2d44aa1df7 Petr Mladek  2016-10-11  919  	va_end(args);
fbae2d44aa1df7 Petr Mladek  2016-10-11  920  
fbae2d44aa1df7 Petr Mladek  2016-10-11  921  	return worker;
fbae2d44aa1df7 Petr Mladek  2016-10-11  922  }
fbae2d44aa1df7 Petr Mladek  2016-10-11  923  EXPORT_SYMBOL(kthread_create_worker);
fbae2d44aa1df7 Petr Mladek  2016-10-11  924  

:::::: The code at line 913 was first introduced by commit
:::::: fbae2d44aa1df72d0154be77eb4d71e1e34c0f8f kthread: add kthread_create_worker*()

:::::: TO: Petr Mladek <pmladek@suse.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
