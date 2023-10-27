Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4211C36AFA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 21:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DlgfglAZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698441239; x=1729977239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JE4UDZwYhaLzPMXPN+QSXU0Gmkz/bfwtkz731nwd94g=;
  b=DlgfglAZHpWnh9L7McaP7DBGLHNnEvlEa7e3zkCQztttoQOAjPfhAycD
   lYqEwbKRqMyDSk4yGXluhRvFBjEDVX8dZeXThflHC6mtGkya9hWOGfvd1
   LF22RerSDRLf1AfWGQPk1O0VU/l/uVp7S1dOAzKdJst6c7gU5vhupKb5Z
   TlVW3sy9Kh//4F06SnW8MUXedQUZqdJobu7y7we+HmySXDH3dZWiqETXN
   9iej0Av9I+O2fu2/de62S+j1wFjwuZp2QERcNsLvriVa0OpUnrTPKfrK6
   OBpJjQHAN2+OWYoRSx6eSE1yQotvSdWhZ/MI8XCo9T4eT0tHzc1S3z1qC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="385058705"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="385058705"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 14:13:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="788912119"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="788912119"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Oct 2023 14:13:57 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwU9T-000BCF-0S;
	Fri, 27 Oct 2023 21:13:55 +0000
Date: Sat, 28 Oct 2023 05:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [legion:patchset/meminfo/v2.1 1/1]
 meminfo.c:(.text.proc_meminfo_show+0x50): undefined reference to
 `mem_fill_meminfo'
Message-ID: <202310280543.unxoaVYM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git patchset/meminfo/v2.1
head:   74f700c787da4ba3818c90e1b0a93a0b597dfa5c
commit: 74f700c787da4ba3818c90e1b0a93a0b597dfa5c [1/1] proc: Implement /proc/self/meminfo
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20231028/202310280543.unxoaVYM-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310280543.unxoaVYM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310280543.unxoaVYM-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/head.o: in function `__kernel_entry':
   (.text+0x0): relocation truncated to fit: R_MIPS_26 against `kernel_entry'
   arch/mips/kernel/head.o: in function `smp_bootstrap':
   (.ref.text+0xd8): relocation truncated to fit: R_MIPS_26 against `start_secondary'
   init/main.o: in function `set_reset_devices':
   main.c:(.init.text+0x10): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x18): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `debug_kernel':
   main.c:(.init.text+0x50): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x58): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `quiet_kernel':
   main.c:(.init.text+0x90): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x98): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `warn_bootconfig':
   main.c:(.init.text+0xd0): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0xd8): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `init_setup':
   main.c:(.init.text+0x108): additional relocation overflows omitted from the output
   mips-linux-ld: fs/proc/meminfo.o: in function `proc_meminfo_show':
>> meminfo.c:(.text.proc_meminfo_show+0x50): undefined reference to `mem_fill_meminfo'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
