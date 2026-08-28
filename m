Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0868A1E1A3D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Aug 2026 21:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787951294; cv=none; b=kxWZBXLV53wYWTAI7KdbDLb9cRcf9eI5PELQXtOAjzZG7G/GVPAANrsnoo2zA5e0ZECbCYiCKXRtn0qlpmVUaUG07v8U3/txfu7hzWgS+ohgaCQfqSOazwDlBCUNIAahUC8Kt6gXqIbu0XudRyHjdByJLVSkV4HZ7CWr838gClg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787951294; c=relaxed/simple;
	bh=0xP/5b9oYiB2L6sA7b7PNJs+4MaafoFv6gkFZ1WEgI4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jTB0XjlZUhcEdwOTrrEmNt2yNEEyLCox6SYJngMFgckDnTeRIQ05jnm+miCgQDoCEm80duLveC5HtwTDjjpxRP0JMwStWaLFnNuPuCQsnXe47ECTJhrNw5uD2Es09GTmAYlGBlnRGFXjzRVG3v2u13iRYz219ky7xJKyppJZPPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJDIZanf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJDIZanf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787951293; x=1819487293;
  h=date:from:to:cc:subject:message-id;
  bh=0xP/5b9oYiB2L6sA7b7PNJs+4MaafoFv6gkFZ1WEgI4=;
  b=UJDIZanfLCVwAU0SClvLdgjN3fxezwUcqBf/DXGD6ZdscsFCbNhuEaJp
   di8SDAzOJME3p7RBGvVEX+r7UbQpRAXXzb+LB2q+lHIMJ2alRhBncfdtE
   EYVm2BjoSw0jBW5ZFD/DZvgk50Ug2L6yWNa6Pd/RPhGBiGykOJvm80j/m
   WiL9dXQ+Lc63zwq+whlMGp1C8xxaKtK3QOd6v3t5znySJxIB+orrejdBX
   v3H5sytXy+X1BvgcQ8NIKPDaLpNsRF7KrjAth6CcvkDJXAJSMUWmyV7dV
   M6ni4nQtxVp2O8fARrd2dWgc0Vx6tLVObJGlGP6iRDFvb6Y0iiEgNcL8/
   g==;
X-CSE-ConnectionGUID: Z7AJrjWtQGicxIDUdpXhKQ==
X-CSE-MsgGUID: A4M94xgESWqm/VM3EVAWlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88480654"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="88480654"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 14:08:11 -0700
X-CSE-ConnectionGUID: NMXhzp8NRdCKcklwjsWwhQ==
X-CSE-MsgGUID: Chqcy/moSseVd4hgVACMwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="266467170"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Aug 2026 14:08:09 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x03nz-00000000BzE-28A8;
	Fri, 28 Aug 2026 21:08:07 +0000
Date: Sat, 29 Aug 2026 05:07:27 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.1/prjc 2/76] kernel/sched/alt_core.c:5719:12:
 warning: array index -1 is before the beginning of the array
