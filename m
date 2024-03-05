Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48995C5FD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 20:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709672283; cv=none; b=kqbWz9UtpyN7Ato1bJBDKJIWUby3L/2wXnhMwXVE/eqqSLMo2q70lZxCBbElPHIst2SlvEeDhPnOoRbldLAmAfkDXnDz7ZVGhFf+HvgNAm9Y3p1vulriwYHu4OcesbWCrm6SGC39kJjfy9ArYFLyZraHlz9OF3hiZyrK+4VwfB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709672283; c=relaxed/simple;
	bh=dJGUaL44YSqlToo8u2aYfcv392Hwy80ZwxHNjiwzVQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pumU9uWfjdob1DMIUy/sqzFu7uMghZFHCfM/GFlCuysGIClXwIibXJ8Bl1mfUjrHOR2KH677RvpBCTQscToVZRZl1uqfrZeaAtUxhJZltlLXxFFOpkZpdF3K0Ayxp1C+AxXaDVhAa4kIzl5DSTg+tF0OKVNDxk+zq8LmCuSGbgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CzPWOzE5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CzPWOzE5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709672282; x=1741208282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dJGUaL44YSqlToo8u2aYfcv392Hwy80ZwxHNjiwzVQo=;
  b=CzPWOzE5I956m6joHmK6BON17GiyD1K/lZGj15pOYFB07JZR+QfVji5H
   YgEr8JOy09fr3a2Ui9AL9AYlxvZUwS9rHAxtUmwLNS0ze9m9OnKQchrsq
   qN4U14kSPsT026sXKdJ0vuFaspFdMDL5lI6PR9XSX1vkDswBWz+w7uAkL
   EMfvQWKlt3SJc3DrejCVajL9ULbv0GPl7ft+0QlrXseee7ofBjOrgF83G
   Uj/bZsIyKUqIVPcvRPCYMdEa1UaGilXi0A+HzVB4PJBkO8GblQC6c7HZe
   a3px+CqTMlpCJ7Sa92SVzFbfykRxW4sQWCdlccXVmKOQMJrqZCw6tyYbO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4424208"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="4424208"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 12:58:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="9609063"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Mar 2024 12:57:59 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhbrJ-0003e9-1E;
	Tue, 05 Mar 2024 20:57:57 +0000
Date: Wed, 6 Mar 2024 04:57:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip-rt-rebase 76/29558] mm/swap.c:55:30: warning:
 unused variable 'rotate_lock'
Message-ID: <202403060446.0X95Qs7B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   dce1701e767e33da39db64fe691cd4783ec7dbbf
commit: 5527cef0ed1fb5de2a38b4929defd381f84bb569 [76/29558] mm/swap: Convert to percpu locked
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240306/202403060446.0X95Qs7B-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403060446.0X95Qs7B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403060446.0X95Qs7B-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/swap.c:21:
   include/linux/pagemap.h:401:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     401 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/swap.c:55:30: warning: unused variable 'rotate_lock' [-Wunused-const-variable]
      55 | static DEFINE_LOCAL_IRQ_LOCK(rotate_lock);
         |                              ^~~~~~~~~~~
   include/linux/locallock.h:243:60: note: expanded from macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~
   2 warnings generated.
   mm/swap.o: warning: objtool: missing symbol for section .init.text


vim +/rotate_lock +55 mm/swap.c

    47	
    48	static DEFINE_PER_CPU(struct pagevec, lru_add_pvec);
    49	static DEFINE_PER_CPU(struct pagevec, lru_rotate_pvecs);
    50	static DEFINE_PER_CPU(struct pagevec, lru_deactivate_file_pvecs);
    51	static DEFINE_PER_CPU(struct pagevec, lru_lazyfree_pvecs);
    52	#ifdef CONFIG_SMP
    53	static DEFINE_PER_CPU(struct pagevec, activate_page_pvecs);
    54	#endif
  > 55	static DEFINE_LOCAL_IRQ_LOCK(rotate_lock);
    56	DEFINE_LOCAL_IRQ_LOCK(swapvec_lock);
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
