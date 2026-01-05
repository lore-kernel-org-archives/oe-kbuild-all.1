Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A9A7261A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 14:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767623568; cv=none; b=AcFoP9n6+ZUyr3unLjc5uof+LzGvKKLk4z4YFjaPtgXUR+LQa9FfKu9caJSP+fiVNuiKjD6AkurKHG3CwhMlAI25hjKG8XDhL6DcmoTJDeoPxUfQ36U+1/u6m7bY6NAUNwNkZoYoVGsKEsuvKnXiRMcyqtgW2bjxDfPM2lRcvpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767623568; c=relaxed/simple;
	bh=QsDRMlLWXvDPeZn5eUuxCp9S0momGaKwR+MptDHtVVA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KcI2x/bXwMVLBs7uvsrXZGTJy+dn3+H/87A6x7Phk3df/WbWBjWAzLExegtVutKwbK931WVOL92jOxxBxmbtbqYWimQX31Qni7JchmPZJv0sQNF1C9wG/cMLTVzvdqNH8Kdw5tP+PhVIN6CIzNLriCVPQJPVuckjjyIFizwX1VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GiZEoa/n; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GiZEoa/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767623564; x=1799159564;
  h=date:from:to:cc:subject:message-id;
  bh=QsDRMlLWXvDPeZn5eUuxCp9S0momGaKwR+MptDHtVVA=;
  b=GiZEoa/nCjhlXTqFRgWVpCcRBORThNwudVDMCDh26y9clOcW86K3VPkz
   nzbmwy24lHYA+DB/96iwapHB98X1do5aKYVgPl716+/rFfpDaJanVk1aq
   DywlWZtZ8cAOGvoIG2dFWL1+DUtPGkYfyIDPUkdlt4giudZIuKhBdt/qg
   iPrJvDXjPv7KjncpJkYlsTq5e+WQQQlWf4dffXENUxr+sIZRWMc5icq+f
   deMu+6POlf+9sFpK2vHDq3uuPS51Smk0xkG3EjPwnKPNm/6K1Bcf6O9xr
   m9JWlQfIee17fEiO18R/c8VJ7SJp2rM5rc0Jg6/OlZ+Qq3HCv7W6KUQKS
   A==;
X-CSE-ConnectionGUID: aHTgP9pCSNCnU4KAfHUWfQ==
X-CSE-MsgGUID: sG7C9C5XSyu5P2UxTSNFBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68181588"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="68181588"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 06:32:43 -0800
X-CSE-ConnectionGUID: og0PNS2ASwydumo2bx1W6Q==
X-CSE-MsgGUID: O9lY0+r5SzOGVVTPiUUo7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="207432753"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 Jan 2026 06:32:39 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcldM-0000000019d-1jVl;
	Mon, 05 Jan 2026 14:32:36 +0000
Date: Mon, 05 Jan 2026 15:31:50 +0100
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-field 2/7] warning: unresolved link to
 `macros::has_field`
Message-ID: <202601051530.MtwZXQPs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-field
head:   53dc468901ccb892049b86ce9666413b413fb44b
commit: 795cd12ebcba060902d23c5a6b464d0687f79273 [2/7] rust: types: Introduce HasField trait and derive macro
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260105/202601051530.MtwZXQPs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601051530.MtwZXQPs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601051530.MtwZXQPs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused variable: `i`
   --> rust/macros/field.rs:50:25
   |
   50 |             if let Some(i) = search {
   |                         ^ help: if this is intentional, prefix it with an underscore: `_i`
   |
   = note: `#[warn(unused_variables)]` on by default
--
>> warning: unresolved link to `macros::has_field`
   --> rust/kernel/types.rs:458:11
   |
   458 | /// Use [`macros::has_field`] to generate the impls automatically.
   |           ^^^^^^^^^^^^^^^^^ no item named `has_field` in module `macros`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
