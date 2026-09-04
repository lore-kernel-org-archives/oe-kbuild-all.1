Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A05383983
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Sep 2026 22:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788562328; cv=none; b=J6SJ/s9NNG6ngf4FQle/OnQZLnd0IEpEjMNPRhTEJeUw8iczafeUdYgpkJZm/9QUvzAR2/J2KtrmYPmKctgET7/IjuzvbfGidlSIjehZlwmVXUYcZ0L4zeFg5VatqdMiY6eKxoUJJ08wEV4hfC+51zEHyZPRVE4oWo/vFdyJUAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788562328; c=relaxed/simple;
	bh=1le9u5vim+20zoOnam2hZNzaGA7WRtcWbYOnJAQz1ws=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gXZmsf2Q82Vs03y/5RfOVhHLzyeamJ79CX9e3firJ6TaNv6v0sA7KQAQpBk8BBbT4V0Rb2glVZdMnW4O0+8jYzEq3oVHyW8GNbDFlzaf6PMcCyGrhMSeij48a79sdp4VfnKnCREhV8SKnxsbumkWbckh2MTxOxpASupEiyj/wv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjX1lV8+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjX1lV8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788562326; x=1820098326;
  h=date:from:to:cc:subject:message-id;
  bh=1le9u5vim+20zoOnam2hZNzaGA7WRtcWbYOnJAQz1ws=;
  b=NjX1lV8+6Jg+eW/MCjCSHs9KRVFGZzgMsL64oS4PuH7Gw2j/hSfg5ZNk
   B0q2uIcR5SAApFyz4zyVh05yh1hQDUZYrwk2lLbc2GcEGl/u0w/nN55Ld
   AVFth0toIc5iI15MS6vzlg9nDmAbCJyOknIAxbi3QVnOrKVwEjORDwJXS
   +/c+LOq3cvCt4omiz+07y+aNlmp7VTt9rio4x8c3dQgJhloZg4dTX7LIL
   gld/jNKVOV/U2lRWC0GUvEQSZtwfe3m8SbvIPJen3KqF0AOr70/84srH/
   +94gAyPrCNahdSOgcu4n7cVnLW/v4A4WJCJHsjOP32VHvL4Qz8oUBX5VH
   g==;
X-CSE-ConnectionGUID: dnzjSowGRVaIzRx2oLJ9BA==
X-CSE-MsgGUID: JHfrdbDsTfOTWjlBZs9pEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88945908"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="88945908"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 15:52:03 -0700
X-CSE-ConnectionGUID: fb3tiY8vQma3Bspk1xQkfw==
X-CSE-MsgGUID: /p3U2tenQlm6zS79IpbKXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="266905051"
Received: from igk-lkp-server01.igk.intel.com (HELO bcd5fd227bc8) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 04 Sep 2026 15:52:02 -0700
Received: from kbuild by bcd5fd227bc8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2clL-00000000093-29LS;
	Fri, 04 Sep 2026 22:51:59 +0000
Date: Sat, 05 Sep 2026 00:51:49 +0200
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 49/49]
 fs/netfs/direct_write.c:128:7: warning: variable 'fpos2' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202609050006.JGpiRJKU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   cd7c017395defe44d80f4fb480dfec5e3772ea53
