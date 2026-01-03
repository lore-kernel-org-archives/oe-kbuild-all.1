Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8413C0C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jan 2026 11:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767441275; cv=none; b=hLzpG/LDbfTns8addpAm/TXhQq7tMqu5ZZ4fwuecpN1yRH6ykGqbHwrnaQSEHGo1wv9M5DyBou1LHLsPgc/nvGTFfn8w8Iyzw5ZNsp4DxouC7E3HCGjL+rMovI8pWn69NsTuvGIRm1oPOc/WFhOgRDpfE8SvsvGSGApz/WVwH+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767441275; c=relaxed/simple;
	bh=YhL3jsjOM2psT0jvXvooCBmxBMqVu6wRgiEjkl+XXMw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lcQiKjbE9t0g2fbYM9OX1H618V7Xj2I7lfhf2RSSLz+V3o9IHJw8N+Z8YRGVejjUCTDO2/kVcs2m6FYzvb7IFgGE8qXf13oUHmj4C7iRkfbowX2Xb5+2TeGhEM43RdG/WbPAACSYQwnCqxNtmAwRQ/DxBSI8FRtnnYUpgI8jwKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/3t+uZ2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/3t+uZ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767441274; x=1798977274;
  h=date:from:to:cc:subject:message-id;
  bh=YhL3jsjOM2psT0jvXvooCBmxBMqVu6wRgiEjkl+XXMw=;
  b=L/3t+uZ2fWNIKN9CUHZoUaWbMDTM2eQBZiKa3y/Jbjd1wthSr5V+2Cix
   XeHnugSpMtU6FbdNObMThW34PeasdvWHmnG3/fxACC6AGbndcAj3uuFH+
   PVRMOhW2RWEdFTH539HktuBhJe5L5putGgbo0FnStyAV0GM1v3XZGI9ul
   /KH52h9kJXHbYvalxTzWN4pe7RBvUN2jRTMjHuyq5OlSohGDnSyPKCsSx
   Ymcuk/FiHLApp8wRIqKcp0WvmD2Ii2I1pCUBY7kjiEObI3tQhBCF4H+ML
   Xz8ELewSbtd/RWV0/ykge46/Fnqd+GvW6NL+KngCVn1Mf9UGWRjZrtmkE
   Q==;
X-CSE-ConnectionGUID: KH3xuc4nTn2zRCZL7n74XQ==
X-CSE-MsgGUID: chx7Z+FjTkClQHEQG9bMWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68800089"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="68800089"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 03:54:32 -0800
X-CSE-ConnectionGUID: rwL5aPTJSoi8VFJElXzKHA==
X-CSE-MsgGUID: nvtUcyCBSBOy1okpi3TkYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="202460049"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jan 2026 03:54:31 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vc0DE-000000002hZ-1YBg;
	Sat, 03 Jan 2026 11:54:28 +0000
Date: Sat, 03 Jan 2026 19:53:57 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3+i386 18/19] ld: warning: orphan section
 `.eh_frame' from `vmlinux.o' being placed in section `.eh_frame'
Message-ID: <202601031906.eQwRMCAs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3+i386
head:   d12488ae73e482757220a46bce5137af656d99aa
commit: b5996ca238058147f6a137a4faabb2144421533f [18/19] x86/kernel: Switch to PIE linking for the x86_64 KASLR and i386 kernel
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20260103/202601031906.eQwRMCAs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260103/202601031906.eQwRMCAs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601031906.eQwRMCAs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ld: warning: orphan section `.eh_frame' from `vmlinux.o' being placed in section `.eh_frame'
>> ld: warning: orphan section `.eh_frame' from `vmlinux.o' being placed in section `.eh_frame'
>> ld: warning: orphan section `.sframe' from `vmlinux.o' being placed in section `.sframe'
>> ld: warning: orphan section `.sframe' from `vmlinux.o' being placed in section `.sframe'
>> ld: warning: orphan section `.eh_frame' from `vmlinux.o' being placed in section `.eh_frame'
>> ld: warning: orphan section `.eh_frame' from `vmlinux.o' being placed in section `.eh_frame'
>> ld: warning: orphan section `.sframe' from `vmlinux.o' being placed in section `.sframe'
>> ld: warning: orphan section `.sframe' from `vmlinux.o' being placed in section `.sframe'
>> ld: warning: orphan section `.eh_frame' from `vmlinux.o' being placed in section `.eh_frame'
>> ld: warning: orphan section `.eh_frame' from `vmlinux.o' being placed in section `.eh_frame'
>> ld: warning: orphan section `.sframe' from `vmlinux.o' being placed in section `.sframe'
>> ld: warning: orphan section `.sframe' from `vmlinux.o' being placed in section `.sframe'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
