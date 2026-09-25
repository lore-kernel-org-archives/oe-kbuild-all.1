Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF803A7593
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 07:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790319803; cv=none; b=IUXrzKkl0zDVBoGQQNdVAdabiyA2s9SD0z9JIBM7vgaNIadmu6Rr9n25MHS0weFGW4swERrdpVCMMofbNO3YOGpZhL2pzdD8N378B/STcuYI5kkXStme89+Ter0beBhTE49P9gdEnXvnfNh9WSVad7oN7ProhAjcBAwZePQ9TlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790319803; c=relaxed/simple;
	bh=I1t/vpz6GRbojiZSFcPE+mSXbLkM8RRJKqxkf6bPRMw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UYJeacWeYDw15mcdZqejEANXZKX4ovG7XqcxyFuarPLDWGxdmBJq9/CdtuTj+axnUJbKPCJFNUelmtrmdrOXSnadWbTNIf9+4WHWv0Fj3i2SIsO8iQ9pXD3w0zTbj6wDx7kIJB+sUHocXr1IuYKKUmf77EfS0ZJd8l8c1ZCoY44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3GYB4vh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3GYB4vh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790319802; x=1821855802;
  h=date:from:to:cc:subject:message-id;
  bh=I1t/vpz6GRbojiZSFcPE+mSXbLkM8RRJKqxkf6bPRMw=;
  b=H3GYB4vhaHNr6jIaCdWQExsMiIv+VHIgWCwVqgkV19pJQD5IcjFKW1xR
   FKdVAsr8H5stvfdiZIIpkkigTTVka5jjZcWr1tLGr+kwPmesocTMwKThq
   5Tvd0AV5R7/3SqPCvzVviRQ5CT9GigLEnkOMuwaCmbVHy75ZdB+sCjZpZ
   cBAZnAjgPi4b0UJt7hLBKKKeMuXQSWmM8/m5VNLpsVYjWXtoJaLETE+0e
   CIKMlwJZjrs9uLd8XTULMbOV3KnRGyIyH4Kex9Ry80I5o20roEVwUuBaY
   uNxoW5u+Isux/3h0a36ShhweZTqeEevZ4t8Fyw7Dz3RAZBXyN8mDDeRjU
   Q==;
X-CSE-ConnectionGUID: j2+wNjW6RgmJoThFKDM7vw==
X-CSE-MsgGUID: MU4CLFErQoSmaBcmjcfyfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91120455"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="91120455"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 00:03:21 -0700
X-CSE-ConnectionGUID: TnPpqDSWRFCDkF4g0AKCnA==
X-CSE-MsgGUID: MQ7Izl1aRamGsVdGSbKCMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273811269"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 25 Sep 2026 00:03:20 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9zxl-000000000di-2bCv;
	Fri, 25 Sep 2026 07:03:17 +0000
Date: Fri, 25 Sep 2026 09:02:46 +0200
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cornelisnetworks:for-upstream-20260924-1644 22/25] Warning:
 drivers/infiniband/sw/rdmavt/mmap.c:134 function parameter 'context' not
 described in 'rvt_create_mmap_info_context'
Message-ID: <202609250859.sDhZRhDI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream-20260924-1644
head:   9cb4ed8dad868fd48ce7562aec2284c6102a17ac
commit: 33965a8169931ed9c286a1f9785438145e6ed0a5 [22/25] RDMA/rdmavt: Fix SRQ resize locking and mmap lifetime
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260925/202609250859.sDhZRhDI-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609250859.sDhZRhDI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609250859.sDhZRhDI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/infiniband/sw/rdmavt/mmap.c:134 function parameter 'context' not described in 'rvt_create_mmap_info_context'
>> Warning: drivers/infiniband/sw/rdmavt/mmap.c:134 expecting prototype for rvt_create_mmap_info(). Prototype was for rvt_create_mmap_info_context() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
