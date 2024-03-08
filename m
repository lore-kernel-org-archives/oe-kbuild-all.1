Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93B956449
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 11:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709898713; cv=none; b=tbsJvSj11yeBvZq5R4Amk+cIMZCjx6v08GnqRUx4pU1z88E/Q+ZUiaBbk0kBJ3bSg1j8RjS8rxBHxVJt6t6euHvWdvpFvGAi17TLlJOdVtBnf75fvRb25a0l2HTONmNd4gdEFhrdOkNwNdtLcrReR+meAmBE68IVjTg4jvIRqMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709898713; c=relaxed/simple;
	bh=wVfYzOlJu2vcKJBBhJm57Huaymd/+BleK3fEmKwpgmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nbXKJMuZ+AtvsrpENsL+uER+JnqM1xropHAMetsKfkLSGFRPZ04uvM+m9iXr/uYo3PJcNzgc+9MMmHfZ/mt1wXQl8WHU9cE02JUHkZgdD9Idm4+r6eCE9mmKbG5NsgtVMfWwmyZZ1sWCNCONuWgvyoikYdu48KukrDhVWnFMdJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvjfcHp2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvjfcHp2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709898711; x=1741434711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wVfYzOlJu2vcKJBBhJm57Huaymd/+BleK3fEmKwpgmM=;
  b=TvjfcHp27pcrpruraTljLr3qwyYEBqmOfmvZ6DUQIzSy4VsVE0fyV6zQ
   biwzk4XMLo9ZkEfst+tiwOd7mt76VMHZCGDKYxkNiUO+qlzuvSXQmr4rK
   6oiIJcMgQsoutod10DjMWB0CQfKGf9pYb5M+V4l9v/dBSeVPRoINL7oCW
   OAimWj3gB6ePzhtEP6dbKGHS+rBLBCI55O6f6A2dM3YuNg9109uhQFAaN
   iTnVTj8NxF8MaaGNgjp8N4zlYzaU5ctMpsdnXHib4jMoi8XPH1mRAvNM4
   JcYiiYBTNUFO/f3LZcOUPJQxnjMaIk43yrRLLDXlb+C3LMCFfyrSf9FiX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4782827"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4782827"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 03:51:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="10850604"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Mar 2024 03:51:50 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riYlO-0006Lr-32;
	Fri, 08 Mar 2024 11:51:46 +0000
Date: Fri, 8 Mar 2024 19:51:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 3/7] fs/binfmt_elf.c:2162:13: error:
 no member named 'min_coredump' in 'struct linux_binfmt'
Message-ID: <202403081929.AQi7c3jj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e9c73e0594e0bdb3b71e4e1fbb49cf903d73c5d7
commit: f4f03e72ea6da725b2c00ac08216872566dbff49 [3/7] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: arm64-randconfig-003-20240308 (https://download.01.org/0day-ci/archive/20240308/202403081929.AQi7c3jj-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081929.AQi7c3jj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081929.AQi7c3jj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/compat_binfmt_elf.c:17:
   In file included from include/linux/elfcore-compat.h:6:
   In file included from include/linux/elfcore.h:11:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2174:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/compat_binfmt_elf.c:144:
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
