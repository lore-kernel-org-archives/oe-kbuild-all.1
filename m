Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824CC226D1B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 19:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742499351; cv=none; b=qUzuuMzYQwdQh1gKY0jhToXcsE2a7mSI6j2br4u64/slJTO8sWalrnBqC6XitaygHAfDhmOjXAfDvCoKA05tIl3TzPnANjpNk47wYgL5q+8UKCZ2hH0dSKcaGLprY44xF7sOMivSc446cua+eG9bjK4hhOkmWJywlpLS+EevYk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742499351; c=relaxed/simple;
	bh=T7yQOmamAXl/0+stYuZQ+lreO+axl46jtnB0Qr6qx1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JlQ9SR2l33WWCdGmZY4cWi8wB4C+ktIIgGeGK20NpoFNMa+MagUdTHHR1986Q+whgdCrTh5T5A6mylg7j9MyzQFUZ5Ru6hGxc0tNDoYMin/VClcsBRAFUHLnLvsKMEAFYnmq7MMX9K0W2Tfqfjai85vXimlLmrRZlHQT1pvN3VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FfH3BLTb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FfH3BLTb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742499349; x=1774035349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T7yQOmamAXl/0+stYuZQ+lreO+axl46jtnB0Qr6qx1I=;
  b=FfH3BLTbW4HUS2wodTHCbglYOFSpHiWVrZsNFma0aWT+MoCKGvoN3YWD
   1ApAYrvppu5QjI0fYkVcIWvRc5LQNPrZ2gMCawYQ9rLau+ugPnRcPEjWP
   +B6coxmcLQZwc5xV/HnA4lCOmiOVnLIAuRmjvH6y2KELiPGapHn7xR8wW
   Jrmwt3ibQIFJfw94EoGw9cioVPtlFjglzHqI+2WlxB7dfwZIs7ojzFHG9
   QkKamNAFJeY/QevfOpJNiW6X0bsmoDaOBu+k7/SsIQD3FQdnYcaDfVeWZ
   d0m3hMDmFk0daBxKLjqNqx/6i+XZYftKXeSpkQRq1rrRdssseMgfstSer
   Q==;
X-CSE-ConnectionGUID: F4XTpkm2TrmIiUPYezbN0Q==
X-CSE-MsgGUID: ATrvEgIMRW6/uxy35zjYVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="54416776"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="54416776"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 12:35:48 -0700
X-CSE-ConnectionGUID: Ktn25ZwySXOA2t7NvUXJDg==
X-CSE-MsgGUID: /7L/E7mLTUSH//+moqegkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="123000839"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 20 Mar 2025 12:35:48 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvLg9-0000iJ-2w;
	Thu, 20 Mar 2025 19:35:45 +0000
Date: Fri, 21 Mar 2025 03:34:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 8/8] ERROR: modpost: module
 snd-compress uses symbol dma_buf_get from namespace DMA_BUF, but does not
 import it.
Message-ID: <202503210355.unBUK0Fc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   7b65a6d404ec082697bd8150d890e65b9e24164c
commit: 55670275a4b2f66710da9f3c902f4af3e3474943 [8/8] ANDROID: GKI: Enable SND_COMPRESS_ACCEL
config: x86_64-randconfig-r123-20250320 (https://download.01.org/0day-ci/archive/20250321/202503210355.unBUK0Fc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210355.unBUK0Fc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503210355.unBUK0Fc-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/bpf/preload/bpf_preload.o
>> ERROR: modpost: module snd-compress uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module snd-compress uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module snd-compress uses symbol dma_buf_fd from namespace DMA_BUF, but does not import it.
ERROR: modpost: "snd_soc_acpi_amd_acp63_sdw_machines" [sound/soc/amd/ps/snd-pci-ps.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=m] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
