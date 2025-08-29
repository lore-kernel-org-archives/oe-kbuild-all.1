Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B20309DCE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Aug 2025 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756474204; cv=none; b=CGtEab9qzdc5I4kU8hcMHbP2hDuDUmqxfb5Q/nQu7gLsux1iuIOstb2w3rc5pEMIo0d8BHTxqgd83O40qKmYG1oBk9j3IKP8/oR+iQf+rTIeUMVH/yfZ5hh5pERMPyRB+JWXZvC+44dwhI8J+ErroHZSyKVnpssXtbPeVxVNkh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756474204; c=relaxed/simple;
	bh=jG4CmABG5OWQHUejpEjp99PikD3il4N3zl/8Vo1bcWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jFTOB+wfX9MFX5zae0JXUgw8wd26I99D+SCK6a6YymLFLqWybY89E9ejQgDRIb7yKJsk+HIN9Y8+g0HbyERRlwn2epzMAnKnLjJk5VZcozKxbMhXQ3IXWy0gT6OptjP4M9uHmBJH235e0OVhz7US3+tBFiv8c/Kwa99+3R1D+j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdLfAL1e; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdLfAL1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756474203; x=1788010203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jG4CmABG5OWQHUejpEjp99PikD3il4N3zl/8Vo1bcWs=;
  b=hdLfAL1e5jv1aS3t9tl2lfeJ/j3KgVjqmUh7wIDKMCjzgE0l9vYVC37J
   cbXXHwvOuMpH/VJIjuaXEyJOPN4W0hOj47Rm+uHiHSJIoQl7ght8tlNOb
   bohkdWv39EixTm2s8DYKX/vZJZYOcQRQVFXiW81RMVL85ySYOJ3UAxVnz
   8b5+GZTlCXzpFABrcVHewVNLQXLQyarlOH7b1hvSajG7j/nsR876CtWcq
   PFiPXOKl7ZMN/9RclTuc8XoKclMc3kjDBt/1pEfCgYUpn1okOU+nE3uq0
   /9wIsV8O/MhIQWnmEMXRFUaFEEoGZzGzKzPgZnZaRUKnNB1NATib+sd60
   A==;
X-CSE-ConnectionGUID: tXclb3SRS/+3dkg0XpU9+g==
X-CSE-MsgGUID: YRriz/+nQ6yfBZxX0NjHCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="62404073"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="62404073"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 06:30:02 -0700
X-CSE-ConnectionGUID: 6rh+eQZORo20O0gsgoJCkg==
X-CSE-MsgGUID: dHyVovnCSnG9vM5YnSUVuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="169948404"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 29 Aug 2025 06:30:00 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urzAb-000Ufp-1b;
	Fri, 29 Aug 2025 13:29:38 +0000
Date: Fri, 29 Aug 2025 21:26:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Qinxin Xia <xiaqinxin@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2790/2790] drivers/irqchip/irq-gic-v3.c:561:6:
 warning: no previous prototype for 'gic_irq_set_prio'
Message-ID: <202508292128.aB60Q1zq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   18ca24a6500a925830b6e87fc4279a7456b57a4b
commit: f0f9be237c2266d30fa01c294577438a2e2ee749 [2790/2790] gic: increase the arch_timer priority to avoid hardlockup
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250829/202508292128.aB60Q1zq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250829/202508292128.aB60Q1zq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508292128.aB60Q1zq-lkp@intel.com/

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
