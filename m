Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF04155756
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719663; cv=none; b=snD82VMHcX+CbgohHbIle6FS49xG2450d/Am+HUAUbckKcSg4t8dHS7xzMPreBcScP/5KULX1uR4jJMlgeBRmvfRMjSn7VtbPDXKc0Nq8qeCqDdWDS16AoWX8dBvW98ZqVNHPn6NRQdIA2LNgNVlyWs+fsth0TfR25MVyebhkc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719663; c=relaxed/simple;
	bh=x0vERewE419VHWy8tcFSKVQcRW2+DylXTIjE5HZOrNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B6hYn44RBLQ61UyJm/D/sAS4CBSsEyjT3F+0g4+9auS5LeoBNa6TvN3Vhbw0/rMayBh7CXwBMgqhn7gbN4XUvlKpVP6BI3PXcWSSLWLawkL69ef+Y8UeFMqmR3OiaTvfo99QwJ/NKmV0Lk5FNTVvHJJi02/RHQR5JH6Cr39CARI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjzVMmEX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjzVMmEX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719661; x=1765255661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x0vERewE419VHWy8tcFSKVQcRW2+DylXTIjE5HZOrNs=;
  b=MjzVMmEXY9mYKDn+bz9bP4surAYZ7xoj4xE0Lbac0kGNKF45PloATjtM
   5xX6DO8Dyit5QgrObj7gk1DNHj3kY8bdbadUbyYXjfA25yLhQDYvQ8r1w
   gPOh+d8pAwwQu0UGASgmOndt5sKBzvvIfYtUGBFfr5fmot+7Ml3ykBlvH
   g3qPBtakbifxw8lW56VARWr/fZNTgUzSHqtLkoP4juTUbxx+VVUOV21S3
   dY7E/oobRpKGDG6UZnKunT+kdcQIcCE1/+VaQ5gh0OTYgEqsUD/u6yI1u
   GVfzzVYiDd5UCILfO500lEi2ESWTHrDotLWAUhHj6rDELopPIuq78Dwwp
   Q==;
X-CSE-ConnectionGUID: Z4NYw63KQ624ketA8UBpBQ==
X-CSE-MsgGUID: nc0uvxqgQF+nvlLcDugFQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34060149"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34060149"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:47:41 -0800
X-CSE-ConnectionGUID: YlvHeGnBTo+YaZVnvmu19A==
X-CSE-MsgGUID: Sxu2GLd2T96T/jHcdP18Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99012421"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Dec 2024 20:47:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVgG-0003up-2n;
	Mon, 09 Dec 2024 04:47:36 +0000
Date: Mon, 9 Dec 2024 12:47:23 +0800
From: kernel test robot <lkp@intel.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 79/80] lib/test_xarray.c:1019:52-53:
 WARNING comparing pointer to 0
