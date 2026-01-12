Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A6236165F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 15:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232674; cv=none; b=lPm3dL7KNpjeknfcqBDMcCLG6WjOASfpWHUbxZdoGPhXoInJEAafREXVQc885+G6KfZ0hOsoO5SFmb7ghh9qgolPirqcpfPvfMtwj6x0hrfwilLq+N5By4Zy7Dbs56yeFmwkB/hxJxR9VQqPGFfs881yH/0pQrBgkpDw3USYOy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232674; c=relaxed/simple;
	bh=RnTKIZWeWkYnflWKRNVEzRZHmlXaFi1oQAM9ReF9IiM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QBOyMQu1oPxEJQ1RL2Q+PvJu56OZ1AISqm8G1uyFszCBJDK5zEkgZnsWZdB/7EZpdvC9b3Qc6CzrWsIkPKEiB4NHwk0JzJ2GX6utdH5qGkJQVwVBor7yx7buXintNWdPcI+NK/n3lg69FL/i/KSQBoxoOJaVTlFoP3jFpYtdORA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zz5XPxS2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zz5XPxS2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768232673; x=1799768673;
  h=date:from:to:cc:subject:message-id;
  bh=RnTKIZWeWkYnflWKRNVEzRZHmlXaFi1oQAM9ReF9IiM=;
  b=Zz5XPxS2PHZ7VhJ1t95XmPKLPWaHIAlbsclkIvM/5uL/C1kwk3+tzbUo
   4QgPxu5Dv7q40OQ6ZibW2xRLw3dR8u1ysXDJ1aFphAB5NVMCdB9cNsUJN
   O6vqWm8j13ThZ9vGrZtNPEPxAuB1UNa+1t1K97KxYx7EnD+ykEfSqwu1M
   XEFm1/AEFMZo7AxmfboxA/W1cpeeaHG1swG1ZRl/6hSjNKp3vY8gH4xoy
   EJLPWCgrx2jGB8zx69oHkW6aj9tCCNoG1A2V3kNsdZkOezvyz/rTQdi3Y
   8FKy+TneHbTw7oZliQzRE3IWOGiUq227x3FhoOTuTPdqeWHFSHd8khG3X
   w==;
X-CSE-ConnectionGUID: smqgdJYQQeWJBmR0S4ptvw==
X-CSE-MsgGUID: kfdk0C+yT/2f+0Lb3Ngd9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="94985977"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="94985977"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 07:44:31 -0800
X-CSE-ConnectionGUID: qwtmHsx5QeGP/cRdHBaftg==
X-CSE-MsgGUID: 1++KiPoPSNKRTRQnjexoBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="204399462"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jan 2026 07:44:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfK5j-00000000DW4-3xoR;
	Mon, 12 Jan 2026 15:44:27 +0000
Date: Mon, 12 Jan 2026 23:43:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-service-container 80/91] {standard
 input}:5366: Error: unknown opcode 'sub3_s'
Message-ID: <202601122331.M0rdi09t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-service-container
head:   6ca1137d96cac4575cd065a9a9869f875c6c8175
commit: 3a0ab8896e67ec4e233ff06bf6797ca341babdc5 [80/91] fuse: cache iomaps
config: arc-randconfig-002-20260112 (https://download.01.org/0day-ci/archive/20260112/202601122331.M0rdi09t-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601122331.M0rdi09t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601122331.M0rdi09t-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:5366: Error: unknown opcode 'sub3_s'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
