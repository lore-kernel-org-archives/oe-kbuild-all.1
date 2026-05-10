Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC57817A31C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 02:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778380299; cv=none; b=TiKhWcuAq/ZLjOTbO0VYyHuFaAUo8xqihLJwCxXvpRYcld7QA98K7kFfiskhJr5po5tqfDv4lovgtbO4nQDO+/PBmq7kLV95QzLJGjw6/rMBTS0SCIT9N/Hn9/lxxoczaJPLnUFWM+/sCk0Wimy0SUWu8CYyq1/L3MPrjcWv0l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778380299; c=relaxed/simple;
	bh=gI7JKE7aEIiaqqv9SCFYevqTXP7GfZ1IWnDk2Q6utY8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fbtwP3utTrykgHYvtHBJQfDso86E+t7XGA06B2X8JHIjpfoIY1YUqSwrWuS2YEhN/XjCQnyx5yOBfntGwgrAWE+qOZQs9xLGYhWCPW4nTX7JLbge39sBgBi5uvU+CA4Z8jLI+VcUVqSmAvSoBdk+h0G8/bwHU/1I2IHSoKWBpZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFWLY1fP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFWLY1fP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778380298; x=1809916298;
  h=date:from:to:cc:subject:message-id;
  bh=gI7JKE7aEIiaqqv9SCFYevqTXP7GfZ1IWnDk2Q6utY8=;
  b=YFWLY1fPQird3E5pjteInJhtfaOB8UCPM7e31dEVXILAre9LXFpm0lte
   vp/vn52quAguh9/vYtImUFCGLdrWJtk+fnp6WtGT8r+dgpjdiThPme4oq
   GYm6sH9lR0OYDl12vOXHZom2HQa235k6EJyZkB8dPAcOuPbPaqbopc3NY
   yrf0e1IIBb3RYvzk/q7f2tbJAj+oOkFbYjXM3FmPSNZmabonTFZ2e8FQD
   /SaFaMqkI5972yJ8xEB4b8RjKT0H/ErsxuT1IgIzZvht0ic7sS59BCiNN
   fxKO+ANsWa5CdaE9pkCZ3MPnbMRPtuVtcHfVWBW+KUT+gGD++2kFoH38N
   Q==;
X-CSE-ConnectionGUID: lFMd/ArhRemYIHb5D1ubmw==
X-CSE-MsgGUID: D1WVb+cMT8GveM6Ug/LG+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79298041"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79298041"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 19:31:37 -0700
X-CSE-ConnectionGUID: tRqoASkNSSefDMBNPjnC0g==
X-CSE-MsgGUID: YIgKleikSXSDkbrnn2ubrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="241476954"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 09 May 2026 19:31:36 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLtx7-000000007cb-3RRE;
	Sun, 10 May 2026 02:31:33 +0000
Date: Sun, 10 May 2026 04:31:29 +0200
From: kernel test robot <lkp@intel.com>
To: Manos Pitsidianakis <manos@pitsidianak.is>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: error[E0308]: mismatched types
Message-ID: <202605100401.PlCS1gbE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Manos-Pitsidianakis/rust-bindings-generate-virtio-bindings/20260510-065643
head:   a25d668ec4129a65754764e284aafb8a1f9163ec
commit: 0c5d294022a3b14aa323a16b91c0528f42d73175 rust: add virtio module
date:   4 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260510/202605100401.PlCS1gbE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100401.PlCS1gbE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100401.PlCS1gbE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0308]: mismatched types
   --> rust/kernel/virtio/virtqueue.rs:45:19
   |
   45 |             name: name.as_ptr(),
   |                   ^^^^^^^^^^^^^ expected `*const u8`, found `*const i8`
   |
   = note: expected raw pointer `*const u8`
   found raw pointer `*const i8`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
