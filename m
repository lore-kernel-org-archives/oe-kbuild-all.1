Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3690326927
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 17:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765386880; cv=none; b=nUMrpLWIhR3cfBfZqF9Vq6CMoGfifPR7btdAQsHZHuBea9BhaHQGXg5y9/PhUCEiTWKHnpWgMHv7dJ+1FiKAJvYxJ2B6CUuBhPOGdK2BXUOJ7xEtFMlLgVraHYALWl7P2J0tdl+6pe5MpczqcFvRDC0GUE0S1dbrMFqqxwsQL7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765386880; c=relaxed/simple;
	bh=D3U5CkgwP+NASgmH9HF6SWOL9fOwR0TZPzmIVN7cySY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e6NQoLI+8aM8T2gRDxT3+sd7sScyco4z8FwSM90l0ZoR5n71ivZQ8S7Eo5iJ0HE/87PzweM0LOW9s+NE4KSNGU3N0hWC5yNXkasAgB21GZymUFPVQeMuXn/Rt+VfcMuer9vJsnVz2A/TSbc463JugWr5C48PHYIh/X0ABRbAqwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=StmRXznn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="StmRXznn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765386878; x=1796922878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D3U5CkgwP+NASgmH9HF6SWOL9fOwR0TZPzmIVN7cySY=;
  b=StmRXznnh9Yauy/Ac5tlO9evjaL0CXa6jgj4B5c+9IajWYaIBKmLlZZQ
   /WV/PifQozgOmavmGNjBU1WKwEyN2h0fCrQPmLMMqYJXLb4CkVcjuSUm5
   juAKNP69s+35jYc1Wa1qK84XRmNYXcbtRx0Sjvi/76txIcaWQd/jVofrA
   OiyUCt+uBtImP3ML8sRcD21ohr9H/w2+4/REnaiKQj7QaUoiiJDDMOedW
   RkfuobIsMcbV9EeyZJs1lfZ4Wevn0HJ5IWtU7PvVGrG1Hu+wkXRePly28
   YCAcNb27d6JNn5wiiXmXMoJWGWGxXl9xYGZ1YsYXJU9xVILF7Bj4l0Z8u
   w==;
X-CSE-ConnectionGUID: YrmBp13CR6ebRVd1F9sAXw==
X-CSE-MsgGUID: 3nYM52VnReeK6E01c7RMEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="92841230"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="92841230"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 09:14:38 -0800
X-CSE-ConnectionGUID: 0UQap2ALQmq07vXAx4YUpw==
X-CSE-MsgGUID: 4Zk/VM/DQL2XI5UMY3lCoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="201007934"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Dec 2025 09:14:37 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTNlq-000000003Ut-1tKJ;
	Wed, 10 Dec 2025 17:14:34 +0000
Date: Thu, 11 Dec 2025 01:14:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 14/16] ld: warning: orphan section
 `.relaalloc_tags' from `vmlinux.o' being placed in section `.rela.dyn'
Message-ID: <202512110147.1Hh0j0KJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   a8811acb11ba01eb88a548d40735773355424255
commit: 63c54cd510607db90ba546bbf91feac4118d0b1d [14/16] x86/kernel: Switch to PIE linking for the core kernel
config: x86_64-randconfig-015-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110147.1Hh0j0KJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110147.1Hh0j0KJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110147.1Hh0j0KJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ld: warning: orphan section `.relaalloc_tags' from `vmlinux.o' being placed in section `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
   ld: .tmp_vmlinux1: section `.rela.dyn' can't be allocated in segment 1
   LOAD: .data __bug_table .init.text .init.rela .init.relr .altinstr_aux .init.data .x86_cpu_dev.init .ibt_endbr_seal .altinstructions .altinstr_replacement .apicdrivers .exit.text .exit.data runtime_shift_d_hash_shift runtime_ptr_dentry_hashtable runtime_ptr___dentry_cache runtime_ptr_USER_PTR_MAX .bss .brk .init.scratch .modinfo .rela.dyn
>> ld: warning: orphan section `.relaalloc_tags' from `vmlinux.o' being placed in section `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
   ld: .tmp_vmlinux2: section `.rela.dyn' can't be allocated in segment 1
   LOAD: .data __bug_table .init.text .init.rela .init.relr .altinstr_aux .init.data .x86_cpu_dev.init .ibt_endbr_seal .altinstructions .altinstr_replacement .apicdrivers .exit.text .exit.data runtime_shift_d_hash_shift runtime_ptr_dentry_hashtable runtime_ptr___dentry_cache runtime_ptr_USER_PTR_MAX .bss .brk .init.scratch .modinfo .rela.dyn
>> ld: warning: orphan section `.relaalloc_tags' from `vmlinux.o' being placed in section `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
   ld: vmlinux.unstripped: section `.rela.dyn' can't be allocated in segment 1
   LOAD: .data __bug_table .init.text .init.rela .init.relr .altinstr_aux .init.data .x86_cpu_dev.init .ibt_endbr_seal .altinstructions .altinstr_replacement .apicdrivers .exit.text .exit.data runtime_shift_d_hash_shift runtime_ptr_dentry_hashtable runtime_ptr___dentry_cache runtime_ptr_USER_PTR_MAX .bss .brk .init.scratch .modinfo .rela.dyn

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
