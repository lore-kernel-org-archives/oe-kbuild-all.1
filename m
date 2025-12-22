Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B64B2D23B9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 02:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766369638; cv=none; b=mJ9WXrvMx8npqQb0GTjgLwRi9UkK/0vUEwJHxZeLoxqJTcl9ftRgZ0gmJ0Dvo9KRmpEtOuS2dra1dX5R8YBidhlOZkD35jAmvd7IV0kXGV1lLlu5G2sii03AtNWkDky5qEadNaqzbpAZ1NvEv3sTESMLiuGTJxQ51IaD3vyPdP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766369638; c=relaxed/simple;
	bh=gnX2+92LMJr0vNMwGrVVK02OK+Q4MGs1f1CekwpxvXg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uQZEOnmoQ1L9GXaHV9+j/md/sPSPB6EZ8vHnllAbOxXNoZPJ65hX5B9ayl1rBWlUsVZkqb3SnYSKoXpgonvuaCOM9IXb+YmRmsx2oYNgJdgRn4fgMQx99TOCeHljDzPwdnRft5qTMxH5RJra3cGJ6g99G3H32QUs4LILYwPIAHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+eJg71i; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+eJg71i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766369636; x=1797905636;
  h=date:from:to:cc:subject:message-id;
  bh=gnX2+92LMJr0vNMwGrVVK02OK+Q4MGs1f1CekwpxvXg=;
  b=M+eJg71io93diu/U3o9kCg2LaV9kqrjLA3pMYnJiWMm0diPGdp1Tyb6d
   z4NYbvjyLnpGn3Wqhi5wl1G5BxIT018wgDdDbxJJmZidkwK73LfLwqeov
   t4Xm//A6NcLzPidn5Oj3ufhyOVl4+BhudybiGeYFJHkNs/PesiVkJW3s0
   8usJ5jof2Vdek93j6xTZ6sPRBLFdvK8buNQAuPqjAzopQ1IZuxzoZJTc6
   3OF6EB6+8vQG1VI6pu6pPuF0vhYFuZMd/gP+e95p6V9yKe+AVnio6MBo9
   wp2EdG0LkWV+S/r86Sqidin6k9RyV3y1cOEOCsI70FSxaLio2h10AyAx7
   Q==;
X-CSE-ConnectionGUID: OJsiF6+YRv2Pr86GybslVQ==
X-CSE-MsgGUID: m56CjpykSsStf6ENZ8w0Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67222017"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="67222017"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 18:13:55 -0800
X-CSE-ConnectionGUID: CeH0uQgdSQeeylUogfa6Ug==
X-CSE-MsgGUID: 4AUBpHnhRLaOWqeMHf0+Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199709287"
Received: from lkp-server02.sh.intel.com (HELO 9d662e18a02b) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Dec 2025 18:13:53 -0800
Received: from kbuild by 9d662e18a02b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXVQk-0000000003d-3O0I;
	Mon, 22 Dec 2025 02:13:50 +0000
Date: Mon, 22 Dec 2025 10:13:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Collins <bcollins@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: arch/powerpc/kexec/core.c:217:20: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202512221044.ZxX0SAof-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9448598b22c50c8a5bb77a9103e2d49f134c9578
commit: 38c64dfe0af12778953846df5f259e913275cfe5 kexec: Include kernel-end even without crashkernel
date:   6 weeks ago
config: powerpc-randconfig-r111-20251222 (https://download.01.org/0day-ci/archive/20251222/202512221044.ZxX0SAof-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 42b3483ac4987cae1bdb632398e8a3ce2dea6633)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221044.ZxX0SAof-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221044.ZxX0SAof-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/kexec/core.c:217:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int static [addressable] [toplevel] [usertype] kernel_end @@     got restricted __be32 [usertype] @@
   arch/powerpc/kexec/core.c:217:20: sparse:     expected unsigned int static [addressable] [toplevel] [usertype] kernel_end
   arch/powerpc/kexec/core.c:217:20: sparse:     got restricted __be32 [usertype]

vim +217 arch/powerpc/kexec/core.c

6f29c3298b1821 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-17  203  
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  204  static int __init kexec_setup(void)
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  205  {
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  206  	struct device_node *node;
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  207  
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  208  	node = of_find_node_by_path("/chosen");
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  209  	if (!node)
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  210  		return -ENOENT;
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  211  
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  212  	/* remove any stale properties so ours can be found */
38c64dfe0af127 arch/powerpc/kexec/core.c           Ben Collins     2025-04-21  213  	of_remove_property(node, of_find_property(node, kernel_end_prop.name,
38c64dfe0af127 arch/powerpc/kexec/core.c           Ben Collins     2025-04-21  214  						  NULL));
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  215  
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  216  	/* information needed by userspace when using default_machine_kexec */
ea961a828fe725 arch/powerpc/kernel/machine_kexec.c Anton Blanchard 2014-01-22 @217  	kernel_end = cpu_to_be_ulong(__pa(_end));
79d1c712958f94 arch/powerpc/kernel/machine_kexec.c Nathan Fontenot 2012-10-02  218  	of_add_property(node, &kernel_end_prop);
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  219  

:::::: The code at line 217 was first introduced by commit
:::::: ea961a828fe7250e954f086d74d9323c3d44c3e4 powerpc: Fix endian issues in kexec and crash dump code

:::::: TO: Anton Blanchard <anton@samba.org>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
