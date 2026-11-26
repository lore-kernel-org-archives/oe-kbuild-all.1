Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719093;
	b=Wk7ijMutRo1KBrCvQJfAHw2LS5+RJbpCXHHCj2yNoPYtJzWvvjmzNYN77X7GxDxcqYfp
	 MXcIH7JcmmkZxP0mUfka9gTEc/IaCRuakhdpjKvYXcG50vjrCsnaHcVIGYkUJ9GZfqIYA
	 C6dkGDhyuFIKJsGK1SaECuCP3i+P+rGrv7HzBEXn+2Gtx4dY9dQyRzQkD4lMEfGhGNE/O
	 XomCHnVslyEW0vjnBZ7tFJBU8qtaC4P6p+KbCMNO7CcHwtSwiB68mYQGGZguPlJuBBeIr
	 c+KgFPoXZx8l1tcnSUJk3LQw5gxWwTTkaBrjDlhA59VbIkHpOabVSMZzkhLFNpTAX8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719093;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=CJm9hFWia6CJuWBy6R53wrFN8Eaelb3LH2SK+5WIoW8=;
	b=UKADFbTciHW2pY2G9MTrjrNJzcwU3jHJ46WCQYz0oV7IbAVHuyulXdgkW6TM5p2Vwpbh
	 BgO+yi/WOAc69ucpizv2CNUFKjNNqU+iAu03HNydsHgO8CRbkudk2qg6DcrS8bTcG6OUJ
	 6gDtNUL8Cce0gpK8DZptz1RlYgpPMoX2eREK7Dv6a+s+IIdl/5Fr9IZGxJCL3PW7ReBn9
	 xguby+CHj1ToXupngP+rgczbpOImoKor7PT6NeW4skmT2Q4OASbIWek+UegzJJosEBFMy
	 DJUdc0TBYclWtG6dQO5Gvnm+3JUgwSLjXmQpRAiy4NkMCzKKPd1zvwG998MBy6u/oWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hlAkf8Qy;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C932606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 18:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C932606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hlAkf8Qy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795719092; x=1827255092;
  h=date:from:to:cc:subject:message-id;
  bh=PSSXDN/qgVxpZE+6jP2ML165jQVT+LEWGn9DNaKcuR4=;
  b=hlAkf8Qyc1mBuPaXsFjR7ixgzhYHYeflTkYJgeqycewT+5/UY+9NPDlr
   Fj7PXMzFONDuk7aEJ5x1aY2f2X1uB588y3INbp4rpeEgXAZhBFj7Dzq3g
   N8YdP7jt+VXZautCi9YOhewD6BKtogabCUfMxKwHC3awhpvrm1W4CJgfL
   jpD2ABAcGvSfYhnIXpV6Q+4Zsya2DH/fVsx3/x5wkOGtAcAfDbLgdoT7d
   TJ3p4mMhTjPynIpdoU5Ir8P6P8Pa1YZADk9du16t1RH0HyhcLGaLtoNwI
   1IQXlzCQKOFZf8lLWgCO19wKAcCrfMQNYCsbVi6z0ONzzB0ABoPrwSV6Z
   A==;
X-CSE-ConnectionGUID: AbJ414riQiygHNNGgN3Jcw==
X-CSE-MsgGUID: YnQIZMyHQQqsxALjJkEoBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4524858"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4524858"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 10:51:31 -0800
X-CSE-ConnectionGUID: tWz+ZLRjTPy4hhaBOUWJwg==
X-CSE-MsgGUID: gBJA2k0pTQepqWZMdLIBBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12238647"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 26 Nov 2026 10:51:30 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWeZ5-0000000009m-0bma;
	Thu, 26 Nov 2026 18:51:27 +0000
Date: Thu, 26 Nov 2026 19:51:20 +0100
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 7/50] warning: unresolved link to
 `mem::forget`
Message-ID: <20261126194411.xd5vTrmL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   fc24f7e1a3f10a336872c79b3772930633b0205c
commit: cf701c5eec7a0ee9e9f6b28a60be6dfb2d6d9b16 [7/50] rust: alloc: vec: Import .drain() / Drain from rust library
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261126/20261126194411.xd5vTrmL-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126194411.xd5vTrmL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126194411.xd5vTrmL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `mem::forget`
   --> rust/kernel/alloc/kvec.rs:822:11
   |
   822 |     /// [`mem::forget`], for example), the vector may have lost and leaked
   |           ^^^^^^^^^^^ no item named `mem` in scope
   |
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
