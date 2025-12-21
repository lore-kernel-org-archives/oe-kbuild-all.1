Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C131E3762
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 20:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766349611; cv=none; b=eQsU4fuoBpYdZZtoS3f3MP70PaW9hqmJCeGsdLK3MZeVHhrUs1b3/gRp2iBE87jeSJW0ehVLWkOdTMtTGzGUa+WpjcnVc7gvaMemjwVEyr4dwsXPv8d2SWpGLbWC6BQagHIq/S1LnACZGW+TiSkTsjjSNUQBMJH0dfaBwhASvkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766349611; c=relaxed/simple;
	bh=x3IByTpd2Qot0BCLr7djtW9lef6P69P3SfcOCToltfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aiOEQEFeV2xqV8WC/9aRdmFWVkrmoxoqj6XrFNt34e0C3HcUNnOdyn9C8KQnVBuDR/3EXGFgzokNH5iiZqib789JUQbQQVCCz9ia1c+4rd1EG/zm0dbEbljAHFxjk6HnkwkWFvU2UgP6JDUvz15ilsGn40OUrU4R6RkRwV8BIs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OlPOMQDs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OlPOMQDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766349609; x=1797885609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x3IByTpd2Qot0BCLr7djtW9lef6P69P3SfcOCToltfo=;
  b=OlPOMQDsAXu9TEDcYEymungiqE8Lccxv3RPM50TT6lH9AlqOH6h4TzUF
   5n8yrgkzOSPrm1CE3TppwD+37tqGQ9BKyR8jkVa2NvLZ6/tf7y5zrpcpJ
   pY5O2YbJi1a0INFi/QwshsTzXdX6SzqAeiN4FpLQ/1OTgnUDxIaMom1Kn
   L5MsbGOQmqJ0ACn4LZ7MYvuVEUm2Cxu5QwklfHq/m/Q4AvNRAeW1OclRM
   BbFuVZSJ1y4FldZzj80E1xmT2feQiBCiTMZskDouPq/XGIIDbWyvr8sMq
   2F4oAdDAjT8blNstElIr08bklKXecCz+GpURIYjmDcTYMpSgbhk/Hct/l
   w==;
X-CSE-ConnectionGUID: b9Vy9JNRRSq3BMVv4HK1RA==
X-CSE-MsgGUID: XYEGAZVBRlCIwQpNLktQDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68098573"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68098573"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 12:40:08 -0800
X-CSE-ConnectionGUID: 3aoDrVnOTNemL9yNcqBh1w==
X-CSE-MsgGUID: cK62Hry1RWmIm7ODSJCjDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="203834453"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 21 Dec 2025 12:40:07 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXQDl-000000005EG-20F1;
	Sun, 21 Dec 2025 20:40:05 +0000
Date: Sun, 21 Dec 2025 21:39:45 +0100
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 39/62] warning: length comparison to zero
Message-ID: <202512212117.TxTWA26T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   e08116e258e28774a3770a80debc819b89928f45
commit: 3ecafd505020550f9bec8e4feca4d39c2db651a3 [39/62] Rust: io: Add memcpy_fromio wrapper
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251221/202512212117.TxTWA26T-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512212117.TxTWA26T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512212117.TxTWA26T-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: length comparison to zero
   --> rust/kernel/io.rs:258:12
   |
   258 |         if buffer.len() == 0 || !Self::length_valid(offset, buffer.len(), self.maxsize()) {
   |            ^^^^^^^^^^^^^^^^^ help: using `is_empty` is clearer and more explicit: `buffer.is_empty()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#len_zero
   = note: `-W clippy::len-zero` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::len_zero)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
