Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBABE3C481
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 04:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706503869; cv=none; b=jl2dPtG9AuIcPbT9U0eOHkwI3sVf+kCkUUdeoOlYUZyzjdQUqavXDYWghhmGBWhVNxQ2Dxmh8pB2/HBR2tdfhleoxYScR/wAT1N310JWUfK8s9yxSXsObcvVvwc77c5HnlUYAtZZt6pQhKDO3QGNi67vu+mUsMo53+USJw8gXgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706503869; c=relaxed/simple;
	bh=HYKbBhB/zsMFDxvRwA2T+sUvz+qau382cRdZvvsgkq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N975/mMv2ZqhvUMvYPAb683hYFSSRzRn/BCDkOeKawo+9NF0NaE5lLbeNSJnL1Hx/MigzU5n5G9ZSqIUl0WD0R0dSC5ka6f0bijrHi+Dko+5n7I5z6YkFfPCvzcfVdqZomvv+rNczX+Tm+YMkSe2RZQShui2mge8kaz1r8Wp8l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nO1VFaBN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nO1VFaBN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706503867; x=1738039867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HYKbBhB/zsMFDxvRwA2T+sUvz+qau382cRdZvvsgkq8=;
  b=nO1VFaBNDK9s4aaSoLYT5ENg5lTVtClh3bR0lGh8sWerwGukblPecOzz
   WWV6mo/fJJ6/DK5uEbLIenO95hor5VSMN5SrMfOUv0cHbPCLbvh5dFptC
   O1iFUmag5DbSNmPsOOM100C+dt0GJd/QTjlc5vYWu4VqCo8erwpQQ6IdG
   xw0E4W78S2/tcGZi8ODutwK5dayzQCbFLChag/kTwVTAxj2WBS1MucOoY
   jhuJTdcdhSl3fq5bFk1XJAL500hsNtTj73rffq2X9wSxyZ+ADAuD24mW5
   c4TTTL6/t6HlRqUBfwJfIQlBpaH+7zy5bMTxZqISKLG/PQ10IgGVwKgMx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="9961453"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="9961453"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 20:51:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="3173158"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Jan 2024 20:51:05 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUJbp-00042i-21;
	Mon, 29 Jan 2024 04:51:01 +0000
Date: Mon, 29 Jan 2024 12:50:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/overflow/enable-unsigned-sanitizer 60/115]
 fs/inode.c:2564:32: error: unterminated argument list invoking macro
 "inc_wrap"
Message-ID: <202401291229.1ZGKQmWM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/enable-unsigned-sanitizer
head:   3dae3e4044f1ae8d1903bfc5b413ab57e2d51129
commit: b11c7dc2f0a869e9c234e673150883e64a78ee44 [60/115] [WIP] fs/inode.c: wrapping math: use __unsigned_wrap
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240129/202401291229.1ZGKQmWM-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401291229.1ZGKQmWM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401291229.1ZGKQmWM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/inode.c: In function 'get_nr_inodes':
>> fs/inode.c:2564:32: error: unterminated argument list invoking macro "inc_wrap"
    2564 | EXPORT_SYMBOL(mode_strip_sgid);
         |                                ^
