Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974286;
	b=eQ32hsLz5YOBId/mYfPCA1NUZFlgwX3AZHjHbMYm8+5qm2D5IzIGrTv6a/+r3aZF25F1
	 rFylZ8Ksj0r0n8L+PGCJhCpcet671XM1Chkh+gRbwe4YVAbosoW92GodJmBipK8nAbcLg
	 zr5xQs+BZ1UIXDHzDcW0WnWwKJsh5qUugh5VIC7HP2oUIF3M0za75saikjvZpkN6YzM+Z
	 H3r2dkHdApQC3E/C7i8ybbWJpKMQc43/rWH3yVfG+E5Vh1JLNKY4fqF2ZVhBQMdHTKoL1
	 2bkgKlr/qeEQ1fa+5TiIz85oa2tcYWjiS3yW6xfWgtxqelm17UfrNgAyoZPgd+P3kig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974286;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=N5N/P4g6CrjjudhCUgqBX+VPlPZRriWnuTkbbETPJ+4=;
	b=eNEmAFciAlxk+q+Sul0eKS3DgISZn1g57wDtyxZYaPSYebbfuySz6Gv4y8x2gDtZODBt
	 T2KxByq8tq5eOYjFmCoYVWkm9L5E3qYYej9oKV3xHu+CQcrrwnzk19/We6Ivox2soOkDu
	 RQAAGkt8DChIwly7b3kwm3ajFaJAF7SFixl+MPTiNCSYCNRU94I2my/sFUHPEFTXDtcNm
	 imUFm5KRWKJn838HbJjLroo5u+mdGuw9X+8/qfsovRJK6g9ui/XVVmpJlUXdvR1Id1rhL
	 7QfnMHiNZtEL4plI9Jc7JjKo74irSLZIi+EzUFeDhWjZxXWdX2fbfUUN/hCijutXlIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lPDLI+eJ;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6EB606A326
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 14:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF6EB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lPDLI+eJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793974284; x=1825510284;
  h=date:from:to:cc:subject:message-id;
  bh=dlNaR1OI+Cha5FMvggu1LCRdj9w3O8Ci8bMSdXh4kaE=;
  b=lPDLI+eJRW+UyjC6KkbsoXHqlggn4E49YZYaIAXI8j/OmpNSMMuaP7XT
   +JvLN5GFuNKZuAlEZut+jyPIcK994/X9KuBCfqAv38dBQtnVvxJiodlQF
   XyXTxFIM7vkxOWA737yEItPNG+frw3d+i63wpEgWF6nugUBnu4VNSZIgg
   jPb3H/PiG2XK6AuAKY5FxY1R/LFTxUz8bKB0f89dzALSUzOp9Uk5lcbl1
   YD2Vvgx5V2HBe7c938dRwR5S3svtxalIO++2ftXxJvxywwlmv/454mhne
   dPv8NFzersR7pcVKESueomZIRfuGuPXHJFe/SsoMqc10NK3/tEePoV6MF
   Q==;
X-CSE-ConnectionGUID: uGSazFnhSVanCaPzNf6PZw==
X-CSE-MsgGUID: i35s5bYdTgeFPtnHkduICA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2827868"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2827868"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 06:11:24 -0800
X-CSE-ConnectionGUID: ViIfyetXQVCA/gKKj5x8zA==
X-CSE-MsgGUID: r42QZDngQuqrKvpHxNhCKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7615974"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 06 Nov 2026 06:11:22 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPKf1-00000000AHX-3aFB;
	Fri, 06 Nov 2026 14:11:19 +0000
Date: Fri, 06 Nov 2026 15:10:40 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 kernel/sched/core.c:3981:2: error: call to undeclared function
 '__do_migrate_task_rq'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202611061541.K1niT0bw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   b835509d43ba8175031f800f12347f8e8206a471
commit: b835509d43ba8175031f800f12347f8e8206a471 [1/1] ANDROID: sched/proxy_exec: Invoke migrate_task_rq() on proxy-migration
config: arm-randconfig-2000-20261106 (https://download.01.org/0day-ci/archive/20261106/202611061541.K1niT0bw-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0fa861dbbf46e5a75f621406fd91cb015d8754bf)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611061541.K1niT0bw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611061541.K1niT0bw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:3981:2: error: call to undeclared function '__do_migrate_task_rq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3981 |         __do_migrate_task_rq(p, cpu);
         |         ^
   kernel/sched/core.c:3981:2: note: did you mean '__migrate_task'?
   kernel/sched/core.c:2772:19: note: '__migrate_task' declared here
    2772 | EXPORT_SYMBOL_GPL(__migrate_task);
         |                   ^
   include/linux/export.h:90:48: note: expanded from macro 'EXPORT_SYMBOL_GPL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                                        ^
   include/linux/export.h:86:54: note: expanded from macro '_EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                                         ^
   include/linux/export.h:76:21: note: expanded from macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^
   kernel/sched/core.c:8773:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
    8773 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
         |                                        ^             ~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:8748:1: note: array 'preempt_modes' declared here
    8748 | const char *preempt_modes[] = {
         | ^
   1 warning and 1 error generated.


vim +/__do_migrate_task_rq +3981 kernel/sched/core.c

  3969	
  3970	static inline void proxy_set_task_cpu(struct task_struct *p, int cpu)
  3971	{
  3972		unsigned int wake_cpu;
  3973	
  3974		/*
  3975		 * Since we are enqueuing a blocked task on a cpu it may
  3976		 * not be able to run on, preserve wake_cpu when we
  3977		 * __set_task_cpu so we can return the task to where it
  3978		 * was previously runnable.
  3979		 */
  3980		wake_cpu = p->wake_cpu;
> 3981		__do_migrate_task_rq(p, cpu);
  3982		__set_task_cpu(p, cpu);
  3983		p->wake_cpu = wake_cpu;
  3984	}
  3985	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
