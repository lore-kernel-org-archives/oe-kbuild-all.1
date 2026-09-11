Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B803B19BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 11:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125607; cv=none; b=OOmnXw9qDxNaQmTS9gkGDSf/w7WTnAe8R8duFCCKUBIGUfU7zFFg9bf7QHuxGbcJRCEXEBl0gbcQ9KHv3SsGGJd2aiuPgAzRpqzwgmQMrVGwMdGUmQMIsFeiSe6Oj2fAe6SOH70ICx3Q4T0b9GfOKcpKQhLKZgP/uC+XxrTIg7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125607; c=relaxed/simple;
	bh=FGEUvSM61zMl3OyGuXebU4YLNATfKPszm7+vOAFsOZs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ad79NlSrIcU/BlMWqoQBX6j3BBvJH75IXWswTpv+G0wjQgszN3IQUDNghJ7W9+acWFJfHlR6LD5sYPkYvhRJi8fehNewddww/Mh8lMnRvcZ16y29T6UJv1sxL8BSJnME8k4TNT/Fnt1sJQwt6i3MiOdpfqx3RcKo5x03Z5GfKjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZKys8+m; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZKys8+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125606; x=1820661606;
  h=date:from:to:cc:subject:message-id;
  bh=FGEUvSM61zMl3OyGuXebU4YLNATfKPszm7+vOAFsOZs=;
  b=jZKys8+mQb5wbP0rXdaY/LP4yzAkK2IPBkPRgL95ahs0EKKzm04rGjOT
   eaxQ74lr8U3FbFEGiNVcg/k3nXg38JeZeCgx/rV5ePntJswRe39E56X7J
   Lq0pLjl/HxMUEt+LIvUWadODGfW6w6/pKqlbfnQDAZm0mCc5EMtg9S0pr
   dOMfgluLvuG3DaL0xiZXZ3S1Ox02dLFfr9QNOZRXlZ63Ijc3ZMQZ0ACvu
   Dx+KE9FymxgCFEES7R9tfasDcC8xYvGBLxK7C0sFfHoogeB6cTVFT7vV/
   IThbbwd8u0kBnZ8FaPZdZ1mgBMxQuvnc/nhSEljlJVHIzm1PWNP7lbuPi
   g==;
X-CSE-ConnectionGUID: WZBTwyNlRTm+9ohktPV5Ww==
X-CSE-MsgGUID: ytmiQWNYRsG6TE6D0U/vpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100939108"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100939108"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:20:05 -0700
X-CSE-ConnectionGUID: SEoiMjU1TX6L29mxWEROjw==
X-CSE-MsgGUID: 2qGGom9KRwOJWKH2pb3yfQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 11 Sep 2026 04:20:03 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4zHn-000000001TO-2UYU;
	Fri, 11 Sep 2026 11:19:42 +0000
Date: Fri, 11 Sep 2026 19:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: Bill Wendling <morbo@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Subject: [brauner-vfs:vfs-7.4.file 2/3]
 fs/tests/fdtable_kunit.c:25:9: sparse: sparse: incompatible types for
 operation (==):
Message-ID: <202609111828.SjerhPyO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-7.4.file
head:   f5ae3d9f2940d7ab17f0c186bda880e13d18bde7
commit: 501cbbd276b77d34af20ea3dd4f897c93630bac8 [2/3] vfs: Add KUnit tests for fdtable
config: alpha-randconfig-r111-20260910 (https://download.01.org/0day-ci/archive/20260911/202609111828.SjerhPyO-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111828.SjerhPyO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609111828.SjerhPyO-lkp@intel.com/

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
