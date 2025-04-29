Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4A82BE7B8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 13:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932664; cv=none; b=ofaYVot3bVhUDX0CQt2XRhT8C6/vRJyIqHypZrk9fBo1ydWjbJuQ2BwvTBRFV+O++3h9xFdSt/ymanRtN0pLMHvs2Lm+ZoBaxkO9jDqZFCSPeyDn5G1B0yhxuoN/HP7ZAI3xsOMbNPg2iu9qHKlAv5l8G9D0YQQoiTstxZcGmns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932664; c=relaxed/simple;
	bh=enJ4/qe5OmyWpDDJsjG64GMBSx8d9uTciOJ+SI+QEP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BNYESN8kMqS4MI+iPf/Wzh0qQuWLsBv3CPDDYJpDiWag15gdKSYhSrblPYLAuPWurpA0d5D9vrulaB0u6uB+oIxIPGc9GAZ+5rZ5RVc1tXhdlDJRVJARinSkZcRRFxU2MUULOhZUT8otIxT0IYKPVq7bK/Scb5p+9UWbmm8Xgds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GI7SbQcu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GI7SbQcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745932663; x=1777468663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=enJ4/qe5OmyWpDDJsjG64GMBSx8d9uTciOJ+SI+QEP0=;
  b=GI7SbQcutMGaIXSmOGhdL0pEvDN0Pbvb5WbDJbBR45JQNSRPsAOfc4Q6
   YYUl7vvEJ45xPAz0iXKwC+S7YOV9WAjMbDAgqatBdUTtTuQIPIJbmDNjn
   GAVCu+InTah3B/Qdp8+FUc5JsP+jrQSYzifzGScKmyUS/sxWKP6oEGEKX
   f8POazAMblZY6ui+zNkt/6FO+RpACRZbSreUUcIuiG8wtG/3gcApIL3Yh
   59Ck8IlvEh30A24UoGzBO9nIRbl0EOyax6hKk/tR1orliJVOxa+WaGpja
   KL8XCXQdzdA5WifH3R60lR+tDXS3CkeXmDPd2EDOhRJU6ohuzYpiJf4cT
   Q==;
X-CSE-ConnectionGUID: TsczCmX1QsS07SQpbWthPw==
X-CSE-MsgGUID: nCv+OhdFRiSmOqKnYRtbbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58210218"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="58210218"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 06:17:42 -0700
X-CSE-ConnectionGUID: ZrHQZe2JTlKnPKat2lXGQg==
X-CSE-MsgGUID: pRIkW2lQRlOtpE76hpmPuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="138628671"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Apr 2025 06:17:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9kqA-0000jb-1A;
	Tue, 29 Apr 2025 13:17:38 +0000
Date: Tue, 29 Apr 2025 21:16:45 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/common 5/6] fs/f2fs/data.c:153:52: error: 'sbi'
 undeclared
Message-ID: <202504292118.Odh4ZSgo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   0d3a805efb57a446736f275ab88d6f8b29a3ad09
commit: 238708a6490ffcfb6314c2a8b2238d2bf2b3178b [5/6] f2fs: fix to do sanity check on node footer in read_end_io
config: sparc-randconfig-001-20250429 (https://download.01.org/0day-ci/archive/20250429/202504292118.Odh4ZSgo-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504292118.Odh4ZSgo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504292118.Odh4ZSgo-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/data.c: In function 'f2fs_finish_read_bio':
>> fs/f2fs/data.c:153:52: error: 'sbi' undeclared (first use in this function)
     153 |                 if (folio->mapping == NODE_MAPPING(sbi)) {
         |                                                    ^~~
   fs/f2fs/data.c:153:52: note: each undeclared identifier is reported only once for each function it appears in
>> fs/f2fs/data.c:154:29: error: implicit declaration of function 'sanity_check_node_footer' [-Werror=implicit-function-declaration]
     154 |                         if (sanity_check_node_footer(sbi, folio, folio->index,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/sbi +153 fs/f2fs/data.c

   122	
   123	/*
   124	 * Update and unlock a bio's pages, and free the bio.
   125	 *
   126	 * This marks pages up-to-date only if there was no error in the bio (I/O error,
   127	 * decryption error, or verity error), as indicated by bio->bi_status.
   128	 *
   129	 * "Compressed pages" (pagecache pages backed by a compressed cluster on-disk)
   130	 * aren't marked up-to-date here, as decompression is done on a per-compression-
   131	 * cluster basis rather than a per-bio basis.  Instead, we only must do two
   132	 * things for each compressed page here: call f2fs_end_read_compressed_page()
   133	 * with failed=true if an error occurred before it would have normally gotten
   134	 * called (i.e., I/O error or decryption error, but *not* verity error), and
   135	 * release the bio's reference to the decompress_io_ctx of the page's cluster.
   136	 */
   137	static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
   138	{
   139		struct folio_iter fi;
   140		struct bio_post_read_ctx *ctx = bio->bi_private;
   141	
   142		bio_for_each_folio_all(fi, bio) {
   143			struct folio *folio = fi.folio;
   144	
   145			if (f2fs_is_compressed_page(&folio->page)) {
   146				if (ctx && !ctx->decompression_attempted)
   147					f2fs_end_read_compressed_page(&folio->page, true, 0,
   148								in_task);
   149				f2fs_put_folio_dic(folio, in_task);
   150				continue;
   151			}
   152	
 > 153			if (folio->mapping == NODE_MAPPING(sbi)) {
 > 154				if (sanity_check_node_footer(sbi, folio, folio->index,
   155							NODE_TYPE_REGULAR, true))
   156					bio->bi_status = BLK_STS_IOERR;
   157			}
   158	
   159			dec_page_count(F2FS_F_SB(folio), __read_io_type(folio));
   160			folio_end_read(folio, bio->bi_status == 0);
   161		}
   162	
   163		if (ctx)
   164			mempool_free(ctx, bio_post_read_ctx_pool);
   165		bio_put(bio);
   166	}
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
