Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FBD2BE639
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 19:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772824121; cv=none; b=A68ecpf9wtALZ+0nrDHC403YthvExGYIy8RalAF4joQDDY0Bdrw4KLfNAM61OxwJvexPYJ8LqS6HCcjIB2rgVnybKo1N+In2Uxt60D/OMhWCB/o9kk5O6Rc59ETQ8DOdI9/JKXOVj3w/FFa0XPaapTRXMvB111mD6yaIpuN3s9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772824121; c=relaxed/simple;
	bh=VAbAxzHGVdYedcHbrB65sDhaU7TTopxoMVmUkOVapkc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uO2r/E42ElQRJLBBefgJCxEh8uECh5bWDHemXtIiPUW+tJryhc4ZWs8Yg7qh1M3T3fAk4vKkPZpfD4HeC00cE6fDoFmudcjP0+Uond4sfEqWHMqWqgxLGpNVTkncL35g85Isphakc3hdks5Ey7LOuY56c/HobZTtz59ZGlrLskI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2fYwvb5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2fYwvb5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772824120; x=1804360120;
  h=date:from:to:cc:subject:message-id;
  bh=VAbAxzHGVdYedcHbrB65sDhaU7TTopxoMVmUkOVapkc=;
  b=N2fYwvb5cz8HDRHW1rPx8FqIW4sqsJKLXPsyia9b8css/iNk/+nhb2NK
   dPqQSWiRjZib0gfHbNAEX68qJI7owNZOAJ9Lqj6xsoRDC2ghBNzCoapsv
   otBgnik+yY77lQwb9KKdo4Cfp6ARB3v7rBUpeLGrmY17xm8hFHfE0I/pV
   UUdwZFJfs4+LxXHf9+ipAlwJXSgKzisREsYVVW6gAlkxNVEFA0JFNz31I
   z9J7jLlpJ9jg0VfviTLbqEnZ/PWVuBUA4sSo44DGvCP8MHm4YwHss0Ru4
   3tF4x4j9tlqkBJEfabhaiznT1hARu+zHJ9BzzJ/yTXfVnbHyluFRncslH
   w==;
X-CSE-ConnectionGUID: bOv7Fm0wSmS7l+6tDvzScw==
X-CSE-MsgGUID: +T8Zb1FbSFqh05IsZL6aug==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84265948"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="84265948"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 11:08:40 -0800
X-CSE-ConnectionGUID: D/WtCIXoSyinTcVjAY8HGQ==
X-CSE-MsgGUID: f8+A4L8/RKyiVme+4RtOsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="215747409"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Mar 2026 11:08:38 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyaXM-000000001Hp-18iq;
	Fri, 06 Mar 2026 19:08:36 +0000
Date: Sat, 07 Mar 2026 03:08:02 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 3/29] warning: unreachable `pub` item
Message-ID: <202603070340.KnecNlse-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   c51ee29fc563974ca03eab72d33819b471f8cfc3
commit: ae2f9121e91cc36a0ae7b852436655735ef2383c [3/29] gpu: nova-core: Select GPU_BUDDY for VRAM allocation
config: arm64-randconfig-r072-20260306 (https://download.01.org/0day-ci/archive/20260307/202603070340.KnecNlse-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070340.KnecNlse-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070340.KnecNlse-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unreachable `pub` item
   --> rust/kernel/gpu/buddy.rs:562:5
   |
   562 |     pub fn offset(&self) -> u64 {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
   |
   = note: requested on the command line with `-W unreachable-pub`
--
>> warning: unreachable `pub` item
   --> rust/kernel/gpu/buddy.rs:568:5
   |
   568 |     pub fn order(&self) -> u32 {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
