Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1226B208B8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 03:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724297722; cv=none; b=MCV38PfoB2LIlurz9voIOQrCJMEty1h/IizlGJ0Gb3HxqoJ6It1pDafcaGtQOb3f+JU5m8634ZowEKMS6wX2NL62ZemOwCQYsJ0VJ7M2xq4YQuMGOsJ/hbS1Wy61O8kEivtTt8orw8I69ocO9e0TsSKZHIMoi8tMcVUq2RpRx64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724297722; c=relaxed/simple;
	bh=8AML+pq1cg7WS+QpCZqiyh1gJ5QpKuhBMWzC2Lh/m+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DkXB9jo8XNf5FDTScYaKhkNyg8ixAeeniLOGN3WaR+aPyi9VWtIHmx9bG8SiISg6R5zSO0ILJkI78a+zOd9hds4AZalrijUVHbc10r0xJPrYl2kfKUUv87vOOnC/e3K3SDoZOhSnY2bnci2ALBLzllQCmswHXfWQc2xrPaUFq7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfgqsixG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfgqsixG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724297720; x=1755833720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8AML+pq1cg7WS+QpCZqiyh1gJ5QpKuhBMWzC2Lh/m+Y=;
  b=DfgqsixGuS/Y1H7sKWFhEdcithJL/i9RYY54V1JJMoFDL+RCAxs8mVx1
   2MGIwP+fYu07EKqthRZ6CWqLtWZCC5l4xWwVvN8ARAF3fzf3g6dCxWHy6
   bxJc1BrxH3diWazad9LnUUQiYLRkdK0uoTZDZkx7aVqUJDIOr2flP0Lnb
   LDotKb3J8G2H6gWWSNxPTc9zff6JwfhEMI26PkPX6Ja0YTGQHXSO/LGdv
   cyRCKf7RR6rWfzWWePitdoZGC9Y0NlQU6N5NvQkvPc/M5qsP9SJ5YmKMN
   HMAQQesE5o7ZrMg+nx5I7fkC/aCOkHH5xoiSLB+bDW5RIr1R5NM8KaDdW
   w==;
X-CSE-ConnectionGUID: UDHxusfVTQiKe5f2uMSgYw==
X-CSE-MsgGUID: oAw7lsPqQ9OfL0q7irDUtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="13146331"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="13146331"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 20:35:19 -0700
X-CSE-ConnectionGUID: rCGcGLHrTBOla/dx/KnxUg==
X-CSE-MsgGUID: hS89KaJsSwOj1e5m5jf7RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="61290684"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Aug 2024 20:35:18 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgybT-000CFA-2v;
	Thu, 22 Aug 2024 03:35:15 +0000
Date: Thu, 22 Aug 2024 11:35:11 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 11/31]
 drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:527:5: error: field
 designator 'sign' does not refer to any field in type 'struct akcipher_alg'
