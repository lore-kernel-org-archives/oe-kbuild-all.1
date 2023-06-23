Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3880117EA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 11:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687519400; x=1719055400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=81LRefKU8BGXDGUA85A5+2sIgcJJwbq49gMIs8ake2c=;
  b=Dex9NrPTU4BjRy3ay4RoFTsR5+62MGyqpkhkETYBFV+1TNreNk1Uve9e
   4BjD0CX8povjLLAmagM064lHHJSnLKLnoBQod2Cp/+sxWjaLCyFIW9bbz
   aCHhV6GC675fUneUZ9nRPRJ/coPQzotXSzrFvdsAyqsEO/ILypGny4jxY
   R5sb1mAsr4lZQixcz+6ALfGImI2EecVTzP+vMNVeBbS8Obwc/JMzpYo7o
   2gSgemWdP8mGpWdo/LwwiUYLLaQsgXJjWxg//wfmSLh29RVcwRUYNVu11
   3FmEW9lu/IXvUB28agqARXpPQi9zyZ8JCX/fcVnDxsTOesS8gM4rt8n8M
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="350509414"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="350509414"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 04:23:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="692640736"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="692640736"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 23 Jun 2023 04:23:07 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCesc-0008EX-0m;
	Fri, 23 Jun 2023 11:23:06 +0000
Date: Fri, 23 Jun 2023 19:22:45 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-doc@vger.kernel.org
Subject: [alobakin:iavf-pp-frag 5/16] htmldocs:
 Documentation/networking/page_pool.rst:13: WARNING: Unexpected indentation.
Message-ID: <202306231923.s56qtxJ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux iavf-pp-frag
head:   8a9702eb20d5ce6bc2b3f9b9fa11acdab3dec34e
commit: 506d987e22d729c0f78e791b10dd5849bca689ba [5/16] page_pool: update document about frag API
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306231923.s56qtxJ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306231923.s56qtxJ1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/networking/page_pool.rst:13: WARNING: Unexpected indentation.

vim +13 Documentation/networking/page_pool.rst

     9	
    10	Basic use involves replacing alloc_pages() calls with different page pool
    11	allocator API based on different use case:
    12	1. page_pool_alloc_pages(): allocate memory without page splitting when driver
  > 13	   knows that the memory it need is always bigger than half of the page
    14	   allocated from page pool. There is no cache line dirtying for 'struct page'
    15	   when a page is recycled back to the page pool.
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
