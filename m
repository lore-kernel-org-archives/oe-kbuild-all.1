Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4405188CC6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 23:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727478054; cv=none; b=m5MpTBttuykwXTR66RjV3hlD/qrdQ4sFTBX4HECte73pI6Ye+pZ5TcOWca6VoPrtBEglJM5X65yGjrY2MhYvgw4L8eMTwC1zHK3UA9aM3Y/bvE+X/b+0b3dN0qRN8fe2tOMAygaZENfE90Poehf175SKN9UCI7Uj1Ev9XC+ucKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727478054; c=relaxed/simple;
	bh=JvamDYGBWo0VdGjsHy7tfwMRgR7ljf8v4MNWefGrlcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uNABVASOpZkHlO1L8tebaTuFejxCvsegXBe7KqY9ZgIuZixGwfudwl7znY8TgEUdfGT6eF/NvmZbWqXzr8LIVCzhcctK8KBdvBY9F8PMLtTNNw1Yok9AeDy424AbRn48HqB9SF9/8wgNdi/ocaOyKznTaIBzvOxXTdMAp0a4B1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCoDwC9s; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCoDwC9s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727478053; x=1759014053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JvamDYGBWo0VdGjsHy7tfwMRgR7ljf8v4MNWefGrlcI=;
  b=PCoDwC9sR2NczWurF4cQvyGCiGidN5TYrPkta43CkdgLMgjYrZnx114k
   kDJbxInUV6tiLga41pnlXINRQUtRfhyfxzo3weepi66jqJ97ujpmMo1H7
   dIc8XLLSDfXxH0zWnI4pImJVfr8YnJd7z9fvw5uBlXv4/iuuc4SdE5cTl
   JbzbjmRfl8+OiZxnY8ocVToXPOQF4tAaExETcb+Avwz35O51JU5pafufZ
   mS7iSOfI134YuOrb5D+BM3tk5jgcKgI1L9WuTT3ojyQBBy87GlWKjXPrX
   zq0JevMJNCbBFWSC0gkQwhUc44gqRb0RsTMd4DyrfBz8KK2aIv8gT8m5R
   A==;
X-CSE-ConnectionGUID: eEZK6WvmTfm+MFydhY8I2Q==
X-CSE-MsgGUID: jK3Gx/lSQwWY8inOGEQsOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37218957"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="37218957"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 16:00:52 -0700
X-CSE-ConnectionGUID: 95dT2EyqSMK8czOTRZH3zQ==
X-CSE-MsgGUID: NxJ4XPXFQK20soJxeuAzzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="73467122"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Sep 2024 16:00:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suJxA-000Mi3-0g;
	Fri, 27 Sep 2024 23:00:48 +0000
Date: Sat, 28 Sep 2024 07:00:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 13190/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_mbx.c:385:58: sparse:
 sparse: incorrect type in argument 2 (different base types)
Message-ID: <202409280619.HevoAR3n-lkp@intel.com>
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
commit: 29ecb19fc3e567091641824b91a6019cc1eb8154 [13190/30000] net: hns3: add queue bonding mode support for VF
config: arm64-randconfig-r131-20240925 (https://download.01.org/0day-ci/archive/20240928/202409280619.HevoAR3n-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240928/202409280619.HevoAR3n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280619.HevoAR3n-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_mbx.c:385:58: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] qb_state @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_mbx.c:385:58: sparse:     expected unsigned short [usertype] qb_state
   drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_mbx.c:385:58: sparse:     got restricted __le16 [usertype]

vim +385 drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_mbx.c

   305	
   306	void hclgevf_mbx_async_handler(struct hclgevf_dev *hdev)
   307	{
   308		struct hclge_mbx_port_base_vlan *vlan_info;
   309		struct hclge_mbx_link_status *link_info;
   310		struct hclge_mbx_link_mode *link_mode;
   311		enum hnae3_reset_type reset_type;
   312		u16 link_status, state;
   313		__le16 *msg_q;
   314		u16 opcode;
   315		u8 duplex;
   316		u32 speed;
   317		u32 tail;
   318		u8 flag;
   319		u16 idx;
   320	
   321		tail = hdev->arq.tail;
   322	
   323		/* process all the async queue messages */
   324		while (tail != hdev->arq.head) {
   325			if (test_bit(HCLGE_COMM_STATE_CMD_DISABLE,
   326				     &hdev->hw.hw.comm_state)) {
   327				dev_info(&hdev->pdev->dev,
   328					 "vf crq need init in async\n");
   329				return;
   330			}
   331	
   332			msg_q = hdev->arq.msg_q[hdev->arq.head];
   333			opcode = le16_to_cpu(msg_q[0]);
   334			switch (opcode) {
   335			case HCLGE_MBX_LINK_STAT_CHANGE:
   336				link_info = (struct hclge_mbx_link_status *)(msg_q + 1);
   337				link_status = le16_to_cpu(link_info->link_status);
   338				speed = le32_to_cpu(link_info->speed);
   339				duplex = (u8)le16_to_cpu(link_info->duplex);
   340				flag = link_info->flag;
   341	
   342				/* update upper layer with new link link status */
   343				hclgevf_update_speed_duplex(hdev, speed, duplex);
   344				hclgevf_update_link_status(hdev, link_status);
   345	
   346				if (flag & HCLGE_MBX_PUSH_LINK_STATUS_EN)
   347					set_bit(HCLGEVF_STATE_PF_PUSH_LINK_STATUS,
   348						&hdev->state);
   349	
   350				break;
   351			case HCLGE_MBX_LINK_STAT_MODE:
   352				link_mode = (struct hclge_mbx_link_mode *)(msg_q + 1);
   353				idx = le16_to_cpu(link_mode->idx);
   354				if (idx)
   355					hdev->hw.mac.supported =
   356						le64_to_cpu(link_mode->link_mode);
   357				else
   358					hdev->hw.mac.advertising =
   359						le64_to_cpu(link_mode->link_mode);
   360				break;
   361			case HCLGE_MBX_ASSERTING_RESET:
   362				/* PF has asserted reset hence VF should go in pending
   363				 * state and poll for the hardware reset status till it
   364				 * has been completely reset. After this stack should
   365				 * eventually be re-initialized.
   366				 */
   367				reset_type =
   368					(enum hnae3_reset_type)le16_to_cpu(msg_q[1]);
   369				set_bit(reset_type, &hdev->reset_pending);
   370				set_bit(HCLGEVF_RESET_PENDING, &hdev->reset_state);
   371				hclgevf_reset_task_schedule(hdev);
   372	
   373				break;
   374			case HCLGE_MBX_PUSH_VLAN_INFO:
   375				vlan_info =
   376					(struct hclge_mbx_port_base_vlan *)(msg_q + 1);
   377				state = le16_to_cpu(vlan_info->state);
   378				hclgevf_update_port_base_vlan_info(hdev, state,
   379								   vlan_info);
   380				break;
   381			case HCLGE_MBX_PUSH_PROMISC_INFO:
   382				hclgevf_parse_promisc_info(hdev, le16_to_cpu(msg_q[1]));
   383				break;
   384			case HCLGE_MBX_PUSH_QB_STATE:
 > 385				hclgevf_parse_qb_info(hdev, msg_q[1]);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
