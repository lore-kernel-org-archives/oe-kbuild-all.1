Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BC3259C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 11:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746875530; cv=none; b=ImXLbbcUhC3ED8zf1MZ8EEskRksXtzFSE98nd7Uziq2pICPk5JgdFKWWs1TW5ihqVxEWxK73RNh2sMRuFhKS6Clv+0wMp7C8g7Gj1cVm5gXVJDjgr9HDqlhPfS/oEoRv+2KFGQDgTuEUOvETS4Rz9h8p7GBT3KWkYVb1J3xz8/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746875530; c=relaxed/simple;
	bh=nlWRj0vp9KSU7OHDo5+P8kuiQzUgtJsNsZj4Gy13Shg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BeP8EyqaLFCIdRYq8RwR7cOfqu5sDMm+jVlr9U+AFAFnyOiRRd0gwxmlPuDOwd96n2kAUkpup/q25En0FRv19V/eAeXYSsyGgTbW4bXHFBpJ/CrFu0wxG/hjscpQVfqoeu6oq2ds4aPN+PmYbv8ePQVKagTjI/WqH56QX7Q70y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQnnQ/u7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQnnQ/u7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746875528; x=1778411528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nlWRj0vp9KSU7OHDo5+P8kuiQzUgtJsNsZj4Gy13Shg=;
  b=SQnnQ/u787oBa01BWV06PtSN3q7QseUHdW35MWt2r4P5V/CvnGnx+bI7
   KKeOqf1ZLIw4RMXv5Hc2SCIaDxQqzBHTwGY7xElxCsOvEHIfpH3Tdl9oK
   Owm1nWb/8Me0tUFdACQCLDckM6Zopgl6/y8n0D+yp9gnGtaW29iOtKOUy
   ORN2zQK0u++wapsgUBqZzaixZ9fUuaTZEklY9PKnr89AoZC1GUmUuPeFX
   ux8TChEPuMGlRMEw+PmG/W3AmLkmeAFMhpyRo1I+KDDOB14O94eDRCLhg
   SYi+G5X9e+pjAV6oCz3HjVgbMm4cxgGSYFjei4EpE47rqbenV2Lxn5X+s
   A==;
X-CSE-ConnectionGUID: 7f+bJoOoTbqyZnEjd6TK/A==
X-CSE-MsgGUID: n6snXX7dSM+x14w8nJAgiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48825016"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="48825016"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 04:12:08 -0700
X-CSE-ConnectionGUID: GLPkf8dHSQC5IUDQTVuHAA==
X-CSE-MsgGUID: F4RMtpS9TAuSCLcUzj26lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="136565341"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 May 2025 04:12:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDi7g-000D1Z-2I;
	Sat, 10 May 2025 11:12:04 +0000
Date: Sat, 10 May 2025 19:11:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jonhunter:tegra/next-fixes 11/11] kernel/irq/manage.c:850:33:
 error: implicit declaration of function 'irq_get_desc_buslock'
Message-ID: <202505101946.DNxhuust-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20250510 (https://download.01.org/0day-ci/archive/20250510/202505101946.DNxhuust-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505101946.DNxhuust-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505101946.DNxhuust-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/irq/manage.c: In function 'irq_set_irq_wake':
>> kernel/irq/manage.c:850:33: error: implicit declaration of function 'irq_get_desc_buslock' [-Werror=implicit-function-declaration]
     850 |         struct irq_desc *desc = irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CHECK_GLOBAL);
         |                                 ^~~~~~~~~~~~~~~~~~~~
   kernel/irq/manage.c:850:33: warning: initialization of 'struct irq_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>> kernel/irq/manage.c:886:9: error: implicit declaration of function 'irq_put_desc_busunlock' [-Werror=implicit-function-declaration]
     886 |         irq_put_desc_busunlock(desc, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/irq_get_desc_buslock +850 kernel/irq/manage.c

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
 > 886		irq_put_desc_busunlock(desc, flags);
   887		return ret;
   888	}
   889	EXPORT_SYMBOL(irq_set_irq_wake);
   890	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
