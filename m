Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD8F3B52E4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 10:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773914450; cv=none; b=Gqzvlpty6XgviSjLx2tW1T2earHsvOrf/T5TWcMmA1x9Yd8doOVWcfIdZzEUOe5nLzsWZHoI/yVACG91F8RANHT6jvhRPYtTO1vRn91fJQ36odPJhNCfmzRPFcONas0wv0Q/W0zarjax/pcxnuOBDGs1mnz3vUPBPsRk2hmX+Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773914450; c=relaxed/simple;
	bh=QbXmbmGJKS4gTU4WfB/TeGwRHroGXDbZKLsYkHJoQrc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ewsregQAdxjtjm0owQFFZnUTZL7jZL78/SYyYnzbOrhhAmt7uBT3G+6oCMpt8KUaOC9pjx9JslSz4fdr4PgllcJZBORpJXC3Bz9+6vHX153/9nfjBo5bCpT5votoUlOWiyYIcofKXBl3YH+eXNpWxr+8Dj4Mvo94a7KsY7gl8vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBElkzBp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBElkzBp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773914447; x=1805450447;
  h=date:from:to:cc:subject:message-id;
  bh=QbXmbmGJKS4gTU4WfB/TeGwRHroGXDbZKLsYkHJoQrc=;
  b=KBElkzBpU8MQ43s430Azt6d3lzXHwdVR2qThE6eFjWGSuAllTeQjUbMn
   SlIZDRWSHggSqDaZLr6eSb8VKfDcW6tPr0rZlk38Q1dYLW+1y2Wl684nb
   yI0FgupGQ+ferbf+LcIH6GykmArEMezpT64SgnZINhy9qMc73iKyl+s44
   yE8jFpNTJwZ/GOHiq2ScTomHCu6On58EeRKX7Gu+lRkbQbSYb/GkMmLHJ
   DCCD1GoPzWjO1K+cKVGbR1xgKW+XM/pc5wOXlWObY7AtgoD8HYYwYA72Z
   u1VaQaNjV07flYiiwDWE1w4HEH7pvDy7v9mJ8RdJlIWH1hewnQt11pH9l
   g==;
X-CSE-ConnectionGUID: /RYxkEvISOeNkCdf0HXHyw==
X-CSE-MsgGUID: YO5cXZeAQ32rutz1Bd6JUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="100441863"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="100441863"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 03:00:47 -0700
X-CSE-ConnectionGUID: aM/Lgc8vS8qCAXe5EBF1CA==
X-CSE-MsgGUID: CLSCcGBFSw6I4mDdvupCRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="227858877"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 19 Mar 2026 03:00:46 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3AAm-000000000jx-39cM;
	Thu, 19 Mar 2026 10:00:19 +0000
Date: Thu, 19 Mar 2026 17:59:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:pnfs-multidev 5/9]
 include/linux/exportfs_block.h:70:58: error: 'const struct export_operations'
 has no member named 'block_ops'
Message-ID: <202603191715.sXiRQTUw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git pnfs-multidev
head:   ef254ce1ad97896bea7955ce537d7348832b9648
commit: 6619f8b2f3c2fe5b89d216bdba37cb4b7d558d82 [5/9] exportfs,nfsd: rework checking for layout-based block device access support
config: arm64-randconfig-002-20260319 (https://download.01.org/0day-ci/archive/20260319/202603191715.sXiRQTUw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603191715.sXiRQTUw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191715.sXiRQTUw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/xfs_pnfs.h:5,
                    from fs/xfs/xfs_file.c:24:
   include/linux/exportfs_block.h: In function 'exporfs_layouts_supported':
>> include/linux/exportfs_block.h:70:58: error: 'const struct export_operations' has no member named 'block_ops'
      70 |         struct exportfs_block_ops *bops = sb->s_export_op->block_ops;
         |                                                          ^~


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
