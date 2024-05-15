Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194F617C96
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 17:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715795286; cv=none; b=uu5WhP4otFKRf07YIqL3SJETDWX0Pt2nZQTHkKwg0FPUvndHuZUE8cfpF6qkv+eSIXIl467pQfpUlphbHHo7Qp3zvdM1Bkw17MZvj+24ugv824yTeF3gMCgp4UervEtUVtPkvxGudm6YxQ3xC7foSnksy3iZjyOYlMC75JMZL8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715795286; c=relaxed/simple;
	bh=xMrmqGZHOFO0FBB5gl+pygCJcHRq/yHK9bJC5kINOGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qATyhgR06rHnamyEit9lu771Mmgz6yoiDXCUps4KveOxE5wKD5qIWcbAQ+axIlfaejuc6A6l5cir96DWXqh1kCXK+ySxZwWjSHGc+z7pXfkwNsvqOz4Cj9eP1jbqsewNgte0TBw2HjfP96fBE2nY9l/LnSSIV9HQlPL5031n64I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDH1SH2l; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDH1SH2l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715795284; x=1747331284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xMrmqGZHOFO0FBB5gl+pygCJcHRq/yHK9bJC5kINOGg=;
  b=FDH1SH2lAQ6jbX5pIb6CP0+7OvKolJ0+q3ziJoT5B0/oqorVv4JuUT6N
   VsEhW7D7NplsOx3PizZ00VkJEEDvoxF7yuya0wTs1DCmrWC7ZeXnJAne9
   CQV8i5EVU5VxCa3EtBwMgLIA5K2HWxlDhuLSWxAkBT2JfSO5paBcYaW8j
   zyRZJtbsO4Y6xjqy80xuEcYeUTq82qsbcTt79Ej1RnItVxft/+WLp+N+0
   t7mrbd//kIRKQn0SPP7l+vaDpbsxZvdjZQ4TgrU4tSOHERU/yqM0Seqiz
   7lrSKFwwQGcfUE4L9R2wbbnMlFjytQgSe7Kus4HgvEC7sd3YDatZBReUY
   Q==;
X-CSE-ConnectionGUID: aYQVaz5qSV+9xS0YJUUiGw==
X-CSE-MsgGUID: w2pkowPeRG2rWBch8q25qg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23266187"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="23266187"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 10:48:01 -0700
X-CSE-ConnectionGUID: vrKLvf9nSoWN9pcJPKbFLw==
X-CSE-MsgGUID: lIOSSUD+Ra2E1OgS3yl50Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="36019653"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 May 2024 10:47:57 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7IjK-000D6H-1O;
	Wed, 15 May 2024 17:47:54 +0000
Date: Thu, 16 May 2024 01:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Gomez <da.gomez@samsung.com>,
	"hughd@google.com" <hughd@google.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"willy@infradead.org" <willy@infradead.org>,
	"jack@suse.cz" <jack@suse.cz>,
	"mcgrof@kernel.org" <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"djwong@kernel.org" <djwong@kernel.org>,
	Pankaj Raghav <p.raghav@samsung.com>,
	"dagmcr@gmail.com" <dagmcr@gmail.com>,
	"yosryahmed@google.com" <yosryahmed@google.com>,
	"baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
	"ritesh.list@gmail.com" <ritesh.list@gmail.com>,
	"lsf-pc@lists.linux-foundation.org" <lsf-pc@lists.linux-foundation.org>,
	"david@redhat.com" <david@redhat.com>,
	"chandan.babu@oracle.com" <chandan.babu@oracle.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"brauner@kernel.org" <brauner@kernel.org>,
	Daniel Gomez <da.gomez@samsung.com>
Subject: Re: [PATCH 11/12] shmem: add file length arg in shmem_get_folio()
 path
Message-ID: <202405160144.a9ad9CX5-lkp@intel.com>
References: <20240515055719.32577-12-da.gomez@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515055719.32577-12-da.gomez@samsung.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on xfs-linux/for-next brauner-vfs/vfs.all linus/master v6.9 next-20240515]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Gomez/splice-don-t-check-for-uptodate-if-partially-uptodate-is-impl/20240515-135925
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240515055719.32577-12-da.gomez%40samsung.com
patch subject: [PATCH 11/12] shmem: add file length arg in shmem_get_folio() path
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240516/202405160144.a9ad9CX5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405160144.a9ad9CX5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405160144.a9ad9CX5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.c:2382: warning: Function parameter or struct member 'len' not described in 'shmem_get_folio'


