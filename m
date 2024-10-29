Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87203219E0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 04:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730176364; cv=none; b=O/Os8O40Np29ackPqdQUW917ssxzxYEuiUT+P8pYmio5LW0A87Ts+VnTsOEP/206DknDhf2/9e4CgxWbBiDFwIdG1/yoULACqR8IKq5UZEeBBm9cdShrWylBO90Uv4G0k9tlG4Ij008NVnPbbUd3dqimGL9r5njtcrGz8hddrDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730176364; c=relaxed/simple;
	bh=bYV8sP4Y8Ap6HkQP560i/iME9Eqx3QN+SujNGA1+/aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eVabj3mg08PxGiBsEKX8R6pzN0locT2LI20ct/ehWAWXYjr8UuerDEQTfRE6fmjPORw5lYdZF9YVp/aQ95WYj8dHSfejXHuChgSXp2hNf1a3LK/Qm4cI7SwjaiE1BpDoCJr082LMG07GSdRK8OL6lWLRHYEpWHDwOd3G6KL795U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aqr8xO0Z; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aqr8xO0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730176362; x=1761712362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bYV8sP4Y8Ap6HkQP560i/iME9Eqx3QN+SujNGA1+/aQ=;
  b=Aqr8xO0ZspJXUd3RcZFCn3v+BOmqTCP62gTgC1Ln6voNT3g8hcGfLbaE
   ameFwW5/OncKvKbwBGT+Z5R/ArLl5SO2OGPQgcYxsqdDoe2dyScQvmM32
   2IOWbslaiK+cMBhx7FqLIWVCuRFRqu2JSiagDXoOdfC9ZgSrrU/IftuzP
   I8d4lRe05Z/uvLmZzPYZDYZadDWqOwC/MA2M3w0pXhrR26VJA1pyyTeQd
   eUDW2tsCGBevqslyy5yze5djYjFyt8TcfQSNeUvF9mJjb0xbvjpvnmmwH
   /eE9BMgYVVGTnWCxLPC/IEo2SeI8Q36QYlgN8pgrLnvzSC1pQ7J71TPUr
   A==;
X-CSE-ConnectionGUID: OkisjV1xRKaq8wKgPGWjSQ==
X-CSE-MsgGUID: I4vtjy9HQp+BFS7QR4oPbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29906148"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="29906148"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 21:32:42 -0700
X-CSE-ConnectionGUID: HpUqefYqQwSSHnc5WLKJNA==
X-CSE-MsgGUID: NH7mpeb+QwCnbj3+NeHkSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="85787660"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Oct 2024 21:32:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5duJ-000dFQ-0U;
	Tue, 29 Oct 2024 04:32:39 +0000
Date: Tue, 29 Oct 2024 12:32:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_5 21/26]
 kernel/events/uprobes.c:680:16: sparse: sparse: incorrect type in return
 expression (different base types)
Message-ID: <202410291216.3265q3ob-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_5
head:   748f02be1adc50c8aea1e580791e8085f8713c07
commit: 0ec2293dc6f5526b57f0f431643dbfbbddc5cd51 [21/26] uprobes: Add mapping for optimized uprobe trampolines
config: x86_64-randconfig-122-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291216.3265q3ob-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291216.3265q3ob-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291216.3265q3ob-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/events/uprobes.c:680:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted vm_fault_t @@     got int @@
   kernel/events/uprobes.c:680:16: sparse:     expected restricted vm_fault_t
   kernel/events/uprobes.c:680:16: sparse:     got int
   kernel/events/uprobes.c:2215:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/events/uprobes.c:2215:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/events/uprobes.c:2215:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/events/uprobes.c:2217:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/events/uprobes.c:2217:35: sparse:     expected struct spinlock [usertype] *lock
   kernel/events/uprobes.c:2217:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/events/uprobes.c:2596:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/events/uprobes.c:2596:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/events/uprobes.c:2596:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/events/uprobes.c:2598:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/events/uprobes.c:2598:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/events/uprobes.c:2598:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/events/uprobes.c: note: in included file:
   include/linux/rmap.h:703:28: sparse: sparse: context imbalance in '__replace_page' - unexpected unlock
   kernel/events/uprobes.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/events/uprobes.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *

vim +680 kernel/events/uprobes.c

   665	
   666	static vm_fault_t tramp_fault(const struct vm_special_mapping *sm,
   667				      struct vm_area_struct *vma, struct vm_fault *vmf)
   668	{
   669		struct hlist_head *head = &vma->vm_mm->uprobes_state.tramp_head;
   670		struct tramp_area *area;
   671	
   672		hlist_for_each_entry(area, head, node) {
   673			if (vma->vm_start == area->vaddr) {
   674				vmf->page = area->page;
   675				get_page(vmf->page);
   676				return 0;
   677			}
   678		}
   679	
 > 680		return -EINVAL;
   681	}
   682	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
