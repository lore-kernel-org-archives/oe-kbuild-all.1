Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEEE4FF68
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 16:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MMylBqg6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702917607; x=1734453607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BXkvXFCVk8v2XUO3M0PaPXxpXEaEgCONdIYC+b9ysvo=;
  b=MMylBqg60E2aDlNCHfH/zrXT7CDVDvSZnLPSAhOoynw+0Xy3ESA3FUW5
   sfh1XtWm+cM432kyKjzQQRCZU0DohZzj4zekt0IwqjNMRqA0NzOmsZTzP
   fudqgtuEwhARU73kaonPMZ0Yr70yea/6A82N7qf/gk2ZjnpnCLnxAiAHe
   aVUYhxatTbqrcaybNarUMGwm1HGclmKuQdxQVjKK9yOnE2N9YnFxrClDo
   2TMN+p0oQEg7K8IRY4I7bcDi0Jqia5At5DoOgNF9EGV8lVqpckhvAGlfc
   vYi6+9B+9MasdB14QdRvm0C6eRn48znebex/evsDWwxgkUBPwfaVM54cP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="385955853"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="385955853"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 08:40:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="948832042"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="948832042"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 18 Dec 2023 08:40:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFGex-0004KC-1w;
	Mon, 18 Dec 2023 16:40:03 +0000
Date: Tue, 19 Dec 2023 00:39:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:mq-deadline 4/4] block/mq-deadline.c:222:16: error:
 implicit declaration of function 'blk_rq_zone_no'; did you mean
 'bdev_zone_no'?
Message-ID: <202312190016.QPfcro7k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux mq-deadline
head:   f1201b17a2fec011e8cdd6be24a413a5693941b7
commit: f1201b17a2fec011e8cdd6be24a413a5693941b7 [4/4] block/mq-deadline: Prevent zoned write reordering due to I/O prioritization
config: i386-randconfig-005-20231218 (https://download.01.org/0day-ci/archive/20231219/202312190016.QPfcro7k-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312190016.QPfcro7k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312190016.QPfcro7k-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/mq-deadline.c: In function 'dd_zone_prio':
>> block/mq-deadline.c:222:16: error: implicit declaration of function 'blk_rq_zone_no'; did you mean 'bdev_zone_no'? [-Werror=implicit-function-declaration]
     222 |   while (rq && blk_rq_zone_no(rq) == zno) {
         |                ^~~~~~~~~~~~~~
         |                bdev_zone_no
   cc1: some warnings being treated as errors


vim +222 block/mq-deadline.c

   204	
   205	/*
   206	 * If any sequential write requests are pending for the zone containing @pos,
   207	 * return the I/O priority for these write requests.
   208	 */
   209	static enum dd_prio dd_zone_prio(struct deadline_data *dd,
   210					 struct block_device *bdev, sector_t pos)
   211	{
   212		struct gendisk *disk = bdev->bd_disk;
   213		const unsigned int zno = disk_zone_no(disk, pos);
   214		enum dd_prio prio;
   215	
   216		pos -= bdev_offset_from_zone_start(bdev, pos);
   217		for (prio = DD_PRIO_MIN; prio <= DD_PRIO_MAX; prio++) {
   218			struct dd_per_prio *per_prio = &dd->per_prio[prio];
   219			struct request *rq;
   220	
   221			rq = deadline_first_rq_past_pos(per_prio, DD_WRITE, pos);
 > 222			while (rq && blk_rq_zone_no(rq) == zno) {
   223				struct rb_node *node;
   224	
   225				if (blk_rq_is_seq_zoned_write(rq))
   226					return prio;
   227				node = rb_next(&rq->rb_node);
   228				if (!node)
   229					break;
   230				rq = rb_entry_rq(node);
   231			}
   232		}
   233		return DD_INVALID_PRIO;
   234	}
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
