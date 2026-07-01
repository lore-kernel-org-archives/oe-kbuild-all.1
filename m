Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB8A28373
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 01:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782871046; cv=none; b=ebNIWAJQGQQHdt0CltSj2SGS2Nd4COVoJTtl7OWSXceUVEgFF0VFMLuWo8vqONpp/+gUhmuZ7kqGk6Z/2IpWn116LrXB3sK+/UQ7YWbfg7JiFv6fdxJABUqDp1Czrm/cMiVuXango5wwVNCJex5TjOxr8AOM0zYIwdcaYaaHdr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782871046; c=relaxed/simple;
	bh=yWQDvJQPEOQ46RQt+4QfjOwCF7OpVp4yHYgfhzuK9MY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OeuBNUy7U8Dd/Z0Kc+IaCvufhmRYJ4pP3+yv2eWpplj0sx5lgNXYEeRa4ewGRi0hKuNP1DHkjGIJ9IUiFbVSzPAePc0F2Rqng93Tcn/W8TMhbMul/7CetyVG9iHugMz9PRtR2cQQx42h4hMSyKIpjtHcHqchXxxfxiKQ8kbkymY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtaGGzjh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtaGGzjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782871045; x=1814407045;
  h=date:from:to:cc:subject:message-id;
  bh=yWQDvJQPEOQ46RQt+4QfjOwCF7OpVp4yHYgfhzuK9MY=;
  b=CtaGGzjhcsKoKDomV2G+Mudv4i5BoykNaoGsOt8y+sO9wTXXCzwB6vNx
   RX022cHykT3+L2StLqyjNvxHhkaTkDcavPdH7tZfu6v5FRk78zWkNXeF9
   VGN3gmjmWrqBSlaThJoQSHIhYGHimFEPWWrfv9V+1ubSUQOOd+dGz6TwH
   marDdf0ou0w3pf4LRE5CtZhbMQeVaLUh5upZwIzQUj2C+exKFnkN2qacO
   8SbVi5HcpHuIQCUuUPbFEjIn9YFRIRdACeplm11r4LkxZAX0tMApV7pUz
   RyVs34uTtuuvQK5hWfEtJHoaj6Muypu9dOnmvfqz+5wPAFfJ+xNrfZS+Z
   w==;
X-CSE-ConnectionGUID: DT7Z0YNzTxuF69WfBA2haQ==
X-CSE-MsgGUID: c2CGeuDKQ1iL64D3BZkbHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87506318"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="87506318"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:57:24 -0700
X-CSE-ConnectionGUID: xYl7I+UZQUSGL3m9i1v8tQ==
X-CSE-MsgGUID: Ju3veYsoSQGRfkE6ABqrjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="256005849"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 30 Jun 2026 18:57:22 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wekCW-000000000dl-1m39;
	Wed, 01 Jul 2026 01:57:20 +0000
Date: Wed, 01 Jul 2026 03:57:04 +0200
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@do-not-panic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:blk-iobuf-pool-v2 8/13] block/blk-map.c:742:1:
 warning: label 'next' defined but not used
Message-ID: <202607010339.EvJiU319-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v2
head:   da75cc2253180af718ba0b7b3684a091b16b14fb
commit: b88f2bfe111b8778c8bba9e0309c653966171bdd [8/13] block: bounce passthrough bios through iobuf pool folios
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260701/202607010339.EvJiU319-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607010339.EvJiU319-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607010339.EvJiU319-lkp@intel.com/

All warnings (new ones prefixed by >>):

   block/blk-map.c: In function 'blk_rq_map_user_iov':
>> block/blk-map.c:742:1: warning: label 'next' defined but not used [-Wunused-label]
     742 | next:
         | ^~~~
   block/blk-map.c: In function 'blk_rq_unmap_user':
   block/blk-map.c:823:46: warning: unused variable 'bmd' [-Wunused-variable]
     823 |                         struct bio_map_data *bmd = bio->bi_private;
         |                                              ^~~


vim +/next +742 block/blk-map.c

   670	
   671	/**
   672	 * blk_rq_map_user_iov - map user data to a request, for passthrough requests
   673	 * @q:		request queue where request should be inserted
   674	 * @rq:		request to map data to
   675	 * @map_data:   pointer to the rq_map_data holding pages (if necessary)
   676	 * @iter:	iovec iterator
   677	 * @gfp_mask:	memory allocation flags
   678	 *
   679	 * Description:
   680	 *    Data will be mapped directly for zero copy I/O, if possible. Otherwise
   681	 *    a kernel bounce buffer is used.
   682	 *
   683	 *    A matching blk_rq_unmap_user() must be issued at the end of I/O, while
   684	 *    still in process context.
   685	 */
   686	int blk_rq_map_user_iov(struct request_queue *q, struct request *rq,
   687				struct rq_map_data *map_data,
   688				const struct iov_iter *iter, gfp_t gfp_mask)
   689	{
   690		bool copy = false, map_bvec = false;
   691		unsigned long align = blk_lim_dma_alignment_and_pad(&q->limits);
   692		struct bio *bio = NULL;
   693		struct iov_iter i;
   694		int ret = -EINVAL;
   695	
   696		if (map_data)
   697			copy = true;
   698		else if (iov_iter_alignment(iter) & align)
   699			copy = true;
   700		else if (iov_iter_is_bvec(iter))
   701			map_bvec = true;
   702		else if (!user_backed_iter(iter))
   703			copy = true;
   704		else if (queue_virt_boundary(q))
   705			copy = queue_virt_boundary(q) & iov_iter_gap_alignment(iter);
   706	
   707		if (map_bvec) {
   708			ret = blk_rq_map_user_bvec(rq, iter);
   709			if (!ret)
   710				return 0;
   711			if (ret != -EREMOTEIO)
   712				goto fail;
   713			/* fall back to copying the data on limits mismatches */
   714			copy = true;
   715		}
   716	
   717		i = *iter;
   718		do {
   719			/*
   720			 * Try iobuf pool bounce first when copy is needed and the pool
   721			 * can provide aligned folios for this request.
   722			 */
   723	#ifdef CONFIG_BLK_IOBUF_POOL
   724			if (copy && !map_data && blk_rq_iobuf_eligible(q, &i, gfp_mask)) {
   725				ret = bio_copy_user_iov_iobuf(rq, &i, gfp_mask);
   726				if (!ret)
   727					goto next;
   728				if (ret != -EREMOTEIO)
   729					goto unmap_rq;
   730				/* not eligible after all; fall through to standard copy */
   731			}
   732	#endif
   733			if (copy)
   734				ret = bio_copy_user_iov(rq, map_data, &i, gfp_mask);
   735			else
   736				ret = bio_map_user_iov(rq, &i, gfp_mask);
   737			if (ret) {
   738				if (ret == -EREMOTEIO)
   739					ret = -EINVAL;
   740				goto unmap_rq;
   741			}
 > 742	next:
   743			if (!bio)
   744				bio = rq->bio;
   745		} while (iov_iter_count(&i));
   746	
   747		return 0;
   748	
   749	unmap_rq:
   750		blk_rq_unmap_user(bio);
   751	fail:
   752		rq->bio = NULL;
   753		return ret;
   754	}
   755	EXPORT_SYMBOL(blk_rq_map_user_iov);
   756	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
