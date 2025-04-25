Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B049023DEB6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 11:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745580076; cv=none; b=HMcqsQjTmNLEYFbN6NyWYMBZh+xvFAC9DB/0LibadV3jZ83XfCPSJQzIyso4b+5qyv19WP385rdZUWoj6/xBnhZg5tCjQcKj8Rcrf9MzH3N7EdWMO6eWIhdBZQQnIbqVcm7mYGqhKLrerL08jCaNhgSJ9txNJ1onEh0wqjKhCx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745580076; c=relaxed/simple;
	bh=8PgGP6/r0fKFomPcuoaMLoUJaNIEzm1nGhX2QrgPkuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pgf+y/abCj3hJuGvyjGABgsV2PYIBb5qebfMMxtLRRocMOb9Ck2ZXi3eJqyiG742juofs0KUYtDRlaLvxMmsQ83ClE3skpBqB5otiywZCB5s8vEXCc8DPwXkR83fcI3ptPpNyC48E9QeqZmsTanE1myXgBtMc2A0IkGJYrCF7pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwgBx6E1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwgBx6E1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745580075; x=1777116075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8PgGP6/r0fKFomPcuoaMLoUJaNIEzm1nGhX2QrgPkuc=;
  b=mwgBx6E1rMNAtITmY6lEcCAWBX/M63oIhHwKjVdmhfJLlDCtrlDJmtFJ
   4bdVqqLBBQO0+jHEb4CDYjVjjssVTENEK6/bqIlJ6CsoXa4OCyof9B8WQ
   Bx+9RbHDpYX/4I/RAxYNyub/cIBridudwKxh4NTN1/KnqSzV92pkQH8dB
   fYKZ4JpeXh6i3Oiqu5ZB/GTqpx8lvMAoY5hgsKT/53+Pf2n0odpzE8UGL
   /HCmFLKJlaoAKDEJbnVapIweAVJNNB0pUJZ6D6owumu1cv4+nuTW9tqOL
   yGJov7XA6mTYSTbz9G0ywLW+cTRNlBFEtAztkLQEv3oPJlmZ/Ls4yx2NK
   A==;
X-CSE-ConnectionGUID: wRf+VY1cQzabmbwE4SFuyw==
X-CSE-MsgGUID: 1kemepglTb678T8xNeKHpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47367608"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47367608"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 04:21:14 -0700
X-CSE-ConnectionGUID: rtZOieLLTvCEa5ZKk4ecpA==
X-CSE-MsgGUID: 1mOzGK0CSeypVVa5JNv9wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="137876553"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Apr 2025 04:21:08 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8H7A-00057f-1v;
	Fri, 25 Apr 2025 11:21:04 +0000
Date: Fri, 25 Apr 2025 19:20:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1353/1353] fs/debugfs/file.o: warning:
 objtool: full_proxy_open()+0x55a: unreachable instruction
Message-ID: <202504251956.8mF9cAMB-lkp@intel.com>
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
head:   08111f03f1ec65598372cfe9bf64f366d575671e
commit: d4bdc26bcd632cee393b5171345d5fa6293fe42b [1353/1353] include/asm-generic/bug.h: fix "cut here" for WARN_ON for __WARN_TAINT architectures
config: x86_64-randconfig-122-20241226 (https://download.01.org/0day-ci/archive/20250425/202504251956.8mF9cAMB-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251956.8mF9cAMB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251956.8mF9cAMB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/debugfs/file.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/module.h):
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   fs/debugfs/file.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   fs/debugfs/file.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
>> fs/debugfs/file.o: warning: objtool: full_proxy_open()+0x55a: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
