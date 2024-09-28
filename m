Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B4317C95
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 19:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727550092; cv=none; b=D8LjrhVgisxAIEW1b4HqW1gXT/72YEPIBfpkLLr3zhuqb0GhfAxSCNIqY1oZGGGriYNVoT1Az4zVx2NeAn8IsU9A+lby9/qttJ1KXjA3NsYBeNqBYtqPIFP88gE88lYeDHmOjsXoXZK8xyahEyjs7WrLoGW73NAD098fdkvTSxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727550092; c=relaxed/simple;
	bh=2Z2V9LFFta+2FTgjMETkD8IF/7+gpb1emzzvi3DjI8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KVhFSlsCI8tYKTnRb9lUzGUGQRY2RHSscu+SAC73HZkPM+K6xgaxGMt2djnQ3F2VGDtczHTWJi0QCJw3aXpQwzj4CJ0I/lHoUC7GUtuaHlN1DmU20PIEZvGkjqY/mwX7fkow3+5E5ySkjdTaPYALDOxKWY9cauNXs54/1oHbypI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eweMo3pV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eweMo3pV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727550090; x=1759086090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Z2V9LFFta+2FTgjMETkD8IF/7+gpb1emzzvi3DjI8I=;
  b=eweMo3pVBjXrqp5cHw8DTljQblPaRXeJT7G9flThJFwlRV3Q14rxPx9S
   5rf8hShCwPdskI/fK0i5TKz5epYBSVMVsEhEq3F/W0Xu2DGRDvRfSCzxm
   BsKH9yOZjXfQKS5w5dzAYvt8tyzqMonDXtpVwOVXoXeqf/VdvxtscHBDM
   dbigcXjoL7WIuJW4jlDozY//CfqgPkdDIaY1r4DHWGbjsjfMwz4mLyMVB
   yYhKZ7TYmlQrTHwlu9toGIIzoeUYKSmwYCmhkjcTXla6Lx5GOb8tQeNqc
   hEkrJR7Hb36C9Xu+MKWBAaZtVyvaVFjOaevhTQwrxieG5Z84dPTxUJlqZ
   A==;
X-CSE-ConnectionGUID: 8pfS5xIfQEC0rtA3dcAVuA==
X-CSE-MsgGUID: Y4/H84LGTu6R0vIe9XxhnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26144619"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26144619"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 12:01:29 -0700
X-CSE-ConnectionGUID: AmbXwBILSXiWD+2POY65ew==
X-CSE-MsgGUID: U3HlqbILSmmb8AUxSQ+T4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="77798155"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Sep 2024 12:01:28 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1such3-000NXL-1v;
	Sat, 28 Sep 2024 19:01:25 +0000
Date: Sun, 29 Sep 2024 03:00:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jiantao Xiao <xiaojiantao1@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 21044/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_cmd.c:478:68:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202409290215.32P52XtH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bef6f06e039b8929481350d15d6d8c3ba81c6fd2
commit: 7906c655c7b6e8bd68a7e7ee2455d9a8d8622fa9 [21044/30000] net: hns3: add command queue trace for hns3
config: arm64-randconfig-r131-20240925 (https://download.01.org/0day-ci/archive/20240929/202409290215.32P52XtH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240929/202409290215.32P52XtH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290215.32P52XtH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_cmd.c:478:68: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] opcode @@     got restricted __le16 [usertype] opcode @@
   drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_cmd.c:478:68: sparse:     expected unsigned short [usertype] opcode
   drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_cmd.c:478:68: sparse:     got restricted __le16 [usertype] opcode
   drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_cmd.c:514:67: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] opcode @@     got restricted __le16 [usertype] opcode @@
   drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_cmd.c:514:67: sparse:     expected unsigned short [usertype] opcode
   drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_cmd.c:514:67: sparse:     got restricted __le16 [usertype] opcode
--
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, ...):
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/./hclge_trace.h:132:1: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_trace.h):
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/./hclge_trace.h:132:1: sparse: sparse: cast to restricted __le32

vim +478 drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_cmd.c

   461	
   462	/**
   463	 * hclge_comm_cmd_send - send command to command queue
   464	 * @hw: pointer to the hw struct
   465	 * @desc: prefilled descriptor for describing the command
   466	 * @num : the number of descriptors to be sent
   467	 *
   468	 * This is the main send command for command queue, it
   469	 * sends the queue, cleans the queue, etc
   470	 **/
   471	int hclge_comm_cmd_send(struct hclge_comm_hw *hw, struct hclge_desc *desc,
   472				int num)
   473	{
   474		struct hclge_comm_cmq_ring *csq = &hw->cmq.csq;
   475		int ret;
   476		int ntc;
   477		trace_hclge_comm_cmd_send(hw, desc, num,
 > 478					  hclge_comm_is_special_opcode(desc->opcode));
   479	
   480		spin_lock_bh(&hw->cmq.csq.lock);
   481	
   482		if (test_bit(HCLGE_COMM_STATE_CMD_DISABLE, &hw->comm_state)) {
   483			spin_unlock_bh(&hw->cmq.csq.lock);
   484			return -EBUSY;
   485		}
   486	
   487		if (num > hclge_comm_ring_space(&hw->cmq.csq)) {
   488			/* If CMDQ ring is full, SW HEAD and HW HEAD may be different,
   489			 * need update the SW HEAD pointer csq->next_to_clean
   490			 */
   491			csq->next_to_clean =
   492				hclge_comm_read_dev(hw, HCLGE_COMM_NIC_CSQ_HEAD_REG);
   493			spin_unlock_bh(&hw->cmq.csq.lock);
   494			return -EBUSY;
   495		}
   496	
   497		/**
   498		 * Record the location of desc in the ring for this time
   499		 * which will be use for hardware to write back
   500		 */
   501		ntc = hw->cmq.csq.next_to_use;
   502	
   503		hclge_comm_cmd_copy_desc(hw, desc, num);
   504	
   505		/* Write to hardware */
   506		hclge_comm_write_dev(hw, HCLGE_COMM_NIC_CSQ_TAIL_REG,
   507				     hw->cmq.csq.next_to_use);
   508	
   509		ret = hclge_comm_cmd_check_result(hw, desc, num, ntc);
   510	
   511		spin_unlock_bh(&hw->cmq.csq.lock);
   512	
   513		trace_hclge_comm_cmd_get(hw, desc, num,
   514					 hclge_comm_is_special_opcode(desc->opcode));
   515		return ret;
   516	}
   517	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
