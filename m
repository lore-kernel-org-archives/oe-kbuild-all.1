Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051677;
	b=xLkUjZ6p66IJWczB/8sMYnLmlZYZP0vaG4dN12TZcnxrHkTktrQ1KksgZ6RI6Aw/XVev
	 0Ho9JlDDPjpTSZyv0zdkEv9SKms5FpSZaCqbZz9qvo7g3EEyWvnc1Aklieo5pPsQRtZ0y
	 JREv5oRB5iuimqH3+t04DuPlPlFLH1aH3fpwYNTZddhNDz2v3eb74kuBEcH9pcz+OLm9e
	 779WMbwlmJpUMzvNUqLmlgFZdAdpm0A6Gu8oZiPPIMyLuILPcDWLcGofl61G1m/ZTyceQ
	 mHrCxpZotQB/j2khx0wxMWqVyKEJH5+0uIrTgQOqUmdxw5wG2Y/CpVZBZyW82LrJM/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051677;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=RHCPUTIPEaUx74C8qF6Jt1azv5P0hC3lmRUMfUoIPVY=;
	b=Iek5SVVq0oT7dNpaUsotUylQKaQQbIWoB+xHjXFmCZwds+LuATXG53wZH0pm+nIIqGAw
	 mhxcP+Ogz2Ush1viTSNcY7QCuBi0GjTmrAH+ncDf9BTXUdgWwHEBkD4AsmnC4CArYVqAX
	 P1EwYahZ3GgNX72/ghQmtjULTDJC7SjQCuAzU+B844uaEwcf72vUwZw+ChGhmOvLza7A+
	 ZSAxScfusbsdUNjJrxAY7mnOJh4RTX9k0/9PAklj7SFQQuPIe/GQrUGjXcotQI+HtRSiL
	 VtXVumSwwB093TMBiHpIiwAexOYaGy8GHdECG5b8fJBjQcBxAcGVtBfl5iDDaMB6gNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FIQ2uOzd;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17A4606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 01:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D17A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FIQ2uOzd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795051677; x=1826587677;
  h=date:from:to:cc:subject:message-id;
  bh=wrcB0vxDGMz2bUAFR3YnOGSNM6uW3F5+We2HDfPXiCM=;
  b=FIQ2uOzdtYGgAm3wHEdcwZcXVU1J7f1ji7beuc+9OmpM9IO5+N1cvZuF
   LnY9m+JFv8QGzrNILl3UXhV6x2EIPpLO4YhEK0btD3QG3KOzVgG+m41mN
   cGepdyCBhE1tL6BpT2z//iLuiiH08eJ4RUAcpRHRMmNEtrRVv3jW368s1
   IBIqTGgFc0+g3iTq2CPC9QygMGGChS2VzatT9m/Ni2/k+pIi8Qt8lPF+u
   U7fVLnivISLnZVQhE+JmJ8/aGkIFWDo2HFCz/w17mEeKEETlHgdgRviiE
   TQKP5QzLlBjt3zUffnUuJ99LLjANeqsprr3otjAfFZnxHbFDkvDfn8/za
   w==;
X-CSE-ConnectionGUID: yj2EA8QnSBeflUZASwwFIg==
X-CSE-MsgGUID: jgMZAO8/T5CAwq1hJHvJ1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3782211"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3782211"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 17:27:56 -0800
X-CSE-ConnectionGUID: mHL7LCbTRMG7149eBY08Yg==
X-CSE-MsgGUID: QLYTl9riRkCi6XzQ/rB5wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10564840"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 18 Nov 2026 17:27:55 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTqwK-000000003Zd-46vo;
	Thu, 19 Nov 2026 01:27:52 +0000
Date: Thu, 19 Nov 2026 02:27:10 +0100
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 7/460] kernel/locking/mutex.o:
 warning: objtool: ww_mutex_trylock+0x300: stack state mismatch: reg1[23]=-1+0
 reg2[23]=-2-16
Message-ID: <20261119022212.6zXoaSfi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   754c0efaaee1c85b67fd7f8a45f7be89900b661f
commit: 82057f525ccda9968f71806f9926072ab7071ad0 [7/460] locking/mutex: Annotate the trylock helpers for context analysis
config: loongarch-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261119/20261119022212.6zXoaSfi-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119022212.6zXoaSfi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119022212.6zXoaSfi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/locking/mutex.o: warning: objtool: ww_mutex_trylock+0x300: stack state mismatch: reg1[23]=-1+0 reg2[23]=-2-16
   kernel/locking/mutex.o: warning: objtool: _mutex_trylock_nest_lock() falls through to next function mutex_lock_io_nested()
   kernel/locking/mutex.o: warning: objtool: mutex_lock_io_nested() falls through to next function __mutex_lock()
>> kernel/locking/mutex.o: warning: objtool: __mutex_lock+0x7a0: stack state mismatch: reg1[22]=-2-16 reg2[22]=-1+0
>> kernel/locking/mutex.o: warning: objtool: __ww_mutex_lock.constprop.0+0x7e0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-16

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
