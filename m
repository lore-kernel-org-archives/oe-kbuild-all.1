Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090F82D97A8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 15:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037679; cv=none; b=VZFjppqYywybkWRn3UTjfuQi/uPfL21ixyJAgxUBhMDTjVhixKy9MgnjsTeLqJfJUC75QqbJhvzIo3wKOJP4P5RfNogmdOE1qC6Pg+0rFswjKzHeKhv6kfQDjSciBmDym+FbWLA88OT/m9Vt1P6rJE8dFJAbqB8DZL9e0cGb3eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037679; c=relaxed/simple;
	bh=MEluzz5rsZG4071BVoaluZk8uolIp4lKFARVu9fothI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kUa8Qq8sVo+81UF6ebjZaKjWEnNQpdTjHD5IywOyUOIqy9lB/6Mz4A/wRK5qw8WZk/olkiTmn7W55TU7Z3NCmoVRyeSQA4rEBOOplCNNVD/LVPkLvFMs7kvzFZ+ksUX7ODa1uu7e5ZYeNebTvmgHDaFet8xQhrVlvdVS4OksVY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qi0pudvv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qi0pudvv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751037678; x=1782573678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MEluzz5rsZG4071BVoaluZk8uolIp4lKFARVu9fothI=;
  b=Qi0pudvvbStTe4tH8MPpwid2oI04tRcCEe1UBhqUwigSLxTas9HXan4K
   7N+GsS8YMyRszOoHGbL9XzgxsF78KC6pDUCoP5OCn26BeQjnJTLiG9q27
   84EyOmPnFEf5JiEQXneGktGrSogzmZW6Vm12GNmTo7ORKhE+iCuXwbQHW
   lLBY9WD9KkEW96iOTUUGu4EhBqzf+GtcxHhOkW0y63qV552CQPPq+vd1t
   zyrRxRUBk4sMdvzP/lVr6UElt/XWgTZ+Buaq8KCGgcgue2vN8cPWLbinh
   gvepOb5ww+At/UbYToD/UmiCTqxnmywywHqtw3gV76fUifN398bsqhdtw
   g==;
X-CSE-ConnectionGUID: Cr1CHULkQRSbPtjFVdI/KQ==
X-CSE-MsgGUID: Ydyi5DPXQv+qL595jEw0lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="78790691"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="78790691"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 08:21:17 -0700
X-CSE-ConnectionGUID: x95QZt6ZQeenvEMNazgEuw==
X-CSE-MsgGUID: HdwXoc46RpyAfYN3UQbktg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="190022589"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Jun 2025 08:21:16 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVAt7-000WJk-1m;
	Fri, 27 Jun 2025 15:21:13 +0000
Date: Fri, 27 Jun 2025 23:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:dmabuf-rw-v1-test 7/16] block/blk-merge.c:332:58: error:
 expected ')'
Message-ID: <202506272334.BRUQjWiu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux dmabuf-rw-v1-test
head:   949fb10351aae03bf6ca32fb3c4a714ebaefc9e9
commit: e483c8c11f7f015f2d540fcf6335b69f736938f3 [7/16] bio: introduce dma vector backed bios
config: x86_64-buildonly-randconfig-002-20250627 (https://download.01.org/0day-ci/archive/20250627/202506272334.BRUQjWiu-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506272334.BRUQjWiu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506272334.BRUQjWiu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/blk-merge.c:332:58: error: expected ')'
     332 |                 return bio_split_rw_at_dmavec(bio, lim, segs, max_bytes;
         |                                                                        ^
   block/blk-merge.c:332:32: note: to match this '('
     332 |                 return bio_split_rw_at_dmavec(bio, lim, segs, max_bytes;
         |                                              ^
   1 error generated.


vim +332 block/blk-merge.c

   310	
   311	
   312	/**
   313	 * bio_split_rw_at - check if and where to split a read/write bio
   314	 * @bio:  [in] bio to be split
   315	 * @lim:  [in] queue limits to split based on
   316	 * @segs: [out] number of segments in the bio with the first half of the sectors
   317	 * @max_bytes: [in] maximum number of bytes per bio
   318	 *
   319	 * Find out if @bio needs to be split to fit the queue limits in @lim and a
   320	 * maximum size of @max_bytes.  Returns a negative error number if @bio can't be
   321	 * split, 0 if the bio doesn't have to be split, or a positive sector offset if
   322	 * @bio needs to be split.
   323	 */
   324	int bio_split_rw_at(struct bio *bio, const struct queue_limits *lim,
   325			unsigned *segs, unsigned max_bytes)
   326	{
   327		struct bio_vec bv, bvprv, *bvprvp = NULL;
   328		struct bvec_iter iter;
   329		unsigned nsegs = 0, bytes = 0;
   330	
   331		if (bio_flagged(bio, BIO_DMAVEC))
 > 332			return bio_split_rw_at_dmavec(bio, lim, segs, max_bytes;
   333	
   334		bio_for_each_bvec(bv, bio, iter) {
   335			/*
   336			 * If the queue doesn't support SG gaps and adding this
   337			 * offset would create a gap, disallow it.
   338			 */
   339			if (bvprvp && bvec_gap_to_prev(lim, bvprvp, bv.bv_offset))
   340				goto split;
   341	
   342			if (nsegs < lim->max_segments &&
   343			    bytes + bv.bv_len <= max_bytes &&
   344			    bv.bv_offset + bv.bv_len <= lim->min_segment_size) {
   345				nsegs++;
   346				bytes += bv.bv_len;
   347			} else {
   348				if (bvec_split_segs(lim, &bv, &nsegs, &bytes,
   349						lim->max_segments, max_bytes))
   350					goto split;
   351			}
   352	
   353			bvprv = bv;
   354			bvprvp = &bvprv;
   355		}
   356	
   357		*segs = nsegs;
   358		return 0;
   359	split:
   360		if (bio->bi_opf & REQ_ATOMIC)
   361			return -EINVAL;
   362	
   363		/*
   364		 * We can't sanely support splitting for a REQ_NOWAIT bio. End it
   365		 * with EAGAIN if splitting is required and return an error pointer.
   366		 */
   367		if (bio->bi_opf & REQ_NOWAIT)
   368			return -EAGAIN;
   369	
   370		*segs = nsegs;
   371	
   372		/*
   373		 * Individual bvecs might not be logical block aligned. Round down the
   374		 * split size so that each bio is properly block size aligned, even if
   375		 * we do not use the full hardware limits.
   376		 */
   377		bytes = ALIGN_DOWN(bytes, bio_split_alignment(bio, lim));
   378	
   379		/*
   380		 * Bio splitting may cause subtle trouble such as hang when doing sync
   381		 * iopoll in direct IO routine. Given performance gain of iopoll for
   382		 * big IO can be trival, disable iopoll when split needed.
   383		 */
   384		bio_clear_polled(bio);
   385		return bytes >> SECTOR_SHIFT;
   386	}
   387	EXPORT_SYMBOL_GPL(bio_split_rw_at);
   388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
