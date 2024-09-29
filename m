Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E87C1F95A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 07:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727595619; cv=none; b=HqPuaEC5jiJMsfMpFQP7LfYDFXXZQ5FN+anQG+2ScWphLULvslqN17ZBknrl1xYjb1u91mlGJiGqlbZX4kw2VJ+LPCPBtUTgGwORKLKP+jt4836tQ25lKPaFA9toXL7gIIIac5frflWmAPWr1NYsi4Zj1Te3EOM/mJPHVzeMe/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727595619; c=relaxed/simple;
	bh=s+1ZEViU5YHf079+V60nTPLon/LHnUKkQKWNHvl6NlU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SAD6g1+X3syaMHgioD46oL+jav4Stv7t1Lde4KKykAYgGwO5qFYcjVrjxelMz3qeYGcEE9AsZONsaRKculAZeWG9HP8eZOhVljEM5m5heo+bpqOw0aP5NQ6WWxTntzVZS1Hk1p9ZoAhdKU4NDly7Q49mV565emcXrETo/eiK/Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HSdTCBNC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HSdTCBNC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727595617; x=1759131617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s+1ZEViU5YHf079+V60nTPLon/LHnUKkQKWNHvl6NlU=;
  b=HSdTCBNCtpLTvaAjfQYeu/4EyEiwb+dNBVq/E0SU2IsY1uMBL54YbC7s
   1TWIc2nQPnHWWFzRbkel3LLW1kYiAiD/CjEXOvnoWWCDRq6s3dS7ghHj4
   qFDDGR7ve6BH+FQXPWLHqdhJinyKUAYm2xS3gWk/n6n99A6LdPjTdGUFU
   4TagYuKgvejIjl9J/PpG2VWhRgVAawYhreiz1B9jd6OJM5c8hLD3jynkL
   k/RZmWUK8mZ8rg+okjRg0zZJY48sEucOElaEth7CMSPn8m5JR9Z2hF0x5
   UIN3BrsFuDOFJCXkCzO0xfjvQoW2PXKGAJjey8ZyBZnF3zU1iYnQQoKo2
   g==;
X-CSE-ConnectionGUID: 0ZSxPrH2SkaDSxWOJQ24mg==
X-CSE-MsgGUID: UILohC8OQnGxT0meuhQ63g==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="49216384"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="49216384"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 00:40:17 -0700
X-CSE-ConnectionGUID: C39FGjH/RSKApgWrI+sS5g==
X-CSE-MsgGUID: hczBaZjbT6K7b6+PzHg03A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72946417"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Sep 2024 00:40:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suoXN-000O0B-1s;
	Sun, 29 Sep 2024 07:40:13 +0000
Date: Sun, 29 Sep 2024 15:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hao Chen <970353908@qq.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29235/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c:1195:5: sparse:
 sparse: symbol 'hclge_tm_vf_tc_dwrr_cfg' was not declared. Should it be
 static?
Message-ID: <202409291552.pM1zgESs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   dc55753ca59725e5130059dc4c520e8a91c655c0
commit: 518ea89ec98b78c749c27d6ba7792e1bdb5779ed [29235/30000] net: hns3: add support for vf multiple tcs
config: arm64-randconfig-r131-20240925 (https://download.01.org/0day-ci/archive/20240929/202409291552.pM1zgESs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240929/202409291552.pM1zgESs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291552.pM1zgESs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c:1195:5: sparse: sparse: symbol 'hclge_tm_vf_tc_dwrr_cfg' was not declared. Should it be static?

vim +/hclge_tm_vf_tc_dwrr_cfg +1195 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c

  1194	
> 1195	int hclge_tm_vf_tc_dwrr_cfg(struct hclge_vport *vport)
  1196	{
  1197		struct hnae3_knic_private_info *kinfo = &vport->nic.kinfo;
  1198		struct hclge_dev *hdev = vport->back;
  1199		struct hclge_pg_info *pg_info;
  1200		u8 dwrr;
  1201		int ret;
  1202		u32 i;
  1203	
  1204		for (i = 0; i < kinfo->tc_info.max_tc; i++) {
  1205			pg_info = &hdev->tm_info.pg_info[hdev->tm_info.tc_info[i].pgid];
  1206			dwrr = i < kinfo->tc_info.num_tc ? pg_info->tc_dwrr[i] : 0;
  1207			ret = hclge_tm_qs_weight_cfg(hdev, vport->qs_offset + i, dwrr);
  1208			if (ret)
  1209				return ret;
  1210		}
  1211	
  1212		return 0;
  1213	}
  1214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
