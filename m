Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFA38287E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Feb 2026 19:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771183159; cv=none; b=IQxuFeWZydedmmLPtycx/pScSNSSEapgeOngnZ3a659cF4tVMh1YjAkjieC8vbZ0HB6R9rqmJTEc4PDNFBMq1YVfsuZcd8H0A0HmF6pli2PaeYU16pWJwQysxJxFMXvDyGLSD0egWUF+5HlnD+KHNLJkOvftjxijTRrTNP190mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771183159; c=relaxed/simple;
	bh=oiPmpIzQ3IGzxFFhiwY7A/0QAc35N9JdBlRY+4j4M2I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EEQN89aynm80omMRY5s7yYkA1NpN14VL3TzMVmh5aMQVWdsc/lO7NpEfHtJ/OiVhdpId1mpWLj1E+zeO8NA45E/k3kP/QDDDyjL+qpostufUOZEX+uIsgqfzMPGo1XhU8nNmEFoh3V7kuR8yleTy1gHaJDmNctqWh7yoGjbcLZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CgxCqu5w; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CgxCqu5w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771183157; x=1802719157;
  h=date:from:to:cc:subject:message-id;
  bh=oiPmpIzQ3IGzxFFhiwY7A/0QAc35N9JdBlRY+4j4M2I=;
  b=CgxCqu5wwp2pxR7oLoDQxGQBVfoBEaEftVKtLOFKGyXhPqjpOpFhW9Bf
   qe9sW8AlNjXKBVom2myTh2wDSzfAa8sqN7kk/akDCt4Kg9+3//ENAvoEQ
   KoY+VV2k1zVrmctfDRUWhNTC2sDM5HXFNf4BVQAu8kCbN3ARrTICYdGui
   C6JUNljTaCgVy1qux8SUIvs1mtWxEXmrQhN5C1kk3qU0ISkoS7h6ukffg
   QvbvM4ulT7tuMha9BCe3u8y0I3W45XQLYgQ5ALu/vUZL1oS+xWOtH+hXx
   TucEuX3/VRsNhj9Q3ZQr5CAYMW060G7aLPKPrGt8hW+y5HqhkQa9jzrPx
   Q==;
X-CSE-ConnectionGUID: lGJtVEl5T+O08tfMTl2NpA==
X-CSE-MsgGUID: Vgm3G//3Sl+tmYFyNxWoeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="83723548"
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="83723548"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 11:19:16 -0800
X-CSE-ConnectionGUID: LooDrMQZT96+MWBLKv3QoQ==
X-CSE-MsgGUID: 45gg9buEQt6hRw5r+LYeLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="213503564"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 15 Feb 2026 11:19:15 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrheC-000000002EP-3Ryy;
	Sun, 15 Feb 2026 19:19:12 +0000
Date: Sun, 15 Feb 2026 20:18:35 +0100
From: kernel test robot <lkp@intel.com>
To: Petteri Aimonen <jpa@git.mail.kapsi.fi>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Borislav Petkov <bp@suse.de>,
 Nick Desaulniers <ndesaulniers@google.com>
Subject: 
 /usr/lib/gcc-cross/riscv64-linux-gnu/14/../../../../riscv64-linux-gnu/bin/ld:
 test_fpu.c:(.text+0x13e): warning: fegetexcept is not implemented and will
 always fail
Message-ID: <202602152019.qSJKlF3m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bb7a3fc2c976b5d0deb35a54ca237519816d7ba9
commit: 4185b3b92792eaec5869266e594338343421ffb0 selftests/fpu: Add an FPU selftest
date:   6 years ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260215/202602152019.qSJKlF3m-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602152019.qSJKlF3m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602152019.qSJKlF3m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   /usr/lib/gcc-cross/riscv64-linux-gnu/14/../../../../riscv64-linux-gnu/bin/ld: /tmp/ccRZDtSR.o: in function `main':
   test_fpu.c:(.text+0x106): warning: feenableexcept is not implemented and will always fail
>> /usr/lib/gcc-cross/riscv64-linux-gnu/14/../../../../riscv64-linux-gnu/bin/ld: test_fpu.c:(.text+0x13e): warning: fegetexcept is not implemented and will always fail

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
