Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3475205509
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 10:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736506127; cv=none; b=LhK2O9RjoXiFJVYggG21EzpJ5N/AipUnlvxvbwCkAjWXXt9Q5d1WJjoj3q10NEdCo5+Y0YHyMQK8egvk+39qunP6F/kK05jJ3r2sbN/Q0dxmz6CO+Vr0s56r7eGjaLxTnZGvQWT24NHEbPqzqaBCst8TB5VGK9oC8NAvzWLYBSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736506127; c=relaxed/simple;
	bh=0qBr/gK0J6ceo8sUSBWIxxB7Hy6+PGUs/65kpLVi224=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gppu2+xzUFsHbRMrQgMoUOp8D3o0bDLVv9pnjMjZxFCayz2t8cKDGWtei0NzS3JJoJpVt4GR7yvSTIwhP6CeS0iibfitkJLwVkm4kiaE1JrPwXnRbccNm2jVN45nCkV0NPLAv6gfvae830mTTJ2csCBL+mrq3ICwfk5k+77m9j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8UjTHxs; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8UjTHxs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736506125; x=1768042125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0qBr/gK0J6ceo8sUSBWIxxB7Hy6+PGUs/65kpLVi224=;
  b=m8UjTHxsfzc/oXPHzryTXJg5pOGtnH7OMJGrtwdohsTt2ACVP41dcZ99
   dxa7nQ/hguabVDICpJ9Qazm6y399NgIFbhfOlMF1vsE0SxuVl329JK/8O
   7YSYJ8jNUR1IreZdTbo6UvcinuqDXzqnwGG8V8WsOY5SKF9DNhb8aJyTP
   jhU6kmoe94fi5+ETk8C+ba2bGKtw5ne+FTiq12AZzoW1OQ8Vmdr7veIHu
   RjdlE03Z3sQFAhnD3nrG9PvFdzMI05JJ3XzZi3MRw4/LucNu5rtgMht8e
   mOPtO7a/7ULL0o3sCP7uj4RItiKXOO1XBJjeadFZ4bQipW7t5vtBTjRWq
   w==;
X-CSE-ConnectionGUID: nO/fGcL2QxW84JYV9Ajuug==
X-CSE-MsgGUID: krf8YeAAQrKTLU5t8Ir1Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36012688"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36012688"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 02:48:44 -0800
X-CSE-ConnectionGUID: hzgQ/tYzS7+hzUH5dj5/uw==
X-CSE-MsgGUID: wCdnGLrhQTy/QkmczhTVsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="103489450"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Jan 2025 02:48:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWCZE-000J4W-2U;
	Fri, 10 Jan 2025 10:48:40 +0000
Date: Fri, 10 Jan 2025 18:47:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1817/1817]
 drivers/irqchip/irq-loongson-eiointc.c:199:13: warning: unused variable
 'cores'
