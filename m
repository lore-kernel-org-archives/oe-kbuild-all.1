Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6F0BD0F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 19:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676574642; x=1708110642;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RG6FE89xEMZ8fRCJpypPavShNTygUNbwQaaGLRFV/uI=;
  b=X7YO/kjeaiYG2YrAEdjSUCfxlK2QFnPLpJq60yAzq9o8dYDUba4Yh0mG
   5HFhGE5rMOXrvdQGeCVyFsxXGTnPjFwVHfa/3InuThg7ZNOF79IHIGNIV
   GFiQAsRH3rgRkHtB2zOCXlixo+t+J8Skr4433/ZxhKF2tLJIWJk4DdZfD
   12W1463tGcWxgi5DF3bAil55wZN9W14nf4009Ik0ergeyvex0utzNB8e0
   Wmfz6OlPDNv1Ymj+MlgZlmY6+SnsfC2sqfo1DesxO8S6SFIz72nGRpl7i
   zX9UrhsycyVVqTwW+Fozh91kajVPFY+6R/j+nAlLpyRZcKQhhUY3gRguh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331812020"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="331812020"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 11:10:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="734022099"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="734022099"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 16 Feb 2023 11:10:35 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSjeM-000AS9-2d;
	Thu, 16 Feb 2023 19:10:34 +0000
Date: Fri, 17 Feb 2023 03:09:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, hch@infradead.org,
	Jens Axboe <axboe@kernel.dk>, stable@vger.kernel.org
Subject: Re: [PATCH 3/4] brd: only preload radix tree if we're using a
 blocking gfp mask
Message-ID: <202302170236.SynZo1Bx-lkp@intel.com>
References: <20230216151918.319585-4-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216151918.319585-4-axboe@kernel.dk>

Hi Jens,

I love your patch! Perhaps something to improve:

[auto build test WARNING on v6.2-rc8]
[also build test WARNING on linus/master next-20230216]
[cannot apply to axboe-block/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jens-Axboe/brd-return-0-error-from-brd_insert_page/20230216-234430
patch link:    https://lore.kernel.org/r/20230216151918.319585-4-axboe%40kernel.dk
patch subject: [PATCH 3/4] brd: only preload radix tree if we're using a blocking gfp mask
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230217/202302170236.SynZo1Bx-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/237074d417b50a21f2bed5585ceebe8398535b1a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jens-Axboe/brd-return-0-error-from-brd_insert_page/20230216-234430
        git checkout 237074d417b50a21f2bed5585ceebe8398535b1a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/block/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302170236.SynZo1Bx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/block/brd.c: In function 'brd_insert_page':
>> drivers/block/brd.c:87:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      87 |         int ret = 0;
         |             ^~~


vim +/ret +87 drivers/block/brd.c

    79	
    80	/*
    81	 * Insert a new page for a given sector, if one does not already exist.
    82	 */
    83	static int brd_insert_page(struct brd_device *brd, sector_t sector, gfp_t gfp)
    84	{
    85		pgoff_t idx;
    86		struct page *page;
  > 87		int ret = 0;
    88	
    89		page = brd_lookup_page(brd, sector);
    90		if (page)
    91			return 0;
    92	
    93		page = alloc_page(gfp | __GFP_ZERO | __GFP_HIGHMEM);
    94		if (!page)
    95			return -ENOMEM;
    96	
    97		if (gfpflags_allow_blocking(gfp) && radix_tree_preload(gfp)) {
    98			__free_page(page);
    99			return -ENOMEM;
   100		}
   101	
   102		spin_lock(&brd->brd_lock);
   103		idx = sector >> PAGE_SECTORS_SHIFT;
   104		page->index = idx;
   105		if (radix_tree_insert(&brd->brd_pages, idx, page)) {
   106			__free_page(page);
   107			page = radix_tree_lookup(&brd->brd_pages, idx);
   108			if (!page)
   109				ret = -ENOMEM;
   110			else if (page->index != idx)
   111				ret = -EIO;
   112		} else {
   113			brd->brd_nr_pages++;
   114		}
   115		spin_unlock(&brd->brd_lock);
   116	
   117		radix_tree_preload_end();
   118		return 0;
   119	}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
