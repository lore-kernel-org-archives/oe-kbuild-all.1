Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC86E1CAA7D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 00:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782866468; cv=none; b=TNaHKUCeJJviquUMsElNKQbHwGsT4cZmU3B7MdYW5hhsWfy/lHqIcCiEJLkxXWSCFKX20nL9bkJYY2IMOpboI27n67OAM32hXLat37UFx386KOG7sllrXM1tG22dv+sLJo4XH+ecddJL3bqw/Kc4TIdb6SEwAeMEi+mNJCLRCSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782866468; c=relaxed/simple;
	bh=365DmvIyoDiq1Y0wuiuIUViTX3dLCD/kBk1mQSBlehw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SUM1tEiPsbDdeb/bsnxX5yQb2PpmAILhgUQ71b8cjEpU/jsNco9Va0tknqrhx2jWaGu0CIvksVM8jWP3DfLe4v4xWLyiKEVcY5yItbvydl3//QkhoLXBCyi1rVWA3ZdB4BHMMri9gXVRisRZtO1Pi8nM57y5rCAHv3tfOZJJlrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7EXtuRN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7EXtuRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782866466; x=1814402466;
  h=date:from:to:cc:subject:message-id;
  bh=365DmvIyoDiq1Y0wuiuIUViTX3dLCD/kBk1mQSBlehw=;
  b=F7EXtuRNpr9rk5ipQD36fTBH26WSwrIb7jDgVHbRyvIZNBUA44i0vUey
   wGL8t/KMax6juG4syK9T81j+vNEDsMtVeNtrleKRxHezp6bO/x8GBAqOD
   BuCH4FaR5axL2qcz7CY3rYsEqUD0DvaOb9RlE+ImdylR3hkqU0BHnN7v7
   a8wWERKUHlztddROSCCLfPWa7ZwbmTnp6s7fMrqkUhS9/vkrW5DXBm027
   41oqD432SfBlLOvJKVVGYyzdNsiESviCqpA1IZmXQ1d4N3s2CKdYKjYcf
   ylL71YiwZl7NWGVqQQ1FCCqpGVoqTN8E9ha67ecaH5M2rmdZ1e3FzOhpY
   A==;
X-CSE-ConnectionGUID: +8RabWMMQIOpIcQxnxk+9w==
X-CSE-MsgGUID: LNf1InqXQyOqnC2fjyNAmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83463031"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="83463031"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 17:41:06 -0700
X-CSE-ConnectionGUID: shNE3nIPQLiy9qcHohpXNw==
X-CSE-MsgGUID: IXKinJAKSaaEnEekTZ8ELg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="257317527"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jun 2026 17:41:03 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wej0e-000000008oH-1SIn;
	Wed, 01 Jul 2026 00:41:00 +0000
Date: Wed, 01 Jul 2026 08:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Amir Goldstein <amir73il@gmail.com>
Subject: [brauner-github:vfs.fixes 13/16] fs/bpf_fs_kfuncs.c:377:26:
 sparse: sparse: symbol 'bpf_real_data_inode' was not declared. Should it be
 static?
Message-ID: <202607010857.9W9nD3wB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git vfs.fixes
head:   95a7bfacdeda14b5d31dce2339689d7f97d5ee22
commit: 69364d170f3b4659908dbef5650f9849d5c805c1 [13/16] bpf: have bpf_real_data_inode() take a struct file
config: loongarch-randconfig-r131-20260630 (https://download.01.org/0day-ci/archive/20260701/202607010857.9W9nD3wB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607010857.9W9nD3wB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607010857.9W9nD3wB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bpf_fs_kfuncs.c:377:26: sparse: sparse: symbol 'bpf_real_data_inode' was not declared. Should it be static?

vim +/bpf_real_data_inode +377 fs/bpf_fs_kfuncs.c

   361	
   362	/**
   363	 * bpf_real_data_inode - get the real inode hosting a file's data
   364	 * @file: file to resolve
   365	 *
   366	 * Resolve @file to the inode that hosts its data. For a regular file on a
   367	 * union/overlay filesystem this is the underlying (upper or lower) inode that
   368	 * stores the data, not the overlay inode.
   369	 *
   370	 * Data resolution only applies to regular files. For a non-regular file (e.g.
   371	 * a device node, fifo or socket) on a union/overlay filesystem the overlay
   372	 * inode itself is returned; for any file on a non-union filesystem the inode
   373	 * attached to @file is returned.
   374	 *
   375	 * Return: The inode hosting @file's data, or NULL.
   376	 */
 > 377	__bpf_kfunc struct inode *bpf_real_data_inode(struct file *file)
   378	{
   379		return d_real_inode(file_dentry(file));
   380	}
   381	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
