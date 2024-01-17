Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9791DDC8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 11:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705489503; cv=none; b=d8ASeish19NIraayfT1R1t87TtBujyd4WouOGsDkBK/I5y8YHg0w28sxa9XgLE36vCidQzAe5WpHdl1POL1I/qceoqw8D6Y2awlR0poygTG8vNf4ionX984AglObSbSADwUO5u8tkG+hIctHGFNpwC/xY5qL6QKaDrkhpfeRElc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705489503; c=relaxed/simple;
	bh=zGTzUwd2fKv+Fzn8TpYuwbuUPQcfRHfIu0HSIBFOaW8=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=TaLoVS1i2L8nsjnh5iqzqGBA0obnpVfEF6AThtnlvrULSnqr6H8RW37ebrKiRHjFSZEOQmnRc6JDu+UrfUrpAYZgUmgy0oIWFIU97qoWRCctkzH0beX8coXddRycVgc+7pn0GHshVRtdKp6G/amwGyOd+AFLI8kH9agtJY/8TAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bya6jmhX; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bya6jmhX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705489501; x=1737025501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zGTzUwd2fKv+Fzn8TpYuwbuUPQcfRHfIu0HSIBFOaW8=;
  b=Bya6jmhXDhO1z6SUve14yC4Ague1o8a+LLabtr6RRkJxGFS0+y+f6laz
   AZh8Y5fDi18B4lH4/SOiqfJIEIqFOUtX6XNZKssHPx+tMJrAX24Qj+w3a
   XmIaCnVfcwmIkNwRmldbmVTHP2cA18vtxwUskiGaWOtYjE0+DqrEYWIvZ
   92yFegfHkkkwBguW7sr/pVxrNDpTDh6Xz4zJL6CxCmX2bEcu8tCtoxwDp
   H4bqi8GXYhthZ1hD5yRGSBcdQTBnmbiFAn0NiKkqAyHvikx4tytr4NxS2
   ZNRx4zChcBcRv2Z6l8iqZDk87QEmXWdtxtmp8EqcOC6IaXSeDzMbl/viH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="431298458"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="431298458"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 03:05:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="874789217"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="874789217"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jan 2024 03:04:59 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQ3j7-0001uo-0k;
	Wed, 17 Jan 2024 11:04:57 +0000
Date: Wed, 17 Jan 2024 19:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13668/21548]
 drivers/net/ethernet/huawei/hinic/hinic_eqs.c:518:12: warning: variable
 'lev' set but not used
