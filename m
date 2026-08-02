Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A2F35A387
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Aug 2026 09:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785664506; cv=none; b=bbguMFDBBVvmnW7G+8yy9rmvhUdD4Qk5N/ne0X+zPwZlSSXW09+JPkIqsVOiuf3QonS7hcDruvjreBlJaU57FuqvJbD7Rvv1luyIa1phy0VhqabH+0nkf5LwzhmKap7Pdoqjq9lml/616ZEXp9sLt6bH8tDaTfUAVKHiMz6e6RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785664506; c=relaxed/simple;
	bh=dBLW18vCikVPV7/X2OGiGifqY+jFHl3CghneyFAJ9FE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EH28OvnJbTW/OI/FyXUG5wclDedrlErWXpcXKsk7z9evsmZmdL77msYbV/SM2XWrXXlNRxn8dZ6WI+B04RG01LWQrrfjsuEPvSvTdYC1It0HhqPXjXuZVQMBuRUfWIa6IQ28GwAO0OYk+U0HLbnR7tcfp4Alfv54q6S4GAmMFL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShWBRRYN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShWBRRYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785664504; x=1817200504;
  h=date:from:to:cc:subject:message-id;
  bh=dBLW18vCikVPV7/X2OGiGifqY+jFHl3CghneyFAJ9FE=;
  b=ShWBRRYN5PnT378ZUUJ2lF8bHrzmPPMz/GwQUH0AgqVb8UT9enjE9YKd
   rrwwDJqQ6uCUuBo9VVn7YElerk468hIlNzhnCvfcTBUqGfkKiKuxppp7E
   dOl8zsKMnROyJCOCubbtp3FvMsBxFsugkOktJ+yQxPkLuAwTefnpKj1vL
   Zjo0mMhNR9/tviXDpelJdLyVWHHcXLpqn9HwBfJ2cxgUPqYA0aSjv1PH9
   z2UXKYIgiE4lq14z88lWo9AZpKBOY9dRMpGKovXRCdHZebs/71JT6IdA4
   Ku0PX3GlSDFHO3aGyj1PIjwFJvKPsF0CQEEMhHDndK6/U+LORe5cIN3tK
   Q==;
X-CSE-ConnectionGUID: yl4T4ggVQ6WXuTmbQ0NbUw==
X-CSE-MsgGUID: ccuFiXGMQDGpNuIWL3aobQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="97386618"
X-IronPort-AV: E=Sophos;i="6.25,200,1779174000"; 
   d="scan'208";a="97386618"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 02:55:03 -0700
X-CSE-ConnectionGUID: TClVijjTRVSu5Zv17EHL3g==
X-CSE-MsgGUID: PiCImRtgQ5a58d0jYA3Q/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,200,1779174000"; 
   d="scan'208";a="266051228"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Aug 2026 02:55:01 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqSuI-000000004nV-2WbU;
	Sun, 02 Aug 2026 09:54:58 +0000
Date: Sun, 02 Aug 2026 17:54:18 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 383/700]
 drivers/soc/mstar/mstar-msc313-cmdq.c:157:13: warning: unused variable 'i'
Message-ID: <202608021742.LYUKx1rr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: ac59ae9915c2ea650a0bb8b7b64a4f716d40ab15 [383/700] soc: mstar: MSC313 CMDQ driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260802/202608021742.LYUKx1rr-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608021742.LYUKx1rr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608021742.LYUKx1rr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/mstar/mstar-msc313-cmdq.c: In function 'msc313_cmdq_probe':
>> drivers/soc/mstar/mstar-msc313-cmdq.c:157:13: warning: unused variable 'i' [-Wunused-variable]
     157 |         int i, ret;
         |             ^
>> drivers/soc/mstar/mstar-msc313-cmdq.c:155:34: warning: unused variable 'chan' [-Wunused-variable]
     155 |         struct msc313_cmdq_chan *chan;
         |                                  ^~~~
   At top level:
>> drivers/soc/mstar/mstar-msc313-cmdq.c:114:33: warning: 'soft_inter_field' defined but not used [-Wunused-variable]
     114 | static struct reg_field         soft_inter_field = REG_FIELD(REG_RAW_IRQ_FINAL_IRQ, 4, 7);
         |                                 ^~~~~~~~~~~~~~~~
>> drivers/soc/mstar/mstar-msc313-cmdq.c:113:33: warning: 'cmdq_done_field' defined but not used [-Wunused-variable]
     113 | static struct reg_field         cmdq_done_field = REG_FIELD(REG_RAW_IRQ_FINAL_IRQ, 3, 3);
         |                                 ^~~~~~~~~~~~~~~
