Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D217A13C9D4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 21:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737150228; cv=none; b=bQJZKyudLXyUtxDYfum7aJgN/jqSd/gFYXth6YKHZvvsuZ8/9py8QMWakk1Fmjy837229S8GE8CgxloKvjO1Z4/pzQewYoFj+BenLyPG0tYijkosf5HVd5AyGeTLcZCu+5EUE4I8u6gnGwnha4LPqXaTszFsOilF8aQ0i5iwV10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737150228; c=relaxed/simple;
	bh=lmPgVrhWmghFDq928nf1mYzQ1OFhzHw591OGPM7+3dU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VVI2blPijc8CKzhM435achiN6jqUc4j0L+suEtc7XulSFKf1keVqpq9eL1/1v7b8FUAc4dF+GBLClUazfoHo+sUp88K1Sv82oJlKgO7MYCEcraBN7usP4js/GX7V6oTyaeTnWBWVeke3SE36OH4g8RBJMtYNdQi4xDw12iiG974=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KH2WEU5V; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KH2WEU5V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737150227; x=1768686227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lmPgVrhWmghFDq928nf1mYzQ1OFhzHw591OGPM7+3dU=;
  b=KH2WEU5VvLgsoiDIG7ozCgBwNmTVRgBawF/c12CouS+usArS82wH1LxN
   SWKYfHZm6BUQWy/wQ86TRM8eoIxhp3C+kZWd0aMgzSdGOqOtDaHU5BVxh
   qGSX0ah18f1UxT2MMal9QGY7hu2H11X9+Jd+VRD/VqvjQrUUyiNryMuje
   vcy+FytBXZxrkwuoOdlFa5uEZYaKqKpE+vzTW362HIsS6nY4q0TYbVUe7
   EARd9XTXNjcCVJd0tDul7aZWZ9KgEiQwYi5JZd5LI1vr5M/p4+tP/LZY1
   J2CS9eHWo+YZLfqqdGgYnDdmLxj7r6C4vz3tA5Fgr73KIKYyITfX6roMT
   Q==;
X-CSE-ConnectionGUID: 7pPMxZobQsGDSr6atuEcYw==
X-CSE-MsgGUID: 5bIEm0gUTR+OweyORI4BkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48261914"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="48261914"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 13:43:40 -0800
X-CSE-ConnectionGUID: 4WqeGwtYTduP5xrfWK3p+g==
X-CSE-MsgGUID: O/t6WSM8TcW7vN48+KXTmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="110917388"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jan 2025 13:43:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYu7r-000Tk3-2d;
	Fri, 17 Jan 2025 21:43:35 +0000
Date: Sat, 18 Jan 2025 05:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/1] kernel/events/uprobes.c:233:25:
 sparse: sparse: restricted __le32 degrades to integer
Message-ID: <202501180522.9sjc2hR2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   bf5b85fe246873efa65a9dc0631ad70c59eece6c
commit: 5aa6cd3130c80f17630a214c2e25091f0c4b5e9a [1/1] arm64:uprobe fix the uprobe SWBP_INSN in big-endian
config: arm64-randconfig-r122-20250117 (https://download.01.org/0day-ci/archive/20250118/202501180522.9sjc2hR2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250118/202501180522.9sjc2hR2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180522.9sjc2hR2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/events/uprobes.c:233:25: sparse: sparse: restricted __le32 degrades to integer
>> kernel/events/uprobes.c:582:56: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int [addressable] [usertype] opcode @@     got restricted __le32 [usertype] @@
   kernel/events/uprobes.c:582:56: sparse:     expected unsigned int [addressable] [usertype] opcode
   kernel/events/uprobes.c:582:56: sparse:     got restricted __le32 [usertype]
>> kernel/events/uprobes.c:1491:32: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] insn @@     got restricted __le32 [usertype] @@
   kernel/events/uprobes.c:1491:32: sparse:     expected unsigned int [usertype] insn
   kernel/events/uprobes.c:1491:32: sparse:     got restricted __le32 [usertype]
   kernel/events/uprobes.c: note: in included file:
   include/linux/rmap.h:225:28: sparse: sparse: context imbalance in '__replace_page' - unexpected unlock

vim +233 kernel/events/uprobes.c

2b144498350860 kernel/uprobes.c        Srikar Dronamraju 2012-02-09  224  
2b144498350860 kernel/uprobes.c        Srikar Dronamraju 2012-02-09  225  /**
5cb4ac3a583d4e kernel/events/uprobes.c Srikar Dronamraju 2012-03-12  226   * is_swbp_insn - check if instruction is breakpoint instruction.
2b144498350860 kernel/uprobes.c        Srikar Dronamraju 2012-02-09  227   * @insn: instruction to be checked.
5cb4ac3a583d4e kernel/events/uprobes.c Srikar Dronamraju 2012-03-12  228   * Default implementation of is_swbp_insn
2b144498350860 kernel/uprobes.c        Srikar Dronamraju 2012-02-09  229   * Returns true if @insn is a breakpoint instruction.
2b144498350860 kernel/uprobes.c        Srikar Dronamraju 2012-02-09  230   */
5cb4ac3a583d4e kernel/events/uprobes.c Srikar Dronamraju 2012-03-12  231  bool __weak is_swbp_insn(uprobe_opcode_t *insn)
2b144498350860 kernel/uprobes.c        Srikar Dronamraju 2012-02-09  232  {
5cb4ac3a583d4e kernel/events/uprobes.c Srikar Dronamraju 2012-03-12 @233  	return *insn == UPROBE_SWBP_INSN;
2b144498350860 kernel/uprobes.c        Srikar Dronamraju 2012-02-09  234  }
2b144498350860 kernel/uprobes.c        Srikar Dronamraju 2012-02-09  235  

:::::: The code at line 233 was first introduced by commit
:::::: 5cb4ac3a583d4ee18c8682ab857e093c4a0d0895 uprobes/core: Rename bkpt to swbp

:::::: TO: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
