Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8E422EE4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 04:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735186751; cv=none; b=QK+Tx0PYRFIUukRrsIMrl9PwUvPZqj5KUMXDr9+o0YE9FgaGMKHYPBrOt78asfQHlTGkSzYT4re6nw1Sbvr1VedUcYV3XL1BtITBs923bFGgQYeQgv2vKdaoeSaVUxPkaPi82hGT9Q6sdK/9rJjNM9uoG0cnD371HqMd0A1HCKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735186751; c=relaxed/simple;
	bh=Ow8DIytjQ8ne2EOH80T3SdZnhqeUF4X7dGtPikuNIOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UmI5TCAXXp1LrJrftU82AcvJZEtzf6II+mYKKdI0204hgJm3h7gkDuMRxCjWx+2nEIO4IkJOI61MW7OkN2pd2b6xeT5yBoCVzDosUBCxRbAIWLAj9majiNNbBdcnO1D3FPp47FqRikg18oFkDMCqCLFapedEwxhOJyBI1gI6CiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsDsWnTM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsDsWnTM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735186750; x=1766722750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ow8DIytjQ8ne2EOH80T3SdZnhqeUF4X7dGtPikuNIOc=;
  b=VsDsWnTMHn0SKMl8QQAAYDg8/xblJm+7sX4vOiNkDHyQCzVqXH4xkAUI
   fR2VmGt1ekMiukpTSpeSWp2LdPBcrj6rId6cYsYGXY5sorXt8aJfDCwLT
   EG+2kCsLm3xL/t0vF0r5aVfiwfIzIqMm9nuGQgNqjnfVUmoKCp01HVSWq
   kmLv+VoWasVAi+mE2b+C5Xg9BJKkihJqTx4uKwtF2H6SVKr3EKu7ZGmQ1
   njMVrmRpV4hbZnwwMWivxSPTLyXVymB0qHW5PXWk+otMnTA+U7gYg+Eaa
   8SKynT+FIfPp0vwAy4zWP9KNLqBsD19wPjHTGNkndUkLlM75SwhU0J/9i
   Q==;
X-CSE-ConnectionGUID: K6v1iDdBSCqpZPv8JXGuNw==
X-CSE-MsgGUID: etQli/DpRGyjTrBFU+szqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="53138585"
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="53138585"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 20:19:06 -0800
X-CSE-ConnectionGUID: W/Ud2e/0SJSlQe1De4UVzw==
X-CSE-MsgGUID: QVwNYEAhTc+hteHInSkv0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104476078"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Dec 2024 20:19:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQfKw-0002Kf-2H;
	Thu, 26 Dec 2024 04:19:02 +0000
Date: Thu, 26 Dec 2024 12:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1353/1353] fs/debugfs/file.o: warning:
 objtool: full_proxy_open()+0x55a: unreachable instruction
Message-ID: <202412261256.ak48t1qF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Drew,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   07d14ba27c5232baa4db34abda2725802e5cab3c
commit: d4bdc26bcd632cee393b5171345d5fa6293fe42b [1353/1353] include/asm-generic/bug.h: fix "cut here" for WARN_ON for __WARN_TAINT architectures
config: x86_64-randconfig-122-20241226 (https://download.01.org/0day-ci/archive/20241226/202412261256.ak48t1qF-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412261256.ak48t1qF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412261256.ak48t1qF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/debugfs/file.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/module.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   fs/debugfs/file.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   fs/debugfs/file.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   In file included from fs/debugfs/file.c:15:
   include/linux/pagemap.h:401:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     401 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> fs/debugfs/file.o: warning: objtool: full_proxy_open()+0x55a: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
