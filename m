Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E367910A05
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 03:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708571978; cv=none; b=GSwZS6BPX7GRDt5a9QvHq/vrSU7AtGuvXw+Ni1czfm+oW3yHhvRtmjsbf+/KeUc9RGOYA251yzHqGbUTKBXE4gPn1so99HQjvA2Zwp43JcG36YbgtfJY5uS5cbcy+R6+RfAFeEuZCnk85nIU/xQpQJAT2Vb3fns3enMvBoadork=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708571978; c=relaxed/simple;
	bh=ncJBdo8soEGRm97GGgjOMG0MnAuZ2pCq715E6jfvtzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ICfkMYI2Y3Ly2gm81/S8iFby3T3bUwYs76dM5FrNm2JSljriPRZ1eHBNF2idtuawE2kTnWaxssedcAfFKgdvMg0+NH5apYVmpiMML6Bdp9W97fk5my2Y3Geq+pWy/NdN1JJo9xjF68m4vx0KcXmFirOFxKgwqhPqN68VmwvOEDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G1ug0v78; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G1ug0v78"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708571977; x=1740107977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ncJBdo8soEGRm97GGgjOMG0MnAuZ2pCq715E6jfvtzU=;
  b=G1ug0v78v8zZ/NOh2c+7LTLyeQpBer2kLf/nvH1rY4vIPNy6GbC7jWKC
   qUyFwbO8TZ3Y9qmW5/bEPruMvABVxUnr8wFoaOgKF66+iWU2oxaXO1UmP
   4qADorCxqHv7vfQDhft1v74X222KvUaenhjOcRXYwUy3zAgKi/O616L6g
   OCTebla6ejV6dsqHrK0gm59WrrlgI1JOT946LBIO0ks2ZZwSL4EQRjjl3
   TUkN9hGuGK/0heiZFmdkzrq0Hza7Uteza61cH/noUEyi2FaPoXx+yOVOs
   QrhGaAugt5BRKNd4gFl3Son42RpihMSBHQSWaETiZO9CqtZB0cIwL4OmO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14188295"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="14188295"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 19:19:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="28496904"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Feb 2024 19:19:35 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rczcS-0005vo-2K;
	Thu, 22 Feb 2024 03:19:32 +0000
Date: Thu, 22 Feb 2024 11:19:29 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs.pidfd 17/21] fs/pidfs.c:164:32: sparse: sparse:
 symbol 'pidfs_dentry_operations' was not declared. Should it be static?
Message-ID: <202402221115.u81NYM8i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.pidfd
head:   398275624f3b72cbf6628feb0f2888dcccb713a3
commit: a0932f1a481588a81dad3cce4682f0843a5ced24 [17/21] pidfd: add pidfs
config: x86_64-randconfig-123-20240220 (https://download.01.org/0day-ci/archive/20240222/202402221115.u81NYM8i-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402221115.u81NYM8i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402221115.u81NYM8i-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/pidfs.c:164:32: sparse: sparse: symbol 'pidfs_dentry_operations' was not declared. Should it be static?

vim +/pidfs_dentry_operations +164 fs/pidfs.c

   163	
 > 164	const struct dentry_operations pidfs_dentry_operations = {
   165		.d_delete	= always_delete_dentry,
   166		.d_dname	= pidfs_dname,
   167	};
   168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
