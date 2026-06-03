Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19333E1220
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 20:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519818; cv=none; b=Sh/RVc+9YPOW4NpmJjCjvVz/onA3Fz4E+8bQlzcxsVuhtJh6/l0W6myYQVZkyf2xihZN931je8XRyVIIPKu/R5FgnHAlUzZsOhtBiBbwSS37Bk4HnTnsJPVDfnRY1kUJLDSnF7gxJ+vFfXWqtXRSjDIZ0abRT402289AfnK0MHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519818; c=relaxed/simple;
	bh=EILgGhelOtkMzor7QIFAX6Rkz0QSm7QOZhDPw3QImq8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ntXKEfodoTSTAs3NZ0uxJ+4Z+ZrMo7hiABA1xVUvJcV6x2Q9lpQTNAoLPimaQaFYAj49bTiW7A/HXh7CpB7kqvn6E3jGFfdKWsivN1Qo1ZS6vErwv28358NcDPeBzG7X74U7ctKOOkyLp+XyN4vX7iFGi8/ioUCRxPgFdNYJtmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJF4OdB3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJF4OdB3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780519814; x=1812055814;
  h=date:from:to:cc:subject:message-id;
  bh=EILgGhelOtkMzor7QIFAX6Rkz0QSm7QOZhDPw3QImq8=;
  b=QJF4OdB31fE4nGZPuZPnIiYRB1D7PZ0G+L2WyIykhXYGg6orQp8tzXHg
   T/Ss4fFrKtSwxtmFz21PtDlbDAYCFpIMHQAtD8TL7AUjmaaBwMh5PX4zZ
   6zGTbkLkuxRczQgMg9DHXcFjcl1RU9cVNdnOxL5x3xM3qBPTNmMyQ5XNX
   thetVMwANUR9XBQ3HrC1dpHGaKKfA2gpUC2ZBCTxr2MyRykoK2vOuVBjW
   Q4pWIX0l+R0Ho5AyVNT9HBkq670gfowHz2JxkOivke+sghzPPaEeEpLE0
   yfITnZkWaF38PbNcVAGEBziPObLR1ENvpvv2RPcxjT0NF6yjyF3QycT2F
   w==;
X-CSE-ConnectionGUID: 2pOVkcM6TWytlmESmmQptg==
X-CSE-MsgGUID: 9lP7SySQTjyYeWV6+pVyoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="92025294"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="92025294"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 13:50:13 -0700
X-CSE-ConnectionGUID: Jkf9zNBLT3GVu1mdSA1VuA==
X-CSE-MsgGUID: qltXt08xRzKe8mRzuRueow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="244193142"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Jun 2026 13:50:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUsXR-00000000Dt4-3Quw;
	Wed, 03 Jun 2026 20:50:09 +0000
Date: Thu, 04 Jun 2026 04:49:55 +0800
From: kernel test robot <lkp@intel.com>
To: Amery Hung <ameryhung@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Subject: [bpf-next:master 24/51] kernel/bpf/verifier.c:794:5-12:
 Unneeded variable: "ref_cnt". Return "0" on line 805
Message-ID: <202606040414.ERtSP8np-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   b93c55b4932dd7e32dca8cf34a3443cc87a02906
commit: 2eee6fe8ac2cd21e931c009d475e5a8407d42d76 [24/51] bpf: Fix dynptr ref counting to scan all call frames
config: sparc-randconfig-r061-20260603 (https://download.01.org/0day-ci/archive/20260604/202606040414.ERtSP8np-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606040414.ERtSP8np-lkp@intel.com/

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
