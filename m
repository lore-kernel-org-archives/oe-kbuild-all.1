Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C437174C1B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 11:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726486434; cv=none; b=CP9LkigfVp72YASR00C6acA2JaA0hi8VatXhs3SjiOLKadklB45JBoA9iiO8eBOptY5aw6jKD4eNm8ccL27ZyuGpQknyWgQXP8R0P09PuL2YEZox1avcLmerNvx81tpz3Gq2CWF7hft0DjHrFHzpYgMij2vzvPQera2bfFKXqN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726486434; c=relaxed/simple;
	bh=hBHUpdRlnIt4Y0YuG9R9NDQ3JI6vZgM2/c5qrYkrfWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ORj8NCMZVVIRLzp7A9VDRQLvlisV+8WkN1z31LKPyLgIwxzmd6hrTXjai5uhMnteErGUgQKMauwS6t3W2aOQhfeGlcZVqIGrrXZAu1fZ1uZ284Am0OIkeGJaVGGjUXQWtxHPgIj45FdDBsrPO+QYjEVCa+WmSsOr65UUIDYhbDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KlBfdgsR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KlBfdgsR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726486433; x=1758022433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hBHUpdRlnIt4Y0YuG9R9NDQ3JI6vZgM2/c5qrYkrfWM=;
  b=KlBfdgsRpDsvCmi/ITZkSQjQ4SS7Gq5ssoGDcYIGT5wbNYQSVOnVvovz
   cbjKhLI3eXgP6TVxyosPN+iqukygOVsizg1EOesN+nS/z2WTpT1YT9tTl
   J6x4irsmrnjAN0O7qf5SXV8crKYOnaIZ7xcRUDXGACyokCUduaArdELmN
   n+JUf6+S+IMH5z58hdArISzs/d+iBwt0Z0tseZB0oXJfwnOtsI6bMZDC0
   6ko9HYjz0YmWyw4xRiFWaaEI/JDi4kX8gBU9iXvS9LjaaN6Z6GIph5z9g
   bXZcIIqsJWviXuICN09r/csq1J8Sr2gbjrzg4sQpfui0p9rXetrd6Bt4P
   Q==;
X-CSE-ConnectionGUID: sF5akzpzQKOaeGx8KdAt+A==
X-CSE-MsgGUID: faxhqZcGTO+7/NYiDy+08Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24791765"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="24791765"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 04:33:52 -0700
X-CSE-ConnectionGUID: mPW+o/QvQAiRnTz60/YZKA==
X-CSE-MsgGUID: 2n+vLQc6RKCj6rh9IRlf/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="73217288"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Sep 2024 04:33:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq9zI-0009i0-1w;
	Mon, 16 Sep 2024 11:33:48 +0000
Date: Mon, 16 Sep 2024 19:33:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Achal Verma <a-verma1@ti.com>
Subject: [ti:ti-linux-6.1.y-wip 4/64]
 drivers/pci/controller/dwc/pci-keystone.c:292:6: warning: no previous
 prototype for 'ks_pcie_irq_eoi'
Message-ID: <202409161926.rDo103FE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   c1c2f1971fbf6ddad93a8c94314fe8221e7aa6be
commit: 6aed116cd98bebc49ae9b7b6df299ca7a4da91f8 [4/64] PCI: keystone: Convert to using hierarchy domain for legacy interrupts
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240916/202409161926.rDo103FE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409161926.rDo103FE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161926.rDo103FE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/dwc/pci-keystone.c:292:6: warning: no previous prototype for 'ks_pcie_irq_eoi' [-Wmissing-prototypes]
     292 | void ks_pcie_irq_eoi(struct irq_data *data)
         |      ^~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-keystone.c:301:6: warning: no previous prototype for 'ks_pcie_irq_enable' [-Wmissing-prototypes]
     301 | void ks_pcie_irq_enable(struct irq_data *data)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-keystone.c:310:6: warning: no previous prototype for 'ks_pcie_irq_disable' [-Wmissing-prototypes]
     310 | void ks_pcie_irq_disable(struct irq_data *data)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/ks_pcie_irq_eoi +292 drivers/pci/controller/dwc/pci-keystone.c

   291	
 > 292	void ks_pcie_irq_eoi(struct irq_data *data)
   293	{
   294		struct keystone_pcie *ks_pcie = irq_data_get_irq_chip_data(data);
   295		irq_hw_number_t hwirq = data->hwirq;
   296	
   297		ks_pcie_app_writel(ks_pcie, IRQ_EOI, hwirq);
   298		irq_chip_eoi_parent(data);
   299	}
   300	
 > 301	void ks_pcie_irq_enable(struct irq_data *data)
   302	{
   303		struct keystone_pcie *ks_pcie = irq_data_get_irq_chip_data(data);
   304		irq_hw_number_t hwirq = data->hwirq;
   305	
   306		ks_pcie_app_writel(ks_pcie, IRQ_ENABLE_SET(hwirq), INTx_EN);
   307		irq_chip_enable_parent(data);
   308	}
   309	
 > 310	void ks_pcie_irq_disable(struct irq_data *data)
   311	{
   312		struct keystone_pcie *ks_pcie = irq_data_get_irq_chip_data(data);
   313		irq_hw_number_t hwirq = data->hwirq;
   314	
   315		ks_pcie_app_writel(ks_pcie, IRQ_ENABLE_CLR(hwirq), INTx_EN);
   316		irq_chip_disable_parent(data);
   317	}
   318	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
