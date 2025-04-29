Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E4825EF8E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 19:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745955843; cv=none; b=qoGDRWz3J/+HWcZ7J5mT2RsXqKPAs9/8+5l9XIt/rVzXeG6GzUMh0s+sru6v6Wa2l+7vLFRuf7NfopRyMYcHEp5Wv0xdpNhpi0fwdYqF5dYHs50Td6fXROZpaCPeJGdqZGcuqgFyVYeah2Z1+Np6d0y1YAwPHDQCeXOTPjJRXD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745955843; c=relaxed/simple;
	bh=JkKSdoXZ9PaA75mDPHsXDRBxMz5X02S5d7C7PZFDV/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zx/3lVUxuEyX45HqixI9uiw0Sgm6J47ZNG7kwD1bIAbURYwV6Oa+phjAihJ3ewXe/uc/MPKLmfE199pbk5Zunhg3m30Sw51/s6E+pnVzRsqXT0E3g4metrZU324R18YNfpfBYjyAKUGBL7EAPd8YEzUSCujy0+CrNwJ1gD0I1zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LGaY4l4H; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LGaY4l4H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745955842; x=1777491842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JkKSdoXZ9PaA75mDPHsXDRBxMz5X02S5d7C7PZFDV/I=;
  b=LGaY4l4Hj4PEp7EIEjW4OngjrZKdNFISpflLt0gdocffwNfQPOjmaLnC
   gnHXz2WRdceqsQQXAjAHf34kcw41PRFxd40ozM8k2HdZkCtT0DvCftod3
   6fA8pFJaEeaHQUuyhq1V/jQtUAlaJSbx+A6TPxI9ADVcCLSdnGeWPWekx
   UG6BgVIWd3AmnHOicANFkIvyhsjfO1V+HJAhTrJ8RmnsDIbJxrJYaTSmm
   Ne1g19UEmeQsbGZJB5NIR+fUsiAmId69v35x0hdFdpIU58rZkBHEJiKC3
   0qPaM1ZhkH6DbdAHvuXINB/766Uhb71ZQmQnw9PRAoSrR5ELzHcglI2ra
   A==;
X-CSE-ConnectionGUID: bYOWa+/4RACpq0ngT9SY5g==
X-CSE-MsgGUID: wtq4pEitS12KCuwHclT1Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="70100728"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="70100728"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 12:44:01 -0700
X-CSE-ConnectionGUID: eduKGa0VS2+6vlF0VVrhrQ==
X-CSE-MsgGUID: FativGdOSdyydu0M3Dm5PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="134908090"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Apr 2025 12:44:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9qs1-0002sr-1q;
	Tue, 29 Apr 2025 19:43:57 +0000
Date: Wed, 30 Apr 2025 03:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: Alessevan <44125445+Alessevan@users.noreply.github.com>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1161 185/195] warning: unneeded unit return type
Message-ID: <202504300358.x1HTowZ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1161
head:   9f5fa1ba161d636d346f72ba808ce20ee4a3fa70
commit: aac1a5b385f3ce34533b9afafb8614572d3f0d2d [185/195] feat: crash when receiving packet
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250430/202504300358.x1HTowZ2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300358.x1HTowZ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300358.x1HTowZ2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unneeded unit return type
   --> rust/kernel/net/dev.rs:520:37
   |
   520 |     pub fn ip_summed(&self, val: u8) -> () {
   |                                     ^^^^^^ help: remove the `-> ()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unused_unit
   = note: `-W clippy::unused-unit` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::unused_unit)]`
--
>> warning: unneeded unit return type
   --> rust/kernel/net/dev.rs:527:37
   |
   527 |     pub fn protocol(&self, val: u16) -> () {
   |                                     ^^^^^^ help: remove the `-> ()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unused_unit

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
