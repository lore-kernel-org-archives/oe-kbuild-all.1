Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED44F4E1DD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 22:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717798370; cv=none; b=ebBHGaaHmUgPVfxieXArxFWwYzMp20TkGdogWUYqI5N6YfZolsbBO9aiuAV16iYftEuHFdHYi6cTilZwXayqGKbEFR3dAGN45wfvxpJL4O7zXmfxbHfyBtjX6WoMPCDc3iTc1xYmEiveq76KRM9cNbw+4vZilSFk3/zvvjO5dkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717798370; c=relaxed/simple;
	bh=w/bIMg4219gtY+6FM3XBXuryH6Jf/FPNH2iYXeV/uHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X/P/wguX4C+bUkAWLnpqvL7WAghwJ31djfnThiO3MXT5T8qukL4LH2n3TGZw3NT7QByNphTJPiog11/vG+NfBzwe9Q304g4GU9mH/Mki7YojZyYe9i4m3l7tX0XHwcddVzi0uPJ1IKyaajpR6ys+VXoCPiQumgEuuA3BRGP5how=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caGjdlBq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caGjdlBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717798369; x=1749334369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w/bIMg4219gtY+6FM3XBXuryH6Jf/FPNH2iYXeV/uHI=;
  b=caGjdlBq3TAU9wj50ijoIzPK9KzK2kr7uhtohk5lFj3SNoijliAT8isv
   QjE2rsugcaE/quHzGS83gThsK5RARXz4ah19fy7sbXpGJdrnmlA9O1hkH
   3JstXxxLoQK4zQsnm6e0J2BK8WZLZtJve5OMgs4rax/QjalMn3Q8vGRwz
   LcBWYHDmupKxNd4sUiSBzGwWVAgqydA29XnutBgdxFOOeWUu65yuJGVUv
   kR6Id92k4D0c3hNf0jBkGm+YIG8MHkDEAm1qbv5wnGqN1RlMAvqjF9g6t
   iaA7PPOU3/MCTSyZR8I77vjdfvZn4Blxr4nkjVyjn9hcDOefKS2bdUQNT
   g==;
X-CSE-ConnectionGUID: qeQD5VDkTcKRhEU7d/QLGQ==
X-CSE-MsgGUID: 53Pw7QFJTcuSo9huVCv2OA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25944769"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="25944769"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 15:12:48 -0700
X-CSE-ConnectionGUID: ZAlnLiGmQ6uZBr8zBENCHg==
X-CSE-MsgGUID: ADz0wKsFRSmSu8yrLeugrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="38554877"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Jun 2024 15:12:47 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFhpF-0000c5-0y;
	Fri, 07 Jun 2024 22:12:45 +0000
Date: Sat, 8 Jun 2024 06:12:13 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 19/25] error: comparing with null is better
 expressed by the `.is_null()` method
Message-ID: <202406080658.rFrwuCsE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   aca334cdc747f90b4a1051a3e570cbfa56f10a35
commit: d6c55a922d00e9b8c575141bef2a6a072215a9bc [19/25] rust: Extend cpufreq bindings for policy and driver ops
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240608/202406080658.rFrwuCsE-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406080658.rFrwuCsE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406080658.rFrwuCsE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: comparing with null is better expressed by the `.is_null()` method
   --> rust/kernel/cpufreq.rs:406:12
   |
   406 |         if self.as_ref().freq_table == ptr::null_mut() {
   |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#cmp_null
   = note: `-D clippy::cmp-null` implied by `-D clippy::style`
   = help: to override `-D clippy::style` add `#[allow(clippy::cmp_null)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
