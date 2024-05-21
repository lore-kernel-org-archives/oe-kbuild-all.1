Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B092B9A3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 04:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716265754; cv=none; b=dS307CI+oo2ExHP6X48sZCED6/b12Fxf8+9l1AEke4IRPgnPQdV1qEWzHkC5FGcyuWBnbB7Ntr9W7PikABGmdscftGibXJQNBPIoqxCbzcBBbkyZEENm+d++6IESn8UwB4tiZjQSwHc/umPa8YYSRRz/3del+6jQaZdnA3cNMnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716265754; c=relaxed/simple;
	bh=Uu451mq5kbga1XMAmhC6jhUJttHt9LaEuC3/IqUJZ9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lzVcTZN+mV81bZUjX0WV6dCLlNYr9FY/5NmVvJfEzXv8CRVfLzNzKN8W1fTFo5EumWPhuniLSw2tY18uKzhetgdI0p1RdGpDrx4KkO8bf6VYLDIgUZrWbEPKc/pv3GbgsXt+BgmEDcFm48f2cpSgqTa18eCLjz5QLw00yMNxD9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LrpVrXa0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LrpVrXa0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716265752; x=1747801752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uu451mq5kbga1XMAmhC6jhUJttHt9LaEuC3/IqUJZ9A=;
  b=LrpVrXa0NpWs/i+GHcR9a00orv5aw4rLjpY8gb9Z0iX4jqWcT76dOJVA
   TDGFNBw0L//HrdsGEeGtuzInr59hylcvhXH2ElqZbonYOLrg5Jk6yMkcL
   LzAkWpszx/tUhjEMP0FAzj9O7Plz2Wsj48QKVwCBOlhhLk4Vo62QMxkAT
   vmmT8JdampOYkiXFzIizrYfaIdEt/3Jd+s/BO91h2SpkiQft+F507JGDd
   J8+BRh26lWVQVGg91RrN79AdEnXeYlEc3HX1oV21n7TQWGnwxjYvUldQ+
   BAyrGASMFj/kByp1NQnE52xJd5nlF9Yb8uwX9nrFABpG7RjjRnBLMurnO
   A==;
X-CSE-ConnectionGUID: uH3089AnQJ+b1rqsUqBgHQ==
X-CSE-MsgGUID: SjAJn5rjSfm3cxrzLrM8Og==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12543453"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="12543453"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 21:29:12 -0700
X-CSE-ConnectionGUID: EFqC37PXTo66Y6x+VdeSoA==
X-CSE-MsgGUID: +m78LHY3R0KfsZG8fR8KFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="33369707"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 20 May 2024 21:29:11 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9H7c-0005hk-2V;
	Tue, 21 May 2024 04:29:08 +0000
Date: Tue, 21 May 2024 12:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:DONTTEST-pcp-locking-bench 1/4] WARNING: modpost: EXPORT
 symbol "this_cpu_cmpxchg16b_emu" [vmlinux] version generation failed, symbol
 will not be versioned.
Message-ID: <202405211258.YJi7QAIS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git DONTTEST-pcp-locking-bench
head:   95b2f070fc4eb7b92d528f64395c5306dc993c50
commit: aefcca2d0875add24036512e1f45bb9da89989c0 [1/4] slub_kunit: hack in a stupid locking/atomics microbenchmark
config: x86_64-randconfig-101-20240521 (https://download.01.org/0day-ci/archive/20240521/202405211258.YJi7QAIS-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405211258.YJi7QAIS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405211258.YJi7QAIS-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/locktorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcutorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcuscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/refscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/torture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/dmapool_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_arc4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_md4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/acpi/platform_profile.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/siemens/simatic-ipc-batt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/firmware_attributes_class.o
>> WARNING: modpost: EXPORT symbol "this_cpu_cmpxchg16b_emu" [vmlinux] version generation failed, symbol will not be versioned.
Is "this_cpu_cmpxchg16b_emu" prototyped in <asm/asm-prototypes.h>?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
