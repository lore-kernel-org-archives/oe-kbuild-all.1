Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03FE4183CC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 15:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781192039; cv=none; b=rmARsnbvcm7RAp+n98ClYWTX/4jqAwk9P3HTY+R7n2GI8kMggEfEDNdtZ3TUuldUXMBXRmA80bKY/tpEeHMBCRfi28rAQ8EMO5O8R/Sjg6ru6cn3BNLQmpoqIFdT7UmEssuuyXfnmZFGuh27x6es0cgksrdTDgZva0sINI0PFgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781192039; c=relaxed/simple;
	bh=8EQih/ie1xakuZYPqyc8Crb2SHmGNdexcgJeaYao4Wc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K5RFepGMnQO2wOa4rrGDGBKhGQlrl69+wKad6ceWRvJb7mKmPn5w+j+d4XrgnILFP3tr1v+njJmUMpgewMJgMyZWAJwxidxyr10WRKbj/0CUyYGu4ccvW2F4U1AJ6xGCR7oXEra4D+5HSDgZ5KLFRvM4b8e40SDiEElkUeosKi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCr+0r33; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCr+0r33"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781192036; x=1812728036;
  h=date:from:to:cc:subject:message-id;
  bh=8EQih/ie1xakuZYPqyc8Crb2SHmGNdexcgJeaYao4Wc=;
  b=jCr+0r33bgzoaYwlxnl9iMeEERLm2M5PJtSMfBA7a9jNM5xWi7h8jojm
   w5zxzR+weWs8x0xAwqfiYRDzjoFeaE93yWYydFfLzGfYpDAoWowOL6XNe
   vquu7UWaVEtIOOzhoTI06k6/4cm5x8PpvFRhNOiVxuNRngtNu9wNZIXJC
   qdlEKdJOfEORoVEG/njERkCh+Mwc2LYgo29ZeyCT7iXfLAF1nZEF25nkz
   cPW5vlxu/hwLCQsMo3GkN3I2Ung/dlnDGp6UtXBJ5w+K9/YQU1qW6r1G9
   M3Ai//Sdit1SNOkNEstwS4BjivI/zEV3w+EcEVrjkQQn+v6E02OUirqTr
   Q==;
X-CSE-ConnectionGUID: 3+64HS5ZRNyEak8XOTirAg==
X-CSE-MsgGUID: QS9fwtNsSLa96GbV0R9COw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82013093"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82013093"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 08:33:55 -0700
X-CSE-ConnectionGUID: xgZnFX+VRx24licJcoOHuw==
X-CSE-MsgGUID: 9/HCrWwURKqjzrX6K6/LvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="243576684"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jun 2026 08:33:54 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXhPj-00000000NLe-27AU;
	Thu, 11 Jun 2026 15:33:51 +0000
Date: Thu, 11 Jun 2026 23:33:20 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:can2 2/2] drivers/net/can/mpfs_can.c:291:3: warning:
 label followed by a declaration is a C23 extension
Message-ID: <202606112308.UGq6iuvD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git can2
head:   1131f8a72c21c81758a97f4e3a9713d3b034b732
commit: 1131f8a72c21c81758a97f4e3a9713d3b034b732 [2/2] net: can: mpfs_can: add Polarfire SoC MSS CAN
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260611/202606112308.UGq6iuvD-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project f99ad325b987c3f2fb2d298f1569377c989b06d3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606112308.UGq6iuvD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606112308.UGq6iuvD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/can/mpfs_can.c:291:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     291 |                 int ret;
         |                 ^
   1 warning generated.


vim +291 drivers/net/can/mpfs_can.c

   286	
   287	static int mpfs_can_do_set_mode(struct net_device *ndev, enum can_mode mode)
   288	{
   289		switch (mode) {
   290		case CAN_MODE_START:
 > 291			int ret;
   292	
   293			ret = mpfs_can_start(ndev);
   294			if (ret < 0) {
   295				netdev_err(ndev, "mpfs_can_start() failed!\n");
   296				return ret;
   297			}
   298	
   299			netif_wake_queue(ndev);
   300			break;
   301		default:
   302			return -EOPNOTSUPP;
   303			break;
   304		}
   305	
   306		return 0;
   307	}
   308	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
