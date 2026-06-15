Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FC53ACA48
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jun 2026 11:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781522566; cv=none; b=jr7SGVWNjV/ToHpGoiLW5jXowLV3dNZO6G/wVAl4JJGHcK7gCXiV6J4pJGvBGN+CbFW+ECY3eUAoJv32HWE5ia/LlaCGAOvON6TKBeIzeDazGsVefS/iq94OQxda5PCL3ta7RfDxw56k104sTOhoZoKVxguyHuvacBBHBP5lIuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781522566; c=relaxed/simple;
	bh=8JItlisweInIAcvGSK2hsTt01rul+1U/h5tqeqPPYmU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZRBV9HfaWtmWcLbnwiO4i9sOmZodKw1qS2q0FxdmZcU2QRoU0zvpCgjgRUIx5wIH4MWBA2gVjxHybk2WIiXj1aHtclK0GabjqtcYQfk88JxUIZiuoIHFyAPmn/5iDmBaUbeUrVr/iiyBgG/3hDUTxkMu8wiB2D0Dxoz1y+AVmsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNh492Kt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNh492Kt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781522565; x=1813058565;
  h=date:from:to:cc:subject:message-id;
  bh=8JItlisweInIAcvGSK2hsTt01rul+1U/h5tqeqPPYmU=;
  b=CNh492Kt0QpCklYSOeiSttZUa1JiZFzbwAmspS3CDN3EKZZDS1CpjOyE
   wPr38cbCNuUtxXURCGdebpxBXcfEEMtQGhXYkapt+jxCmdVrflgTqGq+d
   AGT0YGnkSWPFSDBObOSsbj0JMm9JDBYm24/Io8rUUzhRV63Vd+W2W3tbS
   UC6sWs8wahqX0z/aCcx768zn7PzDJOZwRSL/ZjXLHz0BF2PsOefVmx2zp
   CezNRG6EJkzIPyYTy8bfajyZhYTXrNDmMRsB/LmmPh755hMZ4zo930HKk
   BxE8MXBxZCIcIWabNMBdTTRo/i/3Np+PT1f0RFBTy8/tle4nbtkCJsd5e
   w==;
X-CSE-ConnectionGUID: NYXi3F+mTXK4nrb4S914qw==
X-CSE-MsgGUID: 6f2OyeyJR4mQl7A2RscVTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="104929727"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="104929727"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 04:22:44 -0700
X-CSE-ConnectionGUID: 1l3/aRpWQpyv6LJwmdyGJA==
X-CSE-MsgGUID: 7va7WupiS7qtzaFj3jHMIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="246336425"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 15 Jun 2026 04:22:43 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZ5Or-000000004s5-1Kds;
	Mon, 15 Jun 2026 11:22:41 +0000
Date: Mon, 15 Jun 2026 13:21:45 +0200
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rclaveau:b4/add-adla_npu-t7-vim4 12/12] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202606151312.HDE3fwIf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rclaveau-tech/linux-khadas.git b4/add-adla_npu-t7-vim4
head:   543fbf680cf36a5257c66ff76054122b3fab2fd6
commit: 543fbf680cf36a5257c66ff76054122b3fab2fd6 [12/12] Temporary use Adla Legacy driver
reproduce: (https://download.01.org/0day-ci/archive/20260615/202606151312.HDE3fwIf-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#13554: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/adlak_reg.h:255:
+            ab_axi_saddr : 21; /* Start address of AXI SRAM. saddr * 0x1000<= Byte Range. Unit: 4KB
+                                */

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
