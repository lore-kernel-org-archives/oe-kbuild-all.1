Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98550374E49
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 16:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773765031; cv=none; b=bCcDR9EJpPsndisFzMT19ThxWQwC2eh2rhDSfqlFG5c3IxdA+x2cyzSIdTIY60XNqyLmnmxyZvCiR5aPnY7kwYrvSU6Ms8PZEj8bVDeDPfWpPlYogg8ybnkuGxKZ6B2XDk6UxDAWRcLi48qpGijAOM8obes341pZ/c6h6VIVfi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773765031; c=relaxed/simple;
	bh=Y9K/IR1TeAmDw4GgUBjGTLqM2devNxX7c8b/v+S+WKw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LGhlUVjS622geo9a6JvsVFwxijoFLhvH06xw9DXDhcwQOZ6Hex/GBVm97YYLf3khiVwYDWCE5+n6wCjJXzU7ukH73pU+oeCCX2sBKylmv6oU1dBFd86auf37BRflIBclR4Mw8l/qUyY98xiQk5818jC7xX9MNnZQpME8Ch+6gto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KvYQ1sbu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KvYQ1sbu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773765030; x=1805301030;
  h=date:from:to:cc:subject:message-id;
  bh=Y9K/IR1TeAmDw4GgUBjGTLqM2devNxX7c8b/v+S+WKw=;
  b=KvYQ1sbuyzCPCpe1VkVIKdL+erLmSsqoVoOyH3J55n1ghmIQ0A7DPV6w
   w9zwZtP8nNDAj1KvgHm7k7F/6iET+nkk6ZDCRVOgAAeV9rYbkDurm8b0D
   ymK4GKwEoVNiCUBn2Nq7of6+Exujl/ZgH+stcYwNGlFjriWIzspJnZ0+h
   athxAtmt2iLwl1ytI1gVUvSjH9PN33Nqc7Vjs5IclhqVL9vxw9cfPO/6F
   /z3j3vPtOWmQ0O/1+a5tlSmUpm3TZt7SuWZVvWMrbg7kSUwHIC/GTNJBZ
   f/WMqxM0DgNCS9OKAXCwrKVZ9QpzkaiICYfy26fYy/HTWaGlFNvmAbsI2
   w==;
X-CSE-ConnectionGUID: B1Pvw5XAQrCzMS3Wkdrxqg==
X-CSE-MsgGUID: xgNjTa0dT+miBBkabP1I2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92374592"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="92374592"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 09:30:26 -0700
X-CSE-ConnectionGUID: bJHC2ZJlSvilLbxUq2rGtQ==
X-CSE-MsgGUID: N0JRAxd1Rsaq6ScxT58vqg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Mar 2026 09:30:24 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2XJG-000000000nB-0SIF;
	Tue, 17 Mar 2026 16:30:22 +0000
Date: Wed, 18 Mar 2026 00:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 30/30]
 arch/arm64/kvm/hyp_trace.c:38:17: error: use of undeclared identifier
 'STRUCT_HYP_BUFFER_PAGE_SIZE'
Message-ID: <202603180011.fGBxIJq9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   339bea17e1ccb695cddcbc39f88955c85e45d97a
commit: 575dd1da644e642dd122a5af1e81c4171af0f842 [30/30] ANDROID: KVM: arm64: Add host support for the nVHE hyp tracing
config: arm64-randconfig-001-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180011.fGBxIJq9-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180011.fGBxIJq9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180011.fGBxIJq9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:368:9: note: previous definition is here
     368 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> arch/arm64/kvm/hyp_trace.c:38:17: error: use of undeclared identifier 'STRUCT_HYP_BUFFER_PAGE_SIZE'
      38 |         backing_size = STRUCT_HYP_BUFFER_PAGE_SIZE *
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_trace.c:488:5: warning: no previous prototype for function 'hyp_trace_release' [-Wmissing-prototypes]
     488 | int hyp_trace_release(struct inode *inode, struct file *file)
         |     ^
   arch/arm64/kvm/hyp_trace.c:488:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     488 | int hyp_trace_release(struct inode *inode, struct file *file)
         | ^
         | static 
   2 warnings and 1 error generated.


vim +/STRUCT_HYP_BUFFER_PAGE_SIZE +38 arch/arm64/kvm/hyp_trace.c

    29	
    30	static int bpage_backing_setup(struct hyp_trace_pack *pack)
    31	{
    32		size_t backing_size;
    33		void *start;
    34	
    35		if (hyp_buffer_pages_backing.start)
    36			return -EBUSY;
    37	
  > 38		backing_size = STRUCT_HYP_BUFFER_PAGE_SIZE *
    39			       pack->trace_buffer_pack.total_pages;
    40		backing_size = PAGE_ALIGN(backing_size);
    41	
    42		start = alloc_pages_exact(backing_size, GFP_KERNEL_ACCOUNT);
    43		if (!start)
    44			return -ENOMEM;
    45	
    46		hyp_buffer_pages_backing.start = (unsigned long)start;
    47		hyp_buffer_pages_backing.size = backing_size;
    48		pack->backing.start = (unsigned long)start;
    49		pack->backing.size = backing_size;
    50	
    51		return 0;
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
