Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880CC168C4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 11:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711194721; cv=none; b=U4BqTGdCRoBWFjFm9NR/gE/Wz24SvKdpfoXGGtrJ3GuQGWh6U9mNmUWRYNXQxQbCMsAGvjpEXRWCVAiPHsfhyxsDC1uORMzofun8Mz4gz0pAWW39CoRvhndYPXZ753HYzYsX7u9LxVILim2OAYtMkcDU9Gg18I8qv7URGl8fpSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711194721; c=relaxed/simple;
	bh=AxIsPGe6o0ieDfHykBpKm+4aXPCaQETpQXklptXJUdw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MTAKU3rZ6DNo53hJo0kErGx7aQ1vodO5fS6QulZyMXskbxkSQA+UG3T9XEFSdlkhrui8as0dbi1P9ZfL7pZUFs6aVBke0XqSLS+fKMRh3pHkGp5bNdwAeIlhTbZdJepGkxpHPuLnKhKLI8oNvvQ8e9mtMmNqpkUgXzuV1UEbv9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDr/w8ys; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDr/w8ys"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711194720; x=1742730720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AxIsPGe6o0ieDfHykBpKm+4aXPCaQETpQXklptXJUdw=;
  b=jDr/w8ysvGajfIh6CTx++S2AJsm2qYymsO5Suz6UepoMPfiOgtc/hKeW
   z803GHfYtZVoY6PxLRwai282+KHw3ctJfSL5KGkkEgJTLUs1QuiF4uw8r
   j5xpr7RQc56R8yNK4zIUQkGl6sd2zJIKdYppfDtOEqQ0LBu69gnah1973
   chWZlHismm9/QGSZ7ZOsVVHWRKR6BD07KsKVtbXk4NT3+LppRi3VS9tRK
   rPW1eY5WBv+iVSdTmLrNkOFa+roZEyqlPrYeaYtzC+2xQtJN098CiaQDW
   VnixOeq8HbxdFDtJ3fzKiaGTyDDPTfanwo6S5cQKBYKqGP9BhGGm0Mdh6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="10017991"
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="10017991"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 04:51:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="15169226"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Mar 2024 04:51:58 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnzul-000L7Z-19;
	Sat, 23 Mar 2024 11:51:55 +0000
Date: Sat, 23 Mar 2024 19:51:46 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-misc:arm64-gcs 48/48] include/linux/kern_levels.h:5:18:
 warning: format '%x' expects argument of type 'unsigned int', but argument 2
 has type 'vm_fault_t (* const)(struct vm_fault *, unsigned int) {aka
 unsigned int (* const)(struct vm_fault *, unsigned int)}'
Message-ID: <202403231924.G9zotxeh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git arm64-gcs
head:   64bdef3832272bcbfafd7ff13aa1113fb12c8612
commit: 64bdef3832272bcbfafd7ff13aa1113fb12c8612 [48/48] DEBUG
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20240323/202403231924.G9zotxeh-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403231924.G9zotxeh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403231924.G9zotxeh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:31:0,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/kernel_stat.h:5,
                    from mm/memory.c:42:
   mm/memory.c: In function 'wp_huge_pmd':
>> include/linux/kern_levels.h:5:18: warning: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'vm_fault_t (* const)(struct vm_fault *, unsigned int) {aka unsigned int (* const)(struct vm_fault *, unsigned int)}' [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:427:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:488:2: note: in expansion of macro 'printk'
     printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:10:19: note: in expansion of macro 'KERN_SOH'
    #define KERN_CRIT KERN_SOH "2" /* critical conditions */
                      ^~~~~~~~
   include/linux/printk.h:488:9: note: in expansion of macro 'KERN_CRIT'
     printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~~
   mm/memory.c:5082:4: note: in expansion of macro 'pr_crit'
       pr_crit("SHARED/MAYSHARE %x\n",
       ^~~~~~~
   mm/memory.c:5082:30: note: format string is defined here
       pr_crit("SHARED/MAYSHARE %x\n",
                                ~^


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