>> drivers/soc/mstar/mstar-msc313-cmdq.c:104:33: warning: 'skip_wait_mask_field' defined but not used [-Wunused-variable]
     104 | static struct reg_field         skip_wait_mask_field = REG_FIELD(REG_SKIPFORCE, 5, 5);
         |                                 ^~~~~~~~~~~~~~~~~~~~
>> drivers/soc/mstar/mstar-msc313-cmdq.c:103:33: warning: 'skip_wr_mask_field' defined but not used [-Wunused-variable]
     103 | static struct reg_field         skip_wr_mask_field = REG_FIELD(REG_SKIPFORCE, 4, 4);
         |                                 ^~~~~~~~~~~~~~~~~~
>> drivers/soc/mstar/mstar-msc313-cmdq.c:102:33: warning: 'skip_pollneq_field' defined but not used [-Wunused-variable]
     102 | static struct reg_field         skip_pollneq_field = REG_FIELD(REG_SKIPFORCE, 3, 3);
         |                                 ^~~~~~~~~~~~~~~~~~
>> drivers/soc/mstar/mstar-msc313-cmdq.c:101:33: warning: 'skip_polleq_field' defined but not used [-Wunused-variable]
     101 | static struct reg_field         skip_polleq_field = REG_FIELD(REG_SKIPFORCE, 2, 2);
         |                                 ^~~~~~~~~~~~~~~~~
>> drivers/soc/mstar/mstar-msc313-cmdq.c:100:33: warning: 'skip_wait_field' defined but not used [-Wunused-variable]
     100 | static struct reg_field         skip_wait_field = REG_FIELD(REG_SKIPFORCE, 1, 1);
         |                                 ^~~~~~~~~~~~~~~
>> drivers/soc/mstar/mstar-msc313-cmdq.c:99:33: warning: 'skip_wr_field' defined but not used [-Wunused-variable]
      99 | static struct reg_field         skip_wr_field = REG_FIELD(REG_SKIPFORCE, 0, 0);
         |                                 ^~~~~~~~~~~~~
>> drivers/soc/mstar/mstar-msc313-cmdq.c:90:33: warning: 'rst_cmd_st_ptr_trig_field' defined but not used [-Wunused-variable]
      90 | static struct reg_field         rst_cmd_st_ptr_trig_field = REG_FIELD(REG_TRIG1, 3, 3);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/mstar/mstar-msc313-cmdq.c:89:33: warning: 'mov_cmd_ptr_field' defined but not used [-Wunused-variable]
      89 | static struct reg_field         mov_cmd_ptr_field = REG_FIELD(REG_TRIG1, 1, 1);
         |                                 ^~~~~~~~~~~~~~~~~
>> drivers/soc/mstar/mstar-msc313-cmdq.c:88:33: warning: 'dma_trig_field' defined but not used [-Wunused-variable]
      88 | static struct reg_field         dma_trig_field = REG_FIELD(REG_TRIG1, 0, 0);
         |                                 ^~~~~~~~~~~~~~
>> drivers/soc/mstar/mstar-msc313-cmdq.c:85:33: warning: 'buff_mode_field' defined but not used [-Wunused-variable]
      85 | static struct reg_field         buff_mode_field = REG_FIELD(REG_TRIG0, 1, 2);
         |                                 ^~~~~~~~~~~~~~~
>> drivers/soc/mstar/mstar-msc313-cmdq.c:84:33: warning: 'dma_trig_en_field' defined but not used [-Wunused-variable]
      84 | static struct reg_field         dma_trig_en_field = REG_FIELD(REG_TRIG0, 0, 0);
         |                                 ^~~~~~~~~~~~~~~~~
>> drivers/soc/mstar/mstar-msc313-cmdq.c:81:43: warning: 'enable_en_field' defined but not used [-Wunused-variable]
      81 | static struct                   reg_field enable_en_field = REG_FIELD(REG_ENABLE, 0, 0);
         |                                           ^~~~~~~~~~~~~~~


