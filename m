Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F78B1377
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 04:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693368070; x=1724904070;
  h=date:from:to:cc:subject:message-id;
  bh=JLsUzS19Y5iNC58jramxb3+PAXIsTOK3Vli8PR2s/oQ=;
  b=A1HVavaat02EvipQd7fLptVPA7tY7uDoNF50Yc2EQ2bH5TVG/MSb9EmE
   1K3DLl96XWryXsZo85s4jWBkLzDDhixefTpOXCWfCLy7GGNNcC9rxVJvH
   zzHUayl2Fq/7v2uCHIhlyza4JSm5qbCzusqqZzr0yOzP8wGp/owUd+C6S
   drr/hs5LheWvdOM5QYwBamEjbatEhq5TYjiaQ4Y5LBoIjgWMK+EvNNt/3
   qSuBDr6giZlsQD7ayGXNQ1TTAEkPvq7j8WZRCSphXAJomnB24/UVcyYBN
   PFFD10ocJFs1JIwUq8yYMQEkIE4b9pbX7YBV+8GtrXhHOrguUOAWKJzhd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="375501676"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="375501676"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 21:01:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="738957582"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="738957582"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 29 Aug 2023 21:01:08 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbCOA-0009Oe-0x;
	Wed, 30 Aug 2023 04:01:07 +0000
Date: Wed, 30 Aug 2023 11:59:50 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>,
 Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
 Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+194 bytes kernel size regression] [i386-tinyconfig]
 [a685a39566] readahead: align correctly with filemap min order
Message-ID: <20230830035950.0f7TU%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +194 bytes kernel size regression due to commit:

commit: a685a39566f3de98a736f465d993cb63a6455f7f (readahead: align correctly with filemap min order)
https://git.kernel.org/cgit/linux/kernel/git/mcgrof/linux-next.git large-block-nobdev-20230829-minorder


Details as below (size data is obtained by `nm --size-sort vmlinux`):

809019f3: mm/truncate: align while truncating the page cache
a685a395: readahead: align correctly with filemap min order

+--------------------------+----------+----------+-------+
|          symbol          | 809019f3 | a685a395 | delta |
+--------------------------+----------+----------+-------+
| nm.T.filemap_fault       | 1133     | 1203     | 70    |
| nm.T.page_cache_ra_order | 447      | 512      | 65    |
| bzImage                  | 522624   | 522688   | 64    |
| nm.t.ondemand_readahead  | 498      | 557      | 59    |
+--------------------------+----------+----------+-------+



Thanks

