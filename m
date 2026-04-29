Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA92A3128D4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 03:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777435149; cv=none; b=rHvy7AS7kXYaifuwwarQhkAs+7PZu8H5RPEzOvxan4H+i5z10blX/pRzf84wCFGNtXX0WV0bU4ukXr89KXbdNak1XtKEa6LY0imuPAQ+EOuBpWCdPtQQ9ihVWnX7gvBQMkn8JPLYT5QMoKiNrbPpOzeBpIUTvFZO4XFtE95eFDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777435149; c=relaxed/simple;
	bh=CH2I7/sCfDJ9osCGLMuTpfLXKxn98dblxEs81X6AGbk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HRF8tapDBFgV09trvDHrk+fEWC1TxGU9ztyOgsqG2mPIediu7TnHQV6O5Td/CSCxvAHihABlDUbRNiyZsuiOV4xb0SBN3IZTP4mW2QKyHZ3QCJkUe6SJWxMENEIQuqhKy2wD1By5xrxSpqrKP3T5SJxuLlT9Hk5yGK6xtMaDr8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQFtbNYT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQFtbNYT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777435146; x=1808971146;
  h=date:from:to:cc:subject:message-id;
  bh=CH2I7/sCfDJ9osCGLMuTpfLXKxn98dblxEs81X6AGbk=;
  b=VQFtbNYTSQ3dVUqfyM+zCjuxWRaeou7GHGO6KB2ZKKwHBNmyBcBhLAQx
   2lUhbig4kdkEgIW6oqNIXncwC7YKS44iiQuCWQ/uo8DTMtuzlFeJQgOTa
   poLMD3wSSPoA5AOPn6x5q/svOrWvBJ+DiAzcvBE/PJhvUM6p3DWxAliFJ
   +DeJtnoY4gjfsQOEvrmB8OcyBqlgwQJYzd8rmhKYpxtnfQanPUK/L7PV1
   1eG4kJrjEcKv/jLwJJs2W8536U7IYYCtGq9gTtoWPe4Xh1lqGqmEIF87d
   u23WgmD+SfLnTB/CGbugVUvqPy57W1+KAnO7J0vL20+I23Djt8FYCJSrf
   A==;
X-CSE-ConnectionGUID: OJ/k3CzcSEG/28QtOi0clw==
X-CSE-MsgGUID: f+rtBFxbQ4Sfjpg/F2ovXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78249688"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="78249688"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 20:59:05 -0700
X-CSE-ConnectionGUID: Ji7mcAZXRneIyKtVMx/oLw==
X-CSE-MsgGUID: OVZw1pr9RAaKBZftr81s0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="229550899"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Apr 2026 20:59:03 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHw4j-00000000AaS-0fTa;
	Wed, 29 Apr 2026 03:59:01 +0000
Date: Wed, 29 Apr 2026 11:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-06 6/6]
 mm/pgsize_migration.c:338:24: warning: default initialization of an object of
 type 'struct vm_area_struct' with const member leaves the object
 uninitialized
Message-ID: <202604291123.JYOfjH9A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-06
head:   36e1a6db0a07f43a955c7d54d9d892161112bdf6
commit: 188c695beb6df4f4f85e647aedda9e76327686ac [6/6] ANDROID: 16K: Allocate pad vma on the stack
config: arm64-randconfig-004-20260429 (https://download.01.org/0day-ci/archive/20260429/202604291123.JYOfjH9A-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604291123.JYOfjH9A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604291123.JYOfjH9A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/pgsize_migration.c:338:24: warning: default initialization of an object of type 'struct vm_area_struct' with const member leaves the object uninitialized [-Wdefault-const-init-field-unsafe]
     338 |         struct vm_area_struct pad;
         |                               ^
   include/linux/mm_types.h:731:20: note: member 'vm_flags' declared 'const' here
     731 |                 const vm_flags_t vm_flags;
         |                                  ^
   1 warning generated.


vim +338 mm/pgsize_migration.c

   328	
   329	/*
   330	 * Calls the show_pad_vma_fn on the @pad VMA.
   331	 */
   332	void show_map_pad_vma(struct vm_area_struct *vma, struct seq_file *m,
   333			      void *func, bool smaps)
   334	{
   335		if (!is_pgsize_migration_enabled() || !(vma->vm_flags & VM_PAD_MASK))
   336			return;
   337	
 > 338		struct vm_area_struct pad;
   339	
   340		init_pad_vma(vma, &pad);
   341	
   342		/* The pad VMA should be anonymous. */
   343		BUG_ON(pad.vm_file);
   344	
   345		/* The pad VMA should be PROT_NONE. */
   346		BUG_ON(pad.vm_flags & (VM_READ|VM_WRITE|VM_EXEC));
   347	
   348		/* The pad VMA itself cannot have padding; infinite recursion */
   349		BUG_ON(pad.vm_flags & VM_PAD_MASK);
   350	
   351		if (smaps)
   352			((show_pad_smaps_fn)func)(m, &pad);
   353		else
   354			((show_pad_maps_fn)func)(m, &pad);
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
