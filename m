Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8363937F331
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 05:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791263377; cv=none; b=tppjM+Tckio9lCIeYYcQBHG3DlsOkuJW+R6Fkcauwb2eGOtxkQqat9zVP1kVKpw4Is4NNASZos+Eq+DS6nM4iZw/OiiXCXaTjOeRqB+LaeRdZfBj+oYKrQgoUEnkqtPbdJCtT1UWhl4n4vfO1jVMH0ON1V9IZZ+PBmWecjDJy0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791263377; c=relaxed/simple;
	bh=0k6BQQ8yLd27yNTqetg4Tc5kWoU/mJPSxpQo8pBi4BM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Alx9NaiHL9elcD6g2BlxSOuDtJOc1jPIWVvCQ7PFSykqLebLNgjjAzAIKE9mxkdE/g3kHCcqR0uNaiV7Gg8haD3M2cyg08ToYjiHNBQ3sFGG6t1tR0Qe2/SBFdPZOxjMJrKHIgAX07BgcK9xoXmihY1Ga3lZt2iWIVK7VMtOisQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HBrJs4v1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HBrJs4v1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791263373; x=1822799373;
  h=date:from:to:cc:subject:message-id;
  bh=0k6BQQ8yLd27yNTqetg4Tc5kWoU/mJPSxpQo8pBi4BM=;
  b=HBrJs4v1n10ukyCb5YgB03+Mv4CxFdZbifhHTAi+ywMFlzRV23Ita6FS
   OtFWc8aKYHprttY2iwQFV8bZIM0KnQaAxX6xrYhSBJgSj0yQzcwTQaIML
   jgP3XtxQlF4ySWMHV4M0Htmm1A1mrbMG9dbQ8V5lw6yj7kQcRAjj2++tC
   b07hMTu1lkjZjKKZ6Q3Mh8/OvrY149SvZbJ4A4OrfX++OXpesqcJvVK0k
   mZjkJfXUEFW9Ngc7SpuGyJqqYasv/1rkOYHZnKTx/F/OyUbt7Y6NbaJ3b
   7FkRQnKKsN7O0bqUKnjKjZ3xlJZBOm2NfDfmROKJ9T3fcXzUG+58IzyML
   w==;
X-CSE-ConnectionGUID: EpefMcW8QA++v743GmYjUQ==
X-CSE-MsgGUID: ryqzyZSYSnWD8ZuewbRkCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94652417"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="94652417"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 22:09:31 -0700
X-CSE-ConnectionGUID: h5OlgEKsRzKWPIvU9IyDfQ==
X-CSE-MsgGUID: G5KpHtJtTNSuslLYFAnMhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="1148990"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 05 Oct 2026 22:09:29 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDxQd-000000000kw-34Qq;
	Tue, 06 Oct 2026 05:09:27 +0000
Date: Tue, 06 Oct 2026 07:09:06 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:xdp-tcp 27/42] include/net/xdp.h:703:30: error:
 use of undeclared identifier 'bpf_xdp_consume_enabled_key'
Message-ID: <202610060644.Wt2o5Dpa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux xdp-tcp
head:   63925314fb03ace1f3949a09d298cfdc0188bc8a
commit: 79cfafda75fd6890e5c21a07a2c3d90f21cbe85e [27/42] xdp: Add XDP_CONSUME for frames a program takes ownership of
config: x86_64-randconfig-2200-20261006 (https://download.01.org/0day-ci/archive/20261006/202610060644.Wt2o5Dpa-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610060644.Wt2o5Dpa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610060644.Wt2o5Dpa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/wait.c:15:
   In file included from io_uring/napi.h:8:
   In file included from include/net/busy_poll.h:19:
>> include/net/xdp.h:703:30: error: use of undeclared identifier 'bpf_xdp_consume_enabled_key'
     703 |         if (static_branch_unlikely(&bpf_xdp_consume_enabled_key) || unlikely(act == XDP_CONSUME))
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/net/xdp.h:703:30: error: use of undeclared identifier 'bpf_xdp_consume_enabled_key'
     703 |         if (static_branch_unlikely(&bpf_xdp_consume_enabled_key) || unlikely(act == XDP_CONSUME))
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/net/xdp.h:703:30: error: use of undeclared identifier 'bpf_xdp_consume_enabled_key'
     703 |         if (static_branch_unlikely(&bpf_xdp_consume_enabled_key) || unlikely(act == XDP_CONSUME))
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/net/xdp.h:703:30: error: use of undeclared identifier 'bpf_xdp_consume_enabled_key'
     703 |         if (static_branch_unlikely(&bpf_xdp_consume_enabled_key) || unlikely(act == XDP_CONSUME))
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.
--
>> kernel/bpf/core.c:3098:22: error: use of undeclared identifier 'bpf_xdp_consume_enabled_key'
    3098 |                 static_branch_dec(&bpf_xdp_consume_enabled_key);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/bpf_xdp_consume_enabled_key +703 include/net/xdp.h

   693	
   694	static __always_inline u32 bpf_prog_run_xdp(const struct bpf_prog *prog,
   695						    struct xdp_buff *xdp)
   696	{
   697		/* Driver XDP hooks are invoked within a single NAPI poll cycle and thus
   698		 * under local_bh_disable(), which provides the needed RCU protection
   699		 * for accessing map entries.
   700		 */
   701		u32 act = __bpf_prog_run(prog, xdp, BPF_DISPATCHER_FUNC(xdp));
   702	
 > 703		if (static_branch_unlikely(&bpf_xdp_consume_enabled_key) || unlikely(act == XDP_CONSUME))

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
