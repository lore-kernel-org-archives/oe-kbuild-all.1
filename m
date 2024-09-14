Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425D0208DA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 18:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726337297; cv=none; b=FVNdswKVUkqWsMHV5y3QkkDFz3I5sqSGsRfz3Og2d4KsiBrG7W/YZjlZ1GoDvCUAv7gDT8oqhqayF9SNPP+OMXnzowuDStDRkypQXPd3dEevVAOb0f6Sc/nK7UWvLjVrHqVW1VB7U+767n7ZZDaR5DxGol7SFDxMvketQINwHA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726337297; c=relaxed/simple;
	bh=5yA0j6jlDf3SWt9TnRiYiELg3NEAgqPgWBlMzjJ1fCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bUWLunGIUpGO9vgZ6s/wVN/IbzTeU96MyD+vylSNZfsszjz1HKgd0Qtsw6lNsXT7d+SGjscrKDRxwlKnm1vPP6VxsBLJQLlXwPZhwuxr2pguUchjKJB1DEsoPyNfeKEEsmEjcMj/5wAaXfr4/CG5l5m3nVIdqtXcCAR5Wih6YSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHswjKZ2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHswjKZ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726337296; x=1757873296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5yA0j6jlDf3SWt9TnRiYiELg3NEAgqPgWBlMzjJ1fCw=;
  b=AHswjKZ2l91uJ+Q4CGMH7D+lw+N3zts1Gmkz9g5ewcXBqA6CqQsSQQeD
   iaYwpNfI/XoTHAAR0d7G48eClAk9O7MDAOm7TjSh0qRXu/3TgHCBNCDZy
   YU/829maPmgoc6PeaSGP46C81+ozD7I87iNjTa9cwuov8oKkQK4QrTjY9
   8mZ4helbcdNgAjp2t3NZFFJuXJTJLw38FJ49/rEqcVAeRoVVqX5V0jmKY
   5CKK5dGXNAbwkzAqWTmgdc19+/Ec9vTN8mAuf8xlv1R5lGWLtvxh9GJ5u
   sTsg7jxuJWR3A1ZhM4+yY944XHQ1MK54vryGbeT9SLMk2BHdFzdimFz+H
   g==;
X-CSE-ConnectionGUID: L9Jm38qcSZa2Hov47O/tNQ==
X-CSE-MsgGUID: JDcboLZmTrq4OwJzCRGLDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="25347188"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="25347188"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 11:08:15 -0700
X-CSE-ConnectionGUID: SSVneMCRRCGp9C8P6YSvxw==
X-CSE-MsgGUID: RotSNa+PT6y1lNbCK9YHnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="68138663"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Sep 2024 11:08:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spXBr-00082m-2I;
	Sat, 14 Sep 2024 18:08:11 +0000
Date: Sun, 15 Sep 2024 02:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 7985/30000]
 include/trace/hooks/sched.h:19:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202409150251.PDx3Jlmt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   b41e3369a8f2bf2fc08e19da3d8c061981f4db89
commit: 3b773b24e67678aae79072c2d5b7783e7d5dc6a1 [7985/30000] ANDROID: sched: add vendor hooks to handle scheduling priority
config: x86_64-randconfig-r113-20240914 (https://download.01.org/0day-ci/archive/20240915/202409150251.PDx3Jlmt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409150251.PDx3Jlmt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150251.PDx3Jlmt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:568:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] <asn:4> *parent @@
   kernel/sched/core.c:568:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:568:9: sparse:     got struct sched_domain [noderef] <asn:4> *parent
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
