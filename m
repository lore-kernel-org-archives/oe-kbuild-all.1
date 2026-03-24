Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940DD241695
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 05:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774328702; cv=none; b=oB/yVTVdqCaRKVpED+txDTPfAz/A1z1wFnEn7QkBoH8cuaqSkC4OLdqROzo5AdQ79I4lF8jWCkMypGJAHLEqjpkEUwe4zsXjT+cKFAQ/15YhrYABtT803z2yJJaWXYKs6UUgWp3pSCFLJdvaUpt5DOHFYHKufxhgHFtGDhF7pLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774328702; c=relaxed/simple;
	bh=P4ZXWtD9RN01IBVgESDcqWgV9B9VyT4rKzP5GNz47Ro=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UwHZ0/PgukQ6y0LgCbMHZ3pN/2xip5lHmFekFMUjhqPnASVjfo/dygFg04pv5FZmPTZp9jnY5LzRbK0yXLVOIMxfINFscJ+CR5rRK7iciHW0Luru6jPvk8qV39oHCBaqcIJXL7O6eqmsJiIaSYGkHIsfe6hQuTUl2Wn0ISWA/W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWK7jcjI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWK7jcjI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774328701; x=1805864701;
  h=date:from:to:cc:subject:message-id;
  bh=P4ZXWtD9RN01IBVgESDcqWgV9B9VyT4rKzP5GNz47Ro=;
  b=SWK7jcjIF3VNfxDPfZxL8hoIFd8qNQD5d5SeClHiBIkZWDr1t0vfx5vF
   0x5r+ngteLAdCHKX/Ee46x073vUx8R5IT1ykP3Ns4IhEvw3OmP2nmlNPe
   SGE8acjIGER1ZJChYJHNJVMI/TYiy/u5ZLewgEmEFH2tw3JnQD9xvD4H2
   tVNVmgfeQDAErrGvo2cFZQTie086AOkV8X91JmAAcueA3R+SviTRtIDyH
   GgGAa6wMGMPSv9OfZKVOGyfu7jnWM3lAj25wOiPeMMRccTTHzPy+lNtXI
   3qDL3P0Fq9/xK4yxbb0QEC86UGXWn/xcf0+akvZZjlKLE2bKaiYNeEV3N
   g==;
X-CSE-ConnectionGUID: pO3Rv7YhQ022oKGwGH6Rzg==
X-CSE-MsgGUID: sR32hgoyTWGdc6WnQzAYJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74358395"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="74358395"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 22:05:00 -0700
X-CSE-ConnectionGUID: q6ZAE5dCRF+5MkIw64SIgQ==
X-CSE-MsgGUID: UEKzw9s/QAaTo0bqnHh07A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="225901089"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Mar 2026 22:04:58 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4twm-000000003rd-0DLU;
	Tue, 24 Mar 2026 05:04:56 +0000
Date: Tue, 24 Mar 2026 13:04:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 76/77]
 net/ceph/messenger_v2.c:3216:36: error: 'struct ceph_connection_v2_info' has
 no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
