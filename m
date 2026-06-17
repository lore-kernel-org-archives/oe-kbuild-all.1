Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C9A2DC79B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jun 2026 11:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694014; cv=none; b=EXWO/bKy9Xg2wRtO56cSagaHintISbVZdVfyV8qf5GeSviE/m0KymPZpVeNKR8jCAy8dYuj5psL8Q8CLH0p3rxgGBqhyo/WRf22JxF1bHyUEhPgRcnRljV1+pkWPvyEmQs13soR+sI3Rvkeh6OgUA2wXJVXwcYNH0e79nWuL9Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694014; c=relaxed/simple;
	bh=u3JMGhhHYyV6LuSPqavUI/Wp7FiycwFEPV0ue5zRtnI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PAACRGfORYYiX5td71aBFdYiDf0AZH1AQjRGyyyaj9nOGgaiYwFSbd0F9KKyBk7aYaq6FB4bTpmBN7VJc7nA7/t80I1ViLidUy/BHJDVD4sdnVHMy/+TNLRcJvCUu7WstNXxC5XXvI35K36QzP2gRhuoV/9mGFPVi1hx6c5WxRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0xnu4ER; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0xnu4ER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781694012; x=1813230012;
  h=date:from:to:cc:subject:message-id;
  bh=u3JMGhhHYyV6LuSPqavUI/Wp7FiycwFEPV0ue5zRtnI=;
  b=K0xnu4ERWkikbrCLVT6+iGTUn/ZYUO8PR3d+BV+WXEkXz3EeVK3invfU
   H/a+zOx5lrrx24W2FFQDvlfimf/Ft4s74g5urbUrwrT3lEpsjW/vy5wKx
   9jdlIsl+m66GewreYDkymNEbozUbA2hrgYlvD1UDUS2YIEW0w6hwTm+Pu
   nFo3avpDBUDGbpWAvPXelY8H1sXYIY8NIGjIXxQPwJ9Ijs9tWOFSiakWM
   fzmD1fvcKFzr2KqEibxjnuVViEJ8ngDgJiXYUq2nOKAOM60a6+AGv7AAl
   /Cy3yKOTL5FSY9xKba4Ch5AcF491G6Zs1LHns9YwxG3IJwyIsASDM8K5W
   Q==;
X-CSE-ConnectionGUID: nq90KBeCTAyvNFM2jO3kmw==
X-CSE-MsgGUID: q2cm5IraT+Cj2jwcHeYFtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82489843"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="82489843"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 04:00:12 -0700
X-CSE-ConnectionGUID: RdTE0MzeTaykRI90cxDO8Q==
X-CSE-MsgGUID: mVB5evkyQG+FFuuW9q6aUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="252338310"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 17 Jun 2026 04:00:10 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZo08-000000005K5-0rr3;
	Wed, 17 Jun 2026 11:00:08 +0000
Date: Wed, 17 Jun 2026 12:59:37 +0200
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rclaveau:b4/add-adla_npu-t7-vim4 12/12] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202606171210.dw3zGBsM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rclaveau-tech/linux-khadas.git b4/add-adla_npu-t7-vim4
head:   f209ccd86263f8cdd983bb36326f8916026c7118
commit: f209ccd86263f8cdd983bb36326f8916026c7118 [12/12] Temporary use Adla Legacy driver
reproduce: (https://download.01.org/0day-ci/archive/20260617/202606171210.dw3zGBsM-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#6838: FILE: drivers/accel/adla_legacy/kmd/drv/common/mm/adlak_mm_cma.c:416:
+				/*share memory between different model only supports soc without smmu for the time
+                 * being*/

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
