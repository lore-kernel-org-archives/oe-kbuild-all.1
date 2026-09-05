Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0612C325C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 01:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788571522; cv=none; b=ofdKOQHiirntACZQHr3hbwoLd/poRgFFvdjYfdpFupo2Q7oxQVRqPpqeFGwgGBNqOSExseUcYuNAgcDoDgJjVrfTesIX0sqnb/inqmHIN2ubla3X0QhkrmfAThsW40UsSkEBuBk+2QQAbLe1FFGvr7odHMhFF5ns9C3wbBQPD00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788571522; c=relaxed/simple;
	bh=vTwVqozq96v2HDaOjPVQkH2xiW5a+G09U4sgMr1/Dq4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VxyfdhLu5HPztugBhuN2hNz3JN9UJ4oiKBQqvdO9fnn8ycl9Hu/fAbrcxoxet3gSh4f7FDN29gDkjj+qLZDEMiheOv0eLjLWOxmEJBqyayPRJtgPhC/5dp1wj/86BYk3RLk9S2iRpSwHDMEH+OexUTV+uEZSSVAF9hOmsgFgA5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QqzgRxhg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QqzgRxhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788571520; x=1820107520;
  h=date:from:to:cc:subject:message-id;
  bh=vTwVqozq96v2HDaOjPVQkH2xiW5a+G09U4sgMr1/Dq4=;
  b=QqzgRxhg4re0CJfoPL/sYCnXU32TVmapU4UeutIYWqgLc5JT0CrfXBzH
   vBjV24jv52z/q5g3wRMqVea3BkqgUk5uBqa2pLO6wM2HWrPMh0C0WR1SC
   92/Ie3IjK/Hh6NOYdtC1nX38QMXaBDjDs+y8uEgBvuRQ/Zx+kFCDd/f9U
   a1zokQrTVUM8zcluyBNYf8nuV84T2QXFS7yPG3aj1j6SpCNJchM2jMNYZ
   /InpKhOJ3+t/woPvM9oxd0oHm37PxuSXkVLUKzY1IHEfjzQumk7MAINUi
   gLp5d/XpWNE9ozujjJykDIOMu1cpqeu0/uzLrxQvGIaUYct2AuqF6rrkK
   A==;
X-CSE-ConnectionGUID: 8fyDEkBXSjq5Nl++72arPg==
X-CSE-MsgGUID: UDeV5lceThqPeFujFMkPRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89001265"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="89001265"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 18:25:06 -0700
X-CSE-ConnectionGUID: 2vImRz/4Ro+YKS1hyN+d2A==
X-CSE-MsgGUID: T2f2sewhRoG/wbSzoNpNhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="265831103"
Received: from igk-lkp-server01.igk.intel.com (HELO bcd5fd227bc8) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 04 Sep 2026 18:25:03 -0700
Received: from kbuild by bcd5fd227bc8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2f9R-000000000A3-2NNj;
	Sat, 05 Sep 2026 01:25:01 +0000
Date: Sat, 05 Sep 2026 03:24:51 +0200
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 87/87]
 net/ceph/messenger_v2.c:3224:29: error: no member named 'out_enc_pages' in
 'struct ceph_connection_v2_info'
