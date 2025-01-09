Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F70718A959
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 21:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736458645; cv=none; b=K5TtYlqVci82SafgFd501J6+BFbgw2iIdLL6ryDn92tipvRKuLdAcYhQ0dIWHIRR001X+PwrsVvCZuDyyZMMkv9L3XLau87k6VxPTQsFdUjphEImkUVbtFwOolJWPYb6frgrSDqb5ZTpihOH0+YHJ29c8xBQDxrtM8NkoGG4py0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736458645; c=relaxed/simple;
	bh=UVo+AVoQqUF0DJD+vV0sTcGmEMtDrSbggPciZF/8lZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZNFeF4dZJ59PRwtKJsxZzlIIrFQDMO/nnMP/1hOC7NmZEfKXZWsBtgicOtmrIpXkJTcPm4XhM7O0i/fuzA5u19SRmm3RvjrFXyqwpiAcqb44REx+2YtMecjd3ul28+gR3f5OuAzzoX5qUc4tFPCZnwlRxIa3SocMkZEGynQgVLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYxbFG4D; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYxbFG4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736458643; x=1767994643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UVo+AVoQqUF0DJD+vV0sTcGmEMtDrSbggPciZF/8lZ0=;
  b=cYxbFG4DGeEdn+Rd4A45iNGELLq/bcinEf587vajdYCWcfzaI6I+RJmg
   P6mrod1hh0WfAwzVK/vPcMMst+BAB2LXs0f5hRXsk2rt7VEftBNe7jog8
   tVTQUT0B+K84I5JxA6jTlphTMWyNo8BEtCgmD05WpzVCblk3uylxNCq9b
   zxfDiB4wSMA2taUn/f+BspjYyeInNw62OJ5gxEzOsbpXSEwxzEJZ6/Bwf
   XX+kbnvodKf2jt/VBqV4qt7IKJLuEAr6m3hSKAqcOF82QXCExtMYhRABT
   8/6pcWgeO3ayY9hc9gSzRBHQ5F9q0a+5SbosXwfXLHyhQDnrz6U/qTHQ3
   w==;
X-CSE-ConnectionGUID: 3/UfuKKnSf+pNRSnf/bg0A==
X-CSE-MsgGUID: 7owTNOHORECQG6HtNX5ttA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="59216192"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="59216192"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 13:37:23 -0800
X-CSE-ConnectionGUID: rYdqmHcbSe2u6KBx7pji/A==
X-CSE-MsgGUID: y3oFqDwxSnmxgn3v8iYfFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="108444345"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jan 2025 13:37:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW0DP-000IAJ-2p;
	Thu, 09 Jan 2025 21:37:19 +0000
Date: Fri, 10 Jan 2025 05:36:53 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/fixes 3/3]
 include/asm-generic/rwonce.h:55:39: error: incompatible types when assigning
 to type 'struct tmigr_group' from type 'struct tmigr_group *'
Message-ID: <202501100546.OwNn5Ufr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/fixes
head:   b825dd98da4f6861a12aa88cda4cf28ffb51d151
commit: b825dd98da4f6861a12aa88cda4cf28ffb51d151 [3/3] The following commit:
config: arc-randconfig-002-20250110 (https://download.01.org/0day-ci/archive/20250110/202501100546.OwNn5Ufr-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100546.OwNn5Ufr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100546.OwNn5Ufr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/arc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:339,
                    from include/linux/build_bug.h:5,
                    from arch/arc/include/asm/cache.h:28,
                    from include/linux/cache.h:6,
                    from include/linux/slab.h:15,
                    from kernel/time/timer_migration.c:8:
   kernel/time/timer_migration.c: In function 'tmigr_connect_child_parent':
>> include/asm-generic/rwonce.h:55:39: error: incompatible types when assigning to type 'struct tmigr_group' from type 'struct tmigr_group *'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                       ^
   include/asm-generic/rwonce.h:61:9: note: in expansion of macro '__WRITE_ONCE'
      61 |         __WRITE_ONCE(x, val);                                           \
         |         ^~~~~~~~~~~~
   include/asm-generic/barrier.h:143:9: note: in expansion of macro 'WRITE_ONCE'
     143 |         WRITE_ONCE(*p, v);                                              \
         |         ^~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   kernel/time/timer_migration.c:1586:9: note: in expansion of macro 'smp_store_release'
    1586 |         smp_store_release(child->parent, parent);
         |         ^~~~~~~~~~~~~~~~~


vim +55 include/asm-generic/rwonce.h

e506ea451254ab Will Deacon 2019-10-15  52  
e506ea451254ab Will Deacon 2019-10-15  53  #define __WRITE_ONCE(x, val)						\
e506ea451254ab Will Deacon 2019-10-15  54  do {									\
e506ea451254ab Will Deacon 2019-10-15 @55  	*(volatile typeof(x) *)&(x) = (val);				\
e506ea451254ab Will Deacon 2019-10-15  56  } while (0)
e506ea451254ab Will Deacon 2019-10-15  57  

:::::: The code at line 55 was first introduced by commit
:::::: e506ea451254ab17e0bf918ca36232fec2a9b10c compiler.h: Split {READ,WRITE}_ONCE definitions out into rwonce.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