vim +2382 mm/shmem.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  2356  
d7468609ee0f90 Christoph Hellwig       2024-02-19  2357  /**
d7468609ee0f90 Christoph Hellwig       2024-02-19  2358   * shmem_get_folio - find, and lock a shmem folio.
d7468609ee0f90 Christoph Hellwig       2024-02-19  2359   * @inode:	inode to search
d7468609ee0f90 Christoph Hellwig       2024-02-19  2360   * @index:	the page index.
d7468609ee0f90 Christoph Hellwig       2024-02-19  2361   * @foliop:	pointer to the folio if found
d7468609ee0f90 Christoph Hellwig       2024-02-19  2362   * @sgp:	SGP_* flags to control behavior
d7468609ee0f90 Christoph Hellwig       2024-02-19  2363   *
d7468609ee0f90 Christoph Hellwig       2024-02-19  2364   * Looks up the page cache entry at @inode & @index.  If a folio is
d7468609ee0f90 Christoph Hellwig       2024-02-19  2365   * present, it is returned locked with an increased refcount.
d7468609ee0f90 Christoph Hellwig       2024-02-19  2366   *
9d8b36744935f8 Christoph Hellwig       2024-02-19  2367   * If the caller modifies data in the folio, it must call folio_mark_dirty()
9d8b36744935f8 Christoph Hellwig       2024-02-19  2368   * before unlocking the folio to ensure that the folio is not reclaimed.
9d8b36744935f8 Christoph Hellwig       2024-02-19  2369   * There is no need to reserve space before calling folio_mark_dirty().
9d8b36744935f8 Christoph Hellwig       2024-02-19  2370   *
d7468609ee0f90 Christoph Hellwig       2024-02-19  2371   * When no folio is found, the behavior depends on @sgp:
8d4dd9d741c330 Akira Yokosawa          2024-02-27  2372   *  - for SGP_READ, *@foliop is %NULL and 0 is returned
8d4dd9d741c330 Akira Yokosawa          2024-02-27  2373   *  - for SGP_NOALLOC, *@foliop is %NULL and -ENOENT is returned
d7468609ee0f90 Christoph Hellwig       2024-02-19  2374   *  - for all other flags a new folio is allocated, inserted into the
d7468609ee0f90 Christoph Hellwig       2024-02-19  2375   *    page cache and returned locked in @foliop.
d7468609ee0f90 Christoph Hellwig       2024-02-19  2376   *
d7468609ee0f90 Christoph Hellwig       2024-02-19  2377   * Context: May sleep.
d7468609ee0f90 Christoph Hellwig       2024-02-19  2378   * Return: 0 if successful, else a negative error code.
d7468609ee0f90 Christoph Hellwig       2024-02-19  2379   */
4e1fc793ad9892 Matthew Wilcox (Oracle  2022-09-02  2380) int shmem_get_folio(struct inode *inode, pgoff_t index, struct folio **foliop,
02efe2fbe45ffd Daniel Gomez            2024-05-15  2381  		enum sgp_type sgp, size_t len)
4e1fc793ad9892 Matthew Wilcox (Oracle  2022-09-02 @2382) {
4e1fc793ad9892 Matthew Wilcox (Oracle  2022-09-02  2383) 	return shmem_get_folio_gfp(inode, index, foliop, sgp,
02efe2fbe45ffd Daniel Gomez            2024-05-15  2384  			mapping_gfp_mask(inode->i_mapping), NULL, NULL, len);
4e1fc793ad9892 Matthew Wilcox (Oracle  2022-09-02  2385) }
d7468609ee0f90 Christoph Hellwig       2024-02-19  2386  EXPORT_SYMBOL_GPL(shmem_get_folio);
4e1fc793ad9892 Matthew Wilcox (Oracle  2022-09-02  2387) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
