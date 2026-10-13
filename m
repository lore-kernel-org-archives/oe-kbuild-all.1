Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E994A377ECF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 01:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791855991; cv=none; b=fPKz/P8/Xrish9hG9Hdz2bL8s4GcTAxrovX0ul31dPvS9gg4GUwJjNMeWiHYFp6/29p8FeRtAQFCPHGUo5fWlGrMVqGFB4kysMcYiyR8eZah52XrOui+Qw1o3ldJjRfq7FwLWDK7HPr+eHybl+WTzXFAA6657e6ajP7dpzNGHtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791855991; c=relaxed/simple;
	bh=hrASIUp8USWs9G1Yn8cPlKy8lkQ3iRC2h5cMAxCD/Ao=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KC4AbWc+t14LxvgjWVFug+x1IREC7k+uBIKtQ3mo6bb2cxoCVeHTlfO6jEgURBoh49QNhHQ3swetgMaOqD4yXlCZkaMqmlp8cMTNMAkvgWBkt2pp+VbPdT1P7SPc2dWIYeozTA91bw9IN8FkF6R2IvOiazaZOIQ5AU4MxAMyl3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MvUzmyrT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvUzmyrT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791855989; x=1823391989;
  h=date:from:to:cc:subject:message-id;
  bh=hrASIUp8USWs9G1Yn8cPlKy8lkQ3iRC2h5cMAxCD/Ao=;
  b=MvUzmyrTEhz5d6Qzhx7urA4hVyI91fC8V+VzUVEjm6ZmDp/slekYE6Ur
   iGggiT53Q59W1tG1RP3e+UZrRlrYQhyxkN4xf3eE/OdRjiRCTnztOtWQ/
   MxqUlwJoc6hp+3DZkjYJ0KeljEJ6b/t2clnwSstir1JWH5Ev/s7ULk562
   iXKtnel5P/Kbt0DGfuNuJ/qgTYXazFxvnEpheXMx7WmRfVJ305cKxk8+Y
   QyTUMRlyi0qU8jVTh/3PAcp5DNZZdkeMCmFOz8LVnzJuPTWBZGNNusQQI
   HCqjQKSU1r9V3i4LwEfc49RHwLuwDO9s/1IFfqAf8H29F6Wagf8x1HaVC
   w==;
X-CSE-ConnectionGUID: qGqM8vYlShqZTzN78iBUKg==
X-CSE-MsgGUID: VgRloDdbQgiyILE0S+lDjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="566186"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="566186"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 18:46:29 -0700
X-CSE-ConnectionGUID: DU8PwqCmTWuJ8SQ4DVwzsQ==
X-CSE-MsgGUID: 6jZ+LXzUQEeNSDn96z78jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1510978"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 12 Oct 2026 18:46:27 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGRaz-00000000ALL-1Lt7;
	Tue, 13 Oct 2026 01:46:25 +0000
Date: Tue, 13 Oct 2026 03:46:22 +0200
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:rxe-rust-v1 66/88] warning: casts from `bool` to
 `i32` can be expressed infallibly using `From`
Message-ID: <202610130322.qtVpc22k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rxe-rust-v1
head:   fe52737deab42b438e356282106b9418915da058
commit: 9631f80c8d6383fa7e023e3a1ed0d1278a4004fa [66/88] rust: rdma: Own completion queues and shared receive queues
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261013/202610130322.qtVpc22k-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130322.qtVpc22k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130322.qtVpc22k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: casts from `bool` to `i32` can be expressed infallibly using `From`
   --> rust/kernel/rdma/cq.rs:501:65
   |
   501 |                 .map_or_else(|error| error.to_errno(), |missed| missed as c_int)
   |                                                                 ^^^^^^^^^^^^^^^
   |
   = help: an `as` cast can become silently lossy if the types change in the future
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#cast_lossless
   = note: requested on the command line with `-W clippy::cast-lossless`
   help: use `c_int::from` instead
   |
   501 -                 .map_or_else(|error| error.to_errno(), |missed| missed as c_int)
   501 +                 .map_or_else(|error| error.to_errno(), |missed| c_int::from(missed))
   |

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
