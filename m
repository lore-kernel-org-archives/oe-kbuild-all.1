Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1CD3595C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 03:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760757469; cv=none; b=aHFd461sI5YBSTw/XpzC5hlvl28FyZaT0a5k8Ts12T8jx+cH8F4Qrsckwul3NFDhOmjW9rykVqUILbgJsAlJgflPTzfCIPdBh73t/YH695wkav3bpGvmoJdIvutPw6t64Mq+4yFYOYK51WqtGV6JPBDozM0QYybNO4+0cQalEQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760757469; c=relaxed/simple;
	bh=/ZPmH4lYkHsggufwvRdkbwQ+doZooO3d11W3wHF8eTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdvtkg9Rq8WWjuSWLlm+Vwh/J9ABPyercUkvByS5uHP++OsQVtPvpw5iWxC5WbNVKPWTr8Y2KKycqxyAXZC59RpO0Qhpv5yHqHRxWkexAESoTIY9xcceVY2wLpJ8KNr9NcLxh21R1TPoJBJ53uQ5c4+9dRX70Tiz3VlBynHcnZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HqiVJ7RM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HqiVJ7RM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760757468; x=1792293468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/ZPmH4lYkHsggufwvRdkbwQ+doZooO3d11W3wHF8eTQ=;
  b=HqiVJ7RMSNhpl7z8/hvph2oaXfi5m1JUQhQSsPqfniAnRc09c4dvLagK
   1HaahLBI1QFxGE4gkYgCUtYDboQ34Dmj2iwpHWPF/piKaRU+4JasW3939
   2pndn62sprBs2Q5tg4T+kgKQCOwDJHH+bmNyA03J4Ch8v8FxKVdDNP6Y8
   PeTXN9GrGZoZJnxMuliEQ2s1n9J4zp0Dp0gvgV9r8kX/Xt9ibCACIKQQt
   HxzTJzlbLMsdAv9vBau+3G9DrM2TPRM33rfFkBbfGZB8ELK6vhlgy76ro
   S4YogKd4vIQLkI9+w3I82qWAGJ7jJRoONgjhSTC7FUgZiL5j4q0hbSMnb
   w==;
X-CSE-ConnectionGUID: v3jZMivgQrCF/+nULr6/Sw==
X-CSE-MsgGUID: EjjQ/KWgRleu8wCpQWx/fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="80412385"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="80412385"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 20:17:45 -0700
X-CSE-ConnectionGUID: 2DnvxapsRK+7j8rtICLRzg==
X-CSE-MsgGUID: GxiTUOrDQKmJFNciETW/fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="182064327"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 17 Oct 2025 19:38:54 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9wqI-00080Z-2r;
	Sat, 18 Oct 2025 02:38:50 +0000
Date: Sat, 18 Oct 2025 10:38:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kirill@shutemov.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
	Kiryl Shutsemau <kas@kernel.org>
Subject: Re: [PATCH] mm/filemap: Implement fast short reads
Message-ID: <202510181054.Fmf1S18u-lkp@intel.com>
References: <20251017141536.577466-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017141536.577466-1-kirill@shutemov.name>

Hi Kiryl,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kiryl-Shutsemau/mm-filemap-Implement-fast-short-reads/20251017-221655
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251017141536.577466-1-kirill%40shutemov.name
patch subject: [PATCH] mm/filemap: Implement fast short reads
config: riscv-randconfig-001-20251018 (https://download.01.org/0day-ci/archive/20251018/202510181054.Fmf1S18u-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181054.Fmf1S18u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181054.Fmf1S18u-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched.h:45,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/dcache.h:8,
                    from include/linux/fs.h:9,
                    from fs/inode.c:7:
   fs/inode.c: In function '__address_space_init_once':
>> fs/inode.c:486:28: error: invalid type argument of '->' (have 'struct xarray')
              &mapping->i_pages->xa_lock);
                               ^~
   include/linux/seqlock_types.h:57:26: note: in definition of macro '__SEQ_LOCK'
    #define __SEQ_LOCK(expr) expr
                             ^~~~
   include/linux/seqlock.h:131:42: note: in expansion of macro 'seqcount_LOCKNAME_init'
    #define seqcount_spinlock_init(s, lock)  seqcount_LOCKNAME_init(s, lock, spinlock)
                                             ^~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:485:2: note: in expansion of macro 'seqcount_spinlock_init'
     seqcount_spinlock_init(&mapping->i_pages_delete_seqcnt,
     ^~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=n]
   Selected by [y]:
   - RISCV [=y]


vim +486 fs/inode.c

   481	
   482	static void __address_space_init_once(struct address_space *mapping)
   483	{
   484		xa_init_flags(&mapping->i_pages, XA_FLAGS_LOCK_IRQ | XA_FLAGS_ACCOUNT);
   485		seqcount_spinlock_init(&mapping->i_pages_delete_seqcnt,
 > 486				       &mapping->i_pages->xa_lock);
   487		init_rwsem(&mapping->i_mmap_rwsem);
   488		INIT_LIST_HEAD(&mapping->i_private_list);
   489		spin_lock_init(&mapping->i_private_lock);
   490		mapping->i_mmap = RB_ROOT_CACHED;
   491	}
   492	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
