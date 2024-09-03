Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E492218EFFB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 17:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725385887; cv=none; b=J1wPSH5rNnRDd48UQNQ//XBr0h5vu7rcvmxsBxHz84lZV9YUI5uGifxmnnCExagEzLc/n+xX0RQl4mVeShD2DbmWzZyTJiPzb1IDsHyLRwO2gjH8RmlnXxiEy5Tjjc9s0qeXI9tBlPV4C7BqzEII8zFHwcpBP9cPYMA67HyGN4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725385887; c=relaxed/simple;
	bh=4ponBYhk36u8AgleJvTgqpkdIgxYH880xw+rtMWD9vI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y8btzrX3HquilKLLjBBushfOUVVpGNLOkhWnUiznacjk5GNH2J/eeE19qG5KSGUtwFmkiDCCkmqA+OkvWdGM6sHskEGsTaHGF1NdHyq+8IZfN18vcCQ/vAGs32PHIJCFDC8M02AgNKiY4F4CHuE5J5r3VgaLbgyLzaPRh+2tcR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUl5puXi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUl5puXi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725385886; x=1756921886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4ponBYhk36u8AgleJvTgqpkdIgxYH880xw+rtMWD9vI=;
  b=nUl5puXiXIjEqf0XDd0uCnXa7K0E1020ETnqbKkBKu3ZXMTfLR+FcSkX
   DKYNOHHHswPuVYLoM2x5xgJ9Ege6RROib0pNWsSo1ZWb/YHHLvADK88fx
   2BlbrZx9yf8cpsFCPDRS8ITEyAabsIwqIGCogeBcXOUpzt1JGQDW5XGOP
   2TNepNn5JBNy5BCm/rsTtpk7U8t5GXNfMJKF07B4zckrV1cEBDt2qDV0A
   KvoHf/VEHROHSvV5bKNTrT647+Gl8ypAKsZJWMKvXqGc12KXAj7J6Eake
   H9RYEBh3aCyP6xyU2W/WzcKqXRSvM2/umt47CZI/ASF2ju9X8C/aXAtVN
   Q==;
X-CSE-ConnectionGUID: iWiYdhtdQOSGYsePGyDLfw==
X-CSE-MsgGUID: LIxvgP91TYuiR78KsGPNvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34667409"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="34667409"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 10:51:25 -0700
X-CSE-ConnectionGUID: z1cQ7TJzSl6zEBWCLpZgaQ==
X-CSE-MsgGUID: OesMS5yEQ0ac6eXBdmVrHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="95728775"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Sep 2024 10:51:24 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slXgX-0006zO-2q;
	Tue, 03 Sep 2024 17:51:21 +0000
Date: Wed, 4 Sep 2024 01:50:58 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 11/37]
 drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:527:26: error: 'struct
 akcipher_alg' has no member named 'sign'
Message-ID: <202409040157.Ci5yKsyo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   27eea65d04427df4b15eb15929018e14e01dad9a
commit: fb4fa6c7016c308305ead45ead0e80b107092cb9 [11/37] crypto: akcipher - Drop sign/verify operations
config: x86_64-randconfig-102-20240903 (https://download.01.org/0day-ci/archive/20240904/202409040157.Ci5yKsyo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040157.Ci5yKsyo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409040157.Ci5yKsyo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:527:26: error: 'struct akcipher_alg' has no member named 'sign'
     527 |                         .sign = virtio_crypto_rsa_sign,
         |                          ^~~~
>> drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:527:33: error: initialization of 'int (*)(struct crypto_akcipher *, const void *, unsigned int)' from incompatible pointer type 'int (*)(struct akcipher_request *)' [-Werror=incompatible-pointer-types]
     527 |                         .sign = virtio_crypto_rsa_sign,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:527:33: note: (near initialization for 'virtio_crypto_akcipher_algs[1].algo.base.set_pub_key')
>> drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:528:26: error: 'struct akcipher_alg' has no member named 'verify'
     528 |                         .verify = virtio_crypto_rsa_verify,
         |                          ^~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:528:35: error: initialization of 'int (*)(struct crypto_akcipher *, const void *, unsigned int)' from incompatible pointer type 'int (*)(struct akcipher_request *)' [-Werror=incompatible-pointer-types]
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
   cc1: some warnings being treated as errors


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
