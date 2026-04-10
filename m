Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A11427FB37
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 13:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775826405; cv=none; b=bXZF/xoVhVPSFVEPL3p5H4buRbTYOsP8XsovIOjjGF55fOfQaZwSZaUK70wZ1b1Hk+dHRf5bIG5V8NrI3RdVARyB3NNRasUI6cGMSj3sB9Ivm33rL8yFXUi9zoeh/eQPKP+csZxOprPjKspzqMrRVVcZ+ce6B5PS+EFbgIRpFp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775826405; c=relaxed/simple;
	bh=QDq+PQ6WqNopzw5vXlZ8BF74XEgQOYxJTFGjhwuDIZw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KwYKVRqZBtsxcW4vKoq+GvYqAy7qZaAWZwx1hjGO56R19//FDQEx4sIRcsITxNgdHWZrD2YjDuS4aAbbIUle10ONBs9SEkvnpfn9WJ2RQmBShDHawZXFAKJCVEqP+YGoG2VJxp8vQCuPNWyypDoBhPxKZT+6w0LoaBW5JmxGMac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSEOWLc0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSEOWLc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775826403; x=1807362403;
  h=date:from:to:cc:subject:message-id;
  bh=QDq+PQ6WqNopzw5vXlZ8BF74XEgQOYxJTFGjhwuDIZw=;
  b=LSEOWLc0Yguir+xxPI8LdVZca9l4Vc9ZxdqeeWCHrXAdwWz/rHUOa11q
   cxkdq4XFX5uE5Kwhz2k/E/A3rNQmy/LmZDrup905TYxU5fUKLHNrMfZqe
   4ThN8AuA1q6EIDGpZmGFDGd2EFKgtkoZTX2lzGEmib0lFzumDv+uEBgLN
   0nm3Sv6Pg/R8hwxXsmXOjTuO3XiC8IqwinKMNsbia6CpjWNPRhBmIrjJM
   PTHiSSuyBqw5S5kmOoszNh0FQJ8it+7lUfUiE2OdR69s/u/iRO9Wkl9JW
   M7Ky9zZ4v57R53A2voWXUmt//IPuEZxYNw8mZIZmW9ToclIfzMsILF9t/
   Q==;
X-CSE-ConnectionGUID: Jds+IScsTdGLHcrn362GDw==
X-CSE-MsgGUID: TKrfPMqSSICXAWyT50nrjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="79428951"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="79428951"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 06:06:43 -0700
X-CSE-ConnectionGUID: 8PWNtYm+Sd2H+L2Qn5r0vw==
X-CSE-MsgGUID: KJvHiBPUSbiSJFPF63uVyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="228963722"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Apr 2026 06:06:41 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBBZG-000000003kn-2HBD;
	Fri, 10 Apr 2026 13:06:38 +0000
Date: Fri, 10 Apr 2026 21:05:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org
Subject: [tip:locking/core 23/38] drivers/char/nvram.c:56:21:
 warning: 'nvram_mutex' defined but not used
Message-ID: <202604102031.foCRIrmZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   a21c1e961de28b95099a9ca2c3774b2eee1a33bb
commit: 25500ba7e77ce9d3d9b5a1929d41a2ee2e23f6fe [23/38] locking/mutex: Remove the list_head from struct mutex
config: powerpc64-randconfig-001-20260410 (https://download.01.org/0day-ci/archive/20260410/202604102031.foCRIrmZ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102031.foCRIrmZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604102031.foCRIrmZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/seqlock.h:20,
                    from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/char/nvram.c:34:
>> drivers/char/nvram.c:56:21: warning: 'nvram_mutex' defined but not used [-Wunused-variable]
      56 | static DEFINE_MUTEX(nvram_mutex);
         |                     ^~~~~~~~~~~
   include/linux/mutex.h:87:22: note: in definition of macro 'DEFINE_MUTEX'
      87 |         struct mutex mutexname = __MUTEX_INITIALIZER(mutexname)
         |                      ^~~~~~~~~


vim +/nvram_mutex +56 drivers/char/nvram.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  55  
613655fa39ff69 Arnd Bergmann  2010-06-02 @56  static DEFINE_MUTEX(nvram_mutex);
^1da177e4c3f41 Linus Torvalds 2005-04-16  57  static DEFINE_SPINLOCK(nvram_state_lock);
^1da177e4c3f41 Linus Torvalds 2005-04-16  58  static int nvram_open_cnt;	/* #times opened */
^1da177e4c3f41 Linus Torvalds 2005-04-16  59  static int nvram_open_mode;	/* special open modes */
d5bbb5021ce8d9 Finn Thain     2019-01-15  60  static ssize_t nvram_size;
^1da177e4c3f41 Linus Torvalds 2005-04-16  61  #define NVRAM_WRITE		1 /* opened for writing (exclusive) */
^1da177e4c3f41 Linus Torvalds 2005-04-16  62  #define NVRAM_EXCL		2 /* opened with O_EXCL */
^1da177e4c3f41 Linus Torvalds 2005-04-16  63  

:::::: The code at line 56 was first introduced by commit
:::::: 613655fa39ff6957754fa8ceb8559980920eb8ee drivers: autoconvert trivial BKL users to private mutex

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
