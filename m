Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A789C2F0673
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 02:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787537032; cv=none; b=GlD/2f0zSzx6Xz9w9zr58xLeDL4J9Kx2cWjXSOw8XsuHyjBmLGVk8x2ta7H7H9VJ2hdszY5l+GzpHdWrpneSVrzcYeAKeLFp7yix9uowII7IWIZkN+OVWv0vK3K1XQPy2BT1ouFUFe0rnT6KsU5DTOWPpsxxVcIkZ04XAHnD8Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787537032; c=relaxed/simple;
	bh=IdN3O5uzBi4jrALu98j6SA3Ke/ofbXDbEuE+i8MXwFA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S/3lFNkrHHYKDQN7B8D6yDY4QGOTY+BJaOZPUfIIGoVLkkswmsAwMaZcNOn6x6WGhKGkBBaQV9gYfnSydD3J/NeDxRWt6VeXtFCrghRcS2s5S7kHNyuNDNqQSLaMzKoe4U7OWF9SOePh9eF0yM9k1psUMhf62pQ78GwZ66ki7HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+xEJ/Iu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+xEJ/Iu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787537030; x=1819073030;
  h=date:from:to:cc:subject:message-id;
  bh=IdN3O5uzBi4jrALu98j6SA3Ke/ofbXDbEuE+i8MXwFA=;
  b=Y+xEJ/Iu3wWQkqOd/9bq4Guo1oAqZzQPkURiGiniYeBKhrJVsKuIRxi7
   9m+dXJ/tvjJ4LrIFFFjjjlxBkyAQVfLUF8jLWoQNABaxcxu0W45u/Pv+O
   PY5jkzEOPSX7mCUSIKS/h/JO5tfcMR4bR5Ca0VmSQJCtMykr8Q0r5/uEE
   IbZtIH3VOhvTaFYUBgFJ2Zax/qT52uQCVw5h3PBGly2gZAsFDlRrvAytE
   /jGn2JTylPRUNLiVc0X2pXZJYUybF8AtC25ADIIX3EJwIS4fNR1tMYAvp
   cYzvJvdmTjEB2gAj2tTgVzP0VuqCWtDbZsrYFdpOuVM+bS43uL2vH4Lvt
   g==;
X-CSE-ConnectionGUID: LM6jN0MBROm00xSU0aiNWQ==
X-CSE-MsgGUID: +e6vktSxSmaMJUPvzJ0Skg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="98572681"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="98572681"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 19:03:49 -0700
X-CSE-ConnectionGUID: kfpAhy/yRxOoIqXmt9C3/w==
X-CSE-MsgGUID: POL1NeJMTemqWNBJIa0Wmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="305064354"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 23 Aug 2026 19:03:48 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyK2L-000000000Bl-2qt5;
	Mon, 24 Aug 2026 02:03:45 +0000
Date: Mon, 24 Aug 2026 04:02:53 +0200
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 28/79] warning: `as` casting
 between raw pointers without changing their constness
Message-ID: <202608240344.OBGilCnt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   e793b14f66e33b70363166d84886d82d462f1987
commit: ade253cc58e6089f3650bc816b34863e60d3ca13 [28/79] rust: alloc: vec: Add TryFrom trait
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260824/202608240344.OBGilCnt-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608240344.OBGilCnt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608240344.OBGilCnt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: `as` casting between raw pointers without changing their constness
   --> rust/kernel/alloc/kvec.rs:1706:40
   |
   1706 |         let array = unsafe { ptr::read(vec.as_ptr() as *const [T; N]) };
   |                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try `pointer::cast`, a safer alternative: `vec.as_ptr().cast::<[T; N]>()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#ptr_as_ptr
   = note: requested on the command line with `-W clippy::ptr-as-ptr`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
