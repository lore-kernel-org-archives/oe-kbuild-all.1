Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F4F2E36E7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Jul 2025 20:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751661521; cv=none; b=Af/JyL0XvqMqNTn+2qSk/e63DbH+emnApKihu2tq8K/9YQf1ouIMOu4B0+4tAfADiJrReObbhK8IAuFu1E2e7RaSBJZZAJ7Ho6lMobw0igjWeCAmYH09A24NXNWSknhXrxc1d6o3oAGOo0NYwVzzjjsG96Otj7MnXe9/GysKPyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751661521; c=relaxed/simple;
	bh=sAOT9xgfZZ5FIJ38YEusCxOY+xjnc3VbzrZHTmVeXBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CTM6mPdBeWNee+pLGEZ+Jb+iANf75aCgV1d087LDLIEqwU7qOWOqkesmpfQn4+U8vVe9Ltgf8APKPQe+kKMBDirtrP04WlqlzUdYAy5hxuxMh/sOMAh08VwWpDcddk/uoBbdkH1Mzxw+lPKOuFS3i68GJnGsR7IUM2J7FJEicIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OFnh+3xD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OFnh+3xD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751661517; x=1783197517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sAOT9xgfZZ5FIJ38YEusCxOY+xjnc3VbzrZHTmVeXBA=;
  b=OFnh+3xDT6jVuS5dSukCU1eQGEESvWXWfWqIA5sRGfrXUMVnMBVg9O3E
   kQmsF1tU27InA1sw99gCAdQAM/THYbiw7uOp1JT+w0GSMojUFGfAtyOk1
   qb0csHJl9z8dEIv2OqemEXTyRIY/yEtNBRWfnInaxgPIqJOT51RW/yZe8
   DAeUawuNU0PcmZyhRRZpc7sObwszgvE7h8x/yAXkLLCzmDcE15AROPjut
   3sOnNs/wYELnM1D0+VhfP6SjRerwYpixOQ0Xs6d7+d5XB4QjOejnYKB5A
   lOTHzgDoXlpDgeVQXQmWb4KY6NbX2hzcm8o+BvhyLvZvfGHYyxi8llsmG
   g==;
X-CSE-ConnectionGUID: FxYtubPrTD2XROn3QVFixQ==
X-CSE-MsgGUID: TMtp1apMT4SQBIJouoZZwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="57661227"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="57661227"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 13:38:37 -0700
X-CSE-ConnectionGUID: c77tPT22RyKeH0HGe9q1Mw==
X-CSE-MsgGUID: itfxpeGeQ2WB+fuFtPPyAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="185733383"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Jul 2025 13:38:37 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXnB5-00043j-0z;
	Fri, 04 Jul 2025 20:38:35 +0000
Date: Sat, 5 Jul 2025 04:37:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-01 5/5] error: unexpected
 argument '--blacklist-type' found
Message-ID: <202507050426.bHOJb1JC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-01
head:   30d792b263057572ba3d5a8988429012aa27c972
commit: 094981352ce27bc36018c009d07ddf974c9725f5 [5/5] x86: enable initial Rust support
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250705/202507050426.bHOJb1JC-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507050426.bHOJb1JC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507050426.bHOJb1JC-lkp@intel.com/

All errors (new ones prefixed by >>):

   ***
   *** Rust compiler 'rustc' is too new. This may or may not work.
   ***   Your version:     1.88.0
   ***   Expected version: 1.62.0
   ***
   ***
   *** Rust bindings generator 'bindgen' is too new. This may or may not work.
   ***   Your version:     0.72.0
   ***   Expected version: 0.56.0
   ***
>> error: unexpected argument '--blacklist-type' found
--
   For more information, try '--help'.
   make[2]: *** [rust/Makefile:301: rust/bindings/bindings_helpers_generated.rs] Error 2
>> error: unexpected argument '--size_t-is-usize' found

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
