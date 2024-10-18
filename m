Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE1E201273
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 16:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729270255; cv=none; b=uXUARF2DLrrKvDGE0oTM1K4AK3q/H10j1hQGdACbcO71bd3D51nyvMNxynXQWxen39V7CElHKAWWP2Q5DZ1ko2Vd1Zl4xOVfVtnhtc5mZESeIXXSzmIYKIwzKdQhg/I04P1fuwJHg47jVGvNvtHpnCTlFyIurBV4jyB1EwiMt18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729270255; c=relaxed/simple;
	bh=YCGR7aP6DpgXuvxOSEKc5s/5/dScnhX/M6PpUY5lfpk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YrkiH9sQXinzqCZYumwEu5meGRDCQOXSN3x9/0Z4JD6gs012Km/kYuqiq2ePITElBFuAbcid+fqNgWMA2yWxo6vT571+Q26wg6kKL/2Fucz7bNgy6ggw9IbUuTfhnDu9o5rrPZ4nIH776sxbEFzM0mrRm5FQURB82rIPuHvEIvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KeN5LnDu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KeN5LnDu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729270253; x=1760806253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YCGR7aP6DpgXuvxOSEKc5s/5/dScnhX/M6PpUY5lfpk=;
  b=KeN5LnDu5NOWBWE055B7U3xkBh6BtCyOS1nG+0zA/ds94+3Cdw5E9G8h
   Ux9TUh2pHa5bg8nbBX0MvszVveygQO0/tNUoaS8Vi/qUBs5qrHVe7qETu
   N70U2tbrZ27aJ/z057VjjaIT0Gb3LwlUwRZ/7CWu2bunbso1ZBJGVy8TW
   cGZeCWZ+CIZ1F9KatfhZRCv/xptYTBVbmGLE2QspXqEBfTZLkS3IRIvud
   +xGi6wjyr5oASdwUGTvMH1z81VEeh+RGcazA9nxXjx/57RSL8tCZ+wkHC
   8/8TsvpVyDS98Ra6NOEQmURWtFW05dOIXrOYshC91WvvkxWmQch2qYJ/8
   Q==;
X-CSE-ConnectionGUID: mryDFeGySNuloSOgEsmH2A==
X-CSE-MsgGUID: DQ9f+SK9RNaZ/YTGoaTmgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="46309718"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="46309718"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 09:50:53 -0700
X-CSE-ConnectionGUID: lsyd9FitTy+AbtRCkcdKMA==
X-CSE-MsgGUID: AxzWWoLSSxWn6euhswM0Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="78874987"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Oct 2024 09:50:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1qBd-000O4z-2B;
	Fri, 18 Oct 2024 16:50:49 +0000
Date: Sat, 19 Oct 2024 00:50:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jens-wiklander-tee:testing/tuxbuild 1/2]
 drivers/tee/tee_rstmem.c:40:43: error: implicit declaration of function
 'phys_to_page'; did you mean 'pfn_to_page'?
Message-ID: <202410190036.tigAYNbm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   http://git.linaro.org/people/jens.wiklander/linux-tee testing/tuxbuild
head:   971e80da23e2fbfd044ec231e75a61dfeb6ce61a
commit: bc4386e9f6899baeaf60b57076495f2336c1f7f7 [1/2] tee: add restricted memory allocation
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241019/202410190036.tigAYNbm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190036.tigAYNbm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190036.tigAYNbm-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/tee/tee_rstmem.c: In function 'rstmem_dma_attach':
>> drivers/tee/tee_rstmem.c:40:43: error: implicit declaration of function 'phys_to_page'; did you mean 'pfn_to_page'? [-Werror=implicit-function-declaration]
      40 |                 sg_set_page(a->table.sgl, phys_to_page(shm->paddr), shm->size,
         |                                           ^~~~~~~~~~~~
         |                                           pfn_to_page
>> drivers/tee/tee_rstmem.c:40:43: warning: passing argument 2 of 'sg_set_page' makes pointer from integer without a cast [-Wint-conversion]
      40 |                 sg_set_page(a->table.sgl, phys_to_page(shm->paddr), shm->size,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                           |
         |                                           int
   In file included from include/linux/dma-buf.h:19,
                    from drivers/tee/tee_rstmem.c:6:
   include/linux/scatterlist.h:136:69: note: expected 'struct page *' but argument is of type 'int'
     136 | static inline void sg_set_page(struct scatterlist *sg, struct page *page,
         |                                                        ~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +40 drivers/tee/tee_rstmem.c

    17	
    18	static int rstmem_dma_attach(struct dma_buf *dmabuf,
    19				     struct dma_buf_attachment *attachment)
    20	{
    21		struct tee_shm *shm = dmabuf->priv;
    22		struct tee_rstmem_attachment *a;
    23		int rc;
    24	
    25		a = kzalloc(sizeof(*a), GFP_KERNEL);
    26		if (!a)
    27			return -ENOMEM;
    28	
    29		if (shm->pages) {
    30			rc = sg_alloc_table_from_pages(&a->table, shm->pages,
    31						       shm->num_pages, 0,
    32						       shm->num_pages * PAGE_SIZE,
    33						       GFP_KERNEL);
    34			if (rc)
    35				goto err;
    36		} else {
    37			rc = sg_alloc_table(&a->table, 1, GFP_KERNEL);
    38			if (rc)
    39				goto err;
  > 40			sg_set_page(a->table.sgl, phys_to_page(shm->paddr), shm->size,
    41				    0);
    42		}
    43	
    44		a->dev = attachment->dev;
    45		attachment->priv = a;
    46	
    47		return 0;
    48	err:
    49		kfree(a);
    50		return rc;
    51	}
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
