Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E25189BB0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 04:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767241229; cv=none; b=IctbkGNPA8PwC47KZF5iQByXVSKRxfKeU9S5epfz3+NkuJUxtIHNSf8f234TerhqBRREFJTu7/uesjST4PQ38OnbSDzoEq5k0Igbeo1dC204hsAdqG/ck2hJMOYFlv6sBLXux2chsvpJT2V6aS7wWRRU6/MpUDm1JCcA8mgi2LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767241229; c=relaxed/simple;
	bh=sIMxsmhqwobne4043YyS/nGgV9u9PBXNxlt8b9w0TPA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Uj8NDa/tNkDVwZYqMTpU0rW/NsLcRNKmPTwJTI/FGHQMAXeEkyyzhSaYdoeow+6fINhZBi8T4VYvgqfGT/BiTacjX4Z3t56CeAn4mHto0coW+hy4DStgRV6H6JnWdQNqku/eVXuiMMmEsTvV7IZf5s7SvMAsf648MwWTSZ8uT4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qnj5OfdB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qnj5OfdB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767241228; x=1798777228;
  h=date:from:to:cc:subject:message-id;
  bh=sIMxsmhqwobne4043YyS/nGgV9u9PBXNxlt8b9w0TPA=;
  b=Qnj5OfdBM5C74qjwBHCi1DhM7REyK+OoYwxjySR/dGxyHh5CJMqZUWX4
   gE6kq71Sa2MBeepBucFuf/CDCaY3mtbbkYFhC06pSl+YdbT3wXdtxbrzn
   TyFUhQxKpcwpBDcX8LZCw4JcX9N3OriXCojA/TVvY53UDA/AmwdYculaW
   39Yo8OmbU5BSCAfQwNmCyk8s14maHao4wGbbQhwN7JR4v8KyFPihQNwvB
   Szju1+umnExm/3pwo2WNPC5I1EaU6e2FRB9qqBBh+Zy7979FP6xATh9mh
   zaQbUAJb2mh/L1gXGmgO7mkAh1ftK27XeYBBgraKQf4MvBMXN9Om3XoRF
   g==;
X-CSE-ConnectionGUID: NAtAWepDQkClTDZ//NRZFA==
X-CSE-MsgGUID: gdXEyTNhRvGRaFNdM+KVNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68536821"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="68536821"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 20:20:27 -0800
X-CSE-ConnectionGUID: jXxJ0TUuSU+C0syjV2Epjg==
X-CSE-MsgGUID: PB0naegBRdSLr3qbGqj3CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="239014699"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Dec 2025 20:20:26 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbAAh-000000001fF-2zNA;
	Thu, 01 Jan 2026 04:20:23 +0000
Date: Thu, 01 Jan 2026 12:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linkinjeon-ntfs:ntfs-next 13/14] powerpc-linux-ld:
 fs/ntfs3/inode.o:(.rodata+0x4c0): multiple definition of `ntfs_aops';
 fs/ntfs/aops.o:(.rodata+0x740): first defined here
Message-ID: <202601011249.4CiRA0iM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   8d80646ca301cf38045a4b3e64f5cd2e9f81ba85
commit: 48dfd6c60be6089e6349b7124222b12d2607691d [13/14] ntfs: add Kconfig and Makefile
config: powerpc-randconfig-r073-20260101 (https://download.01.org/0day-ci/archive/20260101/202601011249.4CiRA0iM-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601011249.4CiRA0iM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601011249.4CiRA0iM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> powerpc-linux-ld: fs/ntfs3/inode.o:(.rodata+0x4c0): multiple definition of `ntfs_aops'; fs/ntfs/aops.o:(.rodata+0x740): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
