Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEF73815F9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 05:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774848572; cv=none; b=rRUGBUx0xQw9v8sggjv8/3rgFWQD8EnHypF1oljCVH2dWcyIBldb/LVqFgmuzoDj3T9YGWMqIXYw8thpeFf21eINGFgMyCUtSz7WgPdSRuSt+txD1tiVF9IWNK27vSn6SjBk1JwEY9Jv8fVrP2x6jeSKtXpYHeqDAb0ZJvyFVYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774848572; c=relaxed/simple;
	bh=oR+9PnOKw4PBLdJP3dyRriLToWVT3OvhxQSv7Dfp+FU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=szcBUk0IJtC9OhZeiSA+Y5yUG5qfSyBi558UicYS8u7hCnFw1XHIkgM3GTTmq/me2Snketvp7t9NWTfpyZrZvZLig24UIpOu/qON2UYWKYuoRnRsyt8FxnhhlgMA5KtPzqFC09NzwFBSEeynwdS0cOTGEsgFJydX8W3Ql80Q7ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fV1raiuZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fV1raiuZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774848571; x=1806384571;
  h=date:from:to:cc:subject:message-id;
  bh=oR+9PnOKw4PBLdJP3dyRriLToWVT3OvhxQSv7Dfp+FU=;
  b=fV1raiuZC0HNilv/xpA6qcn8ApuB7P/22DUAyA34xoTHFnFfvWscGb9p
   tcZXy5qmVGbfoR/tAVjVzJxI9GGwyTySN0sUoyVtsD/HWb147kTZw3Lm1
   N5rvWtPwF5QWqwKaabFDb26LbQFPk0nQma/IyubDRpNb4I7UIgQYU7GLj
   /j2QVRat9ATqsXTf95IKMhNxpxG8a54exnGOvSrSKqNhF/8LKjVIx1lD3
   sloK86VUkzCM85FQPM+lUUUfLaoWNEl12g9SJJ1FExJau+3aGsTp+TpnS
   Kx3XSQb3VognwLJlTHnNV3pyPCXtSQz32mpwDix415ebDw5lYE0r82G6S
   A==;
X-CSE-ConnectionGUID: cl19S5lDQf2UZB87fZueAw==
X-CSE-MsgGUID: E+kdco9nT0uOe/g0+k/JiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79433773"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="79433773"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 22:29:31 -0700
X-CSE-ConnectionGUID: dpzdPK5rQSqu20t25h9NGg==
X-CSE-MsgGUID: uGF9zsYtRw2K/fuxMh4AVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="222629574"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Mar 2026 22:29:29 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w75Bm-000000000iZ-3FFi;
	Mon, 30 Mar 2026 05:29:26 +0000
Date: Mon, 30 Mar 2026 13:29:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>
Subject: lib/tests/test_kprobes.c:23:24: warning: variable
 'stacktrace_driver' set but not used
Message-ID: <202603301341.3yI3zdxK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: db6fe4d61ece24193eb4d94a82d967501d53358c lib: Move KUnit tests into tests/ subdirectory
date:   1 year, 2 months ago
config: mips-randconfig-r121-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301341.3yI3zdxK-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301341.3yI3zdxK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301341.3yI3zdxK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/tests/test_kprobes.c:23:24: warning: variable 'stacktrace_driver' set but not used [-Wunused-but-set-global]
      23 | static unsigned long (*stacktrace_driver)(void);
         |                        ^
   1 warning generated.


vim +/stacktrace_driver +23 lib/tests/test_kprobes.c

8c1c9356429741a kernel/test_kprobes.c Ananth N Mavinakayanahalli 2008-01-30  20  
1f6d3a8f5e397f5 kernel/test_kprobes.c Masami Hiramatsu           2021-10-25  21  static unsigned long (*internal_target)(void);
1f6d3a8f5e397f5 kernel/test_kprobes.c Masami Hiramatsu           2021-10-25  22  static unsigned long (*stacktrace_target)(void);
1f6d3a8f5e397f5 kernel/test_kprobes.c Masami Hiramatsu           2021-10-25 @23  static unsigned long (*stacktrace_driver)(void);
1f6d3a8f5e397f5 kernel/test_kprobes.c Masami Hiramatsu           2021-10-25  24  static unsigned long target_return_address[2];
1f6d3a8f5e397f5 kernel/test_kprobes.c Masami Hiramatsu           2021-10-25  25  

:::::: The code at line 23 was first introduced by commit
:::::: 1f6d3a8f5e397f5d31afbc58d84e1dc68318b874 kprobes: Add a test case for stacktrace from kretprobe handler

:::::: TO: Masami Hiramatsu <mhiramat@kernel.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
