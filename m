Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055F71CAA78
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 00:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792023702; cv=none; b=g9K5QiOLBKEnz3eEbI1OfFWTTQgITmazyFsq+BnEamAX7N6xaDbzUvxxc7TtDctF717eQVrpD00Yzy3Yd2gG7/XRSVlTirTTS6uzO74Ks6FHYPhOn+j2vjPkkn1wmAYvr0MInmVuAkXWFTI5VPQrxq5iA6xhTyb9xcRsERhu1Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792023702; c=relaxed/simple;
	bh=G6/lbJ1HiIjOGBE4m4BVWXI3ofDamwY2Vh8z6AoxKRU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TNkldDXWrABt2//xfsh13PmC9Vkad5ZxSEMU5c6PmYYYNM7qht3LoW/LXxheY24alH4xUwyPAqWX4n8fWN1UsNZS4s1n7sUCxKLCIZOSAzYuVCHYYEl0yB34Sm/+5zqvZN9S/7nj40O4GEKRF/HuU+nNSFJf8bCQAZgQVuSH6tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k4520rjB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k4520rjB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792023700; x=1823559700;
  h=date:from:to:cc:subject:message-id;
  bh=G6/lbJ1HiIjOGBE4m4BVWXI3ofDamwY2Vh8z6AoxKRU=;
  b=k4520rjBMTB85Ei9JMzUbuOIDJpRdbsJRu1wnG0aCGjzWpPg32SKb7HH
   MQuilgRyQZ9nkUYF4Hm4NyIaL7yfZGOIzdu8yfF7yg458+UGndMA3wXzW
   J4GeG3irjZs/qLogh5pKjc320qzsnCRoYKAD/y41r5l0IoitWaRZmLExK
   HXdWfkcTytxWwnJXfhqa2KPvPpNGJiF2M5+foUcoaNqNuC6J0mF0URQJP
   Wu/rWw+mSaYgc40Nn2prdUNWnOknbuvdridTHd7QOiGc9XhJIt3Qzh6a8
   aB2n+RSx1AE789hg6iGSJSv+CNTyaNBg7SppT5XLRsgYQsWhGA+y9zL0E
   g==;
X-CSE-ConnectionGUID: BaOhFfk3RDuHGMTL5eYD2g==
X-CSE-MsgGUID: gFBrZ8m6Q+OFxSKUJzcIJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="889454"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="889454"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 17:21:40 -0700
X-CSE-ConnectionGUID: /SeBAKDHSfOdN9kfDcFLaA==
X-CSE-MsgGUID: iVJHJyteTJCY2keExV6yEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1569853"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 14 Oct 2026 17:21:39 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH9E0-00000000BSB-1YV9;
	Thu, 15 Oct 2026 00:21:36 +0000
Date: Thu, 15 Oct 2026 02:21:05 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-06 7/7] warning:
 redundant explicit link target
Message-ID: <202610150221.Uae1ZMN6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-06
head:   d463a34c5b280147355726f1188b49064527fa9c
commit: acbdc23728b15c406133ca2e2cfe90ba377d61da [7/7] BACKPORT: FROMGIT: rust: sync: add const constructor for raw_spinlock_t
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261015/202610150221.Uae1ZMN6-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150221.Uae1ZMN6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150221.Uae1ZMN6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: redundant explicit link target
   --> rust/kernel/sync/lock/spinlock.rs:29:40
   |
   29 | /// instances is with the [`pin_init`](crate::pin_init) and [`new_spinlock`] macros.
   |                            ----------  ^^^^^^^^^^^^^^^ explicit target is redundant
   |                            |
   |                            because label contains path that resolves to same destination
   |
   = note: when a link's destination is not specified,
   the label is used to resolve intra-doc links
   = note: `#[warn(rustdoc::redundant_explicit_links)]` on by default
   help: remove explicit link target
   |
   29 - /// instances is with the [`pin_init`](crate::pin_init) and [`new_spinlock`] macros.
   29 + /// instances is with the [`pin_init`] and [`new_spinlock`] macros.
   |

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
