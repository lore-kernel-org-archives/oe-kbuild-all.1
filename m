Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB97C1DE3C3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 12:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739794173; cv=none; b=k53O7XtwLGK2OkSXYG3If1s55YMhPW6r4xJei1vEQvpXaKaQeNLbat7ArqfT+uSSUGxUFedsrnaG/GwJ368CFTIunY86JcqRczgDaSwRxukNtFDQiWhHCDFMUpxZLB/a8xDS0JQ2FxSsqN1Ib1mW9zRhc7PNhEoWHymgm8AcAio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739794173; c=relaxed/simple;
	bh=TXvNXH5nYpZKuu4MPZq8KtdJiRzh50qP+ib8LeN2boY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kWfDhWday23sMxmEZTUgzZL9c3upxkDjU2Ht8v7Il/RxeYogQtpAb5oLb/xYE8J+rCRkkV2iGaUOALrVVoH/J8ShjNYWBVZlsCbrz39ih/6XkpOY6dqkfZI3r0y7l5yx9oaU+lFvt3w3vKvTZgILP88O9MuMn9KDbpep9KM0ZY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dp+3y8EL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dp+3y8EL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739794172; x=1771330172;
  h=date:from:cc:subject:message-id:mime-version;
  bh=TXvNXH5nYpZKuu4MPZq8KtdJiRzh50qP+ib8LeN2boY=;
  b=dp+3y8ELwdIXPWzV96BJMAFpouBXmngyb05BKBJ8BUgRep6g6AdlHj1K
   Ze/8LE+kyp9+v2x/M3pYavo2Ze50zpyHxiNIKCECPaHewMn0xm4NCLxHF
   y8TVYspPN5Y1djrBUTgjRsi1thKr/OcF2dhfL9rZLDQFHv6GZWzwF0PR6
   QeCIZGof4fbnsIeN1rjA0AzRns4VBDPj5GBQ/SL6syPdRW7a//afiaB8J
   rGWlasfAn1lz7r/lHb40UwsJRDcQgqNBeMf7wohZ/QAeB7edPWRJE+UIG
   gwogSWh2tUSmvt0YE4jBJOuQR2kdNlQRmiPRf7+4z62SbesgWg9gGlm6C
   A==;
X-CSE-ConnectionGUID: RAbTFQh6SHKj18L+UJjtgQ==
X-CSE-MsgGUID: cKNrZ/joQtek3/fC3lOH4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51881986"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="51881986"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 04:09:31 -0800
X-CSE-ConnectionGUID: 1yBcne1zRGicZj2MMoJTXQ==
X-CSE-MsgGUID: a63O4srtSIKh7ThYjNeerA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119321915"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Feb 2025 04:09:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjzwG-001D4v-15
	for oe-kbuild-all@lists.linux.dev;
	Mon, 17 Feb 2025 12:09:28 +0000
Date: Mon, 17 Feb 2025 20:09:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] include/crypto/hash.h:666:21: warning: storing
 the address of local variable 'result' in '*req.result'
Message-ID: <202502172029.Tg9B9Ncx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 4cc2dcf95f1c2849e489df91c07aee5f368a39f9 [1/1] crypto: testmgr - convert hash testing to use testvec_configs
config: arm-randconfig-002-20250217 (https://download.01.org/0day-ci/archive/20250217/202502172029.Tg9B9Ncx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502172029.Tg9B9Ncx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502172029.Tg9B9Ncx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/testmgr.c:644:13: warning: 'is_test_sglist_corrupted' defined but not used [-Wunused-function]
     644 | static bool is_test_sglist_corrupted(const struct test_sglist *tsgl)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from crypto/testmgr.c:25:
   In function 'ahash_request_set_crypt',
       inlined from 'test_hash_vec_cfg' at crypto/testmgr.c:929:2:
>> include/crypto/hash.h:666:21: warning: storing the address of local variable 'result' in '*req.result' [-Wdangling-pointer=]
     666 |         req->result = result;
         |         ~~~~~~~~~~~~^~~~~~~~
   crypto/testmgr.c: In function 'test_hash_vec_cfg':
   crypto/testmgr.c:881:12: note: 'result' declared here
     881 |         u8 result[HASH_MAX_DIGESTSIZE + TESTMGR_POISON_LEN];
         |            ^~~~~~
   crypto/testmgr.c:865:52: note: 'req' declared here
     865 |                              struct ahash_request *req,
         |                              ~~~~~~~~~~~~~~~~~~~~~~^~~


vim +666 include/crypto/hash.h

18e33e6d5cc049 Herbert Xu      2008-07-10  646  
90240ffb127729 Stephan Mueller 2014-11-12  647  /**
90240ffb127729 Stephan Mueller 2014-11-12  648   * ahash_request_set_crypt() - set data buffers
90240ffb127729 Stephan Mueller 2014-11-12  649   * @req: ahash_request handle to be updated
90240ffb127729 Stephan Mueller 2014-11-12  650   * @src: source scatter/gather list
90240ffb127729 Stephan Mueller 2014-11-12  651   * @result: buffer that is filled with the message digest -- the caller must
90240ffb127729 Stephan Mueller 2014-11-12  652   *	    ensure that the buffer has sufficient space by, for example, calling
90240ffb127729 Stephan Mueller 2014-11-12  653   *	    crypto_ahash_digestsize()
90240ffb127729 Stephan Mueller 2014-11-12  654   * @nbytes: number of bytes to process from the source scatter/gather list
90240ffb127729 Stephan Mueller 2014-11-12  655   *
90240ffb127729 Stephan Mueller 2014-11-12  656   * By using this call, the caller references the source scatter/gather list.
90240ffb127729 Stephan Mueller 2014-11-12  657   * The source scatter/gather list points to the data the message digest is to
90240ffb127729 Stephan Mueller 2014-11-12  658   * be calculated for.
90240ffb127729 Stephan Mueller 2014-11-12  659   */
18e33e6d5cc049 Herbert Xu      2008-07-10  660  static inline void ahash_request_set_crypt(struct ahash_request *req,
18e33e6d5cc049 Herbert Xu      2008-07-10  661  					   struct scatterlist *src, u8 *result,
18e33e6d5cc049 Herbert Xu      2008-07-10  662  					   unsigned int nbytes)
18e33e6d5cc049 Herbert Xu      2008-07-10  663  {
18e33e6d5cc049 Herbert Xu      2008-07-10  664  	req->src = src;
18e33e6d5cc049 Herbert Xu      2008-07-10  665  	req->nbytes = nbytes;
18e33e6d5cc049 Herbert Xu      2008-07-10 @666  	req->result = result;
18e33e6d5cc049 Herbert Xu      2008-07-10  667  }
18e33e6d5cc049 Herbert Xu      2008-07-10  668  

:::::: The code at line 666 was first introduced by commit
:::::: 18e33e6d5cc0495826f5245777cd267732815e01 crypto: hash - Move ahash functions into crypto/hash.h

:::::: TO: Herbert Xu <herbert@gondor.apana.org.au>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
