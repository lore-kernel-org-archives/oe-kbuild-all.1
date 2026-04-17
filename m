Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA8131065B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 03:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776398151; cv=none; b=jZzgiB2cgm7KmMCyCqjLCS7WF0+9Ik2nhXdJLruhxJETPe+P0xiPKLcpNEXwIizg7sLqZT3MJ/TP6FmenkunF9JzWUStNg8fyPE2ig6sxzsxFpQmms5oF61Ek7rWi/7KvyDRVdRcXHME1KpIB8kTT9xuN/6la11ib5K+KlG9ykc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776398151; c=relaxed/simple;
	bh=D4P3TC1kFymj5E5lDuIwnlhFAFcf5NxipeloMxMubIM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lWyRZRFwY4W7sSgRa2W+CoZjTo6ynAg+9xuV+PAV3BkjbkcLs1xbSo/2pPmkRAqeED5tTHMj/iZO5+06WK6uBffPAfTuEMvCzf0wFlRw4KlONZl5LUtrQCHLM3OlZiZEyZQMhYX82eCawwOZ/M3RvaCUcmb98/hG7htdaFqenVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iN0vtx9M; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iN0vtx9M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776398148; x=1807934148;
  h=date:from:to:cc:subject:message-id;
  bh=D4P3TC1kFymj5E5lDuIwnlhFAFcf5NxipeloMxMubIM=;
  b=iN0vtx9M68eQFAskf9RNDpGKy7NQrB3vcPfbYMfU3KH2flPXhXNgC4nd
   pLXOhInIGIh+Y3fCtZP0ZYNBloyiHHLa2WZX0EmLiI6Gy+5g9o+lIsfjz
   q0oaj8G2lYLOJzGMhvpvQQ6kS5IPHRfhRfLQMue6ItrmWhUSw+gVOTK/f
   zx74XWR+rK7+lxoNjqBIIJXaAP5fhKa/1ornQGdxRXCbcxOMoKAyFxEPC
   rPGW4xoqFCkY08/U3L8KysBmABxc9oe7aAHbMZOfqROx7aoLJZLyML5qX
   IN8oYpwi5HXAhjO2MnZlB0Rrat30Kt0IiNXyJDpQIA7cbCkEsVotKQLUV
   w==;
X-CSE-ConnectionGUID: LuGZuOGLSS+R6H43TxpjSQ==
X-CSE-MsgGUID: urCq5N1PTPuk7HsMh5lBBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88031432"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="88031432"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 20:55:47 -0700
X-CSE-ConnectionGUID: 2sv+Mnt+Tq6JyGCEclRkGw==
X-CSE-MsgGUID: 2NagTIfoSQ6SAg3dsQnYaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="235901093"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 16 Apr 2026 20:55:46 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDaIx-000000001BZ-2Wal;
	Fri, 17 Apr 2026 03:55:43 +0000
Date: Fri, 17 Apr 2026 05:55:42 +0200
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 15/69] warning: `as` casting
 between raw pointers without changing their constness
Message-ID: <202604170515.bY5xukgJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   234b16b06a9869c5885af57b2853412e854c1216
commit: 76aa8a8de9fb5488da45a470fada7e8d6bfcd5ca [15/69] rust: alloc: vec: Add TryFrom trait
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260417/202604170515.bY5xukgJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604170515.bY5xukgJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604170515.bY5xukgJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: `as` casting between raw pointers without changing their constness
   --> rust/kernel/alloc/kvec.rs:1446:40
   |
   1446 |         let array = unsafe { ptr::read(vec.as_ptr() as *const [T; N]) };
   |                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try `pointer::cast`, a safer alternative: `vec.as_ptr().cast::<[T; N]>()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ptr_as_ptr
   = note: requested on the command line with `-W clippy::ptr-as-ptr`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
