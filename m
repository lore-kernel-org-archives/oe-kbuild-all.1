Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CEA847C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 12:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="juGtxVAf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698236167; x=1729772167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1dmaxua6exS7p/LcQMAZZgbAlPzoLCvEPMnLTeq+onM=;
  b=juGtxVAfTUCsLWccy3+3OIqoB0/F3cO90ivNTmuV+fpMVhdIu+8K42Xs
   9wLFB23klnM5fFeKaJMwBWVSv8665E1FIMvCJF3iXREM0wQAKzgbuc4dm
   CIBQ1bH57N9/U765RaRF1Wr3YHEpokY6o20LI6z7+CC05bQKSeIie/pxL
   6eI62ICEqCWO39ITeGHj2oFl/2JdHOuLue4jjfcpWtii+5T+DBYt/9FGp
   b8SNQcxd0fl73DFrJcAG9ACa33tVnhgt0MRlE2bdWZbXanyIUVJN9lzGQ
   l3FtzTmCC+i4vPpKUah74TauBlmETBk2CDekUt/uBQhwdApiF24BVt+d6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="451519702"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="451519702"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 05:16:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="71791"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Oct 2023 05:15:31 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvcnr-0008sJ-1O;
	Wed, 25 Oct 2023 12:16:03 +0000
Date: Wed, 25 Oct 2023 20:15:04 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-crypto 36/36] drivers/crypto/talitos.c:2125:14: error:
 'struct crypto_ahash' has no member named 'init'
Message-ID: <202310252047.LdrfJ6H7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-crypto
head:   042fbdaad22963e891b5e8d4155aceedd1ee2164
commit: 042fbdaad22963e891b5e8d4155aceedd1ee2164 [36/36] crypto: ahash - optimize performance when wrapping shash
config: powerpc-ppc6xx_defconfig (https://download.01.org/0day-ci/archive/20231025/202310252047.LdrfJ6H7-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310252047.LdrfJ6H7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310252047.LdrfJ6H7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/crypto/talitos.c: In function 'ahash_digest':
>> drivers/crypto/talitos.c:2125:14: error: 'struct crypto_ahash' has no member named 'init'
    2125 |         ahash->init(areq);
         |              ^~


vim +2125 drivers/crypto/talitos.c

497f2e6b8b2140 Lee Nipper   2010-05-19  2119  
497f2e6b8b2140 Lee Nipper   2010-05-19  2120  static int ahash_digest(struct ahash_request *areq)
497f2e6b8b2140 Lee Nipper   2010-05-19  2121  {
497f2e6b8b2140 Lee Nipper   2010-05-19  2122  	struct talitos_ahash_req_ctx *req_ctx = ahash_request_ctx(areq);
60f208d7836216 Kim Phillips 2010-05-19  2123  	struct crypto_ahash *ahash = crypto_ahash_reqtfm(areq);
497f2e6b8b2140 Lee Nipper   2010-05-19  2124  
60f208d7836216 Kim Phillips 2010-05-19 @2125  	ahash->init(areq);
497f2e6b8b2140 Lee Nipper   2010-05-19  2126  	req_ctx->last = 1;
497f2e6b8b2140 Lee Nipper   2010-05-19  2127  
497f2e6b8b2140 Lee Nipper   2010-05-19  2128  	return ahash_process_req(areq, areq->nbytes);
497f2e6b8b2140 Lee Nipper   2010-05-19  2129  }
497f2e6b8b2140 Lee Nipper   2010-05-19  2130  

:::::: The code at line 2125 was first introduced by commit
:::::: 60f208d7836216885cdcd6f77a02f31dbc66f169 crypto: talitos - add support for sha224

:::::: TO: Kim Phillips <kim.phillips@freescale.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
