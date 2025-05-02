Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5048259CA8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 15:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746201449; cv=none; b=E8pZf8fBz8kHo3+lNAAQFQ6oCibtG4l6quOVRDo6ZCs8TY3DJI7TYV6XN3NJoyQnDnTq1zaZEwpuDJbbJbZJgwIbP02F070OBy8hwvAczVIFU4EMr+6MhZsmvRq9X2bKMNpJmvDWJhPdbUrXslWGblVzi5GiWJ0i6zc8hpqMAhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746201449; c=relaxed/simple;
	bh=2/2KJokmM94JGs4JW6LSCfuVWODtsVNYyHMdfTlEJbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pwscPZYvavgmTFvgZKJxjYZ8rA0IIShrMYsxGjEVs+JuMbkwminRhX5hFcVLBFDrh/6GmJiUXTdW0OLpcBSdYHXB54YWrd9oDZjn1nyFbq0lcOmj4ImjGsGIjBD1TIbRK08FRxHJyXtdAetj87yTOiRhduMC5jS3/mNKSTvG80w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DCHSWxKA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DCHSWxKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746201448; x=1777737448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2/2KJokmM94JGs4JW6LSCfuVWODtsVNYyHMdfTlEJbE=;
  b=DCHSWxKAIInL2lQVO2N1BeYpbL4vVc9NiUErpRAxeM1KgGuA6W1f25Fl
   f3rguYCQZjMLJaeVy8pjcHXPJxdoj903VzQLp0dGOZSK+SRTJG/DhnbFw
   /C8g0cSE/+y3KWLxM4H/ZoKeHZpPZ1mmpSrJWMrwwES0Z/L28kku9Pgns
   14LlrN0Il0uW1XbRzrV9vgWne8J4ZjWJjNN6sZJ2MjBGqxt6AZwTmGMDR
   GCOgyv7TIDaCigyEdewnjrpYSlYqc9h4orcPczm3zlF7RBz8jHD/ungNP
   MMi4gaGbGcQ9GRnKCnGkJDM55KCCiWI1ZI7fdcfczYWN/S0Gu/5olUsv6
   Q==;
X-CSE-ConnectionGUID: CQ+xA3o/TR6T+PWpALQ9Qw==
X-CSE-MsgGUID: T3oloB6JSfyEnCxEXRCAeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47142753"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="47142753"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 08:57:26 -0700
X-CSE-ConnectionGUID: W+PBoCA5QIWrL6b4FUA2+w==
X-CSE-MsgGUID: Ou4eEftST+G0qx07HRRuDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="134628306"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 May 2025 08:57:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAslP-0004qv-0M;
	Fri, 02 May 2025 15:57:23 +0000
Date: Fri, 2 May 2025 23:57:14 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.coredump.socket 12/14] fs/pidfs.c:597:31:
 error: invalid use of undefined type 'const struct coredump_params'
Message-ID: <202505022346.pQyGcLS8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.coredump.socket
head:   fed163064146d254b65f674b2072bf51bc26bbfa
commit: 745300388cabf3ae30ad74c7d35f563adab09d30 [12/14] pidfs, coredump: add PIDFD_INFO_COREDUMP
config: arc-randconfig-002-20250502 (https://download.01.org/0day-ci/archive/20250502/202505022346.pQyGcLS8-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505022346.pQyGcLS8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505022346.pQyGcLS8-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/pidfs.c: In function 'pidfs_coredump':
>> fs/pidfs.c:597:31: error: invalid use of undefined type 'const struct coredump_params'
     597 |         struct pid *pid = cprm->pid;
         |                               ^~
   fs/pidfs.c:610:49: error: invalid use of undefined type 'const struct coredump_params'
     610 |         coredump_mask = pidfs_coredump_mask(cprm->mm_flags);
         |                                                 ^~


vim +597 fs/pidfs.c

   594	
   595	void pidfs_coredump(const struct coredump_params *cprm)
   596	{
 > 597		struct pid *pid = cprm->pid;
   598		struct pidfs_exit_info *exit_info;
   599		struct dentry *dentry;
   600		struct inode *inode;
   601		__u32 coredump_mask = 0;
   602	
   603		dentry = stashed_dentry_get(&pid->stashed);
   604		if (WARN_ON_ONCE(!dentry))
   605			return;
   606	
   607		inode = d_inode(dentry);
   608		exit_info = &pidfs_i(inode)->__pei;
   609		/* Note how we were coredumped. */
   610		coredump_mask = pidfs_coredump_mask(cprm->mm_flags);
   611		/* Note that we actually did coredump. */
   612		coredump_mask |= PIDFD_COREDUMPED;
   613		/* If coredumping is set to skip we should never end up here. */
   614		VFS_WARN_ON_ONCE(coredump_mask & PIDFD_COREDUMP_SKIP);
   615		smp_store_release(&exit_info->coredump_mask, coredump_mask);
   616		/* Fwiw, this cannot be the last reference. */
   617		dput(dentry);
   618	}
   619	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
