Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF63246BD8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 14:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761662000; cv=none; b=YFwGKedaSwCoOj0rCCfMB/K06CD/7rJjnVnee4+YaeEhdjlUH3ijgxYwUXzen5riBNOibiXWabt2ix1KvF6TOLznVanDfpZhrMV3uaxqijZvJR5mU65XEe9Ht/NFXBCMcFiCnWdIvTGfC6j/ZBWTVL3AwneUgUkbL/T278WEAtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761662000; c=relaxed/simple;
	bh=iGc/Butm+OibFBPHuVrJ8YVUjOOiO2vC79cQv2LCIFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uAeAhycNyQBhKtuYy4hdcXroB6JPynakw/px1+QpaX7DKyRs4WYaYkkHkEYChLBMFyeF5AJsP4t9H8sQU8/Nof7iU9XojN3qYjtyUdlCxalWgqduMQtsxzk7qFCh1ZOMLHrOrGBTS6gkWGwlX8UB30nu+Q9w0UtBffkbglCgbvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lb3rwDXS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lb3rwDXS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761662000; x=1793198000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iGc/Butm+OibFBPHuVrJ8YVUjOOiO2vC79cQv2LCIFk=;
  b=Lb3rwDXSk1Oq+JpLQ9kpBev6yfUqJQM4SYznglkAL+J7VhhH2dQv3mAJ
   K/HW9hMSCMu9X/IDdJMEFHGn/4AHzKMvPRom7FDO19ulujCEVkyZrBTPE
   yYsoZEMyMiF1sU3V+r2JkxFZ+e1g6efLVUlNafHyh3mjwHw7B3zLvT65E
   r9jcZ1x6l9ZEe2sI1J880Xiz5shefH9oWlblG+Noz4iD3sCibJ5cYJUCv
   KyJjwZLn4/Y/s+WDyYH2MNTh2Lf3oStHdqH4zvysllJsigvSGPnzmOo3E
   onAB+JgtfkeiZWv3Hrmls7aUbASkeSihrJZffwPznWxOWHF6Nj0+vwlZw
   A==;
X-CSE-ConnectionGUID: s9iG0Q2VSlWjY0v7ovV9Vw==
X-CSE-MsgGUID: JTMbHaO4QV+g3P/e4VUaxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63912442"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="63912442"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 07:33:19 -0700
X-CSE-ConnectionGUID: Ze9rx6HtSDuqtUp7jS5HNg==
X-CSE-MsgGUID: ZYDdIuXRQeKwF+Vwtq56uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="185279691"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 28 Oct 2025 07:33:17 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDkl9-000JEp-16;
	Tue, 28 Oct 2025 14:33:15 +0000
Date: Tue, 28 Oct 2025 22:32:58 +0800
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>
Subject: [uml:next 11/20] arch/um/include/shared/as-layout.h:9:10: fatal
 error: generated/asm-offsets.h: No such file or directory
Message-ID: <202510282211.2XMpghjt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
head:   8e03c195cc4d82100291500f772f85c686653748
commit: a7f7dbae94a5ae5cfbf2375e0d952c54b069fd7f [11/20] um: Remove file-based iomem emulation support
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20251028/202510282211.2XMpghjt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510282211.2XMpghjt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510282211.2XMpghjt-lkp@intel.com/

Note: the uml/next HEAD 8e03c195cc4d82100291500f772f85c686653748 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from arch/um/include/asm/pgtable.h:48,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:31,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from include/linux/audit.h:13,
                    from arch/um/kernel/asm-offsets.c:8:
>> arch/um/include/shared/as-layout.h:9:10: fatal error: generated/asm-offsets.h: No such file or directory
       9 | #include <generated/asm-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:182: arch/um/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +9 arch/um/include/shared/as-layout.h

4ff83ce1114827 arch/um/include/as-layout.h        Jeff Dike 2007-05-06   8  
9e636452d0714b arch/um/include/shared/as-layout.h Al Viro   2011-08-18  @9  #include <generated/asm-offsets.h>
54ae36f24b103e arch/um/include/as-layout.h        Jeff Dike 2007-10-16  10  

:::::: The code at line 9 was first introduced by commit
:::::: 9e636452d0714b08e4f8f4c58b76c4b7d15ffffa um: get rid of kern_constants.h

:::::: TO: Al Viro <viro@ftp.linux.org.uk>
:::::: CC: Richard Weinberger <richard@nod.at>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
