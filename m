Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF9F33CFE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 17:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kq32I3sV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700848276; x=1732384276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sqlsHcn2E8NnrTwYeQmQPuq6paFwSueZ6+HMI+FhcAE=;
  b=kq32I3sVMojAtJpmt/vGz7EEy5iX6TK/6oH0vJ5Art6cK+qqr616byQz
   6l85lIOozfQRVBck/GiWyQVctyH/xwpP01ZIzXn9Ab+w0I1oF3JRhuB5o
   gTpPwWJ6F+UJKTbdKsXO+wyU/FEK5VJX9rcKgkTfXPkElbm7mo7ZXYC0v
   /s9y89HsPLwZJnM8hxMkK7WYQuJ+1Q2uWkZiVsIXw61+zds2eJ9QVpAz0
   GoIsZ/+wokBDAIa4j7IlBaLSLIwnQIHye2hwnTPk/uxZc6WlEsXmtTEkj
   ebGcAyXcMzRL65u041W+RdDjDYMdBF6qILQFNRUpQD4Wtp1tBIw+YzKPx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="382853552"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="382853552"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 09:51:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="761011108"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="761011108"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Nov 2023 09:51:12 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6aKb-00039D-2U;
	Fri, 24 Nov 2023 17:51:09 +0000
Date: Sat, 25 Nov 2023 01:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mina Almasry <almasrymina@google.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [linux-next:master 2098/2998] htmldocs:
 ./include/net/page_pool/types.h:73: warning: Function parameter or member
 'STRUCT_GROUP(' not described in 'page_pool_params'
Message-ID: <202311250015.4rqAghbA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8c9660f6515396aba78d1168d2e17951d653ebf2
commit: 5027ec19f1049a07df5b0a37b1f462514cf2724b [2098/2998] net: page_pool: split the page_pool_params into fast and slow
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311250015.4rqAghbA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250015.4rqAghbA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/net/page_pool/types.h:73: warning: Function parameter or member 'STRUCT_GROUP(' not described in 'page_pool_params'

vim +73 ./include/net/page_pool/types.h

a9ca9f9ceff382b Yunsheng Lin   2023-08-04  43  
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  44  /**
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  45   * struct page_pool_params - page pool parameters
09d96ee5674a0ea Yunsheng Lin   2023-10-20  46   * @flags:	PP_FLAG_DMA_MAP, PP_FLAG_DMA_SYNC_DEV
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  47   * @order:	2^order pages on allocation
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  48   * @pool_size:	size of the ptr_ring
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  49   * @nid:	NUMA node id to allocate from pages from
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  50   * @dev:	device, for DMA pre-mapping purposes
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  51   * @napi:	NAPI which is the sole consumer of pages, otherwise NULL
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  52   * @dma_dir:	DMA mapping direction
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  53   * @max_len:	max DMA sync memory size for PP_FLAG_DMA_SYNC_DEV
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  54   * @offset:	DMA sync address offset for PP_FLAG_DMA_SYNC_DEV
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  55   */
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  56  struct page_pool_params {
5027ec19f1049a0 Jakub Kicinski 2023-11-20  57  	struct_group_tagged(page_pool_params_fast, fast,
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  58  		unsigned int	flags;
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  59  		unsigned int	order;
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  60  		unsigned int	pool_size;
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  61  		int		nid;
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  62  		struct device	*dev;
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  63  		struct napi_struct *napi;
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  64  		enum dma_data_direction dma_dir;
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  65  		unsigned int	max_len;
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  66  		unsigned int	offset;
5027ec19f1049a0 Jakub Kicinski 2023-11-20  67  	);
5027ec19f1049a0 Jakub Kicinski 2023-11-20  68  	struct_group_tagged(page_pool_params_slow, slow,
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  69  /* private: used by test code only */
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  70  		void (*init_callback)(struct page *page, void *arg);
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  71  		void *init_arg;
5027ec19f1049a0 Jakub Kicinski 2023-11-20  72  	);
a9ca9f9ceff382b Yunsheng Lin   2023-08-04 @73  };
a9ca9f9ceff382b Yunsheng Lin   2023-08-04  74  

:::::: The code at line 73 was first introduced by commit
:::::: a9ca9f9ceff382b58b488248f0c0da9e157f5d06 page_pool: split types and declarations from page_pool.h

:::::: TO: Yunsheng Lin <linyunsheng@huawei.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
