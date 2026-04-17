Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D8A296BD2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 07:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776410452; cv=none; b=DE7ALPYYxxAv29HusyKIra4QxaIF++xCozwyV9jcsvvDKFqbDeJj5QKDDG33jVbGo0GjIRbHlp3MxorUnHw2fwLJjIegB+7YJ/YyRglkg6GR5QYoYaJIS4ofsumanQ0X45h7Ea/k9cKcMAht6rSgZRcVFHkjUxUJaVslFVabeAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776410452; c=relaxed/simple;
	bh=HnSh9SGcV66o6XAlMMruzX2MPwT63bvlGM7M7H8wAIg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P52YxLXuPq9S1eDkbNPv7+NZkXHzBqT0IjLz1zcn+gqsnS0iy3eOqWoFI8tuWK+wD8ByIxmcI5p2OVm5mIR9eIvZeD3cqWZeoqGpzIjxivmZ5G/TZni3f95ZgD8vJFGn2sbj74PzevdFWcffA7UBzMMrBdBbH8FwnlrVkDj7k2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QjLMUQnl; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QjLMUQnl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776410451; x=1807946451;
  h=date:from:to:cc:subject:message-id;
  bh=HnSh9SGcV66o6XAlMMruzX2MPwT63bvlGM7M7H8wAIg=;
  b=QjLMUQnlr9ZVfKkIXUk+60PR40juzA9ClngXTr2nseBQC85E22pzC8N7
   I8NJ+LuI5UKrA5bWS4ALAuJU06M6eqtfVtNf6PWUKRVnB6c784NA0fU/6
   83RzWD82Qrw9xJ6QHS9szwnmBibZcXg+eYR1dzco11H695YheLw80s1TM
   q7x4RQn1vlXwo5Qqky1Ii3/9hs1gZ1i04t6Ip8gx314JcPp2siRIlIVJU
   4ckY/zeMMm+rCrFzg97LHU2waHgU2KueH5Jlis8NyTDkGU7HsK6hUGSI1
   p51oYRNh7TK/Au6gtmQmx1VLEHkRa27KtwumSQ8boN1+eoDrCneSUEj4R
   w==;
X-CSE-ConnectionGUID: IIPVLLYZQmGyJe8R0STAnA==
X-CSE-MsgGUID: l84M4YHzT5WKgYdM2zv4eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81020699"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="81020699"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 00:20:50 -0700
X-CSE-ConnectionGUID: w+aDemP0Rkmzh8vmog+HSg==
X-CSE-MsgGUID: vj1TvINMRLCLVmXCQy125Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="268983338"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 17 Apr 2026 00:20:49 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDdVO-000000001GH-3yfN;
	Fri, 17 Apr 2026 07:20:46 +0000
Date: Fri, 17 Apr 2026 09:19:56 +0200
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 34/69] warning: length comparison
 to zero
Message-ID: <202604170958.8AwfIZnj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Asahi,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   234b16b06a9869c5885af57b2853412e854c1216
commit: 92fe4dbd22e7faafad04ddf06d732e336ea7be98 [34/69] Rust: io: Add memcpy_fromio wrapper
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260417/202604170958.8AwfIZnj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604170958.8AwfIZnj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604170958.8AwfIZnj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: length comparison to zero
   --> rust/kernel/io.rs:283:12
   |
   283 |         if buffer.len() == 0 || !Self::length_valid(offset, buffer.len(), self.maxsize()) {
   |            ^^^^^^^^^^^^^^^^^ help: using `is_empty` is clearer and more explicit: `buffer.is_empty()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#len_zero
   = note: `-W clippy::len-zero` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::len_zero)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
