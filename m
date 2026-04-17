Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9971A6817
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 06:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776407332; cv=none; b=tPWuPiS7cHdK53XVxQnsSbyTGjkqBHapea0I0NK0q++kq+Y8Clp+R6o4eTxBmuYwVsWFxGxCAIZgloLNqIZbIFEOJfY8K7SlRGMwTXISDGwv5GEqdk3hP0gg+o+IyyKVQI0rbXzfGA34+hodT9q1ZMNXElC4qxnQ7hEXCmIofKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776407332; c=relaxed/simple;
	bh=kVySbw/2E0vMffuz0zwp7mqgc0MXobIpwyVOn8aKGc0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NmEVRUPIi0gGeKIxoyFbX3XwvOb1IhTHK+tPSG3meY6posf0nPihGNERkJcJp8DQlAbI2pXQaz0yWv4zyzsl1edYRgpaQX5F1B5yJQYm9e3Vl+Fgx7vLS4UDNjPDuzxpTGLLVuQgXSQS1KQ3lRi/eUngj6o3CSRvuiPqylLNotg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MavbOIGd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MavbOIGd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776407331; x=1807943331;
  h=date:from:to:cc:subject:message-id;
  bh=kVySbw/2E0vMffuz0zwp7mqgc0MXobIpwyVOn8aKGc0=;
  b=MavbOIGdAQ7Opt64ltOW2gu2t37O+koQ2i5rtpxqGvMf/+oO/q3leSo+
   0s6aQhmycIyx+6c8bM9J59bRuMExPlS+PPaiiidu1fcw8X+bcESb5a61x
   TtGLzut85nT7l2BUnrWixnOemdW60dS8huOoKKTLX98LyTmObTCT6c5fb
   vcJQ0dCMn7Ummc1rUdMR/Rj4dw5IfZ8QU0xJD+KOQEtTC4mxjIcPELLms
   SthMAjQnncxCbzkK0MfApVtAW9yajL1JG6dW+IUouboVezDTkN9glhPYw
   HR/7iilUgNLhnNe9JmlG+fj2CVduUoMMxtOWiTsENtQ47vWCAqV6qt40s
   w==;
X-CSE-ConnectionGUID: yuw2wenNQ+WBjpWuvTUnfA==
X-CSE-MsgGUID: aXHVNHbsQ5qxmMGBx3EP9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94987334"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="94987334"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 23:28:50 -0700
X-CSE-ConnectionGUID: KPR/ntjaSEKSVo7QP30iZA==
X-CSE-MsgGUID: JO+uoPP/RMqSA149mCwYBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="235329367"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 16 Apr 2026 23:28:49 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDch4-000000001FR-1PCH;
	Fri, 17 Apr 2026 06:28:46 +0000
Date: Fri, 17 Apr 2026 08:28:43 +0200
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 33/69] warning: empty line after
 doc comment
Message-ID: <202604170807.762YaT4c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Asahi,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   234b16b06a9869c5885af57b2853412e854c1216
commit: 2f81b76e1f5012427112e3a13b5dd44ef6079e84 [33/69] rust: Add Ownable/Owned types
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260417/202604170807.762YaT4c-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604170807.762YaT4c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604170807.762YaT4c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: empty line after doc comment
   --> rust/kernel/types.rs:452:1
   |
   452 | / /// into a &mut T.
   453 | |
   | |_^
   ...
   458 |   pub unsafe trait OwnableMut: Ownable {}
   |   --------------------------- the comment documents this trait
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#empty_line_after_doc_comments
   = note: `-W clippy::empty-line-after-doc-comments` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::empty_line_after_doc_comments)]`
   = help: if the empty line is unintentional, remove it
   help: if the documentation should include the empty line include it in the comment
   |
   453 | ///
   |
--
>> warning: unclosed HTML tag `T`
   --> rust/kernel/types.rs:447:53
   |
   447 | /// A subtrait of Ownable that asserts that an Owned<T> Rust reference is not only unique
   |                                                     ^^^
   |
   = note: `#[warn(rustdoc::invalid_html_tags)]` on by default
   help: try marking as source code
   |
   447 | /// A subtrait of Ownable that asserts that an `Owned<T>` Rust reference is not only unique
   |                                                +        +
--
>> warning: unclosed HTML tag `T`
   --> rust/kernel/types.rs:451:71
   |
   451 | /// When this type is implemented for an Ownable type, it allows Owned<T> to be dereferenced
   |                                                                       ^^^
   |
   help: try marking as source code
   |
   451 | /// When this type is implemented for an Ownable type, it allows `Owned<T>` to be dereferenced
   |                                                                  +        +

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
