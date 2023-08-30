Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AED1106
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 04:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693368005; x=1724904005;
  h=date:from:to:cc:subject:message-id;
  bh=GY2atcfYJGOu/WzMPldk9lqJpTAmAXJcc/kBcrQsljE=;
  b=D2bLNpWQO7KhwSNFBzLH4ZZ18sCkMRdDgjX1ORE/wJYtAlZZAymJANNa
   lot/hMq7rlQcGFEdSyr06dll7J+LB6h//r3/zAHkSkviNAKOK227DfvqG
   iFy2eXO+Z0UG9SC3U77ajtMo8lf6emJxYBt10BoYaxoonbT3vVP4dpgVH
   nZOqBlRkwH1zhlR688v3wkOYt38sSnusingDLShttEhPjMrbJ7jbJsQhy
   EfEbRVuBTtDsGmhmeLCX3IgN6jftSysQx8SaoW1qzh7aZzY76dYvKyECJ
   gA4d3MuWm7o49aSZ+Kc2G5AwcLFX30IsYgbJwi2EBetaX3dveusWUsR8+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="355051401"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="355051401"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 21:00:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="732451632"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="732451632"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 29 Aug 2023 21:00:03 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbCMY-0009OV-0n;
	Wed, 30 Aug 2023 03:59:52 +0000
Date: Wed, 30 Aug 2023 11:59:13 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox (Oracle) <willy@infradead.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
 Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+550 bytes kernel size regression] [i386-tinyconfig]
 [d7a5d31e77] fs: Allow fine-grained control of folio sizes
Message-ID: <20230830035913.X1xjn%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +550 bytes kernel size regression due to commit:

commit: d7a5d31e77973277c17e5978598308ff98135a27 (fs: Allow fine-grained control of folio sizes)
https://git.kernel.org/cgit/linux/kernel/git/mcgrof/linux-next.git large-block-nobdev-20230829-minorder


Details as below (size data is obtained by `nm --size-sort vmlinux`):

3dd19b83: xfs: enable block size larger than page size support
d7a5d31e: fs: Allow fine-grained control of folio sizes

+------------------------------+----------+----------+-------+
|            symbol            | 3dd19b83 | d7a5d31e | delta |
+------------------------------+----------+----------+-------+
| nm.T.page_cache_ra_order     | 11       | 447      | 436   |
| bzImage                      | 522080   | 522400   | 320   |
| nm.T.__filemap_get_folio     | 338      | 442      | 104   |
| nm.T.readahead_expand        | 351      | 355      | 4     |
| nm.t.do_read_cache_folio     | 251      | 253      | 2     |
| nm.T.page_cache_ra_unbounded | 265      | 267      | 2     |
| nm.t.filemap_get_pages       | 699      | 701      | 2     |
+------------------------------+----------+----------+-------+



Thanks