Message-ID: <202603241236.oC1r9XIM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   05d546a07e9a570d280344cff29c354b67fda562
commit: 106815df58fb06630dd028b8e628aeeec568abc9 [76/77] ceph: Don't use data_pages
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260324/202603241236.oC1r9XIM-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241236.oC1r9XIM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241236.oC1r9XIM-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ceph/messenger_v2.c: In function 'queue_enc_page':
>> net/ceph/messenger_v2.c:3216:36: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3216 |         bvec_set_page(&bv, con->v2.out_enc_pages[con->v2.out_enc_i],
         |                                    ^~~~~~~~~~~~~
         |                                    in_enc_pages
   In file included from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/crypto/aead.h:11,
                    from net/ceph/messenger_v2.c:10:
>> net/ceph/messenger_v2.c:3224:46: error: 'OUT_S_QUEUE_ENC_PAGE' undeclared (first use in this function); did you mean 'OUT_S_QUEUE_ENC_BVECQ'?
    3224 |                 WARN_ON(con->v2.out_state != OUT_S_QUEUE_ENC_PAGE);
         |                                              ^~~~~~~~~~~~~~~~~~~~
   arch/sh/include/asm/bug.h:69:32: note: in definition of macro 'WARN_ON'
      69 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   net/ceph/messenger_v2.c:3224:46: note: each undeclared identifier is reported only once for each function it appears in
    3224 |                 WARN_ON(con->v2.out_state != OUT_S_QUEUE_ENC_PAGE);
         |                                              ^~~~~~~~~~~~~~~~~~~~
   arch/sh/include/asm/bug.h:69:32: note: in definition of macro 'WARN_ON'
      69 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   net/ceph/messenger_v2.c: In function 'finish_message':
   net/ceph/messenger_v2.c:3262:21: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3262 |         if (con->v2.out_enc_pages) {
         |                     ^~~~~~~~~~~~~
         |                     in_enc_pages
   net/ceph/messenger_v2.c:3264:50: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3264 |                 ceph_release_page_vector(con->v2.out_enc_pages,
         |                                                  ^~~~~~~~~~~~~
         |                                                  in_enc_pages
   net/ceph/messenger_v2.c:3266:25: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3266 |                 con->v2.out_enc_pages = NULL;
         |                         ^~~~~~~~~~~~~
         |                         in_enc_pages
   net/ceph/messenger_v2.c: In function 'populate_out_iter':
   net/ceph/messenger_v2.c:3302:14: error: 'OUT_S_QUEUE_ENC_PAGE' undeclared (first use in this function); did you mean 'OUT_S_QUEUE_ENC_BVECQ'?
    3302 |         case OUT_S_QUEUE_ENC_PAGE:
         |              ^~~~~~~~~~~~~~~~~~~~
         |              OUT_S_QUEUE_ENC_BVECQ
   net/ceph/messenger_v2.c: In function 'ceph_con_v2_revoke':
   net/ceph/messenger_v2.c:3626:46: error: 'OUT_S_QUEUE_ENC_PAGE' undeclared (first use in this function); did you mean 'OUT_S_QUEUE_ENC_BVECQ'?
    3626 |                 WARN_ON(con->v2.out_state != OUT_S_QUEUE_ENC_PAGE &&
         |                                              ^~~~~~~~~~~~~~~~~~~~
   arch/sh/include/asm/bug.h:69:32: note: in definition of macro 'WARN_ON'
      69 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   net/ceph/messenger_v2.c: In function 'ceph_con_v2_reset_protocol':
   net/ceph/messenger_v2.c:3794:21: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3794 |         if (con->v2.out_enc_pages) {
         |                     ^~~~~~~~~~~~~
         |                     in_enc_pages
   net/ceph/messenger_v2.c:3796:50: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3796 |                 ceph_release_page_vector(con->v2.out_enc_pages,
         |                                                  ^~~~~~~~~~~~~
         |                                                  in_enc_pages
   net/ceph/messenger_v2.c:3798:25: error: 'struct ceph_connection_v2_info' has no member named 'out_enc_pages'; did you mean 'in_enc_pages'?
    3798 |                 con->v2.out_enc_pages = NULL;
         |                         ^~~~~~~~~~~~~
         |                         in_enc_pages


vim +3216 net/ceph/messenger_v2.c

cd1a677cad9940 Ilya Dryomov      2020-11-19  3207  
cd1a677cad9940 Ilya Dryomov      2020-11-19  3208  static void queue_enc_page(struct ceph_connection *con)
cd1a677cad9940 Ilya Dryomov      2020-11-19  3209  {
cd1a677cad9940 Ilya Dryomov      2020-11-19  3210  	struct bio_vec bv;
cd1a677cad9940 Ilya Dryomov      2020-11-19  3211  
cd1a677cad9940 Ilya Dryomov      2020-11-19  3212  	dout("%s con %p i %d resid %d\n", __func__, con, con->v2.out_enc_i,
cd1a677cad9940 Ilya Dryomov      2020-11-19  3213  	     con->v2.out_enc_resid);
cd1a677cad9940 Ilya Dryomov      2020-11-19  3214  	WARN_ON(!con->v2.out_enc_resid);
cd1a677cad9940 Ilya Dryomov      2020-11-19  3215  
1eb9cd15004fa9 Christoph Hellwig 2023-02-03 @3216  	bvec_set_page(&bv, con->v2.out_enc_pages[con->v2.out_enc_i],
1eb9cd15004fa9 Christoph Hellwig 2023-02-03  3217  		      min(con->v2.out_enc_resid, (int)PAGE_SIZE), 0);
cd1a677cad9940 Ilya Dryomov      2020-11-19  3218  
cd1a677cad9940 Ilya Dryomov      2020-11-19  3219  	set_out_bvec(con, &bv, false);
cd1a677cad9940 Ilya Dryomov      2020-11-19  3220  	con->v2.out_enc_i++;
cd1a677cad9940 Ilya Dryomov      2020-11-19  3221  	con->v2.out_enc_resid -= bv.bv_len;
cd1a677cad9940 Ilya Dryomov      2020-11-19  3222  
cd1a677cad9940 Ilya Dryomov      2020-11-19  3223  	if (con->v2.out_enc_resid) {
cd1a677cad9940 Ilya Dryomov      2020-11-19 @3224  		WARN_ON(con->v2.out_state != OUT_S_QUEUE_ENC_PAGE);
cd1a677cad9940 Ilya Dryomov      2020-11-19  3225  		return;
cd1a677cad9940 Ilya Dryomov      2020-11-19  3226  	}
cd1a677cad9940 Ilya Dryomov      2020-11-19  3227  
cd1a677cad9940 Ilya Dryomov      2020-11-19  3228  	/*
cd1a677cad9940 Ilya Dryomov      2020-11-19  3229  	 * We've queued the last piece of ciphertext (ending with
cd1a677cad9940 Ilya Dryomov      2020-11-19  3230  	 * epilogue) + auth tag.  Once it's written, we are done.
cd1a677cad9940 Ilya Dryomov      2020-11-19  3231  	 */
cd1a677cad9940 Ilya Dryomov      2020-11-19  3232  	WARN_ON(con->v2.out_enc_i != con->v2.out_enc_page_cnt);
cd1a677cad9940 Ilya Dryomov      2020-11-19  3233  	con->v2.out_state = OUT_S_FINISH_MESSAGE;
cd1a677cad9940 Ilya Dryomov      2020-11-19  3234  }
cd1a677cad9940 Ilya Dryomov      2020-11-19  3235  

:::::: The code at line 3216 was first introduced by commit
:::::: 1eb9cd15004fa91b6d1911af9fbaff299d8e9e45 libceph: use bvec_set_page to initialize bvecs

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
