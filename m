Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9781E25F7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 19:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741461902; cv=none; b=G1uo17xikLuvwhAJtExibndhm6Z/MKnTuZ3qExA4wNJfnIwS05bDmAumYOLd5RnXTlMm0oH26EpZM1NGaYfaqLUEHTQ3d0vnPXIQKAPkcfDZ7BtP8qYgBEl87KzAhiT2r7OaZO2Igxjj0hpQcX4RAyfAenwTRtS6OCFGJdG/k4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741461902; c=relaxed/simple;
	bh=HhbOldiuI4PZeu3Ga2ZkpDKSjq5XYmDmUu6XMlwaH4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DzJpUMGkYxhwITvGBjBfBDbDeQBPbtcd0L60CU4cXxsb5zi+x7RrMrMBUqOk8AKCbSKzO+F9K7GaJTl7YgRyHhrzCzHnflU1hIU5mpGDtEa2U2wSSlXxCHWaIXlcnd+X9fMjwQnsw+ggAVWbgTR4V4ICqzqnjxRL/ZAk1Og6vzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HT8I2DhK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HT8I2DhK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741461900; x=1772997900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HhbOldiuI4PZeu3Ga2ZkpDKSjq5XYmDmUu6XMlwaH4E=;
  b=HT8I2DhKKLsp6tfqDLuX3n7YM5zsQ86Dy8RKSK0u3j19kKtAXVziP3Tv
   ZdPkcoXhVYvmJjMMEbPAwDO2OxYVWvRWBPW8mMF4gOAvjxpGQxEBNpWzH
   m3SQIoygwqcV+44e85W45Y2y1llISPkzKzGaqKw7D8LBZU5ww4UtvL3V9
   5mn10VoQFZZPVq7y59/N5PLSIzmsGoGcocgqYILyJLjOqyan+rtdLVyfj
   Xp5FjCpLzbFMD8ZiK+3szC37Mu52m5bXwd+WFgbKBtkMGi0LSKKEEL/GH
   qTeuBTSQGfstxhsV11IdGui6v+Gj7E/1zF0yEfu+IlL0Zj0wj9PqkLorI
   w==;
X-CSE-ConnectionGUID: q4Ycj9HTSga8VvX4clEkGw==
X-CSE-MsgGUID: 3rrapw0FRbyaqSc/YNqugQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42633295"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="42633295"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 11:25:00 -0800
X-CSE-ConnectionGUID: C0HgKwn7RWCrM+kXqBdsOw==
X-CSE-MsgGUID: AsDEWn91QQGsNMkpDNW9KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120512832"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 08 Mar 2025 11:24:58 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqzn5-0002EW-0S;
	Sat, 08 Mar 2025 19:24:55 +0000
Date: Sun, 9 Mar 2025 03:24:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:nfsd-tracepoints 9/9] fs/nfsd/nfsproc.c:508:9: error:
 implicit declaration of function 'trace_nfsd_proc_symlink'; did you mean
 'nfsd_proc_symlink'?
