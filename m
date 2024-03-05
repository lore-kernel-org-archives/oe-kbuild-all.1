Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77752563
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 23:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709679966; cv=none; b=RFWQZf7Lq215j7YIlOHgKW1WYtqWtnuyXxy+qEc8KqkYSYAob+31Kzd3b50Zd7wNtg92833Px6rPFmrE5MMpS65b1BdLHK+7rylpbebzepcO221EtOAr/RNFScTLh8oSd/PPpGwICLzRDKOoZ5Bz55XO6NocIUdhJpYl9UIaEBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709679966; c=relaxed/simple;
	bh=enJmhr4mxuezAeR1BvYE1aUFSdt2OIRK20REMOmcot8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YHrStxowe0FYOkmn3TJTPPS1DWQ8meTJG6jOh1Rb+ef5kwNn+kQdbnAtiuegko6zfXX29q06VaBlEJSuogHTBIMPtiRrlTSDQQ1CgUqpREkHvN9rfqAH1RHjoBWd93LtIz+4wSXyqwS+sRq8oCjjzTxW7cTS/UXza+TviCyLdBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkeapnrN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkeapnrN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709679964; x=1741215964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=enJmhr4mxuezAeR1BvYE1aUFSdt2OIRK20REMOmcot8=;
  b=FkeapnrN9qJyP7bYznM0T6pd1as4uvr6EFthuDT3YMlqAn4GTGl8t0HV
   39+AsEbSbnQDNQ+Fx8w3yxpeXd/Oytw22TJIlJl0Oh4eNHqRdF71QAVXi
   XXll3tDTq+/rNF4fbrHIa2mllMtjXir63++qKicDKWAymT8ypg2A/IciU
   PkUphRX3RW21bfdaGI1trFiZeiV+3qcdj5Z+3neCEZcAVqO7QdrrL6Hwe
   UWMSBxPwGtE3MdZZXaMA2L4W9+POrWP44Ba0l8kfa7nRjYSX7NbtAHNJr
   v/0jaiQ7oCdmZW2Bu+9LlzZvdbhYRNeN1Qgtr5GRVaZLbCeWDjvwblYdM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="29688621"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="29688621"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 15:06:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="9487957"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Mar 2024 15:06:02 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhdrE-0003jN-1p;
	Tue, 05 Mar 2024 23:06:00 +0000
Date: Wed, 6 Mar 2024 07:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sundongxu <sundongxu3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3780/3862] drivers/irqchip/irq-mbigen.c:136:
 warning: expecting prototype for Due to the existence of hyper(). Prototype
 was for GICR_LENGTH() instead
Message-ID: <202403060608.GPZuZJMR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f44547cb66ee30ed552adb15046a912cd1409c1f
commit: 3ce0ad7d0b4cb6538fe25fb20ca838c06e3cc516 [3780/3862] mbigen: vtimer mbigen driver support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240306/202403060608.GPZuZJMR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403060608.GPZuZJMR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403060608.GPZuZJMR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-mbigen.c:77: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * MBIX config register
   drivers/irqchip/irq-mbigen.c:127: warning: Function parameter or member 'vtimer_mbigen_chip' not described in 'mbigen_device'
>> drivers/irqchip/irq-mbigen.c:136: warning: expecting prototype for Due to the existence of hyper(). Prototype was for GICR_LENGTH() instead


vim +136 drivers/irqchip/irq-mbigen.c

   131	
   132	/**
   133	 * Due to the existence of hyper-threading technology, We need to get the
   134	 * absolute offset of a cpu relative to the base cpu.
   135	 */
 > 136	#define GICR_LENGTH                            0x40000
   137	static inline int get_abs_offset(int cpu, int cpu_base)
   138	{
   139		return ((get_gicr_paddr(cpu) - get_gicr_paddr(cpu_base)) / GICR_LENGTH);
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
