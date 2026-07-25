Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7631C1E4BE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jul 2026 00:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784939565; cv=none; b=ZadkbDPZ+zsb/JSjuL5WHryvJn5EmRlIuf/or4czrRbf+VJUZcEKW658hwk48wj6xUpiYGJumLQMtRSZLTtjWugEGeeN/LOwU6QL4USX2h7cl73wusvrBwkENzNV5XmGG62crMYdtIPhnmhWBsplRY31romjsnwl5ovG8IczQr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784939565; c=relaxed/simple;
	bh=RpfCYvezedGz6YNTkORIhQTO1cBgKNHgVbQgsN6lqe0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=f3tDj9PBQtrzG1uUAGW7d6tvXkxr+rLntZbUQ+MAffnylUj+52Srq7RLt3J0LkdzdIkf9unEtGOGLG6GHlrrcUOhNjZAKMZ0FgTTO1/HwhChZTy7xhD/XBmFAWXOW5l9RYHqcz34iXMEXHv0OZ9y+PScTauAAS10s/QYeD+Zwe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AcsOp5za; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AcsOp5za"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784939563; x=1816475563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RpfCYvezedGz6YNTkORIhQTO1cBgKNHgVbQgsN6lqe0=;
  b=AcsOp5zagd/h95sSrvGcpKF3fxyucsLDXiWnDB+Urh3YW7kIJSYmGy5a
   mS/9bZxzgv+IsUcFb9BHBgAuzylGXeuz5KwbP03wRDf1zIiwt0jLeTwW1
   +tIGtpyE4AX1xsA3m9qH8VAhp8C1QE9vYH4saA9Bh6ZE4kU/06cpJFe1r
   WVtwgF0aN4vDdQvdZ9kGuje89Wf6tUuqOHtCObbkIyAzzwvoFLxdtpwhk
   sJuTmFKvZRD4oMTags6a+yWZqeLbZoip2cjfS/0T2PNExHUzMSpKXfPI4
   JOLrqH/5yFJrBqXRU3g1Q2qtsIDZ2iiPUZerSuvVjwm6nnaps22CwxUPW
   Q==;
X-CSE-ConnectionGUID: bCERF/DKRHORDWURSFlr+Q==
X-CSE-MsgGUID: ZAr53b1zSeCRbo8XVaMDdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="96272775"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="96272775"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 17:32:42 -0700
X-CSE-ConnectionGUID: Qy8xrx1GQ823VYyJeFvchA==
X-CSE-MsgGUID: RYIneGnDSpuDcehCR2YR4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="263156556"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 24 Jul 2026 17:32:41 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnQJi-0000000014k-2WsJ;
	Sat, 25 Jul 2026 00:32:38 +0000
Date: Sat, 25 Jul 2026 02:31:45 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Andr=C3=A9?= Almeida" <andrealmeid@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: /kbuild/src/scripts/syscallhdr.sh: 77: [[: not found
Message-ID: <202607250219.bC2cMCLq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/syscalls-Create-unified-partial-table-for-all-archs/20260725-040333
head:   8c63d3ddb37ca9ef5da08071f85493dd0b281816
commit: ee3a650b2d887e916d8d644af5416769b7f63f16 syscalls: Add support for x86_x32 for the common syscall table
date:   4 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce: (https://download.01.org/0day-ci/archive/20260725/202607250219.bC2cMCLq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607250219.bC2cMCLq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /kbuild/src/scripts/syscallhdr.sh: 77: [[: not found
>> /kbuild/src/scripts/syscallhdr.sh: 77: [[: not found
>> /kbuild/src/scripts/syscallhdr.sh: 77: [[: not found
   /kbuild/src/scripts/syscalltbl.sh: 100: Syntax error: redirection unexpected
   make[3]: *** [/kbuild/src/arch/x86/entry/syscalls/Makefile:52: arch/x86/include/generated/asm/syscalls_32.h] Error 2
   /kbuild/src/scripts/syscallhdr.sh: 120: Syntax error: redirection unexpected
   /kbuild/src/scripts/syscallhdr.sh: 120: Syntax error: redirection unexpected
   make[3]: *** [/kbuild/src/arch/x86/entry/syscalls/Makefile:43: arch/x86/include/generated/uapi/asm/unistd_64.h] Error 2
   make[3]: *** [/kbuild/src/arch/x86/entry/syscalls/Makefile:29: arch/x86/include/generated/uapi/asm/unistd_32.h] Error 2
   /kbuild/src/scripts/syscallhdr.sh: 120: Syntax error: redirection unexpected
   make[3]: *** [/kbuild/src/arch/x86/entry/syscalls/Makefile:39: arch/x86/include/generated/uapi/asm/unistd_x32.h] Error 2
   make[3]: Target 'all' not remade because of errors.
   make[2]: *** [/kbuild/src/arch/x86/Makefile:256: archheaders] Error 2
   make[2]: Target 'headers' not remade because of errors.
   make[1]: *** [/kbuild/src/Makefile:248: __sub-make] Error 2
   make[1]: Target 'headers' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'headers' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
