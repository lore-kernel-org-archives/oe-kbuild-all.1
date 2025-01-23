Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651C71C4A13
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 20:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737665842; cv=none; b=nZ9DwFpY2F9odPAxEnhaAA6/NbRfH0mxTeDxTXpBgR2zrYfluTL90ahqPgmHOC7SQBm8iLxRKPePBXVYG8KKeuTR8msDxdYPZxYFvkWRnZDQuFmCruem9/UQYZOkUJdZ6EJLbX7bthEL9EbH/8eppX7BBjyh1r0RrpcdKe5hOSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737665842; c=relaxed/simple;
	bh=awjyiKR9SlIe/CRWOEAYakjgW2Q61DOp0SExDezmzG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=stFT0+upHqaAN6f9P9sweL2fVg2qyIo5wq+0TWsgZnVdv/mmKjFEuiCcdjllrqY5sheQaImEbAJkL50NaMYNBai4E4ERGJeHDMhQbY6Qua2OGwhxmZ7upMyLmmVPpTmgB6RkPJie+gr4QLrnFiA4K9cy/PFj0KPGBEwn4wG0qWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bxdC+3Am; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bxdC+3Am"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737665841; x=1769201841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=awjyiKR9SlIe/CRWOEAYakjgW2Q61DOp0SExDezmzG8=;
  b=bxdC+3AmOlKXEGeILw6eVS8UsdbW8oWBwVHok+PETDp0NkvvHGJ8adqq
   TYviiGP/WRC6fJFw66kR8CpXbpVDvqn23EUjbSgH6RSLx308F5AISNiBR
   VItzdHD9qRDSpFumjyME7rsYUisd024jdnSpJO1pvhlTmE/KqqGx0qjtb
   mP1rHG5KIBV6hzZgMMRrlzWYIMSJVKKpQztuGrMtTEXM7c8ecyYE4MjHu
   2bcmVq7wGR4tqSXDQGGlSN9Y4EJ2RhnHf9pGj3ZDNH+Xtl9qJYb/9HF3g
   KpAKZRN+cHlCjwtV3V4XvIM4MPepsTYrpnzHoZu/5rG83BIE9gghXzJl+
   w==;
X-CSE-ConnectionGUID: FgBClHD4SxSODcGn0EBFBg==
X-CSE-MsgGUID: dpk222mcSn6IGw7XdrhUWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38079145"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="38079145"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 12:57:17 -0800
X-CSE-ConnectionGUID: fApCkPdgT4ON4M1lfKxNOQ==
X-CSE-MsgGUID: ezPV0NvQSw2WOGgafu48Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="107572637"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Jan 2025 12:57:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb4GH-000bfv-1a;
	Thu, 23 Jan 2025 20:57:13 +0000
Date: Fri, 24 Jan 2025 04:56:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 13/13]
 drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c:310:24: error:
 returning 'int' from a function with return type 'struct mtk_apu_hw_logger
 *' makes pointer from integer without a cast
Message-ID: <202501240446.RZdCv3pp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Karl,

