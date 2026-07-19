Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55C41C5F1B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jul 2026 17:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784482562; cv=none; b=u5WoYrjLISI/53/jcmRoIxkOfrzHCDW6SZRp3BhlGO4tQd5ozAuLYftTc3yGzblBRL49X3FJO6iQSvABJgbo+fJN7YS2hZz+CQ/jBrtD+axaopHWNOlJK05C08CAtipry3AjTPfbpFxfleY3LDHoC/8IVVv4pMxqeWOFB5h9VN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784482562; c=relaxed/simple;
	bh=0IYXZr6f80XVI53YeFokJuxoa9Lc+HP6Mos/duR/QgE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i9FVg5+mQ2n2zLZmpfbMdImBOBvbLwKjy8IBI9QnnxdS+CDxz689APQmcdgVvObT14t93F+Z8zYLUoo6IMRHlzp58anla4oX3L+f/TQ1AHjeN8uoF5re9puvJSRFvpHdiNpbYLbjTQE1hLOQQcr2XSeSDJMp8dbQF3vULGC0Vaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bOHdTkr2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bOHdTkr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784482560; x=1816018560;
  h=date:from:to:cc:subject:message-id;
  bh=0IYXZr6f80XVI53YeFokJuxoa9Lc+HP6Mos/duR/QgE=;
  b=bOHdTkr2TPVdM9ZFr0Iq3gOyg+UcFvFlaOGm+Ir7I/2IzUBs0gDnxYyf
   Ul1DMVM8QUCcmXELqVFBfdQaAwwX6fDfCHdDrh4B8oLgdKrnp+3RO8brc
   9VihHANmdq6c1M78l4hRHxF4Q8jl9O2chVbwo6z+REZFoJV+oWpTXywbv
   CR1R73vCqpVzEQ9uMY5QIlmeC19gHGbk/TaN+RxgjqI50gafO686WCGNj
   /O4pLmIkENWWtcfzOitZzr39my0VjascgSH3VfOBFCh+u3ov4/ULp4zY3
   sXh9uicWJnsG8B9vzhXiAQD8RBRh+eqMYavcIs+zkM31K0YiU5R2BKBHr
   Q==;
X-CSE-ConnectionGUID: dfFfCkOfTi+T3UB+OaW90Q==
X-CSE-MsgGUID: sGHpS+46S72TEQ9ocKOSkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="102624509"
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="102624509"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 10:35:59 -0700
X-CSE-ConnectionGUID: oE48BiEQQ52hgmFW4wP1Zg==
X-CSE-MsgGUID: akjP/pDeRSKenhG2PS7kjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="280536089"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jul 2026 10:35:57 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlVQa-00000000VcO-3Jor;
	Sun, 19 Jul 2026 17:35:50 +0000
Date: Mon, 20 Jul 2026 01:35:20 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Xu <xur@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: vmlinux.o: warning: objtool: gdb_serial_stub+0x6d8:
 machine_restart() missing __noreturn in .c/.h or NORETURN() in noreturns.h
Message-ID: <202607200359.Zpe4HXfO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: 9f2aee8f7d1842be08da860e45265d30dba0d1f7 kbuild: distributed build support for Clang ThinLTO
date:   7 weeks ago
config: loongarch-randconfig-r064-20260719 (https://download.01.org/0day-ci/archive/20260720/202607200359.Zpe4HXfO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260720/202607200359.Zpe4HXfO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9f2aee8f7d18 ("kbuild: distributed build support for Clang ThinLTO")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607200359.Zpe4HXfO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: gdb_serial_stub+0x6d8: machine_restart() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: kernel_entry+0xec: start_kernel() missing __noreturn in .c/.h or NORETURN() in noreturns.h

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
