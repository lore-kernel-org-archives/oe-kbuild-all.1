Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19F713541B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 17:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734801610; cv=none; b=EHqyWpcaAGVzQZS1239fus/0tUhOiIYu4FnPbzAJ+7mLGCaoSHknC6U6Y3LFj7rDA/jB3fz5U+nykVQlifF+8VSpMG1NniFHOpscBYyWOEAEfO0jmgBVX0y1iHOtF9u50omlk5CYALc34DoWXIfB8YRMS1qEcB4Eqov5yqKsOAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734801610; c=relaxed/simple;
	bh=9o9w7KOOdr6CMREMgUR7yRbcWKnNe90J8bBRdwhbUQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gJZXCWn4+yjVfXqbuvIWBU203dBmK3dYlGhqyPnsmoHoiXqHXjvu7of5D137LygphjhDRQe3LLwgM2I6hYPk63Vv5uYijgE3nmYhSVg1V/8SmaUo9QdA8WsIOlSd4SuRQdot/3Wobqu/Ckf/5/W1pINO0UZtQB9U1sRYHS7FmmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FTCMQCHH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTCMQCHH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734801607; x=1766337607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9o9w7KOOdr6CMREMgUR7yRbcWKnNe90J8bBRdwhbUQc=;
  b=FTCMQCHHx1ffbrX7qyiMYdJtQhuxOZWAXsMJFvgeeOdT8HWqpXSNFv0d
   npAbXA1L7d8vIpHgdNSnrTFBDDbrTBz3VxKJwekIHU5+RBI2vYC3BS10k
   czmLlGTGrhHy+asZaYx3/gG0faOVUmDwBfdi/3nQzRhb2BfGjpH9oWIzb
   hRXQhCqOrB9KRIGUMTNnrHCkhzZwtSFSaP8Od83H/Bkioy4vqU9eyuUy/
   5vAOdJzqVS9ddsCzkiXl0Ngl+Gp/tuIN7x7uzgTptA85I3g9TOSEWzLI+
   G75LAVatBhC+s4SqPFYxj+fYG7NYMs+vtlsPnMrQvud1G9iJIonh0JWZR
   A==;
X-CSE-ConnectionGUID: 79wE5zvySy6KrPcRIDNb4A==
X-CSE-MsgGUID: 29TJiqIlRnS1yXxWzra+0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="39265804"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="39265804"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 09:20:07 -0800
X-CSE-ConnectionGUID: 6mDnAy4DSw6Fx582RzmsSQ==
X-CSE-MsgGUID: FcLYgTlESQydTF9q17JWZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="103874749"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Dec 2024 09:20:06 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP391-0002LH-2q;
	Sat, 21 Dec 2024 17:20:03 +0000
Date: Sun, 22 Dec 2024 01:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_imsic_imp_v2 15/18]
 drivers/irqchip/irq-riscv-imsic-state.c:219:42: error: 'struct
 imsic_local_priv' has no member named 'timer'
Message-ID: <202412220116.empw5ZcL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_imsic_imp_v2
head:   f91932baa72fea7864a1c699072e15e13ef45064
commit: 67f6ccaa232fd93009a9f128691a4459ea86fa39 [15/18] irqchip/riscv-imsic: Separate next and previous pointers in IMSIC vector
config: riscv-randconfig-001-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220116.empw5ZcL-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220116.empw5ZcL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220116.empw5ZcL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-riscv-imsic-state.c: In function 'imsic_local_sync_all':
>> drivers/irqchip/irq-riscv-imsic-state.c:219:42: error: 'struct imsic_local_priv' has no member named 'timer'
     219 |                 if (!timer_pending(&lpriv->timer)) {
         |                                          ^~
   drivers/irqchip/irq-riscv-imsic-state.c:220:30: error: 'struct imsic_local_priv' has no member named 'timer'
     220 |                         lpriv->timer.expires = jiffies + 1;
         |                              ^~
   drivers/irqchip/irq-riscv-imsic-state.c:221:44: error: 'struct imsic_local_priv' has no member named 'timer'
     221 |                         add_timer_on(&lpriv->timer, smp_processor_id());
         |                                            ^~


vim +219 drivers/irqchip/irq-riscv-imsic-state.c

   208	
   209	void imsic_local_sync_all(bool force_all)
   210	{
   211		struct imsic_local_priv *lpriv = this_cpu_ptr(imsic->lpriv);
   212		unsigned long flags;
   213	
   214		raw_spin_lock_irqsave(&lpriv->lock, flags);
   215	
   216		if (force_all)
   217			bitmap_fill(lpriv->dirty_bitmap, imsic->global.nr_ids + 1);
   218		if (!__imsic_local_sync(lpriv)) {
 > 219			if (!timer_pending(&lpriv->timer)) {
   220				lpriv->timer.expires = jiffies + 1;
   221				add_timer_on(&lpriv->timer, smp_processor_id());
   222			}
   223		}
   224	
   225		raw_spin_unlock_irqrestore(&lpriv->lock, flags);
   226	}
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