First bad commit (maybe != root cause):

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   a7b2af4c530d27adbf7bc6d6a37b8d8b5292278b
commit: 5fd4ae454d3ca9c494223bd40baae0603d17047e [13/13] CHROMIUM: remoteproc: mediatek: Enable APU rproc building
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250124/202501240446.RZdCv3pp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240446.RZdCv3pp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240446.RZdCv3pp-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/remoteproc/mediatek_apusys/mtk_apu_config.c: In function 'mtk_apu_config_setup':
>> drivers/remoteproc/mediatek_apusys/mtk_apu_config.c:120:26: error: assignment to 'uint64_t' {aka 'long long unsigned int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
     120 |         mdla_rv_mem->buf = mdla_buf;
         |                          ^
--
>> drivers/remoteproc/mediatek_apusys/mtk_apu_rproc.c:526:5: warning: no previous prototype for 'mtk_apu_rproc_init' [-Wmissing-prototypes]
     526 | int mtk_apu_rproc_init(void)
         |     ^~~~~~~~~~~~~~~~~~
--
   In file included from drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c:11:
   drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c: In function 'ioread32_atf':
>> drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c:132:66: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     132 |                         dev_err(dev, "Not support addr: 0x%llx", (unsigned long long)addr[i]);
         |                                                                  ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c:132:25: note: in expansion of macro 'dev_err'
     132 |                         dev_err(dev, "Not support addr: 0x%llx", (unsigned long long)addr[i]);
         |                         ^~~~~~~
   drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c: In function 'get_mtk_apu_hw_logger_device':
>> drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c:310:24: error: returning 'int' from a function with return type 'struct mtk_apu_hw_logger *' makes pointer from integer without a cast [-Wint-conversion]
     310 |                 return -EPROBE_DEFER;
         |                        ^
   drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c:313:24: error: returning 'int' from a function with return type 'struct mtk_apu_hw_logger *' makes pointer from integer without a cast [-Wint-conversion]
     313 |                 return -EINVAL;
         |                        ^
--
>> drivers/remoteproc/mediatek_apusys/plat/mt8196_plat.c:105:5: warning: no previous prototype for 'apu_infra_lock' [-Wmissing-prototypes]
     105 | int apu_infra_lock(struct mtk_apu *apu, uint32_t op, enum apu_infra_bit_id id)
         |     ^~~~~~~~~~~~~~


vim +310 drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c

4b17ad382a2a52 Karl Li 2025-01-02  107  
4b17ad382a2a52 Karl Li 2025-01-02  108  static int ioread32_atf(uint8_t op_num, void **addr, uint32_t **ret_val,
4b17ad382a2a52 Karl Li 2025-01-02  109  			struct mtk_apu_hw_logger *hw_logger_data)
4b17ad382a2a52 Karl Li 2025-01-02  110  {
4b17ad382a2a52 Karl Li 2025-01-02  111  	int i, op = 0;
4b17ad382a2a52 Karl Li 2025-01-02  112  	uint8_t smc_op;
4b17ad382a2a52 Karl Li 2025-01-02  113  	struct arm_smccc_res res;
4b17ad382a2a52 Karl Li 2025-01-02  114  	unsigned long flags = 0;
4b17ad382a2a52 Karl Li 2025-01-02  115  	struct device *dev = hw_logger_data->dev;
4b17ad382a2a52 Karl Li 2025-01-02  116  
4b17ad382a2a52 Karl Li 2025-01-02  117  	if (op_num == 0 || op_num > MAX_SMC_OP_NUM) {
4b17ad382a2a52 Karl Li 2025-01-02  118  		dev_err(dev, "op_num invalid: %d\n", op_num);
4b17ad382a2a52 Karl Li 2025-01-02  119  		return -EINVAL;
4b17ad382a2a52 Karl Li 2025-01-02  120  	}
4b17ad382a2a52 Karl Li 2025-01-02  121  
4b17ad382a2a52 Karl Li 2025-01-02  122  	for (i = 0; i < op_num; i++) {
4b17ad382a2a52 Karl Li 2025-01-02  123  		if (addr[i] == hw_logger_data->apu_logtop + APU_LOG_BUF_T_SIZE_OFF)
4b17ad382a2a52 Karl Li 2025-01-02  124  			smc_op = SMC_OP_APU_LOG_BUF_T_SIZE;
4b17ad382a2a52 Karl Li 2025-01-02  125  		else if (addr[i] == hw_logger_data->apu_logtop + APU_LOG_BUF_W_PTR_OFF)
4b17ad382a2a52 Karl Li 2025-01-02  126  			smc_op = SMC_OP_APU_LOG_BUF_W_PTR;
4b17ad382a2a52 Karl Li 2025-01-02  127  		else if (addr[i] == hw_logger_data->apu_logtop + APU_LOG_BUF_R_PTR_OFF)
4b17ad382a2a52 Karl Li 2025-01-02  128  			smc_op = SMC_OP_APU_LOG_BUF_R_PTR;
4b17ad382a2a52 Karl Li 2025-01-02  129  		else if (addr[i] == hw_logger_data->apu_logtop + APU_LOGTOP_CON_OFF)
4b17ad382a2a52 Karl Li 2025-01-02  130  			smc_op = SMC_OP_APU_LOG_BUF_CON;
4b17ad382a2a52 Karl Li 2025-01-02  131  		else {
4b17ad382a2a52 Karl Li 2025-01-02 @132  			dev_err(dev, "Not support addr: 0x%llx", (unsigned long long)addr[i]);
4b17ad382a2a52 Karl Li 2025-01-02  133  			return -EINVAL;
4b17ad382a2a52 Karl Li 2025-01-02  134  		}
4b17ad382a2a52 Karl Li 2025-01-02  135  		op |= smc_op << (8 * i);
4b17ad382a2a52 Karl Li 2025-01-02  136  	}
4b17ad382a2a52 Karl Li 2025-01-02  137  	dev_dbg(dev, "arm_smccc_smc reg_dump op: 0x%08x\n", op);
4b17ad382a2a52 Karl Li 2025-01-02  138  
4b17ad382a2a52 Karl Li 2025-01-02  139  	spin_lock_irqsave(&hw_logger_data->smc_spinlock, flags);
4b17ad382a2a52 Karl Li 2025-01-02  140  	arm_smccc_smc(MTK_SIP_APUSYS_CONTROL,
4b17ad382a2a52 Karl Li 2025-01-02  141  		MTK_APUSYS_KERNEL_OP_APUSYS_LOGTOP_REG_DUMP,
4b17ad382a2a52 Karl Li 2025-01-02  142  		op, 0, 0, 0, 0, 0, &res);
4b17ad382a2a52 Karl Li 2025-01-02  143  	spin_unlock_irqrestore(&hw_logger_data->smc_spinlock, flags);
4b17ad382a2a52 Karl Li 2025-01-02  144  
4b17ad382a2a52 Karl Li 2025-01-02  145  	if (res.a0 != 0) {
4b17ad382a2a52 Karl Li 2025-01-02  146  		if (res.a0 == -16) {
4b17ad382a2a52 Karl Li 2025-01-02  147  			dev_dbg(dev, "arm_smccc_smc reg_dump acquire rcx sema timeout (rcx off)\n");
4b17ad382a2a52 Karl Li 2025-01-02  148  		} else {
4b17ad382a2a52 Karl Li 2025-01-02  149  			dev_err(dev, "arm_smccc_smc reg_dump error ret: 0x%lx\n", res.a0);
4b17ad382a2a52 Karl Li 2025-01-02  150  			dev_err(dev, "arm_smccc_smc reg_dump op: 0x%08x\n", op);
4b17ad382a2a52 Karl Li 2025-01-02  151  			dev_err(dev, "arm_smccc_smc reg_dump a0 a1 a2 a3 / 0x%lx 0x%lx 0x%lx 0x%lx\n",
4b17ad382a2a52 Karl Li 2025-01-02  152  				res.a0, res.a1, res.a2, res.a3);
4b17ad382a2a52 Karl Li 2025-01-02  153  		}
4b17ad382a2a52 Karl Li 2025-01-02  154  		return res.a0;
4b17ad382a2a52 Karl Li 2025-01-02  155  	}
4b17ad382a2a52 Karl Li 2025-01-02  156  
4b17ad382a2a52 Karl Li 2025-01-02  157  	*ret_val[0] = res.a1;
4b17ad382a2a52 Karl Li 2025-01-02  158  	if (op_num > 1)
4b17ad382a2a52 Karl Li 2025-01-02  159  		*ret_val[1] = res.a2;
4b17ad382a2a52 Karl Li 2025-01-02  160  	if (op_num > 2)
4b17ad382a2a52 Karl Li 2025-01-02  161  		*ret_val[2] = res.a3;
4b17ad382a2a52 Karl Li 2025-01-02  162  
4b17ad382a2a52 Karl Li 2025-01-02  163  	return 0;
4b17ad382a2a52 Karl Li 2025-01-02  164  }
4b17ad382a2a52 Karl Li 2025-01-02  165  
4b17ad382a2a52 Karl Li 2025-01-02  166  static int iowrite32_atf(uint32_t write_val, void *addr, struct mtk_apu_hw_logger *hw_logger_data)
4b17ad382a2a52 Karl Li 2025-01-02  167  {
4b17ad382a2a52 Karl Li 2025-01-02  168  	int op;
4b17ad382a2a52 Karl Li 2025-01-02  169  	struct arm_smccc_res res;
4b17ad382a2a52 Karl Li 2025-01-02  170  	unsigned long flags = 0;
4b17ad382a2a52 Karl Li 2025-01-02  171  	struct device *dev = hw_logger_data->dev;
4b17ad382a2a52 Karl Li 2025-01-02  172  
4b17ad382a2a52 Karl Li 2025-01-02  173  	if (addr == hw_logger_data->apu_logtop + APU_LOG_BUF_R_PTR_OFF) {
4b17ad382a2a52 Karl Li 2025-01-02  174  		op = SMC_OP_APU_LOG_BUF_R_PTR;
4b17ad382a2a52 Karl Li 2025-01-02  175  	} else {
4b17ad382a2a52 Karl Li 2025-01-02  176  		dev_err(dev, "Not support addr: %p", addr);
4b17ad382a2a52 Karl Li 2025-01-02  177  		return -EINVAL;
4b17ad382a2a52 Karl Li 2025-01-02  178  	}
4b17ad382a2a52 Karl Li 2025-01-02  179  
4b17ad382a2a52 Karl Li 2025-01-02  180  	spin_lock_irqsave(&hw_logger_data->smc_spinlock, flags);
4b17ad382a2a52 Karl Li 2025-01-02  181  	arm_smccc_smc(MTK_SIP_APUSYS_CONTROL, MTK_APUSYS_KERNEL_OP_APUSYS_LOGTOP_REG_WRITE,
4b17ad382a2a52 Karl Li 2025-01-02  182  		      op, write_val, 0, 0, 0, 0, &res);
4b17ad382a2a52 Karl Li 2025-01-02  183  	spin_unlock_irqrestore(&hw_logger_data->smc_spinlock, flags);
4b17ad382a2a52 Karl Li 2025-01-02  184  
4b17ad382a2a52 Karl Li 2025-01-02  185  	if (res.a0 != 0) {
4b17ad382a2a52 Karl Li 2025-01-02  186  		if (res.a0 == -16) {
4b17ad382a2a52 Karl Li 2025-01-02  187  			dev_info(dev, "arm_smccc_smc reg_write acquire rcx sema timeout (rcx off)\n");
4b17ad382a2a52 Karl Li 2025-01-02  188  		} else {
4b17ad382a2a52 Karl Li 2025-01-02  189  			dev_err(dev, "arm_smccc_smc reg_write error! ret = 0x%lx, a1 = 0x%lx",
4b17ad382a2a52 Karl Li 2025-01-02  190  				res.a0, res.a1);
4b17ad382a2a52 Karl Li 2025-01-02  191  			dev_err(dev, "arm_smccc_smc reg_write op val / 0x%x 0x%x\n", op, write_val);
4b17ad382a2a52 Karl Li 2025-01-02  192  		}
4b17ad382a2a52 Karl Li 2025-01-02  193  		return res.a0;
4b17ad382a2a52 Karl Li 2025-01-02  194  	}
4b17ad382a2a52 Karl Li 2025-01-02  195  
4b17ad382a2a52 Karl Li 2025-01-02  196  	return 0;
4b17ad382a2a52 Karl Li 2025-01-02  197  }
4b17ad382a2a52 Karl Li 2025-01-02  198  
4b17ad382a2a52 Karl Li 2025-01-02  199  static int w1c32_atf(void *addr, uint32_t *ret_val, struct mtk_apu_hw_logger *hw_logger_data)
4b17ad382a2a52 Karl Li 2025-01-02  200  {
4b17ad382a2a52 Karl Li 2025-01-02  201  	int op;
4b17ad382a2a52 Karl Li 2025-01-02  202  	struct arm_smccc_res res;
4b17ad382a2a52 Karl Li 2025-01-02  203  	unsigned long flags = 0;
4b17ad382a2a52 Karl Li 2025-01-02  204  	struct device *dev = hw_logger_data->dev;
4b17ad382a2a52 Karl Li 2025-01-02  205  
4b17ad382a2a52 Karl Li 2025-01-02  206  	if (addr == hw_logger_data->apu_logtop + APU_LOGTOP_CON_OFF) {
4b17ad382a2a52 Karl Li 2025-01-02  207  		op = SMC_OP_APU_LOG_BUF_CON;
4b17ad382a2a52 Karl Li 2025-01-02  208  	} else {
4b17ad382a2a52 Karl Li 2025-01-02  209  		dev_err(dev, "Not support addr: %p", addr);
4b17ad382a2a52 Karl Li 2025-01-02  210  		return -EINVAL;
4b17ad382a2a52 Karl Li 2025-01-02  211  	}
4b17ad382a2a52 Karl Li 2025-01-02  212  
4b17ad382a2a52 Karl Li 2025-01-02  213  	spin_lock_irqsave(&hw_logger_data->smc_spinlock, flags);
4b17ad382a2a52 Karl Li 2025-01-02  214  	arm_smccc_smc(MTK_SIP_APUSYS_CONTROL,
4b17ad382a2a52 Karl Li 2025-01-02  215  		MTK_APUSYS_KERNEL_OP_APUSYS_LOGTOP_REG_W1C,
4b17ad382a2a52 Karl Li 2025-01-02  216  		op, 0, 0, 0, 0, 0, &res);
4b17ad382a2a52 Karl Li 2025-01-02  217  	spin_unlock_irqrestore(&hw_logger_data->smc_spinlock, flags);
4b17ad382a2a52 Karl Li 2025-01-02  218  
4b17ad382a2a52 Karl Li 2025-01-02  219  	if (res.a0 != 0) {
4b17ad382a2a52 Karl Li 2025-01-02  220  		if (res.a0 == -16) {
4b17ad382a2a52 Karl Li 2025-01-02  221  			dev_info(dev, "arm_smccc_smc reg_w1c acquire rcx sema timeout (rcx off)\n");
4b17ad382a2a52 Karl Li 2025-01-02  222  		} else {
4b17ad382a2a52 Karl Li 2025-01-02  223  			dev_err(dev, "arm_smccc_smc reg_w1c error! ret = 0x%lx, a1 = 0x%lx",
4b17ad382a2a52 Karl Li 2025-01-02  224  				res.a0, res.a1);
4b17ad382a2a52 Karl Li 2025-01-02  225  			dev_err(dev, "arm_smccc_smc reg_w1c op / 0x%x\n", op);
4b17ad382a2a52 Karl Li 2025-01-02  226  		}
4b17ad382a2a52 Karl Li 2025-01-02  227  		return res.a0;
4b17ad382a2a52 Karl Li 2025-01-02  228  	}
4b17ad382a2a52 Karl Li 2025-01-02  229  
4b17ad382a2a52 Karl Li 2025-01-02  230  	*ret_val = res.a1;
4b17ad382a2a52 Karl Li 2025-01-02  231  	return 0;
4b17ad382a2a52 Karl Li 2025-01-02  232  }
4b17ad382a2a52 Karl Li 2025-01-02  233  
4b17ad382a2a52 Karl Li 2025-01-02  234  static unsigned long long get_st_addr(struct mtk_apu_hw_logger *hw_logger_data)
4b17ad382a2a52 Karl Li 2025-01-02  235  {
4b17ad382a2a52 Karl Li 2025-01-02  236  	return (unsigned long long) hw_logger_data->hw_log_buf.hw_log_buf_dma_addr;
4b17ad382a2a52 Karl Li 2025-01-02  237  }
4b17ad382a2a52 Karl Li 2025-01-02  238  
4b17ad382a2a52 Karl Li 2025-01-02  239  static unsigned int get_t_size(void)
4b17ad382a2a52 Karl Li 2025-01-02  240  {
4b17ad382a2a52 Karl Li 2025-01-02  241  	return HWLOG_LOG_SIZE;
4b17ad382a2a52 Karl Li 2025-01-02  242  }
4b17ad382a2a52 Karl Li 2025-01-02  243  
4b17ad382a2a52 Karl Li 2025-01-02  244  static int get_r_w_ptr(unsigned long long *r_ptr, unsigned long long *w_ptr,
4b17ad382a2a52 Karl Li 2025-01-02  245  		       struct mtk_apu_hw_logger *hw_logger_data)
4b17ad382a2a52 Karl Li 2025-01-02  246  {
4b17ad382a2a52 Karl Li 2025-01-02  247  	int ret = 0;
4b17ad382a2a52 Karl Li 2025-01-02  248  	uint32_t r_ptr_reg = 0, w_ptr_reg = 0;
4b17ad382a2a52 Karl Li 2025-01-02  249  
4b17ad382a2a52 Karl Li 2025-01-02  250  	ret = ioread32_atf(2,
4b17ad382a2a52 Karl Li 2025-01-02  251  		(void*[]){hw_logger_data->apu_logtop + APU_LOG_BUF_R_PTR_OFF,
4b17ad382a2a52 Karl Li 2025-01-02  252  			  hw_logger_data->apu_logtop + APU_LOG_BUF_W_PTR_OFF},
4b17ad382a2a52 Karl Li 2025-01-02  253  		(uint32_t*[]){&r_ptr_reg, &w_ptr_reg}, hw_logger_data
4b17ad382a2a52 Karl Li 2025-01-02  254  	);
4b17ad382a2a52 Karl Li 2025-01-02  255  	if (ret)
4b17ad382a2a52 Karl Li 2025-01-02  256  		goto out;
4b17ad382a2a52 Karl Li 2025-01-02  257  
4b17ad382a2a52 Karl Li 2025-01-02  258  	/* hw log w/r_ptr is a 34bit addr but store in a 32bit feild */
4b17ad382a2a52 Karl Li 2025-01-02  259  	if (r_ptr != NULL)
4b17ad382a2a52 Karl Li 2025-01-02  260  		*r_ptr = (unsigned long long)r_ptr_reg << 2;
4b17ad382a2a52 Karl Li 2025-01-02  261  	if (w_ptr != NULL)
4b17ad382a2a52 Karl Li 2025-01-02  262  		*w_ptr = (unsigned long long)w_ptr_reg << 2;
4b17ad382a2a52 Karl Li 2025-01-02  263  
4b17ad382a2a52 Karl Li 2025-01-02  264  out:
4b17ad382a2a52 Karl Li 2025-01-02  265  	return ret;
4b17ad382a2a52 Karl Li 2025-01-02  266  }
4b17ad382a2a52 Karl Li 2025-01-02  267  
4b17ad382a2a52 Karl Li 2025-01-02  268  static void set_r_ptr(unsigned long long r_ptr, struct mtk_apu_hw_logger *hw_logger_data)
4b17ad382a2a52 Karl Li 2025-01-02  269  {
4b17ad382a2a52 Karl Li 2025-01-02  270  	int ret = 0;
4b17ad382a2a52 Karl Li 2025-01-02  271  
4b17ad382a2a52 Karl Li 2025-01-02  272  	ret = iowrite32_atf(lower_32_bits(r_ptr >> 2),
4b17ad382a2a52 Karl Li 2025-01-02  273  			    hw_logger_data->apu_logtop + APU_LOG_BUF_R_PTR_OFF,
4b17ad382a2a52 Karl Li 2025-01-02  274  			    hw_logger_data);
4b17ad382a2a52 Karl Li 2025-01-02  275  	if (ret < 0)
4b17ad382a2a52 Karl Li 2025-01-02  276  		dev_dbg(hw_logger_data->dev, "iowrite32_atf failed\n");
4b17ad382a2a52 Karl Li 2025-01-02  277  }
4b17ad382a2a52 Karl Li 2025-01-02  278  
4b17ad382a2a52 Karl Li 2025-01-02  279  static void store_r_ofs(unsigned int pwr_status, unsigned int r_ofs,
4b17ad382a2a52 Karl Li 2025-01-02  280  			struct mtk_apu_hw_logger *hw_logger_data)
4b17ad382a2a52 Karl Li 2025-01-02  281  {
4b17ad382a2a52 Karl Li 2025-01-02  282  	int ret;
4b17ad382a2a52 Karl Li 2025-01-02  283  
4b17ad382a2a52 Karl Li 2025-01-02  284  	/* set read pointer */
4b17ad382a2a52 Karl Li 2025-01-02  285  	if (pwr_status != 0) {
4b17ad382a2a52 Karl Li 2025-01-02  286  		dev_dbg(hw_logger_data->dev, "set_r_ptr r_ofs = 0x%x\n", r_ofs);
4b17ad382a2a52 Karl Li 2025-01-02  287  		set_r_ptr(get_st_addr(hw_logger_data) + r_ofs, hw_logger_data);
4b17ad382a2a52 Karl Li 2025-01-02  288  	}
4b17ad382a2a52 Karl Li 2025-01-02  289  
4b17ad382a2a52 Karl Li 2025-01-02  290  	dev_dbg(hw_logger_data->dev, "set_r_ofs_mbox r_ofs = 0x%x\n", r_ofs);
4b17ad382a2a52 Karl Li 2025-01-02  291  	ret = regmap_field_write(hw_logger_data->log_read_regmap_field, r_ofs);
4b17ad382a2a52 Karl Li 2025-01-02  292  	if (ret)
4b17ad382a2a52 Karl Li 2025-01-02  293  		dev_err(hw_logger_data->dev, "failed to set r_ofs\n");
4b17ad382a2a52 Karl Li 2025-01-02  294  }
4b17ad382a2a52 Karl Li 2025-01-02  295  
4b17ad382a2a52 Karl Li 2025-01-02  296  static struct platform_driver hw_logger_driver;
4b17ad382a2a52 Karl Li 2025-01-02  297  struct mtk_apu_hw_logger *get_mtk_apu_hw_logger_device(struct device_node *hw_logger_np)
4b17ad382a2a52 Karl Li 2025-01-02  298  {
4b17ad382a2a52 Karl Li 2025-01-02  299  	struct platform_device *pdev;
4b17ad382a2a52 Karl Li 2025-01-02  300  	struct device *dev;
4b17ad382a2a52 Karl Li 2025-01-02  301  	struct mtk_apu_hw_logger *hw_logger_data;
4b17ad382a2a52 Karl Li 2025-01-02  302  
4b17ad382a2a52 Karl Li 2025-01-02  303  	pdev = of_find_device_by_node(hw_logger_np);
4b17ad382a2a52 Karl Li 2025-01-02  304  	if (!pdev)
4b17ad382a2a52 Karl Li 2025-01-02  305  		return ERR_PTR(-ENODEV);
4b17ad382a2a52 Karl Li 2025-01-02  306  
4b17ad382a2a52 Karl Li 2025-01-02  307  	dev = &pdev->dev;
4b17ad382a2a52 Karl Li 2025-01-02  308  
4b17ad382a2a52 Karl Li 2025-01-02  309  	if (!dev->driver)
4b17ad382a2a52 Karl Li 2025-01-02 @310  		return -EPROBE_DEFER;
4b17ad382a2a52 Karl Li 2025-01-02  311  
4b17ad382a2a52 Karl Li 2025-01-02  312  	if (dev->driver != &hw_logger_driver.driver)
4b17ad382a2a52 Karl Li 2025-01-02  313  		return -EINVAL;
4b17ad382a2a52 Karl Li 2025-01-02  314  
4b17ad382a2a52 Karl Li 2025-01-02  315  	hw_logger_data = dev_get_drvdata(dev);
4b17ad382a2a52 Karl Li 2025-01-02  316  	put_device(dev);
4b17ad382a2a52 Karl Li 2025-01-02  317  
4b17ad382a2a52 Karl Li 2025-01-02  318  	return hw_logger_data;
4b17ad382a2a52 Karl Li 2025-01-02  319  }
4b17ad382a2a52 Karl Li 2025-01-02  320  

:::::: The code at line 310 was first introduced by commit
:::::: 4b17ad382a2a52d9c67892b55fedff14b390bea3 CHROMIUM: remoteproc: mediatek: Add APU hw_logger

:::::: TO: Karl Li <karl.li@mediatek.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
