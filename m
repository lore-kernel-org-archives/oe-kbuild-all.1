Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60833DA5CD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 10:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785492757; cv=none; b=IMTBzsSD/iemRLEvdPXalrC3PASqnI4ZVHoBy2d93CMHapgPitaotQkAhj665kwzCAIUNvWQoqDgf4S3K5c9E3iXfK62VatU4F2/qF+cOD3yt+rVC3XpMr9b8dy7UTuyzJ0zDmhKukYWG/OBVWBTDw4J9CoZRlnw9SPPhsTphdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785492757; c=relaxed/simple;
	bh=0lfQil6qspLjRaheXlxkBcuB3OeKuLWpArR9Up6MCwo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DtDCyhGrttTpC+mJ3MsXscYNORmeqhp7j63Bt8bXkmeLAO9Hi4PV0HZ/kRVpbB8aTOr2i1zrHhjrz8bKS8MILBPfOh6e4dtfS/US+KaeIXDj6KxwALc4c8c66axOavfNILZogMgWWaUaW3mr1EH2vhPaWkT1gL1ueONHqcpwrXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mORUxxGf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mORUxxGf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785492749; x=1817028749;
  h=date:from:to:cc:subject:message-id;
  bh=0lfQil6qspLjRaheXlxkBcuB3OeKuLWpArR9Up6MCwo=;
  b=mORUxxGfIfBmNBeXy+lXVbaDEhGxnUGD77Xiiq384OyfF8bRvQMGDfSU
   VezuJS7yCcp+0gSWV/sMHz1LWnl8/gOnnPpD3476NhSqOHcMNpigp73SD
   ilfICewbIqfOtBxmY7Vgu/f34MkLheKICKpjLCdmetdlhWwThf3Q0KPYB
   96YuhJt07CHnGRQa1a38D6lh258AftkKVeK7mTBFOMI+P9CMwYjXq/1ww
   AToyBZcnKh6P2lJcX4LPDRrF+y6ktyNr1mtt84sQ670XWEqb8L+Yrropu
   eLBy+kXBXOxHy3MLRQZu+VzSRHYR4WIdI9lcvT4Recrx37M4mrspatOl/
   g==;
X-CSE-ConnectionGUID: SSHhpmtYSm6Sv4n2Bx/ROQ==
X-CSE-MsgGUID: WWCwXA5FRTi45VLd0HVAug==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="96705451"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="96705451"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 03:12:15 -0700
X-CSE-ConnectionGUID: mFXq0fHsTjSihzflTjt19g==
X-CSE-MsgGUID: 03hj57kdQkiGabgQw/gaWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="264354976"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 31 Jul 2026 03:12:13 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpkDr-000000002ku-1Kr6;
	Fri, 31 Jul 2026 10:12:11 +0000
Date: Fri, 31 Jul 2026 12:11:49 +0200
From: kernel test robot <lkp@intel.com>
To: Richard Cheng <icheng@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Vishal Aslot <vaslot@nvidia.com>, Dave Jiang <dave.jiang@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>
Subject: scatterlist.c:9:10: fatal error: linux/scatterlist.h: No
 such file or directory
Message-ID: <202607311257.VJBenMv4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Richard-Cheng/cxl-region-Simplify-poison_by_decoder-error-handling/20260731-152107
head:   9abdf0c701452a29b28df672f6dc98bff89a9c9c
commit: 9abdf0c701452a29b28df672f6dc98bff89a9c9c tools/testing/cxl: Enable zero sized decoders under hb0
date:   3 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260731/202607311257.VJBenMv4-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311257.VJBenMv4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311257.VJBenMv4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> scatterlist.c:9:10: fatal error: linux/scatterlist.h: No such file or directory
       9 | #include <linux/scatterlist.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
