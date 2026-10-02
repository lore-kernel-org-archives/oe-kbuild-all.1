Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB19048097C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 10:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790937106; cv=none; b=vEvWOLuBZ7Luxczn4SFau25IPpAxfVyhdHPcrEFCQS9fpbnJodUW7CjhynM7cVJnZPlGSEA5Zep/XjrHZ9FjXw/FF+/a3G/7JKL1qfYOh3Pf4oPgPJqxpptknpJDgwjxTEXOKPnJDQU+h2ET7o+34OAIVJ8FAg2zJgmVeMRe8m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790937106; c=relaxed/simple;
	bh=fyyN2gJ0CyWEAFsXXevUG0rGadOzMoVTW8+DMHcuIfU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pKsMvdpPQRwkc/iT1a0ud8PzrcpV2OyEtAv7zViXQpfZ4p8T8xGwn/ePVuHJ18NVDwpn0Z5W7YQcMNoSdN6Agw3rjB1Hhz4yqwjdpdCwcfdgNZQSs8IgaVf2osn0rukXTDmwp93i4a0z3vdYSVMRtpkNJ5olX1JCqIZH61Ragqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/WkOWRv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/WkOWRv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790937103; x=1822473103;
  h=date:from:to:cc:subject:message-id;
  bh=fyyN2gJ0CyWEAFsXXevUG0rGadOzMoVTW8+DMHcuIfU=;
  b=B/WkOWRvnOK/1ezmtxbEx8qm8alECHwJ0UMEPnwKJTEc3Qam086FCg+3
   28vkriSm52j0EbC2haQs0laWUa41CwXJ84+9GxAwlm6XmEpL48sSIGiGH
   H/NJ6Qx6707d67XpUuBa5IgJhhKD33zMju4EkdQ0VNwFMqOBZulkX+sKZ
   lvNLqtVjDZp8WL1DEhg0tpTep1zgUHTxD5eakyMmdmbjrTJ5YGgWrFiSv
   fG3T/7zsSK3aCYJSKkEdAyAwIRVyG0T5aqYOHuMjKZTsfwHHUVLkabS1y
   JzDLPJU9zRwtN/qFH18jPskJ0S8+f0r2vZR8QKN2XDUB/U/n7tlqrWJ/+
   Q==;
X-CSE-ConnectionGUID: 1Uc00YMYRaSzF64ZIuhGgA==
X-CSE-MsgGUID: wIJ1PRU1T6CsZn09VlvcRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91564917"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="91564917"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 03:31:39 -0700
X-CSE-ConnectionGUID: f8+r4xnjQYq+2vdLHYjC5Q==
X-CSE-MsgGUID: Z1D1y9jDQGuRn9oEvImvEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="280963326"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 02 Oct 2026 03:31:38 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCaYC-000000000V7-0mLg;
	Fri, 02 Oct 2026 10:31:36 +0000
Date: Fri, 02 Oct 2026 12:30:59 +0200
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:dev/selfref 34/49] warning: useless conversion to
 the same type: `syn::Lifetime`
Message-ID: <202610021240.XVT5d8tK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbdd0121/linux dev/selfref
head:   63b01fa5c495532c8f631cce076471a89c78001e
commit: ff817a9e8581f84090560562ebd7efdc5aac8be9 [34/49] rust: pin-init: internal: pin_data: check covariance of self-referential fields
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261002/202610021240.XVT5d8tK-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021240.XVT5d8tK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021240.XVT5d8tK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: useless conversion to the same type: `syn::Lifetime`
   --> rust/pin-init/internal/src/pin_data.rs:805:68
   |
   805 |                 .map(|b| GenericParam::Lifetime(LifetimeParam::new(b.lifetime.clone().into())))
   |                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^ help: consider removing `.into()`: `b.lifetime.clone()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#useless_conversion
   = note: `-W clippy::useless-conversion` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::useless_conversion)]`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
