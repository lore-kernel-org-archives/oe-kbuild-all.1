Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CAE3DA7CC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 14:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843140; cv=none; b=eRo4l5HXaaTS+k1uDCo4jgP9r9BjWLw3OiMIoyis8WtO1VRwB+1H1GVIkj2h0/ofefhGN7M3HuegqYAOzb79iKOSl4sgtjItM2QWk6nRywTW1ngC4OBjL8QyDGxf9Et8xXj6juwqcD+xnC+vSHDFwRYuNtkL8018nfLSfB+bl1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843140; c=relaxed/simple;
	bh=salnVsSf5dp7p9BCCFEEtPJUNSZ75WtIcQIqOM+BRkw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=m4foKQZ6ERw7eIDWwTSvljI1QczVaCBPa9VRs4K7ONg2ebgE+C5aOIJu+lug+a9rqKdeXazFpouW/EXjLAipr8WWmEdm5P2R8MfvZIh+UbO7zWrcztCriBrYLnnYW7zHENk4TBgYwKOB93X4UI9eu2C+inkmXUVOYaeMsFgZ0qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Eym+zhO1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Eym+zhO1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773843138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cxgghr7MSK7jVWizWhWl9GwfmiS7bvvGv8BUW4p1BPY=;
	b=Eym+zhO1z/qab2i7a0gMvajsKBvI6hryUdvsGbj/x0MHlLZx+O1aFk/9DKqGIlovFR+UNT
	VMUJ++H+Neqw/qkQAxuPSS4XOZSsHAolmc9qRJMy9Tf6Q3wuufL2JxI6BnjS30steBsHJt
	/peCP2JmRuScaBE5AReFaUM5eXDhRK4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-172-HGM_uadFPiOo1ZoB6hlLfw-1; Wed,
 18 Mar 2026 10:12:15 -0400
X-MC-Unique: HGM_uadFPiOo1ZoB6hlLfw-1
X-Mimecast-MFC-AGG-ID: HGM_uadFPiOo1ZoB6hlLfw_1773843133
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A4677195606A;
	Wed, 18 Mar 2026 14:12:12 +0000 (UTC)
Received: from [10.44.32.29] (unknown [10.44.32.29])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C2E419560AB;
	Wed, 18 Mar 2026 14:12:11 +0000 (UTC)
Date: Wed, 18 Mar 2026 15:12:06 +0100 (CET)
From: Mikulas Patocka <mpatocka@redhat.com>
To: kernel test robot <lkp@intel.com>
cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
    John Garry <john.g.garry@oracle.com>
Subject: Re: drivers/md/dm.c:1324:9: sparse: sparse: cast from restricted
 blk_opf_t
In-Reply-To: <202603181439.atBWgPQu-lkp@intel.com>
Message-ID: <1d017f62-99b4-6293-d57d-4a3063b6f79e@redhat.com>
References: <202603181439.atBWgPQu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 7IWHDPJcggjM-pQKYa9h3P-Ghk4-Zt8Y-cqd3bTQa_E_1773843133
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII

Hi

Could you please describe what's wrong here?

If I grep the kernel for 'bi_opf.*REQ_ATOMIC', there are 14 places where 
bi_opf is tested or manipulated with the REQ_ATOMIC flag.

What should I use instead of 'bio->bi_opf & REQ_ATOMIC'?

Mikulas