>> fs/inode.c:80:17: error: 'inc_wrap' undeclared (first use in this function)
      80 |                 inc_wrap(sum, per_cpu(nr_inodes, i);
         |                 ^~~~~~~~
   fs/inode.c:80:17: note: each undeclared identifier is reported only once for each function it appears in
>> fs/inode.c:80:25: error: expected ';' at end of input
      80 |                 inc_wrap(sum, per_cpu(nr_inodes, i);
         |                         ^
         |                         ;
   ......
   fs/inode.c:79:9: note: '-Wmisleading-indentation' is disabled from this point onwards, since column-tracking was disabled due to the size of the code/headers
      79 |         for_each_possible_cpu(i)
         |         ^~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:79:9: note: adding '-flarge-source-files' will allow for more column-tracking support, at the expense of compilation time and memory
>> fs/inode.c:80:17: error: expected declaration or statement at end of input
      80 |                 inc_wrap(sum, per_cpu(nr_inodes, i);
         |                 ^~~~~~~~
>> fs/inode.c:78:14: warning: unused variable 'sum' [-Wunused-variable]
      78 |         long sum = 0;
         |              ^~~
>> fs/inode.c:80:17: warning: no return statement in function returning non-void [-Wreturn-type]
      80 |                 inc_wrap(sum, per_cpu(nr_inodes, i);
         |                 ^~~~~~~~
   fs/inode.c: At top level:
>> fs/inode.c:75:13: warning: 'get_nr_inodes' defined but not used [-Wunused-function]
      75 | static long get_nr_inodes(void)
         |             ^~~~~~~~~~~~~
>> fs/inode.c:73:27: warning: 'inode_cachep' defined but not used [-Wunused-variable]
      73 | static struct kmem_cache *inode_cachep __ro_after_init;
         |                           ^~~~~~~~~~~~
   In file included from include/asm-generic/percpu.h:8,
                    from ./arch/parisc/include/generated/asm/percpu.h:1,
                    from include/linux/irqflags.h:19,
                    from include/asm-generic/cmpxchg-local.h:6,
                    from arch/parisc/include/asm/cmpxchg.h:89,
                    from arch/parisc/include/asm/atomic.h:10,
                    from include/linux/atomic.h:7,
                    from arch/parisc/include/asm/bitops.h:13,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/inode.c:7:
>> fs/inode.c:71:38: warning: 'nr_unused' defined but not used [-Wunused-variable]
      71 | static DEFINE_PER_CPU(unsigned long, nr_unused);
         |                                      ^~~~~~~~~
   include/linux/percpu-defs.h:104:44: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
     104 |         __PCPU_ATTRS(sec) __typeof__(type) name
         |                                            ^~~~
   fs/inode.c:71:8: note: in expansion of macro 'DEFINE_PER_CPU'
      71 | static DEFINE_PER_CPU(unsigned long, nr_unused);
         |        ^~~~~~~~~~~~~~
>> fs/inode.c:70:38: warning: 'nr_inodes' defined but not used [-Wunused-variable]
      70 | static DEFINE_PER_CPU(unsigned long, nr_inodes);
         |                                      ^~~~~~~~~
   include/linux/percpu-defs.h:104:44: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
     104 |         __PCPU_ATTRS(sec) __typeof__(type) name
         |                                            ^~~~
   fs/inode.c:70:8: note: in expansion of macro 'DEFINE_PER_CPU'
      70 | static DEFINE_PER_CPU(unsigned long, nr_inodes);
         |        ^~~~~~~~~~~~~~
   In file included from include/linux/spinlock.h:89:
>> fs/inode.c:60:51: warning: 'inode_hash_lock' defined but not used [-Wunused-variable]
      60 | static __cacheline_aligned_in_smp DEFINE_SPINLOCK(inode_hash_lock);
         |                                                   ^~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:43:44: note: in definition of macro 'DEFINE_SPINLOCK'
      43 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
>> fs/inode.c:59:27: warning: 'inode_hashtable' defined but not used [-Wunused-variable]
      59 | static struct hlist_head *inode_hashtable __ro_after_init;
         |                           ^~~~~~~~~~~~~~~
>> fs/inode.c:58:21: warning: 'i_hash_shift' defined but not used [-Wunused-variable]
      58 | static unsigned int i_hash_shift __ro_after_init;
         |                     ^~~~~~~~~~~~
>> fs/inode.c:57:21: warning: 'i_hash_mask' defined but not used [-Wunused-variable]
      57 | static unsigned int i_hash_mask __ro_after_init;
         |                     ^~~~~~~~~~~


vim +/inc_wrap +2564 fs/inode.c

11c2a8700cdcab Christian Brauner 2022-10-17  2538  
2b3416ceff5e6b Yang Xu           2022-07-14  2539  /**
2b3416ceff5e6b Yang Xu           2022-07-14  2540   * mode_strip_sgid - handle the sgid bit for non-directories
9452e93e6dae86 Christian Brauner 2023-01-13  2541   * @idmap: idmap of the mount the inode was created from
2b3416ceff5e6b Yang Xu           2022-07-14  2542   * @dir: parent directory inode
2b3416ceff5e6b Yang Xu           2022-07-14  2543   * @mode: mode of the file to be created in @dir
2b3416ceff5e6b Yang Xu           2022-07-14  2544   *
2b3416ceff5e6b Yang Xu           2022-07-14  2545   * If the @mode of the new file has both the S_ISGID and S_IXGRP bit
2b3416ceff5e6b Yang Xu           2022-07-14  2546   * raised and @dir has the S_ISGID bit raised ensure that the caller is
2b3416ceff5e6b Yang Xu           2022-07-14  2547   * either in the group of the parent directory or they have CAP_FSETID
2b3416ceff5e6b Yang Xu           2022-07-14  2548   * in their user namespace and are privileged over the parent directory.
2b3416ceff5e6b Yang Xu           2022-07-14  2549   * In all other cases, strip the S_ISGID bit from @mode.
2b3416ceff5e6b Yang Xu           2022-07-14  2550   *
2b3416ceff5e6b Yang Xu           2022-07-14  2551   * Return: the new mode to use for the file
2b3416ceff5e6b Yang Xu           2022-07-14  2552   */
9452e93e6dae86 Christian Brauner 2023-01-13  2553  umode_t mode_strip_sgid(struct mnt_idmap *idmap,
2b3416ceff5e6b Yang Xu           2022-07-14  2554  			const struct inode *dir, umode_t mode)
2b3416ceff5e6b Yang Xu           2022-07-14  2555  {
2b3416ceff5e6b Yang Xu           2022-07-14  2556  	if ((mode & (S_ISGID | S_IXGRP)) != (S_ISGID | S_IXGRP))
2b3416ceff5e6b Yang Xu           2022-07-14  2557  		return mode;
2b3416ceff5e6b Yang Xu           2022-07-14  2558  	if (S_ISDIR(mode) || !dir || !(dir->i_mode & S_ISGID))
2b3416ceff5e6b Yang Xu           2022-07-14  2559  		return mode;
e67fe63341b811 Christian Brauner 2023-01-13  2560  	if (in_group_or_capable(idmap, dir, i_gid_into_vfsgid(idmap, dir)))
2b3416ceff5e6b Yang Xu           2022-07-14  2561  		return mode;
2b3416ceff5e6b Yang Xu           2022-07-14  2562  	return mode & ~S_ISGID;
2b3416ceff5e6b Yang Xu           2022-07-14  2563  }
2b3416ceff5e6b Yang Xu           2022-07-14 @2564  EXPORT_SYMBOL(mode_strip_sgid);

:::::: The code at line 2564 was first introduced by commit
:::::: 2b3416ceff5e6bd4922f6d1c61fb68113dd82302 fs: add mode_strip_sgid() helper

:::::: TO: Yang Xu <xuyang2018.jy@fujitsu.com>
:::::: CC: Christian Brauner (Microsoft) <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
