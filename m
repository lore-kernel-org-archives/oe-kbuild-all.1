Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFA31E4A2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 23:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709594431; cv=none; b=P0El39mGG8aBzbvO7+7orJHFNVl2ObW/V3C1l2Wll+67vYKDzeL5F9Xxp+SjGEr5NeV/sDlcrz9KwZnIcOKP93t0Td4MTi6UtFs00KxuJf2zSesy2BA8AZtSZ6jr0EMHum8slTvvUg1mg6OUgCGyx/vwnpM2RV49kxuYK+CYlr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709594431; c=relaxed/simple;
	bh=M7DmxigMAPFeOPiPfyQ/bgtZOEaS8NjsO0eGITpZbks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hu+qPLL1k8xbA8JjnHjquF4xrwYuZZ2vYbbSzuKyQi8R6jHLzXd48B1xp9K+YOFxRqSfCbNTpESwasHFomuIGB2vB0befNpi7vuTDwOdG8OuMkzg3ZBXI6me/6pIiAfjg8IUf5NXPP4sHeQMMo7dcrROcKq+TVidwu8CYfcGStM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQ+qhZfM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQ+qhZfM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709594429; x=1741130429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M7DmxigMAPFeOPiPfyQ/bgtZOEaS8NjsO0eGITpZbks=;
  b=YQ+qhZfMWfSsXaLTb7ImJKeYEvwSDDhk7hs9kudDUf7LD+0mj999CGSJ
   UR65kfeKdfdhn7b5oQMB4CqYZdvPY5dHN00A4VOQeR6PGAvef6uKx1inK
   zBVPbE8ezwWhhzjMc9tZpYYwn/tK4oqLtyTUhfU9FMeWXYUmU30bRFJfp
   3BEnFlkyy5k+GnNo/GsQjy+ba8TFojUHaft2enwPn/YtGXuoNp+Z+ppFv
   BRiLtQ0OEwAbZ6VcleyZ+qnFXGjrVPLLChnsAM53yNuvMBfss9Tx3W5zi
   +PFY48bpIBOWpUc4jzYG768Yo4++HiHZ21+Lz5PpkMR1twaKI01o+/aAZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="3980722"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="3980722"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 15:20:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9103919"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Mar 2024 15:20:24 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhHba-0002pV-1O;
	Mon, 04 Mar 2024 23:20:22 +0000
Date: Tue, 5 Mar 2024 07:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 27252/27434] kernel/irq/manage.c:350:5:
 warning: no previous prototype for 'irq_update_affinity_desc'
Message-ID: <202403050757.ZDfe69e3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: 17568159e8f86e6ce059ca5b8d54fa54042d1bed [27252/27434] genirq: Export affinity setter for modules
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240305/202403050757.ZDfe69e3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050757.ZDfe69e3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050757.ZDfe69e3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq/manage.c:350:5: warning: no previous prototype for 'irq_update_affinity_desc' [-Wmissing-prototypes]
     350 | int irq_update_affinity_desc(unsigned int irq,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/irq_update_affinity_desc +350 kernel/irq/manage.c

   334	
   335	/**
   336	 * irq_update_affinity_desc - Update affinity management for an interrupt
   337	 * @irq:	The interrupt number to update
   338	 * @affinity:	Pointer to the affinity descriptor
   339	 *
   340	 * This interface can be used to configure the affinity management of
   341	 * interrupts which have been allocated already.
   342	 *
   343	 * There are certain limitations on when it may be used - attempts to use it
   344	 * for when the kernel is configured for generic IRQ reservation mode (in
   345	 * config GENERIC_IRQ_RESERVATION_MODE) will fail, as it may conflict with
   346	 * managed/non-managed interrupt accounting. In addition, attempts to use it on
   347	 * an interrupt which is already started or which has already been configured
   348	 * as managed will also fail, as these mean invalid init state or double init.
   349	 */
 > 350	int irq_update_affinity_desc(unsigned int irq,
   351				     struct irq_affinity_desc *affinity)
   352	{
   353		struct irq_desc *desc;
   354		unsigned long flags;
   355		bool activated;
   356		int ret = 0;
   357	
   358		/*
   359		 * Supporting this with the reservation scheme used by x86 needs
   360		 * some more thought. Fail it for now.
   361		 */
   362		if (IS_ENABLED(CONFIG_GENERIC_IRQ_RESERVATION_MODE))
   363			return -EOPNOTSUPP;
   364	
   365		desc = irq_get_desc_buslock(irq, &flags, 0);
   366		if (!desc)
   367			return -EINVAL;
   368	
   369		/* Requires the interrupt to be shut down */
   370		if (irqd_is_started(&desc->irq_data)) {
   371			ret = -EBUSY;
   372			goto out_unlock;
   373		}
   374	
   375		/* Interrupts which are already managed cannot be modified */
   376		if (irqd_affinity_is_managed(&desc->irq_data)) {
   377			ret = -EBUSY;
   378			goto out_unlock;
   379		}
   380	
   381		/*
   382		 * Deactivate the interrupt. That's required to undo
   383		 * anything an earlier activation has established.
   384		 */
   385		activated = irqd_is_activated(&desc->irq_data);
   386		if (activated)
   387			irq_domain_deactivate_irq(&desc->irq_data);
   388	
   389		if (affinity->is_managed) {
   390			irqd_set(&desc->irq_data, IRQD_AFFINITY_MANAGED);
   391			irqd_set(&desc->irq_data, IRQD_MANAGED_SHUTDOWN);
   392		}
   393	
   394		cpumask_copy(desc->irq_common_data.affinity, &affinity->mask);
   395	
   396		/* Restore the activation state */
   397		if (activated)
   398			irq_domain_activate_irq(&desc->irq_data, false);
   399	
   400	out_unlock:
   401		irq_put_desc_busunlock(desc, flags);
   402		return ret;
   403	}
   404	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
