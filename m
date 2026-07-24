Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8555E306757
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jul 2026 19:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784921322; cv=none; b=YNDH9yXC69+kqYObt5JfGGdmb5VjBwISK0YHUX2vMkIdOzBhB91PoHUn0F0ZPEnSGZfk0d9hZjDJy9Nl01Se/e+vWmbSoqzObA2aY2JzqpBpkO/T+EfXCt/2VjvtvtENlPu3tIYJ+vr5I79ndxs2NwXqTsq1yMxTiFbvUnXjMaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784921322; c=relaxed/simple;
	bh=jaLFr/Vb3eUhIG6eZW7NpneFghGs3A4/AXKesT756Wo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=grOLx7EFlKRIfCwAtoQAOTaPCVQQGt7IFTuSVQYoGkUv+jYRKjAF4WYYXkmdfIy/34XPhbdMTDHnJnpFidnsPA6cr2blSKiun9rnUatjmglbAAHrfPMOE2fGWxc8hVsFCCRgftXtBUar6AnyqsTDbEjb0RofSXiD8wMZ054wOB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+xgihhY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+xgihhY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784921319; x=1816457319;
  h=date:from:to:cc:subject:message-id;
  bh=jaLFr/Vb3eUhIG6eZW7NpneFghGs3A4/AXKesT756Wo=;
  b=K+xgihhYxfWUhDi+4NA7mRJoHIaNrVB7h6fvfAPtt4KTbWzopv6KHlQs
   9ztafW/WFm9qc7bFGOBLrR4O4j7OWrBH+5hmHX4UTLT752ix9R9tt3rXu
   YW2uNtKqPM7QPRSXSgzuutPeygTfm9B6uFQ8F+IFfogqWlLzn5h8dAXpJ
   whTQkZ46X2YhZ4f4lcBn14pD8go2d22g0wsDcZtjlZSUHyC7sj1MQjdsh
   pGFT3XRxMAxdljipwz1VSQBLyW0FWZ1VBLgDDeF1GeJO9k7OMkBEZFwTh
   2ksrLLkK9E85l9sJdQf+28E7IMiAwUIdJ/X0S+EWP046NXf/7FyTFgUgf
   A==;
X-CSE-ConnectionGUID: HabwAPf/Q8msjbU9fninAA==
X-CSE-MsgGUID: 86omFloCSk6XVINWCfbLdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89418686"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="89418686"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 12:28:38 -0700
X-CSE-ConnectionGUID: B4fqXbLnT+GlzdZDowc9vw==
X-CSE-MsgGUID: zN2QZ87yRI+0rWpWAWF4Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="259446767"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 24 Jul 2026 12:28:38 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnLZS-0000000010U-1CHT;
	Fri, 24 Jul 2026 19:28:34 +0000
Date: Fri, 24 Jul 2026 21:28:04 +0200
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 49/59] ERROR: modpost: "crc64_nvme"
 [fs/xfs/xfs.ko] undefined!
Message-ID: <202607242141.mVsSGB0d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   10c7aa6f2c85085eec34737be592d6ae69583782
commit: d03ebf6714c5e279b8471e8e7fa71d21217b4881 [49/59] xfs: core RT data checksum support
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260724/202607242141.mVsSGB0d-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260724/202607242141.mVsSGB0d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607242141.mVsSGB0d-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "crc64_nvme" [fs/xfs/xfs.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