Message-ID: <202412081700.YXB3vBbg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tamir,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   f635cc53910d4ba7726f925e49ce57c5332cd6a1
commit: 560b566c00a2d0b089af0cae62f146f61331e4fe [79/80] xarray: port tests to kunit
config: i386-randconfig-051-20241208 (https://download.01.org/0day-ci/archive/20241208/202412081700.YXB3vBbg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412081700.YXB3vBbg-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> lib/test_xarray.c:1019:52-53: WARNING comparing pointer to 0

vim +1019 lib/test_xarray.c

a60cc288a1a260 Luis Chamberlain 2024-01-31   950  
560b566c00a2d0 Tamir Duberstein 2024-12-05   951  static noinline void check_xa_alloc_1(struct kunit *test, struct xarray *xa, unsigned int base)
371c752dc66948 Matthew Wilcox   2018-07-04   952  {
371c752dc66948 Matthew Wilcox   2018-07-04   953  	int i;
371c752dc66948 Matthew Wilcox   2018-07-04   954  	u32 id;
371c752dc66948 Matthew Wilcox   2018-07-04   955  
3ccaf57a6a63ad Matthew Wilcox   2018-10-26   956  	XA_BUG_ON(xa, !xa_empty(xa));
3ccaf57a6a63ad Matthew Wilcox   2018-10-26   957  	/* An empty array should assign %base to the first alloc */
560b566c00a2d0 Tamir Duberstein 2024-12-05   958  	xa_alloc_index(test, xa, base, GFP_KERNEL);
371c752dc66948 Matthew Wilcox   2018-07-04   959  
371c752dc66948 Matthew Wilcox   2018-07-04   960  	/* Erasing it should make the array empty again */
560b566c00a2d0 Tamir Duberstein 2024-12-05   961  	xa_erase_index(test, xa, base);
3ccaf57a6a63ad Matthew Wilcox   2018-10-26   962  	XA_BUG_ON(xa, !xa_empty(xa));
3ccaf57a6a63ad Matthew Wilcox   2018-10-26   963  
3ccaf57a6a63ad Matthew Wilcox   2018-10-26   964  	/* And it should assign %base again */
560b566c00a2d0 Tamir Duberstein 2024-12-05   965  	xa_alloc_index(test, xa, base, GFP_KERNEL);
3ccaf57a6a63ad Matthew Wilcox   2018-10-26   966  
3ccaf57a6a63ad Matthew Wilcox   2018-10-26   967  	/* Allocating and then erasing a lot should not lose base */
3ccaf57a6a63ad Matthew Wilcox   2018-10-26   968  	for (i = base + 1; i < 2 * XA_CHUNK_SIZE; i++)
560b566c00a2d0 Tamir Duberstein 2024-12-05   969  		xa_alloc_index(test, xa, i, GFP_KERNEL);
3ccaf57a6a63ad Matthew Wilcox   2018-10-26   970  	for (i = base; i < 2 * XA_CHUNK_SIZE; i++)
560b566c00a2d0 Tamir Duberstein 2024-12-05   971  		xa_erase_index(test, xa, i);
560b566c00a2d0 Tamir Duberstein 2024-12-05   972  	xa_alloc_index(test, xa, base, GFP_KERNEL);
3ccaf57a6a63ad Matthew Wilcox   2018-10-26   973  
3ccaf57a6a63ad Matthew Wilcox   2018-10-26   974  	/* Destroying the array should do the same as erasing */
3ccaf57a6a63ad Matthew Wilcox   2018-10-26   975  	xa_destroy(xa);
371c752dc66948 Matthew Wilcox   2018-07-04   976  
3ccaf57a6a63ad Matthew Wilcox   2018-10-26   977  	/* And it should assign %base again */
560b566c00a2d0 Tamir Duberstein 2024-12-05   978  	xa_alloc_index(test, xa, base, GFP_KERNEL);
371c752dc66948 Matthew Wilcox   2018-07-04   979  
3ccaf57a6a63ad Matthew Wilcox   2018-10-26   980  	/* The next assigned ID should be base+1 */
560b566c00a2d0 Tamir Duberstein 2024-12-05   981  	xa_alloc_index(test, xa, base + 1, GFP_KERNEL);
560b566c00a2d0 Tamir Duberstein 2024-12-05   982  	xa_erase_index(test, xa, base + 1);
371c752dc66948 Matthew Wilcox   2018-07-04   983  
371c752dc66948 Matthew Wilcox   2018-07-04   984  	/* Storing a value should mark it used */
3ccaf57a6a63ad Matthew Wilcox   2018-10-26   985  	xa_store_index(xa, base + 1, GFP_KERNEL);
560b566c00a2d0 Tamir Duberstein 2024-12-05   986  	xa_alloc_index(test, xa, base + 2, GFP_KERNEL);
371c752dc66948 Matthew Wilcox   2018-07-04   987  
3ccaf57a6a63ad Matthew Wilcox   2018-10-26   988  	/* If we then erase base, it should be free */
560b566c00a2d0 Tamir Duberstein 2024-12-05   989  	xa_erase_index(test, xa, base);
560b566c00a2d0 Tamir Duberstein 2024-12-05   990  	xa_alloc_index(test, xa, base, GFP_KERNEL);
371c752dc66948 Matthew Wilcox   2018-07-04   991  
560b566c00a2d0 Tamir Duberstein 2024-12-05   992  	xa_erase_index(test, xa, base + 1);
560b566c00a2d0 Tamir Duberstein 2024-12-05   993  	xa_erase_index(test, xa, base + 2);
371c752dc66948 Matthew Wilcox   2018-07-04   994  
371c752dc66948 Matthew Wilcox   2018-07-04   995  	for (i = 1; i < 5000; i++) {
560b566c00a2d0 Tamir Duberstein 2024-12-05   996  		xa_alloc_index(test, xa, base + i, GFP_KERNEL);
371c752dc66948 Matthew Wilcox   2018-07-04   997  	}
371c752dc66948 Matthew Wilcox   2018-07-04   998  
3ccaf57a6a63ad Matthew Wilcox   2018-10-26   999  	xa_destroy(xa);
371c752dc66948 Matthew Wilcox   2018-07-04  1000  
3ccaf57a6a63ad Matthew Wilcox   2018-10-26  1001  	/* Check that we fail properly at the limit of allocation */
a3e4d3f97ec844 Matthew Wilcox   2018-12-31  1002  	XA_BUG_ON(xa, xa_alloc(xa, &id, xa_mk_index(UINT_MAX - 1),
a3e4d3f97ec844 Matthew Wilcox   2018-12-31  1003  				XA_LIMIT(UINT_MAX - 1, UINT_MAX),
371c752dc66948 Matthew Wilcox   2018-07-04  1004  				GFP_KERNEL) != 0);
3ccaf57a6a63ad Matthew Wilcox   2018-10-26  1005  	XA_BUG_ON(xa, id != 0xfffffffeU);
a3e4d3f97ec844 Matthew Wilcox   2018-12-31  1006  	XA_BUG_ON(xa, xa_alloc(xa, &id, xa_mk_index(UINT_MAX),
a3e4d3f97ec844 Matthew Wilcox   2018-12-31  1007  				XA_LIMIT(UINT_MAX - 1, UINT_MAX),
371c752dc66948 Matthew Wilcox   2018-07-04  1008  				GFP_KERNEL) != 0);
3ccaf57a6a63ad Matthew Wilcox   2018-10-26  1009  	XA_BUG_ON(xa, id != 0xffffffffU);
a3e4d3f97ec844 Matthew Wilcox   2018-12-31  1010  	id = 3;
a3e4d3f97ec844 Matthew Wilcox   2018-12-31  1011  	XA_BUG_ON(xa, xa_alloc(xa, &id, xa_mk_index(0),
a3e4d3f97ec844 Matthew Wilcox   2018-12-31  1012  				XA_LIMIT(UINT_MAX - 1, UINT_MAX),
a3e4d3f97ec844 Matthew Wilcox   2018-12-31  1013  				GFP_KERNEL) != -EBUSY);
a3e4d3f97ec844 Matthew Wilcox   2018-12-31  1014  	XA_BUG_ON(xa, id != 3);
3ccaf57a6a63ad Matthew Wilcox   2018-10-26  1015  	xa_destroy(xa);
48483614de97c4 Matthew Wilcox   2018-12-13  1016  
a3e4d3f97ec844 Matthew Wilcox   2018-12-31  1017  	XA_BUG_ON(xa, xa_alloc(xa, &id, xa_mk_index(10), XA_LIMIT(10, 5),
a3e4d3f97ec844 Matthew Wilcox   2018-12-31  1018  				GFP_KERNEL) != -EBUSY);
3ccaf57a6a63ad Matthew Wilcox   2018-10-26 @1019  	XA_BUG_ON(xa, xa_store_index(xa, 3, GFP_KERNEL) != 0);
a3e4d3f97ec844 Matthew Wilcox   2018-12-31  1020  	XA_BUG_ON(xa, xa_alloc(xa, &id, xa_mk_index(10), XA_LIMIT(10, 5),
a3e4d3f97ec844 Matthew Wilcox   2018-12-31  1021  				GFP_KERNEL) != -EBUSY);
560b566c00a2d0 Tamir Duberstein 2024-12-05  1022  	xa_erase_index(test, xa, 3);
3ccaf57a6a63ad Matthew Wilcox   2018-10-26  1023  	XA_BUG_ON(xa, !xa_empty(xa));
3ccaf57a6a63ad Matthew Wilcox   2018-10-26  1024  }
3ccaf57a6a63ad Matthew Wilcox   2018-10-26  1025  

:::::: The code at line 1019 was first introduced by commit
:::::: 3ccaf57a6a63ad171a951dcaddffc453b2414c7b XArray: Add support for 1s-based allocation

:::::: TO: Matthew Wilcox <willy@infradead.org>
:::::: CC: Matthew Wilcox <willy@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
