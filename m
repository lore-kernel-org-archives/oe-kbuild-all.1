Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BDE312826
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Mar 2026 20:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772396040; cv=none; b=e9ZBQtIC76lnbM0SdkI976g/qZ8WlyDUyBGAQzXnNP+eLj2abdFoasbjVHvS76tJn1O2ZKsp9ScY7mlLrT3Jl/k6/u/QPTWxo0UT7qhqTyJIb4MU3pNxUyk+AA1oCDyIybFX1CoOsYrg8LjtdVZ2BGRodXSPgxqf93jVSu1T/lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772396040; c=relaxed/simple;
	bh=0XTJurG79LnhDFJKab4XR/fEL+lR5SLZB/Q4wa7clEo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tSAZxk+is9en3navFRC0DmlecU8+KHQ8Qr4P0oA83eMo/+DKBr+vpXccJr6pYQbUhZoJMbuiToIvpBrD7beoa5B2T2nI9x4bzt29qMcrQFRceGJVhlzHneBrQADZ1kCkrD/LjlarTXUbVGW/Rsq8EfnobwfhyORlZw3XQIX0RnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IyqWep8W; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IyqWep8W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772396039; x=1803932039;
  h=date:from:to:cc:subject:message-id;
  bh=0XTJurG79LnhDFJKab4XR/fEL+lR5SLZB/Q4wa7clEo=;
  b=IyqWep8WlaS87BibZdLPsHphnK9U3E5LXy4/HQsMcxSb7d0VuOz8sqG1
   eqPW2cB2nb8vW7+V/ZaG+w2PivKzBP7DB+kkekxhMBqdtDYMjUIqEUKeZ
   3GAV0f6mRs3t8PCrmWXm9RycbymAAkoBxyI9J/75HoW2iOnLJnEdHAH5b
   wstIeyxQ5wBd1CHG7ZyDqnevEem7Te9ec8TTJNODZtAIsjNjervvvbnSB
   Nue9cf+OYYOmxqw1YbaEpZG7hXepZqtLHpDTkw5yq8XT5ukCV+5ZAKkzb
   eKbuXyLyS8B0eC0ucac7MccJ6+ZXX7kb62azru8YMTFFWS3mGwQb8GEFw
   Q==;
X-CSE-ConnectionGUID: 9nNspZSQQYa4DPkRmd4B4w==
X-CSE-MsgGUID: HNgNxRIeRD2olr3BBQQf3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="98879231"
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="98879231"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 12:13:58 -0800
X-CSE-ConnectionGUID: uK+LGlU6Q3SBQaoPKVliFQ==
X-CSE-MsgGUID: RPJMKjPLQDiaYnmmcz7yng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="247939890"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 01 Mar 2026 12:13:57 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwnAo-0000000013J-3TJD;
	Sun, 01 Mar 2026 20:13:54 +0000
Date: Sun, 01 Mar 2026 21:13:47 +0100
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 34/57] warning: length comparison
 to zero
Message-ID: <202603012106.ZbKgbZBE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   01c00561a643db1264ba75e8b464a87ec2db6126
commit: 92fe4dbd22e7faafad04ddf06d732e336ea7be98 [34/57] Rust: io: Add memcpy_fromio wrapper
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260301/202603012106.ZbKgbZBE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603012106.ZbKgbZBE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603012106.ZbKgbZBE-lkp@intel.com/

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
