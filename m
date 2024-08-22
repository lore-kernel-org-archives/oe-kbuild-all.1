Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF9423776
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 04:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724302051; cv=none; b=HCJvwKb3RyJrsh3anL4gpyOEFVNuA23ymt4NmIGtQLYLPcFZ+WyowjKRpch0Zqaioyt3OQPyg5etIvr2EhpMbH6/HhXd4eUD7757XlSVlUwzP/pCXk2Sc90SeucpR2yeC+Oa26ZHAxWbMDk03tXXGVMUJTerGEWEqbyDtOeAjdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724302051; c=relaxed/simple;
	bh=mQRHcbAlOTespLAeoDlX6YSBAejonbjdaXeoof1VdhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nuWkkofANimtyMiHcdB5UqvATBI8ryAe0wQXGjXBwXcaVm9/kk195n5FXyxljfy/zB/gGe5utsvKb7cVWWyQAmjCdM/rSFbwCjhY9aUq6ntybDps+SoUdFAtP4QY4CRSM2m78TZWnIDXdDSxO5H/YBUMH8J5dW3wBLfynBXpqLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHWCYOhz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHWCYOhz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724302049; x=1755838049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mQRHcbAlOTespLAeoDlX6YSBAejonbjdaXeoof1VdhA=;
  b=IHWCYOhzAwnJvhZa+OqEvw/qEop4gRCQNZBTHNxg/pcUkmt1WTRacsMr
   0IF0DTohijRp928Iq2yfGVYmc9ing331B2PWlnoDaLxZAKQzTyQo2cJmr
   ToVoZYozM2JvpcYQuGR/HXp+ubi2Ywo1TTFStOsWrhZv6g/CH37xt+QB3
   MRZLZAK0X7D0XC3xLSGWenkGKvaf9TN3O9D5l8pyNYyZlaZVQ7X7RO7VJ
   0KNSl7inDFoL4YKxWF5kmoe5Lianl3GLHItONVIB28m2SqcDi36Z0zwL+
   A/b9NmxgcTNOTqMH1lF35+KkgaQ6zET5ab+SXWz91mVcUJkmIsoVnu5IG
   Q==;
X-CSE-ConnectionGUID: Et1yhRuMQf+UXfENF9cMtg==
X-CSE-MsgGUID: vuzonPghSWyqumXtR+unLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="26490475"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="26490475"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 21:47:29 -0700
X-CSE-ConnectionGUID: vTmC6LVkQhiitb4wsccIgQ==
X-CSE-MsgGUID: PvJBkQTXTMCUedWFGhSopw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="92109828"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Aug 2024 21:47:27 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgzjJ-000COK-1M;
	Thu, 22 Aug 2024 04:47:25 +0000
Date: Thu, 22 Aug 2024 12:47:16 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 11/31]
 drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:527:26: error: 'struct
 akcipher_alg' has no member named 'sign'
Message-ID: <202408221212.12kQou3Z-lkp@intel.com>
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
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240822/202408221212.12kQou3Z-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221212.12kQou3Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221212.12kQou3Z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:527:26: error: 'struct akcipher_alg' has no member named 'sign'
     527 |                         .sign = virtio_crypto_rsa_sign,
         |                          ^~~~
>> drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:527:33: error: initialization of 'int (*)(struct crypto_akcipher *, const void *, unsigned int)' from incompatible pointer type 'int (*)(struct akcipher_request *)' [-Wincompatible-pointer-types]
     527 |                         .sign = virtio_crypto_rsa_sign,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:527:33: note: (near initialization for 'virtio_crypto_akcipher_algs[1].algo.base.set_pub_key')
>> drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:528:26: error: 'struct akcipher_alg' has no member named 'verify'
     528 |                         .verify = virtio_crypto_rsa_verify,
         |                          ^~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:528:35: error: initialization of 'int (*)(struct crypto_akcipher *, const void *, unsigned int)' from incompatible pointer type 'int (*)(struct akcipher_request *)' [-Wincompatible-pointer-types]
     528 |                         .verify = virtio_crypto_rsa_verify,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:528:35: note: (near initialization for 'virtio_crypto_akcipher_algs[1].algo.base.set_priv_key')
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:529:40: warning: initialized field overwritten [-Woverride-init]
     529 |                         .set_pub_key = virtio_crypto_p1pad_rsa_sha1_set_pub_key,
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:529:40: note: (near initialization for 'virtio_crypto_akcipher_algs[1].algo.base.set_pub_key')
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:530:41: warning: initialized field overwritten [-Woverride-init]
     530 |                         .set_priv_key = virtio_crypto_p1pad_rsa_sha1_set_priv_key,
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:530:41: note: (near initialization for 'virtio_crypto_akcipher_algs[1].algo.base.set_priv_key')


vim +527 drivers/crypto/virtio/virtio_crypto_akcipher_algs.c

