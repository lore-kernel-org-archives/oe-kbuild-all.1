Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909621;
	b=F65TVXihlDmU5A5g0LfujDisIUluNEUDPbJpCnbjoI1HUVxQ3AA9+nvl3F7qC868vcCs
	 tRxzf6GgAVFf9uSKLZCHYP2ObbCfqmi17zzE9OF2aC4sTdv1e8hkjaaKMd+n6qncrBPni
	 ELwmx5GejPwNZjQpLIdezVGU56MjJXvnty3RcqQpiboHl23ysCQ6X9xWtNMKh7Q9fZfai
	 9vZ9E0I8BL/pYrNjoCwL1l7N+qDh6ptfiifa9TELt2n9ag3pKM3jIpbp8M3aZTL0A2fJ6
	 5Fi+YcmkX17k0szsya/gdLIv8urYzi3P3bodIOVPWx6OfosW6J9pjuJkQbNMxcyYRxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909621;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=z1wIoKi810WFl4MR2ILoIrHRtZS3GLy9REPDLUoeweU=;
	b=2J6R5eyCchePdcRbQOeowphv/aLSa1pXYNZWN5dNW0Rr/O1QfIktWNy/ATOi64KFtW9l
	 aCrT+k6cKQE9YKDBm52+QzRv3so+tx9nr97B/hKQ8JtE4zgxosZRxjM5an34lK88aZwev
	 gYBtOcyKjVbwRIAY729m7e6KuyddhGWkC3FjHlLjTZ4Yj0EvQRWKf0eUrbwwBIodIRdRt
	 soAeHd1fUOdOh9s4vGAlNaVXdp8GGA+Nu7u5J/74wqhop20c04E1gaE0q+5rlLPJbT1bJ
	 FIqdJf+4w1In5bRfXREt0PhGqVz0RzTqOoukEEjBGbeBw2vrPSDpZYUVKM2dUzcTzpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VEwIdFRd;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6484606A331
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 20:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6484606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VEwIdFRd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793909620; x=1825445620;
  h=date:from:to:cc:subject:message-id;
  bh=0z++K7EFByBu2htfgx671oiMl5Rb9T6wO61BPNWMO2I=;
  b=VEwIdFRdSu1L4FIOPSF16rkkqhIWyUs522CiTva4F561GZO9m6Ule2sS
   B7FKDdJTRpWc2UQOVqM8hNdCrKJLbWcdGIH0SwWNPvySxLeWsxXtUoUeF
   uAShQNf6W7jGwP2+3K9XskJNkzJgYC0PPSoaXB+AidBMKQLgKB+xmFoTJ
   K133/QzUVJH3FvVKXumRdf6zYTYe2TE8TkwsEBZPC02y4kK58WjRGHUAv
   +XQcrDNXXOuLVpyEzGJu2Pz8lI7iwp7bd6YgdyfsvauQT6vpMKzPSmsSI
   tqz+Xyxj3njh1NCiFgy9tH+tIZrxQ/CdzmOkoxUjLBtNAcnnGbAsCjkxe
   w==;
X-CSE-ConnectionGUID: 4lCCX6FlQ8GCgsJa/yfcnQ==
X-CSE-MsgGUID: eKBtJh1QT8WFSAIOrb6hCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2630894"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2630894"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 12:13:40 -0800
X-CSE-ConnectionGUID: GJE1j10RTnuL+XXw+TnYUA==
X-CSE-MsgGUID: JU3/3YVVT8yhzUxPGkT/Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7247541"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2026 12:13:38 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP3q1-000000009n1-2JnT;
	Thu, 05 Nov 2026 20:13:33 +0000
Date: Thu, 05 Nov 2026 21:13:28 +0100
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/sound-rust-v7.3 5/56] warning: reference
 as raw pointer
Message-ID: <202611052152.RyP1WBkt-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/sound-rust-v7.3
head:   070444a8abf14da700680a5331d0a95cd11e578b
commit: 79a5b63f9f837d360951e298544c4f69e9051078 [5/56] rust: module: add support for string parameter type
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261105/202611052152.RyP1WBkt-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611052152.RyP1WBkt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611052152.RyP1WBkt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: reference as raw pointer
   --> rust/kernel/module_param.rs:118:37
   |
   118 |         let arg_static = unsafe { &*(arg as *const BStr) };
   |                                     ^^^^^^^^^^^^^^^^^^^^ help: try: `core::ptr::from_ref::<BStr>(arg)`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#ref_as_ptr
   = note: requested on the command line with `-W clippy::ref-as-ptr`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
