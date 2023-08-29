Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B7410EC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 05:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693287986; x=1724823986;
  h=date:from:to:cc:subject:message-id;
  bh=moMiomSM3X1ZKRd1BNY/yi+xxuA578W2vAavdP2YlH8=;
  b=KDmzIpd9+M9VRRYUz/UlJNXpP9Ce/HmY2v62+J3v9DdP5zhN/wyomC1s
   EKHjqmbtRnh6G4KN8X7pDpH0EaPPqNgyP9uzU6wUFZOdhaUpXgZmFwecG
   Jy05fu50jqDIHWoecRWA2wR06QEA2Ny1DYtY8RpgiS+LRYmHXUOrAyuvP
   uk4qKKRZyVnBv0lBUyQNSNkEwQFv/CTGDfO9d3e+DPc5eRNg16f4+a/i/
   OY5Ulm+VnytQEiO+EZ6/ar4tvtEnGCJjH1LErDqCoMTve59AD4xTE//QQ
   1qiGUTaRepeFxpUslVrgwq60ML7YwDjvYo6Nji/XH2rCoRrSWWYlXgaKo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="355607356"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="355607356"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 22:46:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="803962528"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="803962528"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Aug 2023 22:46:22 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qarYT-0008Rp-0y;
	Tue, 29 Aug 2023 05:46:21 +0000
Date: Tue, 29 Aug 2023 13:46:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sultan Alsawaf <sultan@kerneltoast.com>,
 Jan Alexander Steffens (heftig) <heftig@archlinux.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
 Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+182 bytes kernel size regression] [i386-tinyconfig]
 [873f6a705c] ZEN: mm: Stop kswapd early when nothing's waiting for it to free
 pages
Message-ID: <20230829054618.FJfix%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +182 bytes kernel size regression due to commit:

commit: 873f6a705cfc89dd35a84c22023d4188362ba74a (ZEN: mm: Stop kswapd early when nothing's waiting for it to free pages)
https://github.com/zen-kernel/zen-kernel 6.5/zen-sauce


Details as below (size data is obtained by `nm --size-sort vmlinux`):

c42a5c8a: ZEN: Set default max map count to (INT_MAX - 5)
873f6a70: ZEN: mm: Stop kswapd early when nothing's waiting for it to free pages

+------------------------------+----------+----------+-------+
|            symbol            | c42a5c8a | 873f6a70 | delta |
+------------------------------+----------+----------+-------+
| bzImage                      | 516432   | 516624   | 192   |
| nm.t.__alloc_pages_slowpath  | 1413     | 1514     | 101   |
| nm.t.throttle_direct_reclaim | 361      | 409      | 48    |
| nm.t.balance_pgdat           | 656      | 671      | 15    |
| nm.t.allow_direct_reclaim    | 130      | 144      | 14    |
| nm.B.kswapd_waiters          | 0        | 4        | 4     |
+------------------------------+----------+----------+-------+



Thanks

