Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B130184A50
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 May 2024 22:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715293650; cv=none; b=tHQoTgTWv00w2avxEh+iknTE4pR7yUYPE5RydsAZ8vbwbzendTX0m4+Uw//73LMmLgk53We5R3d64M56ozS6ZAo19JDftMEwa/pL1FrzRl+ADhGP3ufOm4LoiG5xcKMk8ehQmpFpagoYFk3mNA1lHqdGBJO+SyULGqrErLlvkgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715293650; c=relaxed/simple;
	bh=uc7D+CLij5X8AQHnj8dGNFzH9YPIWdz7491qGTwfmfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gEWLrXnCOnrwM7QNoGYZYh0OFaniuDuvaFvCrogE6GCGXgouc0nbpIJuk9yYFw8xwFvA9VIeaeFCQVYOY8dM1eKckVjqWosb0YdXp/aPOGt1U5yCw/9aqxu5jiy7Pg2oKKvu7Dwwjv/tVqJcEMRFdyoX7JehwaLnS+Tu8IPqNNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ch30uEKk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ch30uEKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715293649; x=1746829649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uc7D+CLij5X8AQHnj8dGNFzH9YPIWdz7491qGTwfmfA=;
  b=Ch30uEKklPzETOip+TkpBCyhJ5hxlDZph5mBQcr74OO4Bhon7s7Q2vTl
   VK5Ht5kNe3WiyVuFwoXqXuMdbmiKQLe20nixGm9taXzr4T1fxd+aMaCWE
   GTelzQ43Sf3HdyWmIt1iuDl2XWpi3vIJ9mCWwldUNl4VMPmL7xvzVFmbt
   9TU2tLzy5jY3g25aBB4yt43qxeNi7OfMkWgIm40wos9es0MVUyUTx5v5F
   IcGLt9Q6E9I2uVfxiOzBbwULJfnPnTkkBSyi1g2nEbnDnBv6djciVTeUc
   ft7Ayl+AZPt0qZzXqFRRZGRoawc2TTryBE8MbSRmvTcOalI+iopwmFpP+
   w==;
X-CSE-ConnectionGUID: O5TWiwT+SFu++gMzaEqcXA==
X-CSE-MsgGUID: yVvt5PnFQjyJfyfQWV+eKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="28760305"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="28760305"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 15:27:28 -0700
X-CSE-ConnectionGUID: UO3hgDxFSPCtxRHblA2d6A==
X-CSE-MsgGUID: A0lY5fGISM6C+APPWEC0mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="29955428"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 May 2024 15:27:27 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5CEW-0005R9-1f;
	Thu, 09 May 2024 22:27:24 +0000
Date: Fri, 10 May 2024 06:26:34 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:qwip 10/15] drivers/irqchip/irq-mpfs-mux.c:215:6: warning:
 variable 'mask' set but not used
Message-ID: <202405100628.xntHTI5e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git qwip
head:   520f2563214599bc3abdd1aa6f127f67e084e65f
commit: c0ea499b12c76ccd8bceafc3ee52ba5655125837 [10/15] irqchip: add mpfs gpio interrupt mux
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240510/202405100628.xntHTI5e-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405100628.xntHTI5e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405100628.xntHTI5e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-mpfs-mux.c:11:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/irqchip/irq-mpfs-mux.c:215:6: warning: variable 'mask' set but not used [-Wunused-but-set-variable]
     215 |         u64 mask;
         |             ^
   2 warnings generated.


vim +/mask +215 drivers/irqchip/irq-mpfs-mux.c

   207	
   208	static int mpfs_irq_mux_alloc(struct irq_domain *d, unsigned int virq,
   209				      unsigned int nr_irqs, void *arg)
   210	{
   211		struct mpfs_irq_mux *priv = d->host_data;
   212		struct irq_fwspec *fwspec = arg;
   213		struct irq_fwspec parent_fwspec;
   214		unsigned int bank, line, irq;
 > 215		u64 mask;
   216	
   217		if (!mpfs_irq_mux_is_direct(priv, fwspec))
   218			return mpfs_irq_mux_nondirect_alloc(d, virq, fwspec, priv);
   219	
   220		bank = fwspec->param[0] / MPFS_MAX_IRQS_PER_GPIO;
   221		line = fwspec->param[0] % MPFS_MAX_IRQS_PER_GPIO;
   222		mask = mpfs_irq_mux_bank_configs[bank].mask;
   223		irq = line + mpfs_irq_mux_bank_configs[bank].shift;
   224	
   225		parent_fwspec.fwnode = d->parent->fwnode;
   226		parent_fwspec.param[0] = priv->parent_irqs[irq];
   227		parent_fwspec.param_count = 1;
   228	
   229		irq_domain_set_hwirq_and_chip(d, virq, fwspec->param[0], &mpfs_irq_mux_irq_chip, priv);
   230	
   231		return irq_domain_alloc_irqs_parent(d, virq, 1, &parent_fwspec);
   232	}
   233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
