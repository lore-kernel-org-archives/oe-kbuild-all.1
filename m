Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0004A2F618C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 10:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765620698; cv=none; b=oegLmqN2SRH8Aei58efx+hjWXPFq+lwzpwWdZWzoZ1HDwGDcFXPMPWwj/+B8+ZOWQOXlfkVrfO8eqeRqgIcYlQcuHmZnnWUenbGZiDFXMkpIuq6FKAY1ukWwwQVrZWIXMS2AUKb8Tu8ulN4c2j4LDigbINCG/cwCahxwCV2w/TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765620698; c=relaxed/simple;
	bh=IooJ/IvemR9rPixE68HpOqn26w6yzlx+m0njrSBv7ic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MJttMRW7kLv9oYz7MF/JaoW3dY6PLEIaHi0YUjCANSoRMIgCLIjPZ0j6s4xjQIbDsutUi2JcQV+Gs2D6sTuDNLiQHvtVWuuCoryHOY/VnJ5T6sKbdNtPCw0t7kqypxIoRkRY0Ib/+5GxiS+hkk96fmXQzZMTs47oSDVZNI/Zdbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jhoB09W4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jhoB09W4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765620697; x=1797156697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IooJ/IvemR9rPixE68HpOqn26w6yzlx+m0njrSBv7ic=;
  b=jhoB09W46NCeqACs5peL3o+8tTWFkpPVkmAbFc/7giJ3Aa7jGLFvO8XU
   zpIQGgm8q87CheHlq2x5taQS27pfYWLN5v17Co0l2VP/uoFB6OwAQ6oqL
   +RZFkgl0nK0SvT5BxjkjDsaXHcVLOGMyys+h7Ykc3ZlnupbauYNMUIezX
   1hA6ISrRIQNXLcK+K5PaPRqOeXiFaP4LU4HTp9N0qjW5Fy2nqpwohbq3p
   vyZvOzNGWSUM7N05SASDr+Eebdwe+oDeMLqxWl0pMGPP8tXRapCXXXt/d
   3rPLo9MQvjnHLHeQT9/sY+qAOIchLeCqLMizBPm+pbRzx5Fd2yQ8X2e6p
   Q==;
X-CSE-ConnectionGUID: QBlxzDe2REC84wP7mPYEhQ==
X-CSE-MsgGUID: IkMvQ1oSSiqfNGzcv/Zhbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71456385"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="71456385"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 02:11:30 -0800
X-CSE-ConnectionGUID: a7h/j92GTkqdflTJjBJd5Q==
X-CSE-MsgGUID: Xdoc+hOZTjKmdsFmZtfP3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197050366"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 02:11:29 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUMb0-000000007UD-2uOo;
	Sat, 13 Dec 2025 10:11:26 +0000
Date: Sat, 13 Dec 2025 18:10:42 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:ima-staging-v2-devel-v9 1/1]
 security/integrity/ima/ima_queue.c:44:22: error: conflicting types for
 'binary_runtime_size'
Message-ID: <202512131746.XY385Dct-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux ima-staging-v2-devel-v9
head:   0387b5fab703d305adb5d6fcba119dda4cf2eb05
commit: 0387b5fab703d305adb5d6fcba119dda4cf2eb05 [1/1] ima: Add support for staging measurements for deletion and trimming
config: xtensa-randconfig-r051-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131746.XY385Dct-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131746.XY385Dct-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131746.XY385Dct-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/limits.h:7,
                    from include/linux/overflow.h:6,
                    from include/linux/bits.h:32,
                    from arch/xtensa/include/asm/cmpxchg.h:16,
                    from arch/xtensa/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from security/integrity/ima/ima_queue.c:18:
   include/vdso/limits.h:13:19: error: invalid initializer
    #define ULONG_MAX (~0UL)
                      ^
   security/integrity/ima/ima_queue.c:43:57: note: in expansion of macro 'ULONG_MAX'
    static unsigned long binary_runtime_size[BINARY_SIZE] = ULONG_MAX;
                                                            ^~~~~~~~~
>> security/integrity/ima/ima_queue.c:44:22: error: conflicting types for 'binary_runtime_size'
    static unsigned long binary_runtime_size[BINARY_SIZE_FULL] = ULONG_MAX;
                         ^~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_queue.c:43:22: note: previous definition of 'binary_runtime_size' was here
    static unsigned long binary_runtime_size[BINARY_SIZE] = ULONG_MAX;
                         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/limits.h:7,
                    from include/linux/overflow.h:6,
                    from include/linux/bits.h:32,
                    from arch/xtensa/include/asm/cmpxchg.h:16,
                    from arch/xtensa/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from security/integrity/ima/ima_queue.c:18:
   include/vdso/limits.h:13:19: error: invalid initializer
    #define ULONG_MAX (~0UL)
                      ^
   security/integrity/ima/ima_queue.c:44:62: note: in expansion of macro 'ULONG_MAX'
    static unsigned long binary_runtime_size[BINARY_SIZE_FULL] = ULONG_MAX;
                                                                 ^~~~~~~~~
   security/integrity/ima/ima_queue.c:45:22: error: conflicting types for 'binary_runtime_size'
    static unsigned long binary_runtime_size[BINARY_SIZE_STAGED] = ULONG_MAX;
                         ^~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_queue.c:44:22: note: previous definition of 'binary_runtime_size' was here
    static unsigned long binary_runtime_size[BINARY_SIZE_FULL] = ULONG_MAX;
                         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/limits.h:7,
                    from include/linux/overflow.h:6,
                    from include/linux/bits.h:32,
                    from arch/xtensa/include/asm/cmpxchg.h:16,
                    from arch/xtensa/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from security/integrity/ima/ima_queue.c:18:
   include/vdso/limits.h:13:19: error: invalid initializer
    #define ULONG_MAX (~0UL)
                      ^
   security/integrity/ima/ima_queue.c:45:64: note: in expansion of macro 'ULONG_MAX'
    static unsigned long binary_runtime_size[BINARY_SIZE_STAGED] = ULONG_MAX;
                                                                   ^~~~~~~~~
   security/integrity/ima/ima_queue.c:44:22: warning: 'binary_runtime_size' defined but not used [-Wunused-variable]
    static unsigned long binary_runtime_size[BINARY_SIZE_FULL] = ULONG_MAX;
                         ^~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_queue.c:43:22: warning: 'binary_runtime_size' defined but not used [-Wunused-variable]
    static unsigned long binary_runtime_size[BINARY_SIZE] = ULONG_MAX;
                         ^~~~~~~~~~~~~~~~~~~


vim +/binary_runtime_size +44 security/integrity/ima/ima_queue.c

    35	
    36	LIST_HEAD(ima_measurements);	/* list of all measurements */
    37	LIST_HEAD(ima_measurements_staged); /* list of staged measurements */
    38	static LIST_HEAD(ima_measurements_trim); /* list of measurements to trim */
    39	bool ima_measurements_staged_exist; /* If there are staged measurements */
    40	#ifdef CONFIG_IMA_KEXEC
    41	static unsigned long binary_runtime_size[BINARY__LAST];
    42	#else
    43	static unsigned long binary_runtime_size[BINARY_SIZE] = ULONG_MAX;
  > 44	static unsigned long binary_runtime_size[BINARY_SIZE_FULL] = ULONG_MAX;
    45	static unsigned long binary_runtime_size[BINARY_SIZE_STAGED] = ULONG_MAX;
    46	#endif
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
