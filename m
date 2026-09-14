Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67543D25AF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 10:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383340; cv=none; b=gK3bnXKNvGSVc+FsPjH7ZKi5GpN296DVC94saEq+ffEp9/07lU6JYMaSQa6SJ5kwLA68n9BC43L3HVPUtvhUJbwhu/mH1ohsEPm9Nxw/6SKC+mGAXC9SUwsQIxuxIKwT+pXV1/6TEvI29xv3mZVOKOiInnUuU9jUXLcdKptE1pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383340; c=relaxed/simple;
	bh=elXc+2N7JzGRHg032RMc2BiXg5RyVV6r1KvtAa43zMg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CVJ094fgAIPRCnf9MQaOyW+2S/W2T1ZFG+3Vll74/SN3F2EH/nDOTC/6V3tSER4HpOIqazkmjyV2R0ZAji6nvYwepu6wnZEnh6z3OWfCcBebNtO4kXZ9hQ2F/yfhapkBEUfTQEWNmFbXxHh4dGPi8NyJjYekzCO8oRk9gQ5FrvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lh+DFwRA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lh+DFwRA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789383338; x=1820919338;
  h=date:from:to:cc:subject:message-id;
  bh=elXc+2N7JzGRHg032RMc2BiXg5RyVV6r1KvtAa43zMg=;
  b=Lh+DFwRADuhhXCD9td490XqMStff6Qrr6x/sYzcwemKb2szSacdhKgus
   wT040+bMLuXH2eA2qL12ctyp/3dV1XGNdb5aWk1YCk1oxfE3kTF4DHyxi
   dolfzAgjpONz7uQZ1ema5FhUus4XOauXa6g0BmCvLddDoml7xs7RoQMZd
   1eDfInhIJz/CjC9DjqI1fXUWKmfrOrVnj+6cCsHVsAvPv1LCVb9GG8zpz
   v6DN+4D2MQE6/j5kEBAexkI9JcDFyKLuhYKKNGSdzbKO/xNfMs0bpzYdA
   nfoZNHJglvov3jkkJ9BXJzrUjclVEL9esI/amQ0elzcIS2YYDeQLw3WIC
   g==;
X-CSE-ConnectionGUID: fsLElGtRRSyIugndRwD/UA==
X-CSE-MsgGUID: j9gmyeRAQmmH2Wxtk5ooEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="112503147"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="112503147"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 03:55:37 -0700
X-CSE-ConnectionGUID: bNyyu8FVRBqoruL7oTvosg==
X-CSE-MsgGUID: sWOJuXYpTwiiDHpGJaaKhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="277876573"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Sep 2026 03:55:34 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x64LU-000000002nH-1fvH;
	Mon, 14 Sep 2026 10:55:32 +0000
Date: Mon, 14 Sep 2026 18:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Eliot Courtney <ecourtney@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Subject: [drm-rust:drm-rust-next 44/61] warning: associated function
 `from_raw` is never used
Message-ID: <202609141829.CXrpuEzf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git drm-rust-next
head:   66a2c223b620d844fe26c6bd4844d2a6a8c9dffc
commit: 3f1e12fce16f6e88fbaab3404df33f65c8f4df87 [44/61] rust: pci: add resource_flags accessor
config: arm64-randconfig-r131-20260914 (https://download.01.org/0day-ci/archive/20260914/202609141829.CXrpuEzf-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 148ee2b266b73a49f1f31d0bd17d4818b91bee9f)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141829.CXrpuEzf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609141829.CXrpuEzf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: associated function `from_raw` is never used
   --> rust/kernel/io/resource.rs:240:25
   |
   216 | impl Flags {
   | ---------- associated function in this implementation
   ...
   240 |     pub(crate) const fn from_raw(value: c_ulong) -> Self {
   |                         ^^^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
