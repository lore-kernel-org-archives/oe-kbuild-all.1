Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B64F14900E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 04:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730175765; cv=none; b=Ne17LqoLnMJTRqeC2NP7/DTrKQxUc+nWzCwWmBbFx1F87gMVTTo0pK+W5s6HmRBeRLRSrfCuzITVfFeQmDFZnytlRw96Yyd6+XeEt8gsM4s9rw2hiHDBhMvJa3hHmivSvjCT8rOawwJ3sZ2L1k90PmSyyT4prsY1llBJTJsX3tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730175765; c=relaxed/simple;
	bh=j1CLOA9NkpmFEOzVGWHg2QqsOkrgxxP8vNf5oR1cZwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O2t1C5GdBaKqG3V0djrb2GmMZmySbmJA5FO2af6sIhmKRxu1xVm0ZMVPX9S/hANvpFo+FmMhe0KQVZjdNrn1TQI/hBBEzxKVJ3+QPikXYvGUeq/XmIjouW20TYISZrLKcAnE9kN24HPvXGTfraTiPXwy5c37H+SDVKd630wLm7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h8/xWMan; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h8/xWMan"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730175762; x=1761711762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j1CLOA9NkpmFEOzVGWHg2QqsOkrgxxP8vNf5oR1cZwM=;
  b=h8/xWMansLihdcwD/GKYamm93d59QwzJVLtHgUpSPODmpbBUiQteCsEM
   w6bTLy3F4GKuSLzhjBWFmrLDxSeZnd97ODGpwcoOYapZW2PJiqxnEKFOY
   JxSjofCDJaqqrVzPtcsQXsIG7GTHFkKVSFhun1Fxkf3sGUT/SmAMrlqbA
   kvSW8bg3gK+dKVNceXiABg+0EVTC1A7HXXhGe+JdtB79B2Q1fN8W4jLVw
   Asqq6vhEfvPRng6qAlWxkRGm8SRugdZs8eKPOvocdkGxKiqFSjPzN6n3E
   QAaBR+Vvr7lZM/hyFDBJx3UaRF2VFTDeDJgXoW/QRhIwp/Jb8mcYB/+TK
   A==;
X-CSE-ConnectionGUID: fSUdWg27SMWTNrZtwUGQlw==
X-CSE-MsgGUID: 0bmeELPuQIeFrQWbCBdrcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="30010079"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="30010079"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 21:22:41 -0700
X-CSE-ConnectionGUID: 5NaWhoi9TZyDGysYZywEsg==
X-CSE-MsgGUID: m4QT34e0SXuUlSAiEUfPWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="105171715"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Oct 2024 21:22:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5dkc-000dEg-2C;
	Tue, 29 Oct 2024 04:22:38 +0000
Date: Tue, 29 Oct 2024 12:22:05 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun.feng@gmail.com>
Subject: [boqun:lockdep-for-tip 5/5] error[E0599]: no method named `try_lock`
 found for struct `Lock` in the current scope
Message-ID: <202410291211.4JnU6G41-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git lockdep-for-tip
head:   0070c072c1b278f99047ab720e93406ad1359e73
commit: 0070c072c1b278f99047ab720e93406ad1359e73 [5/5] rust: sync: Add global lock support
config: x86_64-randconfig-101-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291211.4JnU6G41-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291211.4JnU6G41-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291211.4JnU6G41-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
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
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
   |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   rust/core.o: warning: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   rust/core.o: warning: objtool: asan.module_dtor+0xd: call without frame pointer save/setup
   rust/compiler_builtins.o: warning: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   rust/compiler_builtins.o: warning: objtool: asan.module_dtor+0xd: call without frame pointer save/setup
   rust/alloc.o: warning: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   rust/alloc.o: warning: objtool: asan.module_dtor+0xd: call without frame pointer save/setup
>> error[E0599]: no method named `try_lock` found for struct `Lock` in the current scope
   --> rust/kernel/sync/lock/global.rs:90:31
   |
   90  |               inner: self.inner.try_lock()?,
   |                                 ^^^^^^^^
   |
   ::: rust/kernel/init/macros.rs:822:9
   |
   822 | /         $vis struct $name <$($decl_generics)*>
   823 | |         where $($whr)*
   824 | |         {
   825 | |             $($fields)*
   826 | |         }
   | |_________- method `try_lock` not found for this struct
   |
   help: there is a method `lock` with a similar name
   |
   90  |             inner: self.inner.lock()?,
   |                               ~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
