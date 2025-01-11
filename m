Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2370185B5F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 08:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736585550; cv=none; b=L/ZD5jBUBNTgjRlVj3QTMJ0kw+/M61Li5NuF3UK0Av1bmcuVPOesNsuN7m8AQKgvlgcUGdWv6DdlScI3Tg9lfxJiJKmZL8gAClPcmjNZ7xbySg/isbfp2Zsk5GoG64AyjmeCCpw29/cI19+I09A8HbqX1bxuHdMnAiZajbOm6ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736585550; c=relaxed/simple;
	bh=UsKg/l5NUh8SFD834GwI+QWldjeNlv4VVw/IU5gSuyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FuuTNgjVnv8hNINviypRD0dh0lfmdSOmtXLGv4KABljSZCO/498xfRgIoRe6/QHURYMI2D8vvyCAtu6qi8GKEJhaD9ZIdJhh13mz/8thD7xoiNj7S4FC/Ghn33NevIIdUbrDlmawW9yv1Nw8PZngJo/L+OGReWcuT8uugsRIThc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBX7/sir; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBX7/sir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736585549; x=1768121549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UsKg/l5NUh8SFD834GwI+QWldjeNlv4VVw/IU5gSuyQ=;
  b=BBX7/sir+YtO7abkERdNTV2ciql1DYplJm3LfjU4rgpai+XZRN8KuOr5
   TbCYvqNPUiwnhs5l1VJi2M6bdLmA9tjvYG+titLPncAj6Z5lrHoERuR3t
   XOjQm0oSFF7OObqM81UJLOKuLLO1m7bcfOWQwVwZpaYrVGEiDbze8sHRb
   oJNP1+webFfWxx03ZKJVTPEjgCeNkODYRjE76K7fxLPEqoJeVrKIuBVQz
   qtj6vtljZZs4g1wTw0vDJUwwPSw5Wj7uGLWRLr1zd5yq53emHw/GtiXlY
   L9iVjinwFUW6BLJnJE7+iFnZRPps8ItdjE3mU1IyHz4hGgR6nKuaiKqnv
   A==;
X-CSE-ConnectionGUID: x4HKpjkARKiDVP4w67tSWA==
X-CSE-MsgGUID: IhLxbvcvQz+d11L/9hxWyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="48297144"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="48297144"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 00:52:26 -0800
X-CSE-ConnectionGUID: /DDKuEhrQSO/e42vTDVczg==
X-CSE-MsgGUID: dQWkwJv6TyqkdywvV3q2Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104469510"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jan 2025 00:52:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWXEA-000KPR-0P;
	Sat, 11 Jan 2025 08:52:18 +0000
Date: Sat, 11 Jan 2025 16:52:13 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Matthew Brost <matthew.brost@intel.com>
Subject: ld.lld: error: unknown argument '--ppc476-workaround'
Message-ID: <202501111659.V4ZZinjr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   77a903cd8e5a91d120ee014c8f8eae74d6c5d0f6
commit: ca630876aa98c5118ada07604ed8688ee707ddfa drm/xe/migrate: Cap PTEs written by MI_STORE_DATA_IMM to 510
date:   1 year ago
config: powerpc-randconfig-r052-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111659.V4ZZinjr-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111659.V4ZZinjr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111659.V4ZZinjr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: unknown argument '--ppc476-workaround'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
