Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DCE31ED88
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 05:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769836193; cv=none; b=WwwSvtIqdGm4OblyRHDl5PsIFkAAh6bM9KfM9gjsApIb/dOEJR/sjayprtZWBN+cURLHxv6lfOu2szTvXUCEBc0dt3AIOCtx6McdNbbmizn2D8/Ug9w9w49GdCTdmfgfyM3XiL9Jqfn7JqB1frJtSkbu9COeqqVPZy6483dlEgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769836193; c=relaxed/simple;
	bh=xL5ZKLByhC0FWPp4TSC62Ibitx8/WA7sK+2UB1wwKHg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GZr2r5rKH2S81oOnh+dO26lSOY+8j8+DwmXGkU1Z3oRdaOAX9gf/oEpO91MUbUnosALipr0Ihoe/CB5nNBr8agkzaN9U3XHjhh/mGfSMcRkxERkbao85Eys585ZwZ9sr2yrhxvHntXMTrKdtesy03hQ9Rc02c3dh+9ks9AMDTHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYo3IU1A; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYo3IU1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769836188; x=1801372188;
  h=date:from:to:cc:subject:message-id;
  bh=xL5ZKLByhC0FWPp4TSC62Ibitx8/WA7sK+2UB1wwKHg=;
  b=LYo3IU1AE6bdbzyoxZRlZVX+XkHysRI5QJYY+ZxclMbXCbrd1ALniBPU
   fho0ks0IpxznSExWavIgYFXj6Y2NDDY/i8ju9ZfHSLNAEDsR+H+ITjyHM
   zR9GdabL9rogSShLTu/EajUFotntcRblQhe49gv7BnWP808OQ1BMuwl88
   0Mv/Glnz5s5TbuCVGhSvZa0IeIx88tQd2CqSWr+SFbMLX6i5ph+XgCtpd
   iAmB/3oAH8cJOoufVrJ1YRAW605od8G5oIoXD8Nizg9s1ASXnx/QQyp4C
   uMHPf3dN+FPHBS9J5MgKKAd3lN0oYhs6Vkv3J2X1i2hrZhHuPBS9R8UM7
   Q==;
X-CSE-ConnectionGUID: MsFZky7+RTmLv6msYiIcpg==
X-CSE-MsgGUID: O1TQZxYtQgubvbzvWw2zPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="58664983"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="58664983"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 21:09:48 -0800
X-CSE-ConnectionGUID: rAyXngLBTwKg+uFOhsM1jQ==
X-CSE-MsgGUID: IwUFVBKnRfK6J6RbUTJ4bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="213104803"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Jan 2026 21:09:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm3Et-00000000dey-2eeA;
	Sat, 31 Jan 2026 05:09:43 +0000
Date: Sat, 31 Jan 2026 13:09:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_9 1/12]
 kernel/bpf/trampoline.c:448:15: error: variable 'trampoline_ops' has
 initializer but incomplete type
Message-ID: <202601311336.q9KhF6Xp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_9
head:   4a1d38e3df06743886a06b547187aec8023ef27d
commit: 9ecb3af28fc9354376aac0f9645ff70b637c067b [1/12] bpf: Add struct bpf_trampoline_ops object
config: i386-buildonly-randconfig-004-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311336.q9KhF6Xp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311336.q9KhF6Xp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311336.q9KhF6Xp-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/bpf/trampoline.c:448:15: error: variable 'trampoline_ops' has initializer but incomplete type
     448 | static struct bpf_trampoline_ops trampoline_ops = {
         |               ^~~~~~~~~~~~~~~~~~
>> kernel/bpf/trampoline.c:449:10: error: 'struct bpf_trampoline_ops' has no member named 'register_fentry'
     449 |         .register_fentry   = register_fentry,
         |          ^~~~~~~~~~~~~~~
>> kernel/bpf/trampoline.c:449:30: warning: excess elements in struct initializer
     449 |         .register_fentry   = register_fentry,
         |                              ^~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:449:30: note: (near initialization for 'trampoline_ops')
>> kernel/bpf/trampoline.c:450:10: error: 'struct bpf_trampoline_ops' has no member named 'unregister_fentry'
     450 |         .unregister_fentry = unregister_fentry,
         |          ^~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:450:30: warning: excess elements in struct initializer
     450 |         .unregister_fentry = unregister_fentry,
         |                              ^~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:450:30: note: (near initialization for 'trampoline_ops')
>> kernel/bpf/trampoline.c:451:10: error: 'struct bpf_trampoline_ops' has no member named 'modify_fentry'
     451 |         .modify_fentry     = modify_fentry,
         |          ^~~~~~~~~~~~~
   kernel/bpf/trampoline.c:451:30: warning: excess elements in struct initializer
     451 |         .modify_fentry     = modify_fentry,
         |                              ^~~~~~~~~~~~~
   kernel/bpf/trampoline.c:451:30: note: (near initialization for 'trampoline_ops')
   kernel/bpf/trampoline.c: In function 'bpf_trampoline_update_ops':
>> kernel/bpf/trampoline.c:710:26: error: invalid use of undefined type 'struct bpf_trampoline_ops'
     710 |                 err = ops->register_fentry(tr, im->image, data);
         |                          ^~
   kernel/bpf/trampoline.c: At top level:
>> kernel/bpf/trampoline.c:448:34: error: storage size of 'trampoline_ops' isn't known
     448 | static struct bpf_trampoline_ops trampoline_ops = {
         |                                  ^~~~~~~~~~~~~~


vim +/trampoline_ops +448 kernel/bpf/trampoline.c

   447	
 > 448	static struct bpf_trampoline_ops trampoline_ops = {
 > 449		.register_fentry   = register_fentry,
 > 450		.unregister_fentry = unregister_fentry,
 > 451		.modify_fentry     = modify_fentry,
   452	};
   453	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
