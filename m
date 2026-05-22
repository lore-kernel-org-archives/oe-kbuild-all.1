Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6AC34D385
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 May 2026 16:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779468565; cv=none; b=YHRezB9vKs/am3MwmF9TAmwj/1pZBnbZ693/uhlVnVzX/6ZpZ145FOEu9vPqZo2uC4pkCMR4s47/OIEFDBUEfmVIMb3cZCFILYjOaMDi1R8+DNften98DXoBfuRXNu7pBSIbxZfjcrtJds4R/bRVnobTV/G8FVanybozY8ARJNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779468565; c=relaxed/simple;
	bh=v686QTn2QFvIj9kF5L2WtAG/ujMvlViSU4OoDoeh4i4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Au6A0ebNmXRo+pR5An6NMJC2DQwMFa7rFUAB2p61Kk2HM6c40vnEr9HlJWy9vlVwseeQNhiva0a3U87nj/k7PSFYsY7FW8Rxaqd/FrJz37XP+qiVcCwvXdNIFpaORtVn+lBk3NZVOBlulMVuGHFw99LSTTQQZt+CbO9sSRpSthU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QOmDrp3t; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOmDrp3t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779468563; x=1811004563;
  h=date:from:to:cc:subject:message-id;
  bh=v686QTn2QFvIj9kF5L2WtAG/ujMvlViSU4OoDoeh4i4=;
  b=QOmDrp3t8H0lftS6iaSkxP5y68faxbCKBC7UiNgLHo3Zw3D1pD2pGZGi
   C8CzpJsz83iNwKv0gNsGQ0ZGTZQ3BXNZBHLArruulOs5z99AjWtR3wZDi
   XvZIDxAdIDOSPxlIBQkZKyqYuvbVycPHl1t9qmzxhz+iPPxk7q/2N2eKQ
   BcG75RRIQUmu+lEfo5bKJP7wgiQHhec8mPNrklJlbdnbRfYFcWiTG+X7P
   Eht8EwHDQC9qi4EhyZ00YCAjA3/pXdv5UbP2XhAd5XdlZGPMC/qLZfr0k
   nd7PxgthemCg4a5sxmnU0KbGGXQiPfK7Ijyi6QVeWUtc+Pl9FljmJpZ3w
   w==;
X-CSE-ConnectionGUID: bPunVcsaQ76qcvh5Yviw7g==
X-CSE-MsgGUID: cd90whBlQa2zzsQbZLV0PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91087916"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="91087916"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 09:49:22 -0700
X-CSE-ConnectionGUID: xBuX8AdxQGuu1kA4GjmURw==
X-CSE-MsgGUID: /9F70PI+SjubGV9RzpcnDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="264506527"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 May 2026 09:49:21 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQT3l-000000002jt-4C3Y;
	Fri, 22 May 2026 16:49:18 +0000
Date: Sat, 23 May 2026 00:48:27 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "T.J. Mercier" <tjmercier@google.com>
Subject: [linux-next:master 7127/8157] ERROR: modpost:
 "set_memory_decrypted" [drivers/dma-buf/heaps/system_heap.ko] undefined!
Message-ID: <202605230046.E9uhmQXM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c1ecb239fa3456529a32255359fc78b69eb9d847
commit: fd55edff8a0abe1b198af9a4280bfb208b9d2ab7 [7127/8157] dma-buf: heaps: system: Turn the heap into a module
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260523/202605230046.E9uhmQXM-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605230046.E9uhmQXM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605230046.E9uhmQXM-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "set_memory_decrypted" [drivers/dma-buf/heaps/system_heap.ko] undefined!
>> ERROR: modpost: "set_memory_encrypted" [drivers/dma-buf/heaps/system_heap.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
