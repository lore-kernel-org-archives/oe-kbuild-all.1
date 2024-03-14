Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B215D6BB5F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 09:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710407666; cv=none; b=qj81vA0RPb710ZIYX47xmTWtYwdaUOFeyOQQn0ZVAyvNkSbnn3O8r3oQRzFn4d6aYwlu59dUYX9UtJHi/5fU5BXv+eoSQ09X2Mk5XEE28YIcZ8+a7VcF90xMWUqqxbew8h63Z2YiBzKMsC+V7jpoHNuwAcGwTxa3o5Te24DicKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710407666; c=relaxed/simple;
	bh=ddHmTC6rtKfoUkri+EUSQrQTZ5J6fjs5yf93mglUQAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jp8AXXppVTRIqx9TvBeRCDMubk3CjSHNSS4TPOC9dm6Vay5zYsDQkx+uEMfnbvDg927owtCWOWAZaow4HlCXEAT9eKII84vkqAzV6nhSaZfP+okNSLgj+3GC6i998+LLjci2J98uYELgSFNGM098j5o8S0+sOgtox8he3yw9Ruk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HORdZgaR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HORdZgaR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710407664; x=1741943664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ddHmTC6rtKfoUkri+EUSQrQTZ5J6fjs5yf93mglUQAw=;
  b=HORdZgaRPVbAygBF2gfRJ7INxwlY70Y2EcFkCKRO3RK5nLWeno6if4Zk
   /FChHQLiE2vPYzAfmkROl4j9vswY9dnk2yW8dbny0V74mvhpXGqdIrosx
   JYU3OL2HcjUBpZRo1gZFuYCfEvAricspzY36rWAv6O1kVCUabfhLycc9O
   nrOwWIh8rBGAQrrxwZiesVJzDMttuJkYIliv3whoVbdqOb0wTddCJbgTY
   zjIf8WzAz70wMgYsWGgNV2paO+j9+iIFJ4h5x3r1Vsetf76BZvUTrnKtt
   L4JfJpZu50lcjvoSRMqdEOnNx3l8zmmuooSGgi3H6n+DuqGAhOCGRPH8t
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16610983"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="16610983"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 02:14:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="16964946"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Mar 2024 02:14:23 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkhAK-000DHj-26;
	Thu, 14 Mar 2024 09:14:20 +0000
Date: Thu, 14 Mar 2024 17:13:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uretprobe_syscall 1/1]
 arch/loongarch/include/asm/uprobes.h:12:33: error: initializer element is
 not constant
Message-ID: <202403141718.9kDTxzfw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uretprobe_syscall
head:   08c42d30c5ab0569cb9b3ced671479444ddddee7
commit: 08c42d30c5ab0569cb9b3ced671479444ddddee7 [1/1] uprobe: Add syscall to speed up return probe
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240314/202403141718.9kDTxzfw-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141718.9kDTxzfw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141718.9kDTxzfw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/uprobes.h:49,
                    from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:15,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/linux/highmem.h:5,
                    from kernel/events/uprobes.c:13:
   kernel/events/uprobes.c: In function 'arch_uprobe_trampoline':
>> arch/loongarch/include/asm/uprobes.h:12:33: error: initializer element is not constant
      12 | #define UPROBE_SWBP_INSN        larch_insn_gen_break(BRK_UPROBE_BP)
         |                                 ^~~~~~~~~~~~~~~~~~~~
   kernel/events/uprobes.c:1479:39: note: in expansion of macro 'UPROBE_SWBP_INSN'
    1479 |         static uprobe_opcode_t insn = UPROBE_SWBP_INSN;
         |                                       ^~~~~~~~~~~~~~~~


vim +12 arch/loongarch/include/asm/uprobes.h

19bc6cb6409289 Tiezhu Yang 2023-06-29  11  
19bc6cb6409289 Tiezhu Yang 2023-06-29 @12  #define UPROBE_SWBP_INSN	larch_insn_gen_break(BRK_UPROBE_BP)
19bc6cb6409289 Tiezhu Yang 2023-06-29  13  #define UPROBE_SWBP_INSN_SIZE	LOONGARCH_INSN_SIZE
19bc6cb6409289 Tiezhu Yang 2023-06-29  14  

:::::: The code at line 12 was first introduced by commit
:::::: 19bc6cb6409289106d38f9ad1b2ecf73980df6b5 LoongArch: Add uprobes support

:::::: TO: Tiezhu Yang <yangtiezhu@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
