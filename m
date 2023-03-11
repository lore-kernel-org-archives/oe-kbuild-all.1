Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDD37B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Mar 2023 04:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678510062; x=1710046062;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=kUsE6TDtMAo7iKN1uxRfwp5EFadJNtZpyIoNoqViIMU=;
  b=U66ylmXCAMZMfn4c4Au8vhNeimgeDnfsvA6mTr90LVaDcvz2Ati/pPwh
   t5JvBrRUQqgtixfPWpIubnHzTjXb4y5DHnOL+3cR6umAHrefmFESCBBYD
   mYEkgSl1aI+1Zkl6Ffag2nReAw02in3yn1qte6S40JQQ8E5BFRX1RsiNv
   FXaSVCZVgq5ylnjjHC3mEjCvS6VttCQXaV6OOSz7DMHxh/SjhG362m9DQ
   qzlKHCBp9px4PGUqCXdUSmg2l+fdF58I8s5Fo7oxVQb+vvmVIp9zf0LQk
   HJEZR/JAgRtU5WCTR+ntIVP8mTcA/B2UO5IQ73oZyt5yZdTZ1/yWZAQx2
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="338433529"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="338433529"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 20:47:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="671315970"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="671315970"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Mar 2023 20:47:41 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1par8u-0004L4-07;
	Sat, 11 Mar 2023 04:47:40 +0000
Date: Sat, 11 Mar 2023 12:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: Doug Berger <opendmb@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
	Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+661 bytes kernel size regression] [i386-tinyconfig]
 [f9fbaaba68] mm/dmb: Introduce Designated Movable Blocks
Message-ID: <ZAwH0yRdrWjLNB69@ea1f349249c4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230311003855.645684-8-opendmb@gmail.com>


FYI, we noticed a +661 bytes kernel size regression due to commit:

commit: f9fbaaba68da88b0ea457feacab434a3fc655153 (mm/dmb: Introduce Designated Movable Blocks)
url: https://github.com/intel-lab-lkp/linux/commits/Doug-Berger/lib-show_mem-c-display-MovableOnly/20230311-084243
base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
patch link: https://lore.kernel.org/all/20230311003855.645684-8-opendmb@gmail.com/
patch subject: [PATCH v4 7/9] mm/dmb: Introduce Designated Movable Blocks


Details as below (size data is obtained by `nm --size-sort vmlinux`):

3857ef0e: memblock: introduce MEMBLOCK_MOVABLE flag
f9fbaaba: mm/dmb: Introduce Designated Movable Blocks

+---------------------------------------+----------+----------+-------+
|                symbol                 | 3857ef0e | f9fbaaba | delta |
+---------------------------------------+----------+----------+-------+
| bzImage                               | 501664   | 502176   | 512   |
| nm.t.calculate_node_totalpages        | 0        | 352      | 352   |
| nm.t.zone_absent_pages_in_node        | 0        | 334      | 334   |
| nm.T.dmb_reserve                      | 0        | 127      | 127   |
| nm.T.dmb_intersects                   | 0        | 81       | 81    |
| nm.T.dmb_init_region                  | 0        | 77       | 77    |
| nm.b.dmb_areas                        | 0        | 56       | 56    |
| nm.t.find_zone_movable_pfns_for_nodes | 546      | 592      | 46    |
| nm.T.memblock_free_all                | 382      | 395      | 13    |
| nm.b.dmb_area_count                   | 0        | 4        | 4     |
| nm.d.max_dmb_pfn                      | 0        | 4        | 4     |
| nm.d.min_dmb_pfn                      | 0        | 4        | 4     |
| nm.T.absent_pages_in_range            | 11       | 14       | 3     |
| nm.T.free_area_init                   | 1408     | 968      | -440  |
+---------------------------------------+----------+----------+-------+



Thanks


