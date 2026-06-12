Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3213E382F18
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 02:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781230518; cv=none; b=kDpF+bWYgzs+7dXWqmlI/fG3jxvuXD7nGaTlFJ4OZEFBLoylAceheqrwvFdtxgO0GVJk3iKtJv5NCYHvjt5RHHklsh/2/nx5ZW0sE8oQmOoT1QLSjLZ7ke96LdJRat5RNeZgCgxxiGL275oW9DChhtbGlduet2p6wHOezg2eR7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781230518; c=relaxed/simple;
	bh=gp7VwWdZJ9QyBE9ReZBhtHUUbbDyn8q3B6N6LjA1h5w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QY9D1tmuj+HBoQnz0lD9ydYp7pCvp03iktEpYdvLujCwtqBMjXF/73l05KkbqvKI68ODvh0k4Dgbbo5SDvaZgW4LWCwfIdfHsrFL6IguNE7TYCzbGxTLglK0R0pOfyhpWnEc9R9LPuCWWDDmNkONLYo9vZxN6X9dhoQgz+ztWl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EZ+8EGQT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EZ+8EGQT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781230516; x=1812766516;
  h=date:from:to:cc:subject:message-id;
  bh=gp7VwWdZJ9QyBE9ReZBhtHUUbbDyn8q3B6N6LjA1h5w=;
  b=EZ+8EGQTRNbYwA/Z4dPF85iwr/taqeEzbdaSmHUL4s20XGm0pCN9iXhh
   TRg7TvszJkiJ51LcSALmiYmSVOQGJMUn1MVuELunpF/F0olte+taxTlwo
   9kANfTMoOs7LFO+tyjH1Ox428cMgeyIlSfjAzZoUUuZv9vUQFq0Am7ozt
   V/FYYkPWqcVa9RtHCoYvjSq76L8wnpcIzGqioHdVjeL/Z5rhiu/8x7ZNW
   4rJqDjjZxdax5JHlfBxeJxL0WB1nY2pWAgof0OZ1Q6pj8011o9wfIad9s
   UV2zJL3UyIzkfq/m8xU7q8KZocaaz6t7yQ7IzFsGuFZ1Etnu/jaL8lE+v
   A==;
X-CSE-ConnectionGUID: VjUgmHdpTPilAIOVpkCMSA==
X-CSE-MsgGUID: ABJNxrV6QE+VllbKCvF5RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82105459"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82105459"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 19:15:13 -0700
X-CSE-ConnectionGUID: rDwSeE9FSoqvw21RXD5xeA==
X-CSE-MsgGUID: V12mR3IdRueiRYndc5dlFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="251641455"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jun 2026 19:15:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXrQK-00000000OAA-0dBe;
	Fri, 12 Jun 2026 02:15:08 +0000
Date: Fri, 12 Jun 2026 10:14:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 38/38]
 fs/binfmt_elf.c:2143:13: error: no member named 'min_coredump' in 'struct
 linux_binfmt'
Message-ID: <202606121001.mkxkkdVZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   17584f778119ed93d9ae85feb43561e05f5254b0
commit: 58e2fa4ec4b1e15b7c7510bc98befafa31c03f70 [38/38] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: x86_64-buildonly-randconfig-003-20260611 (https://download.01.org/0day-ci/archive/20260612/202606121001.mkxkkdVZ-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121001.mkxkkdVZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121001.mkxkkdVZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:37:9: warning: '__SANITIZE_THREAD__' macro redefined [-Wmacro-redefined]
      37 | #define __SANITIZE_THREAD__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_THREAD__ 1
         |         ^
>> fs/binfmt_elf.c:2143:13: error: no member named 'min_coredump' in 'struct linux_binfmt'
    2143 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |         ~~~~~~~~~~ ^
   1 warning and 1 error generated.


vim +2143 fs/binfmt_elf.c

  2140	
  2141	static int __init init_elf_binfmt(void)
  2142	{
> 2143		elf_format.min_coredump = ELF_EXEC_PAGESIZE;
  2144		register_binfmt(&elf_format);
  2145		return 0;
  2146	}
  2147	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
