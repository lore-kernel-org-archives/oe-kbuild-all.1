Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDF71A76BB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 22:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770935786; cv=none; b=XDPcly2T4OytfvnOMdraTsKBG5Wo/BbuhjR/cMqgq9GUe+27iWs57sRC4xRxAOhD4R5+GXmnoaZe3bk0JFFQSRqfJ4F4z9FH6VJOJD9ZKyVhodpeZMiGsDnbtiEB8kjOtU6mXI/2ireAU0AsMK1J2uo2ZUtYcvTmbYJXVLHGsa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770935786; c=relaxed/simple;
	bh=zK17CAv+OBaLwIjdgUBnc1qw7E/YLl61ZLfdsy/qKHo=;
	h=Date:From:Cc:Subject:Message-ID; b=I3mrra6o/M03v2Aq/scAJcGSXa+RSttxA6Cr921LhZrf2fHLxwQLjEfxL+GX3L+YjttT3zcgYzmtMhM//Z3F6R7OsxOGuOLI5TQcGwAbS2mCc6CfnvvPwAeYav3ZP1lbRvrljNUC431AZb131XatK1npJKTAS5tmSYThoicXaw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9Cylefs; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9Cylefs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770935785; x=1802471785;
  h=date:from:cc:subject:message-id;
  bh=zK17CAv+OBaLwIjdgUBnc1qw7E/YLl61ZLfdsy/qKHo=;
  b=E9CylefstdxCLratga/F0jmJSVjdXGsAhDPcFygPZBxJXWNqBLb/jaU0
   s+2ko9jB85B6s0gk1PmLwH9tNDubKSj3qCe1FspgJL6BUf7ibQg8v1X7l
   8Q/t5aL8lvgFOBa6TS+nry+OC1eFcxduo+0MowmgjGuvwAXN/B+YuRmpp
   jXq03R0/BvleTGXVkJZclXW30/NQyqH97OWJiHycv5kL7PVtvL4MkPDy5
   5nm4800G4OFBtPEXtFk/klvtLTViDW7ZPe0V6tC+vmhPytLpUNPLlG9oo
   HbLdyNRiCFSGVpxrzQ/6trVu9fCG7wNVV7rdGiO5rd2UszqhYfEw1hshR
   g==;
X-CSE-ConnectionGUID: 2f4J7YPzRWOJ04BApSts4Q==
X-CSE-MsgGUID: 1U1ehCL6RAKSQgBA/hvHog==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72026089"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="72026089"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 14:36:25 -0800
X-CSE-ConnectionGUID: yHW7UD/dT8yr0YkUXAB5YA==
X-CSE-MsgGUID: X5c+esBUQYCuFbBy85cmEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="211685801"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Feb 2026 14:36:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqfIL-00000000trH-3A7M;
	Thu, 12 Feb 2026 22:36:21 +0000
Date: Fri, 13 Feb 2026 06:35:42 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: ld.lld: error: undefined symbol: xe_configfs_check_device
Message-ID: <202602130619.cRfzxVpQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lucas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   136114e0abf03005e182d75761ab694648e6d388
commit: 13dda74a164b570d93d412e812dc80549506410f drm/xe/configfs: Dump custom settings when binding
date:   6 months ago
config: x86_64-randconfig-r052-20260212 (https://download.01.org/0day-ci/archive/20260213/202602130619.cRfzxVpQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130619.cRfzxVpQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602130619.cRfzxVpQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xe_configfs_check_device
   >>> referenced by xe_pci.c:820 (drivers/gpu/drm/xe/xe_pci.c:820)
   >>>               vmlinux.o:(xe_pci_probe)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
