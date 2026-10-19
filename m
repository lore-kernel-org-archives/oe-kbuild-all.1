Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7A4489885
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 07:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394144; cv=none; b=rJNrCNnXlMfL4Ld5bmw+0g2/xK3de+4Htr7zHykGnCztkY58CViZ96VR8h4lXdvK5tcO7y6o35LGCOZVKn1gk1QI+vUW0wB8tpifr4IEfzcl2iWbKoWlriQ5qMfhQu/5OK512l3BJWKTiSJNvwk6K/IG87+8Cb2o0AJV+ZoZy+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394144; c=relaxed/simple;
	bh=kKn9WVeDEl+qXv3qZ/z7tMJf6Boaca4J83lh7kLLi2E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WfSzKEjKOQ/V6jR8VeVffj6uExTbTw0oJ0nNSCICa6baZ5pT3Zk5vwamjHemjGNDEBwlCq8Az8J4Vz3+opPdAFw9yV9jO3foLPN9TbiKfrNJoFgdLNmPwC4VhvjASe45t0SVtoSlzU3zJFaNmA3iIJnhmaNhOrscZFiS2luQQc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgkmJjwA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgkmJjwA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792394143; x=1823930143;
  h=date:from:to:cc:subject:message-id;
  bh=kKn9WVeDEl+qXv3qZ/z7tMJf6Boaca4J83lh7kLLi2E=;
  b=cgkmJjwAoeUb8v3I9znuz4dK7nQd6hq0yyLHPEYSCD0EMjpBjvxjvWfU
   aDHh+4UVJHVLb+cblccSQbj31hy6AV9Q1/e007Xu64qyamSz+itL5a1t2
   9QLvXVofHa4a96u4x+XZc7wetxATLLezFeMkPiFTSXOtWRA5TYBh1gj3g
   KL5bjZ2OGyqzXTygzf1ENAWjhp4B0RizFu6B7pxfOYPXmjBdrS5Feot6b
   sWW0m7VfcsY17hYx/qn+W6rtf7YmKrSx7tvCGcWGYKkMrxXE/JSU+wMxc
   KtF51TOb1LPwhgfbbabWfGJbYBDv49DPBo5TU3ymmiLsNrbSe4tyd6Yja
   w==;
X-CSE-ConnectionGUID: ZtrlDT3ITcmy2BgGnbzDYw==
X-CSE-MsgGUID: rKM1otdbTQOUP/Onj2c9DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1071246"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1071246"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 00:15:25 -0700
X-CSE-ConnectionGUID: PS7hagGBT6qPRO7D7eaB+w==
X-CSE-MsgGUID: d4w1tXhGQUiR2OUXoKzcug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2462426"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Oct 2026 00:15:23 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIhaa-00000000LNK-3sCS;
	Mon, 19 Oct 2026 07:15:20 +0000
Date: Mon, 19 Oct 2026 15:14:50 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss 31/32] arch/x86/mm/extable.c:45:undefined
 reference to `regs_set_return_ip'
Message-ID: <202610191547.4I2c88b5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kss
head:   1b2e2aefa6c7e3d15fac1b25a971b2d2cc3b697d
commit: ca107dce40b82cc491ac08e03e01626956ca5eb4 [31/32] fred-entry-ssp-muck
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20261019/202610191547.4I2c88b5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191547.4I2c88b5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191547.4I2c88b5-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `ex_handler_default':
>> arch/x86/mm/extable.c:45:(.text+0x17f60c): undefined reference to `regs_set_return_ip'
>> ld: arch/x86/mm/extable.c:45:(.text+0x17f7a9): undefined reference to `regs_set_return_ip'
   ld: arch/x86/mm/extable.c:45:(.text+0x17fba7): undefined reference to `regs_set_return_ip'
   ld: arch/x86/mm/extable.c:45:(.text+0x17ff38): undefined reference to `regs_set_return_ip'


vim +45 arch/x86/mm/extable.c

    35	
    36	static bool ex_handler_default(const struct exception_table_entry *e,
    37				       struct pt_regs *regs)
    38	{
    39		if (e->data & EX_FLAG_CLEAR_AX)
    40			regs->ax = 0;
    41		if (e->data & EX_FLAG_CLEAR_DX)
    42			regs->dx = 0;
    43	
    44		//regs->ip = ex_fixup_addr(e);
  > 45		regs_set_return_ip(regs, ex_fixup_addr(e));
    46		return true;
    47	}
    48	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
