Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AE715B5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Oct 2023 02:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NcaEX8UA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696645727; x=1728181727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I0fEPOGEGcnYFhc7OhH7/ZGXqdQAjYJoJV0W9uy3BY0=;
  b=NcaEX8UAaB2mGtwRlqOrRwrE288u7m/Z0StV/1RrHcSGXDg25CIYPXAA
   C981REGSTDM94oeMnSoVtiMok1e4WBlqQb2fg+ElRodLTtpEL5okgLkTq
   3GXq9BRlqGY1L9hTJaswk1e9Ivo7BrDY1N7Fg+anQg3ANds07WMc1X4n8
   hHTIL4KhmrLdX7TZYj9JrQlFHIYEa8vwMpG5QShhtSnfBSrsjwh017X9t
   0cnzx7otoV3S1RZEtWN4BQShYFRbKbaDFkqHBtFttzsAi9mil15EqxSzV
   6H/Vw0fJxr5NW4Zbcfo7Rof5UeBxXQ/S5pUTLn62fqIadOj/sUxFuufYK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="387754396"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="387754396"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 19:28:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="822716198"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="822716198"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Oct 2023 19:28:41 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qox3W-0003rf-36;
	Sat, 07 Oct 2023 02:28:38 +0000
Date: Sat, 7 Oct 2023 10:27:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/sh/boot/compressed/misc.c:118:6: warning: no previous prototype
 for 'arch_ftrace_ops_list_func'
Message-ID: <202310071027.0aAVx4iY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steven,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   82714078aee4ccbd6ee7579d5a21f8a72155d0fb
commit: 17b251a290ba84a0c2c5c82df9596cb2e7207ca6 ftrace/sh: Add arch_ftrace_ops_list_func stub to have compressed image still link
date:   1 year, 11 months ago
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20231007/202310071027.0aAVx4iY-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231007/202310071027.0aAVx4iY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310071027.0aAVx4iY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sh/boot/compressed/misc.c:109:6: warning: no previous prototype for '__stack_chk_fail' [-Wmissing-prototypes]
     109 | void __stack_chk_fail(void)
         |      ^~~~~~~~~~~~~~~~
   arch/sh/boot/compressed/misc.c:115:6: warning: no previous prototype for 'ftrace_stub' [-Wmissing-prototypes]
     115 | void ftrace_stub(void)
         |      ^~~~~~~~~~~
>> arch/sh/boot/compressed/misc.c:118:6: warning: no previous prototype for 'arch_ftrace_ops_list_func' [-Wmissing-prototypes]
     118 | void arch_ftrace_ops_list_func(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/sh/boot/compressed/misc.c:128:6: warning: no previous prototype for 'decompress_kernel' [-Wmissing-prototypes]
     128 | void decompress_kernel(void)
         |      ^~~~~~~~~~~~~~~~~


vim +/arch_ftrace_ops_list_func +118 arch/sh/boot/compressed/misc.c

   113	
   114	/* Needed because vmlinux.lds.h references this */
   115	void ftrace_stub(void)
   116	{
   117	}
 > 118	void arch_ftrace_ops_list_func(void)
   119	{
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
