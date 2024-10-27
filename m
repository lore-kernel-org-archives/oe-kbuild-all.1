Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AFF8F62
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 03:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729998912; cv=none; b=spXBGWDWE7BLS+oOibE+/a/HqgVQ14q11z8dvhrVLNtVGcZOjotd4DMbj9I3dy0eu4DsBzxIW+o7APQfOgH2IRFL4kCCB51ZKE5PrValKWU8zfK5YnzqAJMnw6xJAnp8MFGfReSRlhV/IFOmBPrnCjF24iCNO80acrsCcdayOA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729998912; c=relaxed/simple;
	bh=CCprs+mNp3AecRMbSORU1Zew+mk8b/NjJ5GSvsZnvnU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dezDY8djZHtwGB7PlN4mysKAAsurlu0pneOVcUw65X0E9Rt8Hr+3PJ6Ic1S3sl2WOPE7MDlS8el+bGJyJgLYfYLynuZ8r6D9O35lRanGwEcCLWaXHMUWsRIA5Pwmu73Nii7VXTurkjv3SSdc+QTDQ/9KSkBVgXIFOlCE72xWT+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FL/bVp1M; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FL/bVp1M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729998911; x=1761534911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CCprs+mNp3AecRMbSORU1Zew+mk8b/NjJ5GSvsZnvnU=;
  b=FL/bVp1M4WGvONRf2W8w+bFep/TY2coCjmrEfOrA/hIbngbwu/9YfaVb
   7yUWpYh0+8wV5lpHyKZNBRwM365QZ8HbLAacl5PXi5rhX3/31EixOM85v
   Y+faSxoz4pITHVsQm4WW3/Dldr3TgrpApOL26/YhePCsrYDf0iPNXp8RU
   OZTSJcqspdCKCOElNpy/zC/4UiUHyFFw0ZeolyuLg8GEq72XGKgwHTdDz
   /CeGMevg5lRVR7aj3mWlBTLOMQhxsQTqdH4q8SELfuwLJZkjSznjV/jIb
   Tgbgb0uK7qjcpMbHxSIB7RdS/Wgu+PZORZO4Xas12ANBxDTZHTOJQ3N0d
   Q==;
X-CSE-ConnectionGUID: xnxy6nLzREe1JPEYfKTKzg==
X-CSE-MsgGUID: kTVaVSzYRBGjS2LF1PjCmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52185093"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52185093"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 20:15:08 -0700
X-CSE-ConnectionGUID: sHdSzSHCR82JRL9BNLXCEQ==
X-CSE-MsgGUID: agsWeW8eQxygPFfoPYoeig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="112130178"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Oct 2024 20:15:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4tk7-000aJI-34;
	Sun, 27 Oct 2024 03:15:03 +0000
Date: Sun, 27 Oct 2024 11:14:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jiantao Xiao <xiaojiantao1@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 14233/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_ext.c:29:43: warning:
 implicit conversion from 'enum hclge_ext_opcode_type' to 'enum
 hclge_opcode_type'
Message-ID: <202410271124.8ms7Ma15-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tian,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   412556141b3c12f2f160acc3a09a40c937837ee3
commit: 26f6cbad1a22ab7b8d77b0f84aae9c3aa8e473bc [14233/30000] net: hns3: add supports pfc storm detection and suppression
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241027/202410271124.8ms7Ma15-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271124.8ms7Ma15-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271124.8ms7Ma15-lkp@intel.com/

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
