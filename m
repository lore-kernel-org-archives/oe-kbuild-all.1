Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1122C6117
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 05:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706419399; cv=none; b=NT1+xu0jkIajySal1Z7kQ4uCessC57r7RjEAAFUZ4tp4LgPgBnnNh7Tx/mcDY5DDLkQ9R9YZrgu3sOgJPpsQKlNTJApM1xqozQ/UOeBuPCiKWOFjMp8d19Cn65mW5UO9ol1/wORQVhk0qwD+0Uitd3ZP50sZ+p2EeEuiY0wPqqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706419399; c=relaxed/simple;
	bh=84jXMym2CevkKAZtPWVO2/122lR76fQYSLRSmLSqbYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NOVFNAqU0HA5FpgsuspJzyyABd+gZQTZKZkyH10JflZh2Ee0N1Xw5q+t3y/nn9LF+dgQmxOqWXkgB1RanIHK8S0PynFLC0rn426+CEQsut3eDUiF/olugsNYQhj31hPtKAMqeIKonDwiKqk7TmxU4r/b6IIsTpDwSl4nfI29GGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JE6oOn/G; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JE6oOn/G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706419397; x=1737955397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=84jXMym2CevkKAZtPWVO2/122lR76fQYSLRSmLSqbYM=;
  b=JE6oOn/GtiCJp25GrCzes0sa3YOghgBTbtMy0cjNTIihBuU9VDDzAN5Y
   nmr6Ei7zx7V8Zc3nhX4n+xgZ79kfKYhZU9gn/iMxVAGUhx+U8IW+puSZ3
   hsck/awhUQ1+nRnIhk3fh5OH4sFC2dbROSI57POKObACIMKvXd9oITm4c
   cJPmaFiE4xwCFfCxyDDUXYgMNu326OJqeqo0lId1TiyJ4CnTfw/8u10UN
   einRJPb9l72DNX5Q/H2l4t04JW+Iv5uQ3pR9OGW1O5RUldTVoGCfa7+9C
   nhXVkxMUq16UwVGmt3pljlCTXLMiRW6XuPPF7eUQpA3zKGhVbbEjYRXqO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="433903424"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="433903424"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 21:23:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="737064277"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="737064277"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 27 Jan 2024 21:23:14 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTxdQ-00036g-1X;
	Sun, 28 Jan 2024 05:23:12 +0000
Date: Sun, 28 Jan 2024 13:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: Goldwyn Rodrigues <rgoldwyn@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [goldwynr:buffered.46 24/90] block/fops.c:507:42: error: passing
 argument 2 of 'iomap_writepages' from incompatible pointer type
Message-ID: <202401281320.MrVSQgql-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/goldwynr/linux buffered.46
head:   9b93fddebc916105169c8a82d8f3f20fb30ff277
commit: 8f39bf920bebe813810c1d0d392e77dabb415006 [24/90] iomap: Make writeback_control a part of iomap_writepage_ctx
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240128/202401281320.MrVSQgql-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401281320.MrVSQgql-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401281320.MrVSQgql-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/fops.c: In function 'blkdev_read_folio':
   block/fops.c:476:16: error: too few arguments to function 'iomap_read_folio'
     476 |         return iomap_read_folio(folio, &blkdev_iomap_ops);
         |                ^~~~~~~~~~~~~~~~
   In file included from block/fops.c:18:
   include/linux/iomap.h:280:5: note: declared here
     280 | int iomap_read_folio(struct folio *folio, const struct iomap_ops *ops,
         |     ^~~~~~~~~~~~~~~~
   block/fops.c: In function 'blkdev_readahead':
   block/fops.c:481:9: error: too few arguments to function 'iomap_readahead'
     481 |         iomap_readahead(rac, &blkdev_iomap_ops);
         |         ^~~~~~~~~~~~~~~
   include/linux/iomap.h:282:6: note: declared here
     282 | void iomap_readahead(struct readahead_control *, const struct iomap_ops *ops,
         |      ^~~~~~~~~~~~~~~
   block/fops.c: In function 'blkdev_writepages':
>> block/fops.c:507:42: error: passing argument 2 of 'iomap_writepages' from incompatible pointer type [-Werror=incompatible-pointer-types]
     507 |         return iomap_writepages(mapping, wbc, &wpc, &blkdev_writeback_ops);
         |                                          ^~~
         |                                          |
         |                                          struct writeback_control *
   include/linux/iomap.h:358:45: note: expected 'struct iomap_writepage_ctx *' but argument is of type 'struct writeback_control *'
     358 |                 struct iomap_writepage_ctx *wpc,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   block/fops.c:507:47: error: passing argument 3 of 'iomap_writepages' from incompatible pointer type [-Werror=incompatible-pointer-types]
     507 |         return iomap_writepages(mapping, wbc, &wpc, &blkdev_writeback_ops);
         |                                               ^~~~
         |                                               |
         |                                               struct iomap_writepage_ctx *
   include/linux/iomap.h:359:51: note: expected 'const struct iomap_writeback_ops *' but argument is of type 'struct iomap_writepage_ctx *'
     359 |                 const struct iomap_writeback_ops *ops);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
>> block/fops.c:507:16: error: too many arguments to function 'iomap_writepages'
     507 |         return iomap_writepages(mapping, wbc, &wpc, &blkdev_writeback_ops);
         |                ^~~~~~~~~~~~~~~~
   include/linux/iomap.h:357:5: note: declared here
     357 | int iomap_writepages(struct address_space *mapping,
         |     ^~~~~~~~~~~~~~~~
   block/fops.c: In function 'blkdev_read_folio':
   block/fops.c:477:1: warning: control reaches end of non-void function [-Wreturn-type]
     477 | }
         | ^
   cc1: some warnings being treated as errors


vim +/iomap_writepages +507 block/fops.c

925c86a19bacf8 Christoph Hellwig 2023-08-01  501  
925c86a19bacf8 Christoph Hellwig 2023-08-01  502  static int blkdev_writepages(struct address_space *mapping,
925c86a19bacf8 Christoph Hellwig 2023-08-01  503  		struct writeback_control *wbc)
925c86a19bacf8 Christoph Hellwig 2023-08-01  504  {
925c86a19bacf8 Christoph Hellwig 2023-08-01  505  	struct iomap_writepage_ctx wpc = { };
925c86a19bacf8 Christoph Hellwig 2023-08-01  506  
925c86a19bacf8 Christoph Hellwig 2023-08-01 @507  	return iomap_writepages(mapping, wbc, &wpc, &blkdev_writeback_ops);
925c86a19bacf8 Christoph Hellwig 2023-08-01  508  }
925c86a19bacf8 Christoph Hellwig 2023-08-01  509  

:::::: The code at line 507 was first introduced by commit
:::::: 925c86a19bacf8ce10eb666328fb3fa5aff7b951 fs: add CONFIG_BUFFER_HEAD

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
