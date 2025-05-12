Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704B729A313
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 22:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747089632; cv=none; b=ihDVsnaBjNou45zDKEfjAj6Y2OoLTI7PCH9f4gTxz2ILBKeZDMu1GV0Rt8arN6dSlfbbrRUJAeJG3wAistN1QYqLoo9CrfQ8i/fbj+Mu16lPFdea2IU6i5mm3z9hrt0iTJHqOLsNYFGuNv8WaF+VOaFNWUDXsRDooXXh5KYYnwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747089632; c=relaxed/simple;
	bh=VuiS0D1YG4GWVYhms8pgr0gb1FNy7qE4w2qE07T7WWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qkyhN1JJnevjG9Z2WnOm++CUE7Z61pUzSHPubqesUjtbxJ5WCpRu+qBjOJ6KpRyDcaTwqBtyZBmCeC3ZuOEwD9Fjz+Zl5EUC0q9l4iCHnKhmAsPrbGsR2gb5Ii2H7ZOjUcYALBjrVpiP4sLvI+LuMyXrghr9JIxu208Tc8XTznc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m79zLcS7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m79zLcS7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747089630; x=1778625630;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VuiS0D1YG4GWVYhms8pgr0gb1FNy7qE4w2qE07T7WWs=;
  b=m79zLcS7eIJBFpkdpKafEOPEPPOQzC30CrJHvjRbd45N6bz+HjQpI95N
   IiUVlydM/x1GwkAQQkj82xj3dfiU/AsUgWzeHOuHgNnzkt7dFcmVfC0et
   S2wq3a2u62DOXxbdzek8+LcQNP2C6r40uutYGvJ5+4A+oWfUcKIe4XItB
   Gwdm1JFAnD64ZcmOtXrH6GtRZhZudjI0p2niWAu9QAP+Gx7idrzna6AWl
   fAq2NWgpeuD+gQVQOaCSIL6o+Da+n8MSCbQvCs7vChZLskbOKd9p6lXyQ
   CPUhYYdVcuimE6cB/1r9ajYTOjokNEVuPg2uXjG8uO14d4V8zmrlbVb2Y
   A==;
X-CSE-ConnectionGUID: ulWKmsSPTuy6Gdzvy+Tvxw==
X-CSE-MsgGUID: M2Lt40iLT3SsfQvX5hXZ5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48607071"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="48607071"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 15:40:29 -0700
X-CSE-ConnectionGUID: QiB0QPDcRNCJcKTdQg8V2Q==
X-CSE-MsgGUID: 7ZdKgZOZSnmuYNdTt/vNBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="160784297"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 May 2025 15:40:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEbow-000FUe-15;
	Mon, 12 May 2025 22:40:26 +0000
Date: Tue, 13 May 2025 06:39:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>,
	Cyril Bur <cyrilbur@tenstorrent.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [linux-next:master 8977/10491] arch/riscv/kernel/signal.c:136:15:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202505130601.jp4IyETY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
commit: f6bff7827a48e59cff1ef98aae72452d65174e0c [8977/10491] riscv: uaccess: use 'asm_goto_output' for get_user()
config: riscv-randconfig-r121-20250512 (https://download.01.org/0day-ci/archive/20250513/202505130601.jp4IyETY-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250513/202505130601.jp4IyETY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505130601.jp4IyETY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/signal.c:136:15: sparse: sparse: Using plain integer as NULL pointer

vim +136 arch/riscv/kernel/signal.c

8ee0b41898fa26 Greentime Hu 2023-06-05  110  
8ee0b41898fa26 Greentime Hu 2023-06-05  111  /*
8ee0b41898fa26 Greentime Hu 2023-06-05  112   * Restore Vector extension context from the user's signal frame. This function
8ee0b41898fa26 Greentime Hu 2023-06-05  113   * assumes a valid extension header. So magic and size checking must be done by
8ee0b41898fa26 Greentime Hu 2023-06-05  114   * the caller.
8ee0b41898fa26 Greentime Hu 2023-06-05  115   */
8ee0b41898fa26 Greentime Hu 2023-06-05  116  static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
8ee0b41898fa26 Greentime Hu 2023-06-05  117  {
8ee0b41898fa26 Greentime Hu 2023-06-05  118  	long err;
8ee0b41898fa26 Greentime Hu 2023-06-05  119  	struct __sc_riscv_v_state __user *state = sc_vec;
8ee0b41898fa26 Greentime Hu 2023-06-05  120  	void __user *datap;
8ee0b41898fa26 Greentime Hu 2023-06-05  121  
c27fa53b858b4e Björn Töpel  2024-04-03  122  	/*
c27fa53b858b4e Björn Töpel  2024-04-03  123  	 * Mark the vstate as clean prior performing the actual copy,
c27fa53b858b4e Björn Töpel  2024-04-03  124  	 * to avoid getting the vstate incorrectly clobbered by the
c27fa53b858b4e Björn Töpel  2024-04-03  125  	 *  discarded vector state.
c27fa53b858b4e Björn Töpel  2024-04-03  126  	 */
c27fa53b858b4e Björn Töpel  2024-04-03  127  	riscv_v_vstate_set_restore(current, regs);
c27fa53b858b4e Björn Töpel  2024-04-03  128  
8ee0b41898fa26 Greentime Hu 2023-06-05  129  	/* Copy everything of __sc_riscv_v_state except datap. */
8ee0b41898fa26 Greentime Hu 2023-06-05  130  	err = __copy_from_user(&current->thread.vstate, &state->v_state,
8ee0b41898fa26 Greentime Hu 2023-06-05  131  			       offsetof(struct __riscv_v_ext_state, datap));
8ee0b41898fa26 Greentime Hu 2023-06-05  132  	if (unlikely(err))
8ee0b41898fa26 Greentime Hu 2023-06-05  133  		return err;
8ee0b41898fa26 Greentime Hu 2023-06-05  134  
8ee0b41898fa26 Greentime Hu 2023-06-05  135  	/* Copy the pointer datap itself. */
8ee0b41898fa26 Greentime Hu 2023-06-05 @136  	err = __get_user(datap, &state->v_state.datap);
8ee0b41898fa26 Greentime Hu 2023-06-05  137  	if (unlikely(err))
8ee0b41898fa26 Greentime Hu 2023-06-05  138  		return err;
8ee0b41898fa26 Greentime Hu 2023-06-05  139  	/*
8ee0b41898fa26 Greentime Hu 2023-06-05  140  	 * Copy the whole vector content from user space datap. Use
8ee0b41898fa26 Greentime Hu 2023-06-05  141  	 * copy_from_user to prevent information leak.
8ee0b41898fa26 Greentime Hu 2023-06-05  142  	 */
c27fa53b858b4e Björn Töpel  2024-04-03  143  	return copy_from_user(current->thread.vstate.datap, datap, riscv_v_vsize);
8ee0b41898fa26 Greentime Hu 2023-06-05  144  }
8ee0b41898fa26 Greentime Hu 2023-06-05  145  #else
8ee0b41898fa26 Greentime Hu 2023-06-05  146  #define save_v_state(task, regs) (0)
8ee0b41898fa26 Greentime Hu 2023-06-05  147  #define __restore_v_state(task, regs) (0)
8ee0b41898fa26 Greentime Hu 2023-06-05  148  #endif
8ee0b41898fa26 Greentime Hu 2023-06-05  149  

:::::: The code at line 136 was first introduced by commit
:::::: 8ee0b41898fa26f66e32237f179b6989c65600d6 riscv: signal: Add sigcontext save/restore for vector

:::::: TO: Greentime Hu <greentime.hu@sifive.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
