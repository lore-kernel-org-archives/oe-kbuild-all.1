Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35B173440
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 23:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725925693; cv=none; b=MaASvJuHkvoBhZiv3yxSg/uUzaQWelVazt9x2TGIlBnfOjqw0yL+d9syd8gAI6HK7jCctBmg3iy4n2z76e/ndPPejBB3g7BxmTsjLC/KSyi87Grlh4wGxCFm8MVd4LCT+9UCU9cl6WYR8oAyfoGehNCD7QuUxGuVAPBIMveegzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725925693; c=relaxed/simple;
	bh=B95LOtKUbdp3OIPltaTy0jrpBwp/9GxaTmkwlilfbJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IyfxyB3DWNmvN5AmGUX8JQkeyPp9SK75uaz1m+l9siGyPMq8loKyvE+5hc59LT7wzOOmYgPa3+2glUaUo3CYcOeA1RGSdeQsVIQLIziB8Xs5tQsxeSY5aLZ27HoMJCbszhgpWP7l87AlCGE6B5NhcMNkzKpH4RuxaMesLQ9UozQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L1ybXS8K; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1ybXS8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725925691; x=1757461691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B95LOtKUbdp3OIPltaTy0jrpBwp/9GxaTmkwlilfbJw=;
  b=L1ybXS8KLqdlCqGN1pQg/THHzeMqnvpKYc6/Oa2rWeZUs2LEmP3fKZmt
   mW8S2HhEQKJZZSwYwXPh8VA3bHGSCt5ENjD06wxav/QTKv4zEM3GMVDcA
   Nit9scXaV7tFSrn6XEtTixCBmwbwsktnWxphKTejiThSei4n2gBL/6nwQ
   qqgd5jFrJPAB99RHoo8ue1U6cOlRSsTpHOjHkpL1zywS+Se2uCpuc2CID
   Wbdv+Ze/7Vf6qoIOdV9Kb65Fe+ubbHe45/c5mP3254Qhp8IK8J6x32ObW
   cXr4+319gTA4+ckl/I0wAfynOaV8Ac05F/nqhO6Lo/FlEda7GeDWyitZJ
   Q==;
X-CSE-ConnectionGUID: zKUQuLv5QuyCNvmhRCQTlQ==
X-CSE-MsgGUID: cLUl0BDjSD+aMNh5WFHZPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35792015"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="35792015"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 16:48:10 -0700
X-CSE-ConnectionGUID: 9asNA2edTE2tGkZ4FZCsuA==
X-CSE-MsgGUID: VmPGUhTPSSKJ4kRQ4J2GEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="66454239"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Sep 2024 16:48:08 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sno74-000FLz-1g;
	Mon, 09 Sep 2024 23:48:06 +0000
Date: Tue, 10 Sep 2024 07:47:46 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st-rt 421/872] drivers/block/xen-blkfront.c:1315:1:
 warning: control reaches end of non-void function
