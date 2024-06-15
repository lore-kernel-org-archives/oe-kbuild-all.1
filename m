Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD878F48
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 14:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718460984; cv=none; b=SngEG7r4EQtbn/aCDTJGltNT29f5sjj4IckZelHM1MkAoU+wNih7zq3yB7pu10GkI5LOfWwQ8dKSAMWGabbRz/wDhQSmSgEp3hewfNAH9R8jgpwlsVj25vkMdSVYBBykoBUeuylyYRC9zD2z9p8sLfpTYorDtvVxtPcMFB9mAa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718460984; c=relaxed/simple;
	bh=2PdPs5D3zk2jVTH3i8G1upMUono6TCGema1uOV+7Chc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MkA+qcMwPFKruLksTZw88YhWz/7nszkYPkl2PIrPZLw0lx6mh5PgTZZTKycGzS6eXe+2mkc9Ip2yrdoh/NS0sbq/BciuLBgAFxZJLGngyZXfXAB79WYqQHSgrd/fhdKpF644kX7sph79y6ceeH+T+d/kI3X3sAhm95wbvE8guOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VpEWhFnj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpEWhFnj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718460982; x=1749996982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2PdPs5D3zk2jVTH3i8G1upMUono6TCGema1uOV+7Chc=;
  b=VpEWhFnj3yw2di+xAyqr9VHHtFZr0bQ+ypybK9sHtD+hL1z+YxKqXWB/
   qbUtz6mPgAqQWUdeHQczc67snc24B4vVQrWE+EWLEZUpgEl3twEEYSpQ+
   DW5VJpTHGyq7TNWMjCBmmi3uUZCAGLjjZ3bNKTxZTPrJeMvTVAahod/ov
   knnR9TpNICv4p3of0iKlg+fkr7xk5TTyBCEHWkt3bP4DxL52zU93ahZu+
   6A7PF3w7/NRgnw8Alx8o/BrZ3v70cXC5IDxrT9NICk3IF0qGk8Z/cWs2Y
   Mdz0PpBIFYictTKDqs8KT0XWepRS9sT1LwZy99eFo6SKeoOMZ2V9/TS6V
   Q==;
X-CSE-ConnectionGUID: Vq2lD1N6QyuLWPfXS/Hg+A==
X-CSE-MsgGUID: uJn/NaTPSyiAtWsBwk/nKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="40761397"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="40761397"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 07:16:21 -0700
X-CSE-ConnectionGUID: e3uwu9foSP6QklLcEP0v8A==
X-CSE-MsgGUID: Qphep6ZcTw6EPozlkL99Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="40884243"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jun 2024 07:16:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIUCY-00006I-0w;
	Sat, 15 Jun 2024 14:16:18 +0000
Date: Sat, 15 Jun 2024 22:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 4839/5501] mm/shmem.c:139:24: warning:
 'huge_shmem_orders_lock' defined but not used
Message-ID: <202406152213.CoQNZR6z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6906a84c482f098d31486df8dc98cead21cce2d0
commit: dfe69b2f4ed49aee4a46f09010f7888ee289083d [4839/5501] mm: shmem: add multi-size THP sysfs interface for anonymous shmem
config: mips-randconfig-r034-20220430 (https://download.01.org/0day-ci/archive/20240615/202406152213.CoQNZR6z-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406152213.CoQNZR6z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406152213.CoQNZR6z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/spinlock.h:89,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from mm/shmem.c:24:
>> mm/shmem.c:139:24: warning: 'huge_shmem_orders_lock' defined but not used [-Wunused-variable]
     139 | static DEFINE_SPINLOCK(huge_shmem_orders_lock);
         |                        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:43:44: note: in definition of macro 'DEFINE_SPINLOCK'
      43 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   mm/shmem.c:138:22: warning: 'huge_shmem_orders_within_size' defined but not used [-Wunused-variable]
     138 | static unsigned long huge_shmem_orders_within_size __read_mostly;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/shmem.c:136:22: warning: 'huge_shmem_orders_madvise' defined but not used [-Wunused-variable]
     136 | static unsigned long huge_shmem_orders_madvise __read_mostly;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/shmem.c:135:22: warning: 'huge_shmem_orders_always' defined but not used [-Wunused-variable]
     135 | static unsigned long huge_shmem_orders_always __read_mostly;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/huge_shmem_orders_lock +139 mm/shmem.c

   133	
   134	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
   135	static unsigned long huge_shmem_orders_always __read_mostly;
   136	static unsigned long huge_shmem_orders_madvise __read_mostly;
   137	static unsigned long huge_shmem_orders_inherit __read_mostly;
   138	static unsigned long huge_shmem_orders_within_size __read_mostly;
 > 139	static DEFINE_SPINLOCK(huge_shmem_orders_lock);
   140	#endif
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
