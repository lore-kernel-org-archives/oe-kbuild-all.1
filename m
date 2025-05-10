Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F03F233129
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 10:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746872408; cv=none; b=kW0n+dhH/N6ELq5mL0LpWcQHOBtoXn71/TEmwRZeKv/DyRyyOHfjCgwroUx0bLDzkh9TnThAMkmbklh/pFCPoKsK6ddPsfxJL9oInvk1d2Dh5rqd+mWU5DrpeOLe0IEHx6TXceM/pgfDZXYovrrlWxCuOFwzRFOPgME+9FWSex4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746872408; c=relaxed/simple;
	bh=WPUIh9EFGhDcxiGWqKnPop9Rx40BC+Z+qVjBycmljdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e7DbrLG1MkDXskGsTQ520rk9dAbaLStsp1jQv3GCZXr7Xi+06iFKbtYX1Ko9orJxmwghemdM+6HXwkBPc0NsHiJdTU5aaMyyFtTCv2TyFUhoTaaMiZeA6rvxUMFG2fI/PtESNuvIcSv8SAx9fORUmRk1sO7wQL9q2qTXG7DbXkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ldou0u2S; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ldou0u2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746872406; x=1778408406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WPUIh9EFGhDcxiGWqKnPop9Rx40BC+Z+qVjBycmljdg=;
  b=Ldou0u2Sta80vILXsV4W+npLTfruMUphvWEryFU1Uu80AoExPamy7zgn
   dDr1eRQdfaL/phpmiazV+daZZeLZ3P1Nqy6S0iMDGKc/z11wfsXxLsRWp
   HX0o4qAnFdWEiSapcFfsGamtjJyNmgb9tqKJHFhmRSM2Y6Hj0sG3cgSy/
   xF6gxhUP/S5gyhEIaBhuNQ/Unyl4vtzYvHwhCEYQscDdy8qxQyn4CjmO1
   6fFeTRMhAgv5Eir0KegK5bXVvP01VqIHgrXjqqMxOLEhF47YjbSpElmip
   6vBB2QOHz6XCnTpOMPaeiytgv9yGEdf3h0VHlKdzYxh6t5DShYWGPepDt
   A==;
X-CSE-ConnectionGUID: SUsxBTxiRfaEhC1tIVPf7A==
X-CSE-MsgGUID: U8h8q5QYT+2lzxb2XWgQXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="51360771"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="51360771"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 03:20:05 -0700
X-CSE-ConnectionGUID: ev63yrffSV++DQUIPuBIng==
X-CSE-MsgGUID: tlZKEhRCROyyJ2xtBvP2bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="141821559"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 May 2025 03:20:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDhJI-000Czk-2y;
	Sat, 10 May 2025 10:20:00 +0000
Date: Sat, 10 May 2025 18:19:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jonhunter:tegra/next-fixes 11/11] kernel/irq/manage.c:850:33:
 warning: initialization of 'struct irq_desc *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202505101805.DGxSO96u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jonhunter/linux tegra/next-fixes
head:   b6ba16943c776b1cd2b3559317337eb24b70f742
commit: b6ba16943c776b1cd2b3559317337eb24b70f742 [11/11] Revert "genirq/manage: Rework irq_set_irq_wake()"
config: i386-buildonly-randconfig-002-20250510 (https://download.01.org/0day-ci/archive/20250510/202505101805.DGxSO96u-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505101805.DGxSO96u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505101805.DGxSO96u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/irq/manage.c: In function 'irq_set_irq_wake':
   kernel/irq/manage.c:850:33: error: implicit declaration of function 'irq_get_desc_buslock' [-Werror=implicit-function-declaration]
     850 |         struct irq_desc *desc = irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CHECK_GLOBAL);
         |                                 ^~~~~~~~~~~~~~~~~~~~
>> kernel/irq/manage.c:850:33: warning: initialization of 'struct irq_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   kernel/irq/manage.c:886:9: error: implicit declaration of function 'irq_put_desc_busunlock' [-Werror=implicit-function-declaration]
     886 |         irq_put_desc_busunlock(desc, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +850 kernel/irq/manage.c

   828	
   829	/**
   830	 * irq_set_irq_wake - control irq power management wakeup
   831	 * @irq:	interrupt to control
   832	 * @on:	enable/disable power management wakeup
   833	 *
   834	 * Enable/disable power management wakeup mode, which is disabled by
   835	 * default.  Enables and disables must match, just as they match for
   836	 * non-wakeup mode support.
   837	 *
   838	 * Wakeup mode lets this IRQ wake the system from sleep states like
   839	 * "suspend to RAM".
   840	 *
   841	 * Note: irq enable/disable state is completely orthogonal to the
   842	 * enable/disable state of irq wake. An irq can be disabled with
   843	 * disable_irq() and still wake the system as long as the irq has wake
   844	 * enabled. If this does not hold, then the underlying irq chip and the
   845	 * related driver need to be investigated.
   846	 */
   847	int irq_set_irq_wake(unsigned int irq, unsigned int on)
   848	{
   849		unsigned long flags;
 > 850		struct irq_desc *desc = irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CHECK_GLOBAL);
   851		int ret = 0;
   852	
   853		if (!desc)
   854			return -EINVAL;
   855	
   856		/* Don't use NMIs as wake up interrupts please */
   857		if (irq_is_nmi(desc)) {
   858			ret = -EINVAL;
   859			goto out_unlock;
   860		}
   861	
   862		/* wakeup-capable irqs can be shared between drivers that
   863		 * don't need to have the same sleep mode behaviors.
   864		 */
   865		if (on) {
   866			if (desc->wake_depth++ == 0) {
   867				ret = set_irq_wake_real(irq, on);
   868				if (ret)
   869					desc->wake_depth = 0;
   870				else
   871					irqd_set(&desc->irq_data, IRQD_WAKEUP_STATE);
   872			}
   873		} else {
   874			if (desc->wake_depth == 0) {
   875				WARN(1, "Unbalanced IRQ %d wake disable\n", irq);
   876			} else if (--desc->wake_depth == 0) {
   877				ret = set_irq_wake_real(irq, on);
   878				if (ret)
   879					desc->wake_depth = 1;
   880				else
   881					irqd_clear(&desc->irq_data, IRQD_WAKEUP_STATE);
   882			}
   883		}
   884	
   885	out_unlock:
   886		irq_put_desc_busunlock(desc, flags);
   887		return ret;
   888	}
   889	EXPORT_SYMBOL(irq_set_irq_wake);
   890	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
