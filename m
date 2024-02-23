Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AEC5CBD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 00:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708649451; cv=none; b=bYEVoSE9Gmba5Uh47zE7oatjRYQv4c8SpnL/U/gqmXPQAV5AUDarWXpEYSHVTt4T86aL/NE9fMnAoRheGzDRBraY03DRYa4+HUf+tpxtn6pClxoNLG6qb462uXE9LMSAAgwra/JfOxfEf/DRdX+3dYUIJOIa1gna5fsEMWRA0Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708649451; c=relaxed/simple;
	bh=rjwYYQVl7wuLwXNJ96xcgvAV+2hAW1Xx5s11o1VuWHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SSEPbdv2TWLWZoUXUP170VcNbXF2sWfOXQ+9b/49vwjFhCgvLMpgOf7/fg1GJb/KIQmtsrIlzvLK0fs0PymcgrvkEFB2YXFeJc6BFJV215qSCMwSZg+Nm2G2nYrp9YRWIfsvHwu9NVMC2LPIc00g/+P23qgpVKmHmiEighFzsRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iD12xz3p; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iD12xz3p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708649449; x=1740185449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rjwYYQVl7wuLwXNJ96xcgvAV+2hAW1Xx5s11o1VuWHo=;
  b=iD12xz3pK6vyLDb544dOuueuqPRrZxe/p2OsQ2mlhzlkwnixI3g4bIlZ
   +TBWlqU15T/d9WRRpfBfY5b/RZ064hRMRn1LM4coJbnf2WRJXyMNto9ca
   6qsY7gMNPG376lAnvJN5jHQTt5hvHv/YOL/Hcjq8UuMOSLoEMWPKQZOIf
   Bt1/oPeKafk1cPBKefR9g1swqT7/okIgBjLAqHlXAoA0C09W3id44BvD7
   Jr2ZJj2iJHP3JzbwVus79iLtO11G4pPe1ZR2vMSb6Fjv10J97dXn/hgNc
   rWXEqb/q37tHmdyJVr2bCUg9L2wCFH6w8mMlApxbTRy0a7BYA4+4zCL4n
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="13633160"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="13633160"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 16:50:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="28896218"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Feb 2024 16:50:45 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdJlz-0006ry-1W;
	Fri, 23 Feb 2024 00:50:43 +0000
Date: Fri, 23 Feb 2024 08:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:2781:13: warning:
 'hns3_set_rx_skb_rss_type' defined but not used
Message-ID: <202402230817.XXED7vlX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: ba4d94dd5d526ab9b0081fb0af71fabe6aca8b6e Hawei TM280 ethernet card can't resolve ipip internal packet, this cause to packet hash to the same cpu. Mask the call of hns3_set_rx_skb_rss_type function, let protocal stack calculate hash value, this will scatter packet to different cpu.
date:   1 year, 2 months ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240223/202402230817.XXED7vlX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402230817.XXED7vlX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402230817.XXED7vlX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:2781:13: warning: 'hns3_set_rx_skb_rss_type' defined but not used [-Wunused-function]
    2781 | static void hns3_set_rx_skb_rss_type(struct hns3_enet_ring *ring,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/hns3_set_rx_skb_rss_type +2781 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c

^590eaf1fec755 Kaixu Xia 2021-03-16  2780  
^590eaf1fec755 Kaixu Xia 2021-03-16 @2781  static void hns3_set_rx_skb_rss_type(struct hns3_enet_ring *ring,
^590eaf1fec755 Kaixu Xia 2021-03-16  2782  				     struct sk_buff *skb, u32 rss_hash)
^590eaf1fec755 Kaixu Xia 2021-03-16  2783  {
^590eaf1fec755 Kaixu Xia 2021-03-16  2784  	struct hnae3_handle *handle = ring->tqp->handle;
^590eaf1fec755 Kaixu Xia 2021-03-16  2785  	enum pkt_hash_types rss_type;
^590eaf1fec755 Kaixu Xia 2021-03-16  2786  
^590eaf1fec755 Kaixu Xia 2021-03-16  2787  	if (rss_hash)
^590eaf1fec755 Kaixu Xia 2021-03-16  2788  		rss_type = handle->kinfo.rss_type;
^590eaf1fec755 Kaixu Xia 2021-03-16  2789  	else
^590eaf1fec755 Kaixu Xia 2021-03-16  2790  		rss_type = PKT_HASH_TYPE_NONE;
^590eaf1fec755 Kaixu Xia 2021-03-16  2791  
^590eaf1fec755 Kaixu Xia 2021-03-16  2792  	skb_set_hash(skb, rss_hash, rss_type);
^590eaf1fec755 Kaixu Xia 2021-03-16  2793  }
^590eaf1fec755 Kaixu Xia 2021-03-16  2794  

:::::: The code at line 2781 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
