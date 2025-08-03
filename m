Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961E886359
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 23:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754264665; cv=none; b=deo5rQbIloHOMJGCkuPL89OdGbsL/btx6UG0NVt/1BC57TKVeUSg2H9TwE1+npyamujy558UdqnY2Ph46nAJUoMl2saZdtGzYBh20kE6lywFNNwwUAk5ioZGxikwNel3EHE+3e7OucyLBNH/q/ng64HCzgqUQDr3q/Ctu6e+5Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754264665; c=relaxed/simple;
	bh=xWQVtSekpsB6wjbN53riRo5HGEHIBz725yTzHOiCPAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KcLAKcfagS2ydeZLCvTjeFi2+mdOtBiD9nyZZBdKYJEpha+cw7WKV77tTnmfOFu1H4TlmSuZ6hVxyG7cEytpUOgrJBAFAPy9ktynSXFZvXp2iCHda1BU6jAs3I8W3gC9d1jU3Us8E+ZFVND9BK2v9NA2qPIEEJtGL0AxNT4qyTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=liz9zxZC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="liz9zxZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754264664; x=1785800664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xWQVtSekpsB6wjbN53riRo5HGEHIBz725yTzHOiCPAk=;
  b=liz9zxZCBnSt0ctksEgaG7udEYWpilYrDgLmRBmru3TByMKGILonPvxv
   NnvDSzb8ElRnemQrT2eazmMUDJL6C5xbC3vAeydCUo/BwEpaK6GXN6kcd
   wGuouKJ+C7W8iQOOdediXgqFcageJj1GQUx6husXEpnQam9/4j6F6+ap2
   5XtJMy1l17GJTas6IwVz1CP+8qS1+eQVf5tJNhHmfhupMusddExLxbRp/
   qmA7uOM+N+5UffFQpB+YBC07DFrOGELkgmuVXriFQYy/seuNaOBRGnjCy
   gQAq3a1AME0mb85AQi9avsC/rbRc2VXNOb5TqrH7jdw6gH6tdr3HEo4Zh
   Q==;
X-CSE-ConnectionGUID: b4EykshIRb2OCYTRoFCbvA==
X-CSE-MsgGUID: 5+/XEuSNQ5SFE0BQvOAFVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56391821"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56391821"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 16:44:23 -0700
X-CSE-ConnectionGUID: 2+NUZDpiQY22E5haFOF9sw==
X-CSE-MsgGUID: eRRGiMKkTpilfXQjVdl73g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164802988"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 03 Aug 2025 16:44:22 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiiNI-0001hb-0m;
	Sun, 03 Aug 2025 23:44:20 +0000
Date: Mon, 4 Aug 2025 01:44:12 +0200
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 58/85] warning: associated items `zeroed`
 and `as_raw` are never used
Message-ID: <202508040158.UDfPSzBd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   800be80e4ce2e4872e0d8f2716b2b7c79a0511ef
commit: 589bf67694fd455396952ab520e7219e3b2ae481 [58/85] rust: io: resource: Add owned Resource initialiser
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250804/202508040158.UDfPSzBd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040158.UDfPSzBd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040158.UDfPSzBd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: associated items `zeroed` and `as_raw` are never used
   --> rust/kernel/io/resource.rs:93:19
   |
   91  | impl Resource {
   | ------------- associated items in this implementation
   92  |     /// Create a new zeroed [`Resource`]
   93  |     pub(crate) fn zeroed() -> Self {
   |                   ^^^^^^
   ...
   100 |     pub(crate) fn as_raw(&self) -> *mut bindings::resource {
   |                   ^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default
--
>> warning: used a field initializer for a tuple struct
   --> rust/kernel/io/resource.rs:94:9
   |
   94 | /         Resource {
   95 | |             0: Opaque::<bindings::resource>::zeroed(),
   96 | |         }
   | |_________^ help: use tuple initialization: `Resource(Opaque::<bindings::resource>::zeroed())`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#init_numbered_fields
   = note: `-W clippy::init-numbered-fields` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::init_numbered_fields)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