vim +/i +157 drivers/soc/mstar/mstar-msc313-cmdq.c

    79	
    80	#define REG_ENABLE		0x4
  > 81	static struct			reg_field enable_en_field = REG_FIELD(REG_ENABLE, 0, 0);
    82	
    83	#define REG_TRIG0		0x8
  > 84	static struct reg_field		dma_trig_en_field = REG_FIELD(REG_TRIG0, 0, 0);
  > 85	static struct reg_field		buff_mode_field = REG_FIELD(REG_TRIG0, 1, 2);
    86	
    87	#define REG_TRIG1		0xc
  > 88	static struct reg_field		dma_trig_field = REG_FIELD(REG_TRIG1, 0, 0);
  > 89	static struct reg_field		mov_cmd_ptr_field = REG_FIELD(REG_TRIG1, 1, 1);
  > 90	static struct reg_field		rst_cmd_st_ptr_trig_field = REG_FIELD(REG_TRIG1, 3, 3);
    91	
    92	#define REG_CMD_ST_PTR0		0x10
    93	#define REG_CMD_ST_PTR1		0x14
    94	#define REG_CMD_END_PTR0	0x18
    95	#define REG_CMD_END_PTR1	0x1c
    96	
    97	
    98	#define REG_SKIPFORCE		0x90
  > 99	static struct reg_field		skip_wr_field = REG_FIELD(REG_SKIPFORCE, 0, 0);
 > 100	static struct reg_field		skip_wait_field = REG_FIELD(REG_SKIPFORCE, 1, 1);
 > 101	static struct reg_field		skip_polleq_field = REG_FIELD(REG_SKIPFORCE, 2, 2);
 > 102	static struct reg_field		skip_pollneq_field = REG_FIELD(REG_SKIPFORCE, 3, 3);
 > 103	static struct reg_field		skip_wr_mask_field = REG_FIELD(REG_SKIPFORCE, 4, 4);
 > 104	static struct reg_field		skip_wait_mask_field = REG_FIELD(REG_SKIPFORCE, 5, 5);
   105	
   106	#define REG_RESET		0x0c4
   107	static struct reg_field		rst_nrst_field = REG_FIELD(REG_RESET, 0, 0);
   108	
   109	#define REQ_CRASH0		0x108
   110	#define REQ_CRASH1		0x10c
   111	
   112	#define REG_RAW_IRQ_FINAL_IRQ	0x110
 > 113	static struct reg_field		cmdq_done_field = REG_FIELD(REG_RAW_IRQ_FINAL_IRQ, 3, 3);
 > 114	static struct reg_field		soft_inter_field = REG_FIELD(REG_RAW_IRQ_FINAL_IRQ, 4, 7);
   115	
   116	#define REG_IRQ_FORCE		0x118
   117	#define REG_IRQ_MASK		0x11c
   118	#define REG_IRQ_CLEAR		0x120
   119	
   120	static const struct regmap_config msc313_cmdq_regmap_config = {
   121		.name = DRIVER_NAME,
   122		.reg_bits = 16,
   123		.val_bits = 16,
   124		.reg_stride = 4,
   125	};
   126	
   127	struct msc313_cmdq {
   128		struct clk *clk;
   129		struct regmap *regmap;
   130		struct regmap_field *nrst;
   131	};
   132	
   133	static const struct of_device_id msc313_cmdq_of_match[] = {
   134		{ .compatible = "mstar,msc313-cmdq", },
   135		{},
   136	};
   137	MODULE_DEVICE_TABLE(of, msc313_cmdq_of_match);
   138	
   139	static irqreturn_t msc313_cmdq_irq(int irq, void *data)
   140	{
   141		struct msc313_cmdq *cmdq = data;
   142	
   143		printk("%s:%d\n", __func__, __LINE__);
   144	
   145		regmap_write(cmdq->regmap, REG_IRQ_FORCE, 0);
   146		regmap_write(cmdq->regmap, REG_IRQ_CLEAR, ~0);
   147	
   148		return IRQ_HANDLED;
   149	}
   150	
   151	static int msc313_cmdq_probe(struct platform_device *pdev)
   152	{
   153		struct msc313_cmdq *cmdq;
   154		struct device *dev = &pdev->dev;
 > 155		struct msc313_cmdq_chan *chan;
   156		void __iomem *base;
 > 157		int i, ret;
   158		int irq;
   159	
   160		printk("cmdq probe\n");
   161	
   162		cmdq = devm_kzalloc(&pdev->dev, sizeof(*cmdq), GFP_KERNEL);
   163		if (!cmdq)
   164			return -ENOMEM;
   165	
   166		base = devm_platform_ioremap_resource(pdev, 0);
   167		if (IS_ERR(base))
   168			return PTR_ERR(base);
   169	
   170		cmdq->regmap = devm_regmap_init_mmio(dev, base,
   171				&msc313_cmdq_regmap_config);
   172		if (IS_ERR(cmdq->regmap))
   173			return PTR_ERR(cmdq->regmap);
   174	
   175		cmdq->clk = devm_clk_get(dev, NULL);
   176		if (IS_ERR(cmdq->clk)) {
   177			return PTR_ERR(cmdq->clk);
   178		}
   179	
   180		irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
   181		if (!irq)
   182			return -EINVAL;
   183		ret = devm_request_irq(dev, irq, msc313_cmdq_irq,
   184				IRQF_SHARED, dev_name(dev), cmdq);
   185	
   186		cmdq->nrst = devm_regmap_field_alloc(dev, cmdq->regmap, rst_nrst_field);
   187	
   188		ret = clk_prepare_enable(cmdq->clk);
   189		if (ret)
   190			goto out;
   191	
   192	out:
   193		return ret;
   194	}
   195	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