Message-ID: <202609050307.suQsH6op-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   376ad9d4942bf11500931178bbeb965348f01057
commit: 376ad9d4942bf11500931178bbeb965348f01057 [87/87] ceph: Don't use data_pages
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260905/202609050307.suQsH6op-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050307.suQsH6op-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050307.suQsH6op-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/ceph/messenger_v2.c:3224:29: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'
    3224 |         bvec_set_page(&bv, con->v2.out_enc_pages[con->v2.out_enc_i],
         |                            ~~~~~~~ ^
>> net/ceph/messenger_v2.c:3232:32: error: use of undeclared identifier 'OUT_S_QUEUE_ENC_PAGE'
    3232 |                 WARN_ON(con->v2.out_state != OUT_S_QUEUE_ENC_PAGE);
         |                                              ^~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v2.c:3270:14: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'
    3270 |         if (con->v2.out_enc_pages) {
         |             ~~~~~~~ ^
   net/ceph/messenger_v2.c:3272:36: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'
    3272 |                 ceph_release_page_vector(con->v2.out_enc_pages,
         |                                          ~~~~~~~ ^
   net/ceph/messenger_v2.c:3274:11: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'
    3274 |                 con->v2.out_enc_pages = NULL;
         |                 ~~~~~~~ ^
   net/ceph/messenger_v2.c:3310:7: error: use of undeclared identifier 'OUT_S_QUEUE_ENC_PAGE'
    3310 |         case OUT_S_QUEUE_ENC_PAGE:
         |              ^~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v2.c:3634:32: error: use of undeclared identifier 'OUT_S_QUEUE_ENC_PAGE'
    3634 |                 WARN_ON(con->v2.out_state != OUT_S_QUEUE_ENC_PAGE &&
         |                                              ^~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v2.c:3802:14: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'
    3802 |         if (con->v2.out_enc_pages) {
         |             ~~~~~~~ ^
   net/ceph/messenger_v2.c:3804:36: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'
    3804 |                 ceph_release_page_vector(con->v2.out_enc_pages,
         |                                          ~~~~~~~ ^
   net/ceph/messenger_v2.c:3806:11: error: no member named 'out_enc_pages' in 'struct ceph_connection_v2_info'
    3806 |                 con->v2.out_enc_pages = NULL;
         |                 ~~~~~~~ ^
   10 errors generated.


vim +3224 net/ceph/messenger_v2.c

cd1a677cad9940 Ilya Dryomov      2020-11-19  3215  
cd1a677cad9940 Ilya Dryomov      2020-11-19  3216  static void queue_enc_page(struct ceph_connection *con)
cd1a677cad9940 Ilya Dryomov      2020-11-19  3217  {
cd1a677cad9940 Ilya Dryomov      2020-11-19  3218  	struct bio_vec bv;
cd1a677cad9940 Ilya Dryomov      2020-11-19  3219  
cd1a677cad9940 Ilya Dryomov      2020-11-19  3220  	dout("%s con %p i %d resid %d\n", __func__, con, con->v2.out_enc_i,
cd1a677cad9940 Ilya Dryomov      2020-11-19  3221  	     con->v2.out_enc_resid);
cd1a677cad9940 Ilya Dryomov      2020-11-19  3222  	WARN_ON(!con->v2.out_enc_resid);
cd1a677cad9940 Ilya Dryomov      2020-11-19  3223  
1eb9cd15004fa9 Christoph Hellwig 2023-02-03 @3224  	bvec_set_page(&bv, con->v2.out_enc_pages[con->v2.out_enc_i],
1eb9cd15004fa9 Christoph Hellwig 2023-02-03  3225  		      min(con->v2.out_enc_resid, (int)PAGE_SIZE), 0);
cd1a677cad9940 Ilya Dryomov      2020-11-19  3226  
cd1a677cad9940 Ilya Dryomov      2020-11-19  3227  	set_out_bvec(con, &bv, false);
cd1a677cad9940 Ilya Dryomov      2020-11-19  3228  	con->v2.out_enc_i++;
cd1a677cad9940 Ilya Dryomov      2020-11-19  3229  	con->v2.out_enc_resid -= bv.bv_len;
cd1a677cad9940 Ilya Dryomov      2020-11-19  3230  
cd1a677cad9940 Ilya Dryomov      2020-11-19  3231  	if (con->v2.out_enc_resid) {
cd1a677cad9940 Ilya Dryomov      2020-11-19 @3232  		WARN_ON(con->v2.out_state != OUT_S_QUEUE_ENC_PAGE);
cd1a677cad9940 Ilya Dryomov      2020-11-19  3233  		return;
cd1a677cad9940 Ilya Dryomov      2020-11-19  3234  	}
cd1a677cad9940 Ilya Dryomov      2020-11-19  3235  
cd1a677cad9940 Ilya Dryomov      2020-11-19  3236  	/*
cd1a677cad9940 Ilya Dryomov      2020-11-19  3237  	 * We've queued the last piece of ciphertext (ending with
cd1a677cad9940 Ilya Dryomov      2020-11-19  3238  	 * epilogue) + auth tag.  Once it's written, we are done.
cd1a677cad9940 Ilya Dryomov      2020-11-19  3239  	 */
cd1a677cad9940 Ilya Dryomov      2020-11-19  3240  	WARN_ON(con->v2.out_enc_i != con->v2.out_enc_page_cnt);
cd1a677cad9940 Ilya Dryomov      2020-11-19  3241  	con->v2.out_state = OUT_S_FINISH_MESSAGE;
cd1a677cad9940 Ilya Dryomov      2020-11-19  3242  }
cd1a677cad9940 Ilya Dryomov      2020-11-19  3243  

:::::: The code at line 3224 was first introduced by commit
:::::: 1eb9cd15004fa91b6d1911af9fbaff299d8e9e45 libceph: use bvec_set_page to initialize bvecs

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
