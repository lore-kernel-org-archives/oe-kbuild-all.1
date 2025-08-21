Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4EC482FF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 17:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755798472; cv=none; b=jFi3uD2H7Hlo4dMjv/bR7qjIa3b1f6wf7oqQ7gxQYtUQeX80kl/Y3l9NgJwIkRTiMQNlzGrxRXp2/3UuMlbvxHFEWOctfvntcE1BHCU5NHcf/vhA3GIpWjAQuUdTK88fsTdUT0glN3kVPBJuxmgcsTfvpKbwZMRqbc+L9t+2Ea8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755798472; c=relaxed/simple;
	bh=r8TGLw8tq75oq5HqqilzaTST2+ZIE+VNnGwD0ciIF6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y5+QEWutkWcztGALFAuoZtnWcAQ8lJcxP6+RSTI9KHmVpIBxC/hCsv1KdJmxPDlaZIb9Oglb2xkOwFR/ENP+78YEc0ARwTDXwmxIwpahmTr+7r1nSth0ynTXBKUgG1wrrxFvi17KkCORaKRaPimHaQ4bz1l9R0/I6ffNUaKfni4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QvJ1gDsY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QvJ1gDsY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755798470; x=1787334470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r8TGLw8tq75oq5HqqilzaTST2+ZIE+VNnGwD0ciIF6E=;
  b=QvJ1gDsYfYOkQ10n6R88SC0ZUddDi38Y8yKc1loIHUhy9HQ3ULi4Gx+q
   t8fOV8h6Wxv+hG2uNWeNe/dxTykzpgSo0We9UsKXwsClb+nSKgcVJ02kL
   ZBFryudbgxi1V3n+EBljpE+QiV8oqgcN/fgsSesj2W7Nl+8UialrTLH0M
   rGUBEmNKxSXL9Fi//yzLKVBwDWQXs4GhC79tY6+3n/mAwdAdRN0u1rkUz
   DJXjnjk/ukfns04pN32Ga6M3GvwE/+/61S/RTx9LBe4bhbwtQCCdHsN6j
   3xMuCJn1oWKskLM07Tm8wS563cyDN3kLZX8z7RWG3xbf5QDaEqGj9Slg6
   A==;
X-CSE-ConnectionGUID: cd1RfkZXTfe7UhzdITsfWg==
X-CSE-MsgGUID: 5D6Re7r9TEKL1b9651wrFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68806054"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="68806054"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 10:47:49 -0700
X-CSE-ConnectionGUID: 4LNokpJ2QKCS6+tvspvg5w==
X-CSE-MsgGUID: 6KHBrndvTe63ErJhAzaXiQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 21 Aug 2025 10:47:48 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up9O6-0001mp-0G;
	Thu, 21 Aug 2025 17:47:46 +0000
Date: Thu, 21 Aug 2025 19:47:12 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2700/2700]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c:1652:44: warning:
 variable 'req3' set but not used
Message-ID: <202508211956.9IhbkZmD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   65a146fa77b5cff9bb07725ed7ccabb9670bfb54
commit: bc1a3cc2f19671a50ec92172b875e9b0344b7b54 [2700/2700] net: hns3: refactor the debugfs for dumping FD tcam
config: x86_64-buildonly-randconfig-2001-20250821 (https://download.01.org/0day-ci/archive/20250821/202508211956.9IhbkZmD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508211956.9IhbkZmD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508211956.9IhbkZmD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c: In function 'hclge_query_rules_valid':
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c:1652:44: warning: variable 'req3' set but not used [-Wunused-but-set-variable]
    1652 |         struct hclge_fd_tcam_config_3_cmd *req3;
         |                                            ^~~~
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c:1651:44: warning: variable 'req2' set but not used [-Wunused-but-set-variable]
    1651 |         struct hclge_fd_tcam_config_2_cmd *req2;
         |                                            ^~~~


vim +/req3 +1652 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c

  1646	
  1647	static int hclge_query_rules_valid(struct hclge_dev *hdev, u8 stage, u32 loc)
  1648	{
  1649	#define HCLGE_TCAM_SELECTION_X	1
  1650		struct hclge_fd_tcam_config_1_cmd *req1;
> 1651		struct hclge_fd_tcam_config_2_cmd *req2;
> 1652		struct hclge_fd_tcam_config_3_cmd *req3;
  1653		struct hclge_desc desc[3];
  1654		int ret;
  1655	
  1656		hclge_cmd_setup_basic_desc(&desc[0], HCLGE_OPC_FD_TCAM_OP, true);
  1657		desc[0].flag |= cpu_to_le16(HCLGE_COMM_CMD_FLAG_NEXT);
  1658		hclge_cmd_setup_basic_desc(&desc[1], HCLGE_OPC_FD_TCAM_OP, true);
  1659		desc[1].flag |= cpu_to_le16(HCLGE_COMM_CMD_FLAG_NEXT);
  1660		hclge_cmd_setup_basic_desc(&desc[2], HCLGE_OPC_FD_TCAM_OP, true);
  1661	
  1662		req1 = (struct hclge_fd_tcam_config_1_cmd *)desc[0].data;
  1663		req2 = (struct hclge_fd_tcam_config_2_cmd *)desc[1].data;
  1664		req3 = (struct hclge_fd_tcam_config_3_cmd *)desc[2].data;
  1665	
  1666		req1->stage = stage;
  1667		req1->xy_sel = HCLGE_TCAM_SELECTION_X;
  1668		req1->index = cpu_to_le32(loc);
  1669	
  1670		ret = hclge_cmd_send(&hdev->hw, desc, 3);
  1671		if (ret) {
  1672			dev_err(&hdev->pdev->dev,
  1673				"failed to read tcam status, ret = %d\n", ret);
  1674			return ret;
  1675		}
  1676	
  1677		return req1->entry_vld;
  1678	}
  1679	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
