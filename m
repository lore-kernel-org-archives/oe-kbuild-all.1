Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352213BD641
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Apr 2026 11:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030749; cv=none; b=coVPq4MHthEcfm0lD+M7dJOvDuOwd6nMEV08dTthpLeIbIKNIHGrD78tY4x5rc0RyTsDk0JSg17ZS0xSgtDW9f1STXV2D2flsqM8LixzAKd3ar0XDEvwqp7mYhlplfPdZ0SsZwzqzqwkJ5b5yARlfc4CqTi0fsl0hg7m88OTPls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030749; c=relaxed/simple;
	bh=m9c6xLMxElqpqE2blAsPgdcsvvUUqcutkct3Xaja0Aw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FAN2+fxZgWr5fSD4dWfSG9rGp+MbaiIaTI5Cbw2TZdFMbXiyRXtFmmjwOVRzrOacnceuBmwaRjApO+Kwwrz8jjb8ariMn3vs/OCX5a8f3SghbWpBFc8dN7H4EpdO15TQWAUarffGjHAekfAPuaz9t87phxW3zugGXTl+RjjXCyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gVygC0sG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gVygC0sG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777030748; x=1808566748;
  h=date:from:to:cc:subject:message-id;
  bh=m9c6xLMxElqpqE2blAsPgdcsvvUUqcutkct3Xaja0Aw=;
  b=gVygC0sGdDS2YnNC8VXz3wPil9AfMMJ0c4wSKUAVk7vHoNh8c273kmH/
   fRUDhyO9JmsNav9XOzvZuFATUU8WyxO6xwTGjYCRmMi4IoFnwuf7xADbT
   XSk3Y6ARTDzoIEawiOtZkYujQr4Up9LHupEf75Z3L+dULBdNeRZld3JgH
   iI+4/dN4qwanZbv8v+Y4pop7xd0WooOAs/+Y/M8nN8Ijz1TIfAuta5uRO
   MAJcDllbbViF+ILZ/KXPGQ48Ntb9c4G5s5adL1HiCZKVSgyj2N5ghDCJU
   vEINeY5EHdlKzFaIg1uqUOQwaOQiu6buGFIupAGBCQmq/JURkY8FhRmse
   g==;
X-CSE-ConnectionGUID: 9db/PUxxQMaWl/Gu3OaQFQ==
X-CSE-MsgGUID: Crcxmjj1TQC7ercr3Xqovg==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="89392447"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="89392447"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 04:39:08 -0700
X-CSE-ConnectionGUID: XMpMTBleTHKa88ujgGnm9Q==
X-CSE-MsgGUID: 3/iasoV4TlSxXvrrQnE2kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="234724416"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Apr 2026 04:39:06 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGEsC-000000005cT-12Lm;
	Fri, 24 Apr 2026 11:39:04 +0000
Date: Fri, 24 Apr 2026 19:38:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] fs/binfmt_elf.c:2162:13:
 error: no member named 'min_coredump' in 'struct linux_binfmt'
Message-ID: <202604241926.TQUaDTM3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5076a018b13cfc75cb2a033a8f548c1b1691fb7b
commit: f4f03e72ea6da725b2c00ac08216872566dbff49 [1/1] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: x86_64-randconfig-004-20260424 (https://download.01.org/0day-ci/archive/20260424/202604241926.TQUaDTM3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260424/202604241926.TQUaDTM3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604241926.TQUaDTM3-lkp@intel.com/

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
