Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0DF8665E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 14:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709648459; cv=none; b=GSQMMCcM9GjYoeYBlHXk6gnN7unz1IvWPgelQV+KwJ+qdNwbTlB5jdUNB/B85BO9aiQ4Eea9yPgoIQlYzvxFYoO4iYg7kuIXEzGLFaVp+dBEZkxChg414Mo9IXKqn5Kd/vF5Yk06EeUkeWHswFh0/QRGfha5y8hLql6DhBPfdsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709648459; c=relaxed/simple;
	bh=fdjKF1d0oglgLhtPaSlgBALx/OtfwSPYh6tq0LXE0VM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g+2OL/XfQ/ejeZM6BT16UXkmpqJsaG6HQv90TZB7ERx1oAvXO92l1zXtVNl9yWC5mfCMLLxW3X9fXT3n9LOIoOFIoEb33vUQZnLULqeKV7cACtvkkLSd1T7/2lbayjduOm40luRWGUT6Zy178CERn194mwE7FpFXhJ2yHXK/tpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bm4Cpp+U; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bm4Cpp+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709648457; x=1741184457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fdjKF1d0oglgLhtPaSlgBALx/OtfwSPYh6tq0LXE0VM=;
  b=Bm4Cpp+UF49QOuYMFzXz3aa+/Kv67HZIjiIon9r97NT1szIA2EhWLqbZ
   3pUwBq+wPwAWwfqxuzIPaRPMJI1DhRdvca6kC3hgrdIkhkuyB4oJxL8G6
   HuXHTwy/OaER5Y3+vYyViWSWX1mZfLy5IiVNxOCc744dXXtRWsMoE3wGg
   YWEeLVJTMcJx4hCF78g/6Uz6thMUAyyga7f/6KhR6MT9/aZbhRhY4qqeT
   iOb6J/pw5u4aggBU4/EgHtxsNObjTzxQ2+eMA7OUkeRjtD+2/T8c0NJsz
   3ePeW6uxoimjmdWNdr/RS7LsQvxsNoGyOcUsnB9Hg1lIbUJbiZQCPq5p+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4326097"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4326097"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 06:20:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9246585"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Mar 2024 06:20:45 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhVet-0003Md-01;
	Tue, 05 Mar 2024 14:20:43 +0000
Date: Tue, 5 Mar 2024 22:20:37 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 27252/27434] kernel/irq/manage.c:350:5:
 warning: no previous prototype for function 'irq_update_affinity_desc'
Message-ID: <202403052228.1dkOQtdT-lkp@intel.com>
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
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240305/202403052228.1dkOQtdT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403052228.1dkOQtdT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403052228.1dkOQtdT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq/manage.c:350:5: warning: no previous prototype for function 'irq_update_affinity_desc' [-Wmissing-prototypes]
     350 | int irq_update_affinity_desc(unsigned int irq,
         |     ^
   kernel/irq/manage.c:350:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     350 | int irq_update_affinity_desc(unsigned int irq,
         | ^
         | static 
   1 warning generated.


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
