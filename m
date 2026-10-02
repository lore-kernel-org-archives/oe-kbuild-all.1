Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2CE463B85
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932165; cv=none; b=G+0HnZaSKGaCObQVXp+81TvUmifEWurP6ib5h8Ek1LZnRXlfh6EHlIR4Gt1yregxDyA/DaJgnThusWUPjO3ylMl4+l9wPN56y3aUd+bwX8YG2OpzVGDgvN1Mz3uJY/QXdqJVvcmf9otgSxRrgXWinCzNotqqZtCXvXCUMFnB4FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932165; c=relaxed/simple;
	bh=yVzMGSc9IDenejzb4ZSl8GaS0iP9poHwmRA6EN42DX4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qu9tiTVDTKSZ+gtsjFej6LJqAICeQYLI+MlJNW3ppZfr3P+Rc81djTjwnQFYk0DsnCBCY2J/hkAVZnre42fniLNPFE8q4QsIpvpiuf+cBAM/amnRkYX5spBt+p/Ue90kRTVdlficknccZFHNaiZcJ7aa3fTBqXrudVMhKDoeqc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cEq0HST6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cEq0HST6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790932164; x=1822468164;
  h=date:from:to:cc:subject:message-id;
  bh=yVzMGSc9IDenejzb4ZSl8GaS0iP9poHwmRA6EN42DX4=;
  b=cEq0HST6cLsXk4/dcOhoXgKWqnAytEMCarvyiHD8B/wrhRpmgTXeMaHw
   LH24SxWzol8FRMHd0FhMkT4Gt9C0X2xIp4UNRfbXMzsUTnoPo7W7vEQAu
   Bz8l/lKO45+cNxYOds7eqCdrXIotuxixGAdNhuJ8NQCWW8f1bzUc36Wpp
   ZyhPZ4RCezN8UnVH9x/JcJzG0iGSjyv9UsMfUOhWU4fwImxp9LLxRV27Z
   ZYMc0FHqFkhzsBwjvS0OXZhUc4DbO8TBC0bAXATw0+NnaoI8ArZfkgJwI
   4n/b4a4qp/IY6YqOnMi6eNkpBbHRFiWRPGNuJMpe64WI38X4pQh94nVZb
   Q==;
X-CSE-ConnectionGUID: fDxl3tq+Rfuk5lqnub9yEg==
X-CSE-MsgGUID: 8HM0Xc0MTGqXeVTDs28xHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="101860018"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="101860018"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 02:09:23 -0700
X-CSE-ConnectionGUID: v80dlvu3TWS6D7dRkExWYw==
X-CSE-MsgGUID: RwnJ0L/BTYqVzCjPJrikrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="284273017"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 02 Oct 2026 02:09:21 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCZGZ-000000000Tr-04TM;
	Fri, 02 Oct 2026 09:09:19 +0000
Date: Fri, 02 Oct 2026 11:08:41 +0200
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:dev/selfref 33/49] warning: enclosing `Some` and
 `?` operator are unneeded
Message-ID: <202610021106.he8ljg74-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbdd0121/linux dev/selfref
head:   63b01fa5c495532c8f631cce076471a89c78001e
commit: 4b4e619ebf97b3ff241ee675b47dff06b957c432 [33/49] rust: pin-init: internal: pin_data: self-referential drop order checks
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261002/202610021106.he8ljg74-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021106.he8ljg74-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021106.he8ljg74-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: enclosing `Some` and `?` operator are unneeded
   --> rust/pin-init/internal/src/pin_data.rs:352:25
   |
   352 |         .filter_map(|f| Some(f.borrowed.as_ref()?))
   |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#needless_question_mark
   = note: `-W clippy::needless-question-mark` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::needless_question_mark)]`
   help: remove the enclosing `Some` and `?` operator
   |
   352 -         .filter_map(|f| Some(f.borrowed.as_ref()?))
   352 +         .filter_map(|f| f.borrowed.as_ref())
   |

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
