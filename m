Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF7F25A2B4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 12:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756557594; cv=none; b=Hs1JVeeTUvKPNSoA3qOLffnCyKKJbADXom9pa67MIREYNR4VvyyVZGXu5p+wgY5x+Zt8EMdsz9r/Hvk26Rn2C44Rm55c/PXskI0ozbvqjUZhwSWmXloLfRFRs0oA/9y/7+UJ5LqVH1/EczpMjE/AV1ZCyq+21GTnkJadw29AB3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756557594; c=relaxed/simple;
	bh=Opt7/s/T/mBrbqRL0LhWfGxO3kaHcnbcTAlMJEvLLjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mo0rpX7kr81Lo4Kt9k73AmErFjfLQJIuV1DEYIzFEj9h/Tn0xxY1E6JQ2qlBusRI5kF7849zwyOIBsAn3X0MelV8tx1h9PbT31VvvkEfLRqtsTuG2nv7lGLXFVBCXks+5uvUQhIXW8hooMY0ugwJmmSjbVy837CLlArD4S9N4EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EmFgTjh2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EmFgTjh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756557593; x=1788093593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Opt7/s/T/mBrbqRL0LhWfGxO3kaHcnbcTAlMJEvLLjc=;
  b=EmFgTjh2zGAE/Rfb1wyhHPlXg0WEftkaQeIx8V3zvkwNwNuGjmGT44Sn
   omuztcTyW+O5wqO18FIcOO/DkZ3Tz+YhiBfPlMfPHYe7SeOmZ7Ojne1T0
   2QGkiH9uUtl+QjAHYsBHBnW6AlfjhZi6uO/mIPzAXWAok9C4aD668NMTM
   /ngUU1fzKKgaxY7u7DrtzhuM1UWkHNxa/rWwMuAxyM8MiSSvYRP2H4TWU
   lVV6tY0SZOpbhHOZchMKQm6OXqmgKjtVYVUXhDzbwf7C6hLJJ/a0pdNl0
   hw2kR0vnu61VLEDkk8TK7NVyc9199hHE7aHB+fGcnlCWVirc6CV8FuRN2
   A==;
X-CSE-ConnectionGUID: DZl5Sj6FQw+etgTyPDeJmw==
X-CSE-MsgGUID: FZRFxbnpQk+Qsgkvw1h3rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58896472"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58896472"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 05:39:53 -0700
X-CSE-ConnectionGUID: GCV65fcjS/GnVreL41MRzg==
X-CSE-MsgGUID: CxEcfjpzRqy6sDFT+r7+Wg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 30 Aug 2025 05:39:51 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usKs0-0002z9-2L;
	Sat, 30 Aug 2025 12:39:48 +0000
Date: Sat, 30 Aug 2025 14:39:01 +0200
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alice Ryhl <aliceryhl@google.com>,
	Benno Lossin <lossin@kernel.org>, linux-doc@vger.kernel.org
Subject: [boqun:rust-atomic-v9 3/14] htmldocs: Warning:
 rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist:
 srctree/tools/memory-model/Documentation/explanation.txt
Message-ID: <202508301445.KuPDLTET-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-atomic-v9
head:   49896b65ef8ba314942e4914d8df8fa2cf598c48
commit: d71e51338aa6580b5bfd6ddb8f9053a4375b1495 [3/14] rust: sync: atomic: Add ordering annotation types
reproduce: (https://download.01.org/0day-ci/archive/20250830/202508301445.KuPDLTET-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508301445.KuPDLTET-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Warning: include/rv/da_monitor.h references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
>> Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
