Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BD84EC640
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Sep 2026 20:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788553444; cv=none; b=NWkzYqJfNnkyjUdmvcOC49wxgz9bKcSoZ2ckVDWEa6awDjjTYkhuNVO1mF4PRt8gSSEezhLZClsaul1iVPHQ54hOIMAGhki6Owyel92XJUSodbhABmKfUfEZl17oM+AyP2sd7yJwrVh8wyCgvKJ7CfLNBetZJgu5VmsiJN2Y1X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788553444; c=relaxed/simple;
	bh=YzAHPRzgSmpEtNan3j6OkuNk8uOH0nrsHBzqc+RfAu4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t8Yy1SoO1/eZNfXrp3Q5qj/a4L5EtgHX25SVQEKXg1w1LpX9CPJdcUM/MiXwiqEVpNenCUf2DhLIoTBGbdpESdhzm7fcqbIxIrV4/LPXSxGLCCwx9g1HRlHZT4ESZTdwkS7TKbUjUhKc8rbm9SjGuee9lI9BG6/WAER4bE+0LVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=knp5FQoV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="knp5FQoV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788553441; x=1820089441;
  h=date:from:to:cc:subject:message-id;
  bh=YzAHPRzgSmpEtNan3j6OkuNk8uOH0nrsHBzqc+RfAu4=;
  b=knp5FQoV9+qooL0ZXWFK7pCLyekTbJPdT1804xLIns6D5BXTWipZqThJ
   EDcYwunDJMAdzO+Z/h4ww+aZgvtDz5EDzH6rn4CnC/nq6KUOxMfvOQoDH
   Z5yyf27E5t3tkN/AU9Ut4lJMeyhZzkuqMtfaqvNOWIl1MdP+XxWlDPybR
   CleEoiq038iTV0DhhirjFJT2HutwD5vH8ddvGtiOVzXbRkBwvQW/cebYt
   kKbe8t06K91nddteiaONOgC6PJQLl0dkgrM6Umcs1+Q7s9FY8GfX+jsUf
   u/ewq/NQbB/A9XD3B7i5OdJRUtiqAfSrH82xTl4k0UQae7w2zmhypJT1b
   Q==;
X-CSE-ConnectionGUID: apfUp53PS3KLKwxpGQz/jg==
X-CSE-MsgGUID: 8v3IcP5DQ0m87EIv/28yQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88909713"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="88909713"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 13:24:00 -0700
X-CSE-ConnectionGUID: sTTRrMLASXWmFuhogHrJdw==
X-CSE-MsgGUID: 5KJ5AkqETRubTPVLj+aG0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="274289526"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Sep 2026 13:23:58 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2aS4-00000000A9K-1bhL;
	Fri, 04 Sep 2026 20:23:56 +0000
Date: Sat, 05 Sep 2026 04:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 87/87]
 net/ceph/messenger_v2.c:3224:36: error: 'struct ceph_connection_v2_info' has
 no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
Message-ID: <202609050445.2jo3xJi5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   376ad9d4942bf11500931178bbeb965348f01057
commit: 376ad9d4942bf11500931178bbeb965348f01057 [87/87] ceph: Don't use data_pages
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260905/202609050445.2jo3xJi5-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050445.2jo3xJi5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050445.2jo3xJi5-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ceph/messenger_v2.c: In function 'queue_enc_page':
>> net/ceph/messenger_v2.c:3224:36: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3224 |         bvec_set_page(&bv, con->v2.out_enc_pages[con->v2.out_enc_i],
         |                                    ^~~~~~~~~~~~~
         |                                    in_enc_pages
   In file included from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/crypto/aead.h:11,
                    from net/ceph/messenger_v2.c:10:
>> net/ceph/messenger_v2.c:3232:46: error: 'OUT_S_QUEUE_ENC_PAGE' undeclared (first use in this function); did you mean 'OUT_S_QUEUE_ENC_BVECQ'?
    3232 |                 WARN_ON(con->v2.out_state != OUT_S_QUEUE_ENC_PAGE);
         |                                              ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:155:32: note: in definition of macro 'WARN_ON'
     155 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   net/ceph/messenger_v2.c:3232:46: note: each undeclared identifier is reported only once for each function it appears in
    3232 |                 WARN_ON(con->v2.out_state != OUT_S_QUEUE_ENC_PAGE);
         |                                              ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:155:32: note: in definition of macro 'WARN_ON'
     155 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   net/ceph/messenger_v2.c: In function 'finish_message':
   net/ceph/messenger_v2.c:3270:21: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3270 |         if (con->v2.out_enc_pages) {
         |                     ^~~~~~~~~~~~~
         |                     in_enc_pages
   net/ceph/messenger_v2.c:3272:50: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3272 |                 ceph_release_page_vector(con->v2.out_enc_pages,
         |                                                  ^~~~~~~~~~~~~
         |                                                  in_enc_pages
   net/ceph/messenger_v2.c:3274:25: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3274 |                 con->v2.out_enc_pages = NULL;
         |                         ^~~~~~~~~~~~~
         |                         in_enc_pages
   net/ceph/messenger_v2.c: In function 'populate_out_iter':
   net/ceph/messenger_v2.c:3310:14: error: 'OUT_S_QUEUE_ENC_PAGE' undeclared (first use in this function); did you mean 'OUT_S_QUEUE_ENC_BVECQ'?
    3310 |         case OUT_S_QUEUE_ENC_PAGE:
         |              ^~~~~~~~~~~~~~~~~~~~
         |              OUT_S_QUEUE_ENC_BVECQ
   In file included from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/crypto/aead.h:11,
                    from net/ceph/messenger_v2.c:10:
   net/ceph/messenger_v2.c: In function 'ceph_con_v2_revoke':
   net/ceph/messenger_v2.c:3634:46: error: 'OUT_S_QUEUE_ENC_PAGE' undeclared (first use in this function); did you mean 'OUT_S_QUEUE_ENC_BVECQ'?
    3634 |                 WARN_ON(con->v2.out_state != OUT_S_QUEUE_ENC_PAGE &&
         |                                              ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:155:32: note: in definition of macro 'WARN_ON'
     155 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   net/ceph/messenger_v2.c: In function 'ceph_con_v2_reset_protocol':
   net/ceph/messenger_v2.c:3802:21: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3802 |         if (con->v2.out_enc_pages) {
         |                     ^~~~~~~~~~~~~
         |                     in_enc_pages
   net/ceph/messenger_v2.c:3804:50: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3804 |                 ceph_release_page_vector(con->v2.out_enc_pages,
         |                                                  ^~~~~~~~~~~~~
         |                                                  in_enc_pages
   net/ceph/messenger_v2.c:3806:25: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3806 |                 con->v2.out_enc_pages = NULL;
         |                         ^~~~~~~~~~~~~
         |                         in_enc_pages


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
