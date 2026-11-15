Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737157;
	b=4EExNd8T5+uv736Ueobg1SK5yg5S2mFWPlOUF+SCUF2DtvDFJ5wovePOkEQizg/RMhNY
	 KBn/YdWkKxjOQTpwSoA6dEUf+LPS+bhYsxdIouGTn34MX7DfmF95V2BVasO1XnB3PBile
	 TRbTDjuI2dx730lNpVUD14ZqHZ5q1mA8U3q0musZSHDZtXlUpW3NXQZJx+22MHn+PGiHF
	 9Tjb5ms1aDGVo5ieoFC5tQ9yHwaydqOVZCi9a5CAdeu8CYVFrW3mO28K0z5LFzm+4Kx9x
	 l9NQy94SVuQe9Z0dk2AhZ4jrrQulkLDwFuN/kS+sdCFin2MZNWKFnBZ65iLjf4IJ7CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737157;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+Yx5nDP/aQ3c32eGGTYskoMXkCSVxwoho7tC5yRdvNY=;
	b=Pv+QX1vXfrakD4LHbr1a2sJP5BE+T1xjuJ5BgmOm2SoU6To2M2po+wzCDk5NHb8UuUl4
	 xBQr23PsKWmleTe71gVjfu24FT0yDLtEe4FdbCC3Ij6iUimk5ZnScPa1VRvon1ZQAhrq5
	 Fq34MWlt1W6K3tmhaldNHpWoyPpA3BIcGik0M/ma3wzBHeLIdhqT9wzCflK4p4k/9dMNk
	 Q3OmwEFK4B8mZj4OOWCOwr0ym6QHOAqv+kJOf7WDTJwb9jGr8o6xkapDuQSRRYvRLGVR9
	 lBBtbjfxYjcS/pk2CIu/fzlT7kiOK1X6z1NMDtDZ6F4M6a2ygTXaf+0Kv0KBTrgPOPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cX1DU6OB;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD575606A327
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 10:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD575606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cX1DU6OB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794737156; x=1826273156;
  h=date:from:to:cc:subject:message-id;
  bh=zr5ptQDh2QKviC3DCDMEIF3FQrjeUq+vFV3E5X9CBrU=;
  b=cX1DU6OBkF+YamhO9AYrYYgYV/Q7D9P6pHk/gywaIPuoxqr9xiCxMUL/
   C/19uGNbERj/b1OroPNbeotj2T3qYiRX5UETvkBtMyi7ICLEdxj3Qo30m
   D3XKUX6n0IfN5X8LL5bzrcg235kfOxYtwFc8gRDlK2Rnp+eHCI+KSYiir
   RUm/gK3hnxhvCESxzrbCwHj763+6Jakezy3rWRqpLfuJ5YEBQucWKtynh
   J2yUODXyUvH0TWde2yUWWOK++J2d4mYl0RFCtX4MmEPo85fWJoQtV01ym
   Haa7T40gBc5DyBwfzvo7vTt9jf08uzepBIcL18Br8jd4gdWEe2PXXEmZT
   g==;
X-CSE-ConnectionGUID: omHj574cQsie/rNp2jzemg==
X-CSE-MsgGUID: o05tW2ylSlqrDp5SogYioQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3384673"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3384673"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 02:05:54 -0800
X-CSE-ConnectionGUID: +Aa3gAfHTSipDd08c08cug==
X-CSE-MsgGUID: KB6T4iQITVuE+PxmrunxuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9227111"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 15 Nov 2026 02:05:54 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSX7P-0000000028S-0leA;
	Sun, 15 Nov 2026 10:05:51 +0000
Date: Sun, 15 Nov 2026 11:05:37 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/2]
 drivers/net/ethernet/intel/ixgbe/ixgbe_ptp.c:1319:2-3: Unneeded semicolon
Message-ID: <202611151137.uCy3REYg-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   3540cf724bf0fe246a3131fd1f3e9342fa03b03e
commit: bda3e38924345a759ea68171f94dbf1d09df106a [0/2] ixgbe: stop resetting SYSTIME in ixgbe_ptp_start_cyclecounter
config: i386-randconfig-2105-20261114 (https://download.01.org/0day-ci/archive/20261115/202611151137.uCy3REYg-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151137.uCy3REYg-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/ixgbe/ixgbe_ptp.c:1319:2-3: Unneeded semicolon

vim +1319 drivers/net/ethernet/intel/ixgbe/ixgbe_ptp.c

  1279	
  1280	/**
  1281	 * ixgbe_ptp_init_systime - Initialize SYSTIME registers
  1282	 * @adapter: the ixgbe private board structure
  1283	 *
  1284	 * Initialize and start the SYSTIME registers.
  1285	 */
  1286	static void ixgbe_ptp_init_systime(struct ixgbe_adapter *adapter)
  1287	{
  1288		struct ixgbe_hw *hw = &adapter->hw;
  1289		u32 tsauxc;
  1290	
  1291		switch (hw->mac.type) {
  1292		case ixgbe_mac_X550EM_x:
  1293		case ixgbe_mac_x550em_a:
  1294		case ixgbe_mac_X550:
  1295			tsauxc = IXGBE_READ_REG(hw, IXGBE_TSAUXC);
  1296	
  1297			/* Reset SYSTIME registers to 0 */
  1298			IXGBE_WRITE_REG(hw, IXGBE_SYSTIMR, 0);
  1299			IXGBE_WRITE_REG(hw, IXGBE_SYSTIML, 0);
  1300			IXGBE_WRITE_REG(hw, IXGBE_SYSTIMH, 0);
  1301	
  1302			/* Reset interrupt settings */
  1303			IXGBE_WRITE_REG(hw, IXGBE_TSIM, IXGBE_TSIM_TXTS);
  1304			IXGBE_WRITE_REG(hw, IXGBE_EIMS, IXGBE_EIMS_TIMESYNC);
  1305	
  1306			/* Activate the SYSTIME counter */
  1307			IXGBE_WRITE_REG(hw, IXGBE_TSAUXC,
  1308					tsauxc & ~IXGBE_TSAUXC_DISABLE_SYSTIME);
  1309			break;
  1310		case ixgbe_mac_X540:
  1311		case ixgbe_mac_82599EB:
  1312			/* Reset SYSTIME registers to 0 */
  1313			IXGBE_WRITE_REG(hw, IXGBE_SYSTIML, 0);
  1314			IXGBE_WRITE_REG(hw, IXGBE_SYSTIMH, 0);
  1315			break;
  1316		default:
  1317			/* Other devices aren't supported */
  1318			return;
> 1319		};
  1320	
  1321		IXGBE_WRITE_FLUSH(hw);
  1322	}
  1323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
