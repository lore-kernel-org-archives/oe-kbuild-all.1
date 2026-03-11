Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A733431E3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 02:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773197154; cv=none; b=IYPaVAAHHD0oQ3xo1qc98sDRUoVlajY8OXg7024J/Hr8zsE3TLMt2OLzNEXulxhL9PHcoqKBHoClp5sq1onEeacmj8XzJkAhWzPMNGhRSxkwesYP0020hhp3X99cktLrp2WWtBtIELo6NhA2bPsLe5RxGVc7jYA5T88b/uDUjc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773197154; c=relaxed/simple;
	bh=kP4H5ILHYCQhHUKCUcDaws+2ZElIg0cITZ7WpqJh1wM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cBpJY196uKyLPnsTX6CE7KurhogqUHi2LW9tki4BacyAOSAYb/loN4Io8zDO5HpZ7Jcouf91jBozCuddiwhI6RWwjxfNatG6kzFBk3xmZp4qnZxLCD8/79bB9qgy63Fd49cLKhH8EJiHNC/xvHojBqS7Rf9LaRdYwNTJR7h3pb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDeL5zHt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDeL5zHt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773197152; x=1804733152;
  h=date:from:to:cc:subject:message-id;
  bh=kP4H5ILHYCQhHUKCUcDaws+2ZElIg0cITZ7WpqJh1wM=;
  b=XDeL5zHtdKRLHScSxNyl1rYB/ubSEMZIg28O3JH7OXuGH4VQJsnsEvBQ
   qho/0c9UCfS9rZQzVvpEcWO49X8H695laOi8qMC1I3eLSbnzlaqx3MRwD
   s0rKzaIIEdSwrpNbCIopNmJBEyWFAm9rDWne+yvwW1sDCML+NdhQV2rVe
   QDihrBlXzUiNpBXLQjJ0xoEizp9Nkz3E3mBMm/xljYaTK11MKiByVYeV3
   Y7aHVy6LwIskjCSSnOofrscaZnF5q+hUFEWb8yZHskxNy5OnOHPHup4qS
   9PrIWpL1EHj6hVG+nOmrjHDm8SYxSqCWYH3XAOtIBE93y9R/hcgJak2lH
   A==;
X-CSE-ConnectionGUID: 5pm+qV19QcWTg0vOJ25woQ==
X-CSE-MsgGUID: qFDd3qpmSaqhq3inVUsWag==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="84965043"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="84965043"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 19:45:51 -0700
X-CSE-ConnectionGUID: UGcFqHrMTgiOWRf9vJvfHQ==
X-CSE-MsgGUID: IxYb4lC9RZyoqW1Ja0uBwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="224485025"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Mar 2026 19:45:49 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w09Zy-000000000bh-2b9P;
	Wed, 11 Mar 2026 02:45:46 +0000
Date: Wed, 11 Mar 2026 10:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Jan Kara <jack@suse.cz>, Chuck Lever <chuck.lever@oracle.com>
Subject: [linux-next:master 3545/5327] bmap.c:undefined reference to
 `__aeabi_uldivmod'
Message-ID: <202603111037.D6feRBIx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jeff,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7109a2155340cc7b21f27e832ece6df03592f2e8
commit: 0b2600f81cefcdfcda58d50df7be8fd48ada8ce2 [3545/5327] treewide: change inode->i_ino from unsigned long to u64
config: arm-randconfig-004-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111037.D6feRBIx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111037.D6feRBIx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111037.D6feRBIx-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/nilfs2/bmap.o: in function `nilfs_bmap_find_target_in_group':
>> bmap.c:(.text+0xc74): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
