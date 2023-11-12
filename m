Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976BE23BD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 06:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sq4CTa20"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699771601; x=1731307601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wcp1XfKbD/ULCvvrdOmAjmo3QZadNTyi50hRZubx6Mo=;
  b=Sq4CTa20v02M4sYC3/Vbvt+J4dSLWusHQskYo4e7BRET2dHQN9pukqjg
   UD027+AcBULw59aoo2865LQ0xZaGX3ob1CEFKreyL+eR2skqSkXaOpl3E
   yLqnU3kO0vgH4r8wOfE8ugYIMf5LhVvqAC6TEAxqjZ2KTu5BEcUyPT0cg
   pkbXW35or3WOO0anosM0aDKR9iXjxSniSSoXZNSTrhA19bStp4/rJey+G
   pS4oc+gJx2bbAweOznK1Zmy6i6yTYNAtPmTAkvA/zwRmYHH/+OoiU2TGh
   m0zjrZvua4gDvgM//sl2NZurSgC37uXdAWFPfRHBR7Ajl6OzKnR8HPz9h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="3338644"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="3338644"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 22:46:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="740496449"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="740496449"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Nov 2023 22:46:37 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r24Et-000B0A-1P;
	Sun, 12 Nov 2023 06:46:35 +0000
Date: Sun, 12 Nov 2023 14:46:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Yunsheng Lin <linyunsheng@huawei.com>,
	Mina Almasry <almasrymina@google.com>
Subject: [linyunsheng:devmem 2/6] htmldocs:
 ./include/net/page_pool/types.h:71: warning: Function parameter or member
 'memory_provider' not described in 'page_pool_params'
Message-ID: <202311121429.hGEhBVN5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git devmem
head:   7a7ba800a9e8fb07001a3e478b385f86011a5fdc
commit: 1f7327b09abea7e8a7ef2f95b584ad4d48f785dc [2/6] net: page_pool: create hooks for custom page providers
reproduce: (https://download.01.org/0day-ci/archive/20231112/202311121429.hGEhBVN5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311121429.hGEhBVN5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/net/page_pool/types.h:71: warning: Function parameter or member 'memory_provider' not described in 'page_pool_params'
>> ./include/net/page_pool/types.h:71: warning: Function parameter or member 'mp_priv' not described in 'page_pool_params'

vim +71 ./include/net/page_pool/types.h

a9ca9f9ceff382 Yunsheng Lin   2023-08-04  43  
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  44  /**
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  45   * struct page_pool_params - page pool parameters
09d96ee5674a0e Yunsheng Lin   2023-10-20  46   * @flags:	PP_FLAG_DMA_MAP, PP_FLAG_DMA_SYNC_DEV
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  47   * @order:	2^order pages on allocation
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  48   * @pool_size:	size of the ptr_ring
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  49   * @nid:	NUMA node id to allocate from pages from
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  50   * @dev:	device, for DMA pre-mapping purposes
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  51   * @napi:	NAPI which is the sole consumer of pages, otherwise NULL
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  52   * @dma_dir:	DMA mapping direction
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  53   * @max_len:	max DMA sync memory size for PP_FLAG_DMA_SYNC_DEV
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  54   * @offset:	DMA sync address offset for PP_FLAG_DMA_SYNC_DEV
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  55   */
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  56  struct page_pool_params {
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  57  	unsigned int	flags;
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  58  	unsigned int	order;
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  59  	unsigned int	pool_size;
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  60  	int		nid;
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  61  	struct device	*dev;
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  62  	struct napi_struct *napi;
1f7327b09abea7 Jakub Kicinski 2023-11-05  63  	u8		memory_provider;
1f7327b09abea7 Jakub Kicinski 2023-11-05  64  	void            *mp_priv;
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  65  	enum dma_data_direction dma_dir;
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  66  	unsigned int	max_len;
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  67  	unsigned int	offset;
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  68  /* private: used by test code only */
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  69  	void (*init_callback)(struct page *page, void *arg);
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  70  	void *init_arg;
a9ca9f9ceff382 Yunsheng Lin   2023-08-04 @71  };
a9ca9f9ceff382 Yunsheng Lin   2023-08-04  72  

:::::: The code at line 71 was first introduced by commit
:::::: a9ca9f9ceff382b58b488248f0c0da9e157f5d06 page_pool: split types and declarations from page_pool.h

:::::: TO: Yunsheng Lin <linyunsheng@huawei.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
