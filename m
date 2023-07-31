Received: from mgamail.intel.com (unknown [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFB01D2F9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 17:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690825482; x=1722361482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6hSJP8vfs+mYdpJbGY3sb/kga1cxYNgMCIrVPphjrkw=;
  b=kM4dBFZbGxoiyzEOW/rM8N6IVQ4VC+18kciK6pJFNyt12+0lXLRjT7ii
   SfePNVK8wdklkYsiUQxYzEYwhr210p3qKrr8sCNY2dEVmX0BLGGNT1ldV
   Lr52OAAeS8u8StWjN8tYbCbaWiHRbqxCLnQVYQq7xcz5S3AVzD3OY1Beq
   wfTuPm0hczMy3iHIw8oL5sdJe/KFBz+4L/WkB0OMpoVUDisWE2HJkZmMv
   YEL59tXNwN9vuNTedyypuhS8GOoLrPF2ugHC3SYYO9PM0GYlPtnFO+9bj
   U/MdF0bD8WEguVheDTjWVDbOTWshjWZlBfwnhAdYj+sq7MKw024HFST72
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="432911401"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="432911401"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 10:44:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="758001641"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="758001641"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 31 Jul 2023 10:44:40 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQWwh-0005Gp-2L;
	Mon, 31 Jul 2023 17:44:39 +0000
Date: Tue, 1 Aug 2023 01:44:39 +0800
From: kernel test robot <lkp@intel.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:x86/core 1/3] include/linux/cfi.h:27: multiple
 definition of `is_cfi_strap';
 arch/x86/kernel/traps.o:include/linux/cfi.h:27: first defined here
Message-ID: <202308010152.8jfoR2OE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   4f9f74c73972973d748a5f6dfa7269877af08d69
commit: cb359d95f4863f4d34f3745765c9bce6447824c1 [1/3] x86/kprobes: Prohibit probing on compiler generated CFI checking code
config: i386-buildonly-randconfig-r004-20230731 (https://download.01.org/0day-ci/archive/20230801/202308010152.8jfoR2OE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308010152.8jfoR2OE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308010152.8jfoR2OE-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/module/main.o: in function `is_cfi_strap':
>> include/linux/cfi.h:27: multiple definition of `is_cfi_strap'; arch/x86/kernel/traps.o:include/linux/cfi.h:27: first defined here


vim +27 include/linux/cfi.h

    23	
    24	#ifdef CONFIG_ARCH_USES_CFI_TRAPS
    25	bool is_cfi_trap(unsigned long addr);
    26	#else
  > 27	bool is_cfi_strap(unsigned long addr) { return false; }
    28	#endif
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
