Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0489625522B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 09:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002956; cv=none; b=KVhkrhXg2MxZm8Sk6tEUEgwxXyWnjw21QndaqYF5a+tEWNptRmN4FY5QzEZh36BvnoY31FydVb3ClNm/24iULjRONLo13uSjZ2W1sMkBV+zGS4HkJ7VQlCzL1h6iD+l1kXJ5ZizhDy9KDKzl9Jbu5enPomRfpCPI5MvBGEp86a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002956; c=relaxed/simple;
	bh=f33U6CX6cUa2GUHoMlTcZ1v0O9M89Ft9bxi04tAdpfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AVd4501O14S6WpaO6opXKQL2skKSGBB9R3bOJvfvqMdw27zZnxnlRHxvvmEPgv76CE7MXYFvbepguAxd0KuSjrzNZsbrC5QS9/Icti8//4jI1FDKU7ZUfMfCoJ4K2257G3Cvj7j2K4A7V5QtokVfq2i/sz637guLFnJiHO40td0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0hTT+9O; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0hTT+9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760002955; x=1791538955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f33U6CX6cUa2GUHoMlTcZ1v0O9M89Ft9bxi04tAdpfU=;
  b=Z0hTT+9ORNKNbrfRml4O8UavfGD/phjrUWk6n5cJeMd8NXUO/rdM2OXS
   s/szqGMESWlhRuhDLc7hlFzbduo89hV+R2eEEiwXwnzwciP/o902Uv10Z
   Z4NxLX0ZF0dx4O2V3mi8X4z/nrQz1sdS+N77aAAZw/bYh4X02fRvzKDYN
   ZaQFFjDpy+VNWW/OtY4cD4gnPj6UO98mobnv+3f+CurEyUG1ujKwLuGhP
   Rc8s3oV+1FgaXS5NUGtIIAq3rUpXeC9X+77U6PiJF7/EoJzZXnEThOTxC
   Yni0/IGlXYQmvQWh2ffkpwdZZeSQ7qL48OIRWrGlA8tAO6MjahtsiyMyE
   g==;
X-CSE-ConnectionGUID: B5a6JCNDRiOfswdsp6/caQ==
X-CSE-MsgGUID: sn4EoRHBR6yaQrrhTUHZEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="66061666"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="66061666"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 02:42:34 -0700
X-CSE-ConnectionGUID: NEWammgmR76ZGhfUNkq5ZQ==
X-CSE-MsgGUID: FLb58DFER5eMGGMmo1832w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="179923315"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Oct 2025 02:42:33 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6nAL-0000RH-23;
	Thu, 09 Oct 2025 09:42:29 +0000
Date: Thu, 9 Oct 2025 17:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Joel Becker <jlbec@evilplan.org>,
	Mark Tinguely <amrk.tinguely@oracle.com>
Subject: [brauner-github:vfs-6.19.inode 5/6] fs/ocfs2/super.c:132:16: error:
 'inode_just_drop' undeclared here (not in a function); did you mean
 'dquot_drop'?
Message-ID: <202510091700.vwQdFBwv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.19.inode
head:   fb43e3dde8ec9fbf8f0a5bd558bac28f8140a424
commit: 20bca90a05e3976a4c63ff5af4f58452766d345e [5/6] ocfs2: retire ocfs2_drop_inode() and I_WILL_FREE usage
config: sparc-randconfig-001-20251009 (https://download.01.org/0day-ci/archive/20251009/202510091700.vwQdFBwv-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251009/202510091700.vwQdFBwv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510091700.vwQdFBwv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ocfs2/super.c:132:16: error: 'inode_just_drop' undeclared here (not in a function); did you mean 'dquot_drop'?
     .drop_inode = inode_just_drop,
                   ^~~~~~~~~~~~~~~
                   dquot_drop


vim +132 fs/ocfs2/super.c

   127	
   128	static const struct super_operations ocfs2_sops = {
   129		.statfs		= ocfs2_statfs,
   130		.alloc_inode	= ocfs2_alloc_inode,
   131		.free_inode	= ocfs2_free_inode,
 > 132		.drop_inode	= inode_just_drop,
   133		.evict_inode	= ocfs2_evict_inode,
   134		.sync_fs	= ocfs2_sync_fs,
   135		.put_super	= ocfs2_put_super,
   136		.show_options   = ocfs2_show_options,
   137		.quota_read	= ocfs2_quota_read,
   138		.quota_write	= ocfs2_quota_write,
   139		.get_dquots	= ocfs2_get_dquots,
   140	};
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
