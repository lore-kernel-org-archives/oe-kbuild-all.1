Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC2018021
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 15:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708789388; cv=none; b=AJRe5GM003PDgd1mCxRypEF8iqOAbxHM5sMC86yv2LHFrWg332CrPfdbbiISRfELy+XWqFPagGyf3l0MRMwqdSiqWHiE980Jj19ohAYjG1GAvMt5tTLNT5zAANTK7ZV2x7XlXyiTSR6HluPrVYZV6eIjUm/ixOP+Qb5rkI7tE/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708789388; c=relaxed/simple;
	bh=XiAE9MUb7lUlER2Mk0zAHU42+WhLzRnzOCxTwINPK/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tN4Ax7QDhnZOkgltm2On4CXYH4zZ35brtvrg5i3H4RDV3CZIUPDya8nLgkjeH2NPNwsutF913r4xN9c7GuJ8ge/p7sGWRD9hTIrNPiMszNPIv3LWttgQL7urIjntkdngeOuDGIlQRCLgQ8DF1bNT1GKbBUsxt9bgZxguqFDSZ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTuROzLO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTuROzLO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708789386; x=1740325386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XiAE9MUb7lUlER2Mk0zAHU42+WhLzRnzOCxTwINPK/o=;
  b=fTuROzLOvgunhXM9irP7qH64vhd2HeKHt2faSFr/oJwDTgLui0aaMHS0
   QPqUbxZP/RvcmPsFlufjP8vJD26fwmGSU7RY49zDfdjqhpuaC+pTR2Rv1
   yrMARXO5LbcKtZH2BWEV8pSxOJn13su7EVDNe1/t7YSJUN0jaykNlFR8V
   FBA+InsNeSfoDB6gG8joL+bGqW5hwcfHzpCbHyS+NV9pNegIR00MzL/Wu
   bQfWW8Gpzzyup7ITQHTmM74fBOjA6/WH2zX6+lj4JueOwAVXvWnJRbjYS
   a+UWROnMM77tQxs9YfPdORj4Zu9sAyAe08xeg001jed6XMUSfXNWpJjZK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="3263980"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="3263980"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 07:43:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="43674074"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Feb 2024 07:43:05 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rduB3-0008ei-2E;
	Sat, 24 Feb 2024 15:43:01 +0000
Date: Sat, 24 Feb 2024 23:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Yi <yi.zhang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [riteshharjani:ext4-iomap-v3 33/40] microblaze-linux-ld:
 fs/ext4/inode.c:3621:undefined reference to `__divdi3'
Message-ID: <202402242331.WqTCBsjE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux ext4-iomap-v3
head:   9e716d325090913e86881adce749ee351757232e
commit: 0270bb5b6bb6e0a43a4edd72e6e0087cba6ed650 [33/40] ext4: implement writeback iomap path
config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20240224/202402242331.WqTCBsjE-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402242331.WqTCBsjE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402242331.WqTCBsjE-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: fs/ext4/inode.o: in function `ext4_iomap_punch_delalloc':
   fs/ext4/inode.c:3621:(.text+0xa68): undefined reference to `__divdi3'
>> microblaze-linux-ld: fs/ext4/inode.c:3621:(.text+0x1968): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
