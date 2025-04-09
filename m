Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972D81E25F2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Apr 2025 19:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744227289; cv=none; b=Hs0xccRA7pO/G6v2X551RCW2GAXobpXDOzFpQLHVazTltVwfk/tdhmqUDikDc3oQk/kpA92nzTCKSk/ulFwIZB9z0/QCSCEcEwCt6GwQQ8I1vwIocFwK1CWEf7fNRNOsdIAqkun1YUO/o2Y1VsdEB9Ms7v/B1v1N9Y9UkTcrFVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744227289; c=relaxed/simple;
	bh=Vn8IxujrurKkMyVJYEIh+X6I3H776pec9hpx/xxUyA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UR15dsVsK9VIIEO/irvSAG81SifGN4RcQndakAiaaeH4MGScUfqFw+2Aa9nPG7nrwi+C9NIDcqYgWEk5gSZkrNx7xBkB5tifX3trd2bYZOvs8v1ofXkE9g/N1JYcpmzMDHCIFGzWXywu0B3Izli4WVIuv7o7dpz7CNqXs3ZoBSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DWxuPeIy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DWxuPeIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744227287; x=1775763287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vn8IxujrurKkMyVJYEIh+X6I3H776pec9hpx/xxUyA0=;
  b=DWxuPeIyYeGW/VkuULHYnh70770kQO2VTRPpNbP7/pS6FEWTxh0V4oca
   NNIKlRKPyTkzKh/m0d/K6YDuT7/E2G4o8Ueh8ZfcqKFlf1xdOr9hqboit
   pG5nQijtlxDkEQVYeMMLWV3MTpE3U4tfzBskd1z1YMvuqFMHfKA0kQTHl
   eb7mgu9Ok5Ix3TbktRCsZ7tPkHiTXzy6Uzznn/6CPu3ADo6mywZBY8NxS
   cQmE2GU2Zxfbi3bLxLbZSrKS98VNPyYnBly8YTM7T01sgDzc4QOXvW1sp
   2AJuLkR333hC/vsm7R7bCL0/DTSd7ny5U/gSIeiS4hlVUx02OCrO/ATKy
   w==;
X-CSE-ConnectionGUID: FpkA7PAeSoyxPXiB404sBg==
X-CSE-MsgGUID: EurC8XtuTt21hmnF9kqxAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="44863083"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="44863083"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 12:34:46 -0700
X-CSE-ConnectionGUID: MOfYfvTcQ7Os1+u7IwPpaA==
X-CSE-MsgGUID: peebrwPrR3yTThYEeXxMfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="165897897"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Apr 2025 12:34:45 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2bC7-0009Et-0f;
	Wed, 09 Apr 2025 19:34:43 +0000
Date: Thu, 10 Apr 2025 03:34:07 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] md: fix is_mddev_idle()
Message-ID: <202504100122.OhoXNVhY-lkp@intel.com>
References: <20250408124125.2535488-1-yukuai1@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408124125.2535488-1-yukuai1@huaweicloud.com>