On Wed, 18 Mar 2026, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   a989fde763f4f24209e4702f50a45be572340e68
> commit: de67c139b3846ece6b8bbb62abf1f010ae85c083 dm: test for REQ_ATOMIC in dm_accept_partial_bio()
> date:   3 months ago
> config: mips-randconfig-r113-20260318 (https://download.01.org/0day-ci/archive/20260318/202603181439.atBWgPQu-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 8.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181439.atBWgPQu-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603181439.atBWgPQu-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> drivers/md/dm.c:1324:9: sparse: sparse: cast from restricted blk_opf_t
>    drivers/md/dm.c:689:16: sparse: sparse: context imbalance in 'dm_get_live_table' - wrong count at exit
> 
> vim +1324 drivers/md/dm.c
> 
>   1283	
>   1284	/*
>   1285	 * A target may call dm_accept_partial_bio only from the map routine.  It is
>   1286	 * allowed for all bio types except REQ_PREFLUSH, REQ_OP_ZONE_* zone management
>   1287	 * operations, zone append writes (native with REQ_OP_ZONE_APPEND or emulated
>   1288	 * with write BIOs flagged with BIO_EMULATES_ZONE_APPEND) and any bio serviced
>   1289	 * by __send_duplicate_bios().
>   1290	 *
>   1291	 * dm_accept_partial_bio informs the dm that the target only wants to process
>   1292	 * additional n_sectors sectors of the bio and the rest of the data should be
>   1293	 * sent in a next bio.
>   1294	 *
>   1295	 * A diagram that explains the arithmetics:
>   1296	 * +--------------------+---------------+-------+
>   1297	 * |         1          |       2       |   3   |
>   1298	 * +--------------------+---------------+-------+
>   1299	 *
>   1300	 * <-------------- *tio->len_ptr --------------->
>   1301	 *                      <----- bio_sectors ----->
>   1302	 *                      <-- n_sectors -->
>   1303	 *
>   1304	 * Region 1 was already iterated over with bio_advance or similar function.
>   1305	 *	(it may be empty if the target doesn't use bio_advance)
>   1306	 * Region 2 is the remaining bio size that the target wants to process.
>   1307	 *	(it may be empty if region 1 is non-empty, although there is no reason
>   1308	 *	 to make it empty)
>   1309	 * The target requires that region 3 is to be sent in the next bio.
>   1310	 *
>   1311	 * If the target wants to receive multiple copies of the bio (via num_*bios, etc),
>   1312	 * the partially processed part (the sum of regions 1+2) must be the same for all
>   1313	 * copies of the bio.
>   1314	 */
>   1315	void dm_accept_partial_bio(struct bio *bio, unsigned int n_sectors)
>   1316	{
>   1317		struct dm_target_io *tio = clone_to_tio(bio);
>   1318		struct dm_io *io = tio->io;
>   1319		unsigned int bio_sectors = bio_sectors(bio);
>   1320	
>   1321		BUG_ON(dm_tio_flagged(tio, DM_TIO_IS_DUPLICATE_BIO));
>   1322		BUG_ON(bio_sectors > *tio->len_ptr);
>   1323		BUG_ON(n_sectors > bio_sectors);
> > 1324		BUG_ON(bio->bi_opf & REQ_ATOMIC);
>   1325	
>   1326		if (static_branch_unlikely(&zoned_enabled) &&
>   1327		    unlikely(bdev_is_zoned(bio->bi_bdev))) {
>   1328			enum req_op op = bio_op(bio);
>   1329	
>   1330			BUG_ON(op_is_zone_mgmt(op));
>   1331			BUG_ON(op == REQ_OP_WRITE);
>   1332			BUG_ON(op == REQ_OP_WRITE_ZEROES);
>   1333			BUG_ON(op == REQ_OP_ZONE_APPEND);
>   1334		}
>   1335	
>   1336		*tio->len_ptr -= bio_sectors - n_sectors;
>   1337		bio->bi_iter.bi_size = n_sectors << SECTOR_SHIFT;
>   1338	
>   1339		/*
>   1340		 * __split_and_process_bio() may have already saved mapped part
>   1341		 * for accounting but it is being reduced so update accordingly.
>   1342		 */
>   1343		dm_io_set_flag(io, DM_IO_WAS_SPLIT);
>   1344		io->sectors = n_sectors;
>   1345		io->sector_offset = bio_sectors(io->orig_bio);
>   1346	}
>   1347	EXPORT_SYMBOL_GPL(dm_accept_partial_bio);
>   1348	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

