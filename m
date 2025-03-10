Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4357A935
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 02:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741574127; cv=none; b=mmWl9ogZ6Z0CoFkZq/G7PlYrSS4qX2gwGMR54W7UtX6CGCl6os8N6kI731uvtzPvAAMoBYWx8Ksq5O9Gt1+CC5iw2NCDmCXWQSQ2X5SiRiAj2/7RTarYgYtyFMOJEFbbzLrwRiibsDD9TRfJc8DrMEiW6Uy2m5iKPkMTgoquR+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741574127; c=relaxed/simple;
	bh=Q+fIDrdSMOR3SFKznIyl8julbj6ie7ZPXULO7KBki0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SeyZhBsDBLhP59gyVjijLoP9jS5EtGPgJXmv4jS+PYrzKybn2Y7JvcLeapDIGkc7zX9hD8rCKhGINmilo5dtPu4mUbI1ht7Wk0StuY+iuEnVXvqFmIizCAVIZRbAu4E/VsKmMl1WCSpemCxRzSBxBW7Y5van6Hutc5JgHaHd8pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DmzJ3UeK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DmzJ3UeK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741574121; x=1773110121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q+fIDrdSMOR3SFKznIyl8julbj6ie7ZPXULO7KBki0M=;
  b=DmzJ3UeK/z1R11LgFLrOSwUmE7WhyXSMAucFs2RoyrcM+KIWIqvJpmfa
   8BeG7OMzFnsCnT4dYKH3/ubX2NRxL2BbTHRaj+F0dOf9DvyqeKnAZ3DVH
   979UTU/PXPOvrfedCqrdwasuCGGVPJagAsFUB4g/X2o3oNoIiuhR0hHKm
   Rsb6s1VQQZt6zJ50ZbLojEkUw5BzpEBpSvOvZOdJKh3C1oDJpW1csYMY8
   LXkWjhg/LzswGF+5f+S1+5J6ImlUPoa7rHqK+T5dyx54SmN0HmGQnfHUA
   IrhlWdJjJJCQxgRt1SQoKE54djvGrCfNgtHVbhDjNMr5FUWfXsIocTbiY
   g==;
X-CSE-ConnectionGUID: MqrSo7kSQnCJRvFfT7njeA==
X-CSE-MsgGUID: EAZQtguoR/+sQ0W3cjzDDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="46201225"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="46201225"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 19:35:12 -0700
X-CSE-ConnectionGUID: hLg6Sjg7RLqBdOLy7LCaeg==
X-CSE-MsgGUID: Zs7jUy9DTGqvb6LwHgvaSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="124933790"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 09 Mar 2025 19:34:43 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trSyQ-0003iw-0O;
	Mon, 10 Mar 2025 02:34:39 +0000
Date: Mon, 10 Mar 2025 10:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1473/1473]
 drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:72:28: sparse: sparse:
 symbol 'nic_cmd_support_vf' was not declared. Should it be static?
