Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FC42C08A1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 13:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001281; cv=none; b=TBvxFFlprOnfsQa3qJ+6j64M47O16nXFkwa0q1todpE+fi4qBas28FM2lljWA/emlRD2P8AaMJmX2X+m8r0BoTqaNP7aF/9hB96sv74oGLFGCMolFTDzUfdAmnbQ2P7GJeC6xOvuWt9Q4BIDl3GvLdwCoa/gyoxFg0dsbSuZ1Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001281; c=relaxed/simple;
	bh=zEbz4iARxnN3AITN01jIbDHLPjw/gPUxOESRdn/S5nw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uEEBSgiH7fER31FVmfOwtwaVsOhcjokObcmjm15GWmSBEG2321IzqF2Y9ofKe3vQHhYxWu30Vey/kGjSSxDMYqVpeUoRynC/Ldg43ZD1C0Spv0yZBhlJJhbvD5oz20foQW+ytdKk/0CoDxqA/x25VtKqpeUo0iLLdDIn5G1FipI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYdED1fM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYdED1fM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769001280; x=1800537280;
  h=date:from:to:cc:subject:message-id;
  bh=zEbz4iARxnN3AITN01jIbDHLPjw/gPUxOESRdn/S5nw=;
  b=kYdED1fM+PmP+u5S+2wbHqEJ4AxiIGzYXU8htmfM+gDX/xIPi0tPztP8
   rbFBqQCYzpf89egiSMThHlfoVH9y7gjjGNhsPhtz63/oA67Qy7vyXGtZI
   8JqTJ2Jb6M1rdVgsAePpd9iW8B4JxWBiBwMV56m0u+wpdvoJKdgvju0SF
   gu52klDOW9cNIoaAHvQLWhch186W6hiQHDGnZDt9tbAcm0nXbLQZG41WS
   7PyCLlx4lvRyByuK24DdWiHjQIDRBIiDggZ1e9QYQ0UJ24yAh8BuQrKHc
   KAoE8c9zFVa73mL9tanov4W6t5HKb75hSFj+puVQ7eIJBYvvNxjB9WsnU
   Q==;
X-CSE-ConnectionGUID: swoVYtzTS7iyvOMt4645hQ==
X-CSE-MsgGUID: 6tTMe6+qSQuMpYFxSd10DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69244741"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="69244741"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 05:14:39 -0800
X-CSE-ConnectionGUID: 93PVwFo4S0aAuF2yqvdEIA==
X-CSE-MsgGUID: S+8h6G3GRiOhWvWI864v1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206512640"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Jan 2026 05:14:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viY2d-00000000RFJ-1VVK;
	Wed, 21 Jan 2026 13:14:35 +0000
Date: Wed, 21 Jan 2026 21:14:25 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-rcu-alloc 9/9] error[E0046]: not all trait items
 implemented, missing: `RcuBorrowed`, `rcu_borrow`
Message-ID: <202601212150.WFKFcG0U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-rcu-alloc
head:   765caa59d7ab93d6a35488358da976c39e59cd73
commit: 765caa59d7ab93d6a35488358da976c39e59cd73 [9/9] rust: sync: arc: Implement DropRcu for Arc
config: x86_64-randconfig-r071-20260121 (https://download.01.org/0day-ci/archive/20260121/202601212150.WFKFcG0U-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601212150.WFKFcG0U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601212150.WFKFcG0U-lkp@intel.com/

All errors (new ones prefixed by >>):

   rust/core.o: warning: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   rust/core.o: warning: objtool: asan.module_dtor+0xd: call without frame pointer save/setup
   rust/build_error.o: warning: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   rust/build_error.o: warning: objtool: asan.module_dtor+0xd: call without frame pointer save/setup
>> error[E0046]: not all trait items implemented, missing: `RcuBorrowed`, `rcu_borrow`
   --> rust/kernel/sync/arc.rs:516:1
   |
   516 | impl<T: HasField<T, RcuHead> + Send + Sync + 'static> DropRcu for Arc<T> {
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `RcuBorrowed`, `rcu_borrow` in implementation
   |
   ::: rust/kernel/sync/rcu.rs:146:5
   |
   146 |     type RcuBorrowed<'a>;
   |     -------------------- `RcuBorrowed` from trait
   ...
   160 |     unsafe fn rcu_borrow<'a>(ptr: *mut c_void) -> Self::RcuBorrowed<'a>;
   |     -------------------------------------------------------------------- `rcu_borrow` from trait

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
