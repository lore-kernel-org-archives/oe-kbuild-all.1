Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EBE29A5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 02:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725935822; cv=none; b=GpzM5i1XrduK2VhZXz9FpGm5DSgO5caSwqJEtzd2DASd/84Issfdvry3A0MAlxLXUWNlgaS7zowTJS9Bv0fXDl4ANt/CvQynSZmMpWBLFlKnxbD8iKuhsnoZwvt1VEQsA6ez9dScfyt/hLPWtypuq0hrDPhOq/mQwSXvp8F9Ack=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725935822; c=relaxed/simple;
	bh=eLMAGcGsBXYqO+y617BcL41L0deLiFSoWqq8AHKayRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qs1t3vBciljC/bTHTW5W/eZJ5gcNqNJ5qyXiITGste5osSgFATF2oSzedezvtKamGmIsTGnTbcJpiqmS8oOQw+K3NiKA2Oad69rjy7wvCQ0F+piw2oSTzL5kfEEJRj1M4i0bpuVKdlUVqdUw4MUukkHC0syjGsib4xeBqBzN/Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3f3DnsG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3f3DnsG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725935820; x=1757471820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eLMAGcGsBXYqO+y617BcL41L0deLiFSoWqq8AHKayRs=;
  b=A3f3DnsGS+4L0CrserSuFYp+ylgsKiiifOpr2VcskM9Kj0klExjI+gIB
   n4QB9gKvesPMuPpf28GdT6N/CFcJKV4tTZ/JST9EeRnDNWgYGS/+SL9cl
   2YyNZQ1WYnQjfEnaxKjhM61q/ESTWtl6YJlWSIi9aFOIGJCKMfooeYoJp
   wK0cvP1+K3sqSWt1ny5zYY0qmgcOSS1DUrRQ9JiZAUAt0F638IuuTPKLn
   8j7wu7m/MKWcK+UIrGB5BzvwhhHaktbtt+2EybfOZtgQ5sU/wBLG8ZFCJ
   uZr3iionRm4sqV8HAR1ypRAGD93VnCGOfiKmAWUZ/eFHK9+xc4SVFhqPF
   Q==;
X-CSE-ConnectionGUID: qvlejG/JQAmmHeZ+LwfqkA==
X-CSE-MsgGUID: DWZaGcrCTmCWqjddx09mmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="47181012"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="47181012"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 19:36:51 -0700
X-CSE-ConnectionGUID: PTTfxcscTeuMsaAwqDA9GQ==
X-CSE-MsgGUID: D9IEB19zRkmiMDj48PNrVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="66583991"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Sep 2024 19:36:49 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snqkI-000FYc-2J;
	Tue, 10 Sep 2024 02:36:46 +0000
Date: Tue, 10 Sep 2024 10:36:19 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st 1193/2602] drivers/block/xen-blkfront.c:666:24:
 warning: suggest parentheses around '&&' within '||'
