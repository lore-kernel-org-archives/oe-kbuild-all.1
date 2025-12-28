Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D4C3A1E94
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Dec 2025 06:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766902855; cv=none; b=b14fS1zRXKLG2MaJCDyteFGSgNwHDYzRqBbaIwviqtn+ZM0h1xI+6meCGZSMSrCxF84N9/FhXJbYtNxC+IaN3P1Y6aGFbphp37xAMkkd/C+O7fy5kR9NWf3LMv0szakf9hZxQdj9aPFpuRWsalWyvPld2XE6ig0V0SAl42v7zVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766902855; c=relaxed/simple;
	bh=mhx54cVwSIV6UJ9/pHqI6HnK/N2hlCCaQMt2jWsUM3A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V2Qmo5yZdYB4cNwAxUyXHrSltg/NakY7IXa+cVrJ9sRlCHc6zJN9cbt9+vO1qrUxGuqPCJaq9pUGzWQNMBa7O7f63IzU47zFfReGnVUQAee+rzmmJ8KFAE5ZzYnOdfaOXtglpLGRGziO1aZtZTX97rAO5Sk7JjPQSLK1VIAwbGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fI4VN3Ld; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fI4VN3Ld"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766902853; x=1798438853;
  h=date:from:to:cc:subject:message-id;
  bh=mhx54cVwSIV6UJ9/pHqI6HnK/N2hlCCaQMt2jWsUM3A=;
  b=fI4VN3Ldqn0bbvuSsQlCf4159mCmT1gQaOdAH/YuPIEDzGvopbhPSxaZ
   ksWJwNuzQZ5e8eWvKmmPs6nnAqKVzehmtLppvyzOFOsrgX+kGy53e5KsH
   b8FwodUazrWWew0v9xnQO1z/jRwMZ3g5FwlR1GTxov+1zcsVCNXU72mxe
   Mzq6azdoDkSwj72Lguwl2QvGXm9BttDkCQE+H1qJxmpHNseAtOGQTrC0s
   RRwa2ftSllSrcbMgpttMLeRFXTbhnQCuaJYAMmtHPphqNTyxUZHyxvwtL
   /pUV3zUPd73WGJmpZa+jP5uoEXcJm4ZXDJPEvgAYiGrHLje24nXo7cwmE
   g==;
X-CSE-ConnectionGUID: LDrM0AFfRhW0Y6mtQlLQrA==
X-CSE-MsgGUID: uOf+yLBXQdKXHUdWuyYyFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="79288940"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="79288940"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 22:20:52 -0800
X-CSE-ConnectionGUID: wlEl/FzWTN6FQBhlEqMZMw==
X-CSE-MsgGUID: hOOPYTQyTWa9cBdyw0PCBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="201137459"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 Dec 2025 22:20:51 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZk93-000000006IH-1HJK;
	Sun, 28 Dec 2025 06:20:49 +0000
Date: Sun, 28 Dec 2025 14:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 15/29] ld: warning: orphan section
 `.relaalloc_tags' from `init/main.o' being placed in section `.rela.dyn'
Message-ID: <202512281406.tYX7K8Wl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   b6f238d2e8720acf63467aa0d48d7fc4e31c07c2
commit: 5a6587a00922840e8a257f0deacb00893aa15582 [15/29] x86/kernel: Switch to PIE linking for the core kernel
config: x86_64-buildonly-randconfig-002-20251228 (https://download.01.org/0day-ci/archive/20251228/202512281406.tYX7K8Wl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512281406.tYX7K8Wl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512281406.tYX7K8Wl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ld: warning: orphan section `.relaalloc_tags' from `init/main.o' being placed in section `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: .tmp_vmlinux1: section `.rela.dyn' can't be allocated in segment 1
   LOAD: .data __bug_table .orc_header .orc_unwind_ip .orc_unwind .orc_lookup .init.text .dynamic .dynstr .dynsym .gnu.hash .init.rela .init.relr .altinstr_aux .init.data .x86_cpu_dev.init .retpoline_sites .altinstructions .altinstr_replacement .apicdrivers .exit.text runtime_shift_d_hash_shift runtime_ptr_dentry_hashtable runtime_ptr___dentry_cache runtime_ptr_USER_PTR_MAX .data_nosave .bss .brk .modinfo .rela.dyn
>> ld: warning: orphan section `.relaalloc_tags' from `init/main.o' being placed in section `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: .tmp_vmlinux2: section `.rela.dyn' can't be allocated in segment 1
   LOAD: .data __bug_table .orc_header .orc_unwind_ip .orc_unwind .orc_lookup .init.text .dynamic .dynstr .dynsym .gnu.hash .init.rela .init.relr .altinstr_aux .init.data .x86_cpu_dev.init .retpoline_sites .altinstructions .altinstr_replacement .apicdrivers .exit.text runtime_shift_d_hash_shift runtime_ptr_dentry_hashtable runtime_ptr___dentry_cache runtime_ptr_USER_PTR_MAX .data_nosave .bss .brk .modinfo .rela.dyn
>> ld: warning: orphan section `.relaalloc_tags' from `init/main.o' being placed in section `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: vmlinux.unstripped: section `.rela.dyn' can't be allocated in segment 1
   LOAD: .data __bug_table .orc_header .orc_unwind_ip .orc_unwind .orc_lookup .init.text .dynamic .dynstr .dynsym .gnu.hash .init.rela .init.relr .altinstr_aux .init.data .x86_cpu_dev.init .retpoline_sites .altinstructions .altinstr_replacement .apicdrivers .exit.text runtime_shift_d_hash_shift runtime_ptr_dentry_hashtable runtime_ptr___dentry_cache runtime_ptr_USER_PTR_MAX .data_nosave .bss .brk .modinfo .rela.dyn

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
