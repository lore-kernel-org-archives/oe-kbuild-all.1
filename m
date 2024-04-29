Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC7E7F47A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 14:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714401529; cv=none; b=QPaevAmN7ki42xvDdDFzPwlxvaoVtZfemocAa2Eq6ZqUw7biwwvT+sqXbXLkG+ZxmSFGN1Tlejc2II3FyrlLBNWh1BFRiBZd4masdv+jCT5qFOcnRZwNx6TDDJ6B2xeaN6HLwfnWGEQaW7ETL+GrxLIHRmt6V9yTj4QuQG98+gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714401529; c=relaxed/simple;
	bh=5LGIseina+cX541dXpq07dVDwDywKsHZxIYdgQgXtp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NK9fwUmvJiYXL5oRBs9qIYEtxBbN4oF9YNGC1bkYglTZ18ZgnfusdIzpNatif0futv+UNOd3GWdU2oj4kgO+YZJmagXinXbKTWcTCit9nlnvbMgyDVMx7ajAngRN9jyuI1DNN8oc8Yw5Giul5NEQFQbyj/R7Z1iSzx6gxg47uwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NyQFD+/x; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NyQFD+/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714401527; x=1745937527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5LGIseina+cX541dXpq07dVDwDywKsHZxIYdgQgXtp8=;
  b=NyQFD+/xtFtHNiX4eU+fNJpGCAo3DimVmIus/7NerzsCuImCKyMpeW6K
   0eZ7PbjWymLDWYcYnGCjjUD31vQdv2kOJNtc8AuDrrnyM1jZh0wCTvOyx
   o5wfUYQvjAetb2aFiaHO5tm2s2+yk5aPQsXiyYKV9ZtN/4ygA4OtQl7u6
   k1tAC6Ss0N8dAXVLCP1shCfPI18YWAPT+72qyZHPQLUWwBIngYvtL9GeN
   1xLQ6rgaegQ0KnUip2/yxkLzSFKBEuY1ZJZrD+zOEwwkNJUj2jfQL+uh1
   nveJiKffyOTWctVD0TdBf7NlUHWzauWdM4ZMTGDMfwh4dnNm/rdt4X4hO
   A==;
X-CSE-ConnectionGUID: uJjNAkDSRcmpJzQHg8Ok2A==
X-CSE-MsgGUID: gKmmviK+Qdez2OYvK4iE8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="27514983"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="27514983"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:38:44 -0700
X-CSE-ConnectionGUID: jtlqgCwHSjSzGFMq+v5fRA==
X-CSE-MsgGUID: jNm0rc7vSAuFtSnc1PGxpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="25999391"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2024 07:38:43 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1S9Q-0007F0-13;
	Mon, 29 Apr 2024 14:38:40 +0000
Date: Mon, 29 Apr 2024 22:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: Harsha Harsha <harsha.harsha@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 995/995]
 drivers/crypto/xilinx/xilinx-ecdsa.c:294:38: warning: variable 'drv_ctx' set
 but not used
Message-ID: <202404292212.9O2pZC6T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   3af4295e00efdced3e8c6973606a7de55f6bf7dc
commit: 3af4295e00efdced3e8c6973606a7de55f6bf7dc [995/995] drivers: crypto: xilinx: Add support for do_one_request
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240429/202404292212.9O2pZC6T-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404292212.9O2pZC6T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404292212.9O2pZC6T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/xilinx/xilinx-ecdsa.c: In function 'handle_ecdsa_req':
>> drivers/crypto/xilinx/xilinx-ecdsa.c:294:38: warning: variable 'drv_ctx' set but not used [-Wunused-but-set-variable]
     294 |         struct xilinx_ecdsa_drv_ctx *drv_ctx;
         |                                      ^~~~~~~


vim +/drv_ctx +294 drivers/crypto/xilinx/xilinx-ecdsa.c

   283	
   284	static int handle_ecdsa_req(struct crypto_engine *engine, void *req)
   285	{
   286		struct akcipher_request *areq = container_of(req,
   287							     struct akcipher_request,
   288							     base);
   289		struct crypto_akcipher *akcipher = crypto_akcipher_reqtfm(req);
   290		struct akcipher_alg *cipher_alg = crypto_akcipher_alg(akcipher);
   291		const struct xilinx_ecdsa_tfm_ctx *tfm_ctx = akcipher_tfm_ctx(akcipher);
   292		const struct xilinx_ecdsa_req_ctx *rq_ctx = akcipher_request_ctx(areq);
   293		struct akcipher_request *subreq = akcipher_request_ctx(req);
 > 294		struct xilinx_ecdsa_drv_ctx *drv_ctx;
   295		int err;
   296	
   297		drv_ctx = container_of(cipher_alg, struct xilinx_ecdsa_drv_ctx, alg.base);
   298	
   299		akcipher_request_set_tfm(subreq, tfm_ctx->fbk_cipher);
   300	
   301		akcipher_request_set_callback(subreq, areq->base.flags, NULL, NULL);
   302		akcipher_request_set_crypt(subreq, areq->src, areq->dst,
   303					   areq->src_len, areq->dst_len);
   304	
   305		if (rq_ctx->op == XILINX_ECDSA_ENCRYPT)
   306			err = crypto_akcipher_encrypt(subreq);
   307		else if (rq_ctx->op == XILINX_ECDSA_DECRYPT)
   308			err = crypto_akcipher_decrypt(subreq);
   309		else
   310			err = -EOPNOTSUPP;
   311	
   312		crypto_finalize_akcipher_request(engine, areq, err);
   313	
   314		return 0;
   315	}
   316	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
