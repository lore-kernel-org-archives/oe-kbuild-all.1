Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B604F2E7FC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 12:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692880300; x=1724416300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U0H8FWusD30PxZmpXjmu0CE0q032kERwxX5A2n3N+qs=;
  b=OnanMj7wegqcZqv/UxB6zwBz4oEROvJ4e96XodJPq5BrDcc/5QyG3xcK
   GbzyMPpWijLxw2LL1YOCPQ9o25OVojFTZKJUpkNysBmQ/LWMfETl6JAbL
   KdHx6i9kEyKuy/k0ul5aiS0/pkdwXb2uyZZhxuGoQ/s+gL6aEVLCP4TLm
   vussSMyW4jJgc7WwiQbyfuvHc3lE3J3W51YRFKHAySV0dq2nvNTqMkbSw
   Yx7feTtC5XlAxXEDX9eLQ3eCADEWtKE2qLVQeDmpFFM8cwc5/kRHNgol+
   daIkbslhL85oxkzSMYq3+0b4IJRTvDyMS3fP0vVgWpzPyRvgGr6ST1o9V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="460782258"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="460782258"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 05:31:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="910888467"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="910888467"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 24 Aug 2023 05:31:38 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZ9Uv-0002So-1w;
	Thu, 24 Aug 2023 12:31:37 +0000
Date: Thu, 24 Aug 2023 20:31:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-4.14.y 3640/5153] arch/x86/entry/.tmp_entry_64.o:
 warning: objtool: .entry.text+0x888: unreachable instruction
Message-ID: <202308242012.o6WHSxJT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ben,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   80b73c056d2076d12f9e50c753bb440fc79f30c9
commit: 369e65def1a82aba54b377b6899b1bb5099ef838 [3640/5153] Revert "x86/speculation: Change FILL_RETURN_BUFFER to work with objtool"
config: x86_64-randconfig-073-20230824 (https://download.01.org/0day-ci/archive/20230824/202308242012.o6WHSxJT-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308242012.o6WHSxJT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308242012.o6WHSxJT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/entry/entry_64.S: Assembler messages:
   arch/x86/entry/entry_64.S:1672: Warning: no instruction mnemonic suffix given and no register operands; using default for `sysret'
>> arch/x86/entry/.tmp_entry_64.o: warning: objtool: .entry.text+0x888: unreachable instruction


objdump-func vmlinux.o .entry.text:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
