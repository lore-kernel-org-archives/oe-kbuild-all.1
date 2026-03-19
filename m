Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F3A3EDACA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 17:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773940507; cv=none; b=icByQ9T5Q1yF+VDj6uWrTQtQ4H/oogvXKsB8NEqzj47T+vIl+Fi6LAsbgt31SMCT2sTS+pURgq0RdKoX8DGhQI+WUcDMSuEhbyKdZnkoUbmdk3YjxDELpotLZmqo/mHohR3I6P5d488zO+NWucBcXi4fKnxUZhIkyoZIXOO8MyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773940507; c=relaxed/simple;
	bh=cfa+/87LOyGD2Um/RK9T+3q+hB4kM6gZMFPEH6lxWE0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FnyU2/GPIZROhjMVZ1BElQ79FUAHODx6s3OyMU+xkdVbQs4XS7QQrKY/zMFOZfIl7elhPNM9lkbijAzUrW3yiRd6fzLTb+h+Gy+gDVRi4CdW3V+oWJ5Q1dbX6cIlprzkpbpf0rW/w2aPnpyYQLQ0pYDBWNXq9X/FHHO6aC/XbB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TkzRq5IB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TkzRq5IB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773940506; x=1805476506;
  h=date:from:to:cc:subject:message-id;
  bh=cfa+/87LOyGD2Um/RK9T+3q+hB4kM6gZMFPEH6lxWE0=;
  b=TkzRq5IB1ntP9/+mAHAs54vMD0DXI4Lr8JrltHyBRn0lDxeJ+jPbP3PI
   SPeEgs+8xvwBfrQOyX7g01FfduzSOyCngDN4o8MnZV8WmmIMQuwUQJo8B
   JYDF4Bbqq+6gm2gKqG1DOJqsha2DS8WgQMFkc3YxDfnJl/Tn15f3F/+DA
   v8+He/eq7IyZUrdkg4zZGCyrVXJ9Z19fnuTfrg180s8mAE+Molb3lX8+e
   ZLwYeCl6BnqAbtL0/o/0/0zeMBTjBb/RKfSl8cm6ODmYGF9bQfOTPI4zM
   YR59Mr5mGjB3dm15+KzApD6/XtsRyA5NyXkNxKNXnm1+8F1re1qKoTCV+
   Q==;
X-CSE-ConnectionGUID: Uu7QqfljTmSJ8MiWtkmKLA==
X-CSE-MsgGUID: mW/HwmkXRD+OOlA4ac+HWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74908748"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="74908748"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 10:15:03 -0700
X-CSE-ConnectionGUID: RDfxZIM2SfOkkcWGQjKvDw==
X-CSE-MsgGUID: i/fLypigR+Sm9J/mRFfAgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="227730925"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 Mar 2026 10:15:01 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3GxX-000000001PL-03yb;
	Thu, 19 Mar 2026 17:14:59 +0000
Date: Fri, 20 Mar 2026 01:14:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:pnfs-multidev 5/9]
 include/linux/exportfs_block.h:70:53: error: no member named 'block_ops' in
 'struct export_operations'
Message-ID: <202603200149.a40pnfY5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git pnfs-multidev
head:   ef254ce1ad97896bea7955ce537d7348832b9648
commit: 6619f8b2f3c2fe5b89d216bdba37cb4b7d558d82 [5/9] exportfs,nfsd: rework checking for layout-based block device access support
config: arm64-randconfig-001-20260319 (https://download.01.org/0day-ci/archive/20260320/202603200149.a40pnfY5-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200149.a40pnfY5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200149.a40pnfY5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/xfs_export.c:18:
   In file included from fs/xfs/xfs_pnfs.h:5:
>> include/linux/exportfs_block.h:70:53: error: no member named 'block_ops' in 'struct export_operations'
      70 |         struct exportfs_block_ops *bops = sb->s_export_op->block_ops;
         |                                           ~~~~~~~~~~~~~~~  ^
   1 error generated.
--
   In file included from fs/xfs/xfs_file.c:24:
   In file included from fs/xfs/xfs_pnfs.h:5:
>> include/linux/exportfs_block.h:70:53: error: no member named 'block_ops' in 'struct export_operations'
      70 |         struct exportfs_block_ops *bops = sb->s_export_op->block_ops;
         |                                           ~~~~~~~~~~~~~~~  ^
   In file included from fs/xfs/xfs_file.c:36:
   include/linux/mman.h:157:9: warning: division by zero is undefined [-Wdivision-by-zero]
     157 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:135:21: note: expanded from macro '_calc_vm_trans'
     135 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +70 include/linux/exportfs_block.h

    66	
    67	static inline expfs_block_layouts_t
    68	exporfs_layouts_supported(struct super_block *sb)
    69	{
  > 70		struct exportfs_block_ops *bops = sb->s_export_op->block_ops;
    71	
    72		if (!bops ||
    73		    !bops->layouts_supported ||
    74		    WARN_ON_ONCE(!bops->map_blocks) ||
    75		    WARN_ON_ONCE(!bops->commit_blocks))
    76			return 0;
    77		return bops->layouts_supported(sb);
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
