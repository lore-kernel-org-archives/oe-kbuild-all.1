Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A877E4F88D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 13:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707570564; cv=none; b=cKFp7ug/ZIFjZJRDhkqXPmmq5mWf+zvI192OVEC+mI4JXPyjCj5b/Y5lg9u+sbslPBf8Y4cM7o8Z5vGeDJR92vm2A/DJyLT6PFnvA5saxVwwda23jCLpPq1tCks7ldnHm3O+g+gVwS+6ArbmL8b87BWZIoOmP1W1sYLK8ljlJsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707570564; c=relaxed/simple;
	bh=QdN5O+pIFYqtAByEwEVBgBrpmDNTt+7cN3BkE+mM7VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hNWbo0NTQCRmbFw8L7y7PbutOiAIGMom/gKgYVQ43UVNC5e2uCfcnOI3HcbGLD4s3QlV99Gk1g1w+ieU4WG5EtJQkTm+/6T+ey19qQf/vDYGxWcSwlJEdHWjMyFiCUSxgf08ft77McxbGB/weohva3DaulhqJgnMchaFU+pFU4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nkTBO7F9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nkTBO7F9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707570563; x=1739106563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QdN5O+pIFYqtAByEwEVBgBrpmDNTt+7cN3BkE+mM7VQ=;
  b=nkTBO7F9/CMi6H+RPd2S0/MBo/s6znnnWqgzncOJGIyw+UytiZ0sxQVi
   TRcAECytb2aGUs7dET1KR6c9F//sLHPmCmsnr/ZT5ea+n/tywtIoiaL+a
   Vn1IFxSCPs1sIVR951E0co1oSST5nU0HE1t61kKwf04e5Kpuc1RIBwm9o
   cGtUoXa8wKECtJWhno6f2WZuEsjRCmeMKlrZm+O7XIWypERseilzuwpj/
   a8MeLqOeG6T+Cc51Y7umwTYrNxLhs6Q0tb8+UN43Iu7Y/hNA2HkNgTQEa
   9/q0cOzWrOe66JB7dab2gTpz8iQKmgO9mYUxC2QPMfddJhAWFwVtX1aja
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1694295"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="1694295"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 05:09:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="6919655"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Feb 2024 05:09:20 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYn6b-0005fy-28;
	Sat, 10 Feb 2024 13:09:17 +0000
Date: Sat, 10 Feb 2024 21:08:53 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 2952/17898]
 drivers/irqchip/irq-imx-gpcv2.c:229:5: warning: no previous prototype for
 function 'imx8mq_gpcv2_irq_set_affinity'
Message-ID: <202402102106.Uf86F2GY-lkp@intel.com>
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
commit: 2fd38093409494849623c729467047793cc2d83a [2952/17898] MLK-21399 irqchip: Allow i.MX8MQ to call into TF-A
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240210/202402102106.Uf86F2GY-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402102106.Uf86F2GY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402102106.Uf86F2GY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-imx-gpcv2.c:123:2: error: implicit declaration of function 'set_smp_cross_call' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           set_smp_cross_call(imx_gpcv2_raise_softirq);
           ^
>> drivers/irqchip/irq-imx-gpcv2.c:229:5: warning: no previous prototype for function 'imx8mq_gpcv2_irq_set_affinity' [-Wmissing-prototypes]
   int imx8mq_gpcv2_irq_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
       ^
   drivers/irqchip/irq-imx-gpcv2.c:229:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int imx8mq_gpcv2_irq_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
   ^
   static 
   1 warning and 1 error generated.


vim +/imx8mq_gpcv2_irq_set_affinity +229 drivers/irqchip/irq-imx-gpcv2.c

   228	
 > 229	int imx8mq_gpcv2_irq_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
   230			      bool force)
   231	{
   232		struct arm_smccc_res res;
   233		int cpu = cpumask_any_and(cpumask, cpu_online_mask);
   234	
   235		arm_smccc_smc(FSL_SIP_GPC, FSL_SIP_CONFIG_GPC_SET_AFF,
   236			d->hwirq, cpu, 0, 0, 0, 0, &res);
   237	
   238		return irq_chip_set_affinity_parent(d, cpumask, force);
   239	}
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
