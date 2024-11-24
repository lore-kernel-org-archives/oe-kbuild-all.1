Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8823313A88A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Nov 2024 20:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732479854; cv=none; b=ciNHPGFs2pYfxUn8lZnZBQLlV5+9HjvhRFt6qLxUn0KYuqICraYNq6AoTuOXA/f8vpjPbTE/ubYkreN0fb0b+fdr75xB9fpqKqJo10VB7qx7oyASO32oQkUTV5oYBm0Pd2J+XjmQfhNVCrW9uJ2OLJtXDOjOfBDl+cXyOdRqzwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732479854; c=relaxed/simple;
	bh=Z88Pz6YWbF8rPwVYiXqDaScjeV8HeK9jQmTkxatF4m0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gUUUvzdAQJWtQuJLNkXHv5wE+o1n3zLnJq2BKEUogNfHmLV8n/y/vISKs10fyAhmWpwzZi2qIknVxSb7DKkgYRc6IMkMoVu4j42gE/3K4gSvCwXhsno9OkTrdQcPR0FYrZwU+i0YgjpX4fIfUZHn7yPQyT6TbqPZ/NwDfHwdjks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acurC3pu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acurC3pu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732479853; x=1764015853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z88Pz6YWbF8rPwVYiXqDaScjeV8HeK9jQmTkxatF4m0=;
  b=acurC3pu97hR/5krpH0sgaUb4IDCUMCEU+gTWcpHjDIPhcUdYw2ml2zI
   csMZsY/f/pYJVz0awhx978VTszZAeWoKNMt+NXZUOvDCH+mIUb8VTRzCj
   +qWOQi2cLs9VCV3Cf8OhFazpih4fLLK2GjTt9RGhpWvorwrUna9KXt6d6
   Ba4V6sobT62p7vNwU8m+vJ45jLwli6VkT57+HRVtrANmH6vn7g5ilksWw
   XthI2EZdgMzb5WJmo+/Ii07LuvQGn+C9jujoX3gGvyc4NAy2d3KqV+oOd
   0Z6qF0Kxc/ZvyQyJPibaEZ7mwgWceuVyeTrPq5g8hQ4UdiGM8NId1UFk1
   A==;
X-CSE-ConnectionGUID: A3z+g6nsRmWDzDVfnHw3UQ==
X-CSE-MsgGUID: bQAzNAb6SvGXAmeTf/2zBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43636293"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="43636293"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 12:24:10 -0800
X-CSE-ConnectionGUID: /0MbLwvOSCqUPLPJy/Ysmg==
X-CSE-MsgGUID: gFt5aOICRxeUavz8zNnOMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="90705901"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Nov 2024 12:24:09 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFJ9K-0005DO-31;
	Sun, 24 Nov 2024 20:24:06 +0000
Date: Mon, 25 Nov 2024 04:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.cred 21/27] fs/smb/server/smb_common.c:798:21:
 warning: unused variable 'cred'
Message-ID: <202411250411.m4YEk4As-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.cred
head:   a617a3cb721d5c4fdc88889c7d80936831efe7df
commit: 32c6139e8a8e410e21e814298ed2634bf62a8613 [21/27] smb: avoid pointless cred reference count bump
config: i386-randconfig-141-20241124 (https://download.01.org/0day-ci/archive/20241125/202411250411.m4YEk4As-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411250411.m4YEk4As-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411250411.m4YEk4As-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/smb/server/smb_common.c:13:
   In file included from fs/smb/server/connection.h:10:
   In file included from include/linux/ip.h:16:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2225:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/smb/server/smb_common.c:798:21: warning: unused variable 'cred' [-Wunused-variable]
     798 |         const struct cred *cred;
         |                            ^~~~
   2 warnings generated.


vim +/cred +798 fs/smb/server/smb_common.c

a018c1b636e79b6 fs/smb/server/smb_common.c Namjae Jeon       2024-08-05  795  
e2f34481b24db2f fs/cifsd/smb_common.c      Namjae Jeon       2021-03-16  796  void ksmbd_revert_fsids(struct ksmbd_work *work)
e2f34481b24db2f fs/cifsd/smb_common.c      Namjae Jeon       2021-03-16  797  {
e2f34481b24db2f fs/cifsd/smb_common.c      Namjae Jeon       2021-03-16 @798  	const struct cred *cred;
e2f34481b24db2f fs/cifsd/smb_common.c      Namjae Jeon       2021-03-16  799  
64b39f4a2fd293c fs/cifsd/smb_common.c      Namjae Jeon       2021-03-30  800  	WARN_ON(!work->saved_cred);
e2f34481b24db2f fs/cifsd/smb_common.c      Namjae Jeon       2021-03-16  801  
3f7d155013774d8 fs/smb/server/smb_common.c Christian Brauner 2024-11-24  802  	put_cred(revert_creds(work->saved_cred));
e2f34481b24db2f fs/cifsd/smb_common.c      Namjae Jeon       2021-03-16  803  	work->saved_cred = NULL;
e2f34481b24db2f fs/cifsd/smb_common.c      Namjae Jeon       2021-03-16  804  }
e2f34481b24db2f fs/cifsd/smb_common.c      Namjae Jeon       2021-03-16  805  

:::::: The code at line 798 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side procedures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
