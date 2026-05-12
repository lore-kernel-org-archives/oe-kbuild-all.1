Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0871F9D9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 05:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778563164; cv=none; b=UgNFUj2YSt7osILY4qeei4L5W4UFzbYwZA/PWri2LAX3dMtthQXW/TwCWH5vKM+6bID+Qiowjm8vjSrF67bt69Pm7G580SBCrrkh9CwP7qtmaRrT9pGajHE8eEchiFEEKFE/reyFWITgcmUCwAxwEPNU/ZIJGZ3nXLpKt3dcNqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778563164; c=relaxed/simple;
	bh=b8u9gEdE5j6f72COzaq2Ffq29b6D5FQtaYvvCuRGGT0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B2ZOrmBSEDslMXoLhUYGMIcrk5/3G84OTFQBSZzyPu7oq58bFmTpYMO+2bkdbkn3NnxDtWrM8o4hIjn4h2KbkfFCpZXMgLnzmYoeVIP51lpptP30S7WUl8FGvtoSjW+FuFYUx1hBHR54N9M8EEk+DpIdMAqoapr3Kx53mVHo/0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=csqcebIz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="csqcebIz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778563162; x=1810099162;
  h=date:from:to:cc:subject:message-id;
  bh=b8u9gEdE5j6f72COzaq2Ffq29b6D5FQtaYvvCuRGGT0=;
  b=csqcebIzK1CIlG2ro4bhOwKNmJ8TWfn7/T4M494BRU+lPHCn+1sy8osV
   NFzWOz9oby4+saav9kcqnxxa7BGMjZ1eser7Nwr9TZYlo0yFOxfdTGg4A
   XlF/PiBiXaat3EXknletTTht1JOIs9Ru9ZeyPw62onPBCXX1B/S8wfLkW
   /AqGCyHvBWwoGvbx0Zic6SUfUcaWocO1M2s5jyEXP4KTg0wFdiO8Wy0D+
   6FhAfiDLgfgzvz8kurQV/PoC1JrUSvuc5Ntd01JXQMH5NHXHlAPxlEhQE
   /QLEDna6is7tl0y0UvFMBQaIWEp7iIoevDI6c2YUVmZsMmW/ejTi7YkKV
   w==;
X-CSE-ConnectionGUID: k7PNy724ScC8/SaZxJL/gw==
X-CSE-MsgGUID: SBbHO5P8SdqthfZvSW/jnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="102128115"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="102128115"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 22:19:21 -0700
X-CSE-ConnectionGUID: LCBFzm5PQn6raoufzx+fpw==
X-CSE-MsgGUID: 1a/QnhKNQf6SkkYoOGtQ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="239486922"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 11 May 2026 22:19:20 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMfWY-000000008AT-1kQC;
	Tue, 12 May 2026 05:19:18 +0000
Date: Tue, 12 May 2026 07:18:27 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/proc 12/16] arch/riscv/kernel/smp.c:229:39:
 warning: format '%s' expects a matching 'char *' argument
Message-ID: <202605120757.GdtObTRl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/proc
head:   00cf3fd6d149f99f29f489da2f3d68534e3b403a
commit: 7c4d372b8a5fed635854007c55298a11508e8bed [12/16] genirq/proc: Increase default interrupt number precision to 4
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260512/202605120757.GdtObTRl-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120757.GdtObTRl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120757.GdtObTRl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kernel/smp.c: In function 'show_ipi_stats':
>> arch/riscv/kernel/smp.c:229:39: warning: format '%s' expects a matching 'char *' argument [-Wformat=]
     229 |                 seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i);
         |                                      ~^
         |                                       |
         |                                       char *


vim +229 arch/riscv/kernel/smp.c

   223	
   224	void show_ipi_stats(struct seq_file *p, int prec)
   225	{
   226		unsigned int cpu, i;
   227	
   228		for (i = 0; i < IPI_MAX; i++) {
 > 229			seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i);
   230			for_each_online_cpu(cpu)
   231				seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));
   232			seq_printf(p, " %s\n", ipi_names[i]);
   233		}
   234	}
   235	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
