Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D87F1F8691
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 08:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776413512; cv=none; b=pTyZVGLL4BQGLDmA47bXwQ3Y6iXS5Un2MAvaPO1o0q8mb//aNjWZYjGR2z0BzBI/OxtY/lM8W5CxF4NRC3eh9/qT/kvybr7q7LODf1+qXGYbHELTKy2H2nbJJU6+YR7gVg//u1o5YRzJYXtqJdeti55Y7U6xgGqWIS1S5vEv15s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776413512; c=relaxed/simple;
	bh=Ov0+u9EcXGyHqApXiVG6iky8RopqOKRkrzbL9/rHlVI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AOL69U5Y7rC6pZMuYbOnKw2Uw+9wKgekpK4QizIzF73JX797Mbl77R4SAjdx3qerYrm2lZoE2rjBE5SIdzaCnJN2NFfQVK+twkOyQwrQwm+d6JgD+mEo6qBeMAC0n9Tq3cbYYETzESEP9z5NTz6IpLuPxRePGtCEtjxXGiHLUqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+xSqJRX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+xSqJRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776413511; x=1807949511;
  h=date:from:to:cc:subject:message-id;
  bh=Ov0+u9EcXGyHqApXiVG6iky8RopqOKRkrzbL9/rHlVI=;
  b=U+xSqJRXMVdH8303TlWKN1mgcpRFu/NtgFbNyZ3MMr397cLL3JTzCJNt
   dK3VOuHhvkCVc+XZT4xd325fmJuZ9M3q0TgdvOCPk9XDeCbbYMOCrGNlt
   RkpWS36th/LnqMO9uvbbxhCUV2KIflOt15RHa9Itul/+3MV/x8cixJClk
   oEyyR9IRd8FwXdIexCUJBwBtJkCCpz04dm8wbHgOKkccPAMXppPBboYB2
   UxOmfUTUQdYI6EFENyZBdIWv9ngSUq+FXKmN3icsso0RGNcQgegSHcbdN
   81F3xltlUMXnqOAAgLPTEH3lyS4gzqRfcqHrQU1xI31u21dk/talaFZvj
   w==;
X-CSE-ConnectionGUID: tIcocJmWT/+I9FooeI+t1g==
X-CSE-MsgGUID: b+k3c/lxRkSL6obDmDfJLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77499784"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="77499784"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 01:11:51 -0700
X-CSE-ConnectionGUID: lzvg/QwQTH2qRqXKvz1QdQ==
X-CSE-MsgGUID: QNahDe7DQ4GURBDXLchjeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="232724584"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 17 Apr 2026 01:11:49 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDeIl-000000001Gv-25TP;
	Fri, 17 Apr 2026 08:11:47 +0000
Date: Fri, 17 Apr 2026 10:10:47 +0200
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 48/69] warning: unresolved link to
 `remove`
Message-ID: <202604171037.cCtlXLy7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sasha,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   234b16b06a9869c5885af57b2853412e854c1216
commit: 3da6b620ceabe07e28ef2f85cd0aaa1f2ad4d7b4 [48/69] rust: alloc: kvec: WIP(?): Add swap_remove() for AOP series
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260417/202604171037.cCtlXLy7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604171037.cCtlXLy7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604171037.cCtlXLy7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `remove`
   --> rust/kernel/alloc/kvec.rs:807:58
   |
   807 |     /// If you need to preserve the element order, use [`remove`] instead.
   |                                                          ^^^^^^ no item named `remove` in scope
   |
   = help: to escape `[` and `]` characters, add '\' before them like `\[` or `\]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