Message-ID: <202409100742.ibDdxYST-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rt
head:   ffa3d4f70bc60fe44aef70601d9251c80f4e26f4
commit: 86fed754c5ea084751b011af36779add17560724 [421/872] xen/blkfront: don't use gnttab_query_foreign_access() for mapped status
config: arm-randconfig-002-20240910 (https://download.01.org/0day-ci/archive/20240910/202409100742.ibDdxYST-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100742.ibDdxYST-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100742.ibDdxYST-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   drivers/block/xen-blkfront.c: In function 'blkif_free':
   drivers/block/xen-blkfront.c:1134:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < BLK_RING_SIZE(info); i++) {
                   ^
   drivers/block/xen-blkfront.c:1160:17: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      for (j = 0; j < INDIRECT_GREFS(segs); j++) {
                    ^
   drivers/block/xen-blkfront.c:1184:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < info->nr_ring_pages; i++) {
                   ^
   drivers/block/xen-blkfront.c: In function 'blkif_completion':
   drivers/block/xen-blkfront.c:1239:8: error: 's' undeclared (first use in this function); did you mean 'sg'?
      .s = s,
           ^
           sg
   drivers/block/xen-blkfront.c:1239:8: note: each undeclared identifier is reported only once for each function it appears in
   drivers/block/xen-blkfront.c:1290:17: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      for (i = 0; i < INDIRECT_GREFS(num_grant); i++) {
                    ^
   drivers/block/xen-blkfront.c: In function 'setup_blkring':
   drivers/block/xen-blkfront.c:1489:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < info->nr_ring_pages; i++)
                   ^
   drivers/block/xen-blkfront.c:1506:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < info->nr_ring_pages; i++)
                   ^
   drivers/block/xen-blkfront.c: In function 'talk_to_blkback':
   drivers/block/xen-blkfront.c:1575:17: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      for (i = 0; i < info->nr_ring_pages; i++) {
                    ^
   drivers/block/xen-blkfront.c:1613:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < BLK_RING_SIZE(info); i++)
                   ^
   drivers/block/xen-blkfront.c: In function 'blkif_recover':
   drivers/block/xen-blkfront.c:1741:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < BLK_RING_SIZE(info); i++)
                   ^
   drivers/block/xen-blkfront.c:1756:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < BLK_RING_SIZE(info); i++) {
                   ^
   drivers/block/xen-blkfront.c: In function 'blkfront_setup_indirect':
   drivers/block/xen-blkfront.c:1957:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < BLK_RING_SIZE(info); i++) {
                   ^
   drivers/block/xen-blkfront.c:1979:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < BLK_RING_SIZE(info); i++) {
                   ^
   drivers/block/xen-blkfront.c: In function 'blkif_completion':
>> drivers/block/xen-blkfront.c:1315:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   drivers/block/xen-blkfront.c: In function 'blkback_changed':
   drivers/block/xen-blkfront.c:2186:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
      if (dev->state == XenbusStateClosed)
         ^
   drivers/block/xen-blkfront.c:2189:2: note: here
     case XenbusStateClosing:
     ^~~~


vim +1315 drivers/block/xen-blkfront.c

c004a6fe0c405e Julien Grall        2015-07-22  1224  
86fed754c5ea08 Juergen Gross       2022-02-25  1225  /*
86fed754c5ea08 Juergen Gross       2022-02-25  1226   * Return values:
86fed754c5ea08 Juergen Gross       2022-02-25  1227   *  1 response processed.
86fed754c5ea08 Juergen Gross       2022-02-25  1228   *  0 missing further responses.
86fed754c5ea08 Juergen Gross       2022-02-25  1229   * -1 error while processing.
86fed754c5ea08 Juergen Gross       2022-02-25  1230   */
86fed754c5ea08 Juergen Gross       2022-02-25  1231  static int blkif_completion(unsigned long *id,
86fed754c5ea08 Juergen Gross       2022-02-25  1232  			    struct blkfront_info *info,
0a8704a51f386c Roger Pau Monne     2012-10-24  1233  			    struct blkif_response *bret)
9f27ee59503865 Jeremy Fitzhardinge 2007-07-17  1234  {
d62f6918582523 Roger Pau Monne     2012-12-07  1235  	int i = 0;
b7649158a0d241 Roger Pau Monne     2013-05-02  1236  	struct scatterlist *sg;
c004a6fe0c405e Julien Grall        2015-07-22  1237  	int num_sg, num_grant;
c004a6fe0c405e Julien Grall        2015-07-22  1238  	struct copy_from_grant data = {
c004a6fe0c405e Julien Grall        2015-07-22  1239  		.s = s,
c004a6fe0c405e Julien Grall        2015-07-22  1240  		.grant_idx = 0,
c004a6fe0c405e Julien Grall        2015-07-22  1241  	};
402b27f9f2c223 Roger Pau Monne     2013-04-18  1242  
c004a6fe0c405e Julien Grall        2015-07-22  1243  	num_grant = s->req.operation == BLKIF_OP_INDIRECT ?
402b27f9f2c223 Roger Pau Monne     2013-04-18  1244  		s->req.u.indirect.nr_segments : s->req.u.rw.nr_segments;
c004a6fe0c405e Julien Grall        2015-07-22  1245  	num_sg = s->num_sg;
0a8704a51f386c Roger Pau Monne     2012-10-24  1246  
bfe11d6de1c416 Roger Pau Monne     2013-10-29  1247  	if (bret->operation == BLKIF_OP_READ && info->feature_persistent) {
c004a6fe0c405e Julien Grall        2015-07-22  1248  		for_each_sg(s->sg, sg, num_sg, i) {
b7649158a0d241 Roger Pau Monne     2013-05-02  1249  			BUG_ON(sg->offset + sg->length > PAGE_SIZE);
c004a6fe0c405e Julien Grall        2015-07-22  1250  
c004a6fe0c405e Julien Grall        2015-07-22  1251  			data.bvec_offset = sg->offset;
c004a6fe0c405e Julien Grall        2015-07-22  1252  			data.bvec_data = kmap_atomic(sg_page(sg));
c004a6fe0c405e Julien Grall        2015-07-22  1253  
c004a6fe0c405e Julien Grall        2015-07-22  1254  			gnttab_foreach_grant_in_range(sg_page(sg),
c004a6fe0c405e Julien Grall        2015-07-22  1255  						      sg->offset,
c004a6fe0c405e Julien Grall        2015-07-22  1256  						      sg->length,
c004a6fe0c405e Julien Grall        2015-07-22  1257  						      blkif_copy_from_grant,
c004a6fe0c405e Julien Grall        2015-07-22  1258  						      &data);
c004a6fe0c405e Julien Grall        2015-07-22  1259  
c004a6fe0c405e Julien Grall        2015-07-22  1260  			kunmap_atomic(data.bvec_data);
0a8704a51f386c Roger Pau Monne     2012-10-24  1261  		}
0a8704a51f386c Roger Pau Monne     2012-10-24  1262  	}
0a8704a51f386c Roger Pau Monne     2012-10-24  1263  	/* Add the persistent grant into the list of free grants */
c004a6fe0c405e Julien Grall        2015-07-22  1264  	for (i = 0; i < num_grant; i++) {
86fed754c5ea08 Juergen Gross       2022-02-25  1265  		if (!gnttab_try_end_foreign_access(s->grants_used[i]->gref)) {
fbe363c476afe8 Roger Pau Monne     2013-08-12  1266  			/*
fbe363c476afe8 Roger Pau Monne     2013-08-12  1267  			 * If the grant is still mapped by the backend (the
fbe363c476afe8 Roger Pau Monne     2013-08-12  1268  			 * backend has chosen to make this grant persistent)
fbe363c476afe8 Roger Pau Monne     2013-08-12  1269  			 * we add it at the head of the list, so it will be
fbe363c476afe8 Roger Pau Monne     2013-08-12  1270  			 * reused first.
fbe363c476afe8 Roger Pau Monne     2013-08-12  1271  			 */
86fed754c5ea08 Juergen Gross       2022-02-25  1272  			if (!info->feature_persistent) {
86fed754c5ea08 Juergen Gross       2022-02-25  1273  				pr_alert("backed has not unmapped grant: %u\n",
bfe11d6de1c416 Roger Pau Monne     2013-10-29  1274  					 s->grants_used[i]->gref);
86fed754c5ea08 Juergen Gross       2022-02-25  1275  				return -1;
86fed754c5ea08 Juergen Gross       2022-02-25  1276  			}
bfe11d6de1c416 Roger Pau Monne     2013-10-29  1277  			list_add(&s->grants_used[i]->node, &info->grants);
0a8704a51f386c Roger Pau Monne     2012-10-24  1278  			info->persistent_gnts_c++;
fbe363c476afe8 Roger Pau Monne     2013-08-12  1279  		} else {
fbe363c476afe8 Roger Pau Monne     2013-08-12  1280  			/*
86fed754c5ea08 Juergen Gross       2022-02-25  1281  			 * If the grant is not mapped by the backend we add it
86fed754c5ea08 Juergen Gross       2022-02-25  1282  			 * to the tail of the list, so it will not be picked
86fed754c5ea08 Juergen Gross       2022-02-25  1283  			 * again unless we run out of persistent grants.
fbe363c476afe8 Roger Pau Monne     2013-08-12  1284  			 */
fbe363c476afe8 Roger Pau Monne     2013-08-12  1285  			s->grants_used[i]->gref = GRANT_INVALID_REF;
bfe11d6de1c416 Roger Pau Monne     2013-10-29  1286  			list_add_tail(&s->grants_used[i]->node, &info->grants);
fbe363c476afe8 Roger Pau Monne     2013-08-12  1287  		}
0a8704a51f386c Roger Pau Monne     2012-10-24  1288  	}
402b27f9f2c223 Roger Pau Monne     2013-04-18  1289  	if (s->req.operation == BLKIF_OP_INDIRECT) {
c004a6fe0c405e Julien Grall        2015-07-22  1290  		for (i = 0; i < INDIRECT_GREFS(num_grant); i++) {
86fed754c5ea08 Juergen Gross       2022-02-25  1291  			if (!gnttab_try_end_foreign_access(s->indirect_grants[i]->gref)) {
86fed754c5ea08 Juergen Gross       2022-02-25  1292  				if (!info->feature_persistent) {
86fed754c5ea08 Juergen Gross       2022-02-25  1293  					pr_alert("backed has not unmapped grant: %u\n",
bfe11d6de1c416 Roger Pau Monne     2013-10-29  1294  						 s->indirect_grants[i]->gref);
86fed754c5ea08 Juergen Gross       2022-02-25  1295  					return -1;
86fed754c5ea08 Juergen Gross       2022-02-25  1296  				}
bfe11d6de1c416 Roger Pau Monne     2013-10-29  1297  				list_add(&s->indirect_grants[i]->node, &info->grants);
402b27f9f2c223 Roger Pau Monne     2013-04-18  1298  				info->persistent_gnts_c++;
fbe363c476afe8 Roger Pau Monne     2013-08-12  1299  			} else {
bfe11d6de1c416 Roger Pau Monne     2013-10-29  1300  				struct page *indirect_page;
bfe11d6de1c416 Roger Pau Monne     2013-10-29  1301  
bfe11d6de1c416 Roger Pau Monne     2013-10-29  1302  				/*
bfe11d6de1c416 Roger Pau Monne     2013-10-29  1303  				 * Add the used indirect page back to the list of
bfe11d6de1c416 Roger Pau Monne     2013-10-29  1304  				 * available pages for indirect grefs.
bfe11d6de1c416 Roger Pau Monne     2013-10-29  1305  				 */
7b0767502b5db1 Bob Liu             2015-07-22  1306  				if (!info->feature_persistent) {
a7a6df222351de Julien Grall        2015-06-30  1307  					indirect_page = s->indirect_grants[i]->page;
bfe11d6de1c416 Roger Pau Monne     2013-10-29  1308  					list_add(&indirect_page->lru, &info->indirect_pages);
7b0767502b5db1 Bob Liu             2015-07-22  1309  				}
fbe363c476afe8 Roger Pau Monne     2013-08-12  1310  				s->indirect_grants[i]->gref = GRANT_INVALID_REF;
bfe11d6de1c416 Roger Pau Monne     2013-10-29  1311  				list_add_tail(&s->indirect_grants[i]->node, &info->grants);
fbe363c476afe8 Roger Pau Monne     2013-08-12  1312  			}
402b27f9f2c223 Roger Pau Monne     2013-04-18  1313  		}
402b27f9f2c223 Roger Pau Monne     2013-04-18  1314  	}
9f27ee59503865 Jeremy Fitzhardinge 2007-07-17 @1315  }
9f27ee59503865 Jeremy Fitzhardinge 2007-07-17  1316  

:::::: The code at line 1315 was first introduced by commit
:::::: 9f27ee595038653ddf8bca871200d39247d6f4fc xen: add virtual block device driver.

:::::: TO: Jeremy Fitzhardinge <jeremy@xensource.com>
:::::: CC: Jeremy Fitzhardinge <jeremy@goop.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
