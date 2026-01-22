Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BFA43DA22
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 11:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769080803; cv=none; b=BtYalN9ewq7GpT8TxIN2GWGbLQlUdj6cqw0hMjJ/o6MKbpyU8YsQOZZqY8F2nD4rIe1SAB6/JM2dOEjNchbE6SH1yD9NoZ9BzfNqxRKWJ2HG5NRMXjY0vnBc+wzDrn92tTzcz6+2TBQNToGPH6+ooCrVV/I6W3xnxer1n9Jl18U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769080803; c=relaxed/simple;
	bh=mbbZNZBrDvio4kVo1RRUodX+F+KClUZnLom4okP2cYk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uQ0dXTYn9CJ1oTZIpfDtGBO+Da/6Iwge7w0TYqeI7/TpAZZ0GXpIT/nQBtQPART2V7ji8uoJ/iWv5Io5ZViSLrhaBodXPWeKf7Jc/NpB+7PyHk7zM7nkd+oauamezb7oT4nB3Jx1M/BN1uvEsenzwCStipuNk46ZejyLPkktT9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KvSVogD7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KvSVogD7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769080801; x=1800616801;
  h=date:from:to:cc:subject:message-id;
  bh=mbbZNZBrDvio4kVo1RRUodX+F+KClUZnLom4okP2cYk=;
  b=KvSVogD7a7N0n4JrMePDOplp2l/UcpKFUufCaQLD6bpmQtPQQSdOj5DU
   beNt9DCoetETaiM3Sy/ehqHERJgcnPJ+nR/mMja+iwQp0xlCHu2bgj+UN
   HU/hcUWQ1sahF9efN/mw6ci1Jz07UOogpPOKVBdPqzZk9QMVl3tL96S8k
   Gp0MNUq2FFoOkEzwx9VFrtQ5N+JfYa8eA+LJNn4kQHaFabwwFthv/ZEVJ
   1p/NUwlqpujrqAFaGNj4A56aFALEH6PWNwwBymSEbpPAKb1GhQ5nKozw0
   PsU+nZksyfT7Ox3btXM1ZXPtWcOCSfpEGINjUjZo1H2E4E0pLC/i2ESos
   A==;
X-CSE-ConnectionGUID: CFhqw1iEQW6MFsTaVRMC0A==
X-CSE-MsgGUID: jEclDzeuQniYpMWnKZRv9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80945456"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="80945456"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 03:19:59 -0800
X-CSE-ConnectionGUID: hoaTu0phS6SgnchgiST/Og==
X-CSE-MsgGUID: lfn7gI4PTcacerXhGPcHsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="206316019"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Jan 2026 03:19:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1visjD-00000000Slp-1qtj;
	Thu, 22 Jan 2026 11:19:55 +0000
Date: Thu, 22 Jan 2026 19:19:38 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bjackman:lkp/page_alloc-unmapped 19/19] make[4]: *** No
 rule to make target 'mm/page_alloc_test.o', needed by 'mm/'.
Message-ID: <202601221923.ljQdbLCu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Brendan,

First bad commit (maybe != root cause):

tree:   https://github.com/bjackman/linux lkp/page_alloc-unmapped
head:   e3d15ba96c69587b064e8334327d0a581ff9a747
commit: e3d15ba96c69587b064e8334327d0a581ff9a747 [19/19] mm: Minimal KUnit tests for some new page_alloc logic
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260122/202601221923.ljQdbLCu-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221923.ljQdbLCu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221923.ljQdbLCu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'mm/page_alloc_test.o', needed by 'mm/'.
   make[4]: *** [scripts/Makefile.build:544: mm/damon] Error 2
   make[4]: Target 'mm/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
