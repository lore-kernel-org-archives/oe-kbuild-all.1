Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7B6D269
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 05:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/ODnpe8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699507817; x=1731043817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zxllkmvSAjvskHBATT38GLxkQbqbFr601qb67yvHbDQ=;
  b=K/ODnpe8yln2bXBfMBaya0jX/fdp9N4CV658lqgPcMqFsAbNkRggDtHc
   YpJuQD0fvtqo7b9sGemavQChIcdJDhQnE/HFrTbxnZX74MrlTZLjmqWt2
   e8aG0oQt6bS2JTyflG/Iq2HPD2HN11L4+mZdUnQYj14MMcF3+LCr4OuVR
   ne6qf2za0/8ILI4d/xQceoMl8qnGgefZNqL52Z/JXQafzDg2df4rl4PHT
   fSnxSNWYBwVnJMkKcY2lMqnbOBfo6bVmZhFbn3n+fgGZ7d92dbhBrKVog
   HVSb5yNcUeUJ18tnKHy5Wwwsig3G8RRgCKrMQ6m2d8Hh53yJpZnqrEp8s
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="454224067"
X-IronPort-AV: E=Sophos;i="6.03,288,1694761200"; 
   d="scan'208";a="454224067"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 21:30:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="936738361"
X-IronPort-AV: E=Sophos;i="6.03,288,1694761200"; 
   d="scan'208";a="936738361"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Nov 2023 21:30:15 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0xcL-0008Vo-0z;
	Thu, 09 Nov 2023 05:30:13 +0000
Date: Thu, 9 Nov 2023 13:30:09 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 9/10] arch/x86/include/asm/user_unwind.h:6:27:
 warning: overflow in conversion from 'long unsigned int' to 'int' changes
 value from '18446744073709551608' to '-8'
Message-ID: <202311091351.fO2QPxCn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   ec004e900e02c9c85cf8c89d4c26d4168a6c5d18
commit: 09460e60dd1c2f8ea1abb8d9188195db699ce76f [9/10] unwind: Introduce SFrame user space unwinding
config: x86_64-buildonly-randconfig-006-20231109 (https://download.01.org/0day-ci/archive/20231109/202311091351.fO2QPxCn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311091351.fO2QPxCn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311091351.fO2QPxCn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/unwind/user.c:9:
>> arch/x86/include/asm/user_unwind.h:6:27: warning: overflow in conversion from 'long unsigned int' to 'int' changes value from '18446744073709551608' to '-8' [-Woverflow]
       6 |         .ra_off         = sizeof(long) * -1,                            \
         |                           ^~~~~~
   kernel/unwind/user.c:12:9: note: in expansion of macro 'ARCH_INIT_USER_FP_FRAME'
      12 |         ARCH_INIT_USER_FP_FRAME
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/user_unwind.h:8:27: warning: overflow in conversion from 'long unsigned int' to 'int' changes value from '18446744073709551600' to '-16' [-Woverflow]
       8 |         .fp_off         = sizeof(long) * -2,                            \
         |                           ^~~~~~
   kernel/unwind/user.c:12:9: note: in expansion of macro 'ARCH_INIT_USER_FP_FRAME'
      12 |         ARCH_INIT_USER_FP_FRAME
         |         ^~~~~~~~~~~~~~~~~~~~~~~


vim +6 arch/x86/include/asm/user_unwind.h

28efef61435d2fb Josh Poimboeuf 2023-11-07   4  
28efef61435d2fb Josh Poimboeuf 2023-11-07   5  #define ARCH_INIT_USER_FP_FRAME						\
28efef61435d2fb Josh Poimboeuf 2023-11-07  @6  	.ra_off		= sizeof(long) * -1,				\
28efef61435d2fb Josh Poimboeuf 2023-11-07   7  	.cfa_off	= sizeof(long) * 2,				\
28efef61435d2fb Josh Poimboeuf 2023-11-07   8  	.fp_off		= sizeof(long) * -2,				\
28efef61435d2fb Josh Poimboeuf 2023-11-07   9  	.use_fp		= true,
28efef61435d2fb Josh Poimboeuf 2023-11-07  10  

:::::: The code at line 6 was first introduced by commit
:::::: 28efef61435d2fbb42bf26277adae0c630e05cf4 unwind/x86: Add HAVE_USER_UNWIND

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
