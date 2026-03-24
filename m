Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0FB38C2CA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 12:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356796; cv=none; b=eOTMNrQszk6v6Tlru9XTZQck16sk7+K+uCiRBASmV18pYkcQwN/wLiBOyu/GtFdXUZ8ARdoTtkce+Jz0V3A4NcqChzHRmZ/5ItXQZYIN2aFycwl1rG9B8ju/muSmi32+oYcgrwcBlh1/97sJW0Uh5Y2Mbvfu5BKijGHH5kUVVnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356796; c=relaxed/simple;
	bh=SidBc3+wwESDlb4vTI/IgseuqJCGALMx23QQtEsAuG4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZTTIHAv5X24N2GJVjThgx3O2m5gAgud4zgTyZsKJoIZvU/R9WbRscHnf15ssha32ui6q+MwGpJHjTU4Ex0QtQGvRqVZrDC9vqmFuTX/QJa/ClVRTnRQkNwCpjISXAwDZ4BDY+GiixC3ZtgTF1ajb0Bd6z67X17qeANYfUGdH5wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mlw34dUc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mlw34dUc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774356796; x=1805892796;
  h=date:from:to:cc:subject:message-id;
  bh=SidBc3+wwESDlb4vTI/IgseuqJCGALMx23QQtEsAuG4=;
  b=Mlw34dUcuJ/dRo/pK+PvEsCmERTVzKqmf68IDH2jQVRV2yK64HI1Vz8N
   SFfQkSZsKetfgE2oCouK0bJGAe8FxgpdFQZlFNcRvxb9BcLIBVptMxRl3
   PNMQbPXr8BZl90i6L5snmTYtLUyteoLVE1Bsz/VCQNVCkNTyV63Agw01j
   ywfM/QUMgNLMe+APcp8S8IWm75XUlIk2mz8rI6hXHrKVJ+xHeb8yXanDZ
   9E69LOb9XS32gLva7lXFphbrQSWUJKg/rtNTD0Hqom6bdnH/VQ0cDG0Kv
   oMdW36iWHndeqnS8FQi+5RiDk9bvNQxJ0ecBVp8qyu3/ArsmeAUYI6PRz
   Q==;
X-CSE-ConnectionGUID: pQYxz50tRNyT3Z6P+gtxgA==
X-CSE-MsgGUID: Kd5bQs90QoGd1eAF88/s3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="77973223"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="77973223"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 05:53:12 -0700
X-CSE-ConnectionGUID: kH/oTPobTvqxLqSWojYs/g==
X-CSE-MsgGUID: tvCuP9fqR46wBJ2idLMkng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247422645"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Mar 2026 05:53:10 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w51Fr-000000004ZD-3otm;
	Tue, 24 Mar 2026 12:53:07 +0000
Date: Tue, 24 Mar 2026 20:53:07 +0800
From: kernel test robot <lkp@intel.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>
Subject: ld.lld: error: undefined symbol: __bad_cmpxchg
Message-ID: <202603242052.Jw9rpNUe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: 164e4b5600b32b4ddeac58bb5b37bc1490a1dce4 rust: helpers: Add i8/i16 atomic try_cmpxchg helpers
date:   2 months ago
config: arm-randconfig-r064-20260324 (https://download.01.org/0day-ci/archive/20260324/202603242052.Jw9rpNUe-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603242052.Jw9rpNUe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603242052.Jw9rpNUe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __bad_cmpxchg
   >>> referenced by helpers.c
   >>>               rust/helpers/helpers.o:(rust_helper_atomic_i16_try_cmpxchg) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
