Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D3E19343E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 11:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436733; cv=none; b=i7h6VZ2PE76poj6PwwYxdv01wW7dRXTPwjHwsvN9JBfCDiMXKRIyQS2pGSOTQ3sIk3ZfREyYacaH+Q6vJz+A5m3xkYj/Nu02On1Jd6q7lzygJmkKCdzcufhBNt215k60GK6I7+nlbXOMEeQ5Xwj6sP26JiF4kywaLMYHngJ1KrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436733; c=relaxed/simple;
	bh=VpnUJ0JgEL8B8f23zIGejqIRfZiMjTX4TdiQNHdB/gE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YPrTR1ppqVrAOu7LSOGECJAcjYRSCjnp6dicwzrRhxgvGzOXM2hOjXpExC4UsLfgx+cJ+0otUH8KPKbXiFfpPIlqBhb+OYPhYBSnC575+3Nrp62EJqU9eahShv4EZ9viTm8y11ppaZuSOJmLNEYXd8sDodfZmG/d2uKgcuk4ctA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvwazIie; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvwazIie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774436732; x=1805972732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VpnUJ0JgEL8B8f23zIGejqIRfZiMjTX4TdiQNHdB/gE=;
  b=SvwazIiehzCUSB251qdyvgqhkF3rCd+OIX5lalsFMvasrK6wCzArukbQ
   2oITjmSpoMpDvT1IUTJaHFa1OkY7oNT3vwsBEOoUVzRpBEEtv+OTvBLkd
   z8M2QbHMo+SofMrALBpQCda/zKG/Z5FPDqd5ZhU981tcvAVEJbN957Ymm
   kSPw6J83S63FmcTtLTtrKvfsng5CIF2CCwlnRlJmEzicyzjkeEYobPkM6
   El31Q1PtpfrFmQfTRGNCmPLFYENkxnFTk8xvVC/SNe6kg2gy83vd4xQxo
   cVi5qbn43TpK5qoJxMFxIBXlFCvv2+mXpXpem847dtaYQsI3Bcsykf4w/
   w==;
X-CSE-ConnectionGUID: 6kDiOB4sTPWjPEaTl6S3uA==
X-CSE-MsgGUID: Hza8vDbFQRCf2LX2/46HjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86840416"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="86840416"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 04:05:31 -0700
X-CSE-ConnectionGUID: Dy93ZgsDQ7iHQQARJW54BA==
X-CSE-MsgGUID: cUtpNLMPRyC+ns6wbIml0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="223719674"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 25 Mar 2026 04:05:30 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5M3D-0000000074z-4BdN;
	Wed, 25 Mar 2026 11:05:27 +0000
Date: Wed, 25 Mar 2026 12:05:25 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 3/18] error: current
 MSRV (Minimum Supported Rust Version) is `1.78.0` but this item is stable
 since `1.79.0`
Message-ID: <202603251242.GMD82Tt4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   6816331cc815bfc31edb2ff1aaad0d882f0bf92b
commit: fb3ab97786e927b684927c71a78479a10f6d2995 [3/18] run-tests
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260325/202603251242.GMD82Tt4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251242.GMD82Tt4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251242.GMD82Tt4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: current MSRV (Minimum Supported Rust Version) is `1.78.0` but this item is stable since `1.79.0`
   --> rust/kernel/ptr/projection.rs:79:26
   |
   79 |         if self >= slice.len() {
   |                          ^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#incompatible_msrv
   = note: `-D clippy::incompatible-msrv` implied by `-D warnings`
   = help: to override `-D warnings` add `#[allow(clippy::incompatible_msrv)]`
--
>> error: current MSRV (Minimum Supported Rust Version) is `1.78.0` but this item is stable since `1.79.0`
   --> rust/kernel/ptr/projection.rs:95:29
   |
   95 |         if self.end > slice.len() {
   |                             ^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#incompatible_msrv
--
>> error: current MSRV (Minimum Supported Rust Version) is `1.78.0` but this item is stable since `1.79.0`
   --> rust/kernel/ptr/projection.rs:121:28
   |
   121 |         (self.start..slice.len()).get(slice)
   |                            ^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#incompatible_msrv
--
>> error: current MSRV (Minimum Supported Rust Version) is `1.78.0` but this item is stable since `1.79.0`
   --> rust/kernel/ptr.rs:253:11
   |
   253 |         p.len() * size_of::<T>()
   |           ^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#incompatible_msrv

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
