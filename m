Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCEF13D891
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 02:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790906991; cv=none; b=OsswfQND/mCswfXxREDR97F4MhQOuAZ9AXpfFN+JVaeBeUGOjM4iE3xfTcqhCaNz5TK4MD/I3Ih8fOeburOnTw5qshrKTZ5bzNmukXG7JSrZw+YKejITI0XNSajGygonUDAIbjS1KfTwFj/xfukP3Nxmxnt7iLkOj0EyRodnm5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790906991; c=relaxed/simple;
	bh=/WltwR5pWb0Wtn5y0/4hXXLFvLJSidsXuIjVuEzFVso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=G+bgoT16u9kxnI9ay+XWgQDiCySbZ4T6zOtoJqhsyUqMiVmo6OMdei5L07QEWMNrR2a2qCBAb9CD0o5TYncRpPYK4vZqer60khE8AFQEw857FSKrT+lgP1Fc6lWBzaoVwoOmLw9bNdeMwP9BuY4/xKlAF9j/XZiKRkQYC6JQ16w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tvmiw7Ji; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tvmiw7Ji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790906990; x=1822442990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/WltwR5pWb0Wtn5y0/4hXXLFvLJSidsXuIjVuEzFVso=;
  b=Tvmiw7JilytIJC8/bdmkzU2Mp/ZgDvPEnvi+x9vIgrJyBbDqbDQqqSqo
   51hRpYu65Vgj8sFf8WW3XGO8Pxy9sD6ojj2DHZLE8R4PNKAiQFov+iPDI
   XW6HpMZwzMwWhMAaI08OiMr40cB7yoC7HhDuCq0epMZuTp9NiCbZkfPqT
   1sWy+d0QirGlAnKWUgtC7POU3+PdO4FD4p4OvIAhzRsFden5guyLAl8Vs
   2toyov//hAcRNxfR+DkLh7rzyocTvrztdBzan+Jiek7gVTrxmYmEoyG9e
   y3FUMcXDzusKzgx61ITEjXF/EhC1v0T7U+IXef5OElG6y6eia0qho8GyD
   w==;
X-CSE-ConnectionGUID: 24427h+1SVePKa8X4WHQPw==
X-CSE-MsgGUID: z5nXoYluSJOL4cgCp37W+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90815154"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90815154"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 19:09:49 -0700
X-CSE-ConnectionGUID: QUIibFTlRXS+dXkH2qUQHg==
X-CSE-MsgGUID: qwuZhMfnQdCiFpHcJaRbpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="304100680"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 01 Oct 2026 19:09:48 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCSiX-000000000Lr-41Ie;
	Fri, 02 Oct 2026 02:09:45 +0000
Date: Fri, 02 Oct 2026 04:08:54 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/rust-dyndbg 10/15] warning: constants
 have by default a `'static` lifetime
Message-ID: <202610020437.P8jFDMaS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/rust-dyndbg
head:   e0f643bcb55eadaa7c1b9d23ea0569cf7b5377a8
commit: 76cf11132c45c4672d93f4d6946b3c24411f18c7 [10/15] rust: print: use CStr for __LOG_PREFIX
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261002/202610020437.P8jFDMaS-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020437.P8jFDMaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020437.P8jFDMaS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: constants have by default a `'static` lifetime
   --> rust/kernel/lib.rs:161:22
   |
   161 | const __LOG_PREFIX: &'static str::CStr = c"rust_kernel";
   |                     -^^^^^^^---------- help: consider removing `'static`: `&str::CStr`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#redundant_static_lifetimes
   = note: `-W clippy::redundant-static-lifetimes` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::redundant_static_lifetimes)]`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
