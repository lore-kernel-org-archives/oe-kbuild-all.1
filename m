Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174724;
	b=JB/tV0zBAkEoPr+j2+0OWa2MTtRgYFLMPA8+ZUl0j4usxtbg3WnDSZzyazAl+74SWnxs
	 XkQW2VtxpL9zeeuyM/koA5PU0BBeubGvRB8IMvEVGXm56IdAkxCoVh0R7Kj6qdUSFD0vO
	 Cc5uChQYjGdYv1UERS34rs96TFLLxQtpaP+fYvQ00y8aTMbi70Z4c+z/CCDzlB9FiJMEL
	 xH+iBJDS8qLs0P2NHyJ8b9skCNWe2L0oUMEe3DL50EnTZJdI958itl2NOZ156PEyCKK55
	 irAO/vbTghf/g/LDlywDWMwVykxMIEgS1BPCK1VyGW2RSj2IJ/7PtAVAwYpshRWfumQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174724;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=WrVtnvrNPmJR06ugb9CiBKV6bTll3gI7Y3jIGHqs9Bo=;
	b=eeQ5KQKEf++Fpglks9EQ3pNedXRdpvD1YtPjNx/GWoh8cfgbKyZkeGH2Ek/NY+8XQr4M
	 CP+cOUPRw388AL1Ca+w+79NM/6SPdHIouDN65ml3CuwnyzHEWUHAxZswdooH1JduYWXAM
	 3C6fNi+9emDilooRdO+bHBsre61+7DIUKNVqv2+s2h/oETUrKYNfzk6mx44GfgdpWlhHo
	 Si7C7iIvE3vabSRtkSevTs1+IUb6QPrnUST8YTXLjzSLTZzE3jyQ2hFEc7qE+qFHHrOA0
	 Ksy5eNdogn/wEYipesb3gbdqnpcgjl8V7wwA+BGuLnpg0UiETx+H8/+gjtuAse4Otyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KfINkXAm;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B52606A325
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 11:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67B52606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KfINkXAm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795174724; x=1826710724;
  h=date:from:to:cc:subject:message-id;
  bh=y/1KnRahZlHl7GoDBzIUxqw6Na9q3umuERxOewNIPkI=;
  b=KfINkXAm6qTJcqvMzuCLdlDE8NWaL3dXfdNzcMXtwY5ZP08kPs6LHr/X
   W/CPx1V6YpNy35bnW4oXupIa1v+kU7hlAOrCv6QdDM39d3Y00AVnRb4kt
   RxkV0yYTCKAxAnAX3Ks8E6xXin6bVafcAc5ChsVZ9C0bE0UjW7BOjKqWt
   pdKqYfrPbTcLP++4uyrnOWy7aR3esKjXVA2T8+BArBAMADLAzWTtdgFJt
   jMVVv3vCA5lI41D9QaoWwmmGBAQv36gbPsOrsbgAUuRmrvfDKd5umJYe3
   64nLj5gFUJYEXhgMsIw0pb2CRznLV/rGq5A9S0j4RgIg6PCwg4IEnEEsp
   A==;
X-CSE-ConnectionGUID: MpQgJn+rSn6YQ/DCFlJwnA==
X-CSE-MsgGUID: bvSYEp0nQtWeCK0q9b1A/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4083363"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4083363"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 03:38:43 -0800
X-CSE-ConnectionGUID: PZQc4IUTTSuyV83B2h0/Kg==
X-CSE-MsgGUID: co8XnYHcRaKQCAXcDm1NAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="11043008"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 20 Nov 2026 03:38:42 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUMwx-0000000041v-1slu;
	Fri, 20 Nov 2026 11:38:39 +0000
Date: Fri, 20 Nov 2026 12:38:38 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/dma-buf/dma-buf.c:69:5: warning: no previous prototype for
 'get_dmabuf_debugfs_data'
Message-ID: <20261120123709.Wd1WjpgM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Sandeep,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   14d40582269013a9bc6df12b2479da18f27e3d33
commit: 5169763275538844ab830145369bb81f14d261d3 [1/1] ANDROID: guest_dma_proxy: Driver for zero-copy DMA-BUF sharing in guest VMs
config: arm-randconfig-r2107-20261120 (https://download.01.org/0day-ci/archive/20261120/20261120123709.Wd1WjpgM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120123709.Wd1WjpgM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120123709.Wd1WjpgM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:69:5: warning: no previous prototype for 'get_dmabuf_debugfs_data' [-Wmissing-prototypes]
    int get_dmabuf_debugfs_data(int (*fn)(const struct dma_buf *, void *),
        ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_DP_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && (DRM_DISPLAY_HELPER [=n] || GKI_HIDDEN_DRM_CONFIGS [=y])
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && (DRM_DISPLAY_HELPER [=n] || GKI_HIDDEN_DRM_CONFIGS [=y])
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && (DRM_DISPLAY_HELPER [=n] || GKI_HIDDEN_DRM_CONFIGS [=y])
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDCP_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && (DRM_DISPLAY_HELPER [=n] || GKI_HIDDEN_DRM_CONFIGS [=y])
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/get_dmabuf_debugfs_data +69 drivers/dma-buf/dma-buf.c

dbaf8b29f24687 Vijayanand Jitta   2021-02-25  68  
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02 @69  int get_dmabuf_debugfs_data(int (*fn)(const struct dma_buf *, void *),
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  70  			void *private)
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  71  {
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  72  	int ret;
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  73  	struct dma_buf *dmabuf;
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  74  
362dc1813ba7ee T.J. Mercier       2025-05-22  75  	mutex_lock(&dmabuf_list_mutex);
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  76  
362dc1813ba7ee T.J. Mercier       2025-05-22  77  	list_for_each_entry(dmabuf, &dmabuf_list, list_node) {
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  78  		ret = fn(dmabuf, private);
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  79  		if (ret)
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  80  			break;
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  81  	}
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  82  
362dc1813ba7ee T.J. Mercier       2025-05-22  83  	mutex_unlock(&dmabuf_list_mutex);
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  84  
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  85  	return ret;
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  86  }
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  87  EXPORT_SYMBOL_NS_GPL(get_dmabuf_debugfs_data, DMA_BUF);
bfc7bc539392f6 Tvrtko Ursulin     2024-03-28  88  

:::::: The code at line 69 was first introduced by commit
:::::: 4e54be02ffdb8819ccb4390b922690c1a9e55ce2 ANDROID: dma-buf: Export API to iterate through dmabuf debugfs info

:::::: TO: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
