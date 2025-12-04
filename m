Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DC62D1916
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 20:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764880178; cv=none; b=Yy20XaSMRZA5zD3IwSUD7YQhjnnT8eu2wXIilWorv50CgnRvM75AdWgvgu/jGejsNbKgGSh06uvfyrX1fpI8AEYygJry0cgsWO30XOhqhrvPW4ca3fz7eHTkr5CZcSQVplsjmf5t4NzdAXaH9jNWdhfJrm0TY1qKm7BdYrqgWp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764880178; c=relaxed/simple;
	bh=H9EvEDxn/2u7hYlrK+HbktmToS4nBM4obgYpRxx1Uq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PsgJRlLBdiAHeuqH8Ku32iUEqdriY7ErgVfK9hguN8GUyLyMorkObjZHwKmRRajSPDuHNqM5ir9mmmyuN2NPcSwIY1dToSK9MOZSZAh/cOvvW3zj6O/jszx+SBAxz2Jsdc6hTAHfdHOm2vqfRybfg0nDwpBg96xRvEn6SIsL0QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAyj4GmN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAyj4GmN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764880174; x=1796416174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H9EvEDxn/2u7hYlrK+HbktmToS4nBM4obgYpRxx1Uq0=;
  b=BAyj4GmNfv8pTzdrIcarAcGtvKFsuvxhhrATm11lLx0QnJRPWqlNXKD3
   FA0WWPH8IrK5SfUUEof9VJ7DZ2zrndTdI+r792sjXiJfgL68GVdRBPR+K
   FPntLlAeho1OJAb4EWh7ZSUCE5Mly3qGIVhiWSY+o/CE7WUXLUpVFiRCh
   WFxBbLt0UR/J8dO30oFjGGGRzjlaZ2jnZuUN09PHqZq0U+7wFBOwPUjL9
   d/pwwFeCpxVq6NE94gi2fTRRo9XghWU9MEUxNoai8bC/DfLbmq91mOXVe
   XdlU5ZwPCOJIFM73cEXtipkmZLGeeCGBvD9dWGfZoZ/A+JJhGrX/Mwc+E
   g==;
X-CSE-ConnectionGUID: NL3fNbbERQK810ignnYm3g==
X-CSE-MsgGUID: ojwfdS7LRpWNuUTOIs7Abg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66954932"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="66954932"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 12:29:32 -0800
X-CSE-ConnectionGUID: dLTE/X4bRF28TDa0AUH8GQ==
X-CSE-MsgGUID: bCy1u25wRG23opxsHXqbJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="199550384"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Dec 2025 12:29:31 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRFxA-00000000EAv-2aWJ;
	Thu, 04 Dec 2025 20:29:28 +0000
Date: Fri, 5 Dec 2025 04:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3345/3345]
 drivers/net/ethernet/yusur/k2/../platform/ys_intr.c:113:40: warning:
 non-overlapping comparisons always evaluate to false
Message-ID: <202512050401.bWD2A9JO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   94c9d29e871d7af205d35228eec92d863bbb7444
commit: c92533ad657c0a5d1a7a6355ef2c357cbb91d5c0 [3345/3345] drivers: initial support for KPU FLEXFLOW-2100P driver from Yusur Technology
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251205/202512050401.bWD2A9JO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512050401.bWD2A9JO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512050401.bWD2A9JO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:69:
   include/linux/compiler-clang.h:34:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      34 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/net/ethernet/yusur/k2/../platform/ys_intr.c:113:40: warning: non-overlapping comparisons always evaluate to false [-Wtautological-overlap-compare]
     113 |         if (sub->irq_type < YS_IRQ_TYPE_QUEUE &&
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
     114 |             sub->irq_type > YS_IRQ_TYPE_HW_PRIVATE) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +113 drivers/net/ethernet/yusur/k2/../platform/ys_intr.c

    94	
    95	static int ys_request_irq(struct ys_pdev_priv *pdev_priv, int index,
    96				  struct ys_irq_sub *sub)
    97	{
    98		struct ys_irq_table *irq_table = &pdev_priv->irq_table;
    99		struct ys_irq *irq;
   100		int ret;
   101	
   102		if (index >= irq_table->max)
   103			return -EINVAL;
   104	
   105		if (IS_ERR_OR_NULL(sub))
   106			return -EINVAL;
   107	
   108		if (IS_ERR_OR_NULL(irq_table->irqs)) {
   109			ys_dev_err("Missing irq table irqs");
   110			return -EINVAL;
   111		}
   112	
 > 113		if (sub->irq_type < YS_IRQ_TYPE_QUEUE &&
   114		    sub->irq_type > YS_IRQ_TYPE_HW_PRIVATE) {
   115			ys_dev_err("Invalid sub irq type: %d", sub->irq_type);
   116			return -EINVAL;
   117		}
   118	
   119		if (IS_ERR_OR_NULL(sub->handler)) {
   120			ys_dev_err("Missing irq handler");
   121			return -EINVAL;
   122		}
   123	
   124		mutex_lock(&irq_table->lock);
   125	
   126		irq = &irq_table->irqs[index];
   127		if (irq->state != YS_IRQ_STATE_UNREGISTERED) {
   128			mutex_unlock(&irq_table->lock);
   129			ys_dev_err("Irq %d(%d) has already been registered",
   130				   index, irq->state);
   131			return -EINVAL;
   132		}
   133	
   134		irq->sub = *sub;
   135		if (irq->sub.bh_type == YS_IRQ_BH_WORK) {
   136			if (IS_ERR_OR_NULL(irq->sub.bh.work_handler)) {
   137				memset(&irq->sub, 0, sizeof(struct ys_irq_sub));
   138				mutex_unlock(&irq_table->lock);
   139				ys_dev_err("Irq %d(%d) missing work_handler",
   140					   index, irq->sub.bh_type);
   141				return -EINVAL;
   142			}
   143			INIT_WORK(&irq->sub.bh.work, irq->sub.bh.work_handler);
   144		}
   145	
   146		if (irq->sub.devname)
   147			ret = pci_request_irq(pdev_priv->pdev,
   148					      irq->index,
   149					      irq->sub.handler,
   150					      irq->sub.bh.thread_fn,
   151					      irq, irq->sub.devname);
   152		else
   153			ret = pci_request_irq(pdev_priv->pdev,
   154					      irq->index,
   155					      irq->sub.handler,
   156					      irq->sub.bh.thread_fn,
   157					      irq, "%s-%d-bdf:%d%d%d",
   158					      pdev_priv->nic_type->func_name, index,
   159					      pdev_priv->pdev->bus->number,
   160					      PCI_SLOT(pdev_priv->pdev->devfn),
   161					      PCI_FUNC(pdev_priv->pdev->devfn));
   162	
   163		if (ret < 0) {
   164			memset(&irq->sub, 0, sizeof(struct ys_irq_sub));
   165			mutex_unlock(&irq_table->lock);
   166			ys_dev_err("Failed to request irq index %d virq %d", index,
   167				   irq->irqn);
   168			return ret;
   169		}
   170	
   171		irq->state = YS_IRQ_STATE_REGISTERED;
   172		irq_table->used++;
   173	
   174		mutex_unlock(&irq_table->lock);
   175	
   176		ys_debug("Request irq %d vector %d", index, irq->irqn);
   177	
   178		return 0;
   179	}
   180	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
