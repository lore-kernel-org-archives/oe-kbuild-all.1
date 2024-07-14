Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F924204E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jul 2024 13:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720963217; cv=none; b=RQ+P8umR0BfGp047Nb+rx0loea1FhrHd9BK4f0EDawnOu27bVFPqtyCk6iT2YwlB54KMhejxHzzwuop2F92Xz6dbvWDOQzSEfSGlysr+Da+8PdpF+QIGcvU2KnBGCG1zuP52x2ANBQEqnE2QahY5TZz6VaAA7ybPq865lHdtEM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720963217; c=relaxed/simple;
	bh=yF68NkUvB7LtLEbhnhpYNohF4Y197vk3+Cflm3ygaz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F32iTiOHwvUKxdjnZ5ttZsr1Ytkoaglul6IVEp9wbIAL4y8aAUQe6P3j7gMW3KqaKk43PxYuTVxBRvSrC4AifUh1eqZIB4thGYTNOyZoYFNd8maQQGqJ4BsfpoP7nXBQOM+tL+fhp/QqQL9GWROqjq1UU606JnI8LBnj3FZuRq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzLVY0LK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzLVY0LK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720963215; x=1752499215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yF68NkUvB7LtLEbhnhpYNohF4Y197vk3+Cflm3ygaz4=;
  b=RzLVY0LK6GH3yPSkthX6G+FnBdhHqCbhd48TsPyiz9ptlJBsmEOtjYww
   RJRi358fY/iQpHdJYS/22IFHlBVaDckRkZfofN8K8sIXgG8swrI+D5Xff
   6rpIuorY0YGlKCGleaRdELmVmsyIirrkbO378mAsT3CknaktnkvdtjiTR
   odYLhQqdHen2lHgyehDD32IVovuhn9gKzpbUFA80yOLN/ZQDfZw2c09b/
   E7cWDNhujvYmRptuAt7U2WhTjfd+LAhRfCf1Nbm0EExgPLY2mWHo7Q/lO
   3K2VPirlfxXhAfxPQnQqh9yz8cXui5w/teofFVL3CjaPq7eeVyPBaIa93
   Q==;
X-CSE-ConnectionGUID: 1d5BmU3tShOeFEcpBKNkAA==
X-CSE-MsgGUID: ihWxK452R7uiMPNFyOvy9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="17964646"
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="17964646"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 06:20:15 -0700
X-CSE-ConnectionGUID: qn5r7dawSQ2xtytP/HU2iw==
X-CSE-MsgGUID: bhuBPEIQSjm7inHV7mwJww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="54540879"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Jul 2024 06:20:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSz99-000dRM-1s;
	Sun, 14 Jul 2024 13:20:11 +0000
Date: Sun, 14 Jul 2024 21:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:numa/memblks/v0.1 17/17] numa_memblks.c:(.text+0x148):
 multiple definition of `phys_to_target_node'; mm/numa.o:numa.c:(.text+0xc8):
 first defined here
Message-ID: <202407142153.xUlr6Pcl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git numa/memblks/v0.1
head:   dc6414987ae4b1895cebd8cbb14b8cbd55909f41
commit: dc6414987ae4b1895cebd8cbb14b8cbd55909f41 [17/17] mm: make range-to-target_node lookup facility a part of numa_memblks
config: arm64-randconfig-004-20240714 (https://download.01.org/0day-ci/archive/20240714/202407142153.xUlr6Pcl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240714/202407142153.xUlr6Pcl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407142153.xUlr6Pcl-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: mm/numa_memblks.o: in function `phys_to_target_node':
>> numa_memblks.c:(.text+0x148): multiple definition of `phys_to_target_node'; mm/numa.o:numa.c:(.text+0xc8): first defined here
   aarch64-linux-ld: mm/numa_memblks.o: in function `memory_add_physaddr_to_nid':
>> numa_memblks.c:(.text+0x88): multiple definition of `memory_add_physaddr_to_nid'; mm/numa.o:numa.c:(.text+0x8): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
