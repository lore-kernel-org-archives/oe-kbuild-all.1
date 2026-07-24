Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D9E279DAF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jul 2026 00:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784854565; cv=none; b=Ys2HiQDeOUoYDV2Aa7cK7vP6LNSgmXTl/8V67jdR7UinlrOzCwCi+5V9jz24lzqmPwHnAselyOVRvcNb81xQB2ILgUhM4k35wvPFP1kCcPg6snrd2LB5dzYDj5J5ouzo9YXRc4ql3HUpQuOml4dm4MQM83wABZgoVXfy3adbzrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784854565; c=relaxed/simple;
	bh=M+g5pad0eBgYOaY+8EKEzpTi8ymdh5TxIzQ7ItR2Ac0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IwS8Ofa2t/4tV+fLKfEiVL0oqLUdV9T1wEK/7I+MQIrP+9lWI15BTNK1GH+nmVwy/Ucz1sdGZ8r29sF7h9H3AFm5h5CMy/MCMGgaFueQv/jvIFE6D/cZgx/mxFksDVzqHlj6agijPB4dSyhIj9QbkxM5w8YeqQRZA9BafrDU2UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P37qlCdB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P37qlCdB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784854564; x=1816390564;
  h=date:from:to:cc:subject:message-id;
  bh=M+g5pad0eBgYOaY+8EKEzpTi8ymdh5TxIzQ7ItR2Ac0=;
  b=P37qlCdB0BpasgOwIa7TSF+TXCShfioqkl5IlOnKKv2ILpTE5iGHlA1U
   qj0ILvNCxlmVxIiacZNiFK4xkqD8mzvsPbpwU5/GHkbbYPfpF/gddd3ed
   SvUdrC1tv39Su+1fJh+qLfGXtGLdQES1g4Xy/nKasKJpgOj8bPtyAg7BV
   5J/1wUxnLbhbHF2tkhGkjpHQA1nRPjHVjIkDh0rTdAJtGZUNfJkKFByme
   7Er6V9HdE4inhsvT+9f6j33W+ggLqEpVSqnxm5/ooipUQK86zh6iv8I3w
   +81B3OCZfH1flYfxN0xvjKxUM0hy31CZKJ9IpkQ1M4vPZRJaNWMv17SSg
   g==;
X-CSE-ConnectionGUID: ghZ5ceASSsOMQWoUaEEh4g==
X-CSE-MsgGUID: AMI4+TVBT3SyDdtKLLG9tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96183470"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="96183470"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 17:56:03 -0700
X-CSE-ConnectionGUID: G/UBsnXuRiSAZLCt3R5rJw==
X-CSE-MsgGUID: 1JMY2jpMSRiGh3QN4H6xDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="254239972"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jul 2026 17:56:02 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wn4Cl-000000000tm-2DZN;
	Fri, 24 Jul 2026 00:55:59 +0000
Date: Fri, 24 Jul 2026 02:55:43 +0200
From: kernel test robot <lkp@intel.com>
To: Alexandre Courbot <gnurou@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Brian Daniels <briandaniels@google.com>
Subject: error: /kbuild/src/include/uapi/linux/virtio_media.h:
 missing "WITH Linux-syscall-note" for SPDX-License-Identifier
Message-ID: <202607240212.GDvkOWKO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Brian-Daniels/media-virtio-Add-skeleton-virtio-media-driver/20260724-064923
head:   01fceb70ec03eeb7712d0fd675a33df84773f422
commit: 45b06018b2667afacb4b2a036dd9717d09d16cd6 media: virtio: Add skeleton virtio-media driver
date:   2 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce: (https://download.01.org/0day-ci/archive/20260724/202607240212.GDvkOWKO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607240212.GDvkOWKO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: /kbuild/src/include/uapi/linux/virtio_media.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
   make[3]: *** [/kbuild/src/scripts/Makefile.headersinst:63: usr/include/linux/virtio_media.h] Error 1
   make[3]: Target '__headers' not remade because of errors.
   make[2]: *** [/kbuild/src/Makefile:1471: headers] Error 2
   make[1]: *** [/kbuild/src/Makefile:248: __sub-make] Error 2
   make[1]: Target 'headers' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'headers' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
