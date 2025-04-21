Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE20524C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Apr 2025 18:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745259595; cv=none; b=bENz9+p/p9Rzuj9YKWwcQgRRm0TTyK+27ERN0EtIPBgetcDfNhhuUWWKNGD7oIIMYYwXIgt5US2Vffzw35VQ22KVaXBSthm1oCqjJXwpEF7TaA8mEwpkgknbwPPPSTQh1wYsaLGzAppY03W5hI+8FO0rpqccFDkeUu1QMp+4jwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745259595; c=relaxed/simple;
	bh=jrN8e8Bc+E0J0q+LZqkAdxmMA9OFVJ4JLbXoVEfirm0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kN8pHolTb11KTxboO/dQWjLZzOVBkgWs+BTdo3le3x7CCWqrzFYEc61DO9FddB8U1i3acEhD8LAkXNW+Gg0Dlu++reVIoPBtx4cDiQAb5+3uT9nSm3naLMWBZ7doX2uBK3v2JIvgJybqrutk0trThhgf9VCSLuFFZQbuqxwGnvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LvWR8y8m; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LvWR8y8m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745259593; x=1776795593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jrN8e8Bc+E0J0q+LZqkAdxmMA9OFVJ4JLbXoVEfirm0=;
  b=LvWR8y8m2NVsMZL9021XX2pIxmEPB/4Bio+hF77/QGAEhWcEQhNIYBj5
   VoAkVnMq+3DgHUFitE4GSwzMRhVutfIkBP05XquqS46GnoV0rRoh1u1sa
   +gzITzj7i6i+0v+z8qVv7D77KVcPDGaGjLMBcZpIjkdRrG+kq375B00rF
   FX5Ah5nU7Cysynis0Xk3KQ5L64NAmNzuTWimOsIfzTsw3WUsfyrBKYPx5
   e9Dsv2kJIumAaeLArm7jZqoeJtnCah9FyjC4ibw5JOZ2MsnzA6VvKxBkT
   6RT5fvArziU7ueyZ68uJdTOKLTkzkxY9YqPxTDjkStzcQ9OEY1hLuIrk9
   Q==;
X-CSE-ConnectionGUID: swSbXZm/TTKBcJoX04epYQ==
X-CSE-MsgGUID: LmjYm/IyQXSRiRsQm0YlUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="50600033"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="50600033"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 11:19:53 -0700
X-CSE-ConnectionGUID: jJcbI9RKQMG4r6TAL+W0LQ==
X-CSE-MsgGUID: 2zLEgfFzRPWi87hAJaXCcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="131757329"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Apr 2025 11:19:52 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6vkD-0000JX-1n;
	Mon, 21 Apr 2025 18:19:49 +0000
Date: Tue, 22 Apr 2025 02:19:09 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk-pm:rust/cpufreq-dt 15/17] error[E0308]: const not
 compatible with trait
Message-ID: <202504220220.atcjlJJL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git rust/cpufreq-dt
head:   217938b674d8758a7c07d72205262118923abe64
commit: f7e96b7da77ac217be5ccb09b9309da28fd96c90 [15/17] cpufreq: Add Rust-based cpufreq-dt driver
config: x86_64-randconfig-104-20250421 (https://download.01.org/0day-ci/archive/20250422/202504220220.atcjlJJL-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504220220.atcjlJJL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504220220.atcjlJJL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> warning: `&` without an explicit lifetime name cannot be used here
   --> drivers/cpufreq/rcpufreq_dt.rs:59:17
   |
   59 |     const NAME: &CStr = c_str!("cpufreq-dt");
   |                 ^
   |
   = warning: this was previously accepted by the compiler but is being phased out; it will become a hard error in a future release!
   = note: for more information, see issue #115010 <https://github.com/rust-lang/rust/issues/115010>
   = note: `#[warn(elided_lifetimes_in_associated_constant)]` on by default
   help: use the `'static` lifetime
   |
   59 |     const NAME: &'static CStr = c_str!("cpufreq-dt");
   |                  +++++++
--
>> error[E0308]: const not compatible with trait
   --> drivers/cpufreq/rcpufreq_dt.rs:59:5
   |
   59 |     const NAME: &CStr = c_str!("cpufreq-dt");
   |     ^^^^^^^^^^^^^^^^^ lifetime mismatch
   |
   = note: expected reference `&'static kernel::prelude::CStr`
   found reference `&kernel::prelude::CStr`
   note: the anonymous lifetime as defined here...
   --> drivers/cpufreq/rcpufreq_dt.rs:59:17
   |
   59 |     const NAME: &CStr = c_str!("cpufreq-dt");
   |                 ^
   = note: ...does not necessarily outlive the static lifetime

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