Message-ID: <202503090353.0wOdDYtM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git nfsd-tracepoints
head:   7162c90c3e04a073c111a5821e529377ce2ab43f
commit: 7162c90c3e04a073c111a5821e529377ce2ab43f [9/9] nfsd: add tracepoints for symlink events
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250309/202503090353.0wOdDYtM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503090353.0wOdDYtM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503090353.0wOdDYtM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/nfsd/nfsproc.c: In function 'nfsd_proc_create':
   fs/nfsd/nfsproc.c:295:9: error: implicit declaration of function 'trace_nfsd_proc_create'; did you mean 'nfsd_proc_create'? [-Wimplicit-function-declaration]
     295 |         trace_nfsd_proc_create(rqstp, dirfhp, S_IFREG, argp->name, argp->len);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_create
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_symlink':
>> fs/nfsd/nfsproc.c:508:9: error: implicit declaration of function 'trace_nfsd_proc_symlink'; did you mean 'nfsd_proc_symlink'? [-Wimplicit-function-declaration]
     508 |         trace_nfsd_proc_symlink(rqstp, &argp->ffh, argp->fname, argp->flen,
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_symlink
>> fs/nfsd/nfsproc.c:542:1: error: invalid storage class for function 'nfsd_proc_mkdir'
     542 | nfsd_proc_mkdir(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_mkdir':
   fs/nfsd/nfsproc.c:550:9: error: implicit declaration of function 'trace_nfsd_proc_mkdir'; did you mean 'nfsd_proc_mkdir'? [-Wimplicit-function-declaration]
     550 |         trace_nfsd_proc_mkdir(rqstp, &argp->fh, S_IFDIR, argp->name, argp->len);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_mkdir
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_symlink':
>> fs/nfsd/nfsproc.c:575:1: error: invalid storage class for function 'nfsd_proc_rmdir'
     575 | nfsd_proc_rmdir(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~
>> fs/nfsd/nfsproc.c:589:13: error: invalid storage class for function 'nfsd_init_dirlist_pages'
     589 | static void nfsd_init_dirlist_pages(struct svc_rqst *rqstp,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfsd/nfsproc.c:611:1: error: invalid storage class for function 'nfsd_proc_readdir'
     611 | nfsd_proc_readdir(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~~
>> fs/nfsd/nfsproc.c:639:1: error: invalid storage class for function 'nfsd_proc_statfs'
     639 | nfsd_proc_statfs(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~
>> fs/nfsd/nfsproc.c:824:28: error: initializer element is not constant
     824 |                 .pc_func = nfsd_proc_mkdir,
         |                            ^~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:824:28: note: (near initialization for 'nfsd_procedures2[14].pc_func')
   fs/nfsd/nfsproc.c:836:28: error: initializer element is not constant
     836 |                 .pc_func = nfsd_proc_rmdir,
         |                            ^~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:836:28: note: (near initialization for 'nfsd_procedures2[15].pc_func')
   fs/nfsd/nfsproc.c:847:28: error: initializer element is not constant
     847 |                 .pc_func = nfsd_proc_readdir,
         |                            ^~~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:847:28: note: (near initialization for 'nfsd_procedures2[16].pc_func')
   fs/nfsd/nfsproc.c:857:28: error: initializer element is not constant
     857 |                 .pc_func = nfsd_proc_statfs,
         |                            ^~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:857:28: note: (near initialization for 'nfsd_procedures2[17].pc_func')
   In file included from include/asm-generic/percpu.h:7,
                    from ./arch/m68k/include/generated/asm/percpu.h:1,
                    from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/namei.h:5,
                    from fs/nfsd/nfsproc.c:8:
>> include/linux/percpu-defs.h:92:40: error: section attribute cannot be specified for local variables
      92 |         extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;            \
         |                                        ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:151:9: note: in expansion of macro 'DEFINE_PER_CPU_SECTION'
     151 |         DEFINE_PER_CPU_SECTION(type, name, PER_CPU_ALIGNED_SECTION)     \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:869:8: note: in expansion of macro 'DEFINE_PER_CPU_ALIGNED'
     869 | static DEFINE_PER_CPU_ALIGNED(unsigned long,
         |        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:93:33: error: section attribute cannot be specified for local variables
      93 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;                   \
         |                                 ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:151:9: note: in expansion of macro 'DEFINE_PER_CPU_SECTION'
     151 |         DEFINE_PER_CPU_SECTION(type, name, PER_CPU_ALIGNED_SECTION)     \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:869:8: note: in expansion of macro 'DEFINE_PER_CPU_ALIGNED'
     869 | static DEFINE_PER_CPU_ALIGNED(unsigned long,
         |        ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/percpu-defs.h:93:33: error: declaration of '__pcpu_unique_nfsd_count2' with no linkage follows extern declaration
      93 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;                   \
         |                                 ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:151:9: note: in expansion of macro 'DEFINE_PER_CPU_SECTION'
     151 |         DEFINE_PER_CPU_SECTION(type, name, PER_CPU_ALIGNED_SECTION)     \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:869:8: note: in expansion of macro 'DEFINE_PER_CPU_ALIGNED'
     869 | static DEFINE_PER_CPU_ALIGNED(unsigned long,
         |        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:92:40: note: previous declaration of '__pcpu_unique_nfsd_count2' with type 'char[18]'
      92 |         extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;            \
         |                                        ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:151:9: note: in expansion of macro 'DEFINE_PER_CPU_SECTION'
     151 |         DEFINE_PER_CPU_SECTION(type, name, PER_CPU_ALIGNED_SECTION)     \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:869:8: note: in expansion of macro 'DEFINE_PER_CPU_ALIGNED'
     869 | static DEFINE_PER_CPU_ALIGNED(unsigned long,
         |        ^~~~~~~~~~~~~~~~~~~~~~
>> fs/nfsd/nfsproc.c:870:31: error: section attribute cannot be specified for local variables
     870 |                               nfsd_count2[ARRAY_SIZE(nfsd_procedures2)]);
         |                               ^~~~~~~~~~~
   include/linux/percpu-defs.h:94:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      94 |         extern __PCPU_ATTRS(sec) __typeof__(type) name;                 \
         |                                                   ^~~~
   fs/nfsd/nfsproc.c:869:8: note: in expansion of macro 'DEFINE_PER_CPU_ALIGNED'
     869 | static DEFINE_PER_CPU_ALIGNED(unsigned long,
         |        ^~~~~~~~~~~~~~~~~~~~~~
>> fs/nfsd/nfsproc.c:870:31: error: section attribute cannot be specified for local variables
     870 |                               nfsd_count2[ARRAY_SIZE(nfsd_procedures2)]);
         |                               ^~~~~~~~~~~
   include/linux/percpu-defs.h:95:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
         |                                                   ^~~~
   fs/nfsd/nfsproc.c:869:8: note: in expansion of macro 'DEFINE_PER_CPU_ALIGNED'
     869 | static DEFINE_PER_CPU_ALIGNED(unsigned long,
         |        ^~~~~~~~~~~~~~~~~~~~~~
>> fs/nfsd/nfsproc.c:870:31: error: weak declaration of 'nfsd_count2' must be public
     870 |                               nfsd_count2[ARRAY_SIZE(nfsd_procedures2)]);
         |                               ^~~~~~~~~~~
   include/linux/percpu-defs.h:95:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
         |                                                   ^~~~
   fs/nfsd/nfsproc.c:869:8: note: in expansion of macro 'DEFINE_PER_CPU_ALIGNED'
     869 | static DEFINE_PER_CPU_ALIGNED(unsigned long,
         |        ^~~~~~~~~~~~~~~~~~~~~~
>> fs/nfsd/nfsproc.c:870:31: error: declaration of 'nfsd_count2' with no linkage follows extern declaration
     870 |                               nfsd_count2[ARRAY_SIZE(nfsd_procedures2)]);
         |                               ^~~~~~~~~~~
   include/linux/percpu-defs.h:95:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
         |                                                   ^~~~
   fs/nfsd/nfsproc.c:869:8: note: in expansion of macro 'DEFINE_PER_CPU_ALIGNED'
     869 | static DEFINE_PER_CPU_ALIGNED(unsigned long,
         |        ^~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:870:31: note: previous declaration of 'nfsd_count2' with type 'long unsigned int[18]'
     870 |                               nfsd_count2[ARRAY_SIZE(nfsd_procedures2)]);
         |                               ^~~~~~~~~~~
   include/linux/percpu-defs.h:94:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      94 |         extern __PCPU_ATTRS(sec) __typeof__(type) name;                 \
         |                                                   ^~~~
   fs/nfsd/nfsproc.c:869:8: note: in expansion of macro 'DEFINE_PER_CPU_ALIGNED'
     869 | static DEFINE_PER_CPU_ALIGNED(unsigned long,
         |        ^~~~~~~~~~~~~~~~~~~~~~
>> fs/nfsd/nfsproc.c:878:1: error: expected declaration or statement at end of input
     878 | };
         | ^
>> fs/nfsd/nfsproc.c:871:26: warning: unused variable 'nfsd_version2' [-Wunused-variable]
     871 | const struct svc_version nfsd_version2 = {
         |                          ^~~~~~~~~~~~~
   fs/nfsd/nfsproc.c: At top level:
>> fs/nfsd/nfsproc.c:499:1: warning: 'nfsd_proc_symlink' defined but not used [-Wunused-function]
     499 | nfsd_proc_symlink(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~~
--
   nfsproc.c: In function 'nfsd_proc_create':
   nfsproc.c:295:9: error: implicit declaration of function 'trace_nfsd_proc_create'; did you mean 'nfsd_proc_create'? [-Wimplicit-function-declaration]
     295 |         trace_nfsd_proc_create(rqstp, dirfhp, S_IFREG, argp->name, argp->len);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_create
   nfsproc.c: In function 'nfsd_proc_symlink':
   nfsproc.c:508:9: error: implicit declaration of function 'trace_nfsd_proc_symlink'; did you mean 'nfsd_proc_symlink'? [-Wimplicit-function-declaration]
     508 |         trace_nfsd_proc_symlink(rqstp, &argp->ffh, argp->fname, argp->flen,
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_symlink
   nfsproc.c:542:1: error: invalid storage class for function 'nfsd_proc_mkdir'
     542 | nfsd_proc_mkdir(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~
   nfsproc.c: In function 'nfsd_proc_mkdir':
   nfsproc.c:550:9: error: implicit declaration of function 'trace_nfsd_proc_mkdir'; did you mean 'nfsd_proc_mkdir'? [-Wimplicit-function-declaration]
     550 |         trace_nfsd_proc_mkdir(rqstp, &argp->fh, S_IFDIR, argp->name, argp->len);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_mkdir
   nfsproc.c: In function 'nfsd_proc_symlink':
   nfsproc.c:575:1: error: invalid storage class for function 'nfsd_proc_rmdir'
     575 | nfsd_proc_rmdir(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~
   nfsproc.c:589:13: error: invalid storage class for function 'nfsd_init_dirlist_pages'
     589 | static void nfsd_init_dirlist_pages(struct svc_rqst *rqstp,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   nfsproc.c:611:1: error: invalid storage class for function 'nfsd_proc_readdir'
     611 | nfsd_proc_readdir(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~~
   nfsproc.c:639:1: error: invalid storage class for function 'nfsd_proc_statfs'
     639 | nfsd_proc_statfs(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~
   nfsproc.c:824:28: error: initializer element is not constant
     824 |                 .pc_func = nfsd_proc_mkdir,
         |                            ^~~~~~~~~~~~~~~
   nfsproc.c:824:28: note: (near initialization for 'nfsd_procedures2[14].pc_func')
   nfsproc.c:836:28: error: initializer element is not constant
     836 |                 .pc_func = nfsd_proc_rmdir,
         |                            ^~~~~~~~~~~~~~~
   nfsproc.c:836:28: note: (near initialization for 'nfsd_procedures2[15].pc_func')
   nfsproc.c:847:28: error: initializer element is not constant
     847 |                 .pc_func = nfsd_proc_readdir,
         |                            ^~~~~~~~~~~~~~~~~
   nfsproc.c:847:28: note: (near initialization for 'nfsd_procedures2[16].pc_func')
   nfsproc.c:857:28: error: initializer element is not constant
     857 |                 .pc_func = nfsd_proc_statfs,
         |                            ^~~~~~~~~~~~~~~~
   nfsproc.c:857:28: note: (near initialization for 'nfsd_procedures2[17].pc_func')
   In file included from include/asm-generic/percpu.h:7,
                    from arch/m68k/include/generated/asm/percpu.h:1,
                    from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/namei.h:5,
                    from nfsproc.c:8:
>> include/linux/percpu-defs.h:92:40: error: section attribute cannot be specified for local variables
      92 |         extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;            \
         |                                        ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:151:9: note: in expansion of macro 'DEFINE_PER_CPU_SECTION'
     151 |         DEFINE_PER_CPU_SECTION(type, name, PER_CPU_ALIGNED_SECTION)     \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   nfsproc.c:869:8: note: in expansion of macro 'DEFINE_PER_CPU_ALIGNED'
     869 | static DEFINE_PER_CPU_ALIGNED(unsigned long,
         |        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:93:33: error: section attribute cannot be specified for local variables
      93 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;                   \
         |                                 ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:151:9: note: in expansion of macro 'DEFINE_PER_CPU_SECTION'
     151 |         DEFINE_PER_CPU_SECTION(type, name, PER_CPU_ALIGNED_SECTION)     \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   nfsproc.c:869:8: note: in expansion of macro 'DEFINE_PER_CPU_ALIGNED'
     869 | static DEFINE_PER_CPU_ALIGNED(unsigned long,
         |        ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/percpu-defs.h:93:33: error: declaration of '__pcpu_unique_nfsd_count2' with no linkage follows extern declaration
      93 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;                   \
         |                                 ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:151:9: note: in expansion of macro 'DEFINE_PER_CPU_SECTION'
     151 |         DEFINE_PER_CPU_SECTION(type, name, PER_CPU_ALIGNED_SECTION)     \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   nfsproc.c:869:8: note: in expansion of macro 'DEFINE_PER_CPU_ALIGNED'
     869 | static DEFINE_PER_CPU_ALIGNED(unsigned long,
         |        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:92:40: note: previous declaration of '__pcpu_unique_nfsd_count2' with type 'char[18]'
      92 |         extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;            \
         |                                        ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:151:9: note: in expansion of macro 'DEFINE_PER_CPU_SECTION'
     151 |         DEFINE_PER_CPU_SECTION(type, name, PER_CPU_ALIGNED_SECTION)     \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   nfsproc.c:869:8: note: in expansion of macro 'DEFINE_PER_CPU_ALIGNED'
     869 | static DEFINE_PER_CPU_ALIGNED(unsigned long,
         |        ^~~~~~~~~~~~~~~~~~~~~~
   nfsproc.c:870:31: error: section attribute cannot be specified for local variables
     870 |                               nfsd_count2[ARRAY_SIZE(nfsd_procedures2)]);
         |                               ^~~~~~~~~~~
   include/linux/percpu-defs.h:94:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      94 |         extern __PCPU_ATTRS(sec) __typeof__(type) name;                 \
         |                                                   ^~~~
   nfsproc.c:869:8: note: in expansion of macro 'DEFINE_PER_CPU_ALIGNED'
     869 | static DEFINE_PER_CPU_ALIGNED(unsigned long,
         |        ^~~~~~~~~~~~~~~~~~~~~~
   nfsproc.c:870:31: error: section attribute cannot be specified for local variables
     870 |                               nfsd_count2[ARRAY_SIZE(nfsd_procedures2)]);
         |                               ^~~~~~~~~~~
   include/linux/percpu-defs.h:95:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
         |                                                   ^~~~
   nfsproc.c:869:8: note: in expansion of macro 'DEFINE_PER_CPU_ALIGNED'
     869 | static DEFINE_PER_CPU_ALIGNED(unsigned long,
         |        ^~~~~~~~~~~~~~~~~~~~~~
   nfsproc.c:870:31: error: weak declaration of 'nfsd_count2' must be public
     870 |                               nfsd_count2[ARRAY_SIZE(nfsd_procedures2)]);
         |                               ^~~~~~~~~~~
   include/linux/percpu-defs.h:95:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
         |                                                   ^~~~
   nfsproc.c:869:8: note: in expansion of macro 'DEFINE_PER_CPU_ALIGNED'
     869 | static DEFINE_PER_CPU_ALIGNED(unsigned long,
         |        ^~~~~~~~~~~~~~~~~~~~~~
   nfsproc.c:870:31: error: declaration of 'nfsd_count2' with no linkage follows extern declaration
     870 |                               nfsd_count2[ARRAY_SIZE(nfsd_procedures2)]);
         |                               ^~~~~~~~~~~
   include/linux/percpu-defs.h:95:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
         |                                                   ^~~~
   nfsproc.c:869:8: note: in expansion of macro 'DEFINE_PER_CPU_ALIGNED'
     869 | static DEFINE_PER_CPU_ALIGNED(unsigned long,
         |        ^~~~~~~~~~~~~~~~~~~~~~
   nfsproc.c:870:31: note: previous declaration of 'nfsd_count2' with type 'long unsigned int[18]'
     870 |                               nfsd_count2[ARRAY_SIZE(nfsd_procedures2)]);
         |                               ^~~~~~~~~~~
   include/linux/percpu-defs.h:94:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      94 |         extern __PCPU_ATTRS(sec) __typeof__(type) name;                 \
         |                                                   ^~~~
   nfsproc.c:869:8: note: in expansion of macro 'DEFINE_PER_CPU_ALIGNED'
     869 | static DEFINE_PER_CPU_ALIGNED(unsigned long,
         |        ^~~~~~~~~~~~~~~~~~~~~~
   nfsproc.c:878:1: error: expected declaration or statement at end of input
     878 | };
         | ^
   nfsproc.c:871:26: warning: unused variable 'nfsd_version2' [-Wunused-variable]
     871 | const struct svc_version nfsd_version2 = {
         |                          ^~~~~~~~~~~~~
   nfsproc.c: At top level:
   nfsproc.c:499:1: warning: 'nfsd_proc_symlink' defined but not used [-Wunused-function]
     499 | nfsd_proc_symlink(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~~


vim +508 fs/nfsd/nfsproc.c

   497	
   498	static __be32
 > 499	nfsd_proc_symlink(struct svc_rqst *rqstp)
   500	{
   501		struct nfsd_symlinkargs *argp = rqstp->rq_argp;
   502		struct nfsd_stat *resp = rqstp->rq_resp;
   503		struct nfsd_attrs attrs = {
   504			.na_iattr	= &argp->attrs,
   505		};
   506		struct svc_fh	newfh;
   507	
 > 508		trace_nfsd_proc_symlink(rqstp, &argp->ffh, argp->fname, argp->flen,
   509					argp->tname, argp->tlen);
   510	
   511		if (argp->tlen == 0) {
   512		if (argp->tlen > NFS_MAXPATHLEN) {
   513			resp->status = nfserr_nametoolong;
   514			goto out;
   515		}
   516	
   517		argp->tname = svc_fill_symlink_pathname(rqstp, &argp->first,
   518							page_address(rqstp->rq_arg.pages[0]),
   519							argp->tlen);
   520		if (IS_ERR(argp->tname)) {
   521			resp->status = nfserrno(PTR_ERR(argp->tname));
   522			goto out;
   523		}
   524	
   525		fh_init(&newfh, NFS_FHSIZE);
   526		resp->status = nfsd_symlink(rqstp, &argp->ffh, argp->fname, argp->flen,
   527					    argp->tname, &attrs, &newfh);
   528	
   529		kfree(argp->tname);
   530		fh_put(&argp->ffh);
   531		fh_put(&newfh);
   532	out:
   533		resp->status = nfsd_map_status(resp->status);
   534		return rpc_success;
   535	}
   536	
   537	/*
   538	 * Make directory. This operation is not idempotent.
   539	 * N.B. After this call resp->fh needs an fh_put
   540	 */
   541	static __be32
 > 542	nfsd_proc_mkdir(struct svc_rqst *rqstp)
   543	{
   544		struct nfsd_createargs *argp = rqstp->rq_argp;
   545		struct nfsd_diropres *resp = rqstp->rq_resp;
   546		struct nfsd_attrs attrs = {
   547			.na_iattr	= &argp->attrs,
   548		};
   549	
   550		trace_nfsd_proc_mkdir(rqstp, &argp->fh, S_IFDIR, argp->name, argp->len);
   551	
   552		if (resp->fh.fh_dentry) {
   553			printk(KERN_WARNING
   554				"nfsd_proc_mkdir: response already verified??\n");
   555		}
   556	
   557		argp->attrs.ia_valid &= ~ATTR_SIZE;
   558		fh_init(&resp->fh, NFS_FHSIZE);
   559		resp->status = nfsd_create(rqstp, &argp->fh, argp->name, argp->len,
   560					   &attrs, S_IFDIR, 0, &resp->fh);
   561		fh_put(&argp->fh);
   562		if (resp->status != nfs_ok)
   563			goto out;
   564	
   565		resp->status = fh_getattr(&resp->fh, &resp->stat);
   566	out:
   567		resp->status = nfsd_map_status(resp->status);
   568		return rpc_success;
   569	}
   570	
   571	/*
   572	 * Remove a directory
   573	 */
   574	static __be32
 > 575	nfsd_proc_rmdir(struct svc_rqst *rqstp)
   576	{
   577		struct nfsd_diropargs *argp = rqstp->rq_argp;
   578		struct nfsd_stat *resp = rqstp->rq_resp;
   579	
   580		dprintk("nfsd: RMDIR    %s %.*s\n", SVCFH_fmt(&argp->fh), argp->len, argp->name);
   581	
   582		resp->status = nfsd_unlink(rqstp, &argp->fh, S_IFDIR,
   583					   argp->name, argp->len);
   584		fh_put(&argp->fh);
   585		resp->status = nfsd_map_status(resp->status);
   586		return rpc_success;
   587	}
   588	
 > 589	static void nfsd_init_dirlist_pages(struct svc_rqst *rqstp,
   590					    struct nfsd_readdirres *resp,
   591					    u32 count)
   592	{
   593		struct xdr_buf *buf = &resp->dirlist;
   594		struct xdr_stream *xdr = &resp->xdr;
   595	
   596		memset(buf, 0, sizeof(*buf));
   597	
   598		/* Reserve room for the NULL ptr & eof flag (-2 words) */
   599		buf->buflen = clamp(count, (u32)(XDR_UNIT * 2), (u32)PAGE_SIZE);
   600		buf->buflen -= XDR_UNIT * 2;
   601		buf->pages = rqstp->rq_next_page;
   602		rqstp->rq_next_page++;
   603	
   604		xdr_init_encode_pages(xdr, buf, buf->pages,  NULL);
   605	}
   606	
   607	/*
   608	 * Read a portion of a directory.
   609	 */
   610	static __be32
 > 611	nfsd_proc_readdir(struct svc_rqst *rqstp)
   612	{
   613		struct nfsd_readdirargs *argp = rqstp->rq_argp;
   614		struct nfsd_readdirres *resp = rqstp->rq_resp;
   615		loff_t		offset;
   616	
   617		dprintk("nfsd: READDIR  %s %d bytes at %d\n",
   618			SVCFH_fmt(&argp->fh),		
   619			argp->count, argp->cookie);
   620	
   621		nfsd_init_dirlist_pages(rqstp, resp, argp->count);
   622	
   623		resp->common.err = nfs_ok;
   624		resp->cookie_offset = 0;
   625		offset = argp->cookie;
   626		resp->status = nfsd_readdir(rqstp, &argp->fh, &offset,
   627					    &resp->common, nfssvc_encode_entry);
   628		nfssvc_encode_nfscookie(resp, offset);
   629	
   630		fh_put(&argp->fh);
   631		resp->status = nfsd_map_status(resp->status);
   632		return rpc_success;
   633	}
   634	
   635	/*
   636	 * Get file system info
   637	 */
   638	static __be32
 > 639	nfsd_proc_statfs(struct svc_rqst *rqstp)
   640	{
   641		struct nfsd_fhandle *argp = rqstp->rq_argp;
   642		struct nfsd_statfsres *resp = rqstp->rq_resp;
   643	
   644		dprintk("nfsd: STATFS   %s\n", SVCFH_fmt(&argp->fh));
   645	
   646		resp->status = nfsd_statfs(rqstp, &argp->fh, &resp->stats,
   647					   NFSD_MAY_BYPASS_GSS_ON_ROOT);
   648		fh_put(&argp->fh);
   649		resp->status = nfsd_map_status(resp->status);
   650		return rpc_success;
   651	}
   652	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
