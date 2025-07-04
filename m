Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C1625BF0B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Jul 2025 06:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751610620; cv=none; b=SdWulUukrUdT6cqProe2At4y61v/s4g9RcKcGE4YS2oxxXsjo5LHvJWtqEQgK/H24iycPKlwmndzbSmZZr9o23j/jEhzGIQXCa1rs+6GD+Agg5OqvelMxpEqlqJ8NFdCfciXTCKtorVNVzK/ue+gu1MhmVoFT3De6UTE71VIBaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751610620; c=relaxed/simple;
	bh=cszJGJ3uwv84/OVFkv9UoMNXP9CRY8uItvq8izcJkk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AI5MVYdtldJnhlXYAioxK/o9PuwSlM8W0tAojz1pgwORaqAmN8ZdwnXC0rGmt5fzJlNLHw5lbndw3IDMSXJDu2CKD822aP+KP9Y6Nfwdjr/K5mUVHDYLS1MCAKWJlLeeOCG8SbvDG6InJMJHcoi1rUUWqMwSI/cgGiN2sLP+/yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWk0c9yQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWk0c9yQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751610618; x=1783146618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cszJGJ3uwv84/OVFkv9UoMNXP9CRY8uItvq8izcJkk4=;
  b=gWk0c9yQKczrj0ocYRpiDnltPorU1wu9H24pldupvOts6oN3ph/jjAwV
   H0qSJN8lqzjCrdeti52bHvsXANaYDNXGW3RljsLY9fO6XDHe5ySPrxQ3g
   q4prEMacnTjqN9LgvefYhY1Uk6bOREGvfdeSjfOrTPw6PXi02yLBdV3S1
   35KiBhyHNY3RQeRxSj7dkyb5WGKJ1m8D8cjTb1pbQcrxxiyAQBCwHhGAT
   GJzQCV5y/kT2PgmMoWQKU/ONnrXYZmpGF7d6HuODJhlkzkca9EvV6CfMN
   3l2wgjvfYRemYYPIbHd9b/cH4f2g1uLqY2ohQfEMS45I/Bw6otLTtNLE4
   w==;
X-CSE-ConnectionGUID: ZmnDGYJbTNGQFYbPaabXug==
X-CSE-MsgGUID: A1rbKFzSSYi4FhuzF4BCwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53075104"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="53075104"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 23:30:17 -0700
X-CSE-ConnectionGUID: E/fTH7s2Tb6NbY/XGL3/1A==
X-CSE-MsgGUID: 4zSrKahmTsC5T2pQGVu8CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="154209943"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Jul 2025 23:30:16 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXZw6-0003Oy-09;
	Fri, 04 Jul 2025 06:30:14 +0000
Date: Fri, 4 Jul 2025 14:29:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3011/3011] arch/arm64/kernel/syscall.c:281:6:
 warning: no previous prototype for 'do_el0_xcall'
Message-ID: <202507041422.jQntADhM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   d33d9222dd0abdddb305cbcd6dddf6763e0bcd5a
commit: f22cbd7df3438fb008e74ddcbe6619c1a03c7955 [3011/3011] arm64: Faster SVC exception handler with xcall
config: arm64-randconfig-001-20250704 (https://download.01.org/0day-ci/archive/20250704/202507041422.jQntADhM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041422.jQntADhM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041422.jQntADhM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/syscall.c:281:6: warning: no previous prototype for 'do_el0_xcall' [-Wmissing-prototypes]
     281 | void do_el0_xcall(struct pt_regs *regs)
         |      ^~~~~~~~~~~~
   arch/arm64/kernel/syscall.c:297:6: warning: no previous prototype for 'do_el0_svc' [-Wmissing-prototypes]
     297 | void do_el0_svc(struct pt_regs *regs)
         |      ^~~~~~~~~~
   arch/arm64/kernel/syscall.c:313:6: warning: no previous prototype for 'do_el0_svc_compat' [-Wmissing-prototypes]
     313 | void do_el0_svc_compat(struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~~~~


vim +/do_el0_xcall +281 arch/arm64/kernel/syscall.c

   279	
   280	#ifdef CONFIG_FAST_SYSCALL
 > 281	void do_el0_xcall(struct pt_regs *regs)
   282	{
   283		const syscall_fn_t *t = sys_call_table;
   284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
