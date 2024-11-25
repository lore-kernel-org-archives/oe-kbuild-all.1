Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C512500CC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 20:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732565410; cv=none; b=OQJhhoX8X+T8EkZXdL3vYY2cW295/F7OkF6I9lbPLbJQILvkDTa60Tnr4RLldaSRUjCLfL9Fg8yCV5b8qb66AT93wleKkLOHgiqr6S2B2UgIl1bVY+1fHjQyLD3IzMLg4CO0dGEYkhoz4OseV07bJ34YjL1ant7ui5UbBW7bD3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732565410; c=relaxed/simple;
	bh=FyMMH6kjiveF6scjZjqM6z2EzlBJcmZTdJVyFLg5aH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wv0z8Wy9e9lDHkBNxDwCWD+rubqm9ggH4aLA4wVasjlJZvoyzjF8ZH/xEtPYOB9gGJ5lkPKwrBsxRFmUFuu1vAYUHCaQ+s5+SllRsdzN5Ar+p54eZLcwbe+gZ8QOObEXW/pTpoy0XpEkAOUdGgqn82WZ5/raRZzC3ossWXQknUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bj2YSNbA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bj2YSNbA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732565409; x=1764101409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FyMMH6kjiveF6scjZjqM6z2EzlBJcmZTdJVyFLg5aH4=;
  b=Bj2YSNbAlg4UlXxVQpOrsqzICFO9cZpb5xt2nbGSWEwp3Onl8dE9s6pG
   ZGGbuEsBiRFaKdf+Z3eTtIXXd2JgIdJT4ZyNKLMyALnNN1Y+JOFC+kpkT
   C3RdUKRhllT3CNG0cSOKOBz99ty/fKbd25czhkLf+yIppwWUB+1TqJ2wo
   NbHZxmc4kQvMH4r6tI4qa1g0xCEGYhPC4U/ALDnQ2ii+xPDnSLC/8CqaE
   tDXd06LvGJ73DORkRAtgeW8iNUG+AKuMLc0H5wqK89z4hGZujKopHXGUW
   QDs0OUOlhEkGY+w00mSa7cTSWxjBlk8DRjfutLpX355vrSotJbU/lPrHJ
   g==;
X-CSE-ConnectionGUID: d7xZnizjQmS1rJAijSs1sw==
X-CSE-MsgGUID: KqbfWzP+QraXfG0c/+ZZNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="50104773"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="50104773"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 12:10:08 -0800
X-CSE-ConnectionGUID: BCAYm0xsRNax2jvHJ1x+Wg==
X-CSE-MsgGUID: 7AvzmrK7TnqsmKZ0UC0IAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="91005548"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Nov 2024 12:10:07 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFfPJ-0006lV-0t;
	Mon, 25 Nov 2024 20:10:05 +0000
Date: Tue, 26 Nov 2024 04:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:objtool/core 11/12] arch/alpha/include/asm/bug.h:8:10:
 fatal error: linux/unreachable.: No such file or directory
Message-ID: <202411260435.RIiaiMij-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/core
head:   a5091c456d5d4e22f5729d7600080b18a37f10a2
commit: c8c3c26f8472d8f4c42efd523f2abed1f52e5653 [11/12] compiler: Move unreachable() into its own header
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241126/202411260435.RIiaiMij-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411260435.RIiaiMij-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411260435.RIiaiMij-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
>> arch/alpha/include/asm/bug.h:8:10: fatal error: linux/unreachable.: No such file or directory
       8 | #include <linux/unreachable.>
         |          ^~~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:102: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +8 arch/alpha/include/asm/bug.h

     6	
     7	#ifdef CONFIG_BUG
   > 8	#include <linux/unreachable.>
     9	#include <asm/pal.h>
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