Hi Yu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v6.15-rc1 next-20250409]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/md-fix-is_mddev_idle/20250408-210426
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20250408124125.2535488-1-yukuai1%40huaweicloud.com
patch subject: [PATCH RFC] md: fix is_mddev_idle()
config: i386-buildonly-randconfig-003-20250409 (https://download.01.org/0day-ci/archive/20250410/202504100122.OhoXNVhY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504100122.OhoXNVhY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504100122.OhoXNVhY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/md/raid10.c: In function 'sync_request_write':
>> drivers/md/raid10.c:2439:21: warning: variable 'd' set but not used [-Wunused-but-set-variable]
    2439 |                 int d;
         |                     ^


vim +/d +2439 drivers/md/raid10.c

5e5702898e93ee NeilBrown         2011-07-28  2324  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2325  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  2326   * Note: sync and recover and handled very differently for raid10
^1da177e4c3f41 Linus Torvalds    2005-04-16  2327   * This code is for resync.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2328   * For resync, we read through virtual addresses and read all blocks.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2329   * If there is any error, we schedule a write.  The lowest numbered
^1da177e4c3f41 Linus Torvalds    2005-04-16  2330   * drive is authoritative.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2331   * However requests come for physical address, so we need to map.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2332   * For every physical address there are raid_disks/copies virtual addresses,
^1da177e4c3f41 Linus Torvalds    2005-04-16  2333   * which is always are least one, but is not necessarly an integer.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2334   * This means that a physical address can span multiple chunks, so we may
^1da177e4c3f41 Linus Torvalds    2005-04-16  2335   * have to submit multiple io requests for a single sync request.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2336   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2337  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  2338   * We check if all blocks are in-sync and only write to blocks that
^1da177e4c3f41 Linus Torvalds    2005-04-16  2339   * aren't in sync
^1da177e4c3f41 Linus Torvalds    2005-04-16  2340   */
9f2c9d12bcc53f NeilBrown         2011-10-11  2341  static void sync_request_write(struct mddev *mddev, struct r10bio *r10_bio)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2342  {
e879a8793f915a NeilBrown         2011-10-11  2343  	struct r10conf *conf = mddev->private;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2344  	int i, first;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2345  	struct bio *tbio, *fbio;
f4380a915823db majianpeng        2012-04-12  2346  	int vcnt;
cdb76be3156860 Ming Lei          2017-03-17  2347  	struct page **tpages, **fpages;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2348  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2349  	atomic_set(&r10_bio->remaining, 1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2350  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2351  	/* find the first device with a block */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2352  	for (i=0; i<conf->copies; i++)
4e4cbee93d5613 Christoph Hellwig 2017-06-03  2353  		if (!r10_bio->devs[i].bio->bi_status)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2354  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2355  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2356  	if (i == conf->copies)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2357  		goto done;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2358  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2359  	first = i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2360  	fbio = r10_bio->devs[i].bio;
cc57858831e3e9 Artur Paszkiewicz 2015-12-18  2361  	fbio->bi_iter.bi_size = r10_bio->sectors << 9;
cc57858831e3e9 Artur Paszkiewicz 2015-12-18  2362  	fbio->bi_iter.bi_idx = 0;
cdb76be3156860 Ming Lei          2017-03-17  2363  	fpages = get_resync_pages(fbio)->pages;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2364  
f4380a915823db majianpeng        2012-04-12  2365  	vcnt = (r10_bio->sectors + (PAGE_SIZE >> 9) - 1) >> (PAGE_SHIFT - 9);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2366  	/* now find blocks with errors */
0eb3ff12aa8a12 NeilBrown         2006-01-06  2367  	for (i=0 ; i < conf->copies ; i++) {
0eb3ff12aa8a12 NeilBrown         2006-01-06  2368  		int  j, d;
8d3ca83dcf9ca3 NeilBrown         2016-11-18  2369  		struct md_rdev *rdev;
f0250618361db1 Ming Lei          2017-03-17  2370  		struct resync_pages *rp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2371  
0eb3ff12aa8a12 NeilBrown         2006-01-06  2372  		tbio = r10_bio->devs[i].bio;
0eb3ff12aa8a12 NeilBrown         2006-01-06  2373  
0eb3ff12aa8a12 NeilBrown         2006-01-06  2374  		if (tbio->bi_end_io != end_sync_read)
0eb3ff12aa8a12 NeilBrown         2006-01-06  2375  			continue;
0eb3ff12aa8a12 NeilBrown         2006-01-06  2376  		if (i == first)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2377  			continue;
cdb76be3156860 Ming Lei          2017-03-17  2378  
cdb76be3156860 Ming Lei          2017-03-17  2379  		tpages = get_resync_pages(tbio)->pages;
8d3ca83dcf9ca3 NeilBrown         2016-11-18  2380  		d = r10_bio->devs[i].devnum;
8d3ca83dcf9ca3 NeilBrown         2016-11-18  2381  		rdev = conf->mirrors[d].rdev;
4e4cbee93d5613 Christoph Hellwig 2017-06-03  2382  		if (!r10_bio->devs[i].bio->bi_status) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2383  			/* We know that the bi_io_vec layout is the same for
^1da177e4c3f41 Linus Torvalds    2005-04-16  2384  			 * both 'first' and 'i', so we just compare them.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2385  			 * All vec entries are PAGE_SIZE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2386  			 */
7bb23c4934059c NeilBrown         2013-07-16  2387  			int sectors = r10_bio->sectors;
7bb23c4934059c NeilBrown         2013-07-16  2388  			for (j = 0; j < vcnt; j++) {
7bb23c4934059c NeilBrown         2013-07-16  2389  				int len = PAGE_SIZE;
7bb23c4934059c NeilBrown         2013-07-16  2390  				if (sectors < (len / 512))
7bb23c4934059c NeilBrown         2013-07-16  2391  					len = sectors * 512;
cdb76be3156860 Ming Lei          2017-03-17  2392  				if (memcmp(page_address(fpages[j]),
cdb76be3156860 Ming Lei          2017-03-17  2393  					   page_address(tpages[j]),
7bb23c4934059c NeilBrown         2013-07-16  2394  					   len))
^1da177e4c3f41 Linus Torvalds    2005-04-16  2395  					break;
7bb23c4934059c NeilBrown         2013-07-16  2396  				sectors -= len/512;
7bb23c4934059c NeilBrown         2013-07-16  2397  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2398  			if (j == vcnt)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2399  				continue;
7f7583d420231b Jianpeng Ma       2012-10-11  2400  			atomic64_add(r10_bio->sectors, &mddev->resync_mismatches);
18f08819f42b64 NeilBrown         2006-01-06  2401  			if (test_bit(MD_RECOVERY_CHECK, &mddev->recovery))
18f08819f42b64 NeilBrown         2006-01-06  2402  				/* Don't fix anything. */
18f08819f42b64 NeilBrown         2006-01-06  2403  				continue;
8d3ca83dcf9ca3 NeilBrown         2016-11-18  2404  		} else if (test_bit(FailFast, &rdev->flags)) {
8d3ca83dcf9ca3 NeilBrown         2016-11-18  2405  			/* Just give up on this device */
8d3ca83dcf9ca3 NeilBrown         2016-11-18  2406  			md_error(rdev->mddev, rdev);
8d3ca83dcf9ca3 NeilBrown         2016-11-18  2407  			continue;
f84ee364dd15af NeilBrown         2011-07-28  2408  		}
f84ee364dd15af NeilBrown         2011-07-28  2409  		/* Ok, we need to write this bio, either to correct an
f84ee364dd15af NeilBrown         2011-07-28  2410  		 * inconsistency or to correct an unreadable block.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2411  		 * First we need to fixup bv_offset, bv_len and
^1da177e4c3f41 Linus Torvalds    2005-04-16  2412  		 * bi_vecs, as the read request might have corrupted these
^1da177e4c3f41 Linus Torvalds    2005-04-16  2413  		 */
f0250618361db1 Ming Lei          2017-03-17  2414  		rp = get_resync_pages(tbio);
a7c50c940477ba Christoph Hellwig 2022-01-24  2415  		bio_reset(tbio, conf->mirrors[d].rdev->bdev, REQ_OP_WRITE);
8be185f2c9d54d Kent Overstreet   2012-09-06  2416  
fb0eb5df093076 Ming Lei          2017-07-14  2417  		md_bio_reset_resync_pages(tbio, rp, fbio->bi_iter.bi_size);
fb0eb5df093076 Ming Lei          2017-07-14  2418  
f0250618361db1 Ming Lei          2017-03-17  2419  		rp->raid_bio = r10_bio;
f0250618361db1 Ming Lei          2017-03-17  2420  		tbio->bi_private = rp;
4f024f3797c43c Kent Overstreet   2013-10-11  2421  		tbio->bi_iter.bi_sector = r10_bio->devs[i].addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2422  		tbio->bi_end_io = end_sync_write;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2423  
c31df25f20e35a Kent Overstreet   2015-05-06  2424  		bio_copy_data(tbio, fbio);
c31df25f20e35a Kent Overstreet   2015-05-06  2425  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2426  		atomic_inc(&conf->mirrors[d].rdev->nr_pending);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2427  		atomic_inc(&r10_bio->remaining);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2428  
1919cbb23bf1b3 NeilBrown         2016-11-18  2429  		if (test_bit(FailFast, &conf->mirrors[d].rdev->flags))
1919cbb23bf1b3 NeilBrown         2016-11-18  2430  			tbio->bi_opf |= MD_FAILFAST;
4f024f3797c43c Kent Overstreet   2013-10-11  2431  		tbio->bi_iter.bi_sector += conf->mirrors[d].rdev->data_offset;
ed00aabd5eb9fb Christoph Hellwig 2020-07-01  2432  		submit_bio_noacct(tbio);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2433  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2434  
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2435  	/* Now write out to any replacement devices
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2436  	 * that are active
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2437  	 */
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2438  	for (i = 0; i < conf->copies; i++) {
c31df25f20e35a Kent Overstreet   2015-05-06 @2439  		int d;
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2440  
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2441  		tbio = r10_bio->devs[i].repl_bio;
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2442  		if (!tbio || !tbio->bi_end_io)
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2443  			continue;
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2444  		if (r10_bio->devs[i].bio->bi_end_io != end_sync_write
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2445  		    && r10_bio->devs[i].bio != fbio)
c31df25f20e35a Kent Overstreet   2015-05-06  2446  			bio_copy_data(tbio, fbio);
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2447  		d = r10_bio->devs[i].devnum;
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2448  		atomic_inc(&r10_bio->remaining);
ed00aabd5eb9fb Christoph Hellwig 2020-07-01  2449  		submit_bio_noacct(tbio);
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2450  	}
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2451  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2452  done:
^1da177e4c3f41 Linus Torvalds    2005-04-16  2453  	if (atomic_dec_and_test(&r10_bio->remaining)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2454  		md_done_sync(mddev, r10_bio->sectors, 1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2455  		put_buf(r10_bio);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2456  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2457  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  2458  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
