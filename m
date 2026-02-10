Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CB23431F5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 13:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770731989; cv=none; b=gqtHBsHwZUwMMChiCFVK0dTUQ2mi2ZGtSJRhyin/3hXr51kAkiadth0l1l3/spBce+bMH5husrPXmgdMU9GsCDKWRskNURKTGHJbd1NvVvFkok7+PvftmS82k4J0Eti7OTm3/JOrK64S5pQ04Ddy715/EpTUfcwSLycE6GFaBms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770731989; c=relaxed/simple;
	bh=Zh+KByIfJXe7GyOWy4fMAHPPunogsc90EgcI2E7Squ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kqKFEiwtAI8ve60hj1LQ1VqJHFtVStRHwvunwBXfNtff+EOC/CVLVciLq7Zosgs8dRnsp65Cv7gwA5iRPkzmzoq2Yh4u73SJXFwt+xB62DFRzhcyX4XoAT2PoUmLLEm1qeK/MjfOpdzbM//rixzcSWhdLcs+aS3pLoxaJzthRWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=loTuAUKG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="loTuAUKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770731988; x=1802267988;
  h=date:from:to:cc:subject:message-id;
  bh=Zh+KByIfJXe7GyOWy4fMAHPPunogsc90EgcI2E7Squ8=;
  b=loTuAUKG0uEqQ+R8gTcFh6rxMFhxt2CeGW+jzuFFKKzwbcMi1wl6kt+x
   bGskCq8PkV4WunLxBnOuiFlKJCy7Hz48Z0PKe6lzvwZOI4gBjPlmu3yPh
   BB/snAHfjgUMPJZxuFue1oQA8ZwBfpjfA0eQJxy0g2aLmwT2KeuoO6y+s
   q96Pv+6qwT7+whqy8dz80L7JeuV0evTN5I+xgiVbPql0fbH6Ecj2jNzD9
   Wn0PxDjCLFSASd3z9U9HkulFjwcUEc4KWoZ/zD6HMJyHP3PmWtIHCH7U3
   jQKLdWMZi4YuEF4qofHnToBconVjQbiuaUCbvOGQhx/gs/If25vE3Wayi
   Q==;
X-CSE-ConnectionGUID: ow4rUGeTSImD5g6vdzlY9w==
X-CSE-MsgGUID: ei7dBD69ToqgD+CIlP1zhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71757711"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71757711"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 05:59:43 -0800
X-CSE-ConnectionGUID: KICWInkkTtu+ZdMiQpfG+Q==
X-CSE-MsgGUID: 6rszoGWbQtWVONN1oFwDng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211960971"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Feb 2026 05:59:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpoHD-00000000p3k-1SfS;
	Tue, 10 Feb 2026 13:59:39 +0000
Date: Tue, 10 Feb 2026 21:59:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 6/17] <stdin>:1630:2: warning:
 #warning syscall container_wait not implemented
Message-ID: <202602102115.FPurRXJx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   ac4ec62cd4decf787406c1407f18ade110d80c5a
commit: 3445439bc23a673d813e0c9d2fd97745356e6f10 [6/17] containers: Implement container_{create,wait,kill}
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260210/202602102115.FPurRXJx-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602102115.FPurRXJx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602102115.FPurRXJx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   error: include/uapi/linux/container.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/container.h] Error 1
   make[3]: Target '__headers' not remade because of errors.
   make[2]: *** [Makefile:1412: headers] Error 2
   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
   <stdin>:1627:2: warning: #warning syscall container_create not implemented [-Wcpp]
>> <stdin>:1630:2: warning: #warning syscall container_wait not implemented [-Wcpp]
>> <stdin>:1633:2: warning: #warning syscall container_kill not implemented [-Wcpp]
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
