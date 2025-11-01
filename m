Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742151FC0ED
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 05:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761973661; cv=none; b=PYTkH8iXdftaIqaK66/TQ/5xhMUJDcs66K8iPagcjIhJcqXvdCuLc8+k8ZcavlE6CVIh0W0twoaEoe+5B/SBpwkJv6XIB2pud4RmwAOuzQtKKIeHPYxwWO7FcTf9SKP11xUtUuJKMv+/IrDeikPG7fkNrVH6AEqQq9+he8Xi10Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761973661; c=relaxed/simple;
	bh=1wUMtz01qRv29YrECpfulhDWTFKF33wAda0gvtIAM/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bNlUKdYu4VFnsEmalOJlEuNJ0M5e/jg+KzAciUQ2uHyr6M3HoD66INBGtKYnuyrRQFW9bb3SUi3YjtFlSWHJs2NF+geRvD9G3NkFfvY5JtD03WIltuumYzRiHgASb4ZNeuPHGi2Xc7Ma66+g24Kux2PpHSxVrX0QwYjrLXT0Icw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Or4yH/LF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Or4yH/LF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761973660; x=1793509660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1wUMtz01qRv29YrECpfulhDWTFKF33wAda0gvtIAM/s=;
  b=Or4yH/LFeHcVBGnu+qRz1lFr26tdd7zJEv/9WBrprgZSRkk/5GOAJLPb
   WqfTLoL3pU3w58hOXVJirT2trpmW0pAzhwRwZ+arlN09QN44gKpg41TBA
   yICaDbjWuHiHBanpb1o/fO+qoOJwm+vhiLJsjJvYJ/6Nb3Rs9CVOvzto0
   8P76GQafO593ruEcgmy2BRDDVT5sd/d1+neh/3A/0Gas2ADXBEqjSEHkM
   YhlSj7R6bYUyIoNcXw3MNvZAeCpidqDMbrqCywaW8BfK24HWqnz6uj8lp
   gJ6LHIzN1r8bJZGaZAV1OaIJL3if/8vYonrbKL5ZxAmT0Q7sw/vezdOGG
   Q==;
X-CSE-ConnectionGUID: QR01derMQHGC7J+ERlSYPQ==
X-CSE-MsgGUID: 2hqiJpfPTOONTyHNtF5FxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75249952"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="75249952"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 22:07:39 -0700
X-CSE-ConnectionGUID: Qm8FH5i+QK2EWviCF65RjA==
X-CSE-MsgGUID: dWa+6O1BTEW2cEEA1QOxQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="209955475"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 31 Oct 2025 22:07:37 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF3pq-000Nvg-0G;
	Sat, 01 Nov 2025 05:07:31 +0000
Date: Sat, 1 Nov 2025 13:06:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-06 1/1]
 mm/pgsize_migration.c:338:24: warning: default initialization of an object
 of type 'struct vm_area_struct' with const member leaves the object
 uninitialized
Message-ID: <202511011213.rpwoJAT1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-06
head:   188c695beb6df4f4f85e647aedda9e76327686ac
commit: 188c695beb6df4f4f85e647aedda9e76327686ac [1/1] ANDROID: 16K: Allocate pad vma on the stack
config: arm64-randconfig-002-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011213.rpwoJAT1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cc271437553452ede002d871d32abc02084341a8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011213.rpwoJAT1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011213.rpwoJAT1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:369:9: note: previous definition is here
     369 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> mm/pgsize_migration.c:338:24: warning: default initialization of an object of type 'struct vm_area_struct' with const member leaves the object uninitialized [-Wdefault-const-init-field-unsafe]
     338 |         struct vm_area_struct pad;
         |                               ^
   include/linux/mm_types.h:731:20: note: member 'vm_flags' declared 'const' here
     731 |                 const vm_flags_t vm_flags;
         |                                  ^
   2 warnings generated.


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