Message-ID: <202503101044.1ARqFaAp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1584a68cf2ef23ac87ba506e8ab8ca7e261813c1
commit: 746ea35981b1f77e988d48642409d73f0470b3eb [1473/1473] net: hinic: Add Hardware Abstract Layer
config: arm64-randconfig-r132-20250309 (https://download.01.org/0day-ci/archive/20250310/202503101044.1ARqFaAp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250310/202503101044.1ARqFaAp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503101044.1ARqFaAp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:72:28: sparse: sparse: symbol 'nic_cmd_support_vf' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:398:5: sparse: sparse: symbol 'hinic_hiovs_set_cpath_vlan' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:424:5: sparse: sparse: symbol 'hinic_hiovs_del_cpath_vlan' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1541:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] group_index @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1541:30: sparse:     expected unsigned int [usertype] group_index
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1541:30: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1544:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1544:23: sparse:     expected unsigned int [usertype] size
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1544:23: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1546:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] ctx @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1546:22: sparse:     expected unsigned int [usertype] ctx
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1546:22: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1728:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] group_index @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1728:32: sparse:     expected unsigned int [usertype] group_index
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1728:32: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1735:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1735:31: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1735:31: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1742:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1742:25: sparse:     expected unsigned int [usertype] size
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1742:25: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1754:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] offset @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1754:27: sparse:     expected unsigned int [usertype] offset
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1754:27: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1755:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1755:25: sparse:     expected unsigned int [usertype] size
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1755:25: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:2349:5: sparse: sparse: symbol 'nic_pf_mbox_handler' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:3237:5: sparse: sparse: symbol 'hw_speed_convert' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:398:5: warning: no previous prototype for 'hinic_hiovs_set_cpath_vlan' [-Wmissing-prototypes]
     398 | int hinic_hiovs_set_cpath_vlan(void *hwdev, u16 vlan_id, u16 pf_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:424:5: warning: no previous prototype for 'hinic_hiovs_del_cpath_vlan' [-Wmissing-prototypes]
     424 | int hinic_hiovs_del_cpath_vlan(void *hwdev, u16 vlan_id, u16 pf_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:2349:5: warning: no previous prototype for 'nic_pf_mbox_handler' [-Wmissing-prototypes]
    2349 | int nic_pf_mbox_handler(void *hwdev, u16 vf_id, u8 cmd, void *buf_in,
         |     ^~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:346:6: sparse: sparse: symbol 'hinic_qp_prepare_cmdq_header' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:379:24: sparse: sparse: cast to restricted __be64
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:365:6: sparse: sparse: symbol 'hinic_sq_prepare_ctxt' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:441:24: sparse: sparse: cast to restricted __be64
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:427:6: sparse: sparse: symbol 'hinic_rq_prepare_ctxt' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:843:16: sparse: sparse: cast to restricted __be16
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:913:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] db_info @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:913:23: sparse:     expected unsigned int [addressable] [usertype] db_info
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:913:23: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:917:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:917:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long [usertype] * @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:917:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:917:9: sparse:     got unsigned long long [usertype] *
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:974:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:974:27: sparse:     expected unsigned short [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:974:27: sparse:     got restricted __be16 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:346:6: warning: no previous prototype for 'hinic_qp_prepare_cmdq_header' [-Wmissing-prototypes]
     346 | void hinic_qp_prepare_cmdq_header(struct hinic_qp_ctxt_header *qp_ctxt_hdr,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:365:6: warning: no previous prototype for 'hinic_sq_prepare_ctxt' [-Wmissing-prototypes]
     365 | void hinic_sq_prepare_ctxt(struct hinic_sq *sq, u16 global_qpn,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:427:6: warning: no previous prototype for 'hinic_rq_prepare_ctxt' [-Wmissing-prototypes]
     427 | void hinic_rq_prepare_ctxt(struct hinic_rq *rq, struct hinic_rq_ctxt *rq_ctxt)
         |      ^~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dbg.c:100:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_dbg.c:100:24: sparse:     expected unsigned short
   drivers/net/ethernet/huawei/hinic/hinic_nic_dbg.c:100:24: sparse:     got restricted __be16 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_nic_dbg.c:159:22: sparse: sparse: cast removes address space '__iomem' of expression
--
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:37:16: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:43:9: sparse: sparse: cast from restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:43:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:43:9: sparse:     expected unsigned int [usertype] val
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:43:9: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:43:9: sparse: sparse: cast from restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:43:9: sparse: sparse: cast from restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:43:9: sparse: sparse: cast from restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:43:9: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:552:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *cfg_regs_base @@     got void *cfg_reg_base @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:552:29: sparse:     expected unsigned char [noderef] [usertype] __iomem *cfg_regs_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:552:29: sparse:     got void *cfg_reg_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:553:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *intr_regs_base @@     got void *intr_reg_base @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:553:30: sparse:     expected unsigned char [noderef] [usertype] __iomem *intr_regs_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:553:30: sparse:     got void *intr_reg_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:557:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *db_base @@     got void *db_base @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:557:23: sparse:     expected unsigned char [noderef] [usertype] __iomem *db_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:557:23: sparse:     got void *db_base
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:558:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *dwqe_mapping @@     got void *dwqe_mapping @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:558:28: sparse:     expected void [noderef] __iomem *dwqe_mapping
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:558:28: sparse:     got void *dwqe_mapping
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:620:65: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] flag @@     got unsigned int flag @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:620:65: sparse:     expected restricted gfp_t [usertype] flag
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:620:65: sparse:     got unsigned int flag
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:635:65: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] flag @@     got unsigned int flag @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:635:65: sparse:     expected restricted gfp_t [usertype] flag
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:635:65: sparse:     got unsigned int flag
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:52: warning: Function parameter or member 'hwdev' not described in 'hwif_ready'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:52: warning: Excess function parameter 'hwif' description in 'hwif_ready'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:541: warning: Function parameter or member 'hwdev' not described in 'hinic_init_hwif'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:541: warning: Function parameter or member 'cfg_reg_base' not described in 'hinic_init_hwif'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:541: warning: Function parameter or member 'intr_reg_base' not described in 'hinic_init_hwif'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:541: warning: Function parameter or member 'db_base_phy' not described in 'hinic_init_hwif'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:541: warning: Function parameter or member 'db_base' not described in 'hinic_init_hwif'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:541: warning: Function parameter or member 'dwqe_mapping' not described in 'hinic_init_hwif'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:541: warning: Excess function parameter 'hwif' description in 'hinic_init_hwif'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:541: warning: Excess function parameter 'pdev' description in 'hinic_init_hwif'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:607: warning: Function parameter or member 'hwdev' not described in 'hinic_free_hwif'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:607: warning: Excess function parameter 'hwif' description in 'hinic_free_hwif'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:607: warning: Excess function parameter 'pdev' description in 'hinic_free_hwif'
--
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:418:29: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:426:39: sparse: sparse: mixing different enum types:
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:426:39: sparse:    unsigned int enum hinic_aeq_type
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:426:39: sparse:    unsigned int enum hinic_ucode_event_type
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:431:37: sparse: sparse: cast to restricted __be64
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:479:24: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:765:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:765:25: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:765:25: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:783:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] desc @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:783:28: sparse:     expected unsigned int [usertype] desc
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:783:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c: In function 'aeq_irq_handler':
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:426:37: warning: implicit conversion from 'enum hinic_aeq_type' to 'enum hinic_ucode_event_type' [-Wenum-conversion]
     426 |                         ucode_event = event;
         |                                     ^
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:238: warning: Function parameter or member 'hwdev' not described in 'hinic_aeq_register_hw_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:238: warning: Function parameter or member 'hwe_cb' not described in 'hinic_aeq_register_hw_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:238: warning: Excess function parameter 'eqs' description in 'hinic_aeq_register_hw_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:238: warning: Excess function parameter 'handle' description in 'hinic_aeq_register_hw_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:238: warning: Excess function parameter 'hw_cb' description in 'hinic_aeq_register_hw_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:258: warning: Function parameter or member 'hwdev' not described in 'hinic_aeq_unregister_hw_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:258: warning: Excess function parameter 'eqs' description in 'hinic_aeq_unregister_hw_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:280: warning: Function parameter or member 'hwdev' not described in 'hinic_aeq_register_swe_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:280: warning: Function parameter or member 'aeq_swe_cb' not described in 'hinic_aeq_register_swe_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:280: warning: Excess function parameter 'eqs' description in 'hinic_aeq_register_swe_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:280: warning: Excess function parameter 'handle' description in 'hinic_aeq_register_swe_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:280: warning: Excess function parameter 'sw_cb' description in 'hinic_aeq_register_swe_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:300: warning: Function parameter or member 'hwdev' not described in 'hinic_aeq_unregister_swe_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:300: warning: Excess function parameter 'eqs' description in 'hinic_aeq_unregister_swe_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:322: warning: Function parameter or member 'hwdev' not described in 'hinic_ceq_register_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:322: warning: Function parameter or member 'callback' not described in 'hinic_ceq_register_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:322: warning: Excess function parameter 'ceqs' description in 'hinic_ceq_register_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:322: warning: Excess function parameter 'handle' description in 'hinic_ceq_register_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:322: warning: Excess function parameter 'ceq_cb' description in 'hinic_ceq_register_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:342: warning: Function parameter or member 'hwdev' not described in 'hinic_ceq_unregister_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:342: warning: Excess function parameter 'ceqs' description in 'hinic_ceq_unregister_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:361: warning: Function parameter or member 'arm_state' not described in 'set_eq_cons_idx'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:382: warning: Function parameter or member 'ceqs' not described in 'ceq_event_handler'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:382: warning: Excess function parameter 'eqs' description in 'ceq_event_handler'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:954: warning: Function parameter or member 'hwdev' not described in 'init_eq'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:954: warning: Excess function parameter 'hwif' description in 'init_eq'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:954: warning: Excess function parameter 'page_size' description in 'init_eq'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:1084: warning: Function parameter or member 'hwdev' not described in 'hinic_aeqs_init'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:1084: warning: Function parameter or member 'num_aeqs' not described in 'hinic_aeqs_init'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:1084: warning: Excess function parameter 'aeqs' description in 'hinic_aeqs_init'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:1084: warning: Excess function parameter 'hwif' description in 'hinic_aeqs_init'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:1084: warning: Excess function parameter 'num_ceqs' description in 'hinic_aeqs_init'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:1084: warning: Excess function parameter 'q_len' description in 'hinic_aeqs_init'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:1084: warning: Excess function parameter 'page_size' description in 'hinic_aeqs_init'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:1139: warning: Function parameter or member 'hwdev' not described in 'hinic_aeqs_free'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:1139: warning: Excess function parameter 'aeqs' description in 'hinic_aeqs_free'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:1171: warning: Function parameter or member 'hwdev' not described in 'hinic_ceqs_init'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:1171: warning: Excess function parameter 'ceqs' description in 'hinic_ceqs_init'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:1171: warning: Excess function parameter 'hwif' description in 'hinic_ceqs_init'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:1171: warning: Excess function parameter 'q_len' description in 'hinic_ceqs_init'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:1171: warning: Excess function parameter 'page_size' description in 'hinic_ceqs_init'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:1222: warning: Function parameter or member 'hwdev' not described in 'hinic_ceqs_free'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:1222: warning: Excess function parameter 'ceqs' description in 'hinic_ceqs_free'
--
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:735:5: sparse: sparse: symbol 'set_vf_mbox_random_id' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:813:21: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:787:6: sparse: sparse: symbol 'check_vf_mbox_random_id' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:893:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:893:54: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:893:54: sparse:     got unsigned char [usertype] *
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:909:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:909:58: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:909:58: sparse:     got unsigned char [usertype] *
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:947:6: sparse: sparse: symbol 'dump_mox_reg' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:962:22: sparse: sparse: cast to restricted __be64
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:1450:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [usertype] *data @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:1450:25: sparse:     expected unsigned char [usertype] *data
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:1450:25: sparse:     got unsigned char [noderef] [usertype] __iomem *
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:735:5: warning: no previous prototype for 'set_vf_mbox_random_id' [-Wmissing-prototypes]
     735 | int set_vf_mbox_random_id(struct hinic_hwdev *hwdev, u16 func_id)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:787:6: warning: no previous prototype for 'check_vf_mbox_random_id' [-Wmissing-prototypes]
     787 | bool check_vf_mbox_random_id(struct hinic_mbox_func_to_func *func_to_func,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:947:6: warning: no previous prototype for 'dump_mox_reg' [-Wmissing-prototypes]
     947 | void dump_mox_reg(struct hinic_hwdev *hwdev)
         |      ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:265: warning: Function parameter or member 'hwdev' not described in 'hinic_register_ppf_mbox_cb'
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:265: warning: Excess function parameter 'func_to_func' description in 'hinic_register_ppf_mbox_cb'
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:287: warning: Function parameter or member 'hwdev' not described in 'hinic_register_pf_mbox_cb'
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:287: warning: Excess function parameter 'func_to_func' description in 'hinic_register_pf_mbox_cb'
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:309: warning: Function parameter or member 'hwdev' not described in 'hinic_register_vf_mbox_cb'
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:309: warning: Excess function parameter 'func_to_func' description in 'hinic_register_vf_mbox_cb'
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:331: warning: Function parameter or member 'hwdev' not described in 'hinic_register_ppf_to_pf_mbox_cb'
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:331: warning: Excess function parameter 'func_to_func' description in 'hinic_register_ppf_to_pf_mbox_cb'
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:350: warning: Function parameter or member 'hwdev' not described in 'hinic_unregister_ppf_mbox_cb'
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:350: warning: Excess function parameter 'func_to_func' description in 'hinic_unregister_ppf_mbox_cb'
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:364: warning: Function parameter or member 'hwdev' not described in 'hinic_unregister_pf_mbox_cb'
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:364: warning: Excess function parameter 'func_to_func' description in 'hinic_unregister_pf_mbox_cb'
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:378: warning: Function parameter or member 'hwdev' not described in 'hinic_unregister_vf_mbox_cb'
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:378: warning: Excess function parameter 'func_to_func' description in 'hinic_unregister_vf_mbox_cb'
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:392: warning: Function parameter or member 'hwdev' not described in 'hinic_unregister_ppf_to_pf_mbox_cb'
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:392: warning: Excess function parameter 'func_to_func' description in 'hinic_unregister_ppf_to_pf_mbox_cb'
--
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:160:31: sparse: sparse: cast to restricted __be64
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:241:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:241:20: sparse:     expected unsigned long long [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:241:20: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:302:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] desc @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:302:20: sparse:     expected unsigned long long [usertype] desc
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:302:20: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:353:20: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:357:25: sparse: sparse: cast to restricted __be64
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:417:31: sparse: sparse: cast to restricted __be64
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:776:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] hw_cmd_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:776:41: sparse:     expected unsigned long long [usertype] hw_cmd_paddr
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:776:41: sparse:     got restricted __be64 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:782:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] hw_cmd_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:782:42: sparse:     expected unsigned long long [usertype] hw_cmd_paddr
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:782:42: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:809:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] hw_wb_resp_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:809:37: sparse:     expected unsigned long long [usertype] hw_wb_resp_paddr
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:809:37: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:887:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] next_cell_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:887:43: sparse:     expected unsigned long long [usertype] next_cell_paddr
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:887:43: sparse:     got restricted __be64 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:930:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] next_cell_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:930:31: sparse:     expected unsigned long long [usertype] next_cell_paddr
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:930:31: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:999:47: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int flag @@     got restricted gfp_t @@
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:999:47: sparse:     expected unsigned int flag
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:999:47: sparse:     got restricted gfp_t
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:515:17: sparse: sparse: context imbalance in 'api_cmd' - different lock contexts for basic block
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c: In function 'api_chain_init':
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:1033:41: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    1033 |                 sema_deinit(&chain->sem);
         |                                         ^
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c: In function 'api_chain_free':
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:1056:41: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    1056 |                 sema_deinit(&chain->sem);
         |                                         ^
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:197: warning: Function parameter or member 'cmd_size' not described in 'get_cell_data_size'
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:411: warning: Function parameter or member 'ctxt' not described in 'wait_for_resp_polling'
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:411: warning: Excess function parameter 'chain' description in 'wait_for_resp_polling'
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:443: warning: Function parameter or member 'ctxt' not described in 'wait_for_api_cmd_completion'
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:443: warning: Function parameter or member 'ack' not described in 'wait_for_api_cmd_completion'
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:443: warning: Function parameter or member 'ack_size' not described in 'wait_for_api_cmd_completion'
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:502: warning: Function parameter or member 'cmd_size' not described in 'api_cmd'
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:502: warning: Function parameter or member 'ack' not described in 'api_cmd'
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:502: warning: Function parameter or member 'ack_size' not described in 'api_cmd'
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:502: warning: Excess function parameter 'size' description in 'api_cmd'
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:565: warning: Function parameter or member 'cmd_chain' not described in 'api_cmd_hw_restart'
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:565: warning: Excess function parameter 'chain' description in 'api_cmd_hw_restart'
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:1068: warning: Function parameter or member 'cmd_chain' not described in 'api_cmd_create_chain'
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:1068: warning: Excess function parameter 'chain' description in 'api_cmd_create_chain'
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:1132: warning: Function parameter or member 'hwdev' not described in 'hinic_api_cmd_init'
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:1132: warning: Excess function parameter 'hwif' description in 'hinic_api_cmd_init'
--
>> drivers/net/ethernet/huawei/hinic/hinic_wq.c:208:55: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int flag @@     got restricted gfp_t @@
   drivers/net/ethernet/huawei/hinic/hinic_wq.c:208:55: sparse:     expected unsigned int flag
   drivers/net/ethernet/huawei/hinic/hinic_wq.c:208:55: sparse:     got restricted gfp_t
