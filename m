Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C6722097
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 12:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730464722; cv=none; b=cY2Tu5fzh7BEY1G62ucIoA7E2/a/cxzAdyfM94Wf7yRXoAunr4IbrAi9h5Cx9xrgq9zZsJraVEtUVW0W9YOAewRG/G8qaW3m1RjihcC8ZUh7Et5KaBo87iTpODlNI07hMqcnk6aZ9ehRryJXfBiBsq+XxF7vMzZ/m9WflWVmVaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730464722; c=relaxed/simple;
	bh=+rVmYqAZOeYMhyUCvCYgDaORU4GQZHYqKUZHLTySv98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ClhejV2Ye4ceipSm/ibQ1KH/D0Gs0b6sgKvqIg5HlJIQUr/nRhFRTirbkQMJljfr0Vb8Acc8806tPYavyTS64dkIc6SRqmM05bVB6WDijYdk4gn+IL19wtLPeCcv+uFRyMbC5gQv+dWSo46Ub4/7QRT10fqhOhUua7LImdBJkKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtYofKy+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtYofKy+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730464720; x=1762000720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+rVmYqAZOeYMhyUCvCYgDaORU4GQZHYqKUZHLTySv98=;
  b=VtYofKy+A8Ccd/+c/VT/zEDnx6R9SGnR99rpEjLUASwbqbba9OT+Jt/J
   qpDh5Yt6p1YC4nYWruR/eRI9nTMoso+gpvDG2lZULpprCau2A1O99LmH6
   PZ36pkEWWbtc539zWU6C5Kx0Qtw21oGNW5yWcZ5RiuXNwK01JNciieGej
   +ndQ0awjpWH2dKoACgaFKEcyHfWtCifS2haC9BgcEWbT5XSnYBvpoey9J
   LyS1vZtIXPFc4uCd7ANC8sNWILsgBQ2gfvcldOTD+OatULPm9qG1o0R1r
   Lqr+pkVQNqs1xldAMCa1A9dtrr3SQ9NChVbyacnZusRPOtO2eZEg5/UCn
   Q==;
X-CSE-ConnectionGUID: QmijW8QATN+0H9lNTjV0Uw==
X-CSE-MsgGUID: fJGaGMlBS1+eufwfZnxPhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33916858"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33916858"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 05:38:39 -0700
X-CSE-ConnectionGUID: S+QiExzwTPKXnbBSlMKMCg==
X-CSE-MsgGUID: KOoIgSfdT824CUKIaYYuMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83054571"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Nov 2024 05:38:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6qvD-000hXt-1u;
	Fri, 01 Nov 2024 12:38:35 +0000
Date: Fri, 1 Nov 2024 20:38:15 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 8780/8858] error[E0061]: this function takes 2
 arguments but 3 arguments were supplied
Message-ID: <202411012033.gzLpoqVf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c88416ba074a8913cf6d61b789dd834bbca6681c
commit: 648dc9064db5e8faef9cecb0c948d96801e31ea5 [8780/8858] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git
config: x86_64-randconfig-103-20241101 (https://download.01.org/0day-ci/archive/20241101/202411012033.gzLpoqVf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411012033.gzLpoqVf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411012033.gzLpoqVf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
   |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
   |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>> error[E0061]: this function takes 2 arguments but 3 arguments were supplied
   --> rust/kernel/security.rs:32:28
   |
   32    |         to_result(unsafe { bindings::security_secid_to_secctx(secid, &mut secdata, &mut seclen) })?;
   |                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                      ----------- unexpected argument of type `&mut u32`
   |
   note: expected `*mut lsm_context`, found `&mut *mut _`
   --> rust/kernel/security.rs:32:70
   |
   32    |         to_result(unsafe { bindings::security_secid_to_secctx(secid, &mut secdata, &mut seclen) })?;
   |                                                                      ^^^^^^^^^^^^
   = note:    expected raw pointer `*mut bindings::lsm_context`
   found mutable reference `&mut *mut _`
   note: function defined here
   --> rust/bindings/bindings_generated.rs:70041:12
   |
   70041 |     pub fn security_secid_to_secctx(secid: u32_, cp: *mut lsm_context) -> core::ffi::c_int;
   |            ^^^^^^^^^^^^^^^^^^^^^^^^
   help: consider removing the borrow
   |
   32    -         to_result(unsafe { bindings::security_secid_to_secctx(secid, &mut secdata, &mut seclen) })?;
   32    +         to_result(unsafe { bindings::security_secid_to_secctx(secid, secdata, &mut seclen) })?;
   |
   help: remove the extra argument
   |
   32    -         to_result(unsafe { bindings::security_secid_to_secctx(secid, &mut secdata, &mut seclen) })?;
   32    +         to_result(unsafe { bindings::security_secid_to_secctx(secid, /* *mut bindings::lsm_context */) })?;
   |
--
>> error[E0061]: this function takes 1 argument but 2 arguments were supplied
   --> rust/kernel/security.rs:72:18
   |
   72    |         unsafe { bindings::security_release_secctx(self.secdata, self.seclen as u32) };
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^               ------------------ unexpected argument of type `u32`
   |
   note: expected `*mut lsm_context`, found `*mut i8`
   --> rust/kernel/security.rs:72:52
   |
   72    |         unsafe { bindings::security_release_secctx(self.secdata, self.seclen as u32) };
   |                                                    ^^^^^^^^^^^^
   = note: expected raw pointer `*mut bindings::lsm_context`
   found raw pointer `*mut i8`
   note: function defined here
   --> rust/bindings/bindings_generated.rs:70057:12
   |
   70057 |     pub fn security_release_secctx(cp: *mut lsm_context);
   |            ^^^^^^^^^^^^^^^^^^^^^^^
   help: remove the extra argument
   |
   72    -         unsafe { bindings::security_release_secctx(self.secdata, self.seclen as u32) };
   72    +         unsafe { bindings::security_release_secctx(/* *mut bindings::lsm_context */) };
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
