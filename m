Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A0939890A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 10:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778754433; cv=none; b=oAWEbMX/SHvEiKB4kMcQY6k5BSOaTnOT6WFdDIH+/IqwbPMyq6oDdumE6F8hM6mknzdBrs79uYpY9ZA7FNDLYAXxapjHbL9FgJnwwj4rNazQxaui+5BSG8lnJRHXAEKAd+XOYJFaqAsMA/maLLW1NIKJv6IWRtDOwjuQY9/DH2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778754433; c=relaxed/simple;
	bh=xTqe92o13pQfWfzBsb9Z6p9hEjld1dYJg2iWnGQ98Vs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C9j03yjWfOvFchL6MZ5nmVbXwjpT/MGV7D+W91FSbtzemjo/wILtrJjJjBpW4ei27o8YuSccxpnyDRE01TVGKRqKxpwfCrwxTi4xGq/860gyr+JXq2yPvLc1f18FNJ7DB9qV4kSfySALXiq/IRN61tDTYEzVUwPWliou0DhigHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WSUbBVK0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WSUbBVK0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778754431; x=1810290431;
  h=date:from:to:cc:subject:message-id;
  bh=xTqe92o13pQfWfzBsb9Z6p9hEjld1dYJg2iWnGQ98Vs=;
  b=WSUbBVK0vWAWqq7LYsaxn3czBfK14h2wq/lqUMFmdAsrCnspV6yFkpMQ
   dFCrvpIXhKUYngtncTgikF8dCemRgAF4PkUO/Fvm5GNcHoi6rXIJqkZw+
   rKaSE1XVv1jTp5QEZWQZDFlKCNxyffznUtSu7t9pxljoEUFhi3Yz2BtFq
   W0hfcBJQbIdDPqD8rkXfpSwhCMFlsDuGuLKQq1SlLfuLYVmc8OCwudz+k
   A85wc2GB0drJ+WnR9C6uiGOf8TbNNZYOUpvTIFEijB8ztNPOsYff/geTi
   Kan5jK8GUmt+/YZ1eSbTuR21m5/WcGDQuei1i9V3qm75+IXq81QxZyQTU
   A==;
X-CSE-ConnectionGUID: NKaiMlTGTIWALh/kNQeocg==
X-CSE-MsgGUID: b69GUAHsRk6chiJCT9HgFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="91079227"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="91079227"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 03:27:11 -0700
X-CSE-ConnectionGUID: G9sqdJCFRJeRAMYKe96GfA==
X-CSE-MsgGUID: F0GJj/TZTZuSPgGmdnv8Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="233915141"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 May 2026 03:27:09 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNTHW-000000006M5-3kv1;
	Thu, 14 May 2026 10:27:06 +0000
Date: Thu, 14 May 2026 18:26:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/char/nvram.c:56:21: warning: 'nvram_mutex' defined
 but not used
Message-ID: <202605141850.qvidrpg9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Matthew,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: 25500ba7e77ce9d3d9b5a1929d41a2ee2e23f6fe locking/mutex: Remove the list_head from struct mutex
date:   10 weeks ago
config: powerpc64-randconfig-002-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141850.qvidrpg9-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141850.qvidrpg9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 25500ba7e77c ("locking/mutex: Remove the list_head from struct mutex")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141850.qvidrpg9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/seqlock.h:20,
                    from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/char/nvram.c:34:
>> drivers/char/nvram.c:56:21: warning: 'nvram_mutex' defined but not used [-Wunused-variable]
    static DEFINE_MUTEX(nvram_mutex);
                        ^~~~~~~~~~~
   include/linux/mutex.h:87:15: note: in definition of macro 'DEFINE_MUTEX'
     struct mutex mutexname = __MUTEX_INITIALIZER(mutexname)
                  ^~~~~~~~~


vim +/nvram_mutex +56 drivers/char/nvram.c

^1da177e4c3f4152 Linus Torvalds 2005-04-16  55  
613655fa39ff6957 Arnd Bergmann  2010-06-02 @56  static DEFINE_MUTEX(nvram_mutex);
^1da177e4c3f4152 Linus Torvalds 2005-04-16  57  static DEFINE_SPINLOCK(nvram_state_lock);
^1da177e4c3f4152 Linus Torvalds 2005-04-16  58  static int nvram_open_cnt;	/* #times opened */
^1da177e4c3f4152 Linus Torvalds 2005-04-16  59  static int nvram_open_mode;	/* special open modes */
d5bbb5021ce8d9ff Finn Thain     2019-01-15  60  static ssize_t nvram_size;
^1da177e4c3f4152 Linus Torvalds 2005-04-16  61  #define NVRAM_WRITE		1 /* opened for writing (exclusive) */
^1da177e4c3f4152 Linus Torvalds 2005-04-16  62  #define NVRAM_EXCL		2 /* opened with O_EXCL */
^1da177e4c3f4152 Linus Torvalds 2005-04-16  63  

:::::: The code at line 56 was first introduced by commit
:::::: 613655fa39ff6957754fa8ceb8559980920eb8ee drivers: autoconvert trivial BKL users to private mutex

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
