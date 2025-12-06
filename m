Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8E17640E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 12:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765022931; cv=none; b=JTs1NnXIEKHbfisU6w1JFC3AWy9YJ50FbglU+L98vK5kq2A0tRO+Q/mPc8/WUZHAQSeh9JBDnCv0z/gZRHRU3aLEXUZdjlkBsXIjzv6dxbczRHCC4vPhQjN51evarpVz1w2yh9oXV/VWMN0rCKaHye+ebQGQfoviCVXYDTuO05g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765022931; c=relaxed/simple;
	bh=M837sCII46b+IdMBCaG9jQmIL86+RXV61gaHzW1gmNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yv8toY2ox5AlvGJq31xde19djXhUvDKWhlUCE982hBbYKWG2ssMMUYKPghAYO5XYzTcAw4b8L9R8mDNhAdCDG+XJk+3VXR1to+fOejZFof/PXI7Wb+KUFdgLVAs5+2x4at89KHpJVc8QDRC7jbRnU9/REQ7qk8/JcKwouuXoITA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SrPaQcse; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SrPaQcse"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765022930; x=1796558930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M837sCII46b+IdMBCaG9jQmIL86+RXV61gaHzW1gmNw=;
  b=SrPaQcsejdYyjuOAFlJEJ6cdtuipIMtuvaKB+V7WhHMtywN+fAb0hU9n
   sWy4EQOkNuQVmaW62QffD/s0lgow/D3qdSQzU4z1USL+OqzdvhYoe2TbR
   NiPx/oauZt8AiHmKjUdYIWFElGOeAQBN0q2hVDGS0ZaoSI40lluGqfHBw
   0SYY7+zoOKpGSxh0t+oqyaaPPvH6yAxeZAJRB4qW9ABsGoVbAtb7u/+RM
   ShcTBHG0nCZH9hcosPoZmnVLOOJGdr+DXEpefwY+9s2eEcBObmdheUDyQ
   Rzx6KBjB92P2n0uAmSL7V3i6+7R3++oqO8FkF/IdDkVcXBaknokKoxDTL
   Q==;
X-CSE-ConnectionGUID: e3IBvV15Q4afO3+pwZ5mbA==
X-CSE-MsgGUID: hbIpmb6mQnqqI1odnS363A==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67003562"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="67003562"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 04:08:49 -0800
X-CSE-ConnectionGUID: ckNYwkSNRbupbl97caLScQ==
X-CSE-MsgGUID: 8aM4ofoSRzmGHFAhD5S+7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="226174788"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Dec 2025 04:08:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRr5h-00000000I6v-0xg0;
	Sat, 06 Dec 2025 12:08:45 +0000
Date: Sat, 6 Dec 2025 20:08:41 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-perf:kvm/protected-memory 17/17]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:582:5: warning: no previous prototype for
 'insert_vm_table_entry'
Message-ID: <202512061933.HptYSmM1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git kvm/protected-memory
head:   844a375408e66647ee7b0c1ee710b6e5a60b59db
commit: 844a375408e66647ee7b0c1ee710b6e5a60b59db [17/17] Add tests for forced reclaim
config: arm64-randconfig-001-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061933.HptYSmM1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061933.HptYSmM1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061933.HptYSmM1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/pkvm.c:582:5: warning: no previous prototype for 'insert_vm_table_entry' [-Wmissing-prototypes]
    int insert_vm_table_entry(pkvm_handle_t handle, struct pkvm_hyp_vm *hyp_vm)
        ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:596:6: warning: no previous prototype for 'remove_vm_table_entry' [-Wmissing-prototypes]
    void remove_vm_table_entry(pkvm_handle_t handle)
         ^~~~~~~~~~~~~~~~~~~~~


vim +/insert_vm_table_entry +582 arch/arm64/kvm/hyp/nvhe/pkvm.c

   576	
   577	/*
   578	 * Insert a pointer to the initialized VM into the VM table.
   579	 *
   580	 * Return 0 on success, or negative error code on failure.
   581	 */
 > 582	int insert_vm_table_entry(pkvm_handle_t handle, struct pkvm_hyp_vm *hyp_vm)
   583	{
   584		int ret;
   585	
   586		hyp_spin_lock(&vm_table_lock);
   587		ret = __insert_vm_table_entry(handle, hyp_vm);
   588		hyp_spin_unlock(&vm_table_lock);
   589	
   590		return ret;
   591	}
   592	
   593	/*
   594	 * Deallocate and remove the VM table entry corresponding to the handle.
   595	 */
 > 596	void remove_vm_table_entry(pkvm_handle_t handle)
   597	{
   598		hyp_assert_lock_held(&vm_table_lock);
   599		vm_table[vm_handle_to_idx(handle)] = NULL;
   600	}
   601	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
