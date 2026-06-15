Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C37538BF61
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jun 2026 23:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781564516; cv=none; b=hrxqJyNYzKu2fWE8vttD8bN69azfF/s+oLASB/0uugQdXFdEmzFI2HS2UqP479DExR4Ml8tmBwjjeD8zXAQaq86Br7ANE+FFWnZh1FYAgvx93xeG+PGEXKhOUjxuhtNlNVQlfaFOLGKpQX+mxDRpja7AbQqFjkON72DYyZ7oZGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781564516; c=relaxed/simple;
	bh=Cmn9d2lMKj3J4h0wqeobkoD+TSXy+AICU50iJKcRsVY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZnCXCVGsg/AGiTZ8OLHOVTdvDUOkvOkQ2js8BG00DbPxgG+8tdd5++MPZtHsmD/ozUxuov5fM7Y58wwJKCDckgaB65zNrV18OHP6BVccPEONSp+vW2XKStRgO7Eud3niQmVUK53n8CfbsVlD9g1Lrk8Vmvmsu42/NKcFlaZJ3dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VVcKP5g0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VVcKP5g0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781564514; x=1813100514;
  h=date:from:to:cc:subject:message-id;
  bh=Cmn9d2lMKj3J4h0wqeobkoD+TSXy+AICU50iJKcRsVY=;
  b=VVcKP5g0A1kD+XVZ83cy2G2uchXDApwDk+AJI8FuYRU97Kq1o+yO0um7
   iCsPsfgPNw3vxEfFVyTJl60JXi+e5JR2aXfxkOw262CipI0zTnJUqdDjx
   kgnQ5lgZLo8079MymVSfmDAQJ7SBc/tG6WdpvP+EhG1HOgpIUStOPs1i3
   k68rXis5V0R+MQQDUmHnfqZbl170ea2Q1izceb88JArC44jGHFYPLihZl
   PPt4kC2H039UVdEjvOZ0He1i+1roVCdTUEiY5bMjM7IjptigiyFiRPKh8
   mGSYJanovW52tabF9mrya6V8e3s4ruZRYhr9KptQRgiczs3FtfJycXf8w
   Q==;
X-CSE-ConnectionGUID: CTAMWg04QJS+m70fDkoruQ==
X-CSE-MsgGUID: g7xG4lLmQkWbu1rx2/bhnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="99737713"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="99737713"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 16:01:54 -0700
X-CSE-ConnectionGUID: 6t0w4HIsSFqUP0g17hVZ+g==
X-CSE-MsgGUID: wCPUnm/qQRupZShUlFxDdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="244701871"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 15 Jun 2026 16:01:52 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZGJR-000000004zt-3AZ0;
	Mon, 15 Jun 2026 23:01:49 +0000
Date: Tue, 16 Jun 2026 01:01:02 +0200
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rclaveau:b4/add-adla_npu-t7-vim4 12/12] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202606160049.StuA7gCw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rclaveau-tech/linux-khadas.git b4/add-adla_npu-t7-vim4
head:   6bdef374f5ba12588b2adf49bb4a94f4ba3d0a52
commit: 6bdef374f5ba12588b2adf49bb4a94f4ba3d0a52 [12/12] Temporary use Adla Legacy driver
reproduce: (https://download.01.org/0day-ci/archive/20260616/202606160049.StuA7gCw-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#16703: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_device.c:235:
+	/* Set the internal DMA address mask
+     * This is the max address of the ADLA's internal address space.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
