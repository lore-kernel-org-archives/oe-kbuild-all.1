Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908782253A1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 13:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781443715; cv=none; b=Luwx2CROk13zVj73Q/lJpZd+p/Ef3+6O8HWRLjUYhx73oeeYjvQXDN7X1bJNU0oYcKqDW48vc2EcCIcn1PDIjDyXoLkeRarfJh1YhzJvI3D2btB988fRDH8zNQC9LgjlInfwIFMC7hUOr9WFYm7snP7UoEBknxSh5x98PYzJA1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781443715; c=relaxed/simple;
	bh=5NKjZE3E9bgMKlgbgv5phCQNAj8OQH0a4PuEMHVlDaY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DObHICjKBM64w+d5IIJVf1w7x6VxCamUdLOtmsNO6s96mwO4OVhxTu4mOX2BNvM8dLermrrXh+wV/5p5ouVaZJC9oDN7XCVIxRK5j6gxQNyKITh5dxKjIP5OU3zPlMJOjrsV/uY/awNxQEO26VVaUBhKZTOsCiD3ME/ClAruamY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=glHBO8i9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="glHBO8i9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781443713; x=1812979713;
  h=date:from:to:cc:subject:message-id;
  bh=5NKjZE3E9bgMKlgbgv5phCQNAj8OQH0a4PuEMHVlDaY=;
  b=glHBO8i9T10myqsRQFq7Rq6CawJZ2tL9AsoxkcdIru1xGudv/w94P7tE
   gWsVhgQMEIpcZDTkZQV+9pVuL1LVOtJn64gCTqndIgDtXLAuSRYTA/Sjw
   zOdxdP2EQDw8o8b6qi1iakUEC6uq3ZMPz7DJvq5CEqVzElDfRsHqCbq39
   +j0Jkj3m3dfq5Mh5AeuAb3D3sZ+8aQYDSCGyKdamTae6gs4CC3nlxEVD+
   R0VB6EITOJlHiYPKfyd/jz4bxobLotQNwvjU86h93OVwmNTMtpPOptaJO
   JB0i16kSQid1TsM0i6AJ1ro0uRgTSG1n/IjDfLI9uWUfxec/l6pCUuV4k
   A==;
X-CSE-ConnectionGUID: ByXT89XlSMGSfWk3IzzPYA==
X-CSE-MsgGUID: Zz10MU+mTcOyBaou8egFgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82312158"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="82312158"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 06:28:33 -0700
X-CSE-ConnectionGUID: 5o9ruNPZRCSTHvyX9xZecg==
X-CSE-MsgGUID: ldjQGmKQTU2VY0eqqn2poA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="243094431"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jun 2026 06:28:32 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYkt3-000000004gB-2mAX;
	Sun, 14 Jun 2026 13:28:29 +0000
Date: Sun, 14 Jun 2026 15:27:55 +0200
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rclaveau:b4/add-adla_npu-t7-vim4 12/12] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202606141510.qdBVSMkM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rclaveau-tech/linux-khadas.git b4/add-adla_npu-t7-vim4
head:   db2e0f73cef8a993f240d9ea07ff72f5e99a7a9a
commit: db2e0f73cef8a993f240d9ea07ff72f5e99a7a9a [12/12] Temporary use Adla Legacy driver
reproduce: (https://download.01.org/0day-ci/archive/20260614/202606141510.qdBVSMkM-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#13550: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/adlak_reg.h:255:
+            ab_axi_saddr : 21; /* Start address of AXI SRAM. saddr * 0x1000<= Byte Range. Unit: 4KB
+                                */

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
