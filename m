Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D4C54706C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 00:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791331437; cv=none; b=RjpRrWHQ67UrA1fY1+3QCp5dBIMOWgMrSVnAatx7vVFgqfvWLsvPg0FHneBUG9x6S4Jz8aZeHWjvu/xLUbtJQCc7hse/2XoyUwQZdQAs48T1M2uEP7Zk8AVIwagRjfo4E72siY17AFExqSb/ZEyRBIiRk4fkD+CxOoRoEn97a4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791331437; c=relaxed/simple;
	bh=V8LQFNKOF0yunr6gaSWVDoXwYOM2Q6AOtjdRAl5Ayfk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ienTOCaQeNG7qOL4Uu3ovZOdSzTnteJhHb2nEQbXF1xeKJcRM28YU2SkevsHU6pznEkOf8JvEx6cI18B/K6sTVTicrLnNaDw6YzPmUb+fFSZ4eLO4xgUymcxcvm9uuCcz6t3kiPjU+VVPCW/v2XZdNIcqKELGVdpFjcsiik0tFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMj0Yfe0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMj0Yfe0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791331437; x=1822867437;
  h=date:from:to:cc:subject:message-id;
  bh=V8LQFNKOF0yunr6gaSWVDoXwYOM2Q6AOtjdRAl5Ayfk=;
  b=gMj0Yfe0oIZKubiGAUOyhH95nQx1ervcjep3xzVYj1QwkPmncFh8P0IA
   Y8uCk1OaHBek+yB2hnjyqe04mPeVExhggoNwhD21Vxb+W1SysfK0EkJvH
   UG3LAikUs5IGNL4vlqnNXUZiIciTgFdpCSnmcfbQDlts73j02xyUzdp88
   /U4z77cKC0OAf5+GEfvmRRliF6Twm0vUhZ2RuGAARbgKPsq3Ddh/0cGG2
   IA2GhdonYjKYVVQKI38kQAH07tDg8EOH0pQwEgtEtxgIsswf5N6cf7Qld
   p6NEIDobddeuErTeY4wHvpkpDP71AVKOliZVl4H/b1J85ziFwZAKhV4Se
   w==;
X-CSE-ConnectionGUID: W1qK1d7BQQqo5r2HBtHdCA==
X-CSE-MsgGUID: dSkiaEKZQ1iDwFHzw4MG+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="75025"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="75025"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 17:03:56 -0700
X-CSE-ConnectionGUID: lfKw4kNXTBOM1ORX9pY4NA==
X-CSE-MsgGUID: MLLYJlIDRfKhIbG+9noRyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="275941240"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 06 Oct 2026 17:03:55 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEF8S-0000000025z-2dG2;
	Wed, 07 Oct 2026 00:03:52 +0000
Date: Wed, 07 Oct 2026 02:02:58 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 15/15] warning: doc list item
 without indentation
Message-ID: <202610070140.sH3CUw0u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   efe665b77332621017fded6de1496bfff20ae5c6
commit: 48ef7b6577ae7f1eaa95f9de4dd657ca1763954e [15/15] ANDROID: rust: Read-only sysfs support for module-parameters.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261007/202610070140.sH3CUw0u-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070140.sH3CUw0u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610070140.sH3CUw0u-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: doc list item without indentation
   --> rust/kernel/module_param.rs:114:5
   |
   114 | /// `ModuleParamAccess<T>`.
   |     ^
   |
   = help: if this is supposed to be its own paragraph, add a blank line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#doc_lazy_continuation
   = note: `-W clippy::doc-lazy-continuation` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::doc_lazy_continuation)]`
   help: indent this line
   |
   114 | ///   `ModuleParamAccess<T>`.
   |     ++

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
