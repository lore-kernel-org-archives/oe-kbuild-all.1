Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B631335200F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 05:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105522; cv=none; b=feMhTCPOpj6PUSWevR0XHjuGLZocDbcfdG8fPcCa7ZvdxADF0ICPhfWtjqX8JkERU5QesNn0AapwRPoS3tJh5k0hge6a3qXU8qsQjgkt5I0AsnwYtoXarQKuROmjkLZxHPlBVWEgRb38cKFOJni141RLjWrETUgC3aGSIQc7Tlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105522; c=relaxed/simple;
	bh=ioYPbwMs+H1dnfNbakVyGnMr17++6Pfg8v/iN7ia1To=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O7BUVEZyoqoBLfLRbt5wpQl0RJINBuB507F2Pe/wwvrExLQJESb4hpLYHkjnYDnrTbXiL3GBw30lq+TKi5VyiaE61hhXPePF+wevG/qIGqUgy5vzresKvF+bJ7FAbaxrie/jX9/w10Jm/06tEO+SAcco0RDPamkRg/BMf3Dr1zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArolQcki; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArolQcki"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789105521; x=1820641521;
  h=date:from:to:cc:subject:message-id;
  bh=ioYPbwMs+H1dnfNbakVyGnMr17++6Pfg8v/iN7ia1To=;
  b=ArolQckib9MP54YDH2UCy8up9ZzloPAdzwcfq5Mb7IDc/z2JWvlSA1HJ
   whv1D9Zv6O3LHEIBuX4DFno+nLXTGTT2LYfOeNyKUAh6bR7oQqlCrdp7b
   hkKJujC07QIEJGle1DFASXa0lzt2u+rjkGpadtsWyOy3mYsags4O9xsde
   Po27ABzXeFT2rQ1Hl/v+LuNog46CjAc9wjttVk5y+8T+4zH7vFgW7Owg4
   z9gt6ylF3Fsm2Tto1cRh6b7Wat+BN1ZJUjzihWYCQhASK2zncaWAU1BC0
   LN/MVGIo7Dk6zEhKg2WShL1j5GlKh5McqY0quwO/Vp5MeAFK4NkFOy1hs
   w==;
X-CSE-ConnectionGUID: XnI8qeoWRqWSlFJh3I5G4g==
X-CSE-MsgGUID: AtQugVQBRjmrhASADviQ9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="107080712"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="107080712"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 22:45:20 -0700
X-CSE-ConnectionGUID: 7sroRzJtTDCyJYOOsy+SBw==
X-CSE-MsgGUID: I7ND3+cuS+q0JFhQyS4FfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="301723920"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 10 Sep 2026 22:45:18 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4u4G-0000000016Q-378v;
	Fri, 11 Sep 2026 05:45:13 +0000
Date: Fri, 11 Sep 2026 13:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: Bill Wendling <morbo@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Subject: [brauner-vfs:vfs-7.4.file 2/3]
 fs/tests/fdtable_kunit.c:25:9: sparse: sparse: incompatible types for
 operation (==):
Message-ID: <202609111337.fBSfTIpR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-7.4.file
head:   f5ae3d9f2940d7ab17f0c186bda880e13d18bde7
commit: 501cbbd276b77d34af20ea3dd4f897c93630bac8 [2/3] vfs: Add KUnit tests for fdtable
config: alpha-randconfig-r111-20260910 (https://download.01.org/0day-ci/archive/20260911/202609111337.fBSfTIpR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111337.fBSfTIpR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609111337.fBSfTIpR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/file.c:438:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **old_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:438:17: sparse:     expected struct file **old_fds
   fs/file.c:438:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:439:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **new_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:439:17: sparse:     expected struct file **new_fds
   fs/file.c:439:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:462:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/file.c:462:17: sparse:    struct file [noderef] __rcu *
   fs/file.c:462:17: sparse:    struct file *
   fs/file.c:492:60: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:532:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fdtable [noderef] __rcu *fdt @@     got struct fdtable * @@
   fs/file.c:911:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:932:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:936:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file_ref_t [usertype] *ref @@     got struct file_ref_t [noderef] __rcu * @@
   fs/file.c:939:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file_reloaded @@     got struct file * @@
   fs/file.c:962:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file_reloaded @@
   fs/file.c:964:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file @@
   fs/file.c:985:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:987:32: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file @@
   fs/file.c:1009:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file [noderef] __rcu **f @@     got struct file **f @@
   fs/file.c:1009:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:1013:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *[assigned] file @@
   fs/file.c: note: in included file:
   fs/tests/fdtable_kunit.c:25:9: sparse: sparse: undefined identifier '__builtin_dynamic_object_size'
   fs/tests/fdtable_kunit.c:25:9: sparse: sparse: undefined identifier '__builtin_dynamic_object_size'
>> fs/tests/fdtable_kunit.c:25:9: sparse: sparse: incompatible types for operation (==):
   fs/tests/fdtable_kunit.c:25:9: sparse:    bad type const __left
   fs/tests/fdtable_kunit.c:25:9: sparse:    unsigned long const __right
   fs/tests/fdtable_kunit.c:54:9: sparse: sparse: undefined identifier '__builtin_dynamic_object_size'
   fs/tests/fdtable_kunit.c:54:9: sparse: sparse: undefined identifier '__builtin_dynamic_object_size'
   fs/tests/fdtable_kunit.c:54:9: sparse: sparse: incompatible types for operation (==):
   fs/tests/fdtable_kunit.c:54:9: sparse:    bad type const __left
   fs/tests/fdtable_kunit.c:54:9: sparse:    unsigned long const __right

vim +25 fs/tests/fdtable_kunit.c

     5	
     6	static void test_alloc_fdtable(struct kunit *test)
     7	{
     8		struct fdtable *fdt;
     9		unsigned int slots = 64;
    10	
    11		fdt = alloc_fdtable(slots);
    12		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fdt);
    13	
    14		/* Check that max_fds is set correctly and is >= slots */
    15		KUNIT_EXPECT_GE(test, fdt->max_fds, slots);
    16	
    17		/* Check that fd is allocated */
    18		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fdt->fd);
    19	
    20		/*
    21		 * Check dynamic object size of fdt->fd if compiler supports
    22		 * __counted_by_ptr.
    23		 */
    24	#ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
  > 25		KUNIT_EXPECT_EQ(test, __builtin_dynamic_object_size(fdt->fd, 0),
    26				fdt->max_fds * sizeof(struct file *));
    27	#endif
    28	
    29		__free_fdtable(fdt);
    30	}
    31	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
