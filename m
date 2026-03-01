Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ECB2E7F11
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Mar 2026 18:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772389261; cv=none; b=dtU0ENDNJzi5ctUSH3ejF+MLKq4/Vs9M0MFXCcHmHkonXlGXAFnzybp56XCF44HvgGwje5wMyYLm17Ft/CJVMEC6/sgphsFKbbEAGuYyLaOdZHdHhFxVv5dHlzsC+7KQLOipcJzJhViBZP7J3J88bpI/VkaPSWb4p1bw7vnqUH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772389261; c=relaxed/simple;
	bh=Jk8zmyCPhhYjShiZEfVTt15WMfKEYjzAII6MOyRINrw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lOWzuTWrl1VFnPp0uEJJIdbUoB7f6FCvu8kajEkAacydxprNXSeprhoeATZh43IuSobU5KibsxrYje+GdXkdjT8etBV/QnhHMLCniBR4tOQlQc2649aNjcNynJlzF2Pp2ZXHa+VTxOp2Wa/rcX/F8kzqsBCyDn5Hjplh5lJWzJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwT2e7vx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwT2e7vx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772389258; x=1803925258;
  h=date:from:to:cc:subject:message-id;
  bh=Jk8zmyCPhhYjShiZEfVTt15WMfKEYjzAII6MOyRINrw=;
  b=dwT2e7vxQJT5htX8Tsd0AnhSSqks+6lpOmqSOP3z00Zh/8SQkD/zb+NE
   FetisilCNkXnLb4FlPuRxsYYamMogpwahi0uGDzPTM8BIMelafvFLaQd8
   CQKVAF7T2B+ipY2AIlI3VKUALbCW95ODrCM5+fxW/rtHDXRch3kxYCEU2
   K1BR0V9Qiug60VmRW+LknYNpo1adz6P12BLR9Apb0iZB53ywTGp7bi5ND
   UVjL7dfwoeQiXRuTpy4ISt++iJy4P2BIMGSAKXeKPNASpl+faCDurelhy
   M0z6qCgkCmSE/Fy+T7if1z4qrIGyUUN4la8ymu0HLwiBVcBRCT3i3Rd7u
   g==;
X-CSE-ConnectionGUID: B11RT+5eTlG/70dBS4COtQ==
X-CSE-MsgGUID: z/OFHIC6SfitMGoOKbzkFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="90802517"
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="90802517"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 10:20:58 -0800
X-CSE-ConnectionGUID: wgbxZ5lHSe2KnS+hWXmXUA==
X-CSE-MsgGUID: EDFjjh2ST+OYwWehiG/iVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="217320535"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 01 Mar 2026 10:20:57 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwlPS-0000000012b-0SE0;
	Sun, 01 Mar 2026 18:20:54 +0000
Date: Sun, 01 Mar 2026 19:20:48 +0100
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 17/57] warning: unresolved link to
 `mem::forget`
Message-ID: <202603011925.7VmLroaq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   01c00561a643db1264ba75e8b464a87ec2db6126
commit: 59f3ec049634f1b22d7d6078e833fb5f21a71c84 [17/57] rust: alloc: vec: Import .drain() / Drain from rust library
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260301/202603011925.7VmLroaq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603011925.7VmLroaq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603011925.7VmLroaq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `mem::forget`
   --> rust/kernel/alloc/kvec.rs:768:11
   |
   768 |     /// [`mem::forget`], for example), the vector may have lost and leaked
   |           ^^^^^^^^^^^ no item named `mem` in scope
   |
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
