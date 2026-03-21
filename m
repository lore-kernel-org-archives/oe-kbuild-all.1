Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E9729ACC5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774089549; cv=none; b=uZcrBZnKDYnKJ+OO+0hErYoL8QfGSmYKBxZA1rGqpnqi9vIv1hlZT72yLGMEeToiTxodqNqCncJDGOsH22OPB0vzKwi29fFlvkwUpxGchQyb7E8RKEi50p0XMQFcZpLi3s/H0NqCLOsc3ZrG7oD+Ttg00oQHgljQsZ5VBkvDRyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774089549; c=relaxed/simple;
	bh=W9kbvELH4yiW3lV93scpVc9DsnUJM5n5I7gSXm2W1kY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J4cFdwEOk9ZZa1tBat4Hzdfos8UKpRCYKzeDrRF80q0XApytq2Ty9yPxTQjLrxTE11DlEXDhZW9Ue8ttoNiI60hrq+DKhKBoMkh55BPl+ay3wQTurAs1sttyA+1JLAUO5ZRrjNaMig5yf5Ue6CELBVswLM4q5XgjpXkNbFBxgOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVwm04AT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVwm04AT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774089548; x=1805625548;
  h=date:from:to:cc:subject:message-id;
  bh=W9kbvELH4yiW3lV93scpVc9DsnUJM5n5I7gSXm2W1kY=;
  b=jVwm04ATXFC8dPJk7zJitflnF9+BKOFthikt86JLwam2eI0gApvdhjeq
   u+ICxQfYh9qf/9K3UWpRwc6oYzH4W8kMa8pPdMXgOlkMEcnugK+Bu9r62
   VM+h+kiWh6cHTCtkd97ANQNrlULCDZVjn3pZ2qu/lkbEpzGJef3uBhMf4
   WXfQuqvEJVcDdI8dCsbcywQDM8LewV6u6j+fV5sGfkJ4MKQcb7/T7/+gK
   8c6Lmm8ee2DlRwx+pAuQYnMOcnqihJ+QeZltZ60hHGos8b6lW/v8oSQrN
   QhtgbgUDp7XNOVyKbg/PsCGLiW5e+7pwrCdnW8XDcXmISrdZzKH0+1Zpo
   g==;
X-CSE-ConnectionGUID: i2swcVGcSZOVvoGfFat6vw==
X-CSE-MsgGUID: IKDO0hINQfOnu86F8nSpjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74872637"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="74872637"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 03:39:08 -0700
X-CSE-ConnectionGUID: S0wJ/CBPS0uhYjWVTyeN/g==
X-CSE-MsgGUID: o7+xz3zNQ9SSM+vPn3B1JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="227646338"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Mar 2026 03:39:05 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3tjT-000000000bx-0ZLZ;
	Sat, 21 Mar 2026 10:39:03 +0000
Date: Sat, 21 Mar 2026 18:38:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:lib-raid6 29/33] lib/raid/raid6/arm/neon1.c:28:10:
 fatal error: neon.h: No such file or directory
Message-ID: <202603211831.QH9kHkQc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git lib-raid6
head:   83a13a72f6f47b7ba7d26a200575edb70bf23c70
commit: 252652e3d689463259c19e406e5de766a6674d0f [29/33] raid6: move to lib/raid/
config: arm64-randconfig-003-20260321 (https://download.01.org/0day-ci/archive/20260321/202603211831.QH9kHkQc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211831.QH9kHkQc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603211831.QH9kHkQc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/raid/raid6/arm/neon1.c:28:10: fatal error: neon.h: No such file or directory
      28 | #include "neon.h"
         |          ^~~~~~~~
   compilation terminated.
--
>> lib/raid/raid6/arm/neon2.c:28:10: fatal error: neon.h: No such file or directory
      28 | #include "neon.h"
         |          ^~~~~~~~
   compilation terminated.
--
>> lib/raid/raid6/arm/neon4.c:28:10: fatal error: neon.h: No such file or directory
      28 | #include "neon.h"
         |          ^~~~~~~~
   compilation terminated.
--
>> lib/raid/raid6/arm/neon8.c:28:10: fatal error: neon.h: No such file or directory
      28 | #include "neon.h"
         |          ^~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
