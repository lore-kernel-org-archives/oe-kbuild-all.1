Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D8420C47E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 21:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730928823; cv=none; b=nakLopolrs2a8adFMyz/oqHnJEPEDWVxO/c9M+mRtVgX38JOMzuOcvMJDFoMo1UCR8BY2XfxoUgsMGYZyk4M5FZj/F3XQ46P0TUuKShIOREV8gCt4UGwOKfHNiDiSUGN/wmml1eeKDBqbESgOHv4wfvmYk55pxlB6rJOByN30Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730928823; c=relaxed/simple;
	bh=tuHJn4h7mvtKJ4KlbfZMqQRK5U7n8y7PmhTCOA1eoNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aDqC7BF6lb94Z+/OQI8TmN7iw3Qo3OlAJcIr1r6VrLR+qV2lzQKELJZSKuI0E3R3KlqRrPWlfKGIv9VtJzydqmtS4vGaH4MRiAQZpT4SpsP79Mjt+4RqKE3BumYizdsAZIkWH1eh4AayZlANlHwijNKesUZOylhGQZ+KL17szQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ctgpOZaY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ctgpOZaY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730928821; x=1762464821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tuHJn4h7mvtKJ4KlbfZMqQRK5U7n8y7PmhTCOA1eoNM=;
  b=ctgpOZaYFuqf3pXTykV4Lb5FcIS9AbIgEyeiorVdWztdUTKOxiYWOU7s
   6yZucjyxGycTvZSL3gjYiEWuqKRE0k40VaiE5Kl+hHSH5gqeSehE00qRD
   7ywRL7YEAkFhSgXyMASR6432xEQ0NRTR9nO03Rv7eBrx764KQT35cVF0N
   yHt8kbpTsa4rzIscCXqqcm10GiXf6ZwY+D8IXZ0+/3Au4r3JWvrRZ5OE5
   OdlDSbUSQ8zPX+m1jgomQkPSL+3CwVmUMq/NGyhp7eUnVTDhGcBx8aZnS
   te2fvF8vcBd7s9wu4I+dxNbdRH9iMlk2VeV/ExTVowfMdEyp/hGiUaGZo
   w==;
X-CSE-ConnectionGUID: JtMTm5FwSe+YOZ5AhOpMGw==
X-CSE-MsgGUID: +bmzCZgPQW6MTqCXx68iHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53308245"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53308245"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 13:33:40 -0800
X-CSE-ConnectionGUID: RzXHPlH5Qkeppug2kuQrQw==
X-CSE-MsgGUID: EIMKR3oGRqWNggzKE/p3ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="89362290"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2024 13:33:37 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8neh-000pRe-0H;
	Wed, 06 Nov 2024 21:33:35 +0000
Date: Thu, 7 Nov 2024 05:33:23 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 drivers/thermal/intel/int340x_thermal/processor_thermal_device.c:471:50:
 sparse: sparse: cast removes address space '<asn:2>' of expression
Message-ID: <202411070534.xFrgkY7p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: 555c45fe0d04bd817e245a125d242b6a86af4593 [1/1] int340X/processor_thermal_device: add support for MMIO RAPL
config: x86_64-randconfig-123-20241028 (https://download.01.org/0day-ci/archive/20241107/202411070534.xFrgkY7p-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070534.xFrgkY7p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070534.xFrgkY7p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/thermal/intel/int340x_thermal/processor_thermal_device.c:471:50: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/thermal/intel/int340x_thermal/processor_thermal_device.c:475:36: sparse: sparse: cast removes address space '<asn:2>' of expression

vim +471 drivers/thermal/intel/int340x_thermal/processor_thermal_device.c

   447	
   448	static int proc_thermal_rapl_add(struct pci_dev *pdev,
   449					 struct proc_thermal_device *proc_priv,
   450					 struct rapl_mmio_regs *rapl_regs)
   451	{
   452		enum rapl_domain_reg_id reg;
   453		enum rapl_domain_type domain;
   454		int ret;
   455	
   456		if (!rapl_regs)
   457			return 0;
   458	
   459		ret = pcim_iomap_regions(pdev, 1 << MCHBAR, DRV_NAME);
   460		if (ret) {
   461			dev_err(&pdev->dev, "cannot reserve PCI memory region\n");
   462			return -ENOMEM;
   463		}
   464	
   465		proc_priv->mmio_base = pcim_iomap_table(pdev)[MCHBAR];
   466	
   467		for (domain = RAPL_DOMAIN_PACKAGE; domain < RAPL_DOMAIN_MAX; domain++) {
   468			for (reg = RAPL_DOMAIN_REG_LIMIT; reg < RAPL_DOMAIN_REG_MAX; reg++)
   469				if (rapl_regs->regs[domain][reg])
   470					rapl_mmio_priv.regs[domain][reg] =
 > 471							(u64)proc_priv->mmio_base +
   472							rapl_regs->regs[domain][reg];
   473			rapl_mmio_priv.limits[domain] = rapl_regs->limits[domain];
   474		}
   475		rapl_mmio_priv.reg_unit = (u64)proc_priv->mmio_base + rapl_regs->reg_unit;
   476	
   477		rapl_mmio_priv.read_raw = rapl_mmio_read_raw;
   478		rapl_mmio_priv.write_raw = rapl_mmio_write_raw;
   479	
   480		rapl_mmio_priv.control_type = powercap_register_control_type(NULL, "intel-rapl-mmio", NULL);
   481		if (IS_ERR(rapl_mmio_priv.control_type)) {
   482			pr_debug("failed to register powercap control_type.\n");
   483			return PTR_ERR(rapl_mmio_priv.control_type);
   484		}
   485	
   486		ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "powercap/rapl:online",
   487					rapl_mmio_cpu_online, rapl_mmio_cpu_down_prep);
   488		if (ret < 0) {
   489			powercap_unregister_control_type(rapl_mmio_priv.control_type);
   490			return ret;
   491		}
   492		rapl_mmio_priv.pcap_rapl_online = ret;
   493	
   494		return 0;
   495	}
   496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
