Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F418F2D6E53
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 17:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765560195; cv=none; b=IsUzAuNHX0lHPdu7WnDS/J6WQkFgDMzJlESKkIHwxohIfY9LLXl8CbpVd2C/0fue8zFJPOWNpNz/yx33HZvV0yJSIXKPFZTx4BhFVAF9jScWZgmXeDNTWnQ1aNcrGS53clvmiGdaBexdRafhlnVE8OBChViNuKuK6Qk6rL/r8+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765560195; c=relaxed/simple;
	bh=dS/B1YUXNmNyfAbVqdF9+BCR99/KWmmuuECRjlJ407E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JtezGYiFGqKVPJS0Tm3NoMgtFM2r4B1TjDSrmn6BUQNtoRDcGlrTgwOCNMRnexZCe1v7oNwaxb8F57WlCAE1ZCGt1t2ywAPKly7wbXJ3vK/EXs7oM1qx7Enj3uQdwSKgVfjy9pVyq5iFQ+f2nQQ4+JBU/4TqbvV+BTNV1t3GtB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T77zUIpR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T77zUIpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765560194; x=1797096194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dS/B1YUXNmNyfAbVqdF9+BCR99/KWmmuuECRjlJ407E=;
  b=T77zUIpRczvrWLnAVOwT/Pt/gMhmpeAzSTC2IrLxLe8zSS9gJUuo2hQL
   ly6vJN9QwFs9ZGY0G64v7lUjfVWic2vuGNSB8auBtMzjLHaYYuwVu8LWA
   y2qkD39T2KN5UY4JxEZ6K17Blm9rXbn3/ZiHnEN5WMHa+PQ+yQRRQ1R5N
   ej8Yu9XfFYs1QP19w42uNi7R9LCuVYtNJ/kFSFMIo/DgKRvZtqwK+hygX
   X2UCW3rcjPqgUmJKjyCuT92NVP7aUafUGA5f8RLE88SmCBUW7T+d9bnUU
   rtlQFUthqV/QQ4+ZTZqTz0ySY3FXgk3oUm+NumY6rX3QUjxUY1L79ghnQ
   Q==;
X-CSE-ConnectionGUID: VAX8ATEqTqqgc+TdwpHFEw==
X-CSE-MsgGUID: ZjiQz5FZQHmAdCq+lwoUcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67316821"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67316821"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 09:23:13 -0800
X-CSE-ConnectionGUID: MJ857jdNTruHOeon8twzXg==
X-CSE-MsgGUID: eRMKFr1GTyGjh8gZ6Ax6DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="228198972"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2025 09:23:12 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU6rG-000000006Mr-26tD;
	Fri, 12 Dec 2025 17:23:10 +0000
Date: Sat, 13 Dec 2025 01:22:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Qinxin Xia <xiaqinxin@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] drivers/irqchip/irq-gic-v3.c:561:6:
 warning: no previous prototype for 'gic_irq_set_prio'
Message-ID: <202512130131.7HrtXRUl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qinxin,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: f0f9be237c2266d30fa01c294577438a2e2ee749 [3541/3541] gic: increase the arch_timer priority to avoid hardlockup
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251213/202512130131.7HrtXRUl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130131.7HrtXRUl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130131.7HrtXRUl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3.c:561:6: warning: no previous prototype for 'gic_irq_set_prio' [-Wmissing-prototypes]
     561 | void gic_irq_set_prio(struct irq_data *d, u8 prio)
         |      ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_SUPPORTS_SCHED_SOFT_QUOTA
   Depends on [n]: CGROUPS [=n]
   Selected by [y]:
   - ARM64 [=y]
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]


vim +/gic_irq_set_prio +561 drivers/irqchip/irq-gic-v3.c

   560	
 > 561	void gic_irq_set_prio(struct irq_data *d, u8 prio)
   562	{
   563		void __iomem *base = gic_dist_base(d);
   564		u32 offset, index;
   565	
   566		offset = convert_offset_index(d, GICD_IPRIORITYR, &index);
   567	
   568		writeb_relaxed(prio, base + offset + index);
   569	}
   570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
