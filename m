Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4DE1A3045
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 23:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727739648; cv=none; b=fkjmpm0U4yEjKtdPIyOv1CFV9/6f+tq8ummUsNEF5Zy6Wd9LOzJahZFV/WuMHTwmU35scoVrXM7WTS6DHjjG+xFa79mMP7LdsmXY5KzqxL4C5j2rg9fH36Kf7MRE3WukJZEpR28mZlsk7CCwsN3tKC4MeUGYHaf6XridS/AmhKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727739648; c=relaxed/simple;
	bh=4s3W03TZTBZhy2fAOFb3pF+eVaEbzacLoYNUyH7qos0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YBgViV9Vl1eWqmS8C5XeDuGa8T79fyr1AQhLAYKOB8CcYEXFxDSmkuC3DY8GTl1ZO4FAgZ9drEujle6/9i07uRXydsWZ10bRmF0pitlfNK3FPvMT0yUxH1SU6rRhWpVRs+9+bugvMgVc+6MwJKOiTeEFwBLif9GaFsViPYzILkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pgt1sZYN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pgt1sZYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727739647; x=1759275647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4s3W03TZTBZhy2fAOFb3pF+eVaEbzacLoYNUyH7qos0=;
  b=Pgt1sZYNIa+SE64NkrUWwxtWgF2cY6X6iGFIpkhtV48ZMAN3IUTeJD6B
   TreAk9u8QJGAXnYgVuZMCjkyBGagFyKXhIuVSErCTh9+q/ahMrTfz9i33
   cHlazBP8pzrcOnbStqTBx9cWro/0FDjrCxp4wqHpTqb0VqY4eKe88WRI7
   4Yx5gbmeoTS5QF5cq9ekoUDaJiG/NxIKrv1fbQsVwQUPJj+sPuR1TE74O
   kE2N8ppC6/3HJyt7rojO3RrQZ/0uGcrktL8faNZXGphvpyxyfH9+iXmW1
   sYSANJJ9oy+MkPHxlr/9LdtNOG4LDcSpghbBy5GBPLeQ2pSzob07SyXEP
   w==;
X-CSE-ConnectionGUID: 1tiEcCYwS1K58ysQC9nnqA==
X-CSE-MsgGUID: 2FAGvYCYQGyGU7OwrlLwlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="38244801"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="38244801"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:40:45 -0700
X-CSE-ConnectionGUID: YGcRmpDFQUmWUxYqYoMiVQ==
X-CSE-MsgGUID: +SwJB1aFRRqfG8A9KODYFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="110950895"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Sep 2024 16:40:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svQ0P-000Q2h-0B;
	Mon, 30 Sep 2024 23:40:41 +0000
Date: Tue, 1 Oct 2024 07:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 7583/30000]
 include/trace/hooks/sched.h:19:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202410010731.nTuHyHpU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   1dd4a498c91aa13a5f4e61fd40a88aebb5bca367
commit: 3b773b24e67678aae79072c2d5b7783e7d5dc6a1 [7583/30000] ANDROID: sched: add vendor hooks to handle scheduling priority
config: i386-randconfig-063-20241001 (https://download.01.org/0day-ci/archive/20241001/202410010731.nTuHyHpU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410010731.nTuHyHpU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410010731.nTuHyHpU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:2207:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] <asn:4> *parent @@
   kernel/sched/core.c:2207:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:2207:17: sparse:     got struct sched_domain [noderef] <asn:4> *parent
   kernel/sched/core.c:2385:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2385:27: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/sched/core.c:2385:27: sparse:    struct task_struct *
   kernel/sched/core.c:4079:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:4079:17: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/sched/core.c:4079:17: sparse:    struct task_struct *
   kernel/sched/core.c:6071:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6071:9: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/sched/core.c:6071:9: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file:
>> include/trace/hooks/sched.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/sched.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:19:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs
   include/trace/hooks/sched.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/sched.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:23:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs
   include/trace/hooks/sched.h:27:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/sched.h:27:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:27:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs
   include/trace/hooks/sched.h:31:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/sched.h:31:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:31:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs
   include/trace/hooks/sched.h:35:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/sched.h:35:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:35:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs

vim +19 include/trace/hooks/sched.h

  > 19	DECLARE_RESTRICTED_HOOK(android_rvh_prepare_prio_fork,
    20		TP_PROTO(struct task_struct *p),
    21		TP_ARGS(p), 1);
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