commit: cd7c017395defe44d80f4fb480dfec5e3772ea53 [49/49] netfs: Support encryption on unbuffered/DIO write
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260905/202609050006.JGpiRJKU-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050006.JGpiRJKU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050006.JGpiRJKU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/direct_write.c:128:7: warning: variable 'fpos2' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     128 |                 if (before && part <= 2 * PAGE_SIZE) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/direct_write.c:171:53: note: uninitialized use occurs here
     171 |         ret = netfs_rmw_read(wreq, before ?: after, fpos1, fpos2);
         |                                                            ^~~~~
   fs/netfs/direct_write.c:128:3: note: remove the 'if' if its condition is always false
     128 |                 if (before && part <= 2 * PAGE_SIZE) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     129 |                         struct bvecq *bq;
         |                         ~~~~~~~~~~~~~~~~~
     130 |                         size_t page0 = PAGE_SIZE - before->bv[0].bv_offset;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     131 |                         int slot;
         |                         ~~~~~~~~~
     132 | 
     133 |                         if (part <= page0) {
         |                         ~~~~~~~~~~~~~~~~~~~~
     134 |                                 before->bv[0].bv_len = part;
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     135 |                                 bvecq_filled_to(before, 1);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     136 |                                 goto do_it;
         |                                 ~~~~~~~~~~~
     137 |                         }
         |                         ~
     138 | 
     139 |                         bq = wreq->encrypt_cursor.bvecq;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     140 |                         slot = wreq->encrypt_cursor.slot + 1;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     141 |                         if (slot > bq->nr_slots) {
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~
     142 |                                 bq = bq->next;
         |                                 ~~~~~~~~~~~~~~
     143 |                                 slot = 0;
         |                                 ~~~~~~~~~
>> fs/netfs/direct_write.c:125:6: warning: variable 'fpos2' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     125 |         if (to == end && subreq->start + subreq->len < to) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/direct_write.c:171:53: note: uninitialized use occurs here
     171 |         ret = netfs_rmw_read(wreq, before ?: after, fpos1, fpos2);
         |                                                            ^~~~~
   fs/netfs/direct_write.c:125:2: note: remove the 'if' if its condition is always true
     125 |         if (to == end && subreq->start + subreq->len < to) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/netfs/direct_write.c:125:6: warning: variable 'fpos2' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     125 |         if (to == end && subreq->start + subreq->len < to) {
         |             ^~~~~~~~~
   fs/netfs/direct_write.c:171:53: note: uninitialized use occurs here
     171 |         ret = netfs_rmw_read(wreq, before ?: after, fpos1, fpos2);
         |                                                            ^~~~~
   fs/netfs/direct_write.c:125:6: note: remove the '&&' if its condition is always true
     125 |         if (to == end && subreq->start + subreq->len < to) {
         |             ^~~~~~~~~~~~
   fs/netfs/direct_write.c:103:21: note: initialize the variable 'fpos2' to silence this warning
     103 |         uoff_t fpos1, fpos2;
         |                            ^
         |                             = 0
>> fs/netfs/direct_write.c:566:22: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     566 |                 stream->buffered = ret;
         |                                    ^~~
   fs/netfs/direct_write.c:478:13: note: initialize the variable 'ret' to silence this warning
     478 |         ssize_t ret, n;
         |                    ^
         |                     = 0
   4 warnings generated.


vim +128 fs/netfs/direct_write.c

    93	
    94	/*
    95	 * Read gaps at either end of the bounce buffer that need to be filled for an
    96	 * RMW cycle.
    97	 */
    98	static ssize_t netfs_unbuffered_rmw(struct netfs_io_request *wreq,
    99					    struct netfs_io_subrequest *subreq,
   100					    uoff_t to, uoff_t end)
   101	{
   102		struct bvecq *before = NULL, *after = NULL;
   103		uoff_t fpos1, fpos2;
   104		size_t bsize = wreq->crypto_bsize;
   105		int ret;
   106	
   107		_enter("%llx,%llx", to, end);
   108	
   109		/* Build a buffer chain to cover the gaps.  If we have two gaps, they
   110		 * must be discontiguous and so we will need two separate bvecqs for
   111		 * that; however, if the entire write spans at most two pages, just do
   112		 * one read for both gaps plus the middle.
   113		 */
   114		if (subreq->start < wreq->start) {
   115			before = bvecq_alloc_one(2, wreq->gfp, false);
   116			if (!before)
   117				return -ENOMEM;
   118			fpos1 = subreq->start;
   119			before->bv[0] = wreq->encrypt_cursor.bvecq->bv[wreq->encrypt_cursor.slot];
   120			before->bv[0].bv_offset += wreq->encrypt_cursor.offset;
   121			before->bv[0].bv_len = bsize;
   122			bvecq_filled_to(before, 1);
   123		}
   124	
 > 125		if (to == end && subreq->start + subreq->len < to) {
   126			size_t part = end - subreq->start;
   127	
 > 128			if (before && part <= 2 * PAGE_SIZE) {
   129				struct bvecq *bq;
   130				size_t page0 = PAGE_SIZE - before->bv[0].bv_offset;
   131				int slot;
   132	
   133				if (part <= page0) {
   134					before->bv[0].bv_len = part;
   135					bvecq_filled_to(before, 1);
   136					goto do_it;
   137				}
   138	
   139				bq = wreq->encrypt_cursor.bvecq;
   140				slot = wreq->encrypt_cursor.slot + 1;
   141				if (slot > bq->nr_slots) {
   142					bq = bq->next;
   143					slot = 0;
   144				}
   145	
   146				before->bv[0].bv_len = page0;
   147				before->bv[1] = bq->bv[slot];
   148				before->bv[1].bv_len = part - page0;
   149				bvecq_filled_to(before, 2);
   150				goto do_it;
   151			}
   152	
   153			after = bvecq_alloc_one(1, wreq->gfp, false);
   154			if (!after) {
   155				ret = -ENOMEM;
   156				goto out;
   157			}
   158			fpos2 = to - bsize;
   159			after->bv[0] = wreq->bounce_alloc.bvecq->bv[wreq->bounce_alloc.slot];
   160			after->bv[0].bv_offset = to & (PAGE_SIZE - 1);
   161			after->bv[0].bv_len = bsize;
   162			bvecq_filled_to(after, 1);
   163		}
   164	
   165		if (before && after) {
   166			before->next = after;
   167			after->prev = before;
   168		}
   169	
   170	do_it:
   171		ret = netfs_rmw_read(wreq, before ?: after, fpos1, fpos2);
   172	
   173	out:
   174		bvecq_put(before ?: after);
   175		return ret;
   176	}
   177	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
