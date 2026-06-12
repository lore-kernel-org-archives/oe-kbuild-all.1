Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105388248B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 23:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781308673; cv=none; b=i5vmdM3B+QIWq72hnGU+EInWaJZCPnAgV1P5+Ga0IVsO2DXRnyqeW0DQE87f8kFU7W9DYUY/GmoI4FAjMHUvlNUGlily7pvhnol3GhGLmoFNDrQAIfRUk9zzpPGn+N0u5RvaF4BvKempNTOJ4iF6DOigz5VRrmtZB9W0rRBmGH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781308673; c=relaxed/simple;
	bh=nVvr0VdQtgZvAtePH++I47Z8+Dl4UBPj+EPjbiAdobk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MBwl3SZiFRfdTLpXOXwUp38PLWado8t5I+5ntllfDJ22l0yIf8LlUwXTS2D7USOytIa2LBjBwo5Ym32QWOPKe4rYcA4YaG5n+57y8Z3hEhT1usavu9B9CBU9m2yusMS/qw9z76pVsabspNucWzt0hwY8Jmdf3pZgJpjKxKV82HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AB+A9T8L; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AB+A9T8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781308671; x=1812844671;
  h=date:from:to:cc:subject:message-id;
  bh=nVvr0VdQtgZvAtePH++I47Z8+Dl4UBPj+EPjbiAdobk=;
  b=AB+A9T8LeOqY/K8B0ozTrNXXrh3tFD01anUA1TyeTTqHHEBT7T78HKsd
   kSXqfqrJlBhjXISuG4D/uRAnYfnskueIIVyEqzDPZEgC9eeGtWhTQlVLQ
   ltmjQLuQwZDCBZNg7wIdYvmIusP2+83cX4UizDZlTDRYlepX0LvEzD/Fh
   E+TAaqls111Z+GbY8606tZMBWvDK2N0//RYV6baoX7EvRY6F4+Fk2VzoD
   vcaCLgzD5mhsgsZ5fOM/zhb56OffVMJuoykoempLv5G/f1u4vkMlpKUTF
   nDnXmQKNWLvZJ31supHzUzLAKs0/QSh+IOZSaSMlyGTKaQoegNNuBv8N6
   w==;
X-CSE-ConnectionGUID: 2ZmUaawHQgmab2zWZ2bvpQ==
X-CSE-MsgGUID: Fh/jhnINRVikYtF7i63G+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="99726891"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="99726891"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 16:57:51 -0700
X-CSE-ConnectionGUID: r+DSR+8VTymItHZQpFUDaw==
X-CSE-MsgGUID: sInWJq5LQ7qvzrBuXXs1hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="248837806"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jun 2026 16:57:49 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYBkw-00000000PTp-4C1w;
	Fri, 12 Jun 2026 23:57:47 +0000
Date: Sat, 13 Jun 2026 07:56:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rclaveau:b4/add-adla_npu-t7-vim4 11/12]
 drivers/accel/adla/adla_job.c:168:6: warning: unused variable 'sts'
Message-ID: <202606130722.TDFhlJru-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rclaveau-tech/linux-khadas.git b4/add-adla_npu-t7-vim4
head:   3e1cd9728037a89d53b1973467e84cf36e811d34
commit: 13dd4bece0271670a4b47d9493e2746ff695b3e1 [11/12] accel: adla: Add driver for Amlogic NPU
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260613/202606130722.TDFhlJru-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 62847ab7593df144a5708406e6240ec5e8a3a101)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130722.TDFhlJru-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606130722.TDFhlJru-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accel/adla/adla_job.c:168:6: warning: unused variable 'sts' [-Wunused-variable]
     168 |         u32 sts;
         |             ^~~
   1 warning generated.


vim +/sts +168 drivers/accel/adla/adla_job.c

   163	
   164	static enum drm_gpu_sched_stat adla_timedout_job(struct drm_sched_job *sched_job)
   165	{
   166		struct adla_job *job  = container_of(sched_job, struct adla_job, base);
   167		struct adla_device *adla = job->adla;
 > 168		u32 sts;
   169	
   170		dev_warn(adla->drm.dev, "timeout: IRQ_RAW=0x%x IRQ_MASKED=0x%x IRQ_MASK=0x%x PS_STS=0x%x TIME_STAMP=0x%x\n",
   171			 readl(adla->regs + REG_ADLA_IRQ_RAW),
   172			 readl(adla->regs + REG_ADLA_IRQ_MASKED),
   173			 readl(adla->regs + REG_ADLA_IRQ_MASK),
   174			 readl(adla->regs + REG_ADLA_PS_STS),
   175			 readl(adla->regs + 0x60));
   176	
   177		/*sts = readl(adla->regs + REG_ADLA_PS_STS);
   178		if (!(sts & ADLA_PS_STS_BUSY)) {
   179			dev_warn(adla->drm.dev, "job %u: timed out but idle parser\n", job->id);
   180			return DRM_GPU_SCHED_STAT_NO_HANG;
   181		}*/
   182	
   183		dev_err(adla->drm.dev, "job %u timed out, STS_REPORT=0x%08x\n",
   184			job->id, readl(adla->regs + REG_ADLA_STS_REPORT));
   185	
   186		/* Reset hardware */
   187		writel(0, adla->regs + REG_ADLA_IRQ_MASK);
   188		writel(ADLA_SWRST_ASSERT, adla->regs + REG_ADLA_SWRST);
   189		udelay(10);
   190		writel(0, adla->regs + REG_ADLA_SWRST);
   191	
   192		/* Ring buffer reinit */
   193		adla->rbf_wpt = 0;
   194		writel(0, adla->regs + REG_ADLA_PS_RBF_WPT);
   195		writel(0, adla->regs + REG_ADLA_PS_RBF_RPT);
   196	
   197		if (readl(adla->regs + REG_ADLA_REVISION) == 0xFFFFFFFF) {
   198			dev_err(adla->drm.dev, "hardware unreachable after reset\n");
   199			return DRM_GPU_SCHED_STAT_ENODEV;
   200		}
   201	
   202		writel(ADLA_ENABLE_BIT, adla->regs + REG_ADLA_ENABLE);
   203		writel(ADLA_IRQ_PARSER_STOP_CMD |
   204		       ADLA_IRQ_PARSER_STOP_ERR |
   205		       ADLA_IRQ_INVALID_IOVA,
   206		       adla->regs + REG_ADLA_IRQ_MASK);
   207	
   208		return DRM_GPU_SCHED_STAT_RESET;
   209	}
   210	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
