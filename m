Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031531BC3F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 20:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747168627; cv=none; b=ll5Wlvy6EwUwOxcdwiH5oaoXT7MtEnV5r4MxXiqDAgpcuqHSTSVKlxjWr0Ct7xl09JO3EusxazZ9/nc27lwRqz07rNwnr/7breoEicNltwEfi1Hj+hPWHLaVjbAoNQGebs7aJ4VKNDvAQzvbMyCJuAHAKn5AVZA/cTyZNUczJQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747168627; c=relaxed/simple;
	bh=BYdnIPzTG/TR4vG6AM9G+Wt5S/9ti6+MNSoSKwZoxL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H+ifexBBkBTcjzCXxawQ3twmqWStFXwI3s/g4WQMjejbJYaJl57FhSzJiVDHsX+5Zp0x/ME8MiQHYS8NO2EcAzlt1kgPuClr1inHJO4GBi0aW0GDh2XDOh0yD9JFH75Mqgv54wsw70BaXYJCo+cF7eQPdr2GGtOpdwK2xzdBMI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hivOqueD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hivOqueD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747168622; x=1778704622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BYdnIPzTG/TR4vG6AM9G+Wt5S/9ti6+MNSoSKwZoxL8=;
  b=hivOqueDs+9gLf9RQEIfE4i8y3BimyzcvMDeipK8sv4ZaFK8/21x6LPi
   2Z75qPS1pzExyxTkZKhNKNojwC/OLGyssUodJWT2vKkG3WLMeSeFfkova
   NRhGT85ysQmOm+uyHcfbsS562CCDFbKtyk2PbTOY40QBjmARkK2QxOF2X
   vmA9McfHTs/aQp7davcKShZcfHGZz6Q2vJNPtDNp3C2Uoq7jbNHUzrXa9
   zOHnYgd5YiWBMoSbBsyYUN9AXzuHZ+cLx0gyzRhuZkpHcEYtYFf9/SVoJ
   dLWRM1U+nm4vIJqF8wnxhqWt9xVQTlCN7c8/XdXqL2lEluHoIX/WcEj3E
   w==;
X-CSE-ConnectionGUID: V2N1d6MQTCKpfyuY9O90Yw==
X-CSE-MsgGUID: WTmQTRDxReWrabQ4uvdTkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="59671284"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="59671284"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 13:37:01 -0700
X-CSE-ConnectionGUID: KgTScdJMTNmTsdjBzFwUKQ==
X-CSE-MsgGUID: UmrQrlzIR2SOsdwTT2ropQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="142702540"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 May 2025 13:37:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEwN0-000GNT-11;
	Tue, 13 May 2025 20:36:58 +0000
Date: Wed, 14 May 2025 04:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:dev/gicv5-v4 26/27]
 drivers/irqchip/irq-gic-v5-its.c:816:13: sparse: sparse: cast to restricted
 __le64
Message-ID: <202505140441.VPwswM4Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lorenzo,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git dev/gicv5-v4
head:   5731383379ee882b2a7f7c82f36939a9f4e52fda
commit: 28491e22c921e270365748a18c6197eb103764c5 [26/27] arm64: Kconfig: Enable GICv5
config: arm64-randconfig-r112-20250513 (https://download.01.org/0day-ci/archive/20250514/202505140441.VPwswM4Z-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250514/202505140441.VPwswM4Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505140441.VPwswM4Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-gic-v5-its.c:816:13: sparse: sparse: cast to restricted __le64
>> drivers/irqchip/irq-gic-v5-its.c:816:13: sparse: sparse: restricted __le64 degrades to integer
>> drivers/irqchip/irq-gic-v5-its.c:816:13: sparse: sparse: restricted __le64 degrades to integer

vim +816 drivers/irqchip/irq-gic-v5-its.c

330a48e8624707 Lorenzo Pieralisi 2024-10-03  806  
330a48e8624707 Lorenzo Pieralisi 2024-10-03  807  static int gicv5_its_map_event(struct gicv5_its_dev *its_dev, u16 event_id,
330a48e8624707 Lorenzo Pieralisi 2024-10-03  808  			       u32 lpi)
330a48e8624707 Lorenzo Pieralisi 2024-10-03  809  {
330a48e8624707 Lorenzo Pieralisi 2024-10-03  810  	struct gicv5_its_chip_data *its = its_dev->its_node;
330a48e8624707 Lorenzo Pieralisi 2024-10-03  811  	u64 itt_entry;
330a48e8624707 Lorenzo Pieralisi 2024-10-03  812  	__le64 *itte;
330a48e8624707 Lorenzo Pieralisi 2024-10-03  813  
330a48e8624707 Lorenzo Pieralisi 2024-10-03  814  	itte = gicv5_its_device_get_itte_ref(its_dev, event_id);
330a48e8624707 Lorenzo Pieralisi 2024-10-03  815  
330a48e8624707 Lorenzo Pieralisi 2024-10-03 @816  	if (FIELD_GET(GICV5_ITTL2E_VALID, *itte))
330a48e8624707 Lorenzo Pieralisi 2024-10-03  817  		return -EEXIST;
330a48e8624707 Lorenzo Pieralisi 2024-10-03  818  
330a48e8624707 Lorenzo Pieralisi 2024-10-03  819  	itt_entry = FIELD_PREP(GICV5_ITTL2E_LPI_ID, lpi) |
330a48e8624707 Lorenzo Pieralisi 2024-10-03  820  		    FIELD_PREP(GICV5_ITTL2E_VALID, 0x1);
330a48e8624707 Lorenzo Pieralisi 2024-10-03  821  
330a48e8624707 Lorenzo Pieralisi 2024-10-03  822  	its_write_table_entry(its, itte, itt_entry);
330a48e8624707 Lorenzo Pieralisi 2024-10-03  823  
330a48e8624707 Lorenzo Pieralisi 2024-10-03  824  	gicv5_its_itt_cache_inv(its, its_dev->device_id, event_id);
330a48e8624707 Lorenzo Pieralisi 2024-10-03  825  
330a48e8624707 Lorenzo Pieralisi 2024-10-03  826  	return 0;
330a48e8624707 Lorenzo Pieralisi 2024-10-03  827  }
330a48e8624707 Lorenzo Pieralisi 2024-10-03  828  

:::::: The code at line 816 was first introduced by commit
:::::: 330a48e8624707ecabfd2d28d05ea2a5fb9de847 irqchip/gic-v5: Add GICv5 ITS support

:::::: TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
:::::: CC: Lorenzo Pieralisi <lpieralisi@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
