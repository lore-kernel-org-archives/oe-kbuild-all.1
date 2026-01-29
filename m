Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEAB2236FA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 11:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769686554; cv=none; b=o1nqviT0XPGnpF65Rb0BSK7gHOLjOecsjK+jC1Xcv5Bry7Ju9ljyutYdE/i93dtM3BYlegPN/dbg/bi8L447PYlnmo0CxP7adcpGbS1BwrBiryUMwwnVeWZ+m11bQqzrtli1m6K0yGF9JBPJVmiM6ddx8NTarZZIgJLeIFoMlSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769686554; c=relaxed/simple;
	bh=YHuSGX1BFaXzK5kJjS7TdrX2sFg9kR4wz1HTps2cJh4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GvXlT35dOz0Y39xOXn70lqF2LLtegClw/kvqRm21LlH12v0kNLVEHNTTUFSjktIDmHGHgmiK9fT8Hmw4wIXhM1loK/o3A9PoptXeVMwsNeSRUCGX6Ky8q+zI0Ck1mem/GWPkO/TJSjCaeQ7UHvMy/+qw0hTIi5m8CXaaATUIbaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HULKvtf2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HULKvtf2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769686552; x=1801222552;
  h=date:from:to:cc:subject:message-id;
  bh=YHuSGX1BFaXzK5kJjS7TdrX2sFg9kR4wz1HTps2cJh4=;
  b=HULKvtf29Y9xDiJFIMVrQCZDJznUfU4Hc6abNkwM9de8loqgny2pubL4
   2p3ftNlK+7RkUCa9FZwaUHw+iXIq/BcbCD3epSqle9OxxqoWSMEAWYCQT
   wcyfo3DEeIINS52rlbbyWEJv4j8KwphF29EDMNoAphrxjmg0b57qjGuhj
   tMHdNRsZxXRVRdN5JP+xn9AP01+rP6jbD2qRg5N0u/8gZWQgCKCEJM+uE
   r6h7wHL17IcKmM/ErhoAFgZu1aFz6ofyCuHrN3ZfKEKruC6++0B9BT4MJ
   JaH0joNYJ2tNYia/JI62AVEcBbpU7hUQAjKQg0gYf59xs1S1MOCf2sjnP
   A==;
X-CSE-ConnectionGUID: 6nSzLSBdQ1C76CF0hXQENQ==
X-CSE-MsgGUID: OIX2AG6YS1u+WvJIPNKp/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82291216"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="82291216"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 03:35:52 -0800
X-CSE-ConnectionGUID: 7dyksbBgQ5Cyz1oodEnelQ==
X-CSE-MsgGUID: Dw1di5yRR+KnJoeJtAhFVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="246181523"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Jan 2026 03:35:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlQJQ-00000000bQA-0s93;
	Thu, 29 Jan 2026 11:35:48 +0000
Date: Thu, 29 Jan 2026 19:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vdubeyko-hfs:for-next 10/10] fs/hfsplus/inode.c:399:31:
 sparse: sparse: symbol 'hfsplus_symlink_inode_operations' was not declared.
 Should it be static?
Message-ID: <202601291957.bunRsD8R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vdubeyko/hfs.git for-next
head:   aef5078471294e7a7a2d6b9da4988a6a3b7aff54
commit: aef5078471294e7a7a2d6b9da4988a6a3b7aff54 [10/10] hfsplus: fix generic/062 xfstests failure
config: s390-randconfig-r131-20260129 (https://download.01.org/0day-ci/archive/20260129/202601291957.bunRsD8R-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291957.bunRsD8R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291957.bunRsD8R-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/hfsplus/inode.c:399:31: sparse: sparse: symbol 'hfsplus_symlink_inode_operations' was not declared. Should it be static?
>> fs/hfsplus/inode.c:406:31: sparse: sparse: symbol 'hfsplus_special_inode_operations' was not declared. Should it be static?

vim +/hfsplus_symlink_inode_operations +399 fs/hfsplus/inode.c

   398	
 > 399	const struct inode_operations hfsplus_symlink_inode_operations = {
   400		.get_link	= page_get_link,
   401		.setattr	= hfsplus_setattr,
   402		.getattr	= hfsplus_getattr,
   403		.listxattr	= hfsplus_listxattr,
   404	};
   405	
 > 406	const struct inode_operations hfsplus_special_inode_operations = {
   407		.setattr	= hfsplus_setattr,
   408		.getattr	= hfsplus_getattr,
   409		.listxattr	= hfsplus_listxattr,
   410	};
   411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
