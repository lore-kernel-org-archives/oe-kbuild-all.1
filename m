Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E969A4685
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 01:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725327814; cv=none; b=aopRAX8ySZVfepjM2Sn4MwMSEeKuyvxz6U2umQPuAmML9D0DXn0rhndScYETcTVFC/K3rrBxyui4+pIkG0zNRuyApvW1f/LFymlf9R1OaFwOqGsMLy8w3J+Si3z2xy94U91xP2MDum5sthApoBaQGZkLZl+853upzz4DfI3F/tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725327814; c=relaxed/simple;
	bh=rA6DsI6n4v/6Ut6TT3ryId+OoKtC1dZ/95K2QCsjNig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FpDTn7jjfumuvwbM62cQaA5liUqHGTJNdI6SCBsHIM0JHZTEOh4IOgvgmyQM7Tzm1JSBe1WAS4FGGaeRwgwHYYRkLD4bIa3wDFnZz1R8SQVUvStdlq6ZcrvkNXSRUyFJCabzpUZCsz8U5an/yTPS4FpEpn2n2HgJ/cnCC/pANQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HwSj9e61; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HwSj9e61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725327813; x=1756863813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rA6DsI6n4v/6Ut6TT3ryId+OoKtC1dZ/95K2QCsjNig=;
  b=HwSj9e61A+mCU9FSC6pt0165pRUirLxND0tdnfhSMPNXsRwWPNpMP9vb
   TKc42jza63H272pOBZv0TZ4si5PhojbnFUikzNXEp/r5eQ04Xi7RQGhr/
   +wzPsiC9J7msDLHj6MA56Ovo5BNGogbxhF4cqLJfv69YETfDI6yq2r/61
   +ThozsTqaegG8b/D6KtHBWHAzGO+HD2WdBm0So7TXzp3/2XJ3sPqIEi2c
   pQwaa5wEp757hfBVzx4f9FGHmE4/+X70j3gVdZErOUpx8DH/5XJs5aw+e
   0V6hBnLdOOJffO6xGY972oW3y5z6Weagyt5Nws6vuPCMXiJMBku0tdrhW
   Q==;
X-CSE-ConnectionGUID: COLIJUAwQPuzRYYjnuE1ZA==
X-CSE-MsgGUID: G0UmWhnMS0CEiYwVDdFfBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="34475932"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="34475932"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 18:43:32 -0700
X-CSE-ConnectionGUID: OglLRDkZSvqUGoSPH4AaPA==
X-CSE-MsgGUID: 6mb/HdomTPuX262cH9l7/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="69609140"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Sep 2024 18:43:31 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slIZt-00065O-1I;
	Tue, 03 Sep 2024 01:43:29 +0000
Date: Tue, 3 Sep 2024 09:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:mm-generic-shadow-stack-guard 2/4]
 arch/xtensa/kernel/syscall.c:59:17: error: unknown type name 'vm_flgs_t';
 did you mean 'vm_flags_t'?
Message-ID: <202409030933.Cl60G9ex-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git mm-generic-shadow-stack-guard
head:   cb02398ba093f1730eca10afbb4baea7af28b1e5
commit: e20e42643b0c31b61ae8f48fa1ec3ecabcac1b4b [2/4] mm: Make arch_get_unmapped_area() take vm_flags by default
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20240903/202409030933.Cl60G9ex-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409030933.Cl60G9ex-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409030933.Cl60G9ex-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/xtensa/kernel/syscall.c:59:17: error: unknown type name 'vm_flgs_t'; did you mean 'vm_flags_t'?
      59 |                 vm_flgs_t vm_flags)
         |                 ^~~~~~~~~
         |                 vm_flags_t


vim +59 arch/xtensa/kernel/syscall.c

    55	
    56	#ifdef CONFIG_MMU
    57	unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
    58			unsigned long len, unsigned long pgoff, unsigned long flags,
  > 59			vm_flgs_t vm_flags)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
