Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C073AE6F5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 06:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231677; cv=none; b=EPYU8iWvCZYyWTbtuSB+TD65YW/NkyYFJuEYVFhDGaacKBAtY0pqnvAlGG6/LGY+CJG9WuCFAlRM5Aqp+jOHgMsv4vipqVyBsJhzBpYR9lrNh1uFasKLfmGfmMOJQRa4qiegoJmit43iPfIPbKSi23Q6FtI8hOvenHzfUzC+2io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231677; c=relaxed/simple;
	bh=CPJRf7gRNj/9taaUkeCHd4Juy8C34NUbhj1UqLgZlv8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mVRoXCK+QNR8TaXPIe2aCa+A9nzEWFFrFKnrxOi3WOO+bQbl0U6AMyc/lFVdyxkkenlncK6eRfE7PxgeRGuX+3hTcaM0eFVO3A86G5gHcs8qWLvRfVjBfrPYgcj24bj1vkmw/AS49q4NdE3ixGCkfUkOV8dORrEhy0rF2Xsn2JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMhLhF4G; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMhLhF4G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790231676; x=1821767676;
  h=date:from:to:cc:subject:message-id;
  bh=CPJRf7gRNj/9taaUkeCHd4Juy8C34NUbhj1UqLgZlv8=;
  b=bMhLhF4GgqmMoLVV3S1pSR70yc5KrW12pUHCWkcX+pCkmpm0zpbQGrx5
   iiziY1SPbZiLuI/bG5fdhITOr19d5m8mSIoK/JNDF39U6S8L++ZWYsLmw
   zd8hHjpZaWrd+T78wURhv1jLaqsSEXmyyivcnyxs4MA3mxBs8Gr09FyST
   OjkqkJxZ2AvwBU9/3Ji47D2klhnI8lf9KPVjUiyutSJF+/XgK+rwX4859
   S0tSsBz9AiIcPsxwm3YHAk4vdXKHNuFdwoXKNzPxQt87+3KrWXpkBxvnl
   4Ue9RbOlLC6ICp5xhMkk7egs5igq4OJ7Z3zU+lZjTdzZK6ffUwhbOqE7y
   w==;
X-CSE-ConnectionGUID: qipVnh4iTBqBPCMEhwdfGQ==
X-CSE-MsgGUID: hN1LATfKQsuZMgaPKXNtUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="89854527"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="89854527"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 23:34:35 -0700
X-CSE-ConnectionGUID: v6SqidPDQmq6bGBXUr3naA==
X-CSE-MsgGUID: lZrj1ptiQBSQIJvjRHhr+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="270425862"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2026 23:34:33 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9d2N-00000000IIw-1P37;
	Thu, 24 Sep 2026 06:34:31 +0000
Date: Thu, 24 Sep 2026 14:33:53 +0800
From: kernel test robot <lkp@intel.com>
To: Dominik Kaszewski <dominik.kaszewski@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, "Chen-Yu Chen" <Chen-Yu.Chen@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 linux-doc@vger.kernel.org
Subject: [agd5f:amd-staging-drm-next 3081/3178] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/dc/dc_memory_pool.c:1 This comment
 starts with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202609241434.CC3nuqXT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Dominik,

First bad commit (maybe != root cause):

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   e0e9c2257911b291ef5345635a9e6dfef5b2b424
commit: 68006eb4b8f03d723aaa66e87625795189488c04 [3081/3178] drm/amd/display: Add lock-free memory pool
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260924/202609241434.CC3nuqXT-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241434.CC3nuqXT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241434.CC3nuqXT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dc_memory_pool.c:1 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Copyright (C) Advanced Micro Devices, Inc. All rights reserved.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
