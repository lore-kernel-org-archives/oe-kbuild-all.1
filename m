Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317F41F6677
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 16:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729009903; cv=none; b=nW4j11lFJC1BS9VEIsypVmbTDkzKzADrU6Uo8S/azOghSZuZJprHJ1ijteTj2S3l3BOo99JIaNF7nuPl1D5LbP+RNNHedxnczeZ9Ldrvgh7XOc4b7KwLnxq1/J4/2hPfjK4dJFAlZ1CuRLI0xNaIXbPpwyJgIVPieTeuXEOcFzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729009903; c=relaxed/simple;
	bh=IE74QBPoqfGJir3d0htfuRFVPtrwtDK5zO8/52D6uOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ASIy2GNn9xJ6HT85ztyKb1fB960W3h7Vv3lkibK+c/QMONUSDBrKbeIiBOILU9pMapkxiRBSY8SkEvuloH85l7pO9ROaANYkz+JHb/np1B55yIefDvFXzQ6nb3YIyRhuI4VPRFUdrNjaUAXMOG+Q+h/kI5xMGnmAuWre84ZWNkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6a8vQdp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6a8vQdp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729009901; x=1760545901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IE74QBPoqfGJir3d0htfuRFVPtrwtDK5zO8/52D6uOw=;
  b=M6a8vQdp1UT7leGbn/wQfzi1aL7AzE8KCp1iYXsrAYPualRvz6Qoz7/k
   UUE0SRbhG0qMac4warJ3rJjk5rs5VqeYaZLKrrmaBERJyU2nnyYP93F6g
   8pKS9obElQe4sSVZ+8A1e80xsZjQV8FMFphpzKPETDCI9ZNk1ojxmkzUV
   ZnNkbxUqftgleAaFgBd5MFLzSkuAZNSuvR5ZfGR8qgigcWyOBFqkKQsrr
   dZ4IyvQjYUYkrBCWgChHxFtVbIp7/RE6KdvwPtGMDwu8y03Z9dDffSYWF
   JDSMYKxnM6Z8CgimpPtFbZR0FaInFOhCXCtthdSb/VCLElDAtAgoo/sVv
   A==;
X-CSE-ConnectionGUID: hWaLo86aSA2vDjTNWYOQDA==
X-CSE-MsgGUID: viRTKhetRQ2gSUIsCt0BOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28617644"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="28617644"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 09:31:36 -0700
X-CSE-ConnectionGUID: LWxy0vj/SpOszIpV367fMQ==
X-CSE-MsgGUID: cijNqaSzTkW5+b9p2TLJfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="82756294"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Oct 2024 09:31:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0kSL-000Jar-05;
	Tue, 15 Oct 2024 16:31:33 +0000
Date: Wed, 16 Oct 2024 00:31:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 5501/5503]
 include/linux/sched/task.h:59:28: error:
 'CONFIG_GKI_TASK_STRUCT_VENDOR_SIZE_MAX' undeclared here (not in a function)
Message-ID: <202410160058.BMbrYYA7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   21a62e214164c402d8af1c59d30ba1dc03b090a2
commit: 1827ee5e5a2de323359c04153e268a7288061eda [5501/5503] ANDROID: GKI: Add padding after init_task structure
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241016/202410160058.BMbrYYA7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410160058.BMbrYYA7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410160058.BMbrYYA7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/compat.h:17,
                    from arch/x86/include/asm/ia32.h:7,
                    from arch/x86/include/asm/elf.h:10,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/crypto/aria.h:22,
                    from arch/x86/kernel/asm-offsets.c:10:
>> include/linux/sched/task.h:59:28: error: 'CONFIG_GKI_TASK_STRUCT_VENDOR_SIZE_MAX' undeclared here (not in a function)
      59 | extern u64 vendor_data_pad[CONFIG_GKI_TASK_STRUCT_VENDOR_SIZE_MAX / sizeof(u64)];
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1265: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:242: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/CONFIG_GKI_TASK_STRUCT_VENDOR_SIZE_MAX +59 include/linux/sched/task.h

    56	
    57	extern union thread_union init_thread_union;
    58	extern struct task_struct init_task;
  > 59	extern u64 vendor_data_pad[CONFIG_GKI_TASK_STRUCT_VENDOR_SIZE_MAX / sizeof(u64)];
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
