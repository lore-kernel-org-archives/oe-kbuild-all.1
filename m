Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659394;
	b=dOunz8b2XH2YiZJzLszlsRvHpkBJkeU30i+Le/6WOfYcbVzEDqi2hZuqVME84ZnQqXQZ
	 nyb6a1ITLYfIwkdRrSMQ6ofBxQx5MzNXd4bwRckUBqd2dPIRye2Q2nMbWm+t59QDWYJ4i
	 aQIvB/nR0DPAYo0HwYXvE21tE2M5Qx74qGETniksKbbZx7PdJZ/YomGQb2R2ticXmYzKG
	 2l/JgymYQ+aOZVyWfMZDXQtJQQmvj11NbH6vbK1S0W1bz1/NYZuREli9hBsr++TK+Fp4C
	 K6ZHPNQD1/Z9+UsT9HjMhoss7z3Wr1di7POgJdiLfBwk3uQ/LOGI+hBjim2hSGodfXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659394;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=bUhrfZGO+O5AZLkhOkU9zd6f0qmoLmVMCsEHPjyKELU=;
	b=PpzTzNrbSPvK1lQShujFMX4HQ0IA8m9e4aITiZKPES3O+HpG9XOY6xVDSm/8l2eHOmw1
	 JSJM5rJinPXt2G5bJQVISEeF6jSZCDd//vVCTRVgVIwvUOf+rRjTeK+4tO6sPaNZDJkpT
	 Ie3HOVErYWXBlZ/+tcFIbb49R/R1NNKEEZ9ZpF3iX8L2sZUwF+yKwjRSk0FtWDwff/b/Y
	 4SHjcyu8lrM5TSpRhCdYwrr/3cK2Q9eaOTgDMpZcASfNZt5tn+xlJYBjAnk0QifYbh/vu
	 HKn3rNID02quoQE/R6k3R1iJB3emBOBSGcOdhrtFGWYPO2GnWuUawXd/vAuT7YWZBGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KjC6rJ3U;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DA8606A31B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Oct 2026 08:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19DA8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KjC6rJ3U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792659393; x=1824195393;
  h=date:from:to:cc:subject:message-id;
  bh=+m5YQ0Ec8v/KzeCvypbSrQysfri40KcLkEq1rIOynL4=;
  b=KjC6rJ3UfsVE8YHB/hwMjylcYfIMMZscTVAotXhY6mfavya6a+ONGUY3
   nQmBUtcjfFHk3V4vjPjrL9QIyW+TsH+bVQ0hK8hLKU9lROIcVlAyEY1qi
   GpUcntyjEutM8z1EE07UA2IlYSQox5rw5wu8/YoBmnV7BF1QYfYbi/8+K
   JMl1yFbGteFCjmsW+L+3kCxr64Lo7WAOWtbKFy3OCT44YoWiEbwrnm7W0
   ufTJ2Q92b1FMMeHcz7kX3FTrITUzMKbSSgV00bwzPMDTb3Hu9ST5pF54S
   wLS5GTTfOjquzpqKueEjE3V/o06ZucCftJdD+pThdCrUML5QN/BiVPToL
   Q==;
X-CSE-ConnectionGUID: /TtbYQFuSYuYakUAZi+8kw==
X-CSE-MsgGUID: ywjVG3FeT1SpF1c9wRSHIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1282526"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1282526"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 01:56:33 -0700
X-CSE-ConnectionGUID: s1Boy1IGTKib0h/+yPs9Tw==
X-CSE-MsgGUID: pNEPUCQmTuq9vAKsIEra8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3326542"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Oct 2026 01:56:32 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJob7-00000000QnO-1dxq;
	Thu, 22 Oct 2026 08:56:29 +0000
Date: Thu, 22 Oct 2026 16:56:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 347/347]
 drivers/irqchip/irq-gic-v3.c:1426:12: warning: 'gic_v3_suspend' defined but
 not used
Message-ID: <202610221643.iVmHMAZ6-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Nagireddy,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   197f6e4d013155f82e6c7a4f8917da803628f323
commit: 275c8705e576de90245e23a3f8cf45c872d4e724 [347/347] ANDROID: irqchip/irq-gic-v3: Add vendor hook for gic suspend
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261022/202610221643.iVmHMAZ6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261022/202610221643.iVmHMAZ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610221643.iVmHMAZ6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3.c:1426:12: warning: 'gic_v3_suspend' defined but not used [-Wunused-function]
    1426 | static int gic_v3_suspend(void) { return 0; }
         |            ^~~~~~~~~~~~~~


vim +/gic_v3_suspend +1426 drivers/irqchip/irq-gic-v3.c

  1422	
  1423	#else
  1424	static inline void gic_syscore_init(void) { }
  1425	void gic_v3_resume(void) { }
> 1426	static int gic_v3_suspend(void) { return 0; }
  1427	#endif
  1428	
  1429	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
