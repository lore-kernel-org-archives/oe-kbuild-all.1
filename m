Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E1E8BEE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 02:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747450257; cv=none; b=CNC6oRx3hnrARV7O5boblytikIOyXn89GqA+fqCv8HbsTtHJuxYNwNVJ2LZbCSuemlU8dAKmDf4yDU7xm79yhBBzYKhlkgIY6VV7M/AlE5Zw4WdB4YVWug2V+ROX377ZjcbKmELH03hnhwlMV5SqNsQQy0+klBUV90fqm4R0LlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747450257; c=relaxed/simple;
	bh=rQcbzypUAzEq+OcVb2WkKLtSe0HdVlFZv4DvcJsQa0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vB/F+js9i+hEWnS6Llm/XeOWhSDEQGNQUm8fPmWBafq7OkzcC+HCcduLBaXteAInSadkyph1Rc/I9ysnz1wEytOjSEPteSoHc71w/6lDVJXax1+JEj5+2FVvFJ03edLD/erqTWZHomJCtuj5EXcXmXEZa7AGS4rmtrPU0MD2yPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5Slotki; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5Slotki"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747450256; x=1778986256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rQcbzypUAzEq+OcVb2WkKLtSe0HdVlFZv4DvcJsQa0k=;
  b=K5SlotkiTYfl3gpXjCFM/fLUxia9JXy4b6CgYc0DEEQabY4GlOOUU4zo
   5zRBw+6/e/fT89KTOOo+yapgPdsc4RynP0C/6Y6/3LTfD3wRa2agWGR0s
   2IRncIAEomIhtrVepDB7hKEEu+T3KQOnO4znyKPVufnm158tgInoPvbyd
   0jmNOf7WE2WVhhNVFjTevfCWgWOVMMadWpUqqwYpDhKGLEOyotbF/Irfw
   HUXjcNhWNMLv4NfLkbNzw/lOKQH97FdByGwRfszUDQHdfxnt6BWpogCxL
   jESGcX7TBgev+hUnKZ78wUGvbzQOJOqzJ2eQurhR3sK97H9c1GS6BygbI
   w==;
X-CSE-ConnectionGUID: v6jSEmUnR7KQhpK4B080dg==
X-CSE-MsgGUID: YcWeX5sJTUilKSPqYQrktQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="71934132"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="71934132"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 19:50:55 -0700
X-CSE-ConnectionGUID: 3QoShjjPSO2P2T59/FxDvQ==
X-CSE-MsgGUID: MzOqPoBJSB+DH04f5ZvnyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="142847077"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 May 2025 19:50:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG7dU-000JtH-0D;
	Sat, 17 May 2025 02:50:52 +0000
Date: Sat, 17 May 2025 10:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 18/18] block/blk-core.c:894: warning:
 duplicate section name 'Note'
Message-ID: <202505171058.RJR0QuhZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   147b27e8d66c20bee7541b52cd32243cd495c94c
commit: d6f0f66569f2f74c9095a8c4e8c43bff2b571769 [18/18] ANDROID: block: Do not set the I/O priority for zoned writes
config: arm-randconfig-001-20250517 (https://download.01.org/0day-ci/archive/20250517/202505171058.RJR0QuhZ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505171058.RJR0QuhZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171058.RJR0QuhZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-core.c:894: warning: duplicate section name 'Note'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
   Selected by [m]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=m]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
   Selected by [m]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=m]


vim +/Note +894 block/blk-core.c

   884	
   885	#ifdef CONFIG_BLK_DEV_ZONED
   886	/**
   887	 * blk_bio_is_seq_zoned_write() - Check if @bio requires write serialization.
   888	 * @bio: Bio to examine.
   889	 *
   890	 * Note: REQ_OP_ZONE_APPEND bios do not require serialization.
   891	 * Note: this function treats conventional zones on a zoned block device as
   892	 *   sequential zones. This is fine since zoned UFS devices have no conventional
   893	 *   zones.
 > 894	 */
   895	static bool blk_bio_is_seq_zoned_write(struct bio *bio)
   896	{
   897		if (!bdev_is_zoned(bio->bi_bdev))
   898			return false;
   899	
   900		return bio_op(bio) == REQ_OP_WRITE ||
   901			bio_op(bio) == REQ_OP_WRITE_ZEROES;
   902	}
   903	#else
   904	static bool blk_bio_is_seq_zoned_write(struct bio *bio)
   905	{
   906		return false;
   907	}
   908	#endif
   909	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
