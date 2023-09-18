Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777CB4C86
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 05:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695014273; x=1726550273;
  h=date:from:to:cc:subject:message-id;
  bh=j4jLF0IJOhfOi+LUamhe8DSkPJdhASdkQCIqxbKcn20=;
  b=TtzEjXGIkplnI6P96Chpz4Kq1qucJNDiZobZU5SbNyWtE4edwgOOzdU1
   Jy8KwrR2/uv1eHgMmuvRPCKkixRHjHYxDdtDbqCw/FHNfSs7b1FXPA92h
   +Y19EageK5SUQ0yd60Jgfw8W/uwAzjG083sOMy3C2BVpAIIAgkQl4fEXA
   RZyKFhYhHIxEvKsvA0Fvlo7lGcQNxW//sP6GPzSculQU0tHVV3GNMX3+t
   bVsDBtgA9qPzldPSiDcQfZVEBk+lm+xXZ/sNrHGESxnyUII5WewV653n7
   C2PMJTa9fEmZr37l447npCo5prB/t6Ce7Fh+eL/BXDLEMjRBUvmLicwVO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="379480329"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="379480329"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 22:17:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="695391614"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="695391614"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Sep 2023 22:17:49 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qi6dn-0005lC-0O;
	Mon, 18 Sep 2023 05:17:47 +0000
Date: Mon, 18 Sep 2023 13:16:52 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
 Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+129 bytes kernel size regression] [i386-tinyconfig]
 [5bd1e5e77d] truncate: align index to mapping_min_order
Message-ID: <20230918051652.o03QE%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +129 bytes kernel size regression due to commit:

commit: 5bd1e5e77db319d06f230d233fb1875e51102ec8 (truncate: align index to mapping_min_order)
https://git.kernel.org/cgit/linux/kernel/git/mcgrof/linux.git v6.6-rc2-lbs-nobdev


Details as below (size data is obtained by `nm --size-sort vmlinux`):

f86fa7e6: readahead: align ra start and size to mapping_min_order in ondemand_ra()
5bd1e5e7: truncate: align index to mapping_min_order

+------------------------------------+----------+----------+-------+
|               symbol               | f86fa7e6 | 5bd1e5e7 | delta |
+------------------------------------+----------+----------+-------+
| bzImage                            | 522976   | 523168   | 192   |
| nm.T.truncate_inode_pages_range    | 806      | 878      | 72    |
| nm.T.invalidate_inode_pages2_range | 455      | 488      | 33    |
| nm.T.mapping_try_invalidate        | 221      | 245      | 24    |
+------------------------------------+----------+----------+-------+



Thanks

