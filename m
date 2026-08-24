Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC09E219E8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 03:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787542615; cv=none; b=gIXWuUM6Me7rOScNAH5VCChrS8VJl2fv78APowMOKenrv64AbrvSGb3EkU6kmUPL6VjmN73Wa6qQXW90aCwdFuH40+GkI3TKaNnP283w03DnyjnVGFDD54RuSsq1qufLU5J7LjzbpEFSTlt0KaT2zZOdE81gUWJmdbLjFSxq+zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787542615; c=relaxed/simple;
	bh=iK5XABe3JbZOeSRY0va2ttTePn6ZQhPVN9+BSwlDX2M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E52J0V/2uKd4+HUWFFwsKf0dK+YnaoENd1XBmR4gsYTc947r6QqeU3RU/zktzpB2JEzONMsO3Qi12ZrQYt+NX+TpDIXYNtPa/QDcL2fnlt/PpmmQOabRVOtIckivk9z84ekBhMQ4VColVefaSFYvFJfVEPtWyQtxwmPE4v2N3H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jK/8hlLv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jK/8hlLv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787542613; x=1819078613;
  h=date:from:to:cc:subject:message-id;
  bh=iK5XABe3JbZOeSRY0va2ttTePn6ZQhPVN9+BSwlDX2M=;
  b=jK/8hlLv8zKzT9f9YntVsAd5g+0pZE84hFDdHcD3vyDu8yLYHEFeyFSp
   miTVH22neNmYG7TDqw18mubxviwM74Y6R8Hy/Rj1mVr/Dyaa5D+AdMFvX
   ww6z46r/12nTpQSE3j+kuTFrdw3/RqHomtEXgJs9JEz67jkY2burli96J
   l/md1c7IGR6rOGLR1Sip1C0yQkTpNFHZtp06Tx5hml5P+xPJeK0Rtp99d
   7u2v0s7XuS23YpNSMK+G4J+nluXiJjTSDVMec6e/yw7y+BfpY7MrZvPxF
   ANwsr9AUkWOSv1jCRfqgCAeQdQxc6Ms1P5BAEK/FIp584lTDoJXdxnxxH
   Q==;
X-CSE-ConnectionGUID: +/J15Sr7QFWVoXVqq+30Hw==
X-CSE-MsgGUID: 8VYCJ83rRSW6Gd4NhnuYdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="87103104"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="87103104"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 20:36:52 -0700
X-CSE-ConnectionGUID: V0YN7reLRZqhm5CNUgqzmQ==
X-CSE-MsgGUID: 1IlEv3ohQ9ST3GY1VRMkhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="296787522"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 23 Aug 2026 20:36:52 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyLUO-000000000Fz-3NjK;
	Mon, 24 Aug 2026 03:36:48 +0000
Date: Mon, 24 Aug 2026 05:35:56 +0200
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 44/79] warning: unclosed HTML tag
 `T`
Message-ID: <202608240533.rD809Jzp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   e793b14f66e33b70363166d84886d82d462f1987
commit: 86060f3b420a65df146a3a273297049fc8686885 [44/79] rust: Add Ownable/Owned types
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260824/202608240533.rD809Jzp-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608240533.rD809Jzp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608240533.rD809Jzp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unclosed HTML tag `T`
   --> rust/kernel/types.rs:453:53
   |
   453 | /// A subtrait of Ownable that asserts that an Owned<T> Rust reference is not only unique
   |                                                     ^^^
   |
   = note: `#[warn(rustdoc::invalid_html_tags)]` on by default
   help: try marking as source code
   |
   453 | /// A subtrait of Ownable that asserts that an `Owned<T>` Rust reference is not only unique
   |                                                +        +
--
>> warning: unclosed HTML tag `T`
   --> rust/kernel/types.rs:457:71
   |
   457 | /// When this type is implemented for an Ownable type, it allows Owned<T> to be dereferenced
   |                                                                       ^^^
   |
   help: try marking as source code
   |
   457 | /// When this type is implemented for an Ownable type, it allows `Owned<T>` to be dereferenced
   |                                                                  +        +

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
