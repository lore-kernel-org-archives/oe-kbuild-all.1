Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BF35A78A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Feb 2024 10:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707648900; cv=none; b=hLnJKx8uffnJs5d/H+qY2HoWcpuaYjX85bbTzlG3Khgd0AgR5o0yBviLGD8QPUHF12TONNRIUzHa1xyIGTr2u3nprCGbbUoOPGvzRhSjVmSRmfMFZnvhYtMLGIzX9aX6umlyp9wxtBv6XpKfiFMk900O/3f/b1C7GEKDyH+vRh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707648900; c=relaxed/simple;
	bh=W8WE6oZXlXTjhPSokHoeMd2UirL99b1TlufjrKYj9+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bSQ6JwVknEyEb5Lg9tEhdwKBo6svrddHVFEZlrreNmNbFOvZI7pZ1qTdJ2l1ctAeIg419kxRSb7Cpu+JdKmygfqfvmqnf/KsNBWbHFRIoDwwARpQv2m42X7d/5yGyT0qJ75763oHR1+xLQA9d2fNDKbpHK/YgeP5jjjl2VgOo8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ecr2LVpN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ecr2LVpN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707648897; x=1739184897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W8WE6oZXlXTjhPSokHoeMd2UirL99b1TlufjrKYj9+0=;
  b=Ecr2LVpN7KxSrysAjOxQty8xoWOaRRjZqhNJYkB6lVZF/Z8nmhShuPBJ
   wwKOzIKqRaapQbPMi+p8vNuhCzs9DZ81+r743Y43BwuKiR40PeUiP3WGB
   bKqTTnZ6kMFEEVPM1E+9DJLWbQ8veGQ13OjaiG/TZwrCFerRQ33RR3gj0
   1bx09n8VvCdOkUM0cZMqWPz18SB6SRI2BbRaRvWFo2IxbX4SkwpSWI0n5
   GvX1kuv7prXv1ikVcj+7W9MSAxcmldnpxe1EgZB2X0RN0PJLLBAv4OdTn
   42PyWAPDk7UMr3tjDAoOe3b7yV2wE22eicvjpyc8qH2iDtbwoXyv1NNLu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="12181954"
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="12181954"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2024 02:54:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="33415896"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Feb 2024 02:54:55 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZ7U5-0006WQ-1x;
	Sun, 11 Feb 2024 10:54:53 +0000
Date: Sun, 11 Feb 2024 18:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 2959/17898]
 drivers/irqchip/irq-imx-gpcv2.c:91:6: warning: no previous prototype for
 function 'imx_gpcv2_raise_softirq'
Message-ID: <202402111805.QhunUUIi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   4e3fc5471376a15279ee5c99e791a7c7b065cbc1
commit: 24467b72b33a0463acff6ee96c4ce75ef0009356 [2959/17898] LF-2438 drivers: irqchip: irq-imx-gpcv2: Remove the smp_cross_call reference
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240211/202402111805.QhunUUIi-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402111805.QhunUUIi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402111805.QhunUUIi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-imx-gpcv2.c:91:6: warning: no previous prototype for function 'imx_gpcv2_raise_softirq' [-Wmissing-prototypes]
   void imx_gpcv2_raise_softirq(const struct cpumask *mask,
        ^
   drivers/irqchip/irq-imx-gpcv2.c:91:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void imx_gpcv2_raise_softirq(const struct cpumask *mask,
   ^
   static 
   drivers/irqchip/irq-imx-gpcv2.c:224:5: warning: no previous prototype for function 'imx8mq_gpcv2_irq_set_affinity' [-Wmissing-prototypes]
   int imx8mq_gpcv2_irq_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
       ^
   drivers/irqchip/irq-imx-gpcv2.c:224:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int imx8mq_gpcv2_irq_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
   ^
   static 
   2 warnings generated.


vim +/imx_gpcv2_raise_softirq +91 drivers/irqchip/irq-imx-gpcv2.c

    89	
    90	#ifdef CONFIG_SMP
  > 91	void imx_gpcv2_raise_softirq(const struct cpumask *mask,
    92						  unsigned int irq)
    93	{
    94		struct arm_smccc_res res;
    95	
    96		if (!err11171)
    97			return;
    98	
    99		/* now call into EL3 and take care of the wakeup */
   100		arm_smccc_smc(FSL_SIP_GPC, FSL_SIP_CONFIG_GPC_CORE_WAKE,
   101				*cpumask_bits(mask), 0, 0, 0, 0, 0, &res);
   102	}
   103	#endif
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