Message-ID: <202608290502.iPOQKhWc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.1/prjc
head:   417525fbfff38fdb81794da421aa8a6a6b9e5f88
commit: f3e8d2abb7fb9e5202ac3cb9991bd7aad83c9aee [2/76] sched/alt: [Sync] dcb7416212e6 block: invalidate cached plug timestamp after task switch
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260829/202608290502.iPOQKhWc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260829/202608290502.iPOQKhWc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608290502.iPOQKhWc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:3782:25: error: too few arguments to function call, single argument 'tsk' was not specified
    3782 |         blk_plug_invalidate_ts();
         |         ~~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/blkdev.h:1220:20: note: 'blk_plug_invalidate_ts' declared here
    1220 | static inline void blk_plug_invalidate_ts(struct task_struct *tsk)
         |                    ^                      ~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:5719:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
    5719 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
         |                                        ^             ~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:5694:1: note: array 'preempt_modes' declared here
    5694 | const char *preempt_modes[] = {
         | ^
   1 warning and 1 error generated.


vim +5719 kernel/sched/alt_core.c

56fe8ccfc379330 Alfred Chen 2025-05-06  5697  
56fe8ccfc379330 Alfred Chen 2025-05-06  5698  const char *preempt_model_str(void)
56fe8ccfc379330 Alfred Chen 2025-05-06  5699  {
56fe8ccfc379330 Alfred Chen 2025-05-06  5700  	bool brace = IS_ENABLED(CONFIG_PREEMPT_RT) &&
56fe8ccfc379330 Alfred Chen 2025-05-06  5701  		(IS_ENABLED(CONFIG_PREEMPT_DYNAMIC) ||
56fe8ccfc379330 Alfred Chen 2025-05-06  5702  		 IS_ENABLED(CONFIG_PREEMPT_LAZY));
56fe8ccfc379330 Alfred Chen 2025-05-06  5703  	static char buf[128];
56fe8ccfc379330 Alfred Chen 2025-05-06  5704  
56fe8ccfc379330 Alfred Chen 2025-05-06  5705  	if (IS_ENABLED(CONFIG_PREEMPT_BUILD)) {
56fe8ccfc379330 Alfred Chen 2025-05-06  5706  		struct seq_buf s;
56fe8ccfc379330 Alfred Chen 2025-05-06  5707  
56fe8ccfc379330 Alfred Chen 2025-05-06  5708  		seq_buf_init(&s, buf, sizeof(buf));
56fe8ccfc379330 Alfred Chen 2025-05-06  5709  		seq_buf_puts(&s, "PREEMPT");
56fe8ccfc379330 Alfred Chen 2025-05-06  5710  
56fe8ccfc379330 Alfred Chen 2025-05-06  5711  		if (IS_ENABLED(CONFIG_PREEMPT_RT))
56fe8ccfc379330 Alfred Chen 2025-05-06  5712  			seq_buf_printf(&s, "%sRT%s",
56fe8ccfc379330 Alfred Chen 2025-05-06  5713  				       brace ? "_{" : "_",
56fe8ccfc379330 Alfred Chen 2025-05-06  5714  				       brace ? "," : "");
56fe8ccfc379330 Alfred Chen 2025-05-06  5715  
56fe8ccfc379330 Alfred Chen 2025-05-06  5716  		if (IS_ENABLED(CONFIG_PREEMPT_DYNAMIC)) {
56fe8ccfc379330 Alfred Chen 2025-05-06  5717  			seq_buf_printf(&s, "(%s)%s",
d79037362b44e29 Alfred Chen 2025-07-07  5718  				       preempt_dynamic_mode >= 0 ?
56fe8ccfc379330 Alfred Chen 2025-05-06 @5719  				       preempt_modes[preempt_dynamic_mode] : "undef",
56fe8ccfc379330 Alfred Chen 2025-05-06  5720  				       brace ? "}" : "");
56fe8ccfc379330 Alfred Chen 2025-05-06  5721  			return seq_buf_str(&s);
56fe8ccfc379330 Alfred Chen 2025-05-06  5722  		}
56fe8ccfc379330 Alfred Chen 2025-05-06  5723  
56fe8ccfc379330 Alfred Chen 2025-05-06  5724  		if (IS_ENABLED(CONFIG_PREEMPT_LAZY)) {
56fe8ccfc379330 Alfred Chen 2025-05-06  5725  			seq_buf_printf(&s, "LAZY%s",
56fe8ccfc379330 Alfred Chen 2025-05-06  5726  				       brace ? "}" : "");
56fe8ccfc379330 Alfred Chen 2025-05-06  5727  			return seq_buf_str(&s);
56fe8ccfc379330 Alfred Chen 2025-05-06  5728  		}
56fe8ccfc379330 Alfred Chen 2025-05-06  5729  
56fe8ccfc379330 Alfred Chen 2025-05-06  5730  		return seq_buf_str(&s);
56fe8ccfc379330 Alfred Chen 2025-05-06  5731  	}
56fe8ccfc379330 Alfred Chen 2025-05-06  5732  
56fe8ccfc379330 Alfred Chen 2025-05-06  5733  	if (IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY_BUILD))
56fe8ccfc379330 Alfred Chen 2025-05-06  5734  		return "VOLUNTARY";
56fe8ccfc379330 Alfred Chen 2025-05-06  5735  
56fe8ccfc379330 Alfred Chen 2025-05-06  5736  	return "NONE";
56fe8ccfc379330 Alfred Chen 2025-05-06  5737  }
56fe8ccfc379330 Alfred Chen 2025-05-06  5738  

:::::: The code at line 5719 was first introduced by commit
:::::: 56fe8ccfc37933098b115aecf55df2fc05823ddb sched/alt: [Sync] 8bdc5daaa01e sched: Add a generic function to return the preemption string

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
