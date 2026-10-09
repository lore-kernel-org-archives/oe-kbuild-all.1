Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC88322E3F0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 02:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791511582; cv=none; b=rznQ7kSCwf8GsqseGhm0H1PdiJD8qLLDG43Vy8JnvUoI58Z6NoY/h3LOV0SAnpAloHjcVRCmzYG+8BR955PljluCpXKPWYAysAuwpR8FIe1EN3SrYoDBrK6DHiJjNRQS+CdBuuSR4Ivo9vBog7URLBDZbYteCIXey1+T8Hdc6TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791511582; c=relaxed/simple;
	bh=5+eooJjKUpe+24+JQuC2kUCIoZAtSu+cyUZWE/s8y80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ld72JXTBWojWczqVJFyeTNYgsXRTg8H6f/7v7sJ4IbQuvYy6HzKJnt5tCGCiuzHkF4xff8IoiGE63JSIc950e/mTWMmgI330ZqrvEFbn+N4dFcqMbwQTynEAsBCxWa4YyyqqXPZnQcqOvNVExE34ibyoxcwUvTOnvm8cCh5H1+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zphg3meC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zphg3meC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791511581; x=1823047581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5+eooJjKUpe+24+JQuC2kUCIoZAtSu+cyUZWE/s8y80=;
  b=Zphg3meC+h/PrGf6Y/78TdDbBXx+/q2hf6MVS03YHtPhFNdCJ4pPlvGD
   8QwAd8/aS2PEzS0xl82rOSRwE+qJc/zwLDiZfWk5eOgT/p6zYPQ6acPkL
   RbE/3e04pI+e1rRv2r232ju9uhqbyB1gquFGHqEsEG6Oxsq6b3vtWtPhx
   3tdybh1dQMrcZQ7vXLxJAaQGjQestLt33prWgL6nNEzpsLzt4KJXmVRJr
   Aanyp8f8y78AGZnFoDua4ikLZslqi6NgbX51WFBlWbY73CEcWOwxH9NMf
   W2Cg4YX7WrCK5F+wMtu85nWmvBF0VdKryuG6Ljn3VO4wyYXTaFnOkVtlJ
   A==;
X-CSE-ConnectionGUID: y9X19KzkT2u3dN3oOc0zxA==
X-CSE-MsgGUID: CUqQqhcoS7O3NH1hYPMiLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="402322"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="402322"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 19:06:17 -0700
X-CSE-ConnectionGUID: zYQG7rsbQXG4ajzBd2LAjA==
X-CSE-MsgGUID: 7+czI0gVQpG7q6md45ylZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="138364"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 08 Oct 2026 19:06:15 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEzzx-000000006Wf-0zPE;
	Fri, 09 Oct 2026 02:06:13 +0000
Date: Fri, 09 Oct 2026 04:05:46 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/rust-clockid 4/4] warning: unused
 variable: `id`
Message-ID: <202610090320.ClvknFi3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/rust-clockid
head:   8aaeb43a5dab7c2344e34233fdf81d453ff9137a
commit: 8aaeb43a5dab7c2344e34233fdf81d453ff9137a [4/4] aux0
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261009/202610090320.ClvknFi3-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610090320.ClvknFi3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610090320.ClvknFi3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused variable: `id`
   --> rust/kernel/time.rs:205:25
   |
   205 | unsafe fn ktime_get_aux(id: bindings::clockid_t) -> Option<bindings::ktime_t> {
   |                         ^^ help: if this is intentional, prefix it with an underscore: `_id`
   |
   = note: `#[warn(unused_variables)]` (part of `#[warn(unused)]`) on by default
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/time.rs:229:1
   |
   229 | unsafe impl<const N: bindings::clockid_t> FallibleClock for Aux<N> {
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#undocumented_unsafe_blocks
   = note: requested on the command line with `-W clippy::undocumented-unsafe-blocks`
--
>> warning: missing documentation for a struct
   --> rust/kernel/time.rs:223:1
   |
   223 | pub struct Aux<const N: bindings::clockid_t>;
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: requested on the command line with `-W missing-docs`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
