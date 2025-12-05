Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B9238D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 00:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764892905; cv=none; b=eOYcYpIjOSzo4L7LzZxEIqY0Zz4oxxruk6fDHwYLR9m9eW+98MNHMHbSTVmxnIhJ554xM/mHptAnHIaUwu/IrYkvR08UZZ/lAbEHGID85KdJxZUWzxnI+J/Fnew1I1Qmvf39Mh4gBnxlFqUQYCvJWRstcvjrGUBZE8j14S3pHJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764892905; c=relaxed/simple;
	bh=66WqpV5CKLdue74TfXkjoRZYroyg9jteoLBZwzOdiYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G4UcKiF8Y56yYr08EFVHFx9yRcRuuRg9DFR23rIUwUDbe5G4edoQ1u/06uRDp5b+OQqie+a2QM/1dWI3nPPUoUsSbRcU9wqKHtPKWkLVjpQf5vIU2Q1N28M+Owf35E+WQ0cLshhZh/t9fdkjgVoMcosBAEL+eR4kJBuG4rh1iCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OR94F8lL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OR94F8lL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764892903; x=1796428903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=66WqpV5CKLdue74TfXkjoRZYroyg9jteoLBZwzOdiYw=;
  b=OR94F8lLex++AHt4mPqhdAYmxscTn5DmULMInYgaZlUW1D+fP11zWK93
   5QeFAnDUyMsAR45p8BWxg/cBya4TypNMXG+UY2lxaavVWSUFdwKPvJDr1
   rUkK1BfMxqY4qK3awqt78po3YMg8fGpVpZoYDGNzb7K8ExLB2tZyAmztT
   vqOseuR7xEmgU49APZPjeoTMTiEYSCbla1BFuIZ2tNrjef0/Zesl3qB6H
   HbMc/5EwN4cc3cjCsQ/Ko+Di47lio9bnBgpQ97H2X7ZKPfHAQLrD/os0g
   QyzcMPeuju9MGMNhWeczVPH4CJfPh7MiAWnPM5u/198j4DRhEyNic1C75
   Q==;
X-CSE-ConnectionGUID: 3NFI69/+RaaM0xfp5O+/vw==
X-CSE-MsgGUID: IPRR8hJzSPOBbM/kB2OVNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66114506"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="66114506"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 16:01:43 -0800
X-CSE-ConnectionGUID: fVvMJw9sRfWNEWgK19aCTA==
X-CSE-MsgGUID: YNb1xww6R0ic3xfvBQtacA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="194406490"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Dec 2025 16:01:42 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRJGV-00000000EMn-3nLC;
	Fri, 05 Dec 2025 00:01:39 +0000
Date: Fri, 5 Dec 2025 08:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2] fs/binfmt_elf.c:2162:13: error:
 no member named 'min_coredump' in 'struct linux_binfmt'
Message-ID: <202512050751.8uMivcmv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   f6b66dd17a9274efbcd440db45539d0398cadcd2
commit: f4f03e72ea6da725b2c00ac08216872566dbff49 [2/2] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: x86_64-randconfig-012-20251205 (https://download.01.org/0day-ci/archive/20251205/202512050751.8uMivcmv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512050751.8uMivcmv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512050751.8uMivcmv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/binfmt_elf.c:17:
   In file included from include/linux/mm.h:2174:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/binfmt_elf.c:2162:13: error: no member named 'min_coredump' in 'struct linux_binfmt'
    2162 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |         ~~~~~~~~~~ ^
   1 warning and 1 error generated.


vim +2162 fs/binfmt_elf.c

  2159	
  2160	static int __init init_elf_binfmt(void)
  2161	{
> 2162		elf_format.min_coredump = ELF_EXEC_PAGESIZE;
  2163		register_binfmt(&elf_format);
  2164		return 0;
  2165	}
  2166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
