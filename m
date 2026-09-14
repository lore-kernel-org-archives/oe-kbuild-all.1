Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F167418DB1A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 09:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376945; cv=none; b=thhWJZYzZVCoKh5TXEVYVcDI8mB7AuV7E1nmvuRm16LbOc4w2knUskP461OU5iFR/vs9ufdvjP6Un1JsgQTPVMFUFhKnLn1BQvLmeBuEMppV/wVyKCBYwBNDrbxWjx01owRNsI7Wbz0cvJM95VS09AEmobkO5GA+R4G5kEKg6SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376945; c=relaxed/simple;
	bh=7K5PVATLsabQRhhBZXhEErR/D14fgI88SUwcddvdxdM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cW2A3Mf4ha6f4uPnweRoVTPWHgHYoAYCUH3J87X50jDoI4Cr33OJnzqrI6cjM7DsiIxw4SwCe1vPITL360d++TG/RWLYhZ/W4gZtYSq2uC9lG3W6piHFSvGG8uS46+Bo/kY+jGfctG+XZ+WAKn76xUhhAHdWd9Gqp4QnX+VZxe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWVc15m0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWVc15m0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789376943; x=1820912943;
  h=date:from:to:cc:subject:message-id;
  bh=7K5PVATLsabQRhhBZXhEErR/D14fgI88SUwcddvdxdM=;
  b=CWVc15m0kW3+1ZnYSmBlLdRTyzcO8JpsmDRtNhrSAiS27kkPqy7LXeEy
   9x1s1X7WX+vivgGqt3cQYhHhiWbnHE9wZsy+ripVNuX+hDQr+GpHIyqb7
   21gWFQNPjBN7mCAzHb/0ni0Sd12wWP4PvGuoBvFwyBLKY+gfi3WYwph71
   QBtUPm9/DXAWs+Cbc0mqea9nB0GFt7/u6P7+YC4cs8PTbIy0UllmlWwVu
   H/YOh+dXmecL8jovXhfyyaSnN5gBnXHR/B2oIteAWu1ypgjBeOLSVUhKB
   6A/YH10r/L71sU5dFMilKhWNzxLeXyytwt0Ww5GIk4V+6rKCsmHNzu4K5
   A==;
X-CSE-ConnectionGUID: dyj4uj66QdqjZZYQkT0gRA==
X-CSE-MsgGUID: sjhy+lCWSe+NFitk0CpODw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="88667295"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="88667295"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 02:08:59 -0700
X-CSE-ConnectionGUID: A5rFdM3iTQKJrxZnam9j1g==
X-CSE-MsgGUID: rofYqVmFTmGCDyrk2W7hNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="989743"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 14 Sep 2026 02:08:58 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x62gK-00000000085-1Opn;
	Mon, 14 Sep 2026 09:08:56 +0000
Date: Mon, 14 Sep 2026 11:08:31 +0200
From: kernel test robot <lkp@intel.com>
To: Amery Hung <ameryhung@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>
Subject: kernel/bpf/verifier.c:794:5-12: Unneeded variable:
 "ref_cnt". Return "0" on line 805
Message-ID: <202609141124.zR9pQCyK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
commit: 2eee6fe8ac2cd21e931c009d475e5a8407d42d76 bpf: Fix dynptr ref counting to scan all call frames
date:   3 months ago
config: hexagon-randconfig-r054-20260914 (https://download.01.org/0day-ci/archive/20260914/202609141124.zR9pQCyK-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 707c032dae3bee24eae29c6f4c459a6d6dc6556d)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2eee6fe8ac2c ("bpf: Fix dynptr ref counting to scan all call frames")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609141124.zR9pQCyK-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/verifier.c:794:5-12: Unneeded variable: "ref_cnt". Return "0" on line 805

vim +794 kernel/bpf/verifier.c

   788	
   789	static int dynptr_ref_cnt(struct bpf_verifier_env *env, int v_parent_id)
   790	{
   791		struct bpf_stack_state *stack;
   792		struct bpf_func_state *state;
   793		struct bpf_reg_state *reg;
 > 794		int ref_cnt = 0;
   795	
   796		bpf_for_each_reg_in_vstate_mask(env->cur_state, state, reg, stack, 1 << STACK_DYNPTR, ({
   797			if (!stack || stack->slot_type[0] != STACK_DYNPTR)
   798				continue;
   799			if (!stack->spilled_ptr.dynptr.first_slot)
   800				continue;
   801			if (stack->spilled_ptr.parent_id == v_parent_id)
   802				ref_cnt++;
   803		}));
   804	
 > 805		return ref_cnt;
   806	}
   807	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