Message-ID: <202501101806.25f5zC4M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   628e30bc9a3c48a6ab38868cb77fc6497d6ebaa5
commit: c0d9a87efd7845c763e936a5bd9c482c62f8ceb4 [1817/1817] LoongArch: eiointc: fix ext irq route error
config: loongarch-randconfig-001-20250110 (https://download.01.org/0day-ci/archive/20250110/202501101806.25f5zC4M-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101806.25f5zC4M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101806.25f5zC4M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-loongson-eiointc.c: In function 'eiointc_router_init':
>> drivers/irqchip/irq-loongson-eiointc.c:199:13: warning: unused variable 'cores' [-Wunused-variable]
     199 |         int cores = (cpu_has_hypervisor ? MAX_CORES_PER_EIO_NODE : CORES_PER_EIO_NODE);
         |             ^~~~~
   drivers/irqchip/irq-loongson-eiointc.c: At top level:
   drivers/irqchip/irq-loongson-eiointc.c:380:12: warning: no previous prototype for 'pch_pic_parse_madt' [-Wmissing-prototypes]
     380 | int __init pch_pic_parse_madt(union acpi_subtable_headers *header,
         |            ^~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-loongson-eiointc.c:393:12: warning: no previous prototype for 'pch_msi_parse_madt' [-Wmissing-prototypes]
     393 | int __init pch_msi_parse_madt(union acpi_subtable_headers *header,
         |            ^~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-loongson-eiointc.c: In function 'pch_msi_parse_madt':
   drivers/irqchip/irq-loongson-eiointc.c:401:58: error: 'NODES_PER_FLATMODE_NODE' undeclared (first use in this function)
     401 |                 node = eiointc_priv[nr_pics - 1]->node / NODES_PER_FLATMODE_NODE;
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-loongson-eiointc.c:401:58: note: each undeclared identifier is reported only once for each function it appears in
   drivers/irqchip/irq-loongson-eiointc.c: In function 'eiointc_acpi_init':
   drivers/irqchip/irq-loongson-eiointc.c:507:45: error: 'NODES_PER_FLATMODE_NODE' undeclared (first use in this function)
     507 |                 node = acpi_eiointc->node / NODES_PER_FLATMODE_NODE;
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/cores +199 drivers/irqchip/irq-loongson-eiointc.c

dd281e1a1a937e Huacai Chen   2022-07-20  192  
dd281e1a1a937e Huacai Chen   2022-07-20  193  static int eiointc_router_init(unsigned int cpu)
dd281e1a1a937e Huacai Chen   2022-07-20  194  {
dd281e1a1a937e Huacai Chen   2022-07-20  195  	int i, bit;
dd281e1a1a937e Huacai Chen   2022-07-20  196  	uint32_t data;
dd281e1a1a937e Huacai Chen   2022-07-20  197  	uint32_t node = cpu_to_eio_node(cpu);
2e99b73afde188 Bibo Mao      2023-08-11  198  	int index = eiointc_index(node);
6379cda0d97b5b liuyun        2023-12-02 @199  	int cores = (cpu_has_hypervisor ? MAX_CORES_PER_EIO_NODE : CORES_PER_EIO_NODE);
dd281e1a1a937e Huacai Chen   2022-07-20  200  
dd281e1a1a937e Huacai Chen   2022-07-20  201  	if (index < 0) {
dd281e1a1a937e Huacai Chen   2022-07-20  202  		pr_err("Error: invalid nodemap!\n");
dd281e1a1a937e Huacai Chen   2022-07-20  203  		return -1;
dd281e1a1a937e Huacai Chen   2022-07-20  204  	}
dd281e1a1a937e Huacai Chen   2022-07-20  205  
c0d9a87efd7845 wanghongliang 2025-01-07  206  	if (!test_bit(node, (&extioi_node_maps)->bits)) {
dd281e1a1a937e Huacai Chen   2022-07-20  207  		eiointc_enable();
dd281e1a1a937e Huacai Chen   2022-07-20  208  
a3f1132c4c6be3 Binbin Zhou   2023-05-05  209  		for (i = 0; i < eiointc_priv[0]->vec_count / 32; i++) {
dd281e1a1a937e Huacai Chen   2022-07-20  210  			data = (((1 << (i * 2 + 1)) << 16) | (1 << (i * 2)));
dd281e1a1a937e Huacai Chen   2022-07-20  211  			iocsr_write32(data, EIOINTC_REG_NODEMAP + i * 4);
dd281e1a1a937e Huacai Chen   2022-07-20  212  		}
dd281e1a1a937e Huacai Chen   2022-07-20  213  
a3f1132c4c6be3 Binbin Zhou   2023-05-05  214  		for (i = 0; i < eiointc_priv[0]->vec_count / 32 / 4; i++) {
dd281e1a1a937e Huacai Chen   2022-07-20  215  			bit = BIT(1 + index); /* Route to IP[1 + index] */
dd281e1a1a937e Huacai Chen   2022-07-20  216  			data = bit | (bit << 8) | (bit << 16) | (bit << 24);
dd281e1a1a937e Huacai Chen   2022-07-20  217  			iocsr_write32(data, EIOINTC_REG_IPMAP + i * 4);
dd281e1a1a937e Huacai Chen   2022-07-20  218  		}
dd281e1a1a937e Huacai Chen   2022-07-20  219  
a3f1132c4c6be3 Binbin Zhou   2023-05-05  220  		for (i = 0; i < eiointc_priv[0]->vec_count / 4; i++) {
dd281e1a1a937e Huacai Chen   2022-07-20  221  			/* Route to Node-0 Core-0 */
5d97cff72f91f4 Bibo Mao      2024-03-13  222  			if (eiointc_priv[index]->cpu_encoded)
5d97cff72f91f4 Bibo Mao      2024-03-13  223  				bit = cpu_logical_map(0);
5d97cff72f91f4 Bibo Mao      2024-03-13  224  			else if (index == 0)
5d97cff72f91f4 Bibo Mao      2024-03-13  225  				bit = BIT(cpu_logical_map(0));
dd281e1a1a937e Huacai Chen   2022-07-20  226  			else
c0d9a87efd7845 wanghongliang 2025-01-07  227  				bit = (eiointc_priv[index]->node << 4) |
c0d9a87efd7845 wanghongliang 2025-01-07  228  				BIT(cpu_logical_map(smp_processor_id()) %
c0d9a87efd7845 wanghongliang 2025-01-07  229  						CORES_PER_EIO_NODE);
dd281e1a1a937e Huacai Chen   2022-07-20  230  
dd281e1a1a937e Huacai Chen   2022-07-20  231  			data = bit | (bit << 8) | (bit << 16) | (bit << 24);
dd281e1a1a937e Huacai Chen   2022-07-20  232  			iocsr_write32(data, EIOINTC_REG_ROUTE + i * 4);
dd281e1a1a937e Huacai Chen   2022-07-20  233  		}
dd281e1a1a937e Huacai Chen   2022-07-20  234  
a3f1132c4c6be3 Binbin Zhou   2023-05-05  235  		for (i = 0; i < eiointc_priv[0]->vec_count / 32; i++) {
dd281e1a1a937e Huacai Chen   2022-07-20  236  			data = 0xffffffff;
dd281e1a1a937e Huacai Chen   2022-07-20  237  			iocsr_write32(data, EIOINTC_REG_ENABLE + i * 4);
c0d9a87efd7845 wanghongliang 2025-01-07  238  			iocsr_write32(0, EIOINTC_REG_BOUNCE + i * 4);
dd281e1a1a937e Huacai Chen   2022-07-20  239  		}
c0d9a87efd7845 wanghongliang 2025-01-07  240  
c0d9a87efd7845 wanghongliang 2025-01-07  241  		set_bit(node, (&extioi_node_maps)->bits);
dd281e1a1a937e Huacai Chen   2022-07-20  242  	}
dd281e1a1a937e Huacai Chen   2022-07-20  243  
dd281e1a1a937e Huacai Chen   2022-07-20  244  	return 0;
dd281e1a1a937e Huacai Chen   2022-07-20  245  }
dd281e1a1a937e Huacai Chen   2022-07-20  246  

:::::: The code at line 199 was first introduced by commit
:::::: 6379cda0d97b5b38da0c1599b57ab764fb307cc2 LoongArch: Fix virtual machine startup error

:::::: TO: liuyun <liuyun@loongson.cn>
:::::: CC: Hongchen Zhang <zhanghongchen@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
