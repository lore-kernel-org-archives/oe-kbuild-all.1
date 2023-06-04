Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02965CB9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jun 2023 15:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685894279; x=1717430279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zDPv/ea5ocKDY+56l5ZrJYGBiHUKerLaskCT3iGqxvc=;
  b=fTC9BV/+IQy4vs2eN3zV6tAGBLY0i3vzQeq84WZKaiKm+U7kNKhp5tq5
   WaM9yzfoqrQzzUJZMkYPoTur0GVlFK/1JDSzguGbaXLi1wkbCFNH7GwuX
   dBgipTk035zYMxh5zEGoNGs3PTVHItZf3MJW8jWy//iKSnP9MWxTcaXjz
   XN4+XJnnPKj51+Q5fqSkbwSpBpYkDH80RpW09Z//GoJXGaGZC6CtAlgm2
   1LRDMhcZcCJBStvgUHqOkwwB/SgBnuA/jt3iZykR9BbJuzk22CtK1Gpnf
   2yxkQOf66cAs5gJC/Kuleyd4xCyuaNw8mqxQxI95weLpPp4OqdSE+LIY7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="336558231"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="336558231"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 08:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="955063796"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="955063796"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Jun 2023 08:57:56 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5q79-00033l-2r;
	Sun, 04 Jun 2023 15:57:55 +0000
Date: Sun, 4 Jun 2023 23:57:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 21/79]
 drivers/infiniband/hw/bnxt_re/qplib_res.c:78:9: error: implicit declaration
 of function 'vfree'; did you mean 'kvfree'?
Message-ID: <202306042359.2vgeOy5i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   e224ead9931a98988ee0bbe416e77e43f8636527
commit: 65082a93784f478d58ab9ca3979a1472558b37f6 [21/79] RDMA/bnxt_re: Refactor hardware queue memory allocation
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230604/202306042359.2vgeOy5i-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=65082a93784f478d58ab9ca3979a1472558b37f6
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.4
        git checkout 65082a93784f478d58ab9ca3979a1472558b37f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/infiniband/hw/bnxt_re/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306042359.2vgeOy5i-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/infiniband/hw/bnxt_re/qplib_res.c: In function '__free_pbl':
>> drivers/infiniband/hw/bnxt_re/qplib_res.c:78:9: error: implicit declaration of function 'vfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
      78 |         vfree(pbl->pg_arr);
         |         ^~~~~
         |         kvfree
   drivers/infiniband/hw/bnxt_re/qplib_res.c: In function '__alloc_pbl':
>> drivers/infiniband/hw/bnxt_re/qplib_res.c:117:23: error: implicit declaration of function 'vmalloc'; did you mean 'kvmalloc'? [-Werror=implicit-function-declaration]
     117 |         pbl->pg_arr = vmalloc(pages * sizeof(void *));
         |                       ^~~~~~~
         |                       kvmalloc
>> drivers/infiniband/hw/bnxt_re/qplib_res.c:117:21: warning: assignment to 'void **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     117 |         pbl->pg_arr = vmalloc(pages * sizeof(void *));
         |                     ^
