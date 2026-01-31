Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DF08C1F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 02:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769826766; cv=none; b=H+eluGeBO1SAWCGjJ87TBFDv22j/FaOYmZy/ER29+fvI8TZa2iYiPATRg+3RxXvLjFygscK6+U9RjYX/wrDFDnkWn8cH5wj1NV8DGykc4PfOLpKs0RTW8l1fBNPPR4V9mvjU/Ihxr+bGrQ0qzAXNBs5gFnIDcmlabDQP1n2sbrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769826766; c=relaxed/simple;
	bh=35MUKLtHL1I/u7HxtSTgMnspOms0wmd+3SoMBn9++ZY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HrQOeKzbzqwDWA75czyM6WNuSC5Kw6TE05I1JZVTdW8k4f8mIt5Do9s9HRJPHmnpxxqNG4QQnHdLgrfLcO0jLLDliumJG5ivhQEntcO6oIvqhdOB6t2s4jBkkgKIepJoF6H8qPNsvqhbgEcAs3DDhQqbF7sHIXh3oRvDaPXAhJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UaRKA7r9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UaRKA7r9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769826764; x=1801362764;
  h=date:from:to:cc:subject:message-id;
  bh=35MUKLtHL1I/u7HxtSTgMnspOms0wmd+3SoMBn9++ZY=;
  b=UaRKA7r9Z6CnXtdLtKPaAko9cSFT5NdZcRLSWNg25p5sUd2bMAECdfbP
   khBHSv4D4TXneTObzjVo8eMA4KrmKb0NY3XCM3lwgtuEL+mI8yeyCz3BG
   VrhYGJhxXxUQlmKF7fzNoXcrDpSZ0HgjJkV0fyrqILjA6A/5WYYx/7hFQ
   5GA0NT6AIM3TV9XRuAbT2SVKxtNPnccm+3pT8ngkrqWAmAmvkxXIQXDF9
   YQ1jr40688Afxur1rTuuXEeagarL8rf1JhsvsFOp1DJaUY8+Z5dLzdQ5L
   +0vCB6dZgTHyrYvo/6JKAsyQWaK3aG/qZJjeMihCGKPLP7oH+LVWu5+Re
   w==;
X-CSE-ConnectionGUID: 2qyC6C9TQyKX7JO02+hVSA==
X-CSE-MsgGUID: NzMqLbryQrODjJpjjMDqZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70990907"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="70990907"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 18:32:44 -0800
X-CSE-ConnectionGUID: pCTbhPiyRmmpQfIWUPlHBA==
X-CSE-MsgGUID: mM3xWsw+St6NHVmFVl47ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="246617984"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Jan 2026 18:32:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm0mt-00000000da4-3CVr;
	Sat, 31 Jan 2026 02:32:39 +0000
Date: Sat, 31 Jan 2026 10:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: Fan Gong <gongfan1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>,
 Zhu Yikai <zhuyikai1@h-partners.com>
Subject: [linux-next:master 6911/11028] hinic3_irq.c:undefined
 reference to `net_dim_get_rx_moderation'
Message-ID: <202601311021.JXedL0Pm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
commit: b35a6fd37a00dae184ca1a1f0a587cc1b167d86d [6911/11028] hinic3: Add adaptive IRQ coalescing with DIM
config: powerpc64-randconfig-002-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311021.JXedL0Pm-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311021.JXedL0Pm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311021.JXedL0Pm-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `net_dim_get_rx_moderation'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/net/ethernet/huawei/hinic3/hinic3_irq.o: in function `hinic3_rx_dim_work':
>> hinic3_irq.c:(.text+0x54): undefined reference to `net_dim_get_rx_moderation'
   powerpc64-linux-ld: drivers/net/ethernet/huawei/hinic3/hinic3_irq.o: in function `hinic3_poll':
>> hinic3_irq.c:(.text+0x3ec): undefined reference to `net_dim'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