59ca6c93387d325 zhenwei pi 2022-03-02  496  
59ca6c93387d325 zhenwei pi 2022-03-02  497  static struct virtio_crypto_akcipher_algo virtio_crypto_akcipher_algs[] = {
59ca6c93387d325 zhenwei pi 2022-03-02  498  	{
59ca6c93387d325 zhenwei pi 2022-03-02  499  		.algonum = VIRTIO_CRYPTO_AKCIPHER_RSA,
59ca6c93387d325 zhenwei pi 2022-03-02  500  		.service = VIRTIO_CRYPTO_SERVICE_AKCIPHER,
7a2673d70ca69bb Herbert Xu 2023-08-13  501  		.algo.base = {
59ca6c93387d325 zhenwei pi 2022-03-02  502  			.encrypt = virtio_crypto_rsa_encrypt,
59ca6c93387d325 zhenwei pi 2022-03-02  503  			.decrypt = virtio_crypto_rsa_decrypt,
59ca6c93387d325 zhenwei pi 2022-03-02  504  			.set_pub_key = virtio_crypto_rsa_raw_set_pub_key,
59ca6c93387d325 zhenwei pi 2022-03-02  505  			.set_priv_key = virtio_crypto_rsa_raw_set_priv_key,
59ca6c93387d325 zhenwei pi 2022-03-02  506  			.max_size = virtio_crypto_rsa_max_size,
59ca6c93387d325 zhenwei pi 2022-03-02  507  			.init = virtio_crypto_rsa_init_tfm,
59ca6c93387d325 zhenwei pi 2022-03-02  508  			.exit = virtio_crypto_rsa_exit_tfm,
59ca6c93387d325 zhenwei pi 2022-03-02  509  			.base = {
59ca6c93387d325 zhenwei pi 2022-03-02  510  				.cra_name = "rsa",
59ca6c93387d325 zhenwei pi 2022-03-02  511  				.cra_driver_name = "virtio-crypto-rsa",
59ca6c93387d325 zhenwei pi 2022-03-02  512  				.cra_priority = 150,
59ca6c93387d325 zhenwei pi 2022-03-02  513  				.cra_module = THIS_MODULE,
59ca6c93387d325 zhenwei pi 2022-03-02  514  				.cra_ctxsize = sizeof(struct virtio_crypto_akcipher_ctx),
59ca6c93387d325 zhenwei pi 2022-03-02  515  			},
59ca6c93387d325 zhenwei pi 2022-03-02  516  		},
7a2673d70ca69bb Herbert Xu 2023-08-13  517  		.algo.op = {
7a2673d70ca69bb Herbert Xu 2023-08-13  518  			.do_one_request = virtio_crypto_rsa_do_req,
7a2673d70ca69bb Herbert Xu 2023-08-13  519  		},
59ca6c93387d325 zhenwei pi 2022-03-02  520  	},
59ca6c93387d325 zhenwei pi 2022-03-02  521  	{
59ca6c93387d325 zhenwei pi 2022-03-02  522  		.algonum = VIRTIO_CRYPTO_AKCIPHER_RSA,
59ca6c93387d325 zhenwei pi 2022-03-02  523  		.service = VIRTIO_CRYPTO_SERVICE_AKCIPHER,
7a2673d70ca69bb Herbert Xu 2023-08-13  524  		.algo.base = {
59ca6c93387d325 zhenwei pi 2022-03-02  525  			.encrypt = virtio_crypto_rsa_encrypt,
59ca6c93387d325 zhenwei pi 2022-03-02  526  			.decrypt = virtio_crypto_rsa_decrypt,
59ca6c93387d325 zhenwei pi 2022-03-02 @527  			.sign = virtio_crypto_rsa_sign,
59ca6c93387d325 zhenwei pi 2022-03-02 @528  			.verify = virtio_crypto_rsa_verify,
59ca6c93387d325 zhenwei pi 2022-03-02  529  			.set_pub_key = virtio_crypto_p1pad_rsa_sha1_set_pub_key,
59ca6c93387d325 zhenwei pi 2022-03-02  530  			.set_priv_key = virtio_crypto_p1pad_rsa_sha1_set_priv_key,
59ca6c93387d325 zhenwei pi 2022-03-02  531  			.max_size = virtio_crypto_rsa_max_size,
59ca6c93387d325 zhenwei pi 2022-03-02  532  			.init = virtio_crypto_rsa_init_tfm,
59ca6c93387d325 zhenwei pi 2022-03-02  533  			.exit = virtio_crypto_rsa_exit_tfm,
59ca6c93387d325 zhenwei pi 2022-03-02  534  			.base = {
59ca6c93387d325 zhenwei pi 2022-03-02  535  				.cra_name = "pkcs1pad(rsa,sha1)",
59ca6c93387d325 zhenwei pi 2022-03-02  536  				.cra_driver_name = "virtio-pkcs1-rsa-with-sha1",
59ca6c93387d325 zhenwei pi 2022-03-02  537  				.cra_priority = 150,
59ca6c93387d325 zhenwei pi 2022-03-02  538  				.cra_module = THIS_MODULE,
59ca6c93387d325 zhenwei pi 2022-03-02  539  				.cra_ctxsize = sizeof(struct virtio_crypto_akcipher_ctx),
59ca6c93387d325 zhenwei pi 2022-03-02  540  			},
59ca6c93387d325 zhenwei pi 2022-03-02  541  		},
7a2673d70ca69bb Herbert Xu 2023-08-13  542  		.algo.op = {
7a2673d70ca69bb Herbert Xu 2023-08-13  543  			.do_one_request = virtio_crypto_rsa_do_req,
7a2673d70ca69bb Herbert Xu 2023-08-13  544  		},
59ca6c93387d325 zhenwei pi 2022-03-02  545  	},
59ca6c93387d325 zhenwei pi 2022-03-02  546  };
59ca6c93387d325 zhenwei pi 2022-03-02  547  

:::::: The code at line 527 was first introduced by commit
:::::: 59ca6c93387d325e96577d8bd4c23c78c1491c11 virtio-crypto: implement RSA algorithm

:::::: TO: zhenwei pi <pizhenwei@bytedance.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
