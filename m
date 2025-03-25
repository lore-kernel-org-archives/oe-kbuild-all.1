Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5621DD0F6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 21:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742939367; cv=none; b=tg+a30TaJGbiDLEIPzhXdcQCQjjxG/Fi795CE/82XBp926GYshENN22NFiVtdg+GuFwlSfi7qoZj9m1uEchsW+8OP1F+ERmPL4GFBuLDb8ODViuqJjOZtPQGZs3vQ7bWIBsO/YEIt3B8iY6m8F76wcPETaNzDyPpELW5+BhA5HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742939367; c=relaxed/simple;
	bh=x/Z+pqKf+ml1aC6CWC68ZM78e7BXsXoftjAFCsJdXPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PPhDvwi3KdTenJB2SgZs5Fn4bTULteWrCzjIjSUX4ZHEeUWh0l3eg2QMAIaklwuEzz9LJdmjP6bqFNqgZubW5TKwjD7lEMiknR1NdGc8mfD6MplM+eK23TytMRFvaTb9OG0jCXGCNYlKHJIEwDBzktezeQSO9TfFaKIAnjslxxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JTUmvjFS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JTUmvjFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742939365; x=1774475365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x/Z+pqKf+ml1aC6CWC68ZM78e7BXsXoftjAFCsJdXPA=;
  b=JTUmvjFSMCUs6s2q24xLMko9JcZaDmHUHZBGTTit5RpCciZxOocKGK7T
   BPMPKZrvcwFCsHxBY6t1E40lqOA12a9yFjmhOl1YMJzA5Vm71XOhnzCQn
   8MK/9Hyx/mWu/nP3pVIMDcUPKok+ZwOoh0Cf4Sy0QoSW4FwoKaDGmX+1r
   fRPh/4CN3CyppVnRmZ/tDCinWe1ptkfb568JZflGgMzONbLXb4nlBcHpW
   9MeMbUva5IvMriSpB7avBn2JEUWC22oAfWqcA+80sZuXt9OshFukYdQSq
   7QVcwJRrTnAyL693Ab8cWItzvls6NAeu++hyeeR8Wqeq7hW+4nBnRT32U
   Q==;
X-CSE-ConnectionGUID: lJE7dD1ET7OcTVMjUgZcRw==
X-CSE-MsgGUID: lc4V99uURKylJ6WlD1zl2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44093527"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="44093527"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 14:49:25 -0700
X-CSE-ConnectionGUID: CU6eBFn7SIeEQEChALTJrA==
X-CSE-MsgGUID: fyUWqGk9Slq0o95L2TZtuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="124220756"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Mar 2025 14:49:24 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txC93-0005Ct-18;
	Tue, 25 Mar 2025 21:49:19 +0000
Date: Wed, 26 Mar 2025 05:48:15 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 32/32] htmldocs: Makefile:83: ***
 Cannot find a vmlinux for VMLINUX_BTF at any of "  ../../vmlinux
 /sys/kernel/btf/vmlinux /boot/vmlinux-5.9.0-2-amd64".  Stop.
Message-ID: <202503260524.SPqeV83Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   1355a80cc32f9ae2fdcf9aefa7c97c6eee9149a9
commit: 2e953dfef122e371d4ab9778ad628e9a18c78827 [32/32] sched_ext: Add scx_simple and scx_example_qmap example schedulers
reproduce: (https://download.01.org/0day-ci/archive/20250326/202503260524.SPqeV83Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503260524.SPqeV83Q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Makefile:83: *** Cannot find a vmlinux for VMLINUX_BTF at any of "  ../../vmlinux /sys/kernel/btf/vmlinux /boot/vmlinux-5.9.0-2-amd64".  Stop.
   make[2]: *** [Makefile:193: sched_ext_clean] Error 2
   make[1]: *** [Makefile:1354: sched_ext] Error 2
   make[1]: Target 'distclean' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'distclean' not remade because of errors.
--
>> Makefile:83: *** Cannot find a vmlinux for VMLINUX_BTF at any of "  ../../vmlinux /sys/kernel/btf/vmlinux /boot/vmlinux-5.9.0-2-amd64".  Stop.
   make[2]: *** [Makefile:193: sched_ext_clean] Error 2
   make[1]: *** [Makefile:1354: sched_ext] Error 2
   make[1]: Target 'mrproper' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'mrproper' not remade because of errors.


vim +83 Makefile

^1da177e4c3f41 Linus Torvalds 2005-04-16  81  
^1da177e4c3f41 Linus Torvalds 2005-04-16  82  ifeq ("$(origin V)", "command line")
^1da177e4c3f41 Linus Torvalds 2005-04-16 @83    KBUILD_VERBOSE = $(V)
^1da177e4c3f41 Linus Torvalds 2005-04-16  84  endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  85  

:::::: The code at line 83 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
