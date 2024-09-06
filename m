Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94DC158853
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 12:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725627560; cv=none; b=q7mn+AFVb1Dff4NvjPUpMNBdcaQDHB4GzCXL28Tj+7LEEhlCnf3t9Q6YatnpabFzyL1aMRCFX3y/rqY1/NixTCNDOt9pP6A0Nhj9pWELKwaWRVThPzZ3WaRNEZxoeG3xtNHNqZEb/hCUsqX8Fg91AnsNMAsmHBTqBnxJ9fsJTxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725627560; c=relaxed/simple;
	bh=blYv4ChJKyNKkEswOnBrgXF1uZgrjHF+4T/SMb7pWZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oB22f/8ZJb6X5aHj05gaUnI1v1yIz0tmseSj8ImCuKXdB+kwLhVZzw20DP5huSpP7kVGRbUsMHMec8Gy3JVBPx27rr8wQDHf/m9OcTFagFeUpwFsr+bSKqGIGiHaguaQ+2f4laUadQtjTOu6z6QwdM3kxTabxP82ZqL5FX4k9eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUilaG5K; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUilaG5K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725627558; x=1757163558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=blYv4ChJKyNKkEswOnBrgXF1uZgrjHF+4T/SMb7pWZY=;
  b=BUilaG5Kiv/bqZ4zPzffIehbidONFLosiEyI7Ewo9G1iVgEGpuFm2UX6
   +ef9tsPHs+paLltnJ61g/7hZylafWT9aamFnh+zLiHoakQ+66haXSkXft
   PvrpFpSFrIUJDjtDbKI73s482SzCl3XpDLKl3HwjcjRf92gNyo4DQ7BOe
   kIYEW8ESZhLjr6D/ylJAVplEiuChQ/vG3daYll6VPBN19IobGPfeefApg
   +39MlFiSplhqZenYDVMyigsKyUCbqdsruTaqwAGMH4lN+W37DWXYTqy60
   w9MqvkJ/xRIYxuRZmMif+9Ro46wIrZO+X4uO1NMF97AxItxqm3O2o6LkV
   w==;
X-CSE-ConnectionGUID: Ibj0gx5bRIik9T0RZM+fkg==
X-CSE-MsgGUID: 8GyKyZvjTjyqnba3L2l9mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="46912406"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="46912406"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 05:59:17 -0700
X-CSE-ConnectionGUID: iqeK3ZoaSUWprOQqwmb0wA==
X-CSE-MsgGUID: +AtXMojsTAWO1CRQlaNjVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="70361360"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Sep 2024 05:59:16 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smYYT-000BFv-2m;
	Fri, 06 Sep 2024 12:59:13 +0000
Date: Fri, 6 Sep 2024 20:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Duanqiang Wen <duanqiangwen@net-swift.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 13838/30000]
 drivers/net/ethernet/netswift/ngbe/ngbe_type.h:2877: multiple definition of
 `fmgr_usr_cmd_op';
 drivers/net/ethernet/netswift/txgbe/txgbe_hw.o:drivers/net/ethernet/netswift/txgbe/txgbe_type.h:3165:
 first defined here
Message-ID: <202409062029.0Fv1YZCJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi DuanqiangWen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c431540f5e2720652e293713c7358952cd0148de
commit: 3ddd74dceeba1f4ea8b20db59276ea3c6eded3d5 [13838/30000] openeuler: net: txgbe: Fix some known bugs, merge net-swift txgbe-1.2.3 out-of-tree
config: x86_64-randconfig-003-20240906 (https://download.01.org/0day-ci/archive/20240906/202409062029.0Fv1YZCJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409062029.0Fv1YZCJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409062029.0Fv1YZCJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/ethernet/netswift/ngbe/ngbe_hw.o: in function `fmgr_cmd_op':
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2344: multiple definition of `fmgr_cmd_op'; drivers/net/ethernet/netswift/txgbe/txgbe_hw.o:drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2858: first defined here
   ld: drivers/net/ethernet/netswift/ngbe/ngbe_hw.o: in function `wr32':
>> drivers/net/ethernet/netswift/ngbe/ngbe_type.h:2877: multiple definition of `fmgr_usr_cmd_op'; drivers/net/ethernet/netswift/txgbe/txgbe_hw.o:drivers/net/ethernet/netswift/txgbe/txgbe_type.h:3165: first defined here
   ld: drivers/net/ethernet/netswift/ngbe/ngbe_hw.o: in function `flash_erase_chip':
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2371: multiple definition of `flash_erase_chip'; drivers/net/ethernet/netswift/txgbe/txgbe_hw.o:drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2885: first defined here
   ld: drivers/net/ethernet/netswift/ngbe/ngbe_hw.o: in function `flash_erase_sector':
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2377: multiple definition of `flash_erase_sector'; drivers/net/ethernet/netswift/txgbe/txgbe_hw.o:drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2891: first defined here
   ld: drivers/net/ethernet/netswift/ngbe/ngbe_hw.o: in function `flash_write_dword':
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2393: multiple definition of `flash_write_dword'; drivers/net/ethernet/netswift/txgbe/txgbe_hw.o:drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2908: first defined here


vim +2877 drivers/net/ethernet/netswift/ngbe/ngbe_type.h

a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2873  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2874  static inline void
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2875  wr32(struct ngbe_hw *hw, u32 reg, u32 val)
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2876  {
a5961b4bc6ce09 Duanqiang Wen 2022-12-01 @2877  	u8 __iomem *base = READ_ONCE(hw->hw_addr);
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2878  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2879  	if (unlikely(!base))
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2880  		return;
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2881  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2882  	ngbe_wr32(base + reg, val);
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2883  }
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2884  

:::::: The code at line 2877 was first introduced by commit
:::::: a5961b4bc6ce09a70902686ecc848a47493a9251 openeuler: net: ngbe: add ngbe module support

:::::: TO: Duanqiang Wen <duanqiangwen@net-swift.com>
:::::: CC: Duanqiang Wen <duanqiangwen@net-swift.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
