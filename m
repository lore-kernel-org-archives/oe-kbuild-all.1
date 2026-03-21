Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9DC2C234B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774107811; cv=none; b=TCO90MyrTQ9gLnnXoEd0MKd2fsUPwjlctBfTj14qal3RmXGXJ757sfA4p2uFuB5NB09xa/TYzcupnQ8qujowYvo+Dbj55NGS+zwekiupFQhvsoYB2T4kirFT5flYKeLMiTeiUepDIl/UMSucaVR/v1iB4fPUcsomW69fMT6oHPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774107811; c=relaxed/simple;
	bh=LtAatmLqZlr/2ClMD6HnsGcvxuV6GuFwmn0NK6VELMQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VdhaaRLMSeVGG9fcqh9aBaKQbuUYgyb59DeSgpUzZoBLur+Vu/9PqPumHJPkOrVPL3Zacw+bWF2lzojRRTLshiEJNvG4OLA4xFp8III7cjoeNLG68+NigVJo6ny7BAdIhienwUaSQA9CgRkjvCrIEVF5b396PGXavZh1xpSS9eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Leb/whqS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Leb/whqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774107810; x=1805643810;
  h=date:from:to:cc:subject:message-id;
  bh=LtAatmLqZlr/2ClMD6HnsGcvxuV6GuFwmn0NK6VELMQ=;
  b=Leb/whqSxogvhFOWaOblWhiE+GAevPeT4aSTyKTkt6JxFTf1ku4faRIG
   h+7sMpu+hxwct12qwFAiXeFT16dvWSuilc0rITnzsubfr2R7W/IkRjP6S
   EQepR47gQpqsNWvDk/d0W80GVjCL71CTDTpBsYNwy32aN4ilBhEsLDTTh
   bP8c8u/I4OJhwUt921hVDIvfoXcLXME4a31Y27847rZwoLJtd8CXPqS+X
   hUymwVngrsHq8pvUb0psod973+9CO9BEhPHNiw4UXJhyGEYnNRXwJBIo0
   EtcLwDTveTDL4Ugl5w9YUi2Ccc7brdHkvU/+XGjt8Mm5LihwpVf7e5KmY
   A==;
X-CSE-ConnectionGUID: Oz9onscZTDKac9RD0LR0Zw==
X-CSE-MsgGUID: 4amJiCFKTqOhGNiizgDasw==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="85800181"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="85800181"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 08:43:29 -0700
X-CSE-ConnectionGUID: XxXLDW0FQbSpkPP3SUdj9w==
X-CSE-MsgGUID: n54P8EuYRKK5TkOQ2yftag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="220858110"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Mar 2026 08:43:27 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3yU1-000000000wf-15xm;
	Sat, 21 Mar 2026 15:43:25 +0000
Date: Sat, 21 Mar 2026 23:42:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:lib-raid6 33/33] lib/raid/raid6/x86/sse1.c:32:9:
 error: call to undeclared function 'boot_cpu_has'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202603212336.KaoBZlUh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git lib-raid6
head:   83a13a72f6f47b7ba7d26a200575edb70bf23c70
commit: 83a13a72f6f47b7ba7d26a200575edb70bf23c70 [33/33] raid6: hide internals
config: i386-randconfig-003-20260321 (https://download.01.org/0day-ci/archive/20260321/202603212336.KaoBZlUh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603212336.KaoBZlUh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603212336.KaoBZlUh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/raid/raid6/x86/sse1.c:32:9: error: call to undeclared function 'boot_cpu_has'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      32 |         return boot_cpu_has(X86_FEATURE_MMX) &&
         |                ^
>> lib/raid/raid6/x86/sse1.c:33:17: error: use of undeclared identifier 'X86_FEATURE_XMM'
      33 |                 (boot_cpu_has(X86_FEATURE_XMM) ||
         |                               ^
>> lib/raid/raid6/x86/sse1.c:34:17: error: use of undeclared identifier 'X86_FEATURE_MMXEXT'
      34 |                  boot_cpu_has(X86_FEATURE_MMXEXT));
         |                               ^
>> lib/raid/raid6/x86/sse1.c:32:22: error: use of undeclared identifier 'X86_FEATURE_MMX'; did you mean 'XFEATURE_MAX'?
      32 |         return boot_cpu_has(X86_FEATURE_MMX) &&
         |                             ^~~~~~~~~~~~~~~
         |                             XFEATURE_MAX
   arch/x86/include/asm/fpu/types.h:130:2: note: 'XFEATURE_MAX' declared here
     130 |         XFEATURE_MAX,
         |         ^
   4 errors generated.
--
>> lib/raid/raid6/x86/mmx.c:29:9: error: call to undeclared function 'boot_cpu_has'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      29 |         return boot_cpu_has(X86_FEATURE_MMX);
         |                ^
>> lib/raid/raid6/x86/mmx.c:29:22: error: use of undeclared identifier 'X86_FEATURE_MMX'; did you mean 'XFEATURE_MAX'?
      29 |         return boot_cpu_has(X86_FEATURE_MMX);
         |                             ^~~~~~~~~~~~~~~
         |                             XFEATURE_MAX
   arch/x86/include/asm/fpu/types.h:130:2: note: 'XFEATURE_MAX' declared here
     130 |         XFEATURE_MAX,
         |         ^
   2 errors generated.


vim +/boot_cpu_has +32 lib/raid/raid6/x86/sse1.c

^1da177e4c3f41 drivers/md/raid6sse1.c Linus Torvalds 2005-04-16  28  
^1da177e4c3f41 drivers/md/raid6sse1.c Linus Torvalds 2005-04-16  29  static int raid6_have_sse1_or_mmxext(void)
^1da177e4c3f41 drivers/md/raid6sse1.c Linus Torvalds 2005-04-16  30  {
^1da177e4c3f41 drivers/md/raid6sse1.c Linus Torvalds 2005-04-16  31  	/* Not really boot_cpu but "all_cpus" */
^1da177e4c3f41 drivers/md/raid6sse1.c Linus Torvalds 2005-04-16 @32  	return boot_cpu_has(X86_FEATURE_MMX) &&
^1da177e4c3f41 drivers/md/raid6sse1.c Linus Torvalds 2005-04-16 @33  		(boot_cpu_has(X86_FEATURE_XMM) ||
^1da177e4c3f41 drivers/md/raid6sse1.c Linus Torvalds 2005-04-16 @34  		 boot_cpu_has(X86_FEATURE_MMXEXT));
^1da177e4c3f41 drivers/md/raid6sse1.c Linus Torvalds 2005-04-16  35  }
^1da177e4c3f41 drivers/md/raid6sse1.c Linus Torvalds 2005-04-16  36  

:::::: The code at line 32 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
