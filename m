Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3806331E83D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 04:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789360204; cv=none; b=WEAd/5s+AR3Oz5S6ooVbocJRp1tDIKAeW/OnI1ezIV9kfx1hOjmMDl4jOYRxgvNtGcW/byiY/82o4JvNZ0PrYU2ouMUvbd44F0n+jTT4IbNJGhtmxLfMDjPIiCtpT2AlzvWkP5bQw9qFLWbjeXi1vSsncEVBNwB1VoR4cz4rdxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789360204; c=relaxed/simple;
	bh=XtNIxyEJyjZtG4JCuFsxy2ORex0UbEKxuIjQ4Tiddsc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UkP6IvIqquJwDB647tgXCBnB8XbhxMCPPVd6VpuarAxxeTI45eNq39WfhZyNsmWWZdr7eBFv0fT6sJErkDu3uyygR1Da1kIE2NEBamcyERPo8/sjTt33CCEs0Fz8PCuBoPiwCdYPG1DNsPnpW8V58zIQufLWWC5Nvs1kJylgcYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4aSgYcr; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4aSgYcr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789360202; x=1820896202;
  h=date:from:to:cc:subject:message-id;
  bh=XtNIxyEJyjZtG4JCuFsxy2ORex0UbEKxuIjQ4Tiddsc=;
  b=H4aSgYcrHgubyNWLUujFnjirCZxA8L2EWaqfPU8MJzxztSGd8Z0gGicR
   M9kerR6rTUVZbhs0mIWqOX5DuZE584nqvw1HEp58bLxGRfFSAXFvGeFbp
   Qq137wC1FbmlSeohHMjiHgJNt8hRapCoxsNGUZqRBERXvVc7QgVxVswTs
   ah2Nx+f2Umap8NSGXqwfD0ost7Jye/QGhanbftP/BQqX4CvrCpoHH1csi
   Q3lZRbKp4G/bH2ufhL5urSE357QUMSkrc2AbRTZK/f9r5O3dvD0nN3ya5
   r+Lku9kEpScwvMYvi6r3SEjESq/SPrUFaQ6zkyj4jL76t75t+iVyxPWbQ
   w==;
X-CSE-ConnectionGUID: xlCbzT7VTqSJyy1v4sYlRw==
X-CSE-MsgGUID: KH4ZWkHOSV6686iOPOYmxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="92222717"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="92222717"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 21:30:02 -0700
X-CSE-ConnectionGUID: VWXvB0rtT+25ltlbwKaAXw==
X-CSE-MsgGUID: UePaxulDQMeFn/Zi5JDsDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="268241765"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Sep 2026 21:30:00 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5yKM-000000002Ub-1YNI;
	Mon, 14 Sep 2026 04:29:58 +0000
Date: Mon, 14 Sep 2026 12:29:52 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 18/30] xfs_sb.c:undefined reference to
 `xfs_data_csum_shift'
Message-ID: <202609141238.b7bhOvoE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   13c4aa2fcb1f62fdf47e7abe90741e89f682761e
commit: 7f5797416a817a414c43c8d72e0b145ae563e960 [18/30] xfs: add support for per-RTG csum files
config: i386-buildonly-randconfig-004-20260914 (https://download.01.org/0day-ci/archive/20260914/202609141238.b7bhOvoE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141238.b7bhOvoE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609141238.b7bhOvoE-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/libxfs/xfs_sb.o: in function `xfs_sb_mount_common':
>> xfs_sb.c:(.text+0x19e3): undefined reference to `xfs_data_csum_shift'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
   Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
   Selected by [y]:
   - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y] && PM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
