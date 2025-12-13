Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B8A20DE3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 22:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765665510; cv=none; b=Lm9kqyMCNQPxF3lweywkV+hCpbYYculsrMH3oYogECrHuzQE+PFh54bDCpuUG3YuKAJtYC5AoZbl7xfmMnffSMX9EtBFLUmREkofcTxJ+xCoHCjdS1NImXV54QDY/Kh466VUa7wANSQXD/fIeUPRcvSj4xlOCUGzBRJg6GSOx2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765665510; c=relaxed/simple;
	bh=eCyn2uZTZteH6XgiF2IyIHrS7vMRgOfH7vXBiKxAjdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fgCLM+WgdQewYFuVMfK2d+hcOeW5qhMJXt64qRRmuLFoJpXVxaBwX6EPmH96bD07TU+tt+p+FWw06qQ1vKlXXiNneQJy4vJWHWeymvjCtYtwzE0+LmzzitahJnMfSAJBZlTZLHl4P71CjtSd5wf3MXmf45EnCDrrLnrXoFJs1H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KfrLZw5M; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KfrLZw5M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765665508; x=1797201508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eCyn2uZTZteH6XgiF2IyIHrS7vMRgOfH7vXBiKxAjdE=;
  b=KfrLZw5MFxxkUtbdualjGkcPgCfB8yZqKCUNksaFOF0Z5Dh+nICb1u4Z
   vaDr9FP4HT7/5io69xVQQmjV0NUUz+1a61ymUW+P6wRDc5ZSKWn6EWWdh
   Nvu4pZH0SClf3dvVn+rNoSokurNn03/Wb4b6RWF/fsYFxETmZVVhgFMKM
   Qhuh1zbgJhcomzcEDYA6//t6FDDhJnWk3Y2g3sd3v9kCDkjcit7fmd5nP
   SfRJwtuoB6zemCRTdN60m7WA4LyhiI7fqC9AyCiqqXIuOFldDZ6ZihviP
   ziHNJwTkBC/bMnKqjDPesBibJQsoZCB1um2jt/J2uJJ0hiakLWhWTSKom
   Q==;
X-CSE-ConnectionGUID: 53N4xBerQTaMaIQnbCsHXw==
X-CSE-MsgGUID: U3wMpVEQQ3GTGjw7p2w51g==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67584987"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67584987"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 14:38:27 -0800
X-CSE-ConnectionGUID: 2srocK5bQPawfhBqWmgzTg==
X-CSE-MsgGUID: v49nr1/eTDK1yGKI3x3hAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="202300262"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Dec 2025 14:38:26 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUYFs-000000008HM-063S;
	Sat, 13 Dec 2025 22:38:24 +0000
Date: Sun, 14 Dec 2025 06:38:11 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:ima-staging-v2-devel-v9 1/1]
 security/integrity/ima/ima_queue.c:44:22: warning: 'binary_runtime_size'
 defined but not used
Message-ID: <202512140645.k34z9wJ7-lkp@intel.com>
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
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251214/202512140645.k34z9wJ7-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140645.k34z9wJ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140645.k34z9wJ7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/limits.h:7,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/current.h:6,
                    from ./arch/nios2/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from security/integrity/ima/ima_queue.c:18:
   include/vdso/limits.h:13:25: error: invalid initializer
      13 | #define ULONG_MAX       (~0UL)
         |                         ^
   security/integrity/ima/ima_queue.c:43:57: note: in expansion of macro 'ULONG_MAX'
      43 | static unsigned long binary_runtime_size[BINARY_SIZE] = ULONG_MAX;
         |                                                         ^~~~~~~~~
   security/integrity/ima/ima_queue.c:44:22: error: conflicting types for 'binary_runtime_size'; have 'long unsigned int[2]'
      44 | static unsigned long binary_runtime_size[BINARY_SIZE_FULL] = ULONG_MAX;
         |                      ^~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_queue.c:43:22: note: previous definition of 'binary_runtime_size' with type 'long unsigned int[0]'
      43 | static unsigned long binary_runtime_size[BINARY_SIZE] = ULONG_MAX;
         |                      ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/limits.h:7,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/current.h:6,
                    from ./arch/nios2/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from security/integrity/ima/ima_queue.c:18:
   include/vdso/limits.h:13:25: error: invalid initializer
      13 | #define ULONG_MAX       (~0UL)
         |                         ^
   security/integrity/ima/ima_queue.c:44:62: note: in expansion of macro 'ULONG_MAX'
      44 | static unsigned long binary_runtime_size[BINARY_SIZE_FULL] = ULONG_MAX;
         |                                                              ^~~~~~~~~
   security/integrity/ima/ima_queue.c:45:22: error: conflicting types for 'binary_runtime_size'; have 'long unsigned int[1]'
      45 | static unsigned long binary_runtime_size[BINARY_SIZE_STAGED] = ULONG_MAX;
         |                      ^~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_queue.c:44:22: note: previous definition of 'binary_runtime_size' with type 'long unsigned int[2]'
      44 | static unsigned long binary_runtime_size[BINARY_SIZE_FULL] = ULONG_MAX;
         |                      ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/limits.h:7,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/current.h:6,
                    from ./arch/nios2/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from security/integrity/ima/ima_queue.c:18:
   include/vdso/limits.h:13:25: error: invalid initializer
      13 | #define ULONG_MAX       (~0UL)
         |                         ^
   security/integrity/ima/ima_queue.c:45:64: note: in expansion of macro 'ULONG_MAX'
      45 | static unsigned long binary_runtime_size[BINARY_SIZE_STAGED] = ULONG_MAX;
         |                                                                ^~~~~~~~~
>> security/integrity/ima/ima_queue.c:44:22: warning: 'binary_runtime_size' defined but not used [-Wunused-variable]
      44 | static unsigned long binary_runtime_size[BINARY_SIZE_FULL] = ULONG_MAX;
         |                      ^~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_queue.c:43:22: warning: 'binary_runtime_size' defined but not used [-Wunused-variable]
      43 | static unsigned long binary_runtime_size[BINARY_SIZE] = ULONG_MAX;
         |                      ^~~~~~~~~~~~~~~~~~~


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
