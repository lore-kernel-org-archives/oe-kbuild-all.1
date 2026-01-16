Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF6A343207
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 05:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768543003; cv=none; b=d6BALIZSJOuQ1W2Nr8EsMHTKg7dW7vknW9SnMdeVQcG/VyP4LBs/Su13HZnPq1b/m/1URs/v9KZ92P9o77TL+BAgnqImPZWwW3zHz29tK/uQBL8BaAxY8FB6TTFkebrtgoNWr/C1Ra7qIv2j0LmzVTkr8vpjSUjG3ZzTK8L6U3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768543003; c=relaxed/simple;
	bh=GIPslHazdc5b0aKORQqMqnfPDQXn/Xh2tKX3Va+lSUs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dMYqQv5RrL8N7knlhkD3PZpEakAhXAkx+lYePLIlLhBPPJMEUw0PH9C9hoT7tkPajCwMaoK9Okp4X2ueJLmcAQVV5JeiikkhEhpUfq7ZG/OCVM3fUkZIV5V6Z5WFHtELk3gBwLcHaG0V/ZPKyokrNCH80XQItLjG6pjpiDhAbeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HrmxP8v1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HrmxP8v1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768543003; x=1800079003;
  h=date:from:to:cc:subject:message-id;
  bh=GIPslHazdc5b0aKORQqMqnfPDQXn/Xh2tKX3Va+lSUs=;
  b=HrmxP8v1Lk5zo+9cor+eht+CwUUuNqNPoZt9BfGmlOvJEqi7eajKvKgv
   XvXQJHePhEiDMUWJUtzo1FMaZlRM4p6n3O91Q4HUbxuSziCvkRb4TBjb9
   DenV0j0WNAYT5MJDfyI0JJmcpHRh4npL8vAdr5+IS0MB9OARRyTOvswFZ
   LAqGV5PT20fID30KW6h8cGudoPG1XF0fRVGf9Xxzv0ATnMTQHOTkiATtZ
   xUH4EnfLdnfud0xqY1ArbWZPrUAsdoZjfBH97RxkiRziLw6sNzqyLWiRn
   FtKdUOQ6K6DtYCO0OH4y+UHhTPgWam/PtBmVR/pSbOMwCA57QCN35t9JT
   w==;
X-CSE-ConnectionGUID: fYuFKfTpQaKoNViUu2qW2g==
X-CSE-MsgGUID: PdAOLG8+THe/saXmdLH3Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73702145"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="73702145"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 21:56:42 -0800
X-CSE-ConnectionGUID: Obkeac0iRkeZqzc9MSsqIA==
X-CSE-MsgGUID: gQHDXvjlTLedNykILAfKxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="205574856"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jan 2026 21:56:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgcp4-00000000KSG-1IXp;
	Fri, 16 Jan 2026 05:56:38 +0000
Date: Fri, 16 Jan 2026 13:56:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:simplify-kallsyms-v2 1/1] (.rodata+0x17317c):
 relocation truncated to fit: R_X86_64_PC32 against symbol `_text' defined in
 .init.text section in .tmp_vmlinux2
Message-ID: <202601161357.kud2e547-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git simplify-kallsyms-v2
head:   dc85254e22c3ca4db6f29584d365376dbb72b944
commit: dc85254e22c3ca4db6f29584d365376dbb72b944 [1/1] kallsyms: Get rid of kallsyms relative base
config: um-randconfig-r121-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161357.kud2e547-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161357.kud2e547-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161357.kud2e547-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: warning: .tmp_vmlinux2 has a LOAD segment with RWX permissions
   .tmp_vmlinux1.kallsyms.o: in function `kallsyms_offsets':
>> (.rodata+0x17317c): relocation truncated to fit: R_X86_64_PC32 against symbol `_text' defined in .init.text section in .tmp_vmlinux2
   (.rodata+0x173180): relocation truncated to fit: R_X86_64_PC32 against symbol `_text' defined in .init.text section in .tmp_vmlinux2
   (.rodata+0x173184): relocation truncated to fit: R_X86_64_PC32 against symbol `_text' defined in .init.text section in .tmp_vmlinux2
   (.rodata+0x173188): relocation truncated to fit: R_X86_64_PC32 against symbol `_text' defined in .init.text section in .tmp_vmlinux2
   (.rodata+0x17318c): relocation truncated to fit: R_X86_64_PC32 against symbol `_text' defined in .init.text section in .tmp_vmlinux2
   (.rodata+0x173190): relocation truncated to fit: R_X86_64_PC32 against symbol `_text' defined in .init.text section in .tmp_vmlinux2
   (.rodata+0x173194): relocation truncated to fit: R_X86_64_PC32 against symbol `_text' defined in .init.text section in .tmp_vmlinux2
   (.rodata+0x173198): relocation truncated to fit: R_X86_64_PC32 against symbol `_text' defined in .init.text section in .tmp_vmlinux2
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