Message-ID: <202408221119.3rIYKAjD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   96139555c6962cebb237d22905327ac2859ddd07
commit: a6808b5394f4aae6f3a87a14e65588ec8cd1cd65 [11/31] crypto: akcipher - Drop sign/verify operations
config: i386-buildonly-randconfig-003-20240822 (https://download.01.org/0day-ci/archive/20240822/202408221119.3rIYKAjD-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221119.3rIYKAjD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221119.3rIYKAjD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:527:5: error: field designator 'sign' does not refer to any field in type 'struct akcipher_alg'
     527 |                         .sign = virtio_crypto_rsa_sign,
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:528:5: error: field designator 'verify' does not refer to any field in type 'struct akcipher_alg'
     528 |                         .verify = virtio_crypto_rsa_verify,
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:555:18: error: invalid application of 'sizeof' to an incomplete type 'struct virtio_crypto_akcipher_algo[]'
     555 |         for (i = 0; i < ARRAY_SIZE(virtio_crypto_akcipher_algs); i++) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:584:18: error: invalid application of 'sizeof' to an incomplete type 'struct virtio_crypto_akcipher_algo[]'
     584 |         for (i = 0; i < ARRAY_SIZE(virtio_crypto_akcipher_algs); i++) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   4 errors generated.


vim +527 drivers/crypto/virtio/virtio_crypto_akcipher_algs.c

59ca6c93387d32 zhenwei pi 2022-03-02  496  
59ca6c93387d32 zhenwei pi 2022-03-02  497  static struct virtio_crypto_akcipher_algo virtio_crypto_akcipher_algs[] = {
59ca6c93387d32 zhenwei pi 2022-03-02  498  	{
59ca6c93387d32 zhenwei pi 2022-03-02  499  		.algonum = VIRTIO_CRYPTO_AKCIPHER_RSA,
59ca6c93387d32 zhenwei pi 2022-03-02  500  		.service = VIRTIO_CRYPTO_SERVICE_AKCIPHER,
7a2673d70ca69b Herbert Xu 2023-08-13  501  		.algo.base = {
59ca6c93387d32 zhenwei pi 2022-03-02  502  			.encrypt = virtio_crypto_rsa_encrypt,
59ca6c93387d32 zhenwei pi 2022-03-02  503  			.decrypt = virtio_crypto_rsa_decrypt,
59ca6c93387d32 zhenwei pi 2022-03-02  504  			.set_pub_key = virtio_crypto_rsa_raw_set_pub_key,
59ca6c93387d32 zhenwei pi 2022-03-02  505  			.set_priv_key = virtio_crypto_rsa_raw_set_priv_key,
59ca6c93387d32 zhenwei pi 2022-03-02  506  			.max_size = virtio_crypto_rsa_max_size,
59ca6c93387d32 zhenwei pi 2022-03-02  507  			.init = virtio_crypto_rsa_init_tfm,
59ca6c93387d32 zhenwei pi 2022-03-02  508  			.exit = virtio_crypto_rsa_exit_tfm,
59ca6c93387d32 zhenwei pi 2022-03-02  509  			.base = {
59ca6c93387d32 zhenwei pi 2022-03-02  510  				.cra_name = "rsa",
59ca6c93387d32 zhenwei pi 2022-03-02  511  				.cra_driver_name = "virtio-crypto-rsa",
59ca6c93387d32 zhenwei pi 2022-03-02  512  				.cra_priority = 150,
59ca6c93387d32 zhenwei pi 2022-03-02  513  				.cra_module = THIS_MODULE,
59ca6c93387d32 zhenwei pi 2022-03-02  514  				.cra_ctxsize = sizeof(struct virtio_crypto_akcipher_ctx),
59ca6c93387d32 zhenwei pi 2022-03-02  515  			},
59ca6c93387d32 zhenwei pi 2022-03-02  516  		},
7a2673d70ca69b Herbert Xu 2023-08-13  517  		.algo.op = {
7a2673d70ca69b Herbert Xu 2023-08-13  518  			.do_one_request = virtio_crypto_rsa_do_req,
7a2673d70ca69b Herbert Xu 2023-08-13  519  		},
59ca6c93387d32 zhenwei pi 2022-03-02  520  	},
59ca6c93387d32 zhenwei pi 2022-03-02  521  	{
59ca6c93387d32 zhenwei pi 2022-03-02  522  		.algonum = VIRTIO_CRYPTO_AKCIPHER_RSA,
59ca6c93387d32 zhenwei pi 2022-03-02  523  		.service = VIRTIO_CRYPTO_SERVICE_AKCIPHER,
7a2673d70ca69b Herbert Xu 2023-08-13  524  		.algo.base = {
59ca6c93387d32 zhenwei pi 2022-03-02  525  			.encrypt = virtio_crypto_rsa_encrypt,
59ca6c93387d32 zhenwei pi 2022-03-02  526  			.decrypt = virtio_crypto_rsa_decrypt,
59ca6c93387d32 zhenwei pi 2022-03-02 @527  			.sign = virtio_crypto_rsa_sign,
59ca6c93387d32 zhenwei pi 2022-03-02 @528  			.verify = virtio_crypto_rsa_verify,
59ca6c93387d32 zhenwei pi 2022-03-02  529  			.set_pub_key = virtio_crypto_p1pad_rsa_sha1_set_pub_key,
59ca6c93387d32 zhenwei pi 2022-03-02  530  			.set_priv_key = virtio_crypto_p1pad_rsa_sha1_set_priv_key,
59ca6c93387d32 zhenwei pi 2022-03-02  531  			.max_size = virtio_crypto_rsa_max_size,
59ca6c93387d32 zhenwei pi 2022-03-02  532  			.init = virtio_crypto_rsa_init_tfm,
59ca6c93387d32 zhenwei pi 2022-03-02  533  			.exit = virtio_crypto_rsa_exit_tfm,
59ca6c93387d32 zhenwei pi 2022-03-02  534  			.base = {
59ca6c93387d32 zhenwei pi 2022-03-02  535  				.cra_name = "pkcs1pad(rsa,sha1)",
59ca6c93387d32 zhenwei pi 2022-03-02  536  				.cra_driver_name = "virtio-pkcs1-rsa-with-sha1",
59ca6c93387d32 zhenwei pi 2022-03-02  537  				.cra_priority = 150,
59ca6c93387d32 zhenwei pi 2022-03-02  538  				.cra_module = THIS_MODULE,
59ca6c93387d32 zhenwei pi 2022-03-02  539  				.cra_ctxsize = sizeof(struct virtio_crypto_akcipher_ctx),
59ca6c93387d32 zhenwei pi 2022-03-02  540  			},
59ca6c93387d32 zhenwei pi 2022-03-02  541  		},
7a2673d70ca69b Herbert Xu 2023-08-13  542  		.algo.op = {
7a2673d70ca69b Herbert Xu 2023-08-13  543  			.do_one_request = virtio_crypto_rsa_do_req,
7a2673d70ca69b Herbert Xu 2023-08-13  544  		},
59ca6c93387d32 zhenwei pi 2022-03-02  545  	},
59ca6c93387d32 zhenwei pi 2022-03-02  546  };
59ca6c93387d32 zhenwei pi 2022-03-02  547  
59ca6c93387d32 zhenwei pi 2022-03-02  548  int virtio_crypto_akcipher_algs_register(struct virtio_crypto *vcrypto)
59ca6c93387d32 zhenwei pi 2022-03-02  549  {
59ca6c93387d32 zhenwei pi 2022-03-02  550  	int ret = 0;
59ca6c93387d32 zhenwei pi 2022-03-02  551  	int i = 0;
59ca6c93387d32 zhenwei pi 2022-03-02  552  
59ca6c93387d32 zhenwei pi 2022-03-02  553  	mutex_lock(&algs_lock);
59ca6c93387d32 zhenwei pi 2022-03-02  554  
59ca6c93387d32 zhenwei pi 2022-03-02 @555  	for (i = 0; i < ARRAY_SIZE(virtio_crypto_akcipher_algs); i++) {
59ca6c93387d32 zhenwei pi 2022-03-02  556  		uint32_t service = virtio_crypto_akcipher_algs[i].service;
59ca6c93387d32 zhenwei pi 2022-03-02  557  		uint32_t algonum = virtio_crypto_akcipher_algs[i].algonum;
59ca6c93387d32 zhenwei pi 2022-03-02  558  
59ca6c93387d32 zhenwei pi 2022-03-02  559  		if (!virtcrypto_algo_is_supported(vcrypto, service, algonum))
59ca6c93387d32 zhenwei pi 2022-03-02  560  			continue;
59ca6c93387d32 zhenwei pi 2022-03-02  561  
59ca6c93387d32 zhenwei pi 2022-03-02  562  		if (virtio_crypto_akcipher_algs[i].active_devs == 0) {
7a2673d70ca69b Herbert Xu 2023-08-13  563  			ret = crypto_engine_register_akcipher(&virtio_crypto_akcipher_algs[i].algo);
59ca6c93387d32 zhenwei pi 2022-03-02  564  			if (ret)
59ca6c93387d32 zhenwei pi 2022-03-02  565  				goto unlock;
59ca6c93387d32 zhenwei pi 2022-03-02  566  		}
59ca6c93387d32 zhenwei pi 2022-03-02  567  
59ca6c93387d32 zhenwei pi 2022-03-02  568  		virtio_crypto_akcipher_algs[i].active_devs++;
59ca6c93387d32 zhenwei pi 2022-03-02  569  		dev_info(&vcrypto->vdev->dev, "Registered akcipher algo %s\n",
7a2673d70ca69b Herbert Xu 2023-08-13  570  			 virtio_crypto_akcipher_algs[i].algo.base.base.cra_name);
59ca6c93387d32 zhenwei pi 2022-03-02  571  	}
59ca6c93387d32 zhenwei pi 2022-03-02  572  
59ca6c93387d32 zhenwei pi 2022-03-02  573  unlock:
59ca6c93387d32 zhenwei pi 2022-03-02  574  	mutex_unlock(&algs_lock);
59ca6c93387d32 zhenwei pi 2022-03-02  575  	return ret;
59ca6c93387d32 zhenwei pi 2022-03-02  576  }
59ca6c93387d32 zhenwei pi 2022-03-02  577  

:::::: The code at line 527 was first introduced by commit
:::::: 59ca6c93387d325e96577d8bd4c23c78c1491c11 virtio-crypto: implement RSA algorithm

:::::: TO: zhenwei pi <pizhenwei@bytedance.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
