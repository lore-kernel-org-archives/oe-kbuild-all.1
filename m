Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9713220FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 08:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFN2/33q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698482777; x=1730018777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=15edaww+yY/vj0E/KSoEJNEtcddRrDsNpkhLucfg4+s=;
  b=HFN2/33qdyZoixYRW4jbVFyze/EJ7nWG7pXKETAyN6bm3QAy0rjh5kVC
   U+Fl9ETP5q0biypDO3w5hnCycyX7TcoudHnF3FkyCR7hFIOI7KtXw9ipa
   FEXTP3wAiopnsWTksrnWmsVLd7whhKeHAqz2cGi3xOTRq9hHCe4UywGTH
   za4IxH6NI3pSbKhgZT8YKLd6aP0Fwj3C79+QlhIJCq9rMeFXOEyFg8XYt
   2iVRR3n4m4ixTOfilGrDRQNvXFYa+PJ2o9/BUaZfqSmJZQzDWtx2bOM3c
   jX9j/nAy00I7xZuf73PHNP2xhRtxOyxOBr22+phD3Qr4fAJ+esMpypVgW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="418997748"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="418997748"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 01:46:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="736318090"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="736318090"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Oct 2023 01:46:15 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwexQ-000Bal-38;
	Sat, 28 Oct 2023 08:46:12 +0000
Date: Sat, 28 Oct 2023 16:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_b2_v2 96/102]
 drivers/irqchip/irq-riscv-aplic-direct.c:215:22: error: implicit declaration
 of function 'acpi_get_ext_intc_parent_hartid'
Message-ID: <202310281632.88njH2X6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v2
head:   2240a0f7255cc50372fa4cf3ebdb9e7db3da1256
commit: 392cf51922c7fff51c4d81dce1ab2d6254b7b7df [96/102] irqchip: riscv-aplic: Add ACPI support
config: riscv-randconfig-001-20231028 (https://download.01.org/0day-ci/archive/20231028/202310281632.88njH2X6-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310281632.88njH2X6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310281632.88njH2X6-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/irqchip/irq-riscv-aplic-direct.c: In function 'aplic_direct_parse_parent_hwirq':
>> drivers/irqchip/irq-riscv-aplic-direct.c:215:22: error: implicit declaration of function 'acpi_get_ext_intc_parent_hartid' [-Werror=implicit-function-declaration]
     215 |                 rc = acpi_get_ext_intc_parent_hartid(priv->id, index, parent_hartid);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/irqchip/irq-riscv-aplic-main.c: In function 'aplic_probe':
>> drivers/irqchip/irq-riscv-aplic-main.c:218:28: warning: unused variable 'priv' [-Wunused-variable]
     218 |         struct aplic_priv *priv;
         |                            ^~~~


vim +/acpi_get_ext_intc_parent_hartid +215 drivers/irqchip/irq-riscv-aplic-direct.c

   205	
   206	static int aplic_direct_parse_parent_hwirq(struct device *dev,
   207						   u32 index, u32 *parent_hwirq,
   208						   unsigned long *parent_hartid,
   209						   struct aplic_priv *priv)
   210	{
   211		struct of_phandle_args parent;
   212		int rc;
   213	
   214		if (!is_of_node(dev->fwnode)) {
 > 215			rc = acpi_get_ext_intc_parent_hartid(priv->id, index, parent_hartid);
   216			if (rc)
   217				return rc;
   218	
   219			*parent_hwirq = RV_IRQ_EXT;
   220			return 0;
   221		}
   222	
   223		rc = of_irq_parse_one(to_of_node(dev->fwnode), index, &parent);
   224		if (rc)
   225			return rc;
   226	
   227		rc = riscv_of_parent_hartid(parent.np, parent_hartid);
   228		if (rc)
   229			return rc;
   230	
   231		*parent_hwirq = parent.args[0];
   232		return 0;
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