Message-ID: <202409101016.Q76S6jLm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st
head:   c18783f114b390babddc2dde4162ae03709497b2
commit: d4f5f4beb38bfd4645a6ef07511f1c6449129488 [1193/2602] xen/blkfront: Only check REQ_FUA for writes
config: arm-randconfig-002-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101016.Q76S6jLm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409101016.Q76S6jLm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409101016.Q76S6jLm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/cpumask.h:11:0,
                    from include/linux/interrupt.h:9,
                    from drivers/block/xen-blkfront.c:38:
   include/linux/bitmap.h: In function 'bitmap_empty':
   include/linux/bitmap.h:300:36: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return find_first_bit(src, nbits) == nbits;
                                       ^~
   include/linux/bitmap.h: In function 'bitmap_full':
   include/linux/bitmap.h:308:41: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return find_first_zero_bit(src, nbits) == nbits;
                                            ^~
   In file included from include/linux/blkdev.h:18:0,
                    from drivers/block/xen-blkfront.c:39:
   include/linux/bio.h: In function 'bio_next_split':
   include/linux/bio.h:424:14: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (sectors >= bio_sectors(bio))
                 ^~
   In file included from include/linux/linkage.h:4:0,
                    from include/linux/kernel.h:6,
                    from include/linux/interrupt.h:5,
                    from drivers/block/xen-blkfront.c:38:
   drivers/block/xen-blkfront.c: In function 'get_grant':
   drivers/block/xen-blkfront.c:303:30: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     BUG_ON(gnt_list_entry->gref == -ENOSPC);
                                 ^
   include/linux/compiler.h:182:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   drivers/block/xen-blkfront.c:303:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(gnt_list_entry->gref == -ENOSPC);
     ^~~~~~
   drivers/block/xen-blkfront.c: In function 'get_indirect_grant':
   drivers/block/xen-blkfront.c:326:30: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     BUG_ON(gnt_list_entry->gref == -ENOSPC);
                                 ^
   include/linux/compiler.h:182:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   drivers/block/xen-blkfront.c:326:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(gnt_list_entry->gref == -ENOSPC);
     ^~~~~~
   drivers/block/xen-blkfront.c: In function 'op_name':
   drivers/block/xen-blkfront.c:351:19: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (op < 0 || op >= ARRAY_SIZE(names))
                      ^~
   drivers/block/xen-blkfront.c: In function 'xlbd_reserve_minors':
   drivers/block/xen-blkfront.c:386:40: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (find_next_bit(minors, end, minor) >= end) {
                                           ^~
   drivers/block/xen-blkfront.c: In function 'blkif_ioctl':
   drivers/block/xen-blkfront.c:440:17: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      for (i = 0; i < sizeof(struct cdrom_multisession); i++)
                    ^
   drivers/block/xen-blkfront.c: In function 'blkif_queue_rw_req':
   drivers/block/xen-blkfront.c:616:30: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (info->persistent_gnts_c < max_grefs) {
                                 ^
>> drivers/block/xen-blkfront.c:666:24: warning: suggest parentheses around '&&' within '||' [-Wparentheses]
          rq_data_dir(req) && (req->cmd_flags & REQ_FUA)) {
   drivers/block/xen-blkfront.c: In function 'blkif_free':
   drivers/block/xen-blkfront.c:1135:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < BLK_RING_SIZE(info); i++) {
                   ^
   drivers/block/xen-blkfront.c:1161:17: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      for (j = 0; j < INDIRECT_GREFS(segs); j++) {
                    ^
   drivers/block/xen-blkfront.c:1185:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < info->nr_ring_pages; i++) {
                   ^
   drivers/block/xen-blkfront.c: In function 'blkif_completion':
   drivers/block/xen-blkfront.c:1292:17: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      for (i = 0; i < INDIRECT_GREFS(num_grant); i++) {
                    ^
   drivers/block/xen-blkfront.c: In function 'setup_blkring':
   drivers/block/xen-blkfront.c:1491:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < info->nr_ring_pages; i++)
                   ^
   drivers/block/xen-blkfront.c:1508:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < info->nr_ring_pages; i++)
                   ^
   drivers/block/xen-blkfront.c: In function 'talk_to_blkback':
   drivers/block/xen-blkfront.c:1577:17: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      for (i = 0; i < info->nr_ring_pages; i++) {
                    ^
   drivers/block/xen-blkfront.c:1615:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < BLK_RING_SIZE(info); i++)
                   ^
   drivers/block/xen-blkfront.c: In function 'blkif_recover':
   drivers/block/xen-blkfront.c:1743:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < BLK_RING_SIZE(info); i++)
                   ^
   drivers/block/xen-blkfront.c:1758:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < BLK_RING_SIZE(info); i++) {
                   ^
   drivers/block/xen-blkfront.c: In function 'blkfront_setup_indirect':
   drivers/block/xen-blkfront.c:1960:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < BLK_RING_SIZE(info); i++) {
                   ^
   drivers/block/xen-blkfront.c:1982:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < BLK_RING_SIZE(info); i++) {
                   ^
   drivers/block/xen-blkfront.c: In function 'blkif_completion':
   drivers/block/xen-blkfront.c:1317:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   drivers/block/xen-blkfront.c: In function 'blkback_changed':
   drivers/block/xen-blkfront.c:2189:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
      if (dev->state == XenbusStateClosed)
         ^
   drivers/block/xen-blkfront.c:2192:2: note: here
     case XenbusStateClosing:
     ^~~~


vim +666 drivers/block/xen-blkfront.c

   584	
   585	static int blkif_queue_rw_req(struct request *req)
   586	{
   587		struct blkfront_info *info = req->rq_disk->private_data;
   588		struct blkif_request *ring_req, *final_ring_req;
   589		unsigned long id;
   590		int i;
   591		struct setup_rw_req setup = {
   592			.grant_idx = 0,
   593			.segments = NULL,
   594			.info = info,
   595			.need_copy = rq_data_dir(req) && info->feature_persistent,
   596		};
   597	
   598		/*
   599		 * Used to store if we are able to queue the request by just using
   600		 * existing persistent grants, or if we have to get new grants,
   601		 * as there are not sufficiently many free.
   602		 */
   603		bool new_persistent_gnts;
   604		struct scatterlist *sg;
   605		int num_sg, max_grefs, num_grant;
   606	
   607		max_grefs = req->nr_phys_segments * GRANTS_PER_PSEG;
   608		if (max_grefs > BLKIF_MAX_SEGMENTS_PER_REQUEST)
   609			/*
   610			 * If we are using indirect segments we need to account
   611			 * for the indirect grefs used in the request.
   612			 */
   613			max_grefs += INDIRECT_GREFS(max_grefs);
   614	
   615		/* Check if we have enough grants to allocate a requests */
   616		if (info->persistent_gnts_c < max_grefs) {
   617			new_persistent_gnts = 1;
   618			if (gnttab_alloc_grant_references(
   619			    max_grefs - info->persistent_gnts_c,
   620			    &setup.gref_head) < 0) {
   621				gnttab_request_free_callback(
   622					&info->callback,
   623					blkif_restart_queue_callback,
   624					info,
   625					max_grefs);
   626				return 1;
   627			}
   628		} else
   629			new_persistent_gnts = 0;
   630	
   631		/* Fill out a communications ring structure. */
   632		id = blkif_ring_get_request(info, req, &final_ring_req);
   633		ring_req = &info->shadow[id].req;
   634	
   635		BUG_ON(info->max_indirect_segments == 0 &&
   636		       GREFS(req->nr_phys_segments) > BLKIF_MAX_SEGMENTS_PER_REQUEST);
   637		BUG_ON(info->max_indirect_segments &&
   638		       GREFS(req->nr_phys_segments) > info->max_indirect_segments);
   639	
   640		num_sg = blk_rq_map_sg(req->q, req, info->shadow[id].sg);
   641		num_grant = 0;
   642		/* Calculate the number of grant used */
   643		for_each_sg(info->shadow[id].sg, sg, num_sg, i)
   644		       num_grant += gnttab_count_grant(sg->offset, sg->length);
   645	
   646		ring_req->u.rw.id = id;
   647		info->shadow[id].num_sg = num_sg;
   648		if (num_grant > BLKIF_MAX_SEGMENTS_PER_REQUEST) {
   649			/*
   650			 * The indirect operation can only be a BLKIF_OP_READ or
   651			 * BLKIF_OP_WRITE
   652			 */
   653			BUG_ON(req->cmd_flags & (REQ_FLUSH | REQ_FUA));
   654			ring_req->operation = BLKIF_OP_INDIRECT;
   655			ring_req->u.indirect.indirect_op = rq_data_dir(req) ?
   656				BLKIF_OP_WRITE : BLKIF_OP_READ;
   657			ring_req->u.indirect.sector_number = (blkif_sector_t)blk_rq_pos(req);
   658			ring_req->u.indirect.handle = info->handle;
   659			ring_req->u.indirect.nr_segments = num_grant;
   660		} else {
   661			ring_req->u.rw.sector_number = (blkif_sector_t)blk_rq_pos(req);
   662			ring_req->u.rw.handle = info->handle;
   663			ring_req->operation = rq_data_dir(req) ?
   664				BLKIF_OP_WRITE : BLKIF_OP_READ;
   665			if ((req->cmd_flags & REQ_FLUSH) ||
 > 666			    rq_data_dir(req) && (req->cmd_flags & REQ_FUA)) {
   667				/*
   668				 * Ideally we can do an unordered flush-to-disk.
   669				 * In case the backend onlysupports barriers, use that.
   670				 * A barrier request a superset of FUA, so we can
   671				 * implement it the same way.  (It's also a FLUSH+FUA,
   672				 * since it is guaranteed ordered WRT previous writes.)
   673				 */
   674				switch (info->feature_flush &
   675					((REQ_FLUSH|REQ_FUA))) {
   676				case REQ_FLUSH|REQ_FUA:
   677					ring_req->operation =
   678						BLKIF_OP_WRITE_BARRIER;
   679					break;
   680				case REQ_FLUSH:
   681					ring_req->operation =
   682						BLKIF_OP_FLUSH_DISKCACHE;
   683					break;
   684				default:
   685					ring_req->operation = 0;
   686				}
   687			}
   688			ring_req->u.rw.nr_segments = num_grant;
   689		}
   690	
   691		setup.ring_req = ring_req;
   692		setup.id = id;
   693		for_each_sg(info->shadow[id].sg, sg, num_sg, i) {
   694			BUG_ON(sg->offset + sg->length > PAGE_SIZE);
   695	
   696			if (setup.need_copy) {
   697				setup.bvec_off = sg->offset;
   698				setup.bvec_data = kmap_atomic(sg_page(sg));
   699			}
   700	
   701			gnttab_foreach_grant_in_range(sg_page(sg),
   702						      sg->offset,
   703						      sg->length,
   704						      blkif_setup_rw_req_grant,
   705						      &setup);
   706	
   707			if (setup.need_copy)
   708				kunmap_atomic(setup.bvec_data);
   709		}
   710		if (setup.segments)
   711			kunmap_atomic(setup.segments);
   712	
   713		/* Copy request(s) to the ring page. */
   714		*final_ring_req = *ring_req;
   715		info->shadow[id].inflight = true;
   716	
   717		if (new_persistent_gnts)
   718			gnttab_free_grant_references(setup.gref_head);
   719	
   720		return 0;
   721	}
   722	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
