Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5588B14265C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 16:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712594212; cv=none; b=nt7clrpaKL8w6vmYI/cjw1uPsNxbRwD8m6dkQ5AgskC5poIjxLkNpx1r8Af2Y2QBjT/EKpVXqLg4PJS2RjFHSulSH1YpBRV1eZLUglvqpW+zYx+d3gLOEaokGmLoPUMBAmUViylSQ24MokJUcqBf5VrWFHZ1A78hIIn5/jsi5Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712594212; c=relaxed/simple;
	bh=+pmIep3TvzQwwlJIDJLQBB4tRJFLj2QxgeZ3I4s9HtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qM39kXa6UIYUyslJ7KVhIhtD/r0gmydN/R2k/MhvGt/goQIZ+LBZLIXLCm06nBRNT27AWoBqkNskt4/GScvXhxtZ3MDeSkuQCAJZxLVieZ+EbgBaQ9n7VltEEioyP5EDbjYoLwMM2HKsdrL9P7M8dqLgijeTZrUuzV7yBQwKKXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=frtvCPKv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frtvCPKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712594210; x=1744130210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+pmIep3TvzQwwlJIDJLQBB4tRJFLj2QxgeZ3I4s9HtE=;
  b=frtvCPKvBmu8QHlOpuG7gSGk7KU062ZA9R8XE33eO+1jw79FHVUbKgYh
   +lNQdckU0bB4fgS8hebFrpX3kkorgagFuFeCRiXlyCgi3VWTLBYGa+eSV
   BcncbbRcg5xmcXwYhdXKgFYyz5ZQsllr6LDU0oeY4vTY5Vk5vG8h7wh7E
   4bE/OVKX5PVYzdiY9riRU4qKgiSLNSRZJ7Su0dh+wt+FRuPRz39sSgCL2
   ju439N89BMst0Vn62OdvJWn2LU8htEc1IXwTZ1tBd9nqa0FeUeAzpbYXZ
   0PrM34ccpPJlFSX/idLimxLD7W3J94ft0PeIcbtwBaX5+Pg1T5uH42fTf
   A==;
X-CSE-ConnectionGUID: W5Ihjj/bQmCKVSdQjbq4fg==
X-CSE-MsgGUID: p9E0tbmLTDu9gQGEmZmk4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7726870"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7726870"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 09:36:50 -0700
X-CSE-ConnectionGUID: eudwn33mSh+G2yDj5OoZSA==
X-CSE-MsgGUID: RdIuoz9WRYGCnDMopPorPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="51130454"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Apr 2024 09:36:49 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtrzC-0005MV-1Y;
	Mon, 08 Apr 2024 16:36:46 +0000
Date: Tue, 9 Apr 2024 00:35:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jiantao Xiao <xiaojiantao1@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 6892/7311]
 drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_mbx.c:392:58: sparse:
 sparse: incorrect type in argument 2 (different base types)
Message-ID: <202404090038.WzHqywzr-lkp@intel.com>
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
commit: 285f988e9d3a42d5aebb6c5012937771a7dbd4f7 [6892/7311] net: hns3: add queue bonding mode support for VF
config: loongarch-randconfig-r113-20240408 (https://download.01.org/0day-ci/archive/20240409/202404090038.WzHqywzr-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240409/202404090038.WzHqywzr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404090038.WzHqywzr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_mbx.c:392:58: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] qb_state @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_mbx.c:392:58: sparse:     expected unsigned short [usertype] qb_state
   drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_mbx.c:392:58: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_mbx.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:245:46: sparse: sparse: self-comparison always evaluates to false

vim +392 drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_mbx.c

   312	
   313	void hclgevf_mbx_async_handler(struct hclgevf_dev *hdev)
   314	{
   315		struct hclge_mbx_port_base_vlan *vlan_info;
   316		struct hclge_mbx_link_status *link_info;
   317		struct hclge_mbx_link_mode *link_mode;
   318		enum hnae3_reset_type reset_type;
   319		u16 link_status, state;
   320		__le16 *msg_q;
   321		u16 opcode;
   322		u8 duplex;
   323		u32 speed;
   324		u32 tail;
   325		u8 flag;
   326		u16 idx;
   327	
   328		tail = hdev->arq.tail;
   329	
   330		/* process all the async queue messages */
   331		while (tail != hdev->arq.head) {
   332			if (test_bit(HCLGE_COMM_STATE_CMD_DISABLE,
   333				     &hdev->hw.hw.comm_state)) {
   334				dev_info(&hdev->pdev->dev,
   335					 "vf crq need init in async\n");
   336				return;
   337			}
   338	
   339			msg_q = hdev->arq.msg_q[hdev->arq.head];
   340			opcode = le16_to_cpu(msg_q[0]);
   341			switch (opcode) {
   342			case HCLGE_MBX_LINK_STAT_CHANGE:
   343				link_info = (struct hclge_mbx_link_status *)(msg_q + 1);
   344				link_status = le16_to_cpu(link_info->link_status);
   345				speed = le32_to_cpu(link_info->speed);
   346				duplex = (u8)le16_to_cpu(link_info->duplex);
   347				flag = link_info->flag;
   348	
   349				/* update upper layer with new link link status */
   350				hclgevf_update_speed_duplex(hdev, speed, duplex);
   351				hclgevf_update_link_status(hdev, link_status);
   352	
   353				if (flag & HCLGE_MBX_PUSH_LINK_STATUS_EN)
   354					set_bit(HCLGEVF_STATE_PF_PUSH_LINK_STATUS,
   355						&hdev->state);
   356	
   357				break;
   358			case HCLGE_MBX_LINK_STAT_MODE:
   359				link_mode = (struct hclge_mbx_link_mode *)(msg_q + 1);
   360				idx = le16_to_cpu(link_mode->idx);
   361				if (idx)
   362					hdev->hw.mac.supported =
   363						le64_to_cpu(link_mode->link_mode);
   364				else
   365					hdev->hw.mac.advertising =
   366						le64_to_cpu(link_mode->link_mode);
   367				break;
   368			case HCLGE_MBX_ASSERTING_RESET:
   369				/* PF has asserted reset hence VF should go in pending
   370				 * state and poll for the hardware reset status till it
   371				 * has been completely reset. After this stack should
   372				 * eventually be re-initialized.
   373				 */
   374				reset_type =
   375					(enum hnae3_reset_type)le16_to_cpu(msg_q[1]);
   376				set_bit(reset_type, &hdev->reset_pending);
   377				set_bit(HCLGEVF_RESET_PENDING, &hdev->reset_state);
   378				hclgevf_reset_task_schedule(hdev);
   379	
   380				break;
   381			case HCLGE_MBX_PUSH_VLAN_INFO:
   382				vlan_info =
   383					(struct hclge_mbx_port_base_vlan *)(msg_q + 1);
   384				state = le16_to_cpu(vlan_info->state);
   385				hclgevf_update_port_base_vlan_info(hdev, state,
   386								   vlan_info);
   387				break;
   388			case HCLGE_MBX_PUSH_PROMISC_INFO:
   389				hclgevf_parse_promisc_info(hdev, le16_to_cpu(msg_q[1]));
   390				break;
   391			case HCLGE_MBX_PUSH_QB_STATE:
 > 392				hclgevf_parse_qb_info(hdev, msg_q[1]);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