Message-ID: <202401171828.Vi8wOfw3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   9c16bc9b692feee4d789eb6179550170d88295c0
commit: 9888903696bdc961650379fc65632ec7a04504fe [13668/21548] net/hinic: Delete the unused chip fault handling process
config: x86_64-openeuler_defconfig (https://download.01.org/0day-ci/archive/20240117/202401171828.Vi8wOfw3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401171828.Vi8wOfw3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401171828.Vi8wOfw3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/huawei/hinic/hinic_eqs.c: In function 'aeq_irq_handler':
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:539:37: warning: implicit conversion from 'enum hinic_aeq_type' to 'enum hinic_ucode_event_type' [-Wenum-conversion]
     539 |                         ucode_event = event;
         |                                     ^
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:518:12: warning: variable 'lev' set but not used [-Wunused-but-set-variable]
     518 |         u8 lev;
         |            ^~~
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:321: warning: Function parameter or member 'hwe_cb' not described in 'hinic_aeq_register_hw_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:321: warning: Excess function parameter 'hw_cb' description in 'hinic_aeq_register_hw_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:369: warning: Function parameter or member 'aeq_swe_cb' not described in 'hinic_aeq_register_swe_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:369: warning: Excess function parameter 'sw_cb' description in 'hinic_aeq_register_swe_cb'


vim +/lev +518 drivers/net/ethernet/huawei/hinic/hinic_eqs.c

746ea35981b1f7 Xue           2019-01-30  502  
746ea35981b1f7 Xue           2019-01-30  503  /**
746ea35981b1f7 Xue           2019-01-30  504   * aeq_irq_handler - handler for the aeq event
746ea35981b1f7 Xue           2019-01-30  505   * @eq: the async event queue of the event
60c099fbda43bc Shaozhengchao 2019-12-16  506   */
746ea35981b1f7 Xue           2019-01-30  507  static bool aeq_irq_handler(struct hinic_eq *eq)
746ea35981b1f7 Xue           2019-01-30  508  {
746ea35981b1f7 Xue           2019-01-30  509  	struct hinic_aeqs *aeqs = aeq_to_aeqs(eq);
746ea35981b1f7 Xue           2019-01-30  510  	struct hinic_aeq_elem *aeqe_pos;
746ea35981b1f7 Xue           2019-01-30  511  	enum hinic_aeq_type event;
746ea35981b1f7 Xue           2019-01-30  512  	enum hinic_aeq_sw_type sw_event;
746ea35981b1f7 Xue           2019-01-30  513  	enum hinic_ucode_event_type ucode_event;
746ea35981b1f7 Xue           2019-01-30  514  	u64 aeqe_data;
746ea35981b1f7 Xue           2019-01-30  515  	u32 aeqe_desc;
746ea35981b1f7 Xue           2019-01-30  516  	u32 i, eqe_cnt = 0;
746ea35981b1f7 Xue           2019-01-30  517  	u8 size;
746ea35981b1f7 Xue           2019-01-30 @518  	u8 lev;
746ea35981b1f7 Xue           2019-01-30  519  
746ea35981b1f7 Xue           2019-01-30  520  	for (i = 0; i < HINIC_TASK_PROCESS_EQE_LIMIT; i++) {
746ea35981b1f7 Xue           2019-01-30  521  		aeqe_pos = GET_CURR_AEQ_ELEM(eq);
746ea35981b1f7 Xue           2019-01-30  522  
746ea35981b1f7 Xue           2019-01-30  523  		/* Data in HW is in Big endian Format */
746ea35981b1f7 Xue           2019-01-30  524  		aeqe_desc = be32_to_cpu(aeqe_pos->desc);
746ea35981b1f7 Xue           2019-01-30  525  
746ea35981b1f7 Xue           2019-01-30  526  		/* HW updates wrapped bit, when it adds eq element event */
746ea35981b1f7 Xue           2019-01-30  527  		if (EQ_ELEM_DESC_GET(aeqe_desc, WRAPPED) == eq->wrapped)
746ea35981b1f7 Xue           2019-01-30  528  			return false;
746ea35981b1f7 Xue           2019-01-30  529  
70ffa6e4fea08c Xue           2019-04-23  530  		/* This memory barrier is needed to keep us from reading
70ffa6e4fea08c Xue           2019-04-23  531  		 * any other fields out of the cmdq wqe until we have
70ffa6e4fea08c Xue           2019-04-23  532  		 * verified the command has been processed and
70ffa6e4fea08c Xue           2019-04-23  533  		 * written back.
70ffa6e4fea08c Xue           2019-04-23  534  		 */
70ffa6e4fea08c Xue           2019-04-23  535  		dma_rmb();
70ffa6e4fea08c Xue           2019-04-23  536  
746ea35981b1f7 Xue           2019-01-30  537  		event = EQ_ELEM_DESC_GET(aeqe_desc, TYPE);
746ea35981b1f7 Xue           2019-01-30  538  		if (EQ_ELEM_DESC_GET(aeqe_desc, SRC)) {
746ea35981b1f7 Xue           2019-01-30  539  			ucode_event = event;
746ea35981b1f7 Xue           2019-01-30  540  			/* SW event uses only the first 8B */
746ea35981b1f7 Xue           2019-01-30  541  			sw_event = ucode_event >= HINIC_NIC_FATAL_ERROR_MAX ?
746ea35981b1f7 Xue           2019-01-30  542  				   HINIC_STATEFULL_EVENT :
746ea35981b1f7 Xue           2019-01-30  543  				   HINIC_STATELESS_EVENT;
746ea35981b1f7 Xue           2019-01-30  544  			aeqe_data = be64_to_cpu((*(u64 *)aeqe_pos->aeqe_data));
70ffa6e4fea08c Xue           2019-04-23  545  			set_bit(HINIC_AEQ_SW_CB_RUNNING,
70ffa6e4fea08c Xue           2019-04-23  546  				&aeqs->aeq_sw_cb_state[sw_event]);
70ffa6e4fea08c Xue           2019-04-23  547  			if (aeqs->aeq_swe_cb[sw_event] &&
70ffa6e4fea08c Xue           2019-04-23  548  			    test_bit(HINIC_AEQ_SW_CB_REG,
70ffa6e4fea08c Xue           2019-04-23  549  			    &aeqs->aeq_sw_cb_state[sw_event])) {
746ea35981b1f7 Xue           2019-01-30  550  				lev = aeqs->aeq_swe_cb[sw_event](aeqs->hwdev,
746ea35981b1f7 Xue           2019-01-30  551  								 ucode_event,
746ea35981b1f7 Xue           2019-01-30  552  								 aeqe_data);
746ea35981b1f7 Xue           2019-01-30  553  			}
70ffa6e4fea08c Xue           2019-04-23  554  			clear_bit(HINIC_AEQ_SW_CB_RUNNING,
70ffa6e4fea08c Xue           2019-04-23  555  				  &aeqs->aeq_sw_cb_state[sw_event]);
746ea35981b1f7 Xue           2019-01-30  556  		} else {
746ea35981b1f7 Xue           2019-01-30  557  			if (event < HINIC_MAX_AEQ_EVENTS) {
746ea35981b1f7 Xue           2019-01-30  558  				size = EQ_ELEM_DESC_GET(aeqe_desc, SIZE);
70ffa6e4fea08c Xue           2019-04-23  559  				set_bit(HINIC_AEQ_HW_CB_RUNNING,
70ffa6e4fea08c Xue           2019-04-23  560  					&aeqs->aeq_hw_cb_state[event]);
70ffa6e4fea08c Xue           2019-04-23  561  				if (aeqs->aeq_hwe_cb[event] &&
70ffa6e4fea08c Xue           2019-04-23  562  				    test_bit(HINIC_AEQ_HW_CB_REG,
70ffa6e4fea08c Xue           2019-04-23  563  				    &aeqs->aeq_hw_cb_state[event]))
746ea35981b1f7 Xue           2019-01-30  564  					aeqs->aeq_hwe_cb[event](aeqs->hwdev,
746ea35981b1f7 Xue           2019-01-30  565  						aeqe_pos->aeqe_data, size);
70ffa6e4fea08c Xue           2019-04-23  566  				clear_bit(HINIC_AEQ_HW_CB_RUNNING,
70ffa6e4fea08c Xue           2019-04-23  567  					  &aeqs->aeq_hw_cb_state[event]);
746ea35981b1f7 Xue           2019-01-30  568  			} else {
746ea35981b1f7 Xue           2019-01-30  569  				sdk_warn(eq->hwdev->dev_hdl,
746ea35981b1f7 Xue           2019-01-30  570  					 "Unknown aeq hw event %d\n", event);
746ea35981b1f7 Xue           2019-01-30  571  			}
746ea35981b1f7 Xue           2019-01-30  572  		}
746ea35981b1f7 Xue           2019-01-30  573  
746ea35981b1f7 Xue           2019-01-30  574  		eq->cons_idx++;
746ea35981b1f7 Xue           2019-01-30  575  
746ea35981b1f7 Xue           2019-01-30  576  		if (eq->cons_idx == eq->eq_len) {
746ea35981b1f7 Xue           2019-01-30  577  			eq->cons_idx = 0;
746ea35981b1f7 Xue           2019-01-30  578  			eq->wrapped = !eq->wrapped;
746ea35981b1f7 Xue           2019-01-30  579  		}
746ea35981b1f7 Xue           2019-01-30  580  
746ea35981b1f7 Xue           2019-01-30  581  		if (++eqe_cnt >= HINIC_EQ_UPDATE_CI_STEP) {
746ea35981b1f7 Xue           2019-01-30  582  			eqe_cnt = 0;
746ea35981b1f7 Xue           2019-01-30  583  			set_eq_cons_idx(eq, HINIC_EQ_NOT_ARMED);
746ea35981b1f7 Xue           2019-01-30  584  		}
746ea35981b1f7 Xue           2019-01-30  585  	}
746ea35981b1f7 Xue           2019-01-30  586  
746ea35981b1f7 Xue           2019-01-30  587  	return true;
746ea35981b1f7 Xue           2019-01-30  588  }
746ea35981b1f7 Xue           2019-01-30  589  

:::::: The code at line 518 was first introduced by commit
:::::: 746ea35981b1f77e988d48642409d73f0470b3eb net: hinic: Add Hardware Abstract Layer

:::::: TO: Xue <xuechaojing@huawei.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
