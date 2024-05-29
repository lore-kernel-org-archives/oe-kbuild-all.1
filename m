Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDEC167291
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 05:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716962302; cv=none; b=I2nPEjHx5L+96Z/XE2zaJfR9CVqplLL+nr4UhIujbGsnYxTG58yjn1yLFfs62lOXAHwjTQCT/X03LteRBJ4BzQ/PxOnwin+x/ibaVkD5rfqjPZRC/h/GpGszeN+9zRAynVJuKXIEjN/exUY1ww5rMxvgPvv9HFqevTkgWDj1sVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716962302; c=relaxed/simple;
	bh=h7WcWbZ3EkTM1rnSQbgazusFNtojkFJY7RjMMB/Ve44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jm9oQfdGogAs7prw8rdSF/pezmqKkqllQ5bffzsSt1lUdl7Pv+ohhCfjYOY2DB7uJ/KbHlTxAqWDLFVO3+C1T11uUOx0zCOBIlavS8z1arkT3sRLm5Q+YABT3+p1qVOP5OZ1WMlDHTbE78t6XKX8QQxQBZHmvaKza9SS+I6Kv9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZMBj5MC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZMBj5MC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716962300; x=1748498300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h7WcWbZ3EkTM1rnSQbgazusFNtojkFJY7RjMMB/Ve44=;
  b=PZMBj5MC72qe+W1Gr7XWhDLnu5EX4nhpdqxVPTc0yA16Kkfb4niQc7Ro
   wGWNZc9LxcAUHXiCWUTX21uvwKcrmNCc0j6PVUXI01P/1vv3wNYkYgEWd
   kvubpvth02yeifAN9vcQ4bgiA9jbD3BumB+ohVnWWEkmBvTqiDmpdyAHu
   aSbUsObTw1cvc8o6mD70M/y00LGRHa+ImRv47Wum1DEvjuLy4mED780M0
   DQNYCSw8pGapPYauiW+WvwhepDHTRkzBivYeQuiMW2GfapriLeJk30I7/
   7WJI8Dq32cO6BkDZhNaD8dwrVLoFkBb/mwbLjni+ePzOHIwMToLLkoj63
   Q==;
X-CSE-ConnectionGUID: RENEZMbsQSW0A2Wd/uxapg==
X-CSE-MsgGUID: vU/sbGOfQ42SRSb+PYquHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30870987"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="30870987"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 22:58:20 -0700
X-CSE-ConnectionGUID: vBbJ5oShQ9a/NR84/T3q8w==
X-CSE-MsgGUID: HipG3ZsLT46wozWe+boT7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="35791570"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 28 May 2024 22:58:19 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCCKG-000DBR-2W;
	Wed, 29 May 2024 05:58:16 +0000
Date: Wed, 29 May 2024 13:57:21 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/gicv3-nmi-prio 4/4] drivers/irqchip/irq-gic-v3.c:40:43:
 error: 'GICV3_PRIO_IRQ' undeclared here (not in a function)
Message-ID: <202405291320.FZW1BpX8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/gicv3-nmi-prio
head:   3c0651daca34ea67b809bd2ef412779c94517811
commit: 3c0651daca34ea67b809bd2ef412779c94517811 [4/4] WIP: irqchip/gic-v3: choose priorities at boot time
config: arm-randconfig-003-20240529 (https://download.01.org/0day-ci/archive/20240529/202405291320.FZW1BpX8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405291320.FZW1BpX8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405291320.FZW1BpX8-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3.c:40:43: error: 'GICV3_PRIO_IRQ' undeclared here (not in a function)
      40 | static u8 dist_prio_irq __ro_after_init = GICV3_PRIO_IRQ;
         |                                           ^~~~~~~~~~~~~~
>> drivers/irqchip/irq-gic-v3.c:41:43: error: 'GICV3_PRIO_NMI' undeclared here (not in a function)
      41 | static u8 dist_prio_nmi __ro_after_init = GICV3_PRIO_NMI;
         |                                           ^~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c: In function 'gic_rpr_is_nmi_prio':
>> drivers/irqchip/irq-gic-v3.c:826:1: warning: control reaches end of non-void function [-Wreturn-type]
     826 | }
         | ^


vim +/GICV3_PRIO_IRQ +40 drivers/irqchip/irq-gic-v3.c

    39	
  > 40	static u8 dist_prio_irq __ro_after_init = GICV3_PRIO_IRQ;
  > 41	static u8 dist_prio_nmi __ro_after_init = GICV3_PRIO_NMI;
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
