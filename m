Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0A334404E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 05:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787550595; cv=none; b=PxZRsAbCeTi0dN4Y2y3G8pONKtt1T2nEjGzm7WSNThMop3SB01F7Zc+rbsnKhOHM1gk75O+ySODaz9JSR6Y4SrlG/kSW3nRxjkVpfvHhD7tryjP3Ok5Lhou7xKgfaKqda7Qr6I0LjIybZy9quG8BCtcNnvCwT5WhF7jfFqVvZ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787550595; c=relaxed/simple;
	bh=PNge1KRdTWN6icLqKQzUyf7tbpVoEP52LwT7X37OF/0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ovIiVSn7igYFsONu5Lkc93eA69sHC56rPCVNuFkDqIpldWj1JOgOSb1d/HhlgVJ3gB4bwN7mjb/khUf/P4e5D/ifxix1sQ1ReCDFsulaJ/s+PZ6PEEl6dmCxW5jvoYcQfNaQgGwwd5tAd4zyG3Tg1F5wLCO3RGXhUyOrDP6CFcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjzJSHSR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjzJSHSR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787550594; x=1819086594;
  h=date:from:to:cc:subject:message-id;
  bh=PNge1KRdTWN6icLqKQzUyf7tbpVoEP52LwT7X37OF/0=;
  b=jjzJSHSRd/ntTz6banp7hCbrrgbR8w8KHuwDE97B67EDtLOvkk/tLf1i
   Ov0CmaW9lQFtXp8ArnbzhHs9S6FpP+bxc1jwOtUaUDKNcCbyAxWMrO6N6
   K8/ZSDkbzRshbN5M84xA/vykaqz/SEUd/mu9oRqkzi2jatdIIXe+JHruh
   qetlq7RNfMbH9JJCo8pcaQMMEhOfKrVLO6XAdTC1OYEd7t1nkaLWf3A9u
   Nnzr8m4c7Gd9e15YuhpFsahmuuoS1+PPFG+QpnpHKi5bRuAP2BC0ehQVk
   88LVwlQdOH62KrMDRmtB77jRYgPlu9F/EJPZxH5Pdb7XBR6HPRtbRdpma
   w==;
X-CSE-ConnectionGUID: 7j6csmzXT1aGUDCKRCljuw==
X-CSE-MsgGUID: 9x4PijRkRaeACR4LXkPirg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="105526711"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="105526711"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 22:49:54 -0700
X-CSE-ConnectionGUID: LPSi5LCVTjicV0KVrBdiGQ==
X-CSE-MsgGUID: JzJhUJyKTS6Ow0a3do/YMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="296810117"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 23 Aug 2026 22:49:52 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyNZ8-000000000Hb-1RXp;
	Mon, 24 Aug 2026 05:49:50 +0000
Date: Mon, 24 Aug 2026 07:49:47 +0200
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:asahi-wip-7.2 656/964] warning: explicit call to
 `.into_iter()` in function argument accepting `IntoIterator`
Message-ID: <202608240745.gyxCVkKs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux asahi-wip-7.2
head:   57124f5176e4a4ceb553942a5f3de94cb5035877
commit: f1bd025505718f950b0925e7d578961d4c553f40 [656/964] rust: macros: Add versions macro
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260824/202608240745.gyxCVkKs-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608240745.gyxCVkKs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608240745.gyxCVkKs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: explicit call to `.into_iter()` in function argument accepting `IntoIterator`
   --> rust/macros/versions.rs:261:55
   |
   261 |                     filter_versions(config, tag, ver, group.stream().into_iter(), is_struct);
   |                                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   note: this parameter accepts any `IntoIterator`, so you don't need to call `.into_iter()`
   --> rust/macros/versions.rs:176:16
   |
   176 |     tree: impl IntoIterator<Item = TokenTree>,
   |                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#useless_conversion
   = note: `-W clippy::useless-conversion` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::useless_conversion)]`
   help: consider removing the `.into_iter()`
   |
   261 -                     filter_versions(config, tag, ver, group.stream().into_iter(), is_struct);
   261 +                     filter_versions(config, tag, ver, group.stream(), is_struct);
   |

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
