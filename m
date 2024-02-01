Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6F93EA87
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Feb 2024 22:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706825267; cv=none; b=AdYldBzVqjrrAHhxD74JlXAFiKP1r1Lp605XxbP0pE+N1WZjJYdlZ7K397wbwaGHyXG643lF/uzOjIMthkFr1MmpzKGU/sdTjgcj0SHjxNEJQZxvPvVYJp74Dq0+PYRikfSQn/pV6z0V/w4dPBC0LdTpgnia4Y8R/DOUC2XyOkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706825267; c=relaxed/simple;
	bh=IqAuOneaUS9D59PthGaCODmoAGLtnzLra80EcAFLX0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tEHG89IIMaxyJASOz1ygA7YNzOyAoGpCZ8zB4Z5EXNUpP+L7KaXF6QDttYPGO5nWOS0nOY7bRwWwpkEz1cHoSI3Xax5uL4ym1xlcmK0ZMIMOthR+MfEQsMV0MLRHwAUBzA7PVgqGtNEYQi4v7HyxU7o50FwTpYAdDUQoERRDBqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MoN3FbXI; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MoN3FbXI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706825262; x=1738361262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IqAuOneaUS9D59PthGaCODmoAGLtnzLra80EcAFLX0w=;
  b=MoN3FbXI8BO3LaAqPycTf7mqLfsPHZ9JYFq0UlLRONpStgVfX8fSLWpN
   pp9Dxylybh4tKlAwm2jf7rJrWj4Qi5QSSGRZFDbBo+jJQJmdqL6yEJ6z8
   0yd87a59K18Ju/cv0tZpHSwdOZITf3Myj39R/ePsZVVxCzJdthFJcSXjk
   UBWRreoSUyRLGyH3vF65tbONqlQ/GWfoQfbkm0RbNpWj0zJeaYVqOliRs
   xsqGGJiVRAciJkWF/uE2J1cG3sCrn05AdYv9wHmGFlcjcS41my+jT4itl
   iZvptk1QdiPvFYR8K/w0OFCexOCWa5SHb5+u88KrjhmcEygLk9GVXdCCb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="394460929"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="394460929"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 14:07:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="4639571"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Feb 2024 14:07:41 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVfDe-0003FK-3A;
	Thu, 01 Feb 2024 22:07:38 +0000
Date: Fri, 2 Feb 2024 06:07:24 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:ffi 1/2] error[E0432]: unresolved import `ffi`
Message-ID: <202402020536.xRPwiIeG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbdd0121/linux ffi
head:   a524233e6d111cb924d6066520225e22abdd149a
commit: b604a43db56f149a90084fa8aed7988a8066894b [1/2] rust: use custom ffi integer types
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240202/202402020536.xRPwiIeG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240202/202402020536.xRPwiIeG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402020536.xRPwiIeG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `ffi`
   --> rust/kernel/lib.rs:33:9
   |
   33 | pub use ffi;
   |         ^^^ no external crate `ffi`
   |
   help: consider importing this module instead
   |
   33 | pub use core::ffi;
   |         ~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