>> drivers/infiniband/hw/bnxt_re/qplib_res.c:121:25: warning: assignment to 'dma_addr_t *' {aka 'long long unsigned int *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     121 |         pbl->pg_map_arr = vmalloc(pages * sizeof(dma_addr_t));
         |                         ^
   drivers/infiniband/hw/bnxt_re/qplib_res.c:108:20: warning: variable 'pg_size' set but not used [-Wunused-but-set-variable]
     108 |         u32 pages, pg_size;
         |                    ^~~~~~~
   cc1: some warnings being treated as errors


vim +78 drivers/infiniband/hw/bnxt_re/qplib_res.c

    51	
    52	static void bnxt_qplib_free_stats_ctx(struct pci_dev *pdev,
    53					      struct bnxt_qplib_stats *stats);
    54	static int bnxt_qplib_alloc_stats_ctx(struct pci_dev *pdev,
    55					      struct bnxt_qplib_stats *stats);
    56	
    57	/* PBL */
    58	static void __free_pbl(struct bnxt_qplib_res *res, struct bnxt_qplib_pbl *pbl,
    59			       bool is_umem)
    60	{
    61		struct pci_dev *pdev = res->pdev;
    62		int i;
    63	
    64		if (!is_umem) {
    65			for (i = 0; i < pbl->pg_count; i++) {
    66				if (pbl->pg_arr[i])
    67					dma_free_coherent(&pdev->dev, pbl->pg_size,
    68							  (void *)((unsigned long)
    69							   pbl->pg_arr[i] &
    70							  PAGE_MASK),
    71							  pbl->pg_map_arr[i]);
    72				else
    73					dev_warn(&pdev->dev,
    74						 "PBL free pg_arr[%d] empty?!\n", i);
    75				pbl->pg_arr[i] = NULL;
    76			}
    77		}
  > 78		vfree(pbl->pg_arr);
    79		pbl->pg_arr = NULL;
    80		vfree(pbl->pg_map_arr);
    81		pbl->pg_map_arr = NULL;
    82		pbl->pg_count = 0;
    83		pbl->pg_size = 0;
    84	}
    85	
    86	static void bnxt_qplib_fill_user_dma_pages(struct bnxt_qplib_pbl *pbl,
    87						   struct bnxt_qplib_sg_info *sginfo)
    88	{
    89		struct scatterlist *sghead = sginfo->sghead;
    90		struct sg_dma_page_iter sg_iter;
    91		int i = 0;
    92	
    93		for_each_sg_dma_page(sghead, &sg_iter, sginfo->nmap, 0) {
    94			pbl->pg_map_arr[i] = sg_page_iter_dma_address(&sg_iter);
    95			pbl->pg_arr[i] = NULL;
    96			pbl->pg_count++;
    97			i++;
    98		}
    99	}
   100	
   101	static int __alloc_pbl(struct bnxt_qplib_res *res,
   102			       struct bnxt_qplib_pbl *pbl,
   103			       struct bnxt_qplib_sg_info *sginfo)
   104	{
   105		struct pci_dev *pdev = res->pdev;
   106		struct scatterlist *sghead;
   107		bool is_umem = false;
   108		u32 pages, pg_size;
   109		int i;
   110	
   111		if (sginfo->nopte)
   112			return 0;
   113		pages = sginfo->npages;
   114		pg_size = sginfo->pgsize;
   115		sghead = sginfo->sghead;
   116		/* page ptr arrays */
 > 117		pbl->pg_arr = vmalloc(pages * sizeof(void *));
   118		if (!pbl->pg_arr)
   119			return -ENOMEM;
   120	
 > 121		pbl->pg_map_arr = vmalloc(pages * sizeof(dma_addr_t));
   122		if (!pbl->pg_map_arr) {
   123			vfree(pbl->pg_arr);
   124			pbl->pg_arr = NULL;
   125			return -ENOMEM;
   126		}
   127		pbl->pg_count = 0;
   128		pbl->pg_size = sginfo->pgsize;
   129	
   130		if (!sghead) {
   131			for (i = 0; i < pages; i++) {
   132				pbl->pg_arr[i] = dma_alloc_coherent(&pdev->dev,
   133								    pbl->pg_size,
   134								    &pbl->pg_map_arr[i],
   135								    GFP_KERNEL);
   136				if (!pbl->pg_arr[i])
   137					goto fail;
   138				pbl->pg_count++;
   139			}
   140		} else {
   141			is_umem = true;
   142			bnxt_qplib_fill_user_dma_pages(pbl, sginfo);
   143		}
   144	
   145		return 0;
   146	fail:
   147		__free_pbl(res, pbl, is_umem);
   148		return -ENOMEM;
   149	}
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
