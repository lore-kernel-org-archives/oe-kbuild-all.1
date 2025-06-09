Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0CA227EA0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jun 2025 23:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749511395; cv=none; b=lLtvi/ouHXNE7b495ZqPwKyUJ9ZH/BmzAcGxHxjHAsAs9G9vwFDoCpsWXNwYlu5tdMzYWQDQcnAyH/IDvL9QzC2K30lZTgdjcgxsQH84vcUQXZUBAcFY6F+Ewc/xidwcJnVUeFAQv5yxCUH2TeuR3pKyV5+50bD5Mq2YEWcE/ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749511395; c=relaxed/simple;
	bh=+YVDJ3g6nuvD9EVh4gBhW0D/4OVm1+ILSmCNKJjQWNE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kBiVmRmqCA4HWPQkD7/3EJRhcAr3f7ap9Lmv8ZyisvZxBx+y0L0jS1AFZkGnmdPH8ZEFBS3lUzv8fi2w0t2AqIzoMRw6/RMb7e+6qSha3kqFqvRB1bKarU7Klh5sJJr05r7+zQnIsSjxoMQj0uUbD+yt+H9BSWVEDECG7pqof0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0kGLRkb; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0kGLRkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749511394; x=1781047394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+YVDJ3g6nuvD9EVh4gBhW0D/4OVm1+ILSmCNKJjQWNE=;
  b=K0kGLRkbj18qyxPq7ePRJDZmd7rnWt5HUCI7c5Ltf85VchY2ETyJ7zel
   /ybWi6X9u3ys4bjCSn8bAnn+UX2lSf/vFL5W2c1dNdEmQKn+96SyZAk1s
   8bg8abOoydln9INxH/fB//DqQD5tFQ5sexqoKd0B5THhAt7X+whb1kaEa
   ejAnxTL2NC4hQtzBofZd702o4iEQ+L8SU0CNrLCuWHaM2PF8V1yHGDS3g
   Kn8+X2oUIx1xdklokawmd/np2mlFSh+7fcYAZFqCk7Fy6JkQbtFz3sQJO
   VhKL3EvyR+Ho+uYK5kIHmQFKENlX5+hvGu6pfLHJDZot90lc/rhlKCI4f
   Q==;
X-CSE-ConnectionGUID: t1C/2tLgRLSaubBlRavWtw==
X-CSE-MsgGUID: MgkdHKa1QeaJzH01jASorA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51594754"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="51594754"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 16:23:14 -0700
X-CSE-ConnectionGUID: XD+s64dkQUaEF+UW43WgXQ==
X-CSE-MsgGUID: h27BjjllTy+BN+sK2oWsiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="151654523"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Jun 2025 16:23:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOlpd-0007VL-3C;
	Mon, 09 Jun 2025 23:23:09 +0000
Date: Tue, 10 Jun 2025 07:22:55 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build 42/62] arch/x86/include/asm/asm-offsets.h:1:10:
 fatal error: generated/asm-offsets.h: No such file or directory
Message-ID: <202506100732.VjIpaw38-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   e98afd9ceb51eb5f3023d555b822e1ae8ed9325d
commit: a7bcb4be2c8e4c7111e65ae0ce9ffebec202a2a3 [42/62] x86/alternative: Define ELF section entry size for alternatives
config: um-randconfig-001-20250610 (https://download.01.org/0day-ci/archive/20250610/202506100732.VjIpaw38-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506100732.VjIpaw38-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100732.VjIpaw38-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/asm.h:140,
                    from arch/x86/include/asm/alternative.h:8,
                    from arch/x86/um/asm/barrier.h:6,
                    from include/linux/list.h:11,
                    from arch/um/include/linux/time-internal.h:9,
                    from arch/x86/um/asm/processor.h:4,
                    from include/linux/sched.h:13,
                    from arch/x86/um/shared/sysdep/kernel-offsets.h:3,
                    from arch/um/kernel/asm-offsets.c:1:
>> arch/x86/include/asm/asm-offsets.h:1:10: fatal error: generated/asm-offsets.h: No such file or directory
       1 | #include <generated/asm-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:98: arch/um/kernel/asm-offsets.s] Error 1 shuffle=2742578421
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1279: prepare0] Error 2 shuffle=2742578421
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2742578421
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2742578421
   make: Target 'prepare' not remade because of errors.


vim +1 arch/x86/include/asm/asm-offsets.h

559df2e0210352 Sam Ravnborg 2009-04-19 @1  #include <generated/asm-offsets.h>

:::::: The code at line 1 was first introduced by commit
:::::: 559df2e0210352f83926d178c40c51142292a18c kbuild: move asm-offsets.h to include/generated

:::::: TO: Sam Ravnborg <sam@ravnborg.org>
:::::: CC: Michal Marek <mmarek@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
