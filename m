Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4732EF51B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 19:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712603112; cv=none; b=Ho5GhpSX0Zgx5grnu+3ZGFL3e57Kj0cTkWL5fNu2T5sSYtrqT/aycthEmNfU7pmDmuMe3rdgWO/yKOepydMCPqBx/7J/fLERmfjmvzp38b4wTPRyubxWazOAs23KC84NJmnuL1zPcj6heUMA8phNt8MQeg/W2t/7Pt3mZk3DFJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712603112; c=relaxed/simple;
	bh=dD1mqmHE/RZzB2gZaw9sjPwBPeFmOSAleGnXLSAL3Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gKWc3JUNWw05H8YuRFFDNwjbWaQ4q0vhQpQLxedhcovB1GKZuFf4ascWm/JocYZMHAKWyo5xuxPt9mNUSnDrHPssabeyStBs3sEJohOk9ocjTKwezRB6kxc13PM92Dn84x194f5dSFbh/KtUL2ZSSMQR+yjR87Fn/Q8C0ib1yuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YdR7hQeF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YdR7hQeF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712603110; x=1744139110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dD1mqmHE/RZzB2gZaw9sjPwBPeFmOSAleGnXLSAL3Ng=;
  b=YdR7hQeFqvZHRBlVtwgO3L4EFEHGaYD/DIB6bVg8NlenAjrMFnWzOCLE
   tUuQ2MHxBkXpuIk0GLGYLpEsY7VyTCOmSVlbZMR4ad1ShfX3FOcGTqzpm
   2tEPfI9pASTZOGiW4O0oQVUteOa1MGUhzPqphoWlWTAgqfIZM8r/S+Ixt
   ekSMfdAhkDhcjXYxuTIWqezdFda3/tomADMkXAqvzAej7ff4w35iuIo1V
   9KmsIsbysMrTOygqngC5Il/3uveOjKaCOA6bMOmOnJtWCKmKbZcN0d2ir
   3oTqsfKJ8zSakClhshJenmiX/CcqT792D04uivjrR77XlRHPaEtmNbqJv
   Q==;
X-CSE-ConnectionGUID: BIpfRyYtSQGioB4gsKT/Wg==
X-CSE-MsgGUID: ABC9NmSMTzGxmglYbyJkPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="10874339"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="10874339"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 12:05:03 -0700
X-CSE-ConnectionGUID: +8NHuNIITNi0qY2OBVO1GQ==
X-CSE-MsgGUID: WeqUEQDiQmaSuGE+D1w81A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="19893887"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Apr 2024 12:05:02 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtuId-0005RK-01;
	Mon, 08 Apr 2024 19:04:59 +0000
Date: Tue, 9 Apr 2024 03:04:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jiantao Xiao <xiaojiantao1@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 6900/7311]
 drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_cmd.c:475:60:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202404090328.GBESI86e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   05607873db411ec3c614313b43cec60138c26a99
commit: 676df2864a908565710282838af4f392acb9ebd4 [6900/7311] net: hns3: add command queue trace for hns3
config: loongarch-randconfig-r113-20240408 (https://download.01.org/0day-ci/archive/20240409/202404090328.GBESI86e-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240409/202404090328.GBESI86e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404090328.GBESI86e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_cmd.c:475:60: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] opcode @@     got restricted __le16 [usertype] opcode @@
   drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_cmd.c:475:60: sparse:     expected unsigned short [usertype] opcode
   drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_cmd.c:475:60: sparse:     got restricted __le16 [usertype] opcode
   drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_cmd.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:245:46: sparse: sparse: self-comparison always evaluates to false
--
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, ...):
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/./hclge_trace.h:132:1: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_trace.h):
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/./hclge_trace.h:132:1: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:245:46: sparse: sparse: self-comparison always evaluates to false

vim +475 drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_cmd.c

   462	
   463	/**
   464	 * hclge_comm_cmd_send - send command to command queue
   465	 * @hw: pointer to the hw struct
   466	 * @desc: prefilled descriptor for describing the command
   467	 * @num : the number of descriptors to be sent
   468	 *
   469	 * This is the main send command for command queue, it
   470	 * sends the queue, cleans the queue, etc
   471	 **/
   472	int hclge_comm_cmd_send(struct hclge_comm_hw *hw, struct hclge_desc *desc,
   473				int num)
   474	{
 > 475		bool is_special = hclge_comm_is_special_opcode(desc->opcode);
   476		struct hclge_comm_cmq_ring *csq = &hw->cmq.csq;
   477		int ret;
   478		int ntc;
   479	
   480		if (hw->cmq.ops.trace_cmd_send)
   481			hw->cmq.ops.trace_cmd_send(hw, desc, num, is_special);
   482	
   483		spin_lock_bh(&hw->cmq.csq.lock);
   484	
   485		if (test_bit(HCLGE_COMM_STATE_CMD_DISABLE, &hw->comm_state)) {
   486			spin_unlock_bh(&hw->cmq.csq.lock);
   487			return -EBUSY;
   488		}
   489	
   490		if (num > hclge_comm_ring_space(&hw->cmq.csq)) {
   491			/* If CMDQ ring is full, SW HEAD and HW HEAD may be different,
   492			 * need update the SW HEAD pointer csq->next_to_clean
   493			 */
   494			csq->next_to_clean =
   495				hclge_comm_read_dev(hw, HCLGE_COMM_NIC_CSQ_HEAD_REG);
   496			spin_unlock_bh(&hw->cmq.csq.lock);
   497			return -EBUSY;
   498		}
   499	
   500		/**
   501		 * Record the location of desc in the ring for this time
   502		 * which will be use for hardware to write back
   503		 */
   504		ntc = hw->cmq.csq.next_to_use;
   505	
   506		hclge_comm_cmd_copy_desc(hw, desc, num);
   507	
   508		/* Write to hardware */
   509		hclge_comm_write_dev(hw, HCLGE_COMM_NIC_CSQ_TAIL_REG,
   510				     hw->cmq.csq.next_to_use);
   511	
   512		ret = hclge_comm_cmd_check_result(hw, desc, num, ntc);
   513	
   514		spin_unlock_bh(&hw->cmq.csq.lock);
   515	
   516		if (hw->cmq.ops.trace_cmd_get)
   517			hw->cmq.ops.trace_cmd_get(hw, desc, num, is_special);
   518	
   519		return ret;
   520	}
   521	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
