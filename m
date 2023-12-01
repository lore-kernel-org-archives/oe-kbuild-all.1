Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB2717CF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Dec 2023 02:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRH8wXPy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701397322; x=1732933322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gaKFmMi+hSepL+mtCcQ7p1Y5bl4MHooWjRnrh/jQ8/U=;
  b=TRH8wXPyjnpndS7jxWG8zmehvDA6RSqRtxtZYzGSTqPkOokdBLXK+e7U
   kO1KTuH9auTlgV5367jkV3hVDtztH0+VlpWtyXuJjWvHG5VdjzMxhq0jn
   geY6rw42PRbjBwK/nzpEDT394bcgmfKCXdbngnINPosRm2pjXG/TI74z4
   BlU0glMoZZVEA4EgUYiZC8zxmjoGfYYA4Y2qOGGTQ0SgmMY0guqDl/g3l
   FHn73B71vtn0ehn6Z1/AxLXoX47RB8Kqz9Qab5oSKCHU8cVJyYaGjH8mf
   dcOKvmKm6cJV+IVZ+JKBS5F82m8WVND16/28DT2EdoXv6v84/CaubKA9f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="396229959"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="396229959"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 18:20:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="1016860240"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="1016860240"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 30 Nov 2023 18:20:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8t8I-0002xc-1v;
	Fri, 01 Dec 2023 02:19:59 +0000
Date: Fri, 1 Dec 2023 10:19:05 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Haibo Xu <haibo1.xu@intel.com>
Subject: [avpatel:riscv_acpi_b2_v2 77/82]
 drivers/irqchip/irq-sifive-plic.c:503:1: sparse: sparse: symbol 'plic_list'
 was not declared. Should it be static?
Message-ID: <202312011043.CuPmDevu-lkp@intel.com>
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
commit: 7f8c66ef2c056fa45776adbee359175697410a11 [77/82] irqchip: irq-sifive-plic: Add ACPI support
config: riscv-randconfig-r111-20231130 (https://download.01.org/0day-ci/archive/20231201/202312011043.CuPmDevu-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312011043.CuPmDevu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312011043.CuPmDevu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
>> drivers/irqchip/irq-sifive-plic.c:503:1: sparse: sparse: symbol 'plic_list' was not declared. Should it be static?
   drivers/irqchip/irq-sifive-plic.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   drivers/irqchip/irq-sifive-plic.c: note: in included file (through include/linux/resource_ext.h, include/linux/acpi.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/plic_list +503 drivers/irqchip/irq-sifive-plic.c

   502	
 > 503	LIST_HEAD(plic_list);
   504	struct plic_priv_list {
   505		struct plic_priv *priv;
   506		struct list_head list;
   507	};
   508	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
