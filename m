Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0E15954C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 23:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VG8CBzfa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701387775; x=1732923775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RYveFcJke8J7DG6alghsOQTRf06uZOYGEp13Kj5Xkq0=;
  b=VG8CBzfaRJQh5swoBhB/UJw4YwNjYHbmxSe/4PMJw1wDH8mUKHpTmGLj
   bWURkhIc95ie/qrcqLkgFrx73TXhX0lcJV9CpAi03bhdFQBmTqTn+PNNl
   bMeuxt9aF/cEnsC5+TKWmDiv4w1oTMlpp9W6YQPMYW/gBBgojStXdP8vy
   rPib5jJL2a5rAgl60wlQQ1fwp55GkqTCvWnnhodm5zYOkHpbuqKnSH95C
   R0sM6ifdErGb6kjb/XxgBe2alxf1sajCB57oek2oBRMMugUUSelaZy3hc
   g+DM4HgWooS35BsPCjqGhmFOzQijUysrGUMrKGNRNB9RwKigMrubYzvH5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="14959213"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="14959213"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 15:42:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="860367329"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="860367329"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Nov 2023 15:42:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8qgE-0002oz-1Q;
	Thu, 30 Nov 2023 23:42:50 +0000
Date: Fri, 1 Dec 2023 07:42:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_b2_v2 76/82]
 drivers/irqchip/irq-riscv-aplic-main.c:191:1: sparse: sparse: symbol
 'aplic_list' was not declared. Should it be static?
Message-ID: <202312010700.Yo4WKEe8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v2
head:   c8ded8b0d4632bdf521e8cfce564c604232c99ff
commit: 3d61a13c3c17d2d0e672496e3a3c0997cbe91458 [76/82] irqchip: riscv-aplic: Add ACPI support
config: riscv-randconfig-r111-20231130 (https://download.01.org/0day-ci/archive/20231201/202312010700.Yo4WKEe8-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312010700.Yo4WKEe8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312010700.Yo4WKEe8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
>> drivers/irqchip/irq-riscv-aplic-main.c:191:1: sparse: sparse: symbol 'aplic_list' was not declared. Should it be static?
   drivers/irqchip/irq-riscv-aplic-main.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   drivers/irqchip/irq-riscv-aplic-main.c: note: in included file (through include/linux/resource_ext.h, include/linux/acpi.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/aplic_list +191 drivers/irqchip/irq-riscv-aplic-main.c

   190	
 > 191	LIST_HEAD(aplic_list);
   192	struct aplic_priv_list {
   193		struct aplic_priv *priv;
   194		struct list_head list;
   195	};
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
