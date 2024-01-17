Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAB49467
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 07:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705476499; cv=none; b=AbmEfoyl5pXjnxObA6ABfFfTOJl/BCpI/jOXWbNCB2oPLRXBEPlss604qykHdnVX8qB2lkWTSACP48hixzVqSggkLUSGnttxGS+nQ/dtlYwR20RfYUZRFqXrV5NL2ScVf7o8EXlllN0nfMW9wmU01xMqfHcW14PBrksAzRt1x/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705476499; c=relaxed/simple;
	bh=GE5+WRJHYBdFsA501NJMrxDPiYYuEhXzBiCY24hdDP4=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=lNMJH97I92tpfXyLEre29eGHA6TnsKQtHb5fUCmSnolpCSo5ndnmfMtDflUylSYeCAxuo2DxZj23lx3ETkkIkO2Xh9JkevMO4M6VKjDTDWPJPj8PBbkLAf7E9f0fRFjLiapPOgAWL1kk64nHvaAxMdTCvghgp+Wrw8GDttKwvdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U/XryZbT; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/XryZbT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705476496; x=1737012496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GE5+WRJHYBdFsA501NJMrxDPiYYuEhXzBiCY24hdDP4=;
  b=U/XryZbT8rS5F4px8HaXWVOeoQ7XzS9CIvvlcKZJVr4GDkf56ReNwsSi
   95qaDyoVkrAcYH9CtmzfMIMLP9KUSD96vuH0+ZiZWpHRoluoDeJIrB5A7
   9tGI+nkdMwJ1akhSrmME+QZRRESW1YHcoZny/5W85ppLryfEpoGEGvodn
   t7B5UzWTh7Rhr1eXpQM96CMjsB0xra7u0WDiZYNdicrogygz0343zBidg
   n7Uwwa9MWYxRiyioljrYfssaT6Z0UK8l6THTE0gVB76zpj6uc9m1Hn7wm
   UPPO9p/xhrZr6Io+6X4b9NNaU9WBOYIemKibkplk7aF22gQ94Scti4UKP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="397252687"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="397252687"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 23:27:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="787714222"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="787714222"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 16 Jan 2024 23:27:50 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQ0Ky-0001kQ-0i;
	Wed, 17 Jan 2024 07:27:48 +0000
Date: Wed, 17 Jan 2024 15:27:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 21666/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_ext.c:29:43: warning:
 implicit conversion from 'enum hclge_ext_opcode_type' to 'enum
 hclge_opcode_type'
Message-ID: <202401171529.LjkP8vic-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e4bd0053052e24e0c30e34d05ec042203c41976c
commit: 26f6cbad1a22ab7b8d77b0f84aae9c3aa8e473bc [21666/30000] net: hns3: add supports pfc storm detection and suppression
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240117/202401171529.LjkP8vic-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401171529.LjkP8vic-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401171529.LjkP8vic-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h:13,
                    from drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_ext.c:4:
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_ext.c: In function 'hclge_set_pfc_storm_para':
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_ext.c:29:43: warning: implicit conversion from 'enum hclge_ext_opcode_type' to 'enum hclge_opcode_type' [-Wenum-conversion]
      29 |         hclge_cmd_setup_basic_desc(&desc, HCLGE_OPC_CFG_PAUSE_STORM_PARA,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_cmd.h:24:47: note: in definition of macro 'hclge_cmd_setup_basic_desc'
      24 |         hclge_comm_cmd_setup_basic_desc(desc, opcode, is_read)
         |                                               ^~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_ext.c: In function 'hclge_get_pfc_storm_para':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_ext.c:57:43: warning: implicit conversion from 'enum hclge_ext_opcode_type' to 'enum hclge_opcode_type' [-Wenum-conversion]
      57 |         hclge_cmd_setup_basic_desc(&desc, HCLGE_OPC_CFG_PAUSE_STORM_PARA, true);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_cmd.h:24:47: note: in definition of macro 'hclge_cmd_setup_basic_desc'
      24 |         hclge_comm_cmd_setup_basic_desc(desc, opcode, is_read)
         |                                               ^~~~~~


vim +29 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_ext.c

    17	
    18	static int hclge_set_pfc_storm_para(struct hclge_dev *hdev, void *data,
    19					    size_t length)
    20	{
    21		struct hclge_pfc_storm_para_cmd *para_cmd;
    22		struct hnae3_pfc_storm_para *para;
    23		struct hclge_desc desc;
    24		int ret;
    25	
    26		if (length != sizeof(struct hnae3_pfc_storm_para))
    27			return -EINVAL;
    28	
  > 29		hclge_cmd_setup_basic_desc(&desc, HCLGE_OPC_CFG_PAUSE_STORM_PARA,
    30					   false);
    31		para = (struct hnae3_pfc_storm_para *)data;
    32		para_cmd = (struct hclge_pfc_storm_para_cmd *)desc.data;
    33		para_cmd->dir = cpu_to_le32(para->dir);
    34		para_cmd->enable = cpu_to_le32(para->enable);
    35		para_cmd->period_ms = cpu_to_le32(para->period_ms);
    36		para_cmd->times = cpu_to_le32(para->times);
    37		para_cmd->recovery_period_ms = cpu_to_le32(para->recovery_period_ms);
    38	
    39		ret = hclge_cmd_send(&hdev->hw, &desc, 1);
    40		if (ret)
    41			dev_err(&hdev->pdev->dev,
    42				"failed to set pfc storm para, ret = %d\n", ret);
    43		return ret;
    44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
