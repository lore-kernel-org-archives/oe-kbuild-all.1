Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022A15CB9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jun 2023 15:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685894278; x=1717430278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hdc4HEC8tK6DpdEuZ7ucD7uIs9J6Si0TghqdXHHaFV8=;
  b=CFtSWBMQ2qmEuEKR5Tc50A8HLgw9zJo9dA5FQA/nYdxmqxWW1WVxvBBO
   2UL2zlV1sOoAtIt0q/lAkNgPwPL8oWXw4s2tAPUqtSxuOj+8YZi5VCni2
   RpXYCB6k7NuvpMlAqTs18CvSrQDBKUblpCgjzwrdqGCVOMHot8IOX/46u
   jfJwTw7faHJHUliIozX7VAfzP8+WxC0QTTqnoALCISrS7U38bmD/ZjwZ2
   0IoxND6oeIRIV2DGWuTwv7PlLbM2JXucOlxGZF1sOG6Hu3GXDAByPlQtD
   aEbGIiMTsCwyjfErI7lixLk2E4anWNhWFxXIRMPTn3llRMtkhM01ulsxJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="336558228"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="336558228"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 08:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="955063795"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="955063795"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Jun 2023 08:57:56 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5q79-00033i-2m;
	Sun, 04 Jun 2023 15:57:55 +0000
Date: Sun, 4 Jun 2023 23:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 21/79]
 drivers/infiniband/hw/bnxt_re/qplib_res.c:108:20: warning: variable
 'pg_size' set but not used
Message-ID: <202306042348.iaxO33Bz-lkp@intel.com>
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
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230604/202306042348.iaxO33Bz-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/infiniband/hw/bnxt_re/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306042348.iaxO33Bz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/bnxt_re/qplib_res.c: In function '__alloc_pbl':
>> drivers/infiniband/hw/bnxt_re/qplib_res.c:108:20: warning: variable 'pg_size' set but not used [-Wunused-but-set-variable]
     108 |         u32 pages, pg_size;
         |                    ^~~~~~~


vim +/pg_size +108 drivers/infiniband/hw/bnxt_re/qplib_res.c

   100	
   101	static int __alloc_pbl(struct bnxt_qplib_res *res,
   102			       struct bnxt_qplib_pbl *pbl,
   103			       struct bnxt_qplib_sg_info *sginfo)
   104	{
   105		struct pci_dev *pdev = res->pdev;
   106		struct scatterlist *sghead;
   107		bool is_umem = false;
 > 108		u32 pages, pg_size;
   109		int i;
   110	
   111		if (sginfo->nopte)
   112			return 0;
   113		pages = sginfo->npages;
   114		pg_size = sginfo->pgsize;
   115		sghead = sginfo->sghead;
   116		/* page ptr arrays */
   117		pbl->pg_arr = vmalloc(pages * sizeof(void *));
   118		if (!pbl->pg_arr)
   119			return -ENOMEM;
   120	
   121		pbl->pg_map_arr = vmalloc(pages * sizeof(dma_addr_t));
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
