Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E721614883F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 03:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736222260; cv=none; b=ku8KmyAb1BAUGztGBVGn1dEz9YyXhVR0x6BDqKy3b2yz1MMGa3GMnQzs3Bwmdd1CS+bAcliDccDgDUb33/fdiAdLS5qCAzNVK4CBgCk0YW4DqW+knUYTd069YPdB3VAByzdW7KYdemiauQbmN5UgT5MMqyvbrlXIDWE4CLDvEtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736222260; c=relaxed/simple;
	bh=JjXeSDzx/0x6q1StWxtY87m0IpS0Xbn+ALPgD5o+ckE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tD+rXrLq1dz2Ry7fNgXI8vNT2MQW3CgjnNfR6zG51fwUcRDdOEQIiw3HMlNsKtdaow9hkJXujE5AMpu7fIorULT8RtmVft4h7gGgUJ3Iy8l2/5bArT9TU+BESW5oJ3h84lFxy+2OKFDfCTYAnndlvpJwb9u7UoDJMUCbjEJqmZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q8nsXG4W; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q8nsXG4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736222258; x=1767758258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JjXeSDzx/0x6q1StWxtY87m0IpS0Xbn+ALPgD5o+ckE=;
  b=Q8nsXG4WbfdNpTxrNJExXnrNR5gGa6OTriQyLUIGfkWyTeXCrTT3gGFK
   q3Ke0C03JTaf8bj2U4DTg+XR+2uPjuM95lQjjwP6D6Lj1FyvrDVgM1N4B
   ceTM/4oepyScxr1k9lB7Aa66V6f20+uUldewmoZyGeJqlXbdm6LfpOfp/
   ttWXA9VWBUPW7lrhSp8901bGbe/68yhGfY6gi4NsmIHXszp55xfbpClcg
   CQNPrQf0ByEIuvrTdKWtNKHxY6/6YgWC4Uo1TTjHWRYXvFJ4f6YzP3kwa
   +aY1GPaPqZZhju4R540+NYtO6T8DwPn7SDDjpccLdtF2V9X4ZmZ7AXu6I
   w==;
X-CSE-ConnectionGUID: FHAxGRxTRT+7X4qWbj1ypA==
X-CSE-MsgGUID: juheIox3QvGYAoy+0ZkF0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="40161116"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="40161116"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 19:57:37 -0800
X-CSE-ConnectionGUID: NhqVQYCBTWyE27uhPxAWPg==
X-CSE-MsgGUID: YKyfW9WcTNONLsHcEZuW6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125925229"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jan 2025 19:57:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV0ij-000ECx-1V;
	Tue, 07 Jan 2025 03:57:33 +0000
Date: Tue, 7 Jan 2025 11:57:16 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_pagecache 5/6] inode.c:(.text+0x4370):
 multiple definition of `migrate_misplaced_folio_batch';
 fs/btrfs/disk-io.o:disk-io.c:(.text+0x17cc): first defined here
Message-ID: <202501071123.CrfK5kyw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_pagecache
head:   0b481ba53a1ea6337129cbe63f9234a748df4843
commit: 853ef17ea1577e0a625e695acd45250f2610f004 [5/6] migrate: implement migrate_misplaced_folio_batch
config: arc-randconfig-001-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071123.CrfK5kyw-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501071123.CrfK5kyw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071123.CrfK5kyw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/aio.c:40:
>> include/linux/migrate.h:159:5: warning: no previous prototype for 'migrate_misplaced_folio_batch' [-Wmissing-prototypes]
     159 | int migrate_misplaced_folio_batch(struct list_head *foliolist, int node)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   arc-elf-ld: fs/btrfs/inode.o: in function `migrate_misplaced_folio_batch':
>> inode.c:(.text+0x4370): multiple definition of `migrate_misplaced_folio_batch'; fs/btrfs/disk-io.o:disk-io.c:(.text+0x17cc): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
