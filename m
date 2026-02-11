Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59D21CAA78
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 18:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770835052; cv=none; b=VXbJ5dHz34D+9HdbBvwbGKUExZWMuPyB5l9LFMH41IiwipJJPYn4cwBO6py9m9vR8Ju9ObDHahIsFaE7zcqH3kHAm8Ft2Cc/fx9Xb0nCBMp2MAfu2C1iKeDVdxRh9XPpd/k0utUMgrQCc4a805XazybDY4BQJpLlsb4p22RBLY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770835052; c=relaxed/simple;
	bh=4ws4GZmz1KtfhD4zneOra6eQhyD2qYGS7StXaB3pwe4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wsy3uYOf0hrwV+17ImPCQSSA+TAoJsHN34Ib+siF6SXExoD3u+WhHvtDDcDW2xJM+XqaZfVzdNEdfaM3YjcLQSMwaVqC7mWFtS+NKJtM4SX31DWFmbUn5sPQGl7CKst4c6KCvSNaPDwX/9UaboKjDP069q+/5X/gy/RnytvhYYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHwycZXB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHwycZXB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770835050; x=1802371050;
  h=date:from:to:cc:subject:message-id;
  bh=4ws4GZmz1KtfhD4zneOra6eQhyD2qYGS7StXaB3pwe4=;
  b=oHwycZXBptglyEC5KyJJVILTmlNBkrpbywUmlxionDzBMqQWJie2u9b5
   aYpI3aLO9JGooNY10A8iJNb/b88yueLdEtDlFeDQ1wt4kR12qMKUrp277
   DEypqUYCbddl3HW9O+7b/EkkG4pg+iQYpVKCnxaFSWRvLbuaW6j0VhLlb
   tizD0HNMe/8REYjjqDeK/TRfiJlREwdauLQhlB4w3Y/Ne9rwHgbOr0hlD
   nLa8J8F4jLYxxUNjz5GPyWNAJe6uCdq7UHoM5fHa7zWIyrRryFiUWI/hf
   xX2ZXqKOcke4i6sbFgtEORduoMe3NwOV5FN94Ea2KWixNcF341vPfP9t8
   Q==;
X-CSE-ConnectionGUID: EG8J4rRdSKGKrMwObGG/rA==
X-CSE-MsgGUID: +g0hu/sYQ5GN14ideh9a2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71195208"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="71195208"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 10:37:29 -0800
X-CSE-ConnectionGUID: CbpqS3woT+CiFTqKXzOzVw==
X-CSE-MsgGUID: h2dEjQHWSxGyp5FF6TlDJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="211681725"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 11 Feb 2026 10:37:28 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqF5Z-00000000189-3kTm;
	Wed, 11 Feb 2026 18:37:25 +0000
Date: Wed, 11 Feb 2026 19:36:30 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_3 7/14]
 kernel/bpf/trampoline.c:64:13: warning: 'trampoline_unlock_all' defined but
 not used
Message-ID: <202602111959.tRfzux29-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_3
head:   e88de144ad6e264c1df0286d6a975136d7a059c2
commit: 5e011f72271142e5e37a81d4c8eb725d0092de20 [7/14] bpf: Add bpf_trampoline_multi_attach/detach functions
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260211/202602111959.tRfzux29-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111959.tRfzux29-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111959.tRfzux29-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/trampoline.c:64:13: warning: 'trampoline_unlock_all' defined but not used [-Wunused-function]
      64 | static void trampoline_unlock_all(void)
         |             ^~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/trampoline.c:56:13: warning: 'trampoline_lock_all' defined but not used [-Wunused-function]
      56 | static void trampoline_lock_all(void)
         |             ^~~~~~~~~~~~~~~~~~~


vim +/trampoline_unlock_all +64 kernel/bpf/trampoline.c

    55	
  > 56	static void trampoline_lock_all(void)
    57	{
    58		int i;
    59	
    60		for (i = 0; i < TRAMPOLINE_LOCKS_TABLE_SIZE; i++)
    61			mutex_lock(&trampoline_locks[i].mutex);
    62	}
    63	
  > 64	static void trampoline_unlock_all(void)
    65	{
    66		int i;
    67	
    68		for (i = 0; i < TRAMPOLINE_LOCKS_TABLE_SIZE; i++)
    69			mutex_unlock(&trampoline_locks[i].mutex);
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
