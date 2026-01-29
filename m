Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4C737418B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 12:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769689387; cv=none; b=ZytI9Ef+eDdTLHSL2YOs6/mKprouQ58BrUO9lSOHmyhPe976DWoZbYFLBqCqKGxDmBARcxuRJxdJ+MdfB0poDR9oUKrhBuuXxmcdq+51T5olqXoOOVK2DXqw9eZmPp8sk3T0VdAXSOaAnwD42IZ7xh9mNio/zOIxvKEDPdMvsDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769689387; c=relaxed/simple;
	bh=Pa/ttwvdU/dk7trjCGye8JJcFDD9lt4IDcr5c3wq0zg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SCf/SsNmrJF/uLH3tPJ6zojk03VVj9/j5dIsq/3nLYOwzoAuV+dfhRA5SqH1jwjGwxMQkXo0olZMANdPI+hRAtZAzTRmwS0p76MPlipO45xLb53HSJVz7BW4cc2WqSYN2oz/v3rvpF38iWNPu5PwYGXguI3m7YsSkWXkMngkGIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SC3RjLvW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SC3RjLvW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769689386; x=1801225386;
  h=date:from:to:cc:subject:message-id;
  bh=Pa/ttwvdU/dk7trjCGye8JJcFDD9lt4IDcr5c3wq0zg=;
  b=SC3RjLvWDYgyrLHiFifQ8RHj+CYIh4TGOhogU3zNv9BEe+ATA2Eqtr09
   voewYhYdWis7pLQMg9I7Sk0yiYnL+dH21LtuEvV6pndeTXkgIJwaDXdV8
   wEI73waArowOb7iJnj0cxlEhYilB0WU6NvEGXworXFh1RzBe0pX2KgSyq
   EzwbQKhkgqEv+kLTVXz70FLROEhSsOtgb/JLeqv3qMs+Sh7q0angKJPuf
   DCIidbSwy4wx7bsqzorpdnfZFN9CxwCeBmHcQVGbN5tSDWXfI1OT/XuS4
   yPIVQqhZusTIQG6JkHQJMFyP7QxIwmW2XU8KFQ5jdncrszpXhTHPmKPKK
   A==;
X-CSE-ConnectionGUID: hM6F2xdWT+W5HkmV19tsAg==
X-CSE-MsgGUID: q9W6HRToQwaRTuepCpXdpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="96390407"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="96390407"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 04:23:05 -0800
X-CSE-ConnectionGUID: kvWZAZU/Q4Sm9Kuyf+3W2g==
X-CSE-MsgGUID: 0xgVKY2YQrK5A1+TInxPYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="246194174"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 29 Jan 2026 04:22:57 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlR30-000000002ID-3Wqo;
	Thu, 29 Jan 2026 12:22:54 +0000
Date: Thu, 29 Jan 2026 13:22:23 +0100
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:vcam 5/5] ERROR: modpost: module vcam uses
 symbol dma_buf_fd from namespace DMA_BUF, but does not import it.
Message-ID: <202601291355.OGyb8JNc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git vcam
head:   f29b36ecc2e18e1d170008dd2401fea768fac4f0
commit: af5e226e9c3ff4706a684902f7ffbf1caf78a375 [5/5] media: Virtual camera driver
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260129/202601291355.OGyb8JNc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291355.OGyb8JNc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291355.OGyb8JNc-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module vcam uses symbol dma_buf_fd from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module vcam uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module vcam uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
