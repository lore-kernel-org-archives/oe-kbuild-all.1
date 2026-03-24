Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0677C3CAE92
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 07:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774337379; cv=none; b=aw07MmlvOIj3yUCvkc8yBB+9dO6PAdB9AXe8NKdU0OZRmqLjfk0F/djMqtAuXF09/jpukjTKBtAV0NovVmcYoTvpAB+Ao8J7YNqEY8RRFHptzeguzAZrqkp37kvtQ3zoluFAqXszR4VtAw59Gak4JUXDmNRmAg1X/RKQmulZ2BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774337379; c=relaxed/simple;
	bh=Ioa30xAHMdOVcu8s3ASXI/cggI1C5ChLpTuGKPoAte0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kDix7Bb/f/i0CXwAi0aEkVbCS74QXmkLHhfiTJ0xcWFniUYE0WuK5H7Ls1dcO7zGUQ34Dndpi8kgdkzBiZ+GyU228m8AuZOzprfG22PQNYULqopvcEO6eAwmR8cNVlJzwH58yWdB0dy2TeB4Dx5WG5o5OOKGXgXUh374OR3bdXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gVumOpDe; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gVumOpDe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774337372; x=1805873372;
  h=date:from:to:cc:subject:message-id;
  bh=Ioa30xAHMdOVcu8s3ASXI/cggI1C5ChLpTuGKPoAte0=;
  b=gVumOpDeIFVQXDBxwQK9j8ALakcXPskdjdFcuG3FpmipuHBz3VC8WdHo
   L8HctdaKOZwNwNgsny39dPQR+1t4lb/DIzdP4W6jSLrNrhWp4O3flo/bd
   R4X0tHpqi+ZoB8DgWnhGEpP2UzfM1gymDtPLk8gL5FfYa8VtDCSOLW7zo
   mJCzdRlY7UPeVeROdwwHoEC3pwjBrKaD7EhF9ZybkbqPpIIi73blIAQnK
   hhvQWG+rp6FKONcvF+DpXYjF9Bn3UZ+JPRHOgd8510GMyxcupZrEz93Wd
   cF0Nl+GNbevlI0eKOmjbXr/0C7T6mo5qTrB3CYqi7hSG5b0vc8nmAZYhX
   g==;
X-CSE-ConnectionGUID: xRv/40J5Q+S5WYDNPBOmtg==
X-CSE-MsgGUID: hMxrZlwUTy6wppHIHDWZ4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86043499"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86043499"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 00:29:31 -0700
X-CSE-ConnectionGUID: OcXI5ZQVSV2K7Hzc2mf4kA==
X-CSE-MsgGUID: lwdHUBgFTo2TjpHI5Aa9yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="220942394"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Mar 2026 00:29:29 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4wCc-00000000491-0yNW;
	Tue, 24 Mar 2026 07:29:26 +0000
Date: Tue, 24 Mar 2026 15:28:53 +0800
From: kernel test robot <lkp@intel.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, Alice Ryhl <aliceryhl@google.com>,
 Gary Guo <gary@garyguo.net>
Subject: ld.lld: error: undefined symbol: __bad_xchg
Message-ID: <202603241515.r4UkDrTF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: 5dbc0a692459bc49cdb7add281086291da547750 rust: helpers: Add i8/i16 atomic xchg helpers
date:   2 months ago
config: arm-randconfig-r064-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241515.r4UkDrTF-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241515.r4UkDrTF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241515.r4UkDrTF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __bad_xchg
   >>> referenced by helpers.c
   >>>               rust/helpers/helpers.o:(rust_helper_atomic_i8_xchg) in archive vmlinux.a
   >>> referenced by helpers.c
   >>>               rust/helpers/helpers.o:(rust_helper_atomic_i16_xchg) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
