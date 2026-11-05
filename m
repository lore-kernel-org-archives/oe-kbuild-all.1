Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915215;
	b=AeGTLn+nrNz0hr49y+aiO01OGKbZWMtJHf3HkKNFrb9zlMtwpjd96NO4KwVdAhtp7m4K
	 txfdcKXa/cFDhhVmuOe3vqFrOEX1nf6qdlgXlUdPlWt9qjJAXppSO10EqpuscnNz06xl3
	 0MDpsJ9OcnShEtun+RFdCx3TWq3eWxJVEutVTQE/U8v9n+l5bcSqXk+H0Q6dgAVGLpKBR
	 CDNwaFekf/eyOG+ep6GFrrYoUQ0f80d5HSkTM+Mga/HtwjvP4BKYTEl0maL5cT3gW9A/U
	 9jE/y+OWXL10pKCphIFFgNdnmsQ/8yfTPTi0k9MRTr42Xj845yZY6bYJvA4iDkNwmtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915215;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Ly6mCVCqWii6VQbaLfcU5M5i1vNl/2yp1T6vVTiI57g=;
	b=DLCgOoKe2R52Xft4PR8DbYNke2QS5iJCFS57Pz4Pk5ljDGrddvEBaT/zbwNLkTLJFlui
	 PZ8lIf/t4/clmldENorIHYW06riLstqzMU6oUXXyOeQdlgECOGMWkRrU1f5S4c7v2QJGP
	 mOGrtAr7U+7vjEpWZGWvsXM5wa8MRsknLeV8ljA6yIX2h22V7a4AzylX/4LgSCqSXVYmC
	 tqOfAt0XW+caU2bSsTbVnd+TJ7Jtvqf2GrUqWSV99nG5tqbBsULWjpnrg0oBL/K4gMdKz
	 IHcmTT5X66Aw20H19adLTbXTDHoNWUOmRlTqtA1IMtwIhJEDWel8DQ5XuU9ibOsTP+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pl6fwaxq;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D680B606A31B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 21:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D680B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pl6fwaxq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793915214; x=1825451214;
  h=date:from:to:cc:subject:message-id;
  bh=ZPoh/QYmCABz2+oFT9fd4Xv8DN25knfPuPIGrF8NcA0=;
  b=Pl6fwaxqVMsBwebPdJKQ0jAmpZn4fR/DT2XPr4+drFJwnFEJruNZ3YSB
   UB2Nu4OalGxAY87Ql8a39vkXFlxoCeYsXwID0lfOolE3ypKmqL10Phurj
   C7F/87BEOqJ4czxxYhdjahDczXJpxeoislF2Q3G/KLcq4Z6WRy6PK2oZl
   lcZ5IXPAH4oZKI902Qdoq79ka46RFqzD+HugUxODMpyHMUODonwzeB+KC
   OU/MpyKAYYJLSOhGOae0rFSvYqNhFAflbfBsk1E06L8qdjfiUxkkVJoE7
   L1MtIwHxbxUdZTzXkwbASVZKKOawp3VpgcOrnA4CxKX9Ep5tNvyNIHRLd
   Q==;
X-CSE-ConnectionGUID: OocDmhKEStCYmFlkGGwhXQ==
X-CSE-MsgGUID: V0tBSbBaQWG1pX3LZ8pGhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2608438"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2608438"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 13:46:53 -0800
X-CSE-ConnectionGUID: Iacfi1QpRmm+OquRml4bQQ==
X-CSE-MsgGUID: enA+Zn2SR7KVbcDtMm1S7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7244907"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 05 Nov 2026 13:46:52 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP5IH-000000009oN-00g2;
	Thu, 05 Nov 2026 21:46:49 +0000
Date: Thu, 05 Nov 2026 22:46:23 +0100
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/sound-rust-v7.3 6/56] warning: unresolved
 link to `try_cancel`
Message-ID: <202611052232.yMW005rX-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/sound-rust-v7.3
head:   070444a8abf14da700680a5331d0a95cd11e578b
commit: c3689bd90a621f170b38c269d1c78881a5c54cac [6/56] rust: hrtimer: add try_cancel() and cancel_or_noop() to ArcHrTimerHandle
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261105/202611052232.yMW005rX-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611052232.yMW005rX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611052232.yMW005rX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `try_cancel`
   --> rust/kernel/time/hrtimer/arc.rs:71:16
   |
   71 |     /// Like [`try_cancel`] but also releases the handle's `Arc` refcount
   |                ^^^^^^^^^^ no item named `try_cancel` in scope
   |
   = help: to escape `[` and `]` characters, add '\' before them like `\[` or `\]`
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