>> drivers/net/ethernet/huawei/hinic/hinic_wq.c:214:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_wq.c:214:24: sparse:     expected unsigned long long [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_wq.c:214:24: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_wq.c:587:16: sparse: sparse: cast to restricted __be64
--
>> drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:366:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] db_info @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:366:20: sparse:     expected unsigned int [addressable] [usertype] db_info
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:366:20: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:369:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:369:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:369:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:369:9: sparse:     got unsigned char [usertype] *
>> drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:511:31: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:517:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:517:40: sparse:     expected unsigned long long [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:517:40: sparse:     got restricted __be64 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:531:21: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1080:27: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1151:25: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1217:37: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1245:31: sparse: sparse: cast to restricted __be64
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1315:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1315:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *db_base @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1315:23: sparse:     expected unsigned char [noderef] [usertype] __iomem *db_base
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1315:23: sparse:     got unsigned char [usertype] *
>> drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1334:5: sparse: sparse: symbol 'hinic_set_cmdq_ctxts' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1334:5: warning: no previous prototype for 'hinic_set_cmdq_ctxts' [-Wmissing-prototypes]
    1334 | int hinic_set_cmdq_ctxts(struct hinic_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:223:5: sparse: sparse: symbol 'hinic_hw_rx_buf_size' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:629:28: sparse: sparse: symbol 'hw_cmd_support_vf' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:659:30: sparse: sparse: symbol 'mgmt_status_log' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:722:6: sparse: sparse: symbol 'hinic_print_status_info' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1039:5: sparse: sparse: symbol 'hinic_msg_to_mgmt_no_ack' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1106:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1106:22: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1106:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1128:24: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1826:5: sparse: sparse: symbol 'hinic_sync_heartbeat_status' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1928:5: sparse: sparse: symbol 'comm_pf_mbox_handler' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2617:5: sparse: sparse: symbol 'ppf_ht_gpa_set' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2663:5: sparse: sparse: symbol 'hinic_ppf_ht_gpa_init' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2709:6: sparse: sparse: symbol 'hinic_ppf_ht_gpa_deinit' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4205:6: sparse: sparse: symbol 'pf_fault_event_handler' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4213:6: sparse: sparse: symbol 'mgmt_watchdog_event_handler' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4220:6: sparse: sparse: symbol 'mgmt_fmw_act_event_handler' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4227:6: sparse: sparse: symbol 'mgmt_pcie_dfx_event_handler' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4234:6: sparse: sparse: symbol 'mgmt_get_mctp_event_handler' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4517:5: sparse: sparse: symbol '_set_led_status' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4603:5: sparse: sparse: symbol 'hinic_get_phy_init_status' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4807:5: sparse: sparse: symbol 'hinic_read_reg' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4985:23: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4991:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4991:21: sparse:     expected unsigned int [addressable] [assigned] [usertype] val
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4991:21: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:722:6: warning: no previous prototype for 'hinic_print_status_info' [-Wmissing-prototypes]
     722 | void hinic_print_status_info(void *hwdev, enum hinic_mod_type mod, u8 cmd,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1039:5: warning: no previous prototype for 'hinic_msg_to_mgmt_no_ack' [-Wmissing-prototypes]
    1039 | int hinic_msg_to_mgmt_no_ack(void *hwdev, enum hinic_mod_type mod, u8 cmd,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1826:5: warning: no previous prototype for 'hinic_sync_heartbeat_status' [-Wmissing-prototypes]
    1826 | int hinic_sync_heartbeat_status(struct hinic_hwdev *hwdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1928:5: warning: no previous prototype for 'comm_pf_mbox_handler' [-Wmissing-prototypes]
    1928 | int comm_pf_mbox_handler(void *handle, u16 vf_id, u8 cmd, void *buf_in,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2617:5: warning: no previous prototype for 'ppf_ht_gpa_set' [-Wmissing-prototypes]
    2617 | int ppf_ht_gpa_set(struct hinic_hwdev *hwdev, struct hinic_page_addr *pg0,
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2663:5: warning: no previous prototype for 'hinic_ppf_ht_gpa_init' [-Wmissing-prototypes]
    2663 | int hinic_ppf_ht_gpa_init(struct hinic_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2709:6: warning: no previous prototype for 'hinic_ppf_ht_gpa_deinit' [-Wmissing-prototypes]
    2709 | void hinic_ppf_ht_gpa_deinit(struct hinic_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2786:5: warning: no previous prototype for 'mqm_eqm_try_alloc_mem' [-Wmissing-prototypes]
    2786 | int mqm_eqm_try_alloc_mem(struct hinic_hwdev *hwdev, u32 page_size,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2823:5: warning: no previous prototype for 'mqm_eqm_alloc_page_mem' [-Wmissing-prototypes]
    2823 | int mqm_eqm_alloc_page_mem(struct hinic_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2848:6: warning: no previous prototype for 'mqm_eqm_free_page_mem' [-Wmissing-prototypes]
    2848 | void mqm_eqm_free_page_mem(struct hinic_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2864:5: warning: no previous prototype for 'mqm_eqm_set_cfg_2_hw' [-Wmissing-prototypes]
    2864 | int mqm_eqm_set_cfg_2_hw(struct hinic_hwdev *hwdev, u32 valid)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2889:5: warning: no previous prototype for 'mqm_eqm_set_page_2_hw' [-Wmissing-prototypes]
    2889 | int mqm_eqm_set_page_2_hw(struct hinic_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2967:5: warning: no previous prototype for 'mqm_eqm_init' [-Wmissing-prototypes]
    2967 | int mqm_eqm_init(struct hinic_hwdev *hwdev)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3030:6: warning: no previous prototype for 'mqm_eqm_deinit' [-Wmissing-prototypes]
    3030 | void mqm_eqm_deinit(struct hinic_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3932:6: warning: no previous prototype for 'print_hilink_info' [-Wmissing-prototypes]
    3932 | void print_hilink_info(struct hinic_hwdev *hwdev,
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4205:6: warning: no previous prototype for 'pf_fault_event_handler' [-Wmissing-prototypes]
    4205 | void pf_fault_event_handler(void *hwdev,
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4213:6: warning: no previous prototype for 'mgmt_watchdog_event_handler' [-Wmissing-prototypes]
    4213 | void mgmt_watchdog_event_handler(void *hwdev, void *buf_in, u16 in_size,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4220:6: warning: no previous prototype for 'mgmt_fmw_act_event_handler' [-Wmissing-prototypes]
    4220 | void mgmt_fmw_act_event_handler(void *hwdev, void *buf_in, u16 in_size,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4227:6: warning: no previous prototype for 'mgmt_pcie_dfx_event_handler' [-Wmissing-prototypes]
    4227 | void mgmt_pcie_dfx_event_handler(void *hwdev, void *buf_in, u16 in_size,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4234:6: warning: no previous prototype for 'mgmt_get_mctp_event_handler' [-Wmissing-prototypes]
    4234 | void mgmt_get_mctp_event_handler(void *hwdev, void *buf_in, u16 in_size,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4517:5: warning: no previous prototype for '_set_led_status' [-Wmissing-prototypes]
    4517 | int _set_led_status(struct hinic_hwdev *hwdev, u8 port,
         |     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4603:5: warning: no previous prototype for 'hinic_get_phy_init_status' [-Wmissing-prototypes]
    4603 | int hinic_get_phy_init_status(void *hwdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4807:5: warning: no previous prototype for 'hinic_read_reg' [-Wmissing-prototypes]
    4807 | int hinic_read_reg(void *hwdev, u32 reg_addr, u32 *val)
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4894:5: warning: no previous prototype for 'hinic_register_fault_recover' [-Wmissing-prototypes]
    4894 | int hinic_register_fault_recover(void *hwdev, void *pri_handle,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4916:5: warning: no previous prototype for 'hinic_unregister_fault_recover' [-Wmissing-prototypes]
    4916 | int hinic_unregister_fault_recover(void *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c: In function '__print_cable_info.isra':
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3849:29: warning: ', Temperature: ' directive output may be truncated writing 15 bytes into a region of size between 0 and 511 [-Wformat-truncation=]
    3849 |                          "%s, Temperature: %u", tmp_str,
         |                             ^~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3849:26: note: directive argument in the range [0, 255]
    3849 |                          "%s, Temperature: %u", tmp_str,
         |                          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3848:17: note: 'snprintf' output between 17 and 530 bytes into a destination of size 511
    3848 |                 snprintf(tmp_str, sizeof(tmp_str) - 1,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3849 |                          "%s, Temperature: %u", tmp_str,
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3850 |                          info->cable_temp);
         |                          ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3848:17: warning: 'snprintf' argument 4 overlaps destination object 'tmp_str' [-Wrestrict]
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3812:14: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
    3812 |         char tmp_str[512] = {0};
         |              ^~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1721: warning: Function parameter or member 'hwdev' not described in 'set_pf_dma_attr_entry'
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1721: warning: Excess function parameter 'hwif' description in 'set_pf_dma_attr_entry'
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1780: warning: Function parameter or member 'hwdev' not described in 'dma_attr_table_init'
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1780: warning: Excess function parameter 'hwif' description in 'dma_attr_table_init'
--
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:41:6: sparse: sparse: symbol 'g_test_qpc_num' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:42:6: sparse: sparse: symbol 'g_test_qpc_resvd_num' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:43:6: sparse: sparse: symbol 'g_test_pagesize_reorder' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:44:6: sparse: sparse: symbol 'g_test_xid_alloc_mode' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:45:6: sparse: sparse: symbol 'g_test_gpa_check_enable' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:46:6: sparse: sparse: symbol 'g_test_qpc_alloc_mode' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:47:6: sparse: sparse: symbol 'g_test_scqc_alloc_mode' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:48:6: sparse: sparse: symbol 'g_test_max_conn' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:49:6: sparse: sparse: symbol 'g_test_max_cache_conn' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:50:6: sparse: sparse: symbol 'g_test_scqc_num' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:51:6: sparse: sparse: symbol 'g_test_mpt_num' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:52:6: sparse: sparse: symbol 'g_test_mpt_resvd' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:53:6: sparse: sparse: symbol 'g_test_scq_resvd' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:54:6: sparse: sparse: symbol 'g_test_hash_num' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:55:6: sparse: sparse: symbol 'g_test_reorder_num' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1411:5: sparse: sparse: symbol 'init_cfg_mgmt' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1458:6: sparse: sparse: symbol 'free_cfg_mgmt' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1493:5: sparse: sparse: symbol 'init_capability' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1522:6: sparse: sparse: symbol 'free_capability' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1732:5: sparse: sparse: symbol 'cfg_set_func_sf_en' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1770:5: sparse: sparse: symbol 'cfg_get_func_sf_en' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1096:5: warning: no previous prototype for 'hinic_vector_to_irq' [-Wmissing-prototypes]
    1096 | int hinic_vector_to_irq(void *hwdev, enum hinic_service_type type, int vector)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1411:5: warning: no previous prototype for 'init_cfg_mgmt' [-Wmissing-prototypes]
    1411 | int init_cfg_mgmt(struct hinic_hwdev *dev)
         |     ^~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1458:6: warning: no previous prototype for 'free_cfg_mgmt' [-Wmissing-prototypes]
    1458 | void free_cfg_mgmt(struct hinic_hwdev *dev)
         |      ^~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1493:5: warning: no previous prototype for 'init_capability' [-Wmissing-prototypes]
    1493 | int init_capability(struct hinic_hwdev *dev)
         |     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1522:6: warning: no previous prototype for 'free_capability' [-Wmissing-prototypes]
    1522 | void free_capability(struct hinic_hwdev *dev)
         |      ^~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1732:5: warning: no previous prototype for 'cfg_set_func_sf_en' [-Wmissing-prototypes]
    1732 | int cfg_set_func_sf_en(void *hwdev, u32 enbits, u32 enmask)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1770:5: warning: no previous prototype for 'cfg_get_func_sf_en' [-Wmissing-prototypes]
    1770 | int cfg_get_func_sf_en(void *hwdev, u32 *enbits)
         |     ^~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.c:66:6: sparse: sparse: symbol 'get_slave_host_enable' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.c:589:6: sparse: sparse: symbol 'comm_ppf_to_pf_handler' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.c:607:5: sparse: sparse: symbol 'hinic_nic_ppf_mbox_handler' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.c:616:6: sparse: sparse: symbol 'hinic_nic_ppf_to_pf_handler' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.c:625:5: sparse: sparse: symbol 'hinic_register_slave_ppf' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.c:66:6: warning: no previous prototype for 'get_slave_host_enable' [-Wmissing-prototypes]
      66 | bool get_slave_host_enable(struct hinic_hwdev *hwdev, u8 host_id)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.c:209:5: warning: no previous prototype for '__mbox_to_host' [-Wmissing-prototypes]
     209 | int __mbox_to_host(struct hinic_hwdev *hwdev, enum hinic_mod_type mod,
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.c:483:5: warning: no previous prototype for 'sw_func_ppf_mbox_handler' [-Wmissing-prototypes]
     483 | int sw_func_ppf_mbox_handler(void *handle, u16 pf_idx, u16 vf_id, u8 cmd,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.c:506:5: warning: no previous prototype for '__ppf_process_mbox_msg' [-Wmissing-prototypes]
     506 | int __ppf_process_mbox_msg(struct hinic_hwdev *hwdev, u16 pf_idx, u16 vf_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.c:580:5: warning: no previous prototype for 'comm_ppf_mbox_handler' [-Wmissing-prototypes]
     580 | int comm_ppf_mbox_handler(void *handle, u16 pf_idx, u16 vf_id, u8 cmd,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.c:589:6: warning: no previous prototype for 'comm_ppf_to_pf_handler' [-Wmissing-prototypes]
     589 | void comm_ppf_to_pf_handler(void *handle, u8 cmd,
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.c:598:5: warning: no previous prototype for 'hilink_ppf_mbox_handler' [-Wmissing-prototypes]
     598 | int hilink_ppf_mbox_handler(void *handle, u16 pf_idx, u16 vf_id, u8 cmd,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.c:607:5: warning: no previous prototype for 'hinic_nic_ppf_mbox_handler' [-Wmissing-prototypes]
     607 | int hinic_nic_ppf_mbox_handler(void *handle, u16 pf_idx, u16 vf_id, u8 cmd,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.c:616:6: warning: no previous prototype for 'hinic_nic_ppf_to_pf_handler' [-Wmissing-prototypes]
     616 | void hinic_nic_ppf_to_pf_handler(void *handle, u8 cmd,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.c:625:5: warning: no previous prototype for 'hinic_register_slave_ppf' [-Wmissing-prototypes]
     625 | int hinic_register_slave_ppf(struct hinic_hwdev *hwdev, bool registered)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.c:686:5: warning: no previous prototype for 'set_slave_func_nic_state' [-Wmissing-prototypes]
     686 | int set_slave_func_nic_state(struct hinic_hwdev *hwdev, u16 func_idx, u8 en)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~

vim +/nic_cmd_support_vf +72 drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c

    71	
  > 72	struct vf_cmd_check_handle nic_cmd_support_vf[] = {
    73		{HINIC_PORT_CMD_VF_REGISTER, NULL},
    74		{HINIC_PORT_CMD_VF_UNREGISTER, NULL},
    75	
    76		{HINIC_PORT_CMD_CHANGE_MTU, hinic_mbox_check_func_id_8B},
    77	
    78		{HINIC_PORT_CMD_ADD_VLAN, hinic_mbox_check_func_id_8B},
    79		{HINIC_PORT_CMD_DEL_VLAN, hinic_mbox_check_func_id_8B},
    80	
    81		{HINIC_PORT_CMD_SET_MAC, hinic_mbox_check_func_id_8B},
    82		{HINIC_PORT_CMD_GET_MAC, hinic_mbox_check_func_id_8B},
    83		{HINIC_PORT_CMD_DEL_MAC, hinic_mbox_check_func_id_8B},
    84	
    85		{HINIC_PORT_CMD_SET_RX_MODE, hinic_mbox_check_func_id_8B},
    86	
    87		{HINIC_PORT_CMD_GET_PAUSE_INFO, hinic_mbox_check_func_id_8B},
    88	
    89		{HINIC_PORT_CMD_GET_LINK_STATE, hinic_mbox_check_func_id_8B},
    90		{HINIC_PORT_CMD_SET_LRO, hinic_mbox_check_func_id_8B},
    91		{HINIC_PORT_CMD_SET_RX_CSUM, hinic_mbox_check_func_id_8B},
    92		{HINIC_PORT_CMD_SET_RX_VLAN_OFFLOAD, hinic_mbox_check_func_id_8B},
    93	
    94		{HINIC_PORT_CMD_GET_VPORT_STAT, hinic_mbox_check_func_id_8B},
    95		{HINIC_PORT_CMD_CLEAN_VPORT_STAT, hinic_mbox_check_func_id_8B},
    96	
    97		{HINIC_PORT_CMD_GET_RSS_TEMPLATE_INDIR_TBL,
    98		 hinic_mbox_check_func_id_8B},
    99		{HINIC_PORT_CMD_SET_RSS_TEMPLATE_INDIR_TBL,
   100		 hinic_mbox_check_func_id_8B},
   101		{HINIC_PORT_CMD_SET_RSS_TEMPLATE_TBL, hinic_mbox_check_func_id_8B},
   102		{HINIC_PORT_CMD_GET_RSS_TEMPLATE_TBL, hinic_mbox_check_func_id_8B},
   103		{HINIC_PORT_CMD_SET_RSS_HASH_ENGINE, hinic_mbox_check_func_id_8B},
   104		{HINIC_PORT_CMD_GET_RSS_HASH_ENGINE, hinic_mbox_check_func_id_8B},
   105		{HINIC_PORT_CMD_GET_RSS_CTX_TBL, hinic_mbox_check_func_id_8B},
   106		{HINIC_PORT_CMD_SET_RSS_CTX_TBL, hinic_mbox_check_func_id_8B},
   107		{HINIC_PORT_CMD_RSS_TEMP_MGR, hinic_mbox_check_func_id_8B},
   108		{HINIC_PORT_CMD_RSS_CFG, hinic_mbox_check_func_id_8B},
   109	
   110		{HINIC_PORT_CMD_INIT_FUNC, check_func_table},
   111		{HINIC_PORT_CMD_SET_LLI_PRI, hinic_mbox_check_func_id_8B},
   112	
   113		{HINIC_PORT_CMD_GET_MGMT_VERSION, NULL},
   114		{HINIC_PORT_CMD_GET_BOOT_VERSION, NULL},
   115		{HINIC_PORT_CMD_GET_MICROCODE_VERSION, NULL},
   116	
   117		{HINIC_PORT_CMD_GET_VPORT_ENABLE, hinic_mbox_check_func_id_8B},
   118		{HINIC_PORT_CMD_SET_VPORT_ENABLE, hinic_mbox_check_func_id_8B},
   119	
   120		{HINIC_PORT_CMD_GET_LRO, hinic_mbox_check_func_id_8B},
   121		{HINIC_PORT_CMD_GET_GLOBAL_QPN, hinic_mbox_check_func_id_8B},
   122	
   123		{HINIC_PORT_CMD_SET_TSO, hinic_mbox_check_func_id_8B},
   124		{HINIC_PORT_CMD_SET_RQ_IQ_MAP, hinic_mbox_check_func_id_8B},
   125		{HINIC_PORT_CMD_LINK_STATUS_REPORT, hinic_mbox_check_func_id_8B},
   126		{HINIC_PORT_CMD_UPDATE_MAC, hinic_mbox_check_func_id_8B},
   127	
   128		{HINIC_PORT_CMD_GET_PORT_INFO, hinic_mbox_check_func_id_8B},
   129	
   130		{HINIC_PORT_CMD_SET_IPSU_MAC, hinic_mbox_check_func_id_10B},
   131		{HINIC_PORT_CMD_GET_IPSU_MAC, hinic_mbox_check_func_id_10B},
   132	
   133		{HINIC_PORT_CMD_GET_LINK_MODE, hinic_mbox_check_func_id_8B},
   134	
   135		{HINIC_PORT_CMD_CLEAR_SQ_RES, hinic_mbox_check_func_id_8B},
   136		{HINIC_PORT_CMD_SET_SUPER_CQE, hinic_mbox_check_func_id_8B},
   137	
   138		{HINIC_PORT_CMD_GET_VF_COS, NULL},
   139		{HINIC_PORT_CMD_SET_VHD_CFG, hinic_mbox_check_func_id_8B},
   140	
   141		{HINIC_PORT_CMD_SET_VLAN_FILTER, hinic_mbox_check_func_id_8B},
   142	};
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
