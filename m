Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795724163;
	b=NJF0OrfCkmcvDkrQO44vR/VLbfKq91eRV2dLCTJFmqj2cW3TaWGSuC3sAEvxBcOKHlFu
	 RlD4PaRyO0kKhKqiTlD8Av95Oofs/YBLxfDmXTmscHFsCqvWwIDZBq+eH2RheorYX12s7
	 rJwHZN0lUFkK51QQSvhlno4/fKBMLn+1KvTbZMB5TXe51LtrpLFVUbDM0ylV0EZKlKZzd
	 uMUSZtJWweu3eMP3Kj2K2mA9/B3PBmGzLHzElFgmFNaxtpTUZuCfBrRjzsNpk3NY6quiy
	 XLiYRBtDkED7f03D9GrHn6h5/shLDs3KPOvglXqkQAXNwUjwbWaD/nB79LVBb0L8cvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795724163;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=7lxrXV0KppGVNl5Jke64sK3JxJeDFcr0HCo8tS1hG1g=;
	b=dtvwQnEsOrVHK0b+tmFp9ONE5YgWGAJpaPKMOtIOv+vHyEVlDsrBQEH58sZRSRWk24i9
	 JwhZ5Al1qFrA6dkdcrXMZCPMH6nR0fiVbFQbs3lxotuDrPqHNGgxegrFEV2UO+/90RVgV
	 gIXrgY8/5RSTnMiYZYYmMLjiy+UBjO7yhhWHEClKJHGbtPFtHniHeFpVpkW2r7JwPnS9m
	 EfH9itTFsS4mdrJcYUx/0faHCTor72c077R8172yuAO3gabOsksoMPk72SNCTQ4ZAX/+X
	 3bsG9ewwJ7Sz5NBTggF3A4LPSRG7gAsVJQO228fIgyRV5AH4OKSOSqGrafFOvzFydRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=buUCKOGr;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A4B606A326
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 20:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84A4B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=buUCKOGr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795724162; x=1827260162;
  h=date:from:to:cc:subject:message-id;
  bh=8Xeu/jLzdpqyK7Y+YEc2+DKwLMA9ZSYEivOXi0ZiHbk=;
  b=buUCKOGrDzkFrxqEh60gRJ5ByPBCoq0ZVmfCcbBK6Rn652+c0vIAFIo9
   vQ48HhKDxn5Ws81s9JcuMq+zss4R9m8Gn1wvLNLbEBUhEfu+94Iq92CEZ
   reaGaRnTvpN9U5MCX4OkSLLV5Jk10kMmYjOimXUTiOr09KPzIINeQRf9E
   Bj2R8N2pEnNXlfODtWgSIRSRmnvYXP049NHWcvV4/vpnjnw/+HAyRRwJR
   V3SpdEaD4e3BkthxzC1MhH8Ggb2GD5FdGqZ3jjA4J98QIhEfJl5m52UO8
   hQj1kxeF4qsyXeNJNyRFciCVCVlQBeckvk8PWTzibVXq7kyFVO80LxR08
   A==;
X-CSE-ConnectionGUID: Y3G4jPuVTtWgaP6TATLBQA==
X-CSE-MsgGUID: EjmqqnlXS4+Yo/F17NZE9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4656705"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4656705"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 12:16:01 -0800
X-CSE-ConnectionGUID: kHCkKKwxTgWW8gl4VQZqTw==
X-CSE-MsgGUID: qoPfc5m5SfmFHoh2v8911Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12489637"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2026 12:15:59 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWfsp-000000000B8-3fXF;
	Thu, 26 Nov 2026 20:15:55 +0000
Date: Thu, 26 Nov 2026 21:15:44 +0100
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 18/50] warning: associated items
 `zeroed` and `as_raw` are never used
Message-ID: <20261126210811.vUrBCOaj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   fc24f7e1a3f10a336872c79b3772930633b0205c
commit: a5b288a93a0b1675fb51d8b7cdff4c1dfd4314e1 [18/50] rust: io: resource: Add owned Resource initialiser
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261126/20261126210811.vUrBCOaj-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126210811.vUrBCOaj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126210811.vUrBCOaj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: associated items `zeroed` and `as_raw` are never used
   --> rust/kernel/io/resource.rs:83:19
   |
   81 | impl Resource {
   | ------------- associated items in this implementation
   82 |     /// Create a new zeroed [`Resource`]
   83 |     pub(crate) fn zeroed() -> Self {
   |                   ^^^^^^
   ...
   90 |     pub(crate) fn as_raw(&self) -> *mut bindings::resource {
   |                   ^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
--
>> warning: used a field initializer for a tuple struct
   --> rust/kernel/io/resource.rs:84:9
   |
   84 | /         Resource {
   85 | |             0: Opaque::<bindings::resource>::zeroed(),
   86 | |         }
   | |_________^ help: use tuple initialization: `Resource(Opaque::<bindings::resource>::zeroed())`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#init_numbered_fields
   = note: `-W clippy::init-numbered-fields` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::init_numbered_fields)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
